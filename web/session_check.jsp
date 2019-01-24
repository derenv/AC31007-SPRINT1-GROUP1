<%-- 
    Document   : login
    Created on : 22 Jan 2019, 17:30:40
    Author     : deren vural
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%
        //get session and check username not null
	String username = (String) session.getAttribute("username");
	if(username == null){
            response.sendRedirect("index.jsp");
	}
    %>
</html>
