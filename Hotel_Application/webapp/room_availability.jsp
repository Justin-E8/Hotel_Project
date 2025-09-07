<%@ page import="util.RoomService, util.BookingService, util.RentingService, tables.Room, tables.Booking, tables.Renting" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Availability</title>
    <link rel="stylesheet" type="text/css" href="room_availability.css">
</head>
<body>
    <h1>Room Availability</h1>

    <%
        int hotelID = Integer.parseInt(request.getParameter("hotelID"));
        int roomNum = Integer.parseInt(request.getParameter("roomNum"));

        RoomService roomService = new RoomService();
        Room room = roomService.getRoom(hotelID, roomNum);

        BookingService bookingService = new BookingService();
        RentingService rentingService = new RentingService();
        List<Booking> bookings = bookingService.getBookingsForRoom(hotelID, roomNum);
        List<Renting> rentings = rentingService.getRentingsForRoom(hotelID, roomNum);
    %>

    <div class="room-details">
        <h2>Room Number: <%= room.getRoomNum() %></h2>
        <p><strong>Price:</strong> $<%= room.getPrice() %></p>
        <p><strong>Capacity:</strong> <%= room.getCapacity() %> people</p>
        <p><strong>Window View:</strong> <%= room.getWindowView() %></p>
        <p><strong>Extendable:</strong> <%= room.isExtendable() ? "Yes" : "No" %></p>
    </div>

    <h3>Bookings</h3>
    <% if (bookings == null || bookings.isEmpty()) { %>
        <p>No bookings currently for this room.</p>
    <% } else { %>
        <table>
            <thead>
                <tr>
                    <th>Room number</th>
                    <th>Customer ID</th>
                    <th>Date Booking Made</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking booking : bookings) { %>



                    <tr>
                        <td><%= booking.getRoomNum() %></td>
                        <td><%= booking.getCustomerID() %></td>
                        <td><%= booking.getDateBookingMade() %></td>
                        <td><%= booking.getStartDate() %></td>
                        <td><%= booking.getEndDate() %></td>
                        <td>
                            <form action="process_activate_booking.jsp" method="post">
                                <input type="hidden" name="hotelID" value="<%= hotelID %>">
                                <input type="hidden" name="roomNum" value="<%= booking.getRoomNum() %>">
                                <input type="hidden" name="customerID" value="<%= booking.getCustomerID() %>">
                                <input type="hidden" name="startDate" value="<%= booking.getStartDate() %>">
                                <input type="hidden" name="endDate" value="<%= booking.getEndDate() %>">
                                <input type="hidden" name="dateBookingMade" value="<%= booking.getDateBookingMade() %>">
                                <button type="submit" class="activate-btn">Activate</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>

    <h3>Rentings</h3>
    <% if (rentings == null || rentings.isEmpty()) { %>
        <p>No rentings currently for this room.</p>
    <% } else { %>
        <table>
            <thead>
                <tr>
                    <th>Room Number</th>
                    <th>Customer ID</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (Renting renting : rentings) { %>
                    <tr>
                        <td><%= renting.getRoomNum() %></td>
                        <td><%= renting.getCustomerID() %></td>
                        <td><%= renting.getStartDate() %></td>
                        <td><%= renting.getEndDate() %></td>
                        <td>
                            <form action="process_delete_renting.jsp" method="post">
                                <input type="hidden" name="hotelID" value="<%= hotelID %>">
                                <input type="hidden" name="roomNum" value="<%= renting.getRoomNum() %>">
                                <input type="hidden" name="customerID" value="<%= renting.getCustomerID() %>">
                                <input type="hidden" name="startDate" value="<%= renting.getStartDate() %>">
                                <input type="hidden" name="endDate" value="<%= renting.getEndDate() %>">
                                <button type="submit" class="delete-btn">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>

    <a href="employee_room_search.jsp" class="btn">Back to Viewing Rooms</a>

</body>
</html>
