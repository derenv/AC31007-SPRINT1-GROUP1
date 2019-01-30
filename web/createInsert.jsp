
<%@page import="java.util.Enumeration"%>
<%@ page import="db.login" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  


<html>
<%
String moduleCode=request.getParameter("moduleCode");
String year=request.getParameter("year");
String moduleName=request.getParameter("moduleName");
String modCoord=request.getParameter("modCoord");
String mainExam=request.getParameter("mainExam");
String resitExam=request.getParameter("resitExam");
String solMain=request.getParameter("solMain");
String solResit=request.getParameter("solResit");

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
            
            String insert_sql = "insert into pdf(ModuleCode,Exam, ExamSolution, Resit,ResitSolutions) values('" + moduleCode + "','" + mainExam+ "','"+ solMain+"','"+ resitExam+"','"+solResit+"')";  
           
        // String insert_sql = "insert into pdf (Mod_code,Pdf_path,Current_Stage,Edit)  values('AC32006','www.zhujiefan.com','0','0')";
           
           
       String query_sql = "select * from exams where ModuleCode= '" + moduleCode + "' ";  
         
            try {   
                stmt.execute(insert_sql);   
            }catch(Exception e)     {  
                e.printStackTrace();  
            }  
            
            try {   
                ResultSet rs = stmt.executeQuery(query_sql);    
                         
                while(rs.next()) { 
                    %>     
                 <table border="1">
                     <tr> 
                         <th> Module Code</th>
                         <th> Year</th>
                         <th> Module Name</th>
                         <th> Module Coordinator</th>
                         <th>Stage </th>      
                     </tr>
                     
                     <tr>
                      <td><%=rs.getString("ModuleCode")%>  </td>
                      <td><%=rs.getString("Year")%>   </td>
                      <td><%=rs.getString("ModuleName")%>  </td>
                      <td><%=rs.getString("ModuleCoordinator")%>  </td>   
                      <td><%=rs.getString("Stage")%>  </td>
                  
                     
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
</html>
