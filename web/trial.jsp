<%-- 
    Document   : test.jsp
    Created on : 24-Jan-2019, 19:12:18
    Author     : sarahsmall
--%>

<%@page import="db.gett1"%>
<%
    String username2 = (String) session.getAttribute("username");
    gett1 object1;
    object1 = new gett1();
    String test1 = object1.method1();
    out.println(test1);
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    </body>
</html>
