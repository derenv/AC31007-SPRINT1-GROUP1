<%-- 
    Document   : sidebarTeacher
    Created on : 28-Jan-2019, 15:38:20
    Author     : finntorbet

    A template class with the sidebar and header to be included in all teacher 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

                <br> <br>
                <li><a href="myModules.jsp">My Modules</a></li>
                <li><a href="createNewExam.jsp">Create a new Exam</a></li>
                <li><a href="viewExams.jsp">View uploaded Exams</a></li>
                <li><a href="editExam.jsp">Edit my Exams</a></li>
                <li><a href="accountDetails.jsp">Account Details</a></li>


                <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
            </ul>
        </div>
    </div>
</body>

