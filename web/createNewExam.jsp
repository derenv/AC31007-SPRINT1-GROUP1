
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="session_check.jsp" %>
<%@include file="sidebarTeacher.jsp" %>


<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  
<%@ page import="db.conn" %>

<%    String username2 = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    
    
    
    <body>
        
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
                        Statement stmt2 = connection.createStatement();
                        stmt2.executeQuery("SET NAMES UTF8");
                        String query_sql2 =( "select * from pdf where Mod_code='"+rs.getString("ModuleCode")+"'");
                        ResultSet rs2 = stmt2.executeQuery(query_sql2); 
                        rs2.next();
        %>              
        <br/>
                   
                    
        <div class="main">
          
            <table  border = "1" width = "100%">
                
              <tr>
            <th>   </th>
            <th>Module Code</th>
            <th>Module ID</th>
            <th>Year</th> 
            <th>Module Coordinator</th>    
            <th>Module Name</th>    
            <th>Author</th>
           <th>Improve</th>
         </tr>
                <tr>
                    <td class="bLeft"><img src="img/pdflogo.jpg" height="100" width="100">
                    </td>
                    <td class="middle"><%=rs.getString("ModuleCode")%>
                    </td>
                     <td class="middle"><%=rs.getString("ModuleID")%>
                    </td>
                      <td class="middle"><%=rs.getString("Year")%>
                    </td>                     
                    <td class="bRight"><%=rs.getString("ModuleCoordinator")%>
                   </td>
                    <td class="bRight"><%=rs.getString("ModuleName")%>
                    </td>
                    <td class="bRight"><%=rs2.getString("Author") %>
                    </td>
                    <td>  <button> <a href="createNewExam.jsp">Create</a> </button></td>
                </tr>
                <tr>
                    <td class="middle">EXAM PROGRESS
                        </td>
                </tr>
                
                
             
            </table>
            <br>
           
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
        

        
        
        <div class="main">
            <h2>Create a new exam</h2>
            <p>Please fill in the details for the exam and add the files(PDF format only) to be uploaded.</p>
            <form action="createInsert.jsp" method="post" style="padding:0px">
                <h3>Details</H3>
                Module code &nbsp   
                <input name="moduleCode"  type ="text"> <br/>
                Year &nbsp  
                <input name="year"  type ="text"><br/>
                Module Name &nbsp  &nbsp 
                <input name="moduleName"  type ="text"><br/>
                Module Coordinator  &nbsp 
                <input name="modCoord"  type ="text"><br/>
                <h3>Files</H3>

                Main Exam  &nbsp <!--type in table main-->
                <input name="mainExam"  type ="file"><br/>
                Solutions(Main)  &nbsp <!--type in table main sol-->
                <input name="solMain"  type ="file"><br/>
                Resit Exam  &nbsp <!--type in table resit-->
                <input name="resitExam"  type ="file"><br/>
                Solutions (Resit)  &nbsp <!--type in table resit sol-->
                <input name="solResit"  type ="file"><br/>


                <input name="submit"  type ="submit"  value="submit"style="float: right;background-color: rgb(67,101,226);border: none;color:white;
                       padding: 10px 12px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;"  ><br/>

                <!---
                </form>
                <form action="uploadTeacher.jsp" method="post" enctype="multipart/form-data">
                    <b>Select Main Exam</b>   
                    <input type="file" name="fname1"><br/>
                    
                      <b>Select Main Exam Soultions:</b>   
                    <input type="file" name="fname2"><br/>
                    
                    <b>Select Resit Exam:</b>   
                    <input type="file3" name="fname3"><br/>
                    
                      <b>Select Resit Solutions:</b>   
                    <input type="file4" name="fname4"><br/>
                    
                   
               
                   <input type="submit" value="Upload">
                </form>  
                -->






                
                </div>
                </body>
                </html>
