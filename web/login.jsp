<%-- 
    Document   : login
    Created on : 22 Jan 2019, 17:30:40
    Author     : deren vural
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Enumeration"%>
<%@ page import="db.login" %>

<!DOCTYPE html>
<html>
    <%
        try{
            //get post params
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            //check if stored in database
            login log1 = new login();
            String type = log1.check_valid_details(username,password);
            if(type == null){
                //null value
                response.sendRedirect("/2018-agileteam1/error.jsp");
            }else if ("Teacher".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("/2018-agileteam1/HTML/teacherDash.jsp");
            }else if ("Admin".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("/2018-agileteam1/HTML/adminDash.jsp");
            }else if ("ExternalMod".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("/2018-agileteam1/HTML/externalModDash.jsp");
            }else if ("InternalMod".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("/2018-agileteam1/HTML/internalModDash.jsp");
            }else if ("ExternalVet".equals(type)){
                //create session variables then redirect to dashboard
                session.setAttribute("username",username);
                session.setAttribute("type",type);
                response.sendRedirect("/2018-agileteam1/HTML/examVettingDash.jsp");
            }else{
                //invalid value
                response.sendRedirect("/2018-agileteam1/error.jsp");
            }
        }catch(Exception e){
            out.println("<head><p>"+e.getClass()+"</p></head>");
            out.println("<body><p>"+e.getMessage()+"</p></body>");
            response.sendRedirect("/2018-agileteam1/error.jsp");
        }
    %>
</html>
