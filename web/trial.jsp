<%-- 
    Document   : test.jsp
    Created on : 24-Jan-2019, 19:12:18
    Author     : sarahsmall
--%>
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
    <head> <link rel="stylesheet" type="text/css" href="css/Style.css" /></head>
    <body >
        <header>
  <ul>
    <li>
      <div class="blur"><img src="img/UoDlogo.jpg"/></div>
    </li>
  </ul>
  </header>
        
   <%   

   
    String username2 = (String) session.getAttribute("username");
    


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
           
         String query_sql =( "select * from exams where Teacher='"+username2+"'");
            
            try {   
                ResultSet rs = stmt.executeQuery(query_sql);     
                while(rs.next()) {  
                    %>     
    <br/>
                   
                    
                 <div class="main">
                      <table>
      <tr>
          <td class="bTop" colspan="3">
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
    <li><h2>Account Name</h2></li>
    <br>
    <li><a href="#">Required</a></li>
    <li><a href="../trial.jsp">My Modules</a></li>
    <li><a href="#">In Progress</a></li>
    <li><a href="#">Complete</a></li>
    <br>
    <br>
    <div class="signout"><li><a href='#'>Sign out</a></li></div>
  </ul>
</div></div>
                
       
                    </br>   
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
        
        
        
 
    </body>
    
    
    
    
    
    
</html>