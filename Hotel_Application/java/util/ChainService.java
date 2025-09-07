package util;

import tables.Chain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ChainService {

    // Fetches only the chain specified by their chain_name
    public Chain getChain(String chainName) throws Exception {

        // SQL query with ? as placeholders, to be replaced by PreparedStatement
        String sql = "SELECT * FROM Chain WHERE chain_name = ?";

        // database connection object
        ConnectionDB db = new ConnectionDB();

        Chain chain = null;

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);

            // The number 1 says that the ? is being set to the string value of
            // chainName, including the single quotes '' needed in SQL
            stmt.setString(1, chainName);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) { // If rs.next() returns true, then the query must have found the chain that is being searched

                // Instantiating a new Chain object with this specific chain's attributes
                chain = new Chain(
                    rs.getString("chain_name"),
                    rs.getInt("num_locations"),
                    rs.getString("central_street_name"),
                    rs.getInt("central_street_num"),
                    rs.getString("central_city")
                );
            }
            rs.close();
            stmt.close();
            con.close();
            db.close();

            return chain; // returns chain object if the if statement ran, but if not, returns null

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}