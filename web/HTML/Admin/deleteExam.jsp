<%-- 
    Document   : deleteexam
    Created on : 31-Jan-2019, 14:31:37
    Author     : zhendongliu
--%>
<%@ page language="java" import="java.sql.SQLException"%>  
<%@ page contentType="text/html;"%>  
<%@ page import="db.data_access" %>
<!DOCTYPE html>
<html>
    <body>
        <%
            String ModuleCode=request.getParameter("ModuleCode");
            try{
                (new data_access()).run_statement("DELETE FROM exams WHERE ModuleCode='"+ModuleCode.trim()+"'");
            }catch(SQLException e){
                session.setAttribute("state", e.getSQLState());
                session.setAttribute("code", e.getErrorCode());
                session.setAttribute("mess", e.getMessage());
                response.sendRedirect("../../error pages/dberror.jsp");
            }
        %>
    </body>
    <script > window.location.href='admintoexam.jsp' </script>
</html>
