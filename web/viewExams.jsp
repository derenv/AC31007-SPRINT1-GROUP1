<%-- 
    Document   : test.jsp
    Created on : 24-Jan-2019, 19:12:18
    Author     : sarahsmall

    Document   : updateuser
    Created on : 24-Jan-2019, 17:19:54
    Author     : zhendongliu
--%>
<%@page import="db.viewExams"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  
<%@ page import="db.conn" %>
<%@include file="session_check.jsp" %>
<%@include file="sidebarTeacher.jsp" %>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%        //get user from implicit session object
    %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <div class="main"> <h1>View Uploaded Exams</h1>
       
    </div>
    <%
        //get user from implicit session object
        String username2 = (String) session.getAttribute("username");

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
           modCoord = v.getModCoord(modCode);
           modName = v.getModName(modCode);
           year = v.getYear(modCode);
           stage = v.getStage(modCode);
           
           
           if (stage == 1){label = "Uploaded";}
           else if (stage ==2 ){label = " Internal Moderator";}
           else if (stage ==3 ){label = " Teacher Review";}
           else if (stage ==4 ){label = " Exam Vetting Committee";}
           else if (stage ==5 ){label = " Teacher Review";}
           else if (stage ==6 ){label = " External Examiner";}
           else if (stage ==7 ){label = " Teacher Review";}
           else if (stage ==8 ){label = " Completed";}
           else if (stage == 0){label = "";}
           
           
           stage = stage*12.5;
           
          
        
  
         
           
     
    %>              
    <br>
    

    <div class="main">
        <p><%=modCode%></p>
        <table>
            <tr>
                <td class="bLeft"><img src="img/pdflogo.jpg" height="100" width="100">

                <td class="bRight"><%=modCoord%>
                </td>
                <td class="bRight"><%=modName%>
                </td>
                <td class="bRight"><%=year%>
                </td>
                <!--this sends the module code to view PDF and displays it-->
                <td class="bRight">
                    <form name="viewPDF" method='POST' action="viewPDF.jsp">
                        <input type="hidden" name="modCode" value="<%=modCode%>">
                        <input type="hidden" name="type" value="Exam">
                        <input type="submit" value="View Exam Paper"/>
                    </form>
                </td>
                <td>
                    <form name="viewSolutions" method='POST' action="viewPDF.jsp">
                        <input type="hidden" name="modCode" value="<%=modCode%>">
                        <input type="hidden" name="type" value="ExamSolution">
                        <input type="submit"  value="View Exam Solutions"/>
                    </form>
                </td>
                <td>
                    <form name="viewResit" method='POST' action="viewPDF.jsp">
                        <input type="hidden" name="modCode" value="<%=modCode%>">
                        <input type="hidden" name="type" value="Resit">
                        <input type="submit"  value="View Resit Paper"/>
                    </form>
                </td> 
                <td>
                    <form name="viewSolutions" method='POST' action="viewPDF.jsp">
                        <input type="hidden" name="modCode" value="<%=modCode%>">
                        <input type="hidden" name="type" value="ResitSolution">
                        <input type="submit"  value="View Resit Solutions"/>
                    </form>
                </td> 
                <!--PROGRESS BAR--> 
                    <div class="w3-container">
                        <div class="w3-light-grey">
                            
                            <div class="w3-blue" style="font-size:14px;height:24px;width:<%=stage%>%"><%=label%></div>
                        </div><br>
                    </div>
            </tr>
            <tr>
            </tr>
        </table>
        <br>
    </div>
    </br>   
    <% }//end of for loop %>
</body>
</html>


