package bab;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Filmek {
    
    private int id;
    private String cim;
    private int ev;
    private String mufaj;
    
    private final Kapcsolat kapcs;
    private String uzenet;
    private Statement st;
    private ResultSet rs;

    public Filmek() {
        this.kapcs = new Kapcsolat();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCim() {
        return cim;
    }

    public void setCim(String cim) {
        this.cim = cim;
    }

    public int getEv() {
        return ev;
    }

    public void setEv(int ev) {
        this.ev = ev;
    }

    public String getMufaj() {
        return mufaj;
    }

    public void setMufaj(String mufaj) {
        this.mufaj = mufaj;
    }
    
    public String listaz()
    {
        String kiir = "";
        try 
        {
            if(kapcs.connOK())
            {
                st = kapcs.getStm();
                rs = st.executeQuery("select * from filmek");
                while(rs.next())
                {
                    kiir += rs.getInt("id") + " ";
                    kiir += rs.getString("cim") + " ";
                    kiir += rs.getInt("ev") + " ";
                    kiir += rs.getString("mufaj");
                    kiir += "<br />";
                }
            }
        } 
        catch (SQLException e) 
        {
            kiir += "HIBA a kiolvasásákor!" + e;
        }
        return kiir;
    }
    
    public void listaz2()
    {
        try 
        { 
            rs = st.executeQuery("select * from filmek"); 
        } 
        catch (SQLException e)
        { 
            System.out.println(e);
        }
    }
    
    public ResultSet listaLeker() {  
      return rs;  
    }
    
    public void modAdatokListaz(int modId)
    {
        try 
        {
            st = kapcs.getStm();
            rs = st.executeQuery("SELECT * FROM filmek WHERE id="+modId);
            
        } 
        catch (SQLException e) 
        {
            System.out.println(e);
        }
        
    }
    
    public void beszur()
    {
        try 
        { 
            String query = "insert into filmek(cim,ev,mufaj) values('"
                    +cim+"',"+ev+",'"+mufaj+"')";
            st.executeUpdate(query); 
            System.out.println("A beszúrás sikeres!");
        }
        catch (SQLException e)
        {
            System.out.println("Error in inserting:" + e.getMessage());
        }


    }
    
    public void modosit(int modId)
    {
        try 
        { 
            String query = "UPDATE filmek SET "
                    + "cim = '"+cim+"',"
                    + "ev = '"+ev+"',"
                    + "mufaj = '"+mufaj+"' WHERE id="+modId;
            st.executeUpdate(query); 
            System.out.println("A módosítás sikeres!");
        }
        catch (SQLException e)
        {
            System.out.println("Hibás rögzítés:" + e.getMessage());
        }
    }
    
    public boolean torles(int modId)
    {
        boolean siker = false;
        try 
        { 
            String query = "DELETE FROM filmek WHERE id="+modId;
            st.executeUpdate(query); 
            siker = true;
        }
        catch (SQLException e)
        {
            System.out.println("Hiba a mátrixban:" + e.getMessage());
        }
        return siker;
    }
}
