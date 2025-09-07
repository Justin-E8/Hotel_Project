package util;

import tables.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService {

    // Fetches all Employees from the database, returning them as a java list
    public List<Employee> getEmployees() throws Exception {

        // SQL query
        String sql = "SELECT * FROM Employee";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        // List to store the Employees
        List<Employee> employees = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            // iterate through the result set
            while (rs.next()) {

                // Instantiating a new Employee object with the attributes found in each tuple in the Employee table of the DB
                Employee employee = new Employee(
                        rs.getString("SIN"),
                        rs.getString("job_title"),
                        rs.getDate("date_hired"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("street_name"),
                        rs.getInt("street_num"),
                        rs.getString("city"),
                        rs.getInt("hotel_ID")
                );
                employees.add(employee);
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return employees;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    // Fetches only the Employee specified by their employeeID
    public Employee getEmployee(String SIN, String firstName, String lastName) throws Exception {

        // SQL query with ? as placeholders, to be replaced by PreparedStatement
        String sql = "SELECT * FROM Employee WHERE SIN = ? AND first_name = ? AND last_name = ?";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        Employee employee = null;

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            // The number 1-3 says that the nth occurrence of ? is being set to the string value of
            // SIN, including the single quotes '' needed in SQL
            stmt.setString(1,SIN);
            stmt.setString(2, firstName);
            stmt.setString(3, lastName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) { // If rs.next() returns true, then the query must have found the employee that is being searched

                // Instantiating a new Employee object with this specific employee's attributes
                employee = new Employee(rs.getString("SIN"),
                    rs.getString("job_title"),
                    rs.getDate("date_hired"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getString("street_name"),
                    rs.getInt("street_num"),
                    rs.getString("city"),
                    rs.getInt("hotel_ID")
                );
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return employee; // returns employee object if the if statement ran, but if not, returns null

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    // updates the credentials of the Employee specified by their employeeID
    public void updateEmployee(Employee employee, String newFirstName, String newLastName, String newStreetName, int newStreetNum, String newCity) throws Exception {


        // SQL query with ? as placeholders, to be replaced by PreparedStatement
        String sql = "UPDATE Employee SET first_name = ?, last_name = ?, street_name = ?, street_num = ?, city = ? WHERE SIN = ?";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            // The number 1-3 says that the nth occurrence of ? is being set to the string value of
            stmt.setString(1,newFirstName);
            stmt.setString(2, newLastName);
            stmt.setString(3, newStreetName);
            stmt.setInt(4, newStreetNum);
            stmt.setString(5, newCity);
            stmt.setString(6, employee.getSIN());

            // Execute the update
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("Employee updated successfully");
            } else {
                System.out.println("No employee was updated. Check if SIN exists.");
            }

            stmt.close();
            con.close();
            db.close();


        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }


}