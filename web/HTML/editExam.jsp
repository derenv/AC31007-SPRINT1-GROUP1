<%-- 
    Document   : editExam.jsp
    Author     : sarahsmall
--%>
<%@ page language="java"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../jsp/session_check.jsp" %>
<%@include file="Sidebars/sidebarTeacher.jsp" %>

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
            <h1>Update Exams </h1>
            <p>Update exams which have received feedback</p>
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
            double stage=0;
            String internalModComs="";
            String externalModComs="";
            String internalMod="";
            String externalMod="";

            //loops for the number of modules they have
            for (int i = 0; i < length ; i++) {
               modCode = list.get(i);
            }
        %>
        <div class="main">
            <form name="upload" method='POST' action="../upload.jsp" enctype="multipart/form-data" style="text-align: left;">
                Main Exam&nbsp; &nbsp; &nbsp;&nbsp;<input name="exam" type ="file" value="Main Exam" required><br>
                Main Solutions   <input name="sol" type ="file" value="Main Solutions" required><br>
                Resit Exam  &nbsp;&nbsp;&nbsp;&nbsp; <input name="resit" type ="file" value="Resit" required><br>
                Resit Solutions  <input name="resitSol" type ="file" value="Resit Solutions" required><br>
                <!--Module Code <input name="modCode2" type="text"><br>-->
                Module Code&nbsp;&nbsp;&nbsp;&nbsp;<input list="modCode" name="modCode"required>
                <datalist id="modCode">
                    <% for (int i = 0; i < length; i++) {
                        
                        

                            modCode = list.get(i);
                            stage = v.getStage(modCode);
                            if (stage == 3){ modCode = list.get(i);}
                            else if (stage ==5){ modCode = list.get(i);}
                            else if (stage ==7){ modCode = list.get(i);}
                            else{modCode="";}
//displays module codes that are at stage 3,5 or 7 meaning they are at teacher review
                    %>
                    <option value="<%=modCode%>"><%=modCode%></option>
                    <%}%>
                </datalist>
                <br>
                Sign Exam&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="sign" value="Sign" required>
                <br>
                <input type="submit"  value="update" style="background-color: rgb(67,101,226);border: none;color:white;
                       padding: 10px 12px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;" />
            </form>
            <br>
            <h1>FeedBack</h1>

            <%
                for (int i = 0; i < length; i++) {
                    modCode = list.get(i); modCode = list.get(i); 
                    internalModComs = v.getInternalModComs(modCode);
                    internalMod = v.getInternalModerator(modCode);
                    externalMod = v.getExternalModerator(modCode);
                    externalModComs = v.getExternalModComs(modCode);
                            
                    //displays module codes that are at stage 3,5 or 7 meaning they are at teacher review
            %>
            <br>
            <h2><%=modCode%></h2>
            <h5>Internal Moderator:<%=internalMod%></h5>
            <h5>Review:<br><%=internalModComs%></h5>
            <h5>External Moderator:<%=externalMod%></h5>
            <h5>Review<br><%=externalModComs%></h5>
            <br>
            <%
                }
            %>
        </div>
    </body>
</html>