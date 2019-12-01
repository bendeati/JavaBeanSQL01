package bab;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Kapcsolat {
    
    private Connection con; 
    private Statement stm; 
    private String uzenet;

    public Kapcsolat() {
    }

    public Statement getStm() {
        return stm;
    }

    
    public boolean connOK()
    {
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/filmek","root","root"); 
            stm = con.createStatement(); 
            return true;
        } 
        catch (ClassNotFoundException | SQLException e) 
        {
            uzenet = e.toString();
            return false;
        }
    }
    
    public String uzenet()
    {
        if(connOK())
            return "Kapcsolódás rendben"; 
        else 
            return "Kapcsolódási HIBA <br />" + uzenet;
    }
}
