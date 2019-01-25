<%-- 
    Document   : insertusers
    Created on : 24-Jan-2019, 16:59:00
    Author     : zhendongliu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" import="java.util.*,java.sql.*"%>
<%@ page import="db.conn" %>
<%@include file="../session_check.jsp" %>

<html>
    <%
        //get passed parameters from implicit request object
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String userid=request.getParameter("userid");
        String mod1=request.getParameter("mod1");
        String mod2=request.getParameter("mod2");


        java.util.Date date=new java.util.Date();
        String datetime=new Timestamp(date.getTime()).toString();
  
        try{
            //create connection
            conn connection_driver = new conn();
            Connection connection = connection_driver.connect();
            
            //create SQL queries
            Statement stmt = connection.createStatement();
            stmt.executeQuery("SET NAMES UTF8");
            String insert_sql = "insert into users(Username,Password,UserID,Module1,Module2) values('" + username + "','" + password + "','" + userid + "','" + mod1+ "','"+ mod2+"')";  
            String query_sql = "select * from users";  
            
            //execute insert statement and parse results
            try{
                stmt.execute(insert_sql);
            }catch(SQLException e){
                e.printStackTrace();
            }
            
            try{
                ResultSet rs = stmt.executeQuery(query_sql);
                while(rs.next()){
    %>
    <br/>
    User name:<%=rs.getString("Username")%> </br>
    Password:<%=rs.getString("Password")%> </br>
    User ID:<%=rs.getString("UserID")%> </br>
    Module1:<%=rs.getString("Module1")%> </br>
    Module2:<%=rs.getString("Module2")%> </br>
    </br>
    <%
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            
            stmt.close();
        }catch (Exception e){  
            e.printStackTrace();  
        }   
    %>   
</html>
