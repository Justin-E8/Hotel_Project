package tables;

import java.util.Date;

/**
 * Represents an employee working at a hotel
 */
public class Employee {

    // Instance variables
    private String SIN;
    private String jobTitle;
    private Date dateHired;
    private String firstName;
    private String lastName;
    private String streetName;
    private int streetNum;
    private String city;
    private int hotelID;

    /**
     * Constructor
     * @param SIN        The unique social insurance number of the employee.
     * @param jobTitle   The job title of the employee.
     * @param dateHired  The date the employee was hired.
     * @param firstName  The first name of the employee.
     * @param lastName   The last name of the employee.
     * @param streetName The street name of the employee's address.
     * @param streetNum  The street number of the employee's address.
     * @param city       The city of the employee's address.
     * @param hotelID    The unique ID of the hotel where the employee works.
     */
    public Employee(String SIN, String jobTitle, Date dateHired, String firstName, String lastName, String streetName, int streetNum, String city, int hotelID) {
        this.SIN = SIN;
        this.jobTitle = jobTitle;
        this.dateHired = dateHired;
        this.firstName = firstName;
        this.lastName = lastName;
        this.streetName = streetName;
        this.streetNum = streetNum;
        this.city = city;
        this.hotelID = hotelID;
    }

    // Getters and setters
    public String getSIN() { return SIN; }
    public void setSIN(String SIN) { this.SIN = SIN; }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }

    public Date getDateHired() { return dateHired; }
    public void setDateHired(Date dateHired) { this.dateHired = dateHired; }

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

    public int getHotelID() { return hotelID; }
    public void setHotelID(int hotelID) { this.hotelID = hotelID;  }
}