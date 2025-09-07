<%@ page import="util.CustomerService" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%

    String customerID = request.getParameter("customerID");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String streetName = request.getParameter("streetName");
    String streetNumStr = request.getParameter("streetNum");
    String city = request.getParameter("city");

    boolean registrationSuccess = false;
    String message = "";

    try {
        int streetNum = Integer.parseInt(streetNumStr);
        CustomerService customerService = new CustomerService();
        registrationSuccess = customerService.insertCustomer(customerID, firstName, lastName, streetName, streetNum, city);

        if (registrationSuccess) {
            message = "Customer registration successful! Please log in.";
        } else {
            message = "Registration failed. Please try again.";
        }
    } catch (Exception e) {
        message = "Error during registration: " + e.getMessage();
    }
%>

<script>
    alert("<%= message %>");
    window.history.back();
</script>