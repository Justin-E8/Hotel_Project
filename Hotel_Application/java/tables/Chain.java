package tables;

/**
 * Represents a hotel chain with multiple locations.
 */
public class Chain {

    // Instance variables
    private String chainName;
    private int numLocations;
    private String centralStreetName;
    private int centralStreetNum;
    private String centralCity;

    /**
     * Constructor
     * @param chainName The name of the hotel chain.
     * @param numLocations The number of locations in the chain.
     * @param centralStreetName The central office street name.
     * @param centralStreetNum The central office street number.
     * @param centralCity The central office city.
     */
    public Chain(String chainName, int numLocations, String centralStreetName, int centralStreetNum, String centralCity) {
        this.chainName = chainName;
        this.numLocations = numLocations;
        this.centralStreetName = centralStreetName;
        this.centralStreetNum = centralStreetNum;
        this.centralCity = centralCity;
    }

    // Getters and setters
    public String getChainName() { return chainName; }
    public void setChainName(String chainName) { this.chainName = chainName; }

    public int getNumLocations() { return numLocations; }
    public void setNumLocations(int numLocations) { this.numLocations = numLocations; }

    public String getCentralStreetName() { return centralStreetName; }
    public void setCentralStreetName(String centralStreetName) { this.centralStreetName = centralStreetName; }

    public int getCentralStreetNum() { return centralStreetNum; }
    public void setCentralStreetNum(int centralStreetNum) { this.centralStreetNum = centralStreetNum; }

    public String getCentralCity() { return centralCity; }
    public void setCentralCity(String centralCity) { this.centralCity = centralCity; }
}
