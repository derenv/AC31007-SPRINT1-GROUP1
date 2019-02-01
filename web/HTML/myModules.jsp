<%-- 
    Document   : MyModules.jsp
    Author     : sarahsmall
--%>
<%@ page import="java.sql.ResultSet,java.sql.SQLException"%>
<%@ page import="db.data_access"%>
<%@include file="../jsp/session_check.jsp"%>
<%@include file="Sidebars/sidebarTeacher.jsp"%>
 
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //get user from implicit session object
    String username2 = (String) session.getAttribute("username");
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
        <div class="main"><h2>My modules</h2>
          
         </div>
        <%
            try{
                ResultSet rs = (new data_access()).run_statement("SELECT * FROM exams WHERE Teacher='"+username2+"'");
                while(rs.next()){
        %>     
        <br/>    
        <div class="main">
            <table>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td class="bLeft"><img src="../img/pdflogo.jpg" height="100" width="100">
                    </td>
                    <td class="middle"><%=rs.getString("ModuleCode")%>
                    </td>
                    <td class="bRight"><%=rs.getString("ModuleCoordinator")%>
                    </td>
                    <td class="bRight"><%=rs.getString("ModuleName")%>
                    </td>
                </tr>
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