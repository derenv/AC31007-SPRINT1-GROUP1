
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../session_check.jsp" %>


<%
    String username2 = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
 <head>
 <link rel="stylesheet" type="text/css" href="../css/Style.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>




<header>
 
      <div class="content"><img src="../img/UoDlogo.jpg"/></div>
    
  
  </header>



<body>
<div class="main">
<div class="sidebar">
    
  <ul>
    <li><h2>Hello, <% out.println(username2); %></h2></li>
    <br>

      
    <br>
     
       <li><a href="../createusers.jsp">Create user </a></li>
      <li><a href="../choose.jsp">Edit user </a></li>   
      <li><a href="../admintoexam.jsp">Admin edit Exam</a></li> 
      
     <li><a href="../AdminAccount.jsp">Account Details</a></li>
    <div class="signout"><li><a href='../logout.jsp'>Sign out</a></li></div>
    
    
    
  </ul>
</div>
</body>
</html>



