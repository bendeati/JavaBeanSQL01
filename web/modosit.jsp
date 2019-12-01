<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<%@ page import = "bab.Kapcsolat" %>
<%@ page import = "bab.Filmek" %>
<jsp:useBean id="dbKapcs" class="bab.Kapcsolat" scope="session"/>
<jsp:useBean id="filmes" class="bab.Filmek" scope="session"/>
<jsp:setProperty name="filmes" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Adatok módosítása</title>
    </head>
    <body>
    <%
        //az id átvétele
        int modId = 0;
        if(request.getParameter("modId") != null)
        {
            modId = Integer.parseInt(request.getParameter("modId"));
            out.print("A módosítandó rekord id-je: " + modId);
        } 
        else 
        {   //ez akkor lehet, ha önmagában hívjuk meg az állományt!
            //az alábbi szöveget csak a teszteléskor érdemes meghagyni:
            out.print("Nincs kiválasztott rekord!");
            //tesztelés után írjuk át erre a sorra, ami átirnyít:
            //response.sendRedirect("index.jsp");
        }
    %>
    
        <div class="container"><div>
            <h1>Film adatainak módosítása</h1>
            <a href="index.jsp">Adatok listázása</a> ||
            <a href="rogzit.jsp">Adatok rögzítése</a> ||
        </div>
            
        <%
            if(request.getParameter("modositGomb") != null)
            {
                //módosítani jöttem
                filmes.modosit(modId);
                out.print("Sikeres módosítás");
            }
            else
            {
                //hívjuk meg a paraméteres metódust a Filmek.java-ból
                filmes.modAdatokListaz(modId);
                ResultSet temp = filmes.listaLeker(); //lsd. 1. sor import itt is!
                temp.next();
        %>
            
                <div class="col-md-6">
                    <form name="modosit" class="form-row" method="POST" action="modosit.jsp">
                        <div class="form-group col-md-12">
                            <label for="cim">Cím: </label>
                            <input type="text" name="cim" class="form-control" value="<%=temp.getString("cim") %>">
                        </div>
                        <div class="form-group col-md-12">
                            <label for="ev">Év: </label>
                            <input type="text" name="ev" class="form-control" value="<%=temp.getString("ev") %>">
                        </div>
                        <div class="form-group col-md-12">
                            <label for="mufaj">Műfaj: </label>
                            <input type="text" name="mufaj" class="form-control" value="<%=temp.getString("mufaj") %>">
                        </div>
                        <input type="hidden" name="modId" value="<%=modId%>">
                        <div class="form-group col-md-12">
                            <input type="submit" name="modositGomb" value="Adatok módosítása" class="btn btn-success">
                        </div>
                    </form>
                </div>
        <%
            } //else vége!
        %>
        </div>
    </body>
</html>
