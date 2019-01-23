<%-- 
    Document   : login
    Created on : 22 Jan 2019, 17:30:40
    Author     : deren vural
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Enumeration"%>
<%@ page import="db.login" %>

<!DOCTYPE html>
<html>
    <%
        //get post params
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        //check if stored in database
        login log1 = new login();
        String type = log1.check_valid_details(username,password);
        if(type == null){
            //null value
	    out.println("null value");
            response.sendRedirect("error.jsp");
        }else if ("Teacher".equals(type)){
            response.sendRedirect("HTML/teacherDash.html");
        }else if ("Admin".equals(type)){
            response.sendRedirect("HTML/adminDash.html");
        }else if ("ExternalMod".equals(type)){
            response.sendRedirect("HTML/externalModDash.html");
        }else if ("InternalMod".equals(type)){
            response.sendRedirect("HTML/internalModDash.html");
        }else if ("ExternalVet".equals(type)){
            response.sendRedirect("HTML/examVettingDash.html");
        }else{
            //invalid value
	    out.println("other valye");
            response.sendRedirect("error.jsp");
        }
    %>
</html>
