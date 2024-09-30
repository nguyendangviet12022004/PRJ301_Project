package util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBHelper implements Serializable{
    public static Connection makeConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url="jdbc:sqlserver:"
                + "//localhost:1433"
                + ";databaseName=EBAY;encrypt=true;trustServerCertificate=true";
        Connection con=DriverManager.getConnection(url,"sa","123456");
        return con;
    }
    
    public static void main(String[] args) {
        try {
            System.out.println(makeConnection());
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
