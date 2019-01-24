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
              
            
         String delete_sql = "delete from users where Username='"+Username.trim()+"' " ; 
         
         String query_sql = "select * from users where Username='"+Username.trim()+"' " ;  
   
         try{
        stmt.execute(delete_sql);
        }catch(Exception e){e.printStackTrace();}
         
            try {   
                ResultSet rs = stmt.executeQuery(query_sql);     
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
        
         
        
 
    </body>
    
        <a href="choose.jsp"> back</a>
    
    
    
    
</html>
