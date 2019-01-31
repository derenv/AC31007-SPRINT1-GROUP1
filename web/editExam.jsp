<%-- 
    Document   : test.jsp
    Created on : 24-Jan-2019, 19:12:18
    Author     : sarahsmall

    Document   : updateuser
    Created on : 24-Jan-2019, 17:19:54
    Author     : zhendongliu
--%>
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
    <%
            //get user from implicit session object
            String username3 = (String) session.getAttribute("username");%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <div class="main"> <h1>Edit/Review Exams</h1>
             
        </div>
        
        <%
            //get user from implicit session object
       
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
           modCoord = v.getModCoord(modCode);
           modName = v.getModName(modCode);
           year = v.getYear(modCode);
           stage = v.getStage(modCode);
           stage2 = v.getIncreaseStage(modCode);
           
           if (stage == 1){label = "Uploaded";}
           else if (stage ==2 ){label = " Internal Moderator";}
           else if (stage ==3 ){label = " Teacher Review";}
           else if (stage ==4 ){label = " Exam Vetting Committee";}
           else if (stage ==5 ){label = " Teacher Review";}
           else if (stage ==6 ){label = " External Examiner";}
           else if (stage ==7 ){label = " Teacher Review";}
           else if (stage ==8 ){label = " Completed";}
           else if (stage == 0){label = "";}
                
                //run statement and parse results
               
        %>              
        <br/>
                   
                    
        <div class="main">
          
            <table>
                <tr>
                    <!--<td class="bTop" colspan="3">-->
                    </td>
                </tr>
                <tr>
                    <td class="bLeft"><img src="img/pdflogo.jpg" height="100" width="100">
                    </td>
                    <td class="middle"><%=rs.getString("ModuleCode")%>
                    </td>
                    <td class="bRight"><%=rs.getString("ModuleCoordinator")%>
                   </td>
                    <td class="bRight"><%=rs.getString("ModuleName")%>
                    </td>
                    <td class="bRight"><a href="<%=rs2.getString("Pdf_path") %>">Upload</a>
                        
                    </td> 
                     </td>
                    <td class="bRight"><a href="#">Comments</a>  
                    </td> 
                </tr>
                <tr>
            </table>

        </div>
                
       
        </br>   
        <%
                  }  
                }catch(Exception e){
                    e.printStackTrace();
                }   
                
                stmt.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        %>
        
        
    </body>
</html>