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
      
      <li><a href="admintoexam.jsp">Admin edit exam</a></li> 
      
      
    <li><a href="accountDetails.jsp">Account Details</a></li>
    <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
    
    
    
  </ul>
</div>
        <%

       java.util.Date date=new java.util.Date();   
        String datetime=new Timestamp(date.getTime()).toString();  
  
       String Username=request.getParameter("Username");    
        
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
              
         String query_sql = "select * from users where Username='"+Username.trim()+"' " ;  
   
            
            try {   
                ResultSet rs = stmt.executeQuery(query_sql);     
                while(rs.next()) {           
                    
            session.setAttribute("Username",rs.getString("Username"));
            session.setAttribute("UserID",rs.getString("UserID"));
            session.setAttribute("Mod1",rs.getString("Module1"));
            session.setAttribute("Mod2",rs.getString("Module2"));
            session.setAttribute("Mod3",rs.getString("Module3"));
            session.setAttribute("Mod4",rs.getString("Module4"));
                    %>     
    
                    <table border="1">
                    
                   <tr>
                       <th>  User name</th>
                       <th> Password</th>
                        <th>    User ID</th>
                         <th>Module1 </th>
                          <th>Module2 </th>
                           <th>Module3 </th>                  
                            <th>Module4 </th>
                   </tr>
                   
                   <tr>
                        
                   <td>   <%=rs.getString("Username")%>  </td>
                   <td> <%=rs.getString("Password")%> </td>
                  <td>  <%=rs.getString("UserID")%> </td>
                  <td>  <%=rs.getString("Module1")%> </td>
                  <td>  <%=rs.getString("Module2")%> </td>
                  <td>  <%=rs.getString("Module3")%> </td>
                 <td>   <%=rs.getString("Module4")%>  </td>
 
                   </tr>
                               
                   </table>
                    
                    <%  
                }      
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
        <br>  
        <br>
    <form action="update.jsp" method="post">
     User name &nbsp   
     <input name="username"  type ="text"><br>
    User  ID &nbsp   
   <select name="userid"  type ="text">
      <option value="Admin">Admin</option>
      <option value="ExternalMod">ExternalMod</option>
      <option value="InternalMod">InternalMod</option>
      <option value="Teacher">Teacher</option>
      <option value="Exam_Vetting_Committee">Exam Vetting Committee</option>
  </select>
    <br>
    Module 1  &nbsp 
  <input name="mod1"  type ="text"><br>
    Module 2  &nbsp 
  <input name="mod2"  type ="text"><br>
    Module 3  &nbsp 
  <input name="mod3"  type ="text"><br>
    Module 4  &nbsp 
  <input name="mod4"  type ="text"><br>
  
 
  
  <input name="submit"  type ="submit"  value="submit"  >
  

        </form>
        
 
    </body>
    
    
    
    
    
    
</html>
