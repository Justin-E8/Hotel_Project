package util;

import tables.Renting;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RentingService {

    public boolean insertRenting(int hotelID, int roomNum , String customerID, Date startDate, Date endDate, String checkInEmpSIN) throws Exception {

        String sql = "INSERT INTO Renting (hotel_ID, room_num,customer_id, start_date, end_date, check_in_emp_SIN) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

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
            stmt.setString(6, checkInEmpSIN);

            int rowsAffected = stmt.executeUpdate();

            // Check if the insertion was successful (rowsAffected > 0 means successful insertion)
            if (rowsAffected > 0) {
                isInserted = true;
            }

            stmt.close();

        } catch (Exception e) {
            // Handle SQL exceptions
            System.out.println("Error inserting renting: " + e.getMessage());
            throw new Exception(e.getMessage());
        }
        return isInserted;
    }
    public List<Map<String, Object>> getRentings(String customerID) throws Exception {
        List<Map<String, Object>> rentings = new ArrayList<>();

        ConnectionDB db = new ConnectionDB();

        String sql = "SELECT r.room_num, re.start_date, re.end_date, re.chain_name, r.capacity, r.price, h.city, h.street_name, h.street_num, h.hotel_ID "+
                "FROM Renting re " +
                "JOIN Room r ON b.hotel_ID = r.hotel_ID AND b.room_num = r.room_num " +
                "JOIN Hotel h ON r.hotel_ID = h.hotel_ID " +
                "WHERE b.customer_ID = ?";

        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, customerID);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Map<String, Object> rentingDetails = new HashMap<>();

                rentingDetails.put("room_num", rs.getInt("room_num"));
                rentingDetails.put("start_date", rs.getDate("start_date"));
                rentingDetails.put("end_date", rs.getDate("end_date"));
                rentingDetails.put("chain_name", rs.getString("chain_name"));
                rentingDetails.put("capacity", rs.getInt("capacity"));
                rentingDetails.put("price", rs.getDouble("price"));
                rentingDetails.put("city", rs.getString("city"));
                rentingDetails.put("street_name", rs.getString("street_name"));
                rentingDetails.put("street_num", rs.getInt("street_num"));
                rentingDetails.put("hotel_ID", rs.getInt("hotel_ID"));
                rentings.add(rentingDetails);
            }

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }

        return rentings;
    }

    public boolean deleteRenting(int hotelID, int roomNum, String customerID, Date startDate) throws Exception {
        ConnectionDB db = new ConnectionDB();

        String sql = "DELETE FROM Renting WHERE customer_ID = ? AND hotel_ID = ? AND room_num = ? AND start_date = ?";
        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, customerID);
            stmt.setInt(2, hotelID);
            stmt.setInt(3, roomNum);
            stmt.setDate(4, startDate);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            throw new Exception("Error deleting renting: " + e.getMessage(), e);
        }
    }

    public List<Renting> getRentingsForRoom(int hotelID, int roomNum) {

        List<Renting> rentings = new ArrayList<>();

        // sql query
        String sql = "SELECT * FROM Renting WHERE hotel_id = ? AND room_num = ?";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try to connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            // The number 1 says that the ? is being set to the string value of
            // roomNum, including the single quotes '' needed in SQL
            stmt.setInt(1, hotelID);
            stmt.setInt(2, roomNum);

            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {
                Renting renting = new Renting(
                        rs.getInt("hotel_id"),
                        rs.getInt("room_num"),
                        rs.getString("customer_id"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date"),
                        rs.getString("check_in_emp_SIN")
                );
                rentings.add(renting);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            // return the rentings retrieved from database
            return rentings;

        } catch (Exception e) {
            System.out.println("Error retrieving rentings.");
        }

        return null;
    }

}

