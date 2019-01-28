<%-- 
    Document   : test.jsp
    Created on : 24-Jan-2019, 19:12:18
    Author     : sarahsmall

    Document   : updateuser
    Created on : 24-Jan-2019, 17:19:54
    Author     : zhendongliu
--%>
<%@page import="db.viewExams"%>
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
            String username2 = (String) session.getAttribute("username");%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
        <div class="main"> <h2>View Uploaded Exams</h2>
            <p>View all exams and solutions you have uploaded for each module.</p> 
        </div>
        <%
            //get user from implicit session object
          
            
            java.util.Date date=new java.util.Date();
            String datetime=new Timestamp(date.getTime()).toString();
            
            viewExams v = new viewExams(username2, "Teacher");
            String[] list = new String[20];
            list = v.getModuleCodes();
            
            for(int i = 0; i < 19; i++) {
                
                //break loop
                if(list[i] == null) {
                    break;
                }
                
                String examPath = v.getExam(list[i]);
                String examSolutionPath = v.getExamSolution(list[i]);
                
                String resitPath = v.getResit(list[i]);
                String resitSolutionPath = v.getResitSolution(list[i]);
                
                String[] meta = v.getMeta(list[i]);
        %>              
        <br/>
                   
                    
        <div class="main">
          
            <table>
                <tr>
                    <td class="bLeft"><img src="img/pdflogo.jpg" height="100" width="100">
                    </td>
                    <td class="middle"><%=list[i]%>
                    </td>
                    <td class="bRight"><%=meta[0]%>
                   </td>
                    <td class="bRight"><%=meta[1]%>
                    </td>
                    
                    <td class="bRight">
                        <form> <!-- Still need to process a selection from the drop down menu to the redirect--->
                    <select name="paper" id="paper">
                        <option value="<%=examPath %>">View Exam Paper</option>
                        <option value="<%=examSolutionPath %>">View Exam Solutions</option>
                        <option value="<%=resitPath %>">View Resit Paper</option>
                        <option value="<%=resitSolutionPath %>">View Resit Solutions</option>
                    </select>
                    </form>
                   
                </tr>
                <tr>
                    <td class="middle">EXAM PROGRESS
                        </td>
                </tr>
            </table>
            <br>
           
        </div>
                
       
        </br>   
        <% } //end of for loop %>
    </body>
</html>
