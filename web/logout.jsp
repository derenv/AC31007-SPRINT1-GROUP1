<%-- 
    Document   : logout
    Created on : 25 Jan 2019, 10:37:34
    Author     : deren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        session.invalidate();
        response.sendRedirect("HTML/index.jsp");
    %>
</html>
