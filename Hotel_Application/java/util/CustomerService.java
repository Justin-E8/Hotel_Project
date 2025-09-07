package util;

import tables.Customer;
import tables.Employee;
import tables.Hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {

    public List<Customer> getCustomers() throws Exception {

        String sql = "SELECT * FROM Customer";

        ConnectionDB db = new ConnectionDB();

        List<Customer> customers = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                Customer customer = new Customer(
                        rs.getString("customer_ID"),
                        rs.getDate("date_registered"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("street_name"),
                        rs.getInt("street_num"),
                        rs.getString("city")
                );
                customers.add(customer);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return customers;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public Customer getCustomer(String customerID, String firstName, String lastName) throws Exception {

        String sql = "SELECT * FROM Customer WHERE customer_ID = ? AND first_name = ? AND last_name = ?";

        ConnectionDB db = new ConnectionDB();

        Customer customer = null;

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, customerID);
            stmt.setString(2, firstName);
            stmt.setString(3, lastName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                System.out.println("SOMETHING FOUND!!!");

                customer = new Customer(
                        rs.getString("customer_ID"),
                        rs.getDate("date_registered"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("street_name"),
                        rs.getInt("street_num"),
                        rs.getString("city")
                );
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return customer;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public boolean insertCustomer(String customerId, String firstName, String lastName, String streetName, int streetNum, String city) throws Exception {

        String sql = "INSERT INTO Customer (customer_ID, date_registered, first_name, last_name, street_name, street_num, city) " +
                "VALUES (?, CURRENT_DATE,?, ?, ?, ?, ?)";

        ConnectionDB db = new ConnectionDB();

        boolean isInserted = false;

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setString(1, customerId);
            stmt.setString(2, firstName);
            stmt.setString(3, lastName);
            stmt.setString(4, streetName);
            stmt.setInt(5, streetNum);
            stmt.setString(6, city);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                isInserted = true;
            }
            stmt.close();

        } catch (Exception e) {
            System.out.println("Error inserting customer: " + e.getMessage());
            throw new Exception(e.getMessage());
        }
        return isInserted;
    }
    public boolean updateCustomer(String customerID, String firstName, String lastName, String streetName, int streetNum, String city) throws Exception {

        String sql = "UPDATE Customer SET first_name = ?, last_name = ?, street_name = ?, street_num = ?, city = ? WHERE customer_id = ?" ;

        ConnectionDB db = new ConnectionDB();

        boolean isInserted = false;

        try (Connection con = db.getConnection()) {

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, streetName);
            stmt.setInt(4, streetNum);
            stmt.setString(5, city);
            stmt.setString(6, customerID);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                isInserted = true;
            }
            stmt.close();

        } catch (Exception e) {
            System.out.println("Error updating customer: " + e.getMessage());
            throw new Exception(e.getMessage());
        }
        return isInserted;
    }

}




