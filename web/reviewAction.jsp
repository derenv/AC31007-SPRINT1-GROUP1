<%-- 
    Document   : reviewAction
    Created on : 31-Jan-2019, 20:25:20
    Author     : sarahsmall
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.viewExams"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.conn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1>completed</h1>
    </body>
</html>
<%
    String username2 = (String) session.getAttribute("username");
    String comments = request.getParameter("comment");
    String modCode = request.getParameter("modCode");
     //get the module codes that are relevent to the user
        viewExams v = new viewExams(username2, "InternalModerator");
        
        ArrayList<String> list = new ArrayList();
        list = v.getModuleCodesInternal(username2);
        
        //for the stages
      
        //gets the size of Array list (number of module codes)
        Arrays.toString(list.toArray());
        int length = list.size();
       
        v.addComments(comments,modCode);
        v.setIncreaseStage(modCode);
        
     
   
    
    
  


%>