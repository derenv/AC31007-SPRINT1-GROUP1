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
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
	<!-- menu styles -->
	<link rel="stylesheet" type="text/css" href="css/component.css" />
        <title>Error Page</title>
    </head>
    <body>
        <h1>Sorry there has been a database error!</h1>
        <%
            String state = (String) session.getAttribute("state");
            out.println("<h2>"+state+"</h2>");
            Object code = session.getAttribute("code");
            out.println("<h2>"+code+"</h2>");
            String message = (String) session.getAttribute("mess");
            out.println("<h2>"+message+"</h2>");
        %>
    </body>
</html>
