<%-- 
    Document   : updateuser
    Created on : 24-Jan-2019, 17:19:54
    Author     : zhendongliu
--%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  
<%@ page contentType="text/html;"%>  

<!DOCTYPE html>
<html>

    <body>
        
        <%

       java.util.Date date=new java.util.Date();   
        String datetime=new Timestamp(date.getTime()).toString();  
  
       String Username=request.getParameter("Username");    
        
        try   
        {   
            String driverName = "com.mysql.jdbc.Driver"; 
            String DBUser = "18agileteam1"; 
            String DBPasswd = "7845.at1.5487"; 
            String DBName = "18agileteam1db"; 
          
            String connUrl = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/" + DBName + "?user=" + DBUser + "&password=" + DBPasswd;  
            Class.forName(driverName).newInstance();  
            Connection conn = DriverManager.getConnection(connUrl);  
            Statement stmt = conn.createStatement();  
            stmt.executeQuery("SET NAMES UTF8");  
              
         String query_sql = "select * from users where Username='"+Username.trim()+"' " ;  
   
            
            try {   
                ResultSet rs = stmt.executeQuery(query_sql);     
                while(rs.next()) {           
                    
            session.setAttribute("Username",rs.getString("Username"));
            session.setAttribute("UserID",rs.getString("UserID"));
            session.setAttribute("Mod1",rs.getString("Module1"));
            session.setAttribute("Mod2",rs.getString("Module2"));
            session.setAttribute("Mod3",rs.getString("Module3"));
            session.setAttribute("Mod4",rs.getString("Module4"));
                    %>     
                    <br/>
                    
                    User name:<%=rs.getString("Username")%> </br>     
                    Password:<%=rs.getString("Password")%> </br>   
                    User ID:<%=rs.getString("UserID")%> </br>   
                    Module1:<%=rs.getString("Module1")%> </br>
                    Module2:<%=rs.getString("Module2")%> </br>   
                    Module3:<%=rs.getString("Module3")%> </br>
                    Module4:<%=rs.getString("Module4")%> </br>   
                               
                    
                    </br>  
                    
                    
                    <%  
                }      
            }
                 catch(Exception e) {  
                e.printStackTrace();  
            }   
                 
            stmt.close();                 
            conn.close();   
        }
          catch (Exception e) {  
                e.printStackTrace();  
        }   
%>   
        
    <form action="update.jsp" method="post">
     User name &nbsp   
  <input name="username"  type ="text">
    User  ID &nbsp   
  <select name="userid"  type ="text">
      <option value="Admin">Admin</option>
      <option value="ExternalMod">ExternalMod</option>
      <option value="InternalMod">InternalMod</option>
      <option value="Teacher">Teacher</option>
  </select>
    Module 1  &nbsp 
  <input name="mod1"  type ="text">
    Module 2  &nbsp 
  <input name="mod2"  type ="text">
    Module 3  &nbsp 
  <input name="mod3"  type ="text">
    Module 4  &nbsp 
  <input name="mod4"  type ="text">
  
 
  
  <input name="submit"  type ="submit"  value="submit"  >
  

        </form>
        
 
    </body>
    
    
    
    
    
    
</html>
