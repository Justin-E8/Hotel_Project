<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Hotel Management System</title>
    <link rel="stylesheet" type="text/css" href="loginpage.css">
</head>
<body>

    <div class="container">
        <h1>Register as a Customer</h1>
        <p class="welcome-message">Please fill out the form to create a customer account.</p>

        <!-- Registration Form -->
        <form action="process_register.jsp" method="post">

            <!-- Customer ID (6-character alphanumeric) -->
                        <label for="customerID">Customer ID:</label>
                        <input type="text" id="customerID" name="customerID" placeholder="Enter 6-character Customer ID" pattern="[A-Za-z0-9]{6}" title="Customer ID must be exactly 6 letters or digits" required>

            <!-- First Name -->
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" placeholder="Enter First Name" required>

            <!-- Last Name -->
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" placeholder="Enter Last Name" required>

            <!-- Street Name -->
            <label for="streetName">Street Name:</label>
            <input type="text" id="streetName" name="streetName" placeholder="Enter Street Name" required>

            <!-- Street Number -->
            <label for="streetNum">Street Number:</label>
            <input type="number" id="streetNum" name="streetNum" placeholder="Enter Street Number" min="1" required>

            <!-- City -->
            <label for="city">City:</label>
            <input type="text" id="city" name="city" placeholder="Enter City" required>

            <!-- Submit Button -->
            <button class="btn" type="submit">Register</button>
        </form>
    </div>

</body>
</html>
