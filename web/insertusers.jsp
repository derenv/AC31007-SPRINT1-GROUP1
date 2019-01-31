<%-- 
    Document   : insertusers
    Created on : 24-Jan-2019, 16:59:00
    Author     : zhendongliu
--%>
<%@page import="java.util.Enumeration"%>
<%@ page import="db.login" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  


<html>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
String userid=request.getParameter("userid");
String mod1=request.getParameter("mod1");
String mod2=request.getParameter("mod2");
String mod3=request.getParameter("mod3");
String mod4=request.getParameter("mod4");

java.util.Date date=new java.util.Date();   
        String datetime=new Timestamp(date.getTime()).toString();  
  
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
            
            String insert_sql = "insert into users(Username,Password,UserID,Module1,Module2,Module3,Module4) values('" + username + "','" + password + "','" + userid + "','" + mod1+ "','"+ mod2+"','"+ mod3+"','"+mod4+"')";  
           
    
                          
            try {   
                stmt.execute(insert_sql);   
            }catch(Exception e)     {  
                e.printStackTrace();  
            }  
            
          
                 
            stmt.close();                 
            conn.close();   
        }
          catch (Exception e) {  
                e.printStackTrace();  
        }   
%>  


 <script> window.location.href='choose.jsp' </script>
 
 
 
</html>
