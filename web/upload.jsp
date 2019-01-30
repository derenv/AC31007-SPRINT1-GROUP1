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
            response.sendRedirect("ferror.jsp");
        }
    %>
    <a href="uploadindex.jsp">back</a>  <br/>
    <a href="connection.jsp"> view data </a>   <br/>
    <a href="Source Packages/ListFileServlet" >download the file</a>    <br/>
</html>
