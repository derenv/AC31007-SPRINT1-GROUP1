
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="session_check.jsp" %>
<%@include file="sidebarTeacher.jsp" %>
<%    String username2 = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
        <div class="main">
            <h2>Create a new exam</h2>
            <p>Please fill in the details for the exam and add the files(PDF format only) to be uploaded.</p>
            <form action="createInsert.jsp" method="post" style="padding:0px">
                <h3>Details</H3>
                Module code &nbsp   
                <input name="moduleCode"  type ="text"> <br/>
                Year &nbsp  
                <input name="year"  type ="text"><br/>
                Module Name &nbsp  &nbsp 
                <input name="moduleName"  type ="text"><br/>
                Module Coordinator  &nbsp 
                <input name="modCoord"  type ="text"><br/>
                <h3>Files</H3>

                Main Exam  &nbsp <!--type in table main-->
                <input name="mainExam"  type ="file"><br/>
                Solutions(Main)  &nbsp <!--type in table main sol-->
                <input name="solMain"  type ="file"><br/>
                Resit Exam  &nbsp <!--type in table resit-->
                <input name="resitExam"  type ="file"><br/>
                Solutions (Resit)  &nbsp <!--type in table resit sol-->
                <input name="solResit"  type ="file"><br/>


                <input name="submit"  type ="submit"  value="submit"style="float: right;background-color: rgb(67,101,226);border: none;color:white;
                       padding: 10px 12px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;"  ><br/>

                <!---
                </form>
                <form action="uploadTeacher.jsp" method="post" enctype="multipart/form-data">
                    <b>Select Main Exam</b>   
                    <input type="file" name="fname1"><br/>
                    
                      <b>Select Main Exam Soultions:</b>   
                    <input type="file" name="fname2"><br/>
                    
                    <b>Select Resit Exam:</b>   
                    <input type="file3" name="fname3"><br/>
                    
                      <b>Select Resit Solutions:</b>   
                    <input type="file4" name="fname4"><br/>
                    
                   
               
                   <input type="submit" value="Upload">
                </form>  
                -->






                
                </div>
                </body>
                </html>