package tables;

/**
 * Represents an amenity available in a specific hotel room.
 */
public class Amenities {

    // Instance variables
    private int hotelID;
    private int roomNum;
    private String amenity;

    /**
     * Constructor
     * @param hotelID  The unique ID of the hotel where the amenity is available.
     * @param roomNum  The room number associated with the amenity.
     * @param amenity  The name of the amenity.
     */
    public Amenities(int hotelID, int roomNum, String amenity) {
        this.hotelID = hotelID;
        this.roomNum = roomNum;
        this.amenity = amenity;
    }

    // Getters and setters
    public int getHotelID() { return hotelID; }
    public void setHotelID(int hotelID) { this.hotelID = hotelID; }

    public int getRoomNum() { return roomNum; }
    public void setRoomNum(int roomNum) { this.roomNum = roomNum; }

    public String getAmenity() { return amenity; }
    public void setAmenity(String amenity) { this.amenity = amenity; }
}