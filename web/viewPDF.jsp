<%-- 
    Document   : newjsp
    Created on : 29-Jan-2019, 19:43:27
    Author     : sarahsmall
--%>

<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.viewExams"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            //takes the module code as a parameter
            String modCode = request.getParameter("modCode");
            //String type = request.getParameter("type");
        
            String username2 = (String) session.getAttribute("username");
             java.util.Date date = new java.util.Date();
             String datetime = new Timestamp(date.getTime()).toString();
             byte[] exam = null;
             //get the module codes that are relevent to the user
             viewExams v = new viewExams(username2, "Teacher");
             ArrayList<String> list = new ArrayList();
             list = v.getModuleCodes(username2);
            
             //if (type.equals(1)){
             ServletOutputStream os = response.getOutputStream();
             exam = v.getExam(modCode);
             os.write(exam);
             os.close();
             out.clear();
             out = pageContext.pushBody();
             
             
             

        %>
    </body>
</html>
