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
            if(x != null){
                out.println("<h2>"+x[0]+"</h2>");
                out.println("<h2>"+x[1]+"</h2>");
                out.println("<h2>"+x[2]+"</h2>");
                out.println("<h2>"+x[3]+"</h2>");
                out.println("<h2>"+x[4]+"</h2>");
            }
        %>
    </head>
    <header>
        <div class="content"><img src="img/UoDlogo.jpg"/></div>
    </header>
    <body>
        <h1 style="text-align: center;">A file already Exists for this Module</h1>
    </body>
</html>
