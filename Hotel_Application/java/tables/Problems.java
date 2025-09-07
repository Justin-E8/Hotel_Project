package tables;

/**
 * Represents a reported problem in a specific hotel room.
 */
public class Problems {

    // Instance variables
    private int hotelID;
    private int roomNum;
    private String problem;

    /**
     * Constructor
     * @param hotelID  The unique ID of the hotel where the problem occurred.
     * @param roomNum  The room number associated with the problem.
     * @param problem  A description of the problem.
     */
    public Problems(int hotelID, int roomNum, String problem) {
        this.hotelID = hotelID;
        this.roomNum = roomNum;
        this.problem = problem;
    }

    // Getters and setters
    public int getHotelID() { return hotelID; }
    public void setHotelID(int hotelID) { this.hotelID = hotelID; }

    public int getRoomNum() { return roomNum; }
    public void setRoomNum(int roomNum) { this.roomNum = roomNum; }

    public String getProblem() { return problem; }
    public void setProblem(String problem) { this.problem = problem; }
}