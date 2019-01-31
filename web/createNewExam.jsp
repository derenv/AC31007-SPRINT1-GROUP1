
<%@page import="db.viewExams"%>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="session_check.jsp" %>
<%@include file="sidebarTeacher.jsp" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  
<%@ page import="db.conn" %>

<%    
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    
    
    
    <body>
          <div class="main"> <h1>Upload Exam</h1>
       
    </div>
            <%
        //get user from implicit session object
        String username2 = (String) session.getAttribute("username");
        java.util.Date date = new java.util.Date();
        String datetime = new Timestamp(date.getTime()).toString();

        //get the module codes that are relevent to the user
        viewExams v = new viewExams(username2, "Teacher");
        ArrayList<String> list = new ArrayList();
        list = v.getModuleCodes(username2);
        
        //for the stages
      
        //gets the size of Array list (number of module codes)
        Arrays.toString(list.toArray());
        int length = list.size();
       
        //initiase the varibales to empty strings
        String modCode ="";
        String modCoord="";
        String modName="";
        String year="";
        double stage=0;
        double stage2=0;
        String label="";
     
        //loops for the number of modules they have
       for (int i = 0; i < length ; i++) {

          
           modCode = list.get(i);
        
       }
       %>
    
        
     
        
        
        <div class="main">
         
        <form name="upload" method='POST' action="uploadFile.jsp" style="text-align: left;">
          Main Exam&nbsp; &nbsp; &nbsp;&nbsp;<input name="exam" type ="file" value="Main Exam"><br/>
          Main Solutions   <input name="sol" type ="file" value="Main Solutions"><br/>
          Resit Exam  &nbsp;&nbsp;&nbsp;&nbsp; <input name="resit" type ="file" value="Resit"><br/>
          Resit Solutions  <input name="resitSol" type ="file" value="Resit Solutions"><br/>
           <!--Module Code <input name="modCode2" type="text"><br>-->
           Module Code&nbsp;&nbsp;&nbsp;&nbsp;<input list="modCode" name="modCode">
            <datalist id="modCode">
               <% for (int i = 0; i < length ; i++) {

          
                     modCode = list.get(i);
                     %>
                <option value="<%=modCode%>"><%=modCode%></option>
       <%}%>
    
 
  </datalist>
              
            </select>
            <input type="hidden" name="type" value="1">
            
        <input type="submit"  value="upload"style="background-color: rgb(67,101,226);border: none;color:white;
                       padding: 10px 12px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" />
        </form>

<% %>
             

      

                
                </div>
                
                </body>
                </html>
