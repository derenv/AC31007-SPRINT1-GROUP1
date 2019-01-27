
<%@page import="java.util.Enumeration"%>
<%@ page import="db.login" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  


<html>
<%
String moduleCode=request.getParameter("moduleCode");
String year=request.getParameter("year");
String moduleName=request.getParameter("moduleName");
String modCoord=request.getParameter("modCoord");
String mainExam=request.getParameter("mainExam");
String resitExam=request.getParameter("resitExam");
String solMain=request.getParameter("solMain");
String solResit=request.getParameter("solResit");

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
            
            String insert_sql = "insert into papers(ModuleCode,Year, ModuleName,ModCoord,MainPaper, ResitPaper, MainSolutions, ResitSolutions) values('" + moduleCode + "','" + year + "','" + modCoord + "','" + moduleName + "','" + mainExam+ "','"+ resitExam+"','"+ solMain+"','"+solResit+"')";  
           
        // String insert_sql = "insert into pdf (Mod_code,Pdf_path,Current_Stage,Edit)  values('AC32006','www.zhujiefan.com','0','0')";
           
         String query_sql = "select * from papers";  
                          
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
                    Module Code:<%=rs.getString("ModuleCode")%> </br>     
                    Year:<%=rs.getString("Year")%> </br>   
                    Module Name<%=rs.getString("ModuleName")%> </br>   
                    Module Coordinator:<%=rs.getString("ModCoord")%> </br>
                    Main Paper:<%=rs.getString("MainPaper")%> </br>
                    Solutions(main)<%=rs.getString("MainSolutions")%> </br>
                    Resit Paper<%=rs.getString("ResitPaper")%> </br>
                    </br>   
                     Solutions(resit)<%=rs.getString("ResitSolutions")%> </br>
                    </br>   
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
</html>
