
<%-- 
    Document   : adminCreateExam
    Created on : 31-Jan-2019, 15:53:23
    Author     : zhendongliu
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  
<%@ page contentType="text/html;"%> 
<%@include file="session_check.jsp" %>
<!DOCTYPE html>


<html>

 <head>  
<title>Create Exam Page</title>
 <link rel="stylesheet" type="text/css" href="css/Style.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
               <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<header>
      <div class="content"><img src="img/UoDlogo.jpg"/></div>
</header>
    
    <body>   
        
       
<div class="main">
<div class="sidebar">
    
  <ul>
      
    <br>

       <li><a href="createusers.jsp">Create user </a></li>
      <li><a href="choose.jsp">Edit user </a></li>  
      <li><a href="admintoexam.jsp">Admin edit Exam</a></li>      
     <li><a href="accountDetails.jsp">Account Details</a></li>
    <div class="signout"><li><a href="logout.jsp">Sign out</a></li></div>
  
  </ul>
</div></div>
    <div class="main">
   <div align="center">
       <br>
       <fieldset style="background-color: white ; width: 600px ; ">
       <legend style="text-align: center ; color: black; background-color: white ; font-size:40px">Create Exam Page</legend>
        <legend style="text-align: center ; background-color: white ;" >Please enter the information </legend>
        <div style="text-align: center; padding:20px">      
 
    <form action="adminCreateExam.jsp" method="post">
          
    Module Code &nbsp               
    <input name="ModuleCode"  type ="text"> <br/> <br/>
    Module Coordinator &nbsp  
    <input name="ModuleCoordinator"  type ="text"><br/><br/>
    Year &nbsp &nbsp 
   <input name="Yearr"  type ="text"><br/><br/> 
   ModuleName  &nbsp 
  <input name="ModuleName"  type ="text"><br/><br/>
    Teacher  &nbsp 
  <input name="Teacher"  type ="text"><br/><br/>
   InternalModerator  &nbsp 
  <input name="InternalModerator"  type ="text"><br/><br/>
    ExternalModerator  &nbsp 
  <input name="ExternalModerator"  type ="text"><br/><br/>
   ExamVetting  &nbsp 
  <input name="ExamVetting"  type ="text"><br/><br/>
  
  <input name="submit"  type ="submit"  value="submit"  style="float: right;background-color: rgb(67,101,226);border: none;color:white;
        padding: 10px 12px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;"  ><br/>
  
        </form>  
          </div>
		</fieldset>
   </div></div>

    <%
String  ModuleCode =request.getParameter("ModuleCode");  
String  ModuleCoordinator =request.getParameter("ModuleCoordinator");  
String  Year=request.getParameter("Year");           
String  ModuleName =request.getParameter("ModuleName");   
String  Teacher =request.getParameter("Teacher");   
String  InternalModerator =request.getParameter("InternalModerator");   
String  ExternalModerator =request.getParameter("ExternalModerator");   
String  ExamVetting =request.getParameter("ExamVetting");   



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
                 
           String insert_sql = "insert into exams(ModuleCode,ModuleCoordinator,Year,ModuleName,Teacher,InternalModerator,ExternalModerator,ExamVetting ) values('" + ModuleCode + "','" + ModuleCoordinator + "','" + Year+ "','" + ModuleName+ "','"+Teacher+"','"+InternalModerator+"','"+ExternalModerator+"', '"+ExamVetting+"'       )";  
           
                      
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

    

    </body>
  
</html>
