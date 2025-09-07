<%@ page import="tables.Employee" %>

 <%-- This statements ensures we have access to the employees data --%>
<%
    Employee employee = (Employee) session.getAttribute("loggedInEmployee");
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Home - Hotel Management System</title>
    <link rel="stylesheet" type="text/css" href="employee_home.css">
</head>
<body>

    <div class="container">
        <h1>Welcome, <%= employee.getFirstName() %>!</h1>
        <p class="job-title"><strong>Job Title:</strong> <%= employee.getJobTitle() %></p>
        <p class="welcome-message">What would you like to do?</p>

        <!-- Navigation Links -->
        <div class="btn-container">
            <a href="employee_room_search.jsp" class="btn">View My Hotel's Rooms</a>
        </div>

        <div class="btn-container">
            <a href="employee_update_profile.jsp" class="btn">Update Profile</a>
        </div>

        <div class="btn-container">
            <a href="index.jsp" class="btn">Log Out</a>
        </div>

    </div>

</body>
</html>