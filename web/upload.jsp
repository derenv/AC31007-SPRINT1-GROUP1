<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%> 

<%@page contentType="text/html" %>
<%@include file="session_check.jsp" %>
<!DOCTYPE html>

<html>
    <%
        String appPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String save_path = appPath + File.separator + "pdf";
        
        //deal with passed file request
        MultipartRequest m = new MultipartRequest(request, save_path);
        //MultipartRequest m = new MultipartRequest(request, "\\\\silva.computing.dundee.ac.uk\\webapps\\2018-agileteam1");
        
        //files
        Enumeration files = m.getFileNames();
        String fileName = "";//name of PDF file
        String filePath="";//location on server
        String Mod="";//module code

        //for each file
        while (files.hasMoreElements()){
            //get current file details
            fileName = (String) files.nextElement();
            filePath = m.getFilesystemName(fileName);
            
            //create file object
            File f = m.getFile(fileName);
            
            //catch empty file
            if (null == f){
                throw new ServletException("file is not exist"); 
            }
        }
        
        //get file passed in form parameter
        Enumeration enum1 = m.getParameterNames(); 
        
        //for each file
        while (enum1.hasMoreElements()){
            String s = (String) enum1.nextElement();
            
            String[] str = m.getParameterValues(s);
            
            StringBuffer sb = new StringBuffer();
            
            for (int i=0;i<str.length;i++){
                sb.append(str[i]);
            }
            
            Mod=sb.toString();
        } 
        
        response.setContentType("text/html");   
        
        //server path
        String path="http://silva.computing.dundee.ac.uk/2018-agileteam1/"+filePath;      
        String Stage="0";     
        String Edit="0"; 
        
        //timestamp
        java.util.Date date=new java.util.Date();   
        String datetime=new Timestamp(date.getTime()).toString();  
        
        try{
            //connnection details
            String driverName = "com.mysql.jdbc.Driver"; 
            String DBUser = "18agileteam1"; 
            String DBPasswd = "7845.at1.5487"; 
            String DBName = "18agileteam1db"; 
            
            //connection
            String connUrl = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/" + DBName + "?user=" + DBUser + "&password=" + DBPasswd;  
            Class.forName(driverName).newInstance();  
            Connection conn = DriverManager.getConnection(connUrl);  
            Statement stmt = conn.createStatement();  
            stmt.executeQuery("SET NAMES UTF8");  
            
            //prepare pdf link statements
            String insert_sql = "insert into pdf(Mod_code,Pdf_path,Current_Stage,Edit) values('" + Mod + "','" + path + "','" + Stage + "','" + Edit + "')";  
            String query_sql = "select * from pdf";
            
            try{
                stmt.execute(insert_sql);
            }catch(Exception e){  
                e.printStackTrace();
            }
            
            try{
                ResultSet rs = stmt.executeQuery(query_sql);
                while(rs.next()) {
    %>
    <br/>
    Module Code:<%=rs.getString("Mod_code")%> </br>
    Pdf path:<%=rs.getString("Pdf_path")%> </br>
    Current:<%=rs.getString("Current_Stage")%> </br>
    Edit:<%=rs.getString("Edit")%> </br> </br>
    <%
                }
            }catch(Exception e) {
                e.printStackTrace();
            }
            
            stmt.close();
            conn.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <a href="uploadindex.jsp">back</a>  <br/>
    <a href="connection.jsp"> view data </a>   <br/>
    <a href="Source Packages/ListFileServlet" >download the file</a>    <br/>
</html>