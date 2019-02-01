<%-- 
    Document   : createNewExam.jsp
    Author     : sarahsmall
--%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../jsp/session_check.jsp" %>
<%@include file="../sidebarTeacher.jsp" %>

<%@ page import="java.util.ArrayList,java.util.Arrays" %>
<%@ page import="db.conn" %>
<%@ page import="db.viewExams"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <div class="main">
            <h1>Upload Exam</h1>
        </div>
        <%
            //get user from implicit session object
            String username2 = (String) session.getAttribute("username");

            //get the module codes that are relevent to the user
            viewExams v = new viewExams(username2, "Teacher");
            ArrayList<String> list = new ArrayList();
            list = v.getModuleCodes(username2);

            //gets the size of Array list (number of module codes)
            Arrays.toString(list.toArray());
            int length = list.size();

            //initiase the varibales to empty strings
            String modCode ="";
     
            //loops for the number of modules they have
            for (int i = 0; i < length ; i++) {
                modCode = list.get(i);
            }
        %>
    
        <div class="main">
            <form name="upload" method='POST' action="../upload.jsp" enctype="multipart/form-data" style="text-align: left;">
                Main Exam&nbsp; &nbsp; &nbsp;&nbsp;<input name="exam" type ="file" accept=".pdf" required><br>
                Main Solutions   <input name="sol" type ="file" accept=".pdf" required><br>
                Resit Exam  &nbsp;&nbsp;&nbsp;&nbsp; <input name="resit" type ="file" accept=".pdf" required><br>
                Resit Solutions  <input name="resitSol" type ="file" accept=".pdf" required><br>
                Module Code&nbsp;&nbsp;&nbsp;&nbsp;<input list="modCode" name="modCode" required>
                <datalist id="modCode">
                    <%
                        for (int i = 0; i < length; i++) {
                            modCode = list.get(i); //displays module codes that are at stage 0 meaning nothing has been uploaded yet - so they can upload
                    %>
                    <option value="<%=modCode%>"><%=modCode%></option>
                    <%
                        }
                    %>
                </datalist>
                <br>
                <%
                    String type = (String) session.getAttribute("type");
                    
                    if(!type.equals("Teacher")){
                        out.println("Sign Exam&nbsp;&nbsp;&nbsp;&nbsp; <input type='checkbox' name='sign' value='Sign'required>  <br>");
                    }
                %>
                <input type="submit"  value="upload"style="background-color: rgb(67,101,226);border: none;color:white;
                       padding: 10px 12px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" />
            </form>
        </div>
    </body>
</html>
