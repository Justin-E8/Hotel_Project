package tables;

public class Hotel {

    // Instance variables
    private int hotelID;
    private String streetName;
    private int streetNum;
    private String city;
    private int starRating;
    private int numRooms;
    private String managerSIN;
    private String chainName;

    /**
     * Constructor
     * @param hotelID ID of hotel
     * @param streetName street name where hotel is located
     * @param streetNum street number of hotel's address
     * @param city city where hotel is located
     * @param starRating rating from 1 to 5
     * @param numRooms number of rooms
     * @param managerSIN SIN number of manager of hotel
     * @param chainName name of chain hotel belongs to
     */
    public Hotel(int hotelID, String streetName, int streetNum, String city, int starRating, int numRooms, String managerSIN, String chainName) {
        this.hotelID = hotelID;
        this.streetName = streetName;
        this.streetNum = streetNum;
        this.city = city;
        this.starRating = starRating;
        this.numRooms = numRooms;
        this.managerSIN = managerSIN;
        this.chainName = chainName;
    }

    // Getters and setters
    public int getHotelID() { return hotelID; }
    public void setHotelID(int hotelID) { this.hotelID = hotelID; }

    public String getStreetName() { return streetName; }
    public void setStreetName(String streetName) { this.streetName = streetName; }

    public int getStreetNum() { return streetNum; }
    public void setStreetNum(int streetNum) { this.streetNum = streetNum; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public int getStarRating() { return starRating; }
    public void setStarRating(int starRating) { this.starRating = starRating; }

    public int getNumRooms() { return numRooms; }
    public void setNumRooms(int numRooms) { this.numRooms = numRooms; }

    public String getManagerSIN() { return managerSIN; }
    public void setManagerSIN(String managerSIN) { this.managerSIN = managerSIN; }

    public String getChainName() { return chainName; }
    public void setChain(String chainName) { this.chainName = chainName; }
}