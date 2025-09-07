<%@ page import="tables.Hotel" %>
<%@ page import="util.HotelService" %>

<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel List</title>
</head>
<body>
    <h1>Hotel List</h1>

    <%
        // Create an instance of HotelService to use the getHotels() method
        HotelService hotelService = new HotelService();
        List<Hotel> hotels = null;

        try {
            // Call the getHotels() method from HotelService to get the list of hotels
            hotels = hotelService.getHotels();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Check if hotels are available and display them
        if (hotels != null && !hotels.isEmpty()) {
    %>
        <table border="1">
            <thead>
                <tr>
                    <th>Hotel ID</th>
                    <th>Street Name</th>
                    <th>Street Number</th>
                    <th>City</th>
                    <th>Star Rating</th>
                    <th>Number of Rooms</th>
                    <th>Manager SIN</th>
                    <th>Chain Name</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Loop through the list of hotels and display each one in a table row
                    for (Hotel hotel : hotels) {
                %>
                <tr>
                    <td><%= hotel.getHotelID() %></td>
                    <td><%= hotel.getStreetName() %></td>
                    <td><%= hotel.getStreetNum() %></td>
                    <td><%= hotel.getCity() %></td>
                    <td><%= hotel.getStarRating() %></td>
                    <td><%= hotel.getNumRooms() %></td>
                    <td><%= hotel.getManagerSIN() %></td>
                    <td><%= hotel.getChainName() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    <%
        } else {
    %>
        <p>No hotels found!</p>
    <%
        }
    %>
</body>
</html>