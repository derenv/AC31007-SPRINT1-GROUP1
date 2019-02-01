<%-- 
    Document   : login
    Created on : 22 Jan 2019, 17:30:40
    Author     : deren vural
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import = "java.sql.SQLException"%>
<%@ page import="db.login" %>

<!DOCTYPE html>
<html>
    <%
        //get post params
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try{
            //check if stored in database
            login log1 = new login();
            String type = log1.check_valid_details(username,password);
            if(type == null){
                //null value
                response.sendRedirect("../error pages/error.jsp");
            }else if ("Teacher".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("../HTML/teacherDash.jsp");
            }else if ("Admin".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("../HTML/adminDash.jsp");
            }else if ("ExternalModerator".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("../HTML/externalModDash.jsp");
            }else if ("InternalModerator".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("../HTML/internalModDash.jsp");
            }else if ("ExamVet".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("../HTML/examVettingDash.jsp");
            }else if ("SchoolOffice".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("../HTML/SchoolOfficeDash.jsp");
            }else{
                //invalid value
                response.sendRedirect("../error pages/error.jsp");
            }
        }catch(SQLException e){
            session.setAttribute("state", e.getSQLState());
            session.setAttribute("code", e.getErrorCode());
            session.setAttribute("mess", e.getMessage());
            response.sendRedirect("../error pages/dberror.jsp");
        }
    %>
</html>
