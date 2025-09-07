<%@ page import="util.BookingService, tables.Customer, java.sql.Date" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<%
     Customer customer = (Customer) session.getAttribute("loggedInCustomer");
     String customerID = customer.getCustomerID();

    // Retrieve form parameters
    String hotelIDStr = request.getParameter("hotelID");
    String roomNumStr = request.getParameter("roomNum");
    String startDateStr = request.getParameter("startDate");
    String endDateStr = request.getParameter("endDate");

    System.out.println("Customer ID: " + customerID);
        System.out.println("Hotel ID: " + hotelIDStr);
        System.out.println("Room Number: " + roomNumStr);
        System.out.println("Start Date: " + startDateStr);
        System.out.println("End Date: " + endDateStr);

    String message = ""; // Message to show to the user

    if (customerID != null && hotelIDStr != null && roomNumStr != null && startDateStr != null && endDateStr != null) {
        try {
            int hotelID = Integer.parseInt(hotelIDStr);
            int roomNum = Integer.parseInt(roomNumStr);
            Date startDate = Date.valueOf(startDateStr);
            Date endDate = Date.valueOf(endDateStr);

            BookingService bookingService = new BookingService();
            boolean success = bookingService.insertBooking(hotelID, roomNum, customerID, startDate, endDate);

            if (success) {
                message = "Booking successful!";
            } else {
                message = "Booking failed. Please try again.";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    } else {
        message = "Invalid input. Please ensure all fields are filled.";
    }
%>



<script>
    alert("<%= message %>");
    window.history.back();
</script>


