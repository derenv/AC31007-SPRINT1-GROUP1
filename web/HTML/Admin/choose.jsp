<%-- 
    Document   : updateuser
    Created on : 24-Jan-2019, 17:19:54
    Author     : zhendongliu
--%>
<%@ page language="java" import="java.sql.SQLException,java.sql.ResultSet"%>  
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
                    <li><a href="#">Edit user </a></li>    
                    <li><a href="admintoexam.jsp">Edit Exam</a></li>      
                    <li><a href="AdminAccount.jsp">Account Details</a></li>
                    <div class="signout"><li><a href="logout.jsp">Sign out</a></li></div>
                </ul>
            </div>
        </div>
        <%
            try{
                ResultSet rs = (new data_access()).run_statement("SELECT * FROM users");

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
            }catch(SQLException e){
                session.setAttribute("state", e.getSQLState());
                session.setAttribute("code", e.getErrorCode());
                session.setAttribute("mess", e.getMessage());
                response.sendRedirect("../error pages/dberror.jsp");
            }
        %>
    </body>
</html>
