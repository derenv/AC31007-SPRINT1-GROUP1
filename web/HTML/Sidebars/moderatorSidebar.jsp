<%-- 
    Document   : moderatorSidebar
    Created on : 28-Jan-2019, 15:58:23
    Author     : sarahsmall

This is the sidebar file that is included for all moderator web pages
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <header>
        <div class="content"><img src="../img/UoDlogo.jpg"/></div>
    </header>
    <body>
        <div class="main">
            <div class="sidebar">
                <br><br>
                <ul>
                    <li><p><u>Exams</U></p></li>
                    <li><a href="../new">New</a></li>
                    <li><a href="#">In Progress</a></li>
                    <li><a href="#">Completed</a></li><br>
                    <li><p><u>Other</u></p></li>
                    <li><a href="#">Account Details</a></li>
                    <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
                </ul>
            </div>
        </div>
    </body>
</html>
