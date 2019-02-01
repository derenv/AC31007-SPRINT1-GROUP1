<%-- 
    Document   : newjsp
    Created on : 29-Jan-2019, 19:43:27
    Author     : sarahsmall
--%>

<%@page import="db.viewExams"%>
<%@page import="db.file_handler"%>
<%@page import="java.io.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Exam</title>
    </head>
    <body>
        <%
            file_handler handle = new file_handler();
            try{
                handle.file_download(request,response,session);
            }catch(IOException ff){
                session.setAttribute("message", ff.getMessage());
                response.sendRedirect("error pages/feerror.jsp");
            }
        %>
    </body>
</html>
