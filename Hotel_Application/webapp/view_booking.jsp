<%@ page import="tables.Customer, util.BookingService, tables.Customer, java.util.List, java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Bookings</title>
    <link rel="stylesheet" type="text/css" href="view_booking.css">
</head>
<%
    Customer customer = (Customer) session.getAttribute("loggedInCustomer");
    String customerID = customer.getCustomerID();

    BookingService bookingService = new BookingService();
    List<Map<String, Object>> bookings = bookingService.getBookings(customerID);

    if (bookings != null && !bookings.isEmpty()) { %>
        <% for (Map<String, Object> booking : bookings) { %>
            <div class="booking-card">
                <div class="booking-details">
                    <p><strong>Room Number:</strong> <%= booking.get("room_num") %></p>
                    <p><strong>Start Date:</strong> <%= booking.get("start_date") %></p>
                    <p><strong>End Date:</strong> <%= booking.get("end_date") %></p>
                    <p><strong>Hotel Chain:</strong> <%= booking.get("chain_name") %></p>
                    <p><strong>Capacity:</strong> <%= booking.get("capacity") %> people</p>
                    <p><strong>Price:</strong> $<%= booking.get("price") %></p>
                    <p><strong>Location:</strong>
                    <%= booking.get("street_num") != null ? booking.get("street_num") : "" %>,
                    <%= booking.get("street_name") != null ? booking.get("street_name") : "" %>,
                    <%= booking.get("city") != null ? booking.get("city") : "" %>
                    </p>
                    <form action="process_delete_booking.jsp" method="post">
                        <input type="hidden" name="customerID" value="<%= customerID %>" />
                        <input type="hidden" name="hotelID" value="<%= booking.get("hotel_id") %>" />
                        <input type="hidden" name="roomNum" value="<%= booking.get("room_num") %>" />
                        <button type="submit" class="delete-button">Delete Booking</button>
                    </form>
                </div>
            </div>
        <% } %>
    <% } else { %>
        <p>No bookings found for this customer.</p>
    <% } %>
</div>