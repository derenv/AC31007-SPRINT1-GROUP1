<%@page import="db.gett1"%>
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
</head>

<header>
  
    
      <div class="content"><img src="../img/UoDlogo.jpg"/></div>
    
  
  </header>
<body>
<div class="main">

    <center><br><br><br><br><br><br>
            <table>
                <tr>
                
                    </td>
                </tr>
                <tr>
                    <td class="bLeft"><img src="../img/folder.png" height="256" width="256">
                    </td>
                    <td class="middle"><img src="../img/folder.png" height="256" width="256">
                    </td>
                    <td class="bRight"><img src="../img/folder.png" height="256" width="256">
                    
                </tr>
                 <tr>
                    <td class="bLeft"><a href="#">New</a>
                    </td>
                    <td class="middle"><a href="#">In progress</a>
                    </td>
                    <td class="bRight"><a href="#">Completed</a>
                    
                </tr>
                <tr>
            </table></center>
     




<div class="sidebar">
  <ul>
    <li><h2> <% out.println(username2); %> (Internal Moderator)</h2></li>
   
  
   
    
    <li><p><u>Exams</U></p></li>
    <li><a href="#">New</a></li>
    <li><a href="#">In Progress</a></li>
    <li><a href="#">Completed</a></li><br>
    <li><p><u>Other</u></p></li>
    <li><a href="../accountDetails.jsp">Account Details</a></li>
    <div class="signout"><li><a href='../logout.jsp'>Sign out</a></li></div>
  </ul>
</div>
</body>
</html>


