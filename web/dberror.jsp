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
            String e = (String) session.getAttribute("databasestatus");
            out.println("<h2>SQL Database State: "+e+"</h2>");
            String el = Integer.toString((int)session.getAttribute("cause"));
            out.println("<h2>error code: "+el+"</h2>");
            String ed = (String) session.getAttribute("username");
            out.println("<h2>attempted user: "+ed+"</h2>");
            //String ef = (String) session.getAttribute("password");
            //out.println("<h2>pswd: "+ef+"</h2>");
        %>
    </body>
</html>
