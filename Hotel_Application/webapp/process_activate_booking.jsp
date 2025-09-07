// The naming is slightly confusing:
// "activate booking" means renting has begun (ie customer just arrived, checked in)
// Therefore we must insert a new renting corresponding to this booking
// Which then (via trigger rent_in_effect) causes that booking to be deleted
// Which then (via trigger archive_booking) causes a corresponding archive_booking tuple to be inserted
// So basically, all we have to do here is insert a renting, and the booking should be deleted (archived) automatically

<%@ page import="java.sql.*, util.RentingService, tables.Renting, tables.Employee" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    int hotelID = Integer.parseInt(request.getParameter("hotelID"));
    int roomNum = Integer.parseInt(request.getParameter("roomNum"));
    String customerID = request.getParameter("customerID");
    Date startDate = Date.valueOf(request.getParameter("startDate"));
    Date endDate = Date.valueOf(request.getParameter("endDate"));
    Date dateBookingMade = Date.valueOf(request.getParameter("dateBookingMade"));

    Employee employee = (Employee) session.getAttribute("loggedInEmployee");
    Renting newRenting = null;

    // Initialize RentingService
    RentingService rentingService = new RentingService();

    try {
        newRenting = new Renting(hotelID, roomNum, customerID, startDate, endDate, employee.getSIN());

        if (rentingService.insertRenting(hotelID, roomNum, customerID, startDate, endDate, employee.getSIN())) {
            System.out.println("Renting inserted");
        } else {
            System.out.println("Renting not inserted");
        }

    // Redirect back to room availability page
    response.sendRedirect("room_availability.jsp?hotelID=" + hotelID + "&roomNum=" + roomNum);


    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
