<%-- 
    Document   : adminUpdExam
    Created on : 31-Jan-2019, 15:38:39
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
   
String  ModuleCode =request.getParameter("ModuleCode");  
String  ModuleCoordinator =request.getParameter("ModuleCoordinator");  
String  Year=request.getParameter("Year");           
String  ModuleName =request.getParameter("ModuleName");   
String  Teacher =request.getParameter("Teacher");   
String  InternalModerator =request.getParameter("InternalModerator");   
String  ExternalModerator =request.getParameter("ExternalModerator");   
String  ExamVetting =request.getParameter("ExamVetting"); 
  
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
                     
         String update_sql = "update exams set ModuleCoordinator='"+ModuleCoordinator+"',Year='"+Year+"',ModuleName='"+ModuleName+"',Teacher='"+Teacher+"',InternalModerator='"+InternalModerator+"',ExternalModerator='"+ExternalModerator+"',ExamVetting='"+ExamVetting+"' where ModuleCode='"+ModuleCode+"' " ; 
            

         try{
       stmt.execute(update_sql);
        }catch(Exception e){
            e.printStackTrace();}
             
                 
            stmt.close();                 
            conn.close();   
        }
          catch (Exception e) {  
                e.printStackTrace();  
        }   
%>   
              
 
 </body>
 
 <script > window.location.href='admintoexam.jsp' </script>
 
    
</html>
