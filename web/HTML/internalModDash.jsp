
<!--
This is the internal moderator dashboard, this is first stage in exam review after the exam setter (teacher) has created the exam.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../session_check.jsp" %>
<%@include file="../moderatorSidebar.jsp" %>
<%    String username2 = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

   
    <body>
        <div class="main">

            <center><br><br><br><br><br><br>
                <table>
                    <tr>
                        <td class="bLeft"><img src="../img/folder.png" height="256" width="256">
                        </td>
                        <td class="middle"><img src="../img/folder.png" height="256" width="256">
                        </td>
                        <td class="bRight"><img src="../img/folder.png" height="256" width="256">
                    </tr>
                    <tr>
                        <td class="bLeft"><a href="../new.jsp">New</a>
                        </td>
                        <td class="middle"><a href="#">In progress</a>
                        </td>
                        <td class="bRight"><a href="#">Completed</a>
                    </tr>
                    <tr>
                </table>
            </center>
        </div>
    </body>
</html>


