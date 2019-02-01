<%-- 
    Document   : updateuser
    Created on : 24-Jan-2019, 17:19:54
    Author     : zhendongliu
--%> 
<%@ page language="java" import="java.sql.ResultSet,java.sql.SQLException"%>  
<%@ page contentType="text/html;"%>  

<%@ page import="db.data_access" %>
<!DOCTYPE html>
<html>
    
    <body>
        <%
        String Username=request.getParameter("Username");
        try{ 
            (new data_access()).run_statement("DELETE FROM users WHERE Username='"+Username.trim()+"'");
            ResultSet rs = (new data_access()).run_statement("SELECT * FROM users WHERE Username='"+Username.trim()+"'");
            while(rs.next()) {  
        %>     
        <br/>
        User name:<%=rs.getString("Username")%> </br>
        Password:<%=rs.getString("Password")%> </br>
        User ID:<%=rs.getString("UserID")%> </br>
        Module1:<%=rs.getString("Module1")%> </br>
        Module2:<%=rs.getString("Module2")%> </br>
        </br>
        <%  
            } 
        }catch(SQLException e){
            session.setAttribute("state", e.getSQLState());
            session.setAttribute("code", e.getErrorCode());
            session.setAttribute("mess", e.getMessage());
            response.sendRedirect("../../error pages/dberror.jsp");
        }
        %>
    </body>
 <script > window.location.href='choose.jsp' </script>
</html>