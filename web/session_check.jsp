<%-- 
    Document   : session_check.jsp
    Created on : 24 Jan 2019, 12:52:00
    Author     : deren vural
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%
        //get session and check username not null
	String username = (String) session.getAttribute("username");
	if(username == null){
            response.sendRedirect("/2018-agileteam1/index.jsp");
	}
    %>
</html>
