package util;

import tables.Hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelService {

    public List<Hotel> getHotels() throws Exception {

        // sql query
        String sql = "SELECT * FROM hotel";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // data structure to keep all grades retrieved from database
        List<Hotel> hotels = new ArrayList<>();

        // try to connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();


            // iterate through the result set
            while (rs.next()) {
                Hotel hotel = new Hotel(
                        rs.getInt("hotel_id"),       // hotelID (int)
                        rs.getString("street_name"),  // streetName (String)
                        rs.getInt("street_num"),      // streetNum (int)
                        rs.getString("city"),         // city (String)
                        rs.getInt("star_rating"),     // starRating (int)
                        rs.getInt("num_rooms"),       // numRooms (int)
                        rs.getString("manager_SIN"),  // managerSIN (String)
                        rs.getString("chain_name")    // chainName (String)
                );
                hotels.add(hotel);
            }

            //close the result set
            rs.close();
            // close the statement
            stmt.close();
            con.close();
            db.close();

            // return the hotels retrieved from database
            return hotels;

        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }

    // Returns the hotel with the given attributes
    public Hotel getHotel(int hotelID) throws Exception {

        // sql query
        String sql = "SELECT * FROM hotel WHERE hotel_id = ?";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        Hotel hotel = null;

        // try to connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // The number 1 says that the ? is being set to the string value of
            // hotelID, including the single quotes '' needed in SQL
            stmt.setInt(1, hotelID);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                hotel = new Hotel(
                    rs.getInt("hotel_id"),       // hotelID (int)
                    rs.getString("street_name"),  // streetName (String)
                    rs.getInt("street_num"),      // streetNum (int)
                    rs.getString("city"),         // city (String)
                    rs.getInt("star_rating"),     // starRating (int)
                    rs.getInt("num_rooms"),       // numRooms (int)
                    rs.getString("manager_SIN"),  // managerSIN (String)
                    rs.getString("chain_name")    // chainName (String)
                );
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            // return the hotel retrieved from database
            return hotel;

        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }
}
