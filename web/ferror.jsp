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
        <%
            Object[] x = (Object[]) session.getAttribute("parameters");
            out.println("<h2>"+x[0]+"</h2>");
            out.println("<h2>"+x[1]+"</h2>");
            out.println("<h2>"+x[2]+"</h2>");
            out.println("<h2>"+x[3]+"</h2>");
            out.println("<h2>"+x[4]+"</h2>");
        %>
    </head>
    <body>
        <h1>Sorry there has been a file handling error!</h1>
    </body>
</html>
