package util;

import tables.Hotel;
import tables.Room;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class RoomService {

    public Map<Room, Hotel> searchRooms(Date startDate, Date endDate, String chainName, String city, Integer starRating, Integer minPrice, Integer maxPrice, Integer capacity, Boolean isExtendable) throws Exception {
        Map<Room, Hotel> roomHotelMap = new HashMap<>();

        String sql = "SELECT r.*, h.* " +
                "FROM Room r " +
                "JOIN Hotel h ON r.hotel_ID = h.hotel_ID " +
                "LEFT JOIN Booking b ON r.hotel_ID = b.hotel_ID AND r.room_num = b.room_num " +
                "LEFT JOIN Renting re ON r.hotel_ID = re.hotel_ID AND r.room_num = re.room_num " +
                "WHERE 1=1 ";

        if (startDate != null && endDate != null) {
            sql += "AND NOT ( " +
                    "    (b.start_date IS NOT NULL AND b.start_date < ? AND b.end_date > ?) " + // Booking overlaps with the requested dates
                    "    OR " +
                    "    (re.start_date IS NOT NULL AND re.start_date < ? AND re.end_date > ?) " + // Renting overlaps with the requested dates
                    ") ";
        }

        if (chainName != null && !chainName.isEmpty()) {
            sql += "AND h.chain_name ILIKE ? ";
        }
        if (city != null && !city.isEmpty()) {
            sql += "AND h.city ILIKE ? ";
        }
        if (starRating != null) {
            sql += "AND h.star_rating = ? ";
        }
        if (minPrice != null) {
            sql += "AND r.price >= ? ";
        }
        if (maxPrice != null) {
            sql += "AND r.price <= ? ";
        }
        if (capacity != null) {
            sql += "AND r.capacity = ? ";
        }
        if (isExtendable != null) {
            sql += "AND r.is_extendable = ? ";
        }

        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            int paramIndex = 1;

            // Bind startDate and endDate first if provided
            if (startDate != null && endDate != null) {
                stmt.setDate(paramIndex++, new java.sql.Date(endDate.getTime())); // Bind startDate
                stmt.setDate(paramIndex++, new java.sql.Date(startDate.getTime()));   // Bind endDate
                stmt.setDate(paramIndex++, new java.sql.Date(endDate.getTime())); // Bind startDate for renting
                stmt.setDate(paramIndex++, new java.sql.Date(startDate.getTime()));   // Bind endDate for renting
            }

            if (chainName != null && !chainName.isEmpty()) {
                stmt.setString(paramIndex++, "%" + chainName + "%");
            }
            if (city != null && !city.isEmpty()) {
                stmt.setString(paramIndex++, "%" + city + "%");
            }
            if (starRating != null) {
                stmt.setInt(paramIndex++, starRating);
            }
            if (minPrice != null) {
                stmt.setInt(paramIndex++, minPrice);
            }
            if (maxPrice != null) {
                stmt.setInt(paramIndex++, maxPrice);
            }
            if (capacity != null) {
                stmt.setInt(paramIndex++, capacity);
            }
            if (isExtendable != null) {
                stmt.setBoolean(paramIndex++, isExtendable);
            }

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Room room = new Room(
                        rs.getInt("hotel_ID"),
                        rs.getInt("room_num"),
                        rs.getDouble("price"),
                        rs.getInt("capacity"),
                        rs.getString("window_view"),
                        rs.getBoolean("is_extendable")
                );

                Hotel hotel = new Hotel(
                        rs.getInt("hotel_ID"),         // Hotel ID
                        rs.getString("street_name"),   // Street Name
                        rs.getInt("street_num"),       // Street Number
                        rs.getString("city"),          // City
                        rs.getInt("star_rating"),      // Star Rating
                        rs.getInt("num_rooms"),        // Number of Rooms
                        rs.getString("manager_SIN"),   // Manager SIN (May be null)
                        rs.getString("chain_name")     // Chain Name
                );

                roomHotelMap.put(room, hotel);
            }
        } catch (Exception e) {
            throw new Exception("Error fetching room and hotel details: " + e.getMessage());
        }

        return roomHotelMap;
    }

    // Gets rooms for hotel with a given hotelID, filtered by the other arguments
    public List<Room> getRoomsByHotel(Integer hotelID, Integer minPrice, Integer maxPrice, Integer capacity, String windowView, Boolean isExtendable) throws Exception {

        // sql query
        String sql = "SELECT * FROM Room WHERE hotel_id = ?";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all grades retrieved from database
        List<Room> rooms = new ArrayList<>();

        // Dynamically construct the where clause based on the filters given
        List<Object> filters = new ArrayList<>();
        filters.add(hotelID);

        if (minPrice != null) {
            sql += " AND price >= ?";
            filters.add(minPrice);
        }
        if (maxPrice != null) {
            sql += " AND price <= ?";
            filters.add(maxPrice);
        }
        if (capacity != null) {
            sql += " AND capacity = ?";
            filters.add(capacity);
        }
        if (windowView != null) {
            sql += " AND window_view LIKE ?";
            filters.add("%" + windowView + "%");
        }
        if (isExtendable != null) {
            sql += " AND is_extendable = ?";
            filters.add(isExtendable);
        }

        // try to connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);

            // Going through the list of args, adding each to the SQL statement
            for (int i = 0; i < filters.size(); i++) {
                stmt.setObject(i + 1, filters.get(i)); // i + 1 because the indexing for the ? starts at 1, not 0
            }

            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {
                Room room = new Room(
                        rs.getInt("hotel_id"),
                        rs.getInt("room_num"),
                        rs.getDouble("price"),
                        rs.getInt("capacity"),
                        rs.getString("window_view"),
                        rs.getBoolean("is_extendable")
                );
                rooms.add(room);
            }

            //close the result set
            rs.close();
            // close the statement
            stmt.close();
            con.close();
            db.close();

            // return the hotels retrieved from database
            return rooms;

        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }

    // Returns the room with the given attributes
    public Room getRoom(int hotelID, int roomNum) throws Exception {

        // sql query
        String sql = "SELECT * FROM Room WHERE hotel_id = ? AND room_num = ?";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        Room room = null;

        // try to connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // setting the values of ? in the SQL query
            stmt.setInt(1, hotelID);
            stmt.setInt(2, roomNum);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                room = new Room(
                        rs.getInt("hotel_id"),
                        rs.getInt("room_num"),
                        rs.getDouble("price"),
                        rs.getInt("capacity"),
                        rs.getString("window_view"),
                        rs.getBoolean("is_extendable")
                );
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            // return the room retrieved from database
            return room;

        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }
}

