<%-- 
    Document   : admintoexam
    Created on : 31-Jan-2019, 12:21:59
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
    
<head>
 <link rel="stylesheet" type="text/css" href="css/Style.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
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
      <li><a href="choose.jsp">Change user </a></li>
      
      <li><a href="admintoexam.jsp">Admin edit exam</a></li> 
      
      
    <li><a href="accountDetails.jsp">Account Details</a></li>
    
    <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
    
    
    
  </ul>
</div>
    
    
    
</body>
</html>



