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
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    </head>
    <body>
        
      
     
        
        <%
            //get user from implicit session object
            String username2 = (String) session.getAttribute("username");
       %>    
        <br/>
                     
                    
        <div class="main">

                <!-- Progress bar HTML -->
            <div class="progress progress-striped active">
                <div class="progress-bar"></div>
            </div>

            <!-- jQuery Script -->
            <script type="text/javascript">
             
               var i = 5;
                function makeProgress() {
                    if (i === 1) {
                        j = 12.5;
                        $(".progress-bar").css("width", j + "%").text("Teacher");
                    } else if (i === 2) {
                        j = 25;
                        $(".progress-bar").css("width", j + "%").text("Internal Moderator");
                    } else if (i === 3) {
                        j = 37.5;
                        $(".progress-bar").css("width", j + "%").text("Teacher Review");
                    } else if (i === 4) {
                        j = 50;
                        $(".progress-bar").css("width", j + "%").text("Exam Vetting Committee");
                    } else if (i === 5) {
                        j = 62.5;
                        $(".progress-bar").css("width", j + "%").text("Teacher Review");
                    } else if (i === 6) {
                        j = 75;
                        $(".progress-bar").css("width", j + "%").text("External Examiner");
                    } else if (i === 7) {
                        j = 87.5;
                        $(".progress-bar").css("width", j + "%").text("Teacher Review");
                    } else if (i === 8) {
                        j = 100;
                        $(".progress-bar").css("width", j + "%").text("School Office");
                    }
                    // Wait for sometime before running this script again
                 
                }
                makeProgress()
            </script>

        

            
        </div>
                
       
        </br>   
   
    </body>
</html>