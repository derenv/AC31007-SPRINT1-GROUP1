<%-- 
    Document   : viewExams
    Created on : 23-Jan-2019, 20:26:15
    Author     : finntorbet

    

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/style2.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

    <header>
        <ul>
            <li>
                <div class="blur"><img src="img/UoDlogo.jpg"/></div>
            </li>
        </ul>
    </header>
    <div class="sidebar">
        <ul>
            <li><h2>Account Name</h2></li>
            <br>
            <li><a href="#">Add New Exam</a></li>
            <li><a href="#"><b>View Exams</b></a></li>
            <li><a href="#">Exam Progress</a></li>
            <li><a href="#">Complete</a></li>
            <br>
            <br>
            <div class="signout"><li><a href='#'>Sign out</a></li></div>



        </ul>
    </div>
    <body>
        <form action="../Source Packages/controller/readPDF.java" method="post">
            <c:forToken var="i" items="${module}">
                <div class="blur"><img src="img/pdf.png"/></div>
                Module <c:out value = "${i}"/>
                
                <input tpe="submit" value="${i}">
                <br>
            </c:forToken>>
        </form>  
    </body>
</html>