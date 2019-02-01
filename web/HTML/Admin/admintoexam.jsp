<%-- 
    Document   : admintoexam
    Created on : 31-Jan-2019, 12:19:54
    Author     : zhendongliu
--%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.SQLException"%>  
<%@ page contentType="text/html;"%>

<%@include file="../../jsp/session_check.jsp" %>
<%@ page import="db.data_access" %>
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
                    <div class="signout"><li><a href='../login/logout.jsp'>Sign out</a></li></div>
                </ul>
            </div>
        </div>
        <%
            String  ModuleCode =request.getParameter("ModuleCode");  
            String  ModuleCoordinator =request.getParameter("ModuleCoordinator");  
            String  Year=request.getParameter("Year");           
            String  ModuleName =request.getParameter("ModuleName");   
            String  Teacher =request.getParameter("Teacher");   
            String  InternalModerator =request.getParameter("InternalModerator");   
            String  ExternalModerator =request.getParameter("ExternalModerator");   
            String  ExamVetting =request.getParameter("ExamVetting");
            try{   
                ResultSet rs = (new data_access()).run_statement("SELECT * FROM exams");
        %>
        <div class="main"  style="position:relative;  left:-10px;" >
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
                }catch(SQLException e){
                    session.setAttribute("state", e.getSQLState());
                    session.setAttribute("code", e.getErrorCode());
                    session.setAttribute("mess", e.getMessage());
                    response.sendRedirect("../../error pages/dberror.jsp");
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
    </body>
</html>
