import java.sql.*;

public class App {

    public static void main(String[] args) throws Exception {

        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to MySQL
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/college",
            "root",
            "Divya@11869"
        );

        System.out.println("Connection established successfully!");

        // Insert record
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO student VALUES (?, ?, ?)"
        );

        ps.setInt(1, 107);
        ps.setString(2, "Divyanjali");
        ps.setString(3, "cse");

        ps.executeUpdate();

        System.out.println("Record Inserted");

        // Display records
        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery("SELECT * FROM student");

        while (rs.next()) {
            System.out.println(
                rs.getInt("id") + " " +
                rs.getString("name") + " " +
                rs.getString("branch")
            );
        }

        // Close
        rs.close();
        st.close();
        ps.close();
        con.close();

        System.out.println("Connection Closed");
    }
}