<%-- 
    Document   : test.jsp
    Created on : 24-Jan-2019, 19:12:18
    Author     : sarahsmall

    Document   : updateuser
    Created on : 24-Jan-2019, 17:19:54
    Author     : zhendongliu
--%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  
<%@ page import="db.conn" %>
<%@include file="session_check.jsp" %>
<%@include file="sidebarTeacher.jsp" %>
 
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        
        <div class="main"><h2>Exam Progress</h2>
            <p>Check what stage your exam is at:</p>  <p style="color:green">Complete</p>
        <p style="color:orange">In progress</p>
        <p style="color:red">Stage not reached</p></div>
        
     
        
        <%
            //get user from implicit session object
            String username2 = (String) session.getAttribute("username");
       %>    
        <br/>
                     
                    
        <div class="main">
            <p>Example: AC12322</P>
            <div class="stage1">
                <P style="background-color:green; padding:10px;">uploaded</P>
            </div>
            <div class="stage2"><P style="background-color:green; padding:10px;">uploaded</P></div>
            
            <div class="stage3"><P style="background-color:green; padding:10px;">internal moderator</P></div>
            <div class="stage4"><P style="background-color:green; padding:10px;">exam vetting</P></div>
            <div class="stage5"><P style="background-color:orange; padding:10px;">external examiner</P></div>
            <div class="stage6"><P style="background-color:red; padding:10px;">complete</P></div>
            
        

            
        </div>
                
       
        </br>   
   
    </body>
</html>