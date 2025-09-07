<%@ page import="util.RoomService, tables.Room, tables.Hotel, java.util.List, java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Search</title>
    <link rel="stylesheet" type="text/css" href="room_search.css">
</head>
<body>
    <div class="container">
        <h1>Search for Available Rooms</h1>

        <form action="room_search.jsp" method="GET">
            <label for="chainName">Hotel Chain:</label>
            <input type="text" name="chainName" id="chainName">

            <label for="city">City:</label>
            <input type="text" name="city" id="city">

            <label for="starRating">Star Rating:</label>
            <input type="number" name="starRating" id="starRating" min="1" max="5">

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

            <label for="startDate">Start Date:</label>
            <input type="date" name="startDate" id="startDate">

            <label for="endDate">End Date:</label>
            <input type="date" name="endDate" id="endDate">

            <button type="submit" class="btn">Search</button>
        </form>

        <%
            // Retrieve search parameters
            String chainName = request.getParameter("chainName");
            String city = request.getParameter("city");

            Integer starRating = request.getParameter("starRating") != null && !request.getParameter("starRating").isEmpty()
                    ? Integer.parseInt(request.getParameter("starRating"))
                    : null;

            Integer minPrice = request.getParameter("minPrice") != null && !request.getParameter("minPrice").isEmpty()
                    ? Integer.parseInt(request.getParameter("minPrice"))
                    : null;

            Integer maxPrice = request.getParameter("maxPrice") != null && !request.getParameter("maxPrice").isEmpty()
                    ? Integer.parseInt(request.getParameter("maxPrice"))
                    : null;

            Integer capacity = request.getParameter("capacity") != null && !request.getParameter("capacity").isEmpty()
                    ? Integer.parseInt(request.getParameter("capacity"))
                    : null;

            Boolean isExtendable = request.getParameter("isExtendable") != null && !request.getParameter("isExtendable").isEmpty()
                    ? Boolean.parseBoolean(request.getParameter("isExtendable"))
                    : null;

            java.sql.Date startDate = request.getParameter("startDate") != null && !request.getParameter("startDate").isEmpty()
                    ? java.sql.Date.valueOf(request.getParameter("startDate"))
                    : null;

            java.sql.Date endDate = request.getParameter("endDate") != null && !request.getParameter("endDate").isEmpty()
                    ? java.sql.Date.valueOf(request.getParameter("endDate"))
                    : null;

            // Call RoomService to fetch rooms based on filters
            RoomService roomService = new RoomService();
            Map<Room, Hotel> roomHotelMap = roomService.searchRooms(startDate, endDate, chainName, city, starRating, minPrice, maxPrice, capacity, isExtendable);
        %>

        <h2>Search Results</h2>

        <% if (roomHotelMap.isEmpty()) { %>
            <p>No rooms found matching your criteria.</p>
        <% } else { %>
            <div class="room-results">
                <%
                String startDateString = startDate != null ? startDate.toString() : "Not specified";
                String endDateString = endDate != null ? endDate.toString() : "Not specified";


                for (Map.Entry<Room, Hotel> entry : roomHotelMap.entrySet()) {
                    Room room = entry.getKey();
                    Hotel hotel = entry.getValue();
                %>
                    <div class="room-card">
                        <h3>Hotel: <%= hotel.getChainName() %> - <%= hotel.getCity() %></h3>
                        <p><strong>Address:</strong> <%= hotel.getStreetName() %>, <%= hotel.getStreetNum() %></p>
                        <p><strong>Star Rating:</strong> <%= hotel.getStarRating() %> ⭐</p>
                        <p><strong>Room Number:</strong> <%= room.getRoomNum() %></p>
                        <p><strong>Price:</strong> $<%= room.getPrice() %></p>
                        <p><strong>Capacity:</strong> <%= room.getCapacity() %> people</p>
                        <p><strong>Window View:</strong> <%= room.getWindowView() %></p>
                        <p><strong>Extendable:</strong> <%= room.isExtendable() ? "Yes" : "No" %></p>
                        <p><strong>Start Date:</strong> <%= startDateString %></p>
                        <p><strong>End Date:</strong> <%= endDateString %></p>

                        <form action="process_customer_book.jsp" method="post">
                            <input type="hidden" name="hotelID" value="<%= room.getHotelID() %>">
                            <input type="hidden" name="roomNum" value="<%= room.getRoomNum() %>">
                            <input type="hidden" name="startDate" value="<%= startDateString %>">
                            <input type="hidden" name="endDate" value="<%= endDateString %>">
                            <button type="submit" class="btn">Book Now</button>
                        </form>
                    </div>
                <% } %>
            </div>
        <% } %>
    </div>
</body>
</html>




