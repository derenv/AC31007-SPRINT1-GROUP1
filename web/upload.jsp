<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  
<%@ page contentType="text/html;"%>  

<html>
<%  
MultipartRequest m = new MultipartRequest(request, "\\\\silva.computing.dundee.ac.uk\\webapps\\2018-agileteam1");  
out.println("successfully uploaded!"+"\n");  

Enumeration files = m.getFileNames(); 
String fileName = ""; 
String filePath=""; 

String Mod="";

while (files.hasMoreElements()) { 
fileName = (String) files.nextElement(); 


filePath = m.getFilesystemName(fileName); 
File f = m.getFile(fileName); 

if (null == f) 
throw new ServletException("file is not exist"); 
} 

Enumeration enum1=m.getParameterNames(); 
while (enum1.hasMoreElements()) { 
String s=(String)enum1.nextElement(); 
//out.print(s); 

String[] str=m.getParameterValues(s); 

StringBuffer sb= new StringBuffer();

for (int i=0;i<str.length;i++){ 
  //out.println(str[i]); 
 sb.append(str[i]);
  
  } 

   Mod=sb.toString();

} 



   response.setContentType("text/html");   

          
       //  String Stage=request.getParameter("Stage");     
       // String Edit=request.getParameter("Edit"); 
      
     
         String path="http://silva.computing.dundee.ac.uk/2018-agileteam1/"+filePath;      
         String Stage="0";     
         String Edit="0"; 
        
                
        java.util.Date date=new java.util.Date();   
        String datetime=new Timestamp(date.getTime()).toString();  
  
        try   
        {   
            String driverName = "com.mysql.jdbc.Driver"; 
            String DBUser = "18agileteam1"; 
            String DBPasswd = "7845.at1.5487"; 
            String DBName = "18agileteam1db"; 
          
            String connUrl = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/" + DBName + "?user=" + DBUser + "&password=" + DBPasswd;  
            Class.forName(driverName).newInstance();  
            Connection conn = DriverManager.getConnection(connUrl);  
            Statement stmt = conn.createStatement();  
            stmt.executeQuery("SET NAMES UTF8");  
            
            String insert_sql = "insert into pdf(Mod_code,Pdf_path,Current_Stage,Edit) values('" + Mod + "','" + path + "','" + Stage + "','" + Edit + "')";  
           
        // String insert_sql = "insert into pdf (Mod_code,Pdf_path,Current_Stage,Edit)  values('AC32006','www.zhujiefan.com','0','0')";
           
         String query_sql = "select * from pdf";  
                          
            try {   
                stmt.execute(insert_sql);   
            }catch(Exception e)     {  
                e.printStackTrace();  
            }  
            
            try {   
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
            }
                 catch(Exception e) {  
                e.printStackTrace();  
            }   
                 
            stmt.close();                 
            conn.close();   
        }
          catch (Exception e) {  
                e.printStackTrace();  
        }   
%>   
    
             <a href="uploadindex.jsp">back</a>  <br/>
             <a href="connection.jsp"> view data </a>   <br/>
             <a href="Source Packages/ListFileServlet" >download the file</a>    <br/>
    </html>
    
   
