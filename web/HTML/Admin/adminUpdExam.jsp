<%-- 
    Document   : adminUpdExam
    Created on : 31-Jan-2019, 15:38:39
    Author     : zhendongliu
--%>
<%@ page language="java" import="java.sql.SQLException"%>  
<%@ page contentType="text/html;"%>
<%@ page import="db.data_access" %>
<%@include file="../../jsp/session_check.jsp" %>

<!DOCTYPE html>
<html>
    <body>
        <%
            String  ModuleCode =request.getParameter("ModuleCode");  
            String  ModuleCoordinator =request.getParameter("ModuleCoordinator");  
            String  Year=request.getParameter("Year");           
            String  ModuleName =request.getParameter("ModuleName");   
            String  Teacher =request.getParameter("Teacher");   
            String  InternalModerator =request.getParameter("InternalModerator");   
            String  ExternalModerator =request.getParameter("ExternalModerator");   
            String  ExamVetting =request.getParameter("ExamVetting");
            Object[] parameters = {ModuleCode,ModuleCoordinator,Year,ModuleName,Teacher,InternalModerator,ExternalModerator,ExamVetting};
  
            try{
                (new data_access()).run_statement("UPDATE exams SET ModuleCoordinator='?',Year='?',ModuleName='?',Teacher='?',InternalModerator='?',ExternalModerator='?',ExamVetting='?' where ModuleCode='"+ModuleCode+"' ",parameters);
            }catch(SQLException e){
                session.setAttribute("state", e.getSQLState());
                session.setAttribute("code", e.getErrorCode());
                session.setAttribute("mess", e.getMessage());
                response.sendRedirect("../../error pages/dberror.jsp");
            }   
        %>   
    </body>
    <script> window.location.href='admintoexam.jsp' </script>
</html>
