<%-- 
    Document   : uploadFile
    Created on : 30-Jan-2019, 17:35:38
    Author     : sarahsmall
--%>

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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Files Uploaded</h1>
        <p>hello</p>
    </body>
</html>
<%
 String exam = request.getParameter("exam");
 String sol = request.getParameter("sol");
 String resit = request.getParameter("resit");
 String resitSol = request.getParameter("resitSol");
 String modCode = request.getParameter("modCode");
  Integer type = Integer.parseInt(request.getParameter("type"));
 
    //load in main exam 
    File pdfFile = new File(exam);
    byte[] pdfData = new byte[(int) pdfFile.length()];
    DataInputStream dis = new DataInputStream(new FileInputStream(pdfFile));
    dis.readFully(pdfData);  // read from file into byte[] array
    dis.close();
    
    //load in solution 
    File _sol = new File(sol);
    byte[] pdfData2 = new byte[(int) _sol.length()];
    DataInputStream dis2 = new DataInputStream(new FileInputStream(_sol));
    dis2.readFully(pdfData2);  // read from file into byte[] array
    dis2.close();
    
    //load 
       File _resit = new File(sol);
    byte[] pdfData3 = new byte[(int) _resit.length()];
    DataInputStream dis3 = new DataInputStream(new FileInputStream(_resit));
    dis3.readFully(pdfData2);  // read from file into byte[] array
    dis3.close();
    
    
    
    
    Connection c;
    conn conn1 = new conn();
    c = conn1.connect();
    PreparedStatement ps = c.prepareStatement(
            "INSERT INTO pdf (" +
                    "ModuleCode, " +
                    "Exam," +
                
                    "ExamSolution" +
                ") VALUES (?,?,?)");
    ps.setString(1, modCode);
    ps.setBytes(2, pdfData); 
    ps.setBytes(3, pdfData2);// byte[] array
    ps.executeUpdate();
    exam = null;




%>

<a href="formUpload.jsp">Back</a>