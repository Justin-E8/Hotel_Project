<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="tables.Employee" %>

<%
    // Retrieve employee details from session
    Employee employee = (Employee) session.getAttribute("loggedInEmployee");
    if (employee == null) {
        response.sendRedirect("employee_login.jsp"); // Redirect to login if not authenticated
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile - Hotel Management System</title>
    <link rel="stylesheet" type="text/css" href="employee_update_profile.css">
</head>
<body>

    <div class="container">
        <h1>Update Profile</h1>
        <p class="welcome-message">Edit your information below</p>

        <form action="process_employee_update.jsp" method="post" class="update-form">
            <label>First Name</label>
            <input type="text" name="firstName" value="<%= employee.getFirstName() %>" required>

            <label>Last Name</label>
            <input type="text" name="lastName" value="<%= employee.getLastName() %>" required>

            <label>Street Name</label>
            <input type="text" name="streetName" value="<%= employee.getStreetName() %>" required>

            <label>Street Number</label>
            <input type="text" name="streetNum" value="<%= employee.getStreetNum() %>" required>

            <label>City</label>
            <input type="text" name="city" value="<%= employee.getCity() %>" required>

            <button type="submit" class="btn">Update Profile</button>
        </form>
    </div>

</body>
</html>
