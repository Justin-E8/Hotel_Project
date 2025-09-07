<%@ page import="java.util.*, tables.Customer" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Customer customer = (Customer) session.getAttribute("loggedInCustomer");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link rel="stylesheet" type="text/css" href="customer_update_profile.css">
</head>
<body>

    <div class="container">
        <h1> Update Your Profile</h1>

        <form action="process_customer_update.jsp" method="post">
            <input type="hidden" name="customerID" value="<%= customer.getCustomerID() %>">

            <input type="hidden" name="dateRegistered" value="<%= customer.getDateRegistered() %>">

            <label>First Name:</label>
            <input type="text" name="firstName" value="<%= customer.getFirstName() %>" required><br>

            <label>Last Name:</label>
            <input type="text" name="lastName" value="<%= customer.getLastName() %>" required><br>

            <label>Street Name:</label>
            <input type="text" name="streetName" value="<%= customer.getStreetName() %>" required><br>

            <label>Street Number:</label>
            <input type="number" name="streetNum" value="<%= customer.getStreetNum() %>" required><br>

            <label>City:</label>
            <input type="text" name="city" value="<%= customer.getCity() %>" required><br>

            <button type="submit" class = "btn">Update</button>
        </form>

    </div>
</body>
</html>

