<%@ page import="util.CustomerService, tables.Customer" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Retrieve form parameters
    String customerID = request.getParameter("customerID");
    String dateRegisteredStr = request.getParameter("dateRegistered");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String streetName = request.getParameter("streetName");
    String streetNumStr = request.getParameter("streetNum");
    String city = request.getParameter("city");

    java.sql.Date dateRegistered = java.sql.Date.valueOf(dateRegisteredStr);
    String message = "";
    try {
        int streetNum = Integer.parseInt(streetNumStr);

        CustomerService customerService = new CustomerService();
        boolean success = customerService.updateCustomer(customerID, firstName, lastName, streetName, streetNum, city);

        if (!success) {
            throw new Exception("Profile update failed.");
        }
        message = "Profile updated successfully";

        Customer updatedCustomer = new Customer(customerID, dateRegistered, firstName, lastName, streetName, streetNum, city);
        session.setAttribute("loggedInCustomer", updatedCustomer);

    } catch (NumberFormatException e) {
        message = "Invalid street number";
    } catch (Exception e) {
        message = "Error updating profile";
    }

%>

<script>
    alert("<%= message %>");
    window.history.back();
</script>
