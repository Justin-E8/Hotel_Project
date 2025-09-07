<%@ page import="tables.Customer" %>

 <%-- This statements ensures we have access to the customers data --%>
<%
    Customer customer = (Customer) session.getAttribute("loggedInCustomer");
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Home - Hotel Management System</title>
    <link rel="stylesheet" type="text/css" href="customer_home.css">
</head>
<body>

    <div class="container">
        <h1>Welcome, <%= customer.getFirstName() %>!</h1>
        <p class="welcome-message">What would you like to do?</p>

        <!-- Navigation Links -->
        <div class="btn-container">
            <a href="room_search.jsp" class="btn">Search For Rooms</a>
        </div>

        <div class="btn-container">
            <a href="view_booking.jsp" class="btn">View My Bookings</a>
        </div>

        <div class="btn-container">
            <a href="customer_update_profile.jsp" class="btn">Update Profile</a>
        </div>

        <div class="btn-container">
            <a href="index.jsp" class="btn">Log Out</a>
        </div>

    </div>

</body>
</html>