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
        <title>Adatrögzítés</title>
    </head>
    <body>
        <div class="container"><div>
            <h1>Új filmek felvétele</h1>
            <a href="index.jsp">Adatok listázása</a> ||
            <a href="rogzit.jsp">Adatok rögzítése</a> ||
        </div>
        <div class="col-md-6">
            <form name="rogzit" class="form-row" method="POST" action="rogzit.jsp">
                <div class="form-group col-md-12">
                    <label for="cim">Cím: </label>
                    <input type="text" name="cim" class="form-control">
                </div>
                <div class="form-group col-md-12">
                    <label for="ev">Év: </label>
                    <input type="text" name="ev" class="form-control">
                </div>
                <div class="form-group col-md-12">
                    <label for="mufaj">Műfaj: </label>
                    <input type="text" name="mufaj" class="form-control">
                </div>
                <div class="form-group col-md-12">
                    <input type="submit" name="kuld" value="Adatok rögzítése" class="btn btn-success">
                </div>
            </form>
        </div>
        <div class="col-md-12">
                <%
                  try 
                  {
                    if(request.getParameter("kuld") != null)
                    {
                        filmes.beszur();
                        out.println("Sikeres rögzítés...");
                    } 
                  } 
                  catch (Exception e) 
                  {
                    out.println("Be kéne írvi valamit, Haver...");
                  }
                %>
            </div>
        </div>
    </body>
</html>
