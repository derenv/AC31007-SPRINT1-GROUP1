<%-- 
    Document   : error
    Created on : 22-Jan-2019, 14:23:10
    Author     : sarahsmall
--%>

<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/style2.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
	<!-- menu styles -->
	<link rel="stylesheet" type="text/css" href="css/component.css" />
        <title>Error Page</title>
    </head>
    <header>
        <div class="content"><img src="img/UoDlogo.jpg"/></div>
    </header>
      <h2 style="text-align: left; padding-top: 100px; color:#2a2b30;">Sorry there has been a database error!</h2>
    <body  style="text-align: center;">
        
        <p>Sorry There has been a Database error.</p>
        <%
            String state = (String) session.getAttribute("state");
            out.println("<h2>"+state+"</h2>");
            Object code = session.getAttribute("code");
            out.println("<h2>"+code+"</h2>");
            String message = (String) session.getAttribute("mess");
            out.println("<h2>"+message+"</h2>");
        %>
        <a style="text-align:center;color: rgb(67,101,226); font-size: 25px; padding-top: 100px;" href="index.jsp">Go Back</a>
    </body>
</html>
