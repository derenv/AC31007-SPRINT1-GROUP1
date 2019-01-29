<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%> 

<%@page contentType="text/html" %>
<%@include file="session_check.jsp" %>
<%@ page import="db.file_handler" %>
<!DOCTYPE html>

<html>
    <%
        file_handler handle = new file_handler();
        try{
            handle.file_upload(request,response);
        }catch(IOException ff){
            ff.printStackTrace();
        }
        /*
        //construct path of the directory to save uploaded file
        String x = request.getContextPath();
        
        MultipartRequest m = new MultipartRequest(request, x);//"/2018-agileteam1/pdf");
        //MultipartRequest m = new MultipartRequest(request, "\\\\silva.computing.dundee.ac.uk\\webapps\\2018-agileteam1\\pdf");
        //MultipartRequest m = new MultipartRequest(request, "\\\\silva.computing.dundee.ac.uk\\2018-agileteam1\\pdf");
        
        //files
        Enumeration files = m.getFileNames();
        String fileName = "";//name of PDF file
        String filePath="";//location on server
        String Mod="";//module code
        File f = null;
        
        //for each file
        while (files.hasMoreElements()){
            //get current file details
            fileName = (String) files.nextElement();
            filePath = m.getFilesystemName(fileName);
            
            //create file object
            f = m.getFile(fileName);
            
            //catch empty file
            if (null == f){
                throw new ServletException("file is not exist"); 
            }
        }
        //server path
        String path="http://silva.computing.dundee.ac.uk/2018-agileteam1/"+filePath;
        String Stage="0";     
        String Edit="0";
        
        //insert new file into database
        (new data_access()).run_statement("INSERT INTO pdf(Mod_code,Pdf_path,Current_Stage,Edit) VALUES('" + Mod + "','" + path + "','" + Stage + "','" + Edit + "')");
        
        //get all files in database & print
        ResultSet rs = (new data_access()).run_statement("SELECT * FROM pdf");
        while(rs.next()) {*/
    %>
    <br/>
    Module Code:<%//=rs.getString("Mod_code")%> </br>
    Pdf path:<%//=rs.getString("Pdf_path")%> </br>
    Current:<%//=rs.getString("Current_Stage")%> </br>
    Edit:<%//=rs.getString("Edit")%> </br> </br>
    <%
        //}
    %>
    <a href="uploadindex.jsp">back</a>  <br/>
    <a href="connection.jsp"> view data </a>   <br/>
    <a href="Source Packages/ListFileServlet" >download the file</a>    <br/>
</html>
