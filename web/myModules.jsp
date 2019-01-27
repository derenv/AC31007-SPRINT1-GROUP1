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
 
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <%
            //get user from implicit session object
            String username2 = (String) session.getAttribute("username");%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/Style.css" />
    </head>
    <body>
        <header>
           
                    <div class="content"><img src="img/UoDlogo.jpg"/></div>
           
        </header>
        <div class="main"><h2>My modules</h2>
            <p>View all modules you are currently enrolled in.</p> 
         <div class="sidebar">
                <ul>
                    
                    <li><h2><% out.println(username2); %></h2></li>
                    <br>
                      <li><a href="myModules.jsp">My Modules</a></li>
                        <li><a href="createNewExam.jsp">Create a new Exam</a></li>
                        <li><a href="viewExams.jsp">View uploaded Exams</a></li>
                        <li><a href="editExam.jsp">Edit my Exams</a></li>
                        <li><a href="examProgress.jsp">View Exam Progress</a></li>
                        <li><a href="accountDetails.jsp">Account Details</a></li>
                    
             
                    <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
                </ul>
            </div></div>
        <%
            //get user from implicit session object
      
            
            java.util.Date date=new java.util.Date();
            String datetime=new Timestamp(date.getTime()).toString();
            
            try{
                //create connection
                conn connection_driver = new conn();
                Connection connection = connection_driver.connect();
                
                //create SQL query
                Statement stmt = connection.createStatement();
                stmt.executeQuery("SET NAMES UTF8");
                String query_sql =( "select * from exams where Teacher='"+username2+"'");
                
                //run statement and parse results
                try {
                    ResultSet rs = stmt.executeQuery(query_sql);     
                    while(rs.next()){
        %>     
        <br/>
                     
                    
        <div class="main">
            <table>
                <tr>
                
                    </td>
                </tr>
                <tr>
                    <td class="bLeft"><img src="img/pdflogo.jpg" height="100" width="100">
                    </td>
                    <td class="middle"><%=rs.getString("ModuleCode")%>
                    </td>
                    <td class="bRight"><%=rs.getString("ModuleCoordinator")%>
                    </td>
                    <td class="bRight"><%=rs.getString("ModuleName")%>
                    </td>
                </tr>
                <tr>
                </table>

            <div class="sidebar">
                <ul>
                    <li><h2><% out.println(username2); %></h2></li>
                    <br>
                        <li><a href="myModules.jsp">My Modules</a></li>
                        <li><a href="createNewExam.jsp">Create a new Exam</a></li>
                        <li><a href="viewExams.jsp">View uploaded Exams</a></li>
                        <li><a href="editExam.jsp">Edit my Exams</a></li>
                        <li><a href="examProgress.jsp">View Exam Progress</a></li>
                        <li><a href="accountDetails.jsp">Account Details</a></li>
                    
                    <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
                </ul>
            </div>
        </div>
                
       
        </br>   
        <%
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }   
                
                stmt.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        %>
    </body>
</html>