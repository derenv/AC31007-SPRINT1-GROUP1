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
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <body>
        <h1>Files Uploaded!!</h1>
    </body>
</html>
<%
 String exam = request.getParameter("exam");
 String sol = request.getParameter("sol");
 String resit = request.getParameter("resit");
 String resitSol = request.getParameter("resitSol");
 String modCode = request.getParameter("modCode");

 
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
    
    //load in resit
    File _resit = new File(resit);
    byte[] pdfData3 = new byte[(int) _resit.length()];
    DataInputStream dis3 = new DataInputStream(new FileInputStream(_resit));
    dis3.readFully(pdfData2);  // read from file into byte[] array
    dis3.close();
    
    //load in resit
    File _resitSol = new File(resitSol);
    byte[] pdfData4 = new byte[(int) _resit.length()];
    DataInputStream dis4 = new DataInputStream(new FileInputStream(_resitSol));
    dis4.readFully(pdfData2);  // read from file into byte[] array
    dis4.close();
    
    
    
    Connection c;
    conn conn1 = new conn();
    c = conn1.connect();
    PreparedStatement ps = c.prepareStatement(
            "INSERT INTO pdf (" +
                    "ModuleCode, " +
                    "Exam," +
                
                    "ExamSolution," +
                
                
                    "Resit," +
                ""+  "ResitSolution" +
                ") VALUES (?,?,?,?,?)");
    ps.setString(1, modCode);
    ps.setBytes(2, pdfData); 
    ps.setBytes(3, pdfData2);// byte[] array
    ps.setBytes(4, pdfData3);
    ps.setBytes(5, pdfData4);
    ps.executeUpdate();
    exam = null;
    

    c.close();


%>

<a href="createNewExam.jsp">Back</a>