package util;

import java.sql.Connection;
import java.sql.Date;
import tables.Booking;
import tables.Hotel;
import tables.Room;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class BookingService {

    public boolean insertBooking(int hotelID, int roomNum , String customerID, Date startDate, Date endDate) throws Exception {

        String sql = "INSERT INTO Booking (hotel_ID, room_num,customer_id, start_date, end_date, date_booking_made) " +
                "VALUES (?,?, ?, ?, ?, CURRENT_DATE)";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        boolean isInserted = false;

        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);

            // Set the placeholders (?)
            stmt.setInt(1, hotelID);
            stmt.setInt(2, roomNum);
            stmt.setString(3, customerID);
            stmt.setDate(4, startDate);
            stmt.setDate(5, endDate);

            int rowsAffected = stmt.executeUpdate();

            // Check if the insertion was successful (rowsAffected > 0 means successful insertion)
            if (rowsAffected > 0) {
                isInserted = true;
            }

            stmt.close();

        } catch (Exception e) {
            // Handle SQL exceptions
            System.out.println("Error inserting booking: " + e.getMessage());
            throw new Exception(e.getMessage());
        }
        return isInserted;
    }

    public List<Map<String, Object>> getBookings(String customerID) throws Exception {
        List<Map<String, Object>> bookings = new ArrayList<>();

        ConnectionDB db = new ConnectionDB();

        String sql = "SELECT r.room_num, b.start_date, b.end_date, h.chain_name, r.capacity, r.price, h.city, h.street_name, h.street_num, h.hotel_ID "+
                "FROM Booking b " +
                "JOIN Room r ON b.hotel_ID = r.hotel_ID AND b.room_num = r.room_num " +
                "JOIN Hotel h ON r.hotel_ID = h.hotel_ID " +
                "WHERE b.customer_ID = ?";

        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, customerID);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Map<String, Object> bookingDetails = new HashMap<>();

                bookingDetails.put("room_num", rs.getInt("room_num"));
                bookingDetails.put("start_date", rs.getDate("start_date"));
                bookingDetails.put("end_date", rs.getDate("end_date"));
                bookingDetails.put("chain_name", rs.getString("chain_name"));
                bookingDetails.put("capacity", rs.getInt("capacity"));
                bookingDetails.put("price", rs.getDouble("price"));
                bookingDetails.put("city", rs.getString("city"));
                bookingDetails.put("street_name", rs.getString("street_name"));
                bookingDetails.put("street_num", rs.getInt("street_num"));
                bookingDetails.put("hotel_ID", rs.getInt("hotel_ID"));
                bookings.add(bookingDetails);
            }

        } catch (Exception e) {
            throw new Exception("Error fetching bookings for customer: " + e.getMessage());
        }

        return bookings;
    }

    public boolean deleteBooking(String customerID, int hotelID, int roomNum) throws Exception {
        ConnectionDB db = new ConnectionDB();

        String sql = "DELETE FROM booking WHERE customer_ID = ? AND hotel_ID = ? AND room_num = ?";
        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, customerID);
            stmt.setInt(2, hotelID);
            stmt.setInt(3, roomNum);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            throw new Exception("Error deleting booking: " + e.getMessage(), e);
        }
    }

    public List<Booking> getBookingsForRoom(int hotelID, int roomNum) {

        List<Booking> bookings = new ArrayList<>();

        // sql query
        String sql = "SELECT * FROM Booking WHERE hotel_ID = ? AND room_num = ?";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try to connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // The number 1 says that the ? is being set to the string value of
            // roomNum, including the single quotes '' needed in SQL
            stmt.setInt(1, hotelID);
            stmt.setInt(2, roomNum);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getInt("hotel_id"),
                    rs.getInt("room_num"),
                    rs.getString("customer_id"),
                    rs.getDate("start_date"),
                    rs.getDate("end_date"),
                    rs.getDate("date_booking_made")
                );
                bookings.add(booking);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            // return the bookings retrieved from database
            return bookings;

        } catch (Exception e) {
            System.out.println("Error retrieving bookings: " + e.getMessage());
        }

        System.out.println("No bookings found");
        return null;
    }

}

