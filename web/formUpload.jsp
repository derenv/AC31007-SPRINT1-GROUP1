<%-- 
    Document   : formUpload
    Created on : 30-Jan-2019, 17:49:39
    Author     : sarahsmall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Exams</title>
    </head>
    <body>
       
        <p>Please Upload Your exams</p>
        <form name="upload" method='POST' action="uploadFile.jsp">
          Main Exam:  <input name="exam" type ="file" value="Main Exam"><br/>
          Main Solutions:   <input name="sol" type ="file" value="Main Solutions"><br/>
          Resit Exam:   <input name="resit" type ="file" value="Resit"><br/>
          Resit Solutions:  <input name="resitSol" type ="file" value="Resit Solutions"><br/>
            <input name="modCode" type="text"><br>
            <input type="hidden" name="type" value="1">
            
        <input type="submit"  value="upload"/>
        </form>
        
   
    </body>
</html>
