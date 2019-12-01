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
        <title>Adat törlése</title>
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
        {   
            out.print("Nincs kiválasztott rekord!");
        }
    %>
        <div class="container"><div>
            <h1>Film törlés</h1>
            <a href="index.jsp">Adatok listázása</a> ||
            <a href="rogzit.jsp">Adatok rögzítése</a> ||
        </div>
        <div class="col-md-6">
            <form name="torle" class="form-row" method="POST" action="torles.jsp">
                <div class="form-group col-md-12">
                    Valóban törölni szeretné a rekordot? (<%=modId%>)
                </div>
                <input type="hidden" name="modId" value="<%=modId%>">
                <div class="form-group col-md-12">
                    <input type="submit" name="torolGomb" value="IGEN" class="btn btn-success">
                    
                </div>
            </form>
                <a href="index.jsp"><button name="nemGomb" class="btn btn-warning">NEM</button></a>
        </div>
        <div class="col-md-12">
        <%
          if(request.getParameter("torolGomb") != null)
            {
                if(filmes.torles(modId))
                {
                    out.print("Töröltem...");
                    filmes.torles(modId);
                }
                else
                {
                    out.print("Nem oké a törlés...");
                }
            } 
           
          
        %>
            </div>
        </div>
    </body>
</html>
