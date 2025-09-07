package tables;

import java.sql.Date;

/**
 * Represents a customer of the hotels in the system
 */
public class Customer {

    // Instance variables
    private String customerID;
    private Date dateRegistered;
    private String firstName;
    private String lastName;
    private String streetName;
    private int streetNum;
    private String city;

    /**
     * Constructor
     * @param customerID     The unique ID of the customer.
     * @param dateRegistered The date the customer registered.
     * @param firstName      The first name of the customer.
     * @param lastName       The last name of the customer.
     * @param streetName     The street name of the customer's address.
     * @param streetNum      The street number of the customer's address.
     * @param city           The city of the customer's address.
     */
    public Customer(String customerID, Date dateRegistered, String firstName, String lastName, String streetName, int streetNum, String city) {
        this.customerID = customerID;
        this.dateRegistered = dateRegistered;
        this.firstName = firstName;
        this.lastName = lastName;
        this.streetName = streetName;
        this.streetNum = streetNum;
        this.city = city;
    }

    // Getters and setters
    public String getCustomerID() { return customerID; }
    public void setCustomerID(String customerID) { this.customerID = customerID; }

    public Date getDateRegistered() { return dateRegistered; }
    public void setDateRegistered(Date dateRegistered) { this.dateRegistered = dateRegistered; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getStreetName() { return streetName; }
    public void setStreetName(String streetName) { this.streetName = streetName; }

    public int getStreetNum() { return streetNum; }
    public void setStreetNum(int streetNum) { this.streetNum = streetNum; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
}

