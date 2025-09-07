<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Login - Hotel Management System</title>
    <link rel="stylesheet" type="text/css" href="loginpage.css">
</head>
<body>

    <div class="container">
        <h1>Employee Login</h1>
        <p class="welcome-message">Please enter your details to log in.</p>

        <!-- Employee Login Form -->
        <form action="process_employee_login.jsp" method="post">

            <!-- SIN -->
            <label for="SIN">SIN:</label>
            <input type="text" id="SIN" name="SIN" placeholder="Enter SIN" required>

            <!-- First Name -->
            <label for="firstNameEmployee">First Name:</label>
            <input type="text" id="firstNameEmployee" name="firstNameEmployee" placeholder="Enter First Name" required>

            <!-- Last Name -->
            <label for="lastNameEmployee">Last Name:</label>
            <input type="text" id="lastNameEmployee" name="lastNameEmployee" placeholder="Enter Last Name" required>

            <!-- Hotel ID -->
            <label for="hotelId">Hotel ID:</label>
            <input type="text" id="hotelId" name="hotelId" placeholder="Enter Hotel ID" required>

            <!-- Submit Button -->
            <button class="btn" type="submit">Submit</button>
        </form>
    </div>

</body>
</html>
