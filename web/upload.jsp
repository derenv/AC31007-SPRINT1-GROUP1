<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%> 

<%@page contentType="text/html" %>
<%@include file="session_check.jsp" %>
<%@ page import="db.file_handler" %>
<!DOCTYPE html>

<html>
    <%
        file_handler handle = new file_handler();
        try{
            handle.file_upload(request,response,session);
        }catch(IOException ff){
            session.setAttribute("message", ff.getMessage());
            response.sendRedirect("error pages/feerror.jsp");
        }
    %>
</html>
