<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<%@ page import = "bab.Kapcsolat" %>
<%@ page import = "bab.Filmek" %>

<jsp:useBean id="dbKapcs" class="bab.Kapcsolat" scope="session"/>
<jsp:useBean id="filmes" class="bab.Filmek" scope="session"/>
<!--jsp:setProperty name="teglalap" property="*"/--> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
        <div>
            <h1>Hello MySQL!</h1>
            <%=dbKapcs.uzenet()%>
            <br />
            <a href="index.jsp">Adatok listázása</a> ||
            <a href="rogzit.jsp">Adatok rögzítése</a> ||
            
        </div>
        <div>
            <h1>Listázás a Bean-ből</h1>
            <%=filmes.listaz()%>
        </div>
        <div>
            <h1>A listázás másként</h1>
            <table class="table table-hover">
                <tr>
                    <td>id</td><td>cim</td><td>ev</td><td>mufaj</td><td>Művelet</td>
                </tr>
                <% 
                    try 
                    { 
                        filmes.listaz2();
                        ResultSet temp = filmes.listaLeker(); //lsd. 1. sor import!
                        while (temp.next())
                        { 
                %> 
                        <tr> 
                            <td><%out.print(temp.getInt("id"));%></td>
                            <td><%out.print(temp.getString("cim"));%></td>
                            <td><%out.print(temp.getInt("ev"));%></td>
                            <td><%out.print(temp.getString("mufaj"));%></td>
                            <td><a href="modosit.jsp?modId=<%out.print(temp.getInt("id"));%>">
                                    <button class="btn btn-success">Módosítom</button>
                            </td>
                            <td><a href="torles.jsp?modId=<%out.print(temp.getInt("id"));%>">
                                    <button class="btn btn-success">Törlöm</button>
                            </td>
                        </tr>
                <%      }   
                    }
                    catch (Exception e) 
                    { 
                        out.print("HIBA " + e);
                    } 
                %>
            </table>
        </div>
        </div>
    </body>
</html>
