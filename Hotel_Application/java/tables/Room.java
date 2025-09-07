package tables;

/**
 * Represents a room within a hotel.
 */
public class Room {

    // Instance variables
    private int hotelID;
    private int roomNum;
    private double price;
    private int capacity;
    private String windowView;
    private boolean isExtendable;

    /**
     * Constructor
     *
     * @param hotelID     The ID of the hotel the room belongs to.
     * @param roomNum     The number of the room within the hotel.
     * @param price       The price per night for the room.
     * @param capacity    The maximum capacity of the room.
     * @param windowView  The description of the room's window view.
     * @param isExtendable Whether the room can be extended (e.g., for a longer stay).
     */
    public Room(int hotelID, int roomNum, double price, int capacity, String windowView, boolean isExtendable) {
        this.hotelID = hotelID;
        this.roomNum = roomNum;
        this.price = price;
        this.capacity = capacity;
        this.windowView = windowView;
        this.isExtendable = isExtendable;
    }

    // Getters and Setters
    public int getHotelID() { return hotelID; }
    public void setHotelID(int hotelID) { this.hotelID = hotelID; }

    public int getRoomNum() { return roomNum; }
    public void setRoomNum(int roomNum) { this.roomNum = roomNum; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }

    public String getWindowView() { return windowView; }
    public void setWindowView(String windowView) { this.windowView = windowView; }

    public boolean isExtendable() { return isExtendable; }
    public void isExtendable(boolean isExtendable) { this.isExtendable = isExtendable; }
}
