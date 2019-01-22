<%-- 
    Document   : welcome
    Created on : 22-Jan-2019, 12:56:13
    Author     : sarahsmall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
	<!-- menu styles -->
	<link rel="stylesheet" type="text/css" href="css/component.css" />
        <title>Welcome</title>
    </head>
    <body>
        <h1>Welcome you have logged in!</h1>
    </body>
</html>
<% response.sendRedirect("HTML/teacherDash.html");%>