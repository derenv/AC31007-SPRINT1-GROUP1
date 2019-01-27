
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
        <form action="" method="post">
             <h3>Details</H3>
    module code &nbsp   
  <input name="moduleCode"  type ="text"> <br/>
    year &nbsp  
  <input name="year"  type ="password"><br/>
    module name &nbsp  &nbsp 
  <input name="moduleName"  type ="text"><br/>
    module coordinator  &nbsp 
  <input name=""  type ="text"><br/>
  <h3>Files</H3>
  
    Main Exam  &nbsp 
  <input name="mainExam"  type ="text"><br/>
    Solutions(Main)  &nbsp 
  <input name="solMain"  type ="text"><br/>
    Resit Exam  &nbsp 
  <input name="resitExam"  type ="text"><br/>
    Solutions (Resit)  &nbsp 
  <input name="resitExam"  type ="text"><br/>
  
  <input name="submit"  type ="submit"  value="submit"style="float: right;background-color: rgb(67,101,226);border: none;color:white;
                        padding: 10px 12px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;"  ><br/>
  

        </form>

 
     




<div class="sidebar">
  <ul>
    <li><h2>Hello, <% out.println(username2); %></h2></li>
    <br>
   
    <li><a href="../trial.jsp">My Modules</a></li>
   
    <li><a href="#">View uploaded Exams</a></li>
    <li><a href="#">Edit my Exams</a></li>
    <li><a href="#">View Exam Progress</a></li>
    <li><a href="#">Account Details</a></li>
    <div class="signout"><li><a href='../logout.jsp'>Sign out</a></li></div>
  </ul>
</div>
</body>
</html>