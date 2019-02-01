<%-- 
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
      <li><a href="choose.jsp">Edit user </a></li>    
      <li><a href="admintoexam.jsp">Edit Exam</a></li>      
    <li><a href="AdminAccount.jsp">Account Details</a></li>
    <div class="signout"><li><a href="logout.jsp">Sign out</a></li></div>
    
    
    
  </ul>
</div></div>
    
        <%

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
           
         String query_sql = "select * from users";  

              %>   
              <div class="main" style="position:fixed;top:80px;left:80px;"><br><br>
        <table  border="1" >  
        <tr style="text-align: center;">       
           
	<th>User name</th>
	<th>Password</th>
	<th>User ID </th>
	<th>Module 1</th>
	<th>Module 2</th>
	<th>Module 3</th>
	<th>Module 4</th>
        <th>Function</th>
	</tr>
                   
             <%
            try {   
                ResultSet rs = stmt.executeQuery(query_sql);     
                while(rs.next()) {       
             %>     
      
                <tr>
                    <td> <%=rs.getString("Username")%> </td>  
                    <td> <%=rs.getString("Password")%> </td> 
                    <td> <%=rs.getString("UserID")%>  </td>  
                    <td> <%=rs.getString("Module1")%> </td>   
                    <td> <%=rs.getString("Module2")%> </td>   
                    <td> <%=rs.getString("Module3")%> </td>  
                    <td> <%=rs.getString("Module4")%> </td>   
                    <td>  <button>   <a href="edituser.jsp?Username= <%=rs.getString("Username")%> "> Update</a> </button>   
                       <button>   <a href="deleteuser.jsp?Username= <%=rs.getString("Username")%> "> Delete</a> </button>
                    </td>
                </tr>   
<%  
                } 
%>
                  </table>
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
        
        
</div>

 
    </body>
    
    
    
    
    
    
</html>
