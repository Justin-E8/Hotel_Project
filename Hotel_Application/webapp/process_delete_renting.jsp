// Note that the renting is not fully deleted, it is simply archived, ie moved to Renting_Archive table in the DB

<%@ page import="java.sql.*, util.RentingService, tables.Renting" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    int hotelID = Integer.parseInt(request.getParameter("hotelID"));
    int roomNum = Integer.parseInt(request.getParameter("roomNum"));
    String customerID = request.getParameter("customerID");
    Date startDate = Date.valueOf(request.getParameter("startDate"));

    // Initialize RentingService
    RentingService rentingService = new RentingService();

    try {

        if (rentingService.deleteRenting(hotelID, roomNum, customerID, startDate)) {
            System.out.println("Renting deleted");
        } else {
            System.out.println("Problem occured; renting not deleted");
        }

        // Redirect back to room availability page
        response.sendRedirect("room_availability.jsp?hotelID=" + hotelID + "&roomNum=" + roomNum);


    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
