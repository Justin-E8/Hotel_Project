<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="tables.Employee" %>
<%@ page import="util.EmployeeService" %>

<%
    // Retrieve user input from the form
    String SIN = request.getParameter("SIN");
    String firstName = request.getParameter("firstNameEmployee");
    String lastName = request.getParameter("lastNameEmployee");

    System.out.println("SIN: " + SIN);
    System.out.println("first name: " + firstName);
    System.out.println("last name: " + lastName);

    EmployeeService employeeService = new EmployeeService();
    Employee employee = null;

    try {
        employee = employeeService.getEmployee(SIN, firstName, lastName);

        if (employee == null) {
            System.out.println("Employee not found! Login unsuccessful.");
            response.sendRedirect("employee_login.jsp");
        } else {
            // Login was successful, redirect to the employee home page, passing along the employees credentials
            System.out.println("Employee found! Login successful.");

            session.setAttribute("loggedInEmployee", employee);
            response.sendRedirect("employee_home.jsp");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>