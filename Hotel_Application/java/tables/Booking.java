package tables;

import java.util.Date;

/**
 * Represents a booking made by a customer for a room in a hotel.
 */
public class Booking {

    // Instance variables
    private int hotelID;
    private int roomNum;
    private String customerID;
    private Date startDate;
    private Date endDate;
    private Date dateBookingMade;

    /**
     * Constructor
     * @param hotelID         The unique ID of the hotel where the booking is made.
     * @param roomNum         The room number for the booking.
     * @param customerID      The unique ID of the customer making the booking.
     * @param startDate       The start date of the booking.
     * @param endDate         The end date of the booking.
     * @param dateBookingMade The date the booking was made.
     */
    public Booking(int hotelID, int roomNum, String customerID, Date startDate, Date endDate, Date dateBookingMade) {
        this.hotelID = hotelID;
        this.roomNum = roomNum;
        this.customerID = customerID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.dateBookingMade = dateBookingMade;
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

    public Date getDateBookingMade() { return dateBookingMade; }
    public void setDateBookingMade(Date dateBookingMade) { this.dateBookingMade = dateBookingMade; }
}