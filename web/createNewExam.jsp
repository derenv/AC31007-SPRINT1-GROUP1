
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="session_check.jsp" %>
<%
    String username2 = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
 <head>
 <link rel="stylesheet" type="text/css" href="css/Style.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<header>
  <ul>
    <li>
      <div class="blur"><img src="img/UoDlogo.jpg"/></div>
    </li>
  </ul>
  </header>
<body>
<div class="main">
    <h2>Create a new exam</h2>
        <form action="createInsert.jsp" method="post">
             <h3>Details</H3>
    module code &nbsp   
  <input name="moduleCode"  type ="text"> <br/>
    year &nbsp  
  <input name="year"  type ="text"><br/>
    module name &nbsp  &nbsp 
  <input name="moduleName"  type ="text"><br/>
    module coordinator  &nbsp 
  <input name="modCoord"  type ="text"><br/>
  <h3>Files</H3>
  
    Main Exam  &nbsp 
  <input name="mainExam"  type ="file"><br/>
    Solutions(Main)  &nbsp 
  <input name="solMain"  type ="file"><br/>
    Resit Exam  &nbsp 
  <input name="resitExam"  type ="file"><br/>
    Solutions (Resit)  &nbsp 
  <input name="solResit"  type ="file"><br/>
  
  
  <input name="submit"  type ="submit"  value="submit"style="float: right;background-color: rgb(67,101,226);border: none;color:white;
                        padding: 10px 12px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;"  ><br/>
  
<!---
        </form>
        <form action="uploadTeacher.jsp" method="post" enctype="multipart/form-data">
            <b>Select Main Exam</b>   
            <input type="file" name="fname1"><br/>
            
              <b>Select Main Exam Soultions:</b>   
            <input type="file" name="fname2"><br/>
            
            <b>Select Resit Exam:</b>   
            <input type="file3" name="fname3"><br/>
            
              <b>Select Resit Solutions:</b>   
            <input type="file4" name="fname4"><br/>
            
           
       
           <input type="submit" value="Upload">
        </form>  
-->
 
     




<div class="sidebar">
  <ul>
    <li><h2>Hello, <% out.println(username2); %></h2></li>
    <br>
   
    <li><a href="../trial.jsp">My Modules</a></li>
   
    <li><a href="viewPDF.jsp">View uploaded Exams</a></li>
    <li><a href="#">Edit my Exams</a></li>
    <li><a href="#">View Exam Progress</a></li>
    <li><a href="#">Account Details</a></li>
    <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
  </ul>
</div>
</body>
</html>