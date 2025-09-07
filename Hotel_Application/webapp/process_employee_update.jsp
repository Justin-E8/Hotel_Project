<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="tables.Employee" %>
<%@ page import="util.EmployeeService" %>

<%
    Employee employee = (Employee) session.getAttribute("loggedInEmployee");

    // Retrieve user input from the form
    String newFirstName = request.getParameter("firstName");
    String newLastName = request.getParameter("lastName");
    String newStreetName = request.getParameter("streetName");
    int newStreetNum = Integer.parseInt(request.getParameter("streetNum"));
    String newCity = request.getParameter("city");

    EmployeeService employeeService = new EmployeeService();

    try {
        employeeService.updateEmployee(employee, newFirstName, newLastName, newStreetName, newStreetNum, newCity);

        // Manually update the Employee object in session
        employee.setFirstName(newFirstName);
        employee.setLastName(newLastName);
        employee.setStreetName(newStreetName);
        employee.setStreetNum(newStreetNum);
        employee.setCity(newCity);

        // Save updated employee object back to session
        session.setAttribute("loggedInEmployee", employee);

        // Redirect back to employee home page
        response.sendRedirect("employee_home.jsp");

    } catch (Exception e) {
        e.printStackTrace();
    }
%>