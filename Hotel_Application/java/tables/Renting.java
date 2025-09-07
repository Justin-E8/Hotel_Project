package tables;

import java.util.Date;

/**
 * Represents a room rental by a customer in a hotel.
 */
public class Renting {

    // Instance variables
    private int hotelID;
    private int roomNum;
    private String customerID;
    private Date startDate;
    private Date endDate;
    private String checkInEmpSIN;

    /**
     * Constructor
     * @param hotelID       The unique ID of the hotel where the room is rented.
     * @param roomNum       The room number being rented.
     * @param customerID    The unique ID of the customer renting the room.
     * @param startDate     The start date of the rental.
     * @param endDate       The end date of the rental.
     * @param checkInEmpSIN The SIN of the employee who checked in the customer.
     */
    public Renting(int hotelID, int roomNum, String customerID, Date startDate, Date endDate, String checkInEmpSIN) {
        this.hotelID = hotelID;
        this.roomNum = roomNum;
        this.customerID = customerID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.checkInEmpSIN = checkInEmpSIN;
    }

    // Getters and setters
    public int getHotelID() { return hotelID; }
    public void setHotelID(int hotelID) { this.hotelID = hotelID; }

    public int getRoomNum() { return roomNum; }
    public void setRoomNum(int roomNum) { this.roomNum = roomNum; }

    public String getCustomerID() { return customerID; }
    public void setCustomerID(String customerID) { this.customerID = customerID; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    public String getCheckInEmpSIN() { return checkInEmpSIN; }
    public void setCheckInEmpSIN(String checkInEmpSIN) { this.checkInEmpSIN = checkInEmpSIN; }
}