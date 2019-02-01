<%-- 
    Document   : admintoexam
    Created on : 31-Jan-2019, 12:19:54
    Author     : zhendongliu
--%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  
<%@ page contentType="text/html;"%>  


<!DOCTYPE html>
<html>
    
 <head>
 <link rel="stylesheet" type="text/css" href="css/Style.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<header>
      <div class="content"><img src="img/UoDlogo.jpg"/></div>
</header>

    <body>
<div class="main">
<div class="sidebar">
  <ul>
    <br>
      <li><a href="createusers.jsp">Create user </a></li>
      <li><a href="choose.jsp">Edit user</a></li>
      <li><a href="admintoexam.jsp">Edit Exam</a></li>  
     <li><a href="AdminAccount.jsp">Account Details</a></li>
    <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
  </ul>
</div></div>
    
        <%
String  ModuleCode =request.getParameter("ModuleCode");  
String  ModuleCoordinator =request.getParameter("ModuleCoordinator");  
String  Year=request.getParameter("Year");           
String  ModuleName =request.getParameter("ModuleName");   
String  Teacher =request.getParameter("Teacher");   
String  InternalModerator =request.getParameter("InternalModerator");   
String  ExternalModerator =request.getParameter("ExternalModerator");   
String  ExamVetting =request.getParameter("ExamVetting");   
 


java.util.Date date=new java.util.Date();   
String datetime=new Timestamp(date.getTime()).toString();  
        try   
        {   
            String driverName = "com.mysql.jdbc.Driver"; 
            String DBUser = "18agileteam1"; 
            String DBPasswd = "7845.at1.5487"; 
            String DBName = "18agileteam1db"; 
          
            String connUrl = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/" + DBName + "?user=" + DBUser + "&password=" + DBPasswd;  
            Class.forName(driverName).newInstance();  
            Connection conn = DriverManager.getConnection(connUrl);  
            Statement stmt = conn.createStatement();  
            stmt.executeQuery("SET NAMES UTF8");          
           
             String query_sql = "select * from exams";  

              %>   
               
        <div class="main"   >
            <br><br>
        <table  border="1" >  
      
        <tr>            
	<th>Module Code</th>
	<th>Module Coordinator</th>
	<th>Year</th>
	<th>Module Name</th>
	<th>Teacher</th>
	<th>Internal Moderator</th>
	<th>External Moderator</th>
        <th>Exam Vetting</th>
        <th>Stage</th>
        <th>Edit</th>
        <th>Update/Delete</th>
	</tr>
    
    
        
             <%
            try {   
                ResultSet rs = stmt.executeQuery(query_sql);     
                while(rs.next()) {       
             %>     
      
                <tr>
                    <td> <%=rs.getString("ModuleCode")%> </td>  
                    <td> <%=rs.getString("ModuleCoordinator")%> </td> 
                    <td> <%=rs.getString("Year")%>  </td>  
                    <td> <%=rs.getString("ModuleName")%> </td>   
                    <td> <%=rs.getString("Teacher")%> </td>   
                    <td> <%=rs.getString("InternalModerator")%> </td>  
                    <td> <%=rs.getString("ExternalModerator")%> </td>  
                    <td> <%=rs.getString("ExamVetting")%> </td> 
                    <td> <%=rs.getString("Stage")%> </td> 
                    <td> <%=rs.getString("Edit")%> </td> 
                    <td> 
                       <button>   <a href="admintoexam.jsp?ModuleCode=<%=rs.getString("ModuleCode")%> &ModuleCoordinator=<%=rs.getString("ModuleCoordinator")%>&Year=<%=rs.getString("Year")%> &ModuleName=<%=rs.getString("ModuleName")%>&Teacher=<%=rs.getString("Teacher")%>&InternalModerator=<%=rs.getString("InternalModerator")%>&ExternalModerator=<%=rs.getString("ExternalModerator")%>&ExamVetting=<%=rs.getString("ExamVetting")%>">Update</a> </button>   
                       <button>   <a href="deleteExam.jsp?ModuleCode= <%=rs.getString("ModuleCode")%>">Delete</a> </button>
                    </td>
                </tr>   
<%  
                } 
%>

         </table>
<br>

  <center>  <button> <a href="adminCreateExam.jsp">Add an exam</a> </button></center> 
  
   <form action="adminUpdExam.jsp" method="post" style="padding:0px">
                <h1>Update Table</H1>
                Module code &nbsp 
                <input name="ModuleCode"  type ="text"  value="<%=request.getParameter("ModuleCode") %>"   >  <br/>
                Module Coordinator  &nbsp 
                <input name="ModuleCoordinator"  type ="text"   value="<%=request.getParameter("ModuleCoordinator") %>" ><br/>              
                Year &nbsp  
                <input name="Year"  type ="text"  value="<%=request.getParameter("Year") %>" ><br/>
                Module Name &nbsp  &nbsp 
                <input name="ModuleName"  type ="text"  value="<%=request.getParameter("ModuleName") %>" ><br/>
                Teacher &nbsp  &nbsp 
                <input name="Teacher"  type ="text"  value="<%=request.getParameter("Teacher") %>" ><br/>   
                Internal Moderator&nbsp  &nbsp 
                <input name="InternalModerator"  type ="text"  value="<%=request.getParameter("InternalModerator") %>" ><br/>   
                External Moderator &nbsp  &nbsp 
                <input name="ExternalModerator"  type ="text"  value="<%=request.getParameter("ExternalModerator") %>" ><br/>      
                Exam Vetting&nbsp  &nbsp 
                <input name="ExamVetting"  type ="text"  value="<%=request.getParameter("ExamVetting")%>" ><br/>   
           
       
                <input name="submit"  type ="submit"  value="submit"style="float: right;background-color: rgb(67,101,226);border: none;color:white;
                      padding: 10px 12px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;"  ><br/>
                
            </form>
  
              </div>

<%

            }


                 catch(Exception e) {  
                e.printStackTrace();  
            }   
                 
            stmt.close();                 
            conn.close();   
        }
          catch (Exception e) {  
                e.printStackTrace();  
        }   
%>   

        
 
    </body>
    
    
    
    
    
    
</html>
