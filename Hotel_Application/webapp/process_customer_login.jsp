<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="tables.Customer" %>
<%@ page import="util.CustomerService" %>

<%
    // Retrieve user input from the form
    String customerID = request.getParameter("customerID");
    String firstName = request.getParameter("firstNameCustomer");
    String lastName = request.getParameter("lastNameCustomer");

    CustomerService customerService = new CustomerService();
    Customer customer = null;

    try {
        customer = customerService.getCustomer(customerID, firstName, lastName);

        if (customer == null) {
            System.out.println("Customer not found!");
            response.sendRedirect("customer_login.jsp");
        }else{
            session.setAttribute("loggedInCustomer", customer);
            response.sendRedirect("customer_home.jsp");
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>