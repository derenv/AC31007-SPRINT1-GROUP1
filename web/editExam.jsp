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
    <%
            //get user from implicit session object
            String username3 = (String) session.getAttribute("username");%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <div class="main"> <h1>Edit/Review Exams</h1>
            <p>Upload revised exams and read the comments from moderators, to check which stage an exam is in please click 
            on view exam progress</p>   
        </div></div>
        
        <%
            //get user from implicit session object
       
            String username2 = (String) session.getAttribute("username");
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
                        Statement stmt2 = connection.createStatement();
                        stmt2.executeQuery("SET NAMES UTF8");
                        String query_sql2 =( "select Pdf_path from pdf where Mod_code='"+rs.getString("ModuleCode")+"'");
                        ResultSet rs2 = stmt2.executeQuery(query_sql2); 
                        rs2.next();
        %>              
        <br/>
                   
                    
        <div class="main">
          
            <table>
                <tr>
                    <!--<td class="bTop" colspan="3">-->
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
                    <td class="bRight"><a href="<%=rs2.getString("Pdf_path") %>">Upload</a>
                        
                    </td> 
                     </td>
                    <td class="bRight"><a href="#">Comments</a>  
                    </td> 
                </tr>
                <tr>
            </table>

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