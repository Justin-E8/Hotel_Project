<%@ page import="java.sql.*, util.BookingService" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

    String customerID = request.getParameter("customerID");
    int hotelID = Integer.parseInt(request.getParameter("hotelID"));
    int roomNum = Integer.parseInt(request.getParameter("roomNum"));

    // Initialize BookingService
    BookingService bookingService = new BookingService();

    try {
        boolean deleted = bookingService.deleteBooking(customerID, hotelID, roomNum);

        if (deleted) {
            response.sendRedirect("view_booking.jsp");
        } else {
            out.println("<p>Failed to delete the booking. Please try again.</p>");
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
