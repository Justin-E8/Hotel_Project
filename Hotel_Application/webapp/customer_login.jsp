<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Login - Hotel Management System</title>
    <link rel="stylesheet" type="text/css" href="loginpage.css">
</head>
<body>

    <div class="container">
        <h1>Customer Login</h1>
        <p class="welcome-message">Please enter your details to log in.</p>

        <!-- Customer Login Form -->
        <form action="process_customer_login.jsp" method="post">

            <!-- Customer ID -->
            <label for="customerID">Customer ID:</label>
            <input type="text" id="customerID" name="customerID" placeholder="Enter Customer ID" required>

            <!-- First Name -->
            <label for="firstNameCustomer">First Name:</label>
            <input type="text" id="firstNameCustomer" name="firstNameCustomer" placeholder="Enter First Name" required>

            <!-- Last Name -->
            <label for="lastNameCustomer">Last Name:</label>
            <input type="text" id="lastNameCustomer" name="lastNameCustomer" placeholder="Enter Last Name" required>

            <!-- Submit Button -->
            <button class="btn" type="submit">Submit</button>
        </form>
    </div>

</body>
</html>
