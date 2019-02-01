<%-- 
    Document   : externalModDash.jsp
    Author     : sarahsmall
--%>
<%@include file="../jsp/session_check.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <center>
                <br><br><br><br><br><br>
                <table>
                    <tr>
                        <td class="bLeft"><img src="../img/folder.png" height="256" width="256">
                        </td>
                        <td class="middle"><img src="../img/folder.png" height="256" width="256">
                        </td>
                        <td class="bRight"><img src="../img/folder.png" height="256" width="256">
                    </tr>
                    <tr>
                        <td class="bLeft"><a href="../new.jsp">My Modules</a>
                        </td>
                        <td class="middle"><a href="../review.jsp">To Review</a>
                        </td>
                        <td class="bRight"><a href="#">Completed</a>
                    </tr>
                    <tr>
                </table>
            </center>
            <div class="sidebar">
                <ul>
                    <br>
                    <li><a href="../new.jsp">My Modules</a></li>
                    <li><a href="">View Exams</a></li>
                    <li><a href="../review.jsp">Send Review</a></li>
                    <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
                </ul>
            </div>
        </div>
    </body>
</html>

