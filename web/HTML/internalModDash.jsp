
<!--
This is the internal moderator dashboard, this is first stage in exam review after the exam setter (teacher) has created the exam.
@include file="../session_check.jsp" 
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%    String username2 = (String) session.getAttribute("username");
%>
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
                <li><a href="../myModules.jsp">My Modules</a></li>
                <li><a href="../viewExams.jsp">View uploaded Exams</a></li>
                <li><a href="../accountDetails.jsp">Account Details</a></li>


                <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
            </ul>
        </div>
  
    
        </div>
        
        
    </body>
</html>


