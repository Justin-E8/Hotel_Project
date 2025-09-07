<%@ page import="util.ChainService, util.HotelService, util.RoomService, tables.Room, tables.Employee, tables.Hotel, tables.Chain, java.util.List, java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Room Search</title>
    <link rel="stylesheet" type="text/css" href="employee_room_search.css">
</head>
<body>
    <h1>Search for Available Rooms</h1>

    <div class="hotel-summary">
        <h2 class = "summary-heading">Hotel Summary</h2>
        <%
            Employee employee = (Employee) session.getAttribute("loggedInEmployee");

            HotelService hotelService = new HotelService();
            ChainService chainService = new ChainService();
            Hotel hotel = null;
            Chain chain = null;

            try {
                hotel = hotelService.getHotel(employee.getHotelID());
                chain = chainService.getChain(hotel.getChainName());
            } catch (Exception e){
                e.printStackTrace();
            }
        %>

        <p><strong>Chain:</strong> <%= chain.getChainName() %></p>
        <p><strong>Hotel ID:</strong> <%= hotel.getHotelID() %></p>
        <p><strong>Address:</strong> <%= hotel.getStreetNum() %> <%= hotel.getStreetName() %>, <%= hotel.getCity() %></p>
        <p><strong>Star rating:</strong> <%= hotel.getStarRating() %></p>
        <p><strong>Number of Rooms:</strong> <%= hotel.getNumRooms() %></p>
    </div>

    <form action="employee_room_search.jsp" method="GET">
        <label for="windowView">Window View:</label>
        <input type="text" name="windowView" id="windowView">

        <label for="minPrice">Min Price:</label>
        <input type="number" name="minPrice" id="minPrice">

        <label for="maxPrice">Max Price:</label>
        <input type="number" name="maxPrice" id="maxPrice">

        <label for="capacity">Capacity:</label>
        <input type="number" name="capacity" id="capacity">

        <label for="isExtendable">Extendable:</label>
        <select name="isExtendable">
            <option value="">Any</option>
            <option value="true">Yes</option>
            <option value="false">No</option>
        </select>

        <button type="submit" class="btn">Search</button>
    </form>

    <%
        // Retrieve search parameters
        Integer minPrice = request.getParameter("minPrice") != null && !request.getParameter("minPrice").isEmpty()
                ? Integer.parseInt(request.getParameter("minPrice"))
                : null;

        Integer maxPrice = request.getParameter("maxPrice") != null && !request.getParameter("maxPrice").isEmpty()
                ? Integer.parseInt(request.getParameter("maxPrice"))
                : null;

        Integer capacity = request.getParameter("capacity") != null && !request.getParameter("capacity").isEmpty()
                ? Integer.parseInt(request.getParameter("capacity"))
                : null;

        String windowView = request.getParameter("windowView");

        Boolean isExtendable = request.getParameter("isExtendable") != null && !request.getParameter("isExtendable").isEmpty()
                ? Boolean.parseBoolean(request.getParameter("isExtendable"))
                : null;

        // Call RoomService to fetch rooms based on filters
        RoomService roomService = new RoomService();
        List<Room> rooms = roomService.getRoomsByHotel(hotel.getHotelID(), minPrice, maxPrice, capacity, windowView, isExtendable);
    %>

    <h2>Search Results</h2>

    <% if (rooms.isEmpty()) { %>
        <p>No rooms found matching your criteria.</p>
    <% } else { %>
        <div class="room-results">
            <% for (Room room : rooms) {
                // Display info for each room in rooms
            %>
                <div class="room-card">
                    <h3>Room Number: <%= room.getRoomNum() %></h3>
                    <p><strong>Price:</strong> $<%= room.getPrice() %></p>
                    <p><strong>Capacity:</strong> <%= room.getCapacity() %> people</p>
                    <p><strong>Window View:</strong> <%= room.getWindowView() %></p>
                    <p><strong>Extendable:</strong> <%= room.isExtendable() ? "Yes" : "No" %></p>
                    <a href="room_availability.jsp?hotelID=<%= room.getHotelID() %>&roomNum=<%= room.getRoomNum() %>" class="btn">Check Availability</a>
                </div>
            <% } %>
        </div>
    <% } %>
</div>
</body>
</html>
