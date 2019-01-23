<%-- 
    Document   : login
    Created on : 22 Jan 2019, 17:30:40
    Author     : deren vural
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<%@ page import="db.login" %>

>>>>>>> 8ed8959884a77a3e02fb6dc3f3a8fb033bf3bb97
<!DOCTYPE html>
<html>
    <%
        //get post params
        String username = request.getParameter("t1");
        String password = request.getParameter("t2");
        
        //check if stored in database
        login log1 = new login();
        String type = log1.check_valid_details(username,password);
        if(type == null){
            //null value
	    out.println("null values");
            //response.sendRedirect("error.jsp");
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
	    out.println("else reached");
	    out.println("'"+username+"'          '"+password+"'");
            //response.sendRedirect("error.jsp");
        }
    %>
</html>
