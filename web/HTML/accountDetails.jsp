<%-- 
    Document   : accountDetails.jsp
    Author     : sarahsmall
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java"%>

<%@include file="../jsp/session_check.jsp" %>
<%@include file="Sidebars/sidebarTeacher.jsp" %>
<%@ page import="db.data_access" %>
<%@ page import="java.sql.ResultSet,java.sql.SQLException"%>
<!DOCTYPE html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <div class="main">
            <h1>My Account Details</h1>
        </div>
        <%
            //get user from implicit session object
            String username2 = (String) session.getAttribute("username");
            
            try{
                ResultSet rs = (new data_access()).run_statement("SELECT * FROM users WHERE Username='"+username2+"'");
                
                while(rs.next()){
        %>
        <br/>
        <div class="main">
            <table>
                <tr>
                    <td class="middle">Name: <%=rs.getString("Username")%>
                    </td>
                    <td class="bRight">Role: <%=rs.getString("UserID")%>
                    </td>   
                </tr>
                <tr>
            </table>
        </div>
        </br>
        <%
                }
            }catch(SQLException e){
                session.setAttribute("state", e.getSQLState());
                session.setAttribute("code", e.getErrorCode());
                session.setAttribute("mess", e.getMessage());
                response.sendRedirect("../error pages/dberror.jsp");
            }
        %>
    </body>
</html>