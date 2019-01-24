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
            
            String insert_sql = "insert into users(Username,Password,UserID,Module1,Module2) values('" + username + "','" + password + "','" + userid + "','" + mod1+ "','"+ mod2+"')";  
           
        // String insert_sql = "insert into pdf (Mod_code,Pdf_path,Current_Stage,Edit)  values('AC32006','www.zhujiefan.com','0','0')";
           
         String query_sql = "select * from users";  
                          
            try {   
                stmt.execute(insert_sql);   
            }catch(Exception e)     {  
                e.printStackTrace();  
            }  
            
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
</html>
