<%-- 
    Document   : update
    Created on : 24-Jan-2019, 18:32:07
    Author     : zhendongliu
--%>

<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>  
<%@ page language="java" import="java.util.*,java.sql.*"%>  
<%@ page contentType="text/html;"%>  

<!DOCTYPE html>
<html>

    <body>
        
        <%

       java.util.Date date=new java.util.Date();   
       String datetime=new Timestamp(date.getTime()).toString();  
   
        String Username=new String("") ;
        String UserID=new String("") ;
        String Mod1=new String("") ;
        String Mod2=new String("") ;
        String Mod3=new String("") ;
        String Mod4=new String("") ;          
           
           
       if (  request.getParameter("username").length()==0 )  
       {  Username=(String)session.getAttribute("Username") ;   }
       else  { Username=(String)request.getParameter("username") ;    }
       
     if (  request.getParameter("userid").length()==0 )  
       {   UserID=(String)session.getAttribute("UserID") ;   }
       else  {   UserID=(String)request.getParameter("userid") ;  }
       
      if (  request.getParameter("mod1").length()==0 )  
       {   Mod1=(String)session.getAttribute("Mod1") ;    }
       else  {   Mod1=(String)request.getParameter("mod1") ;  }
     
       if (  request.getParameter("mod2").length()==0 )  
       {   Mod2=(String)session.getAttribute("Mod2") ;   }
       else  {   Mod2=(String)request.getParameter("mod2") ;  }
      
       if (  request.getParameter("mod3").length()==0 )  
       {   Mod3=(String)session.getAttribute("Mod3") ;    }
       else  {   Mod3=(String)request.getParameter("mod3") ;  }
       
        if (  request.getParameter("mod4").length()==0 )  
       {   Mod4=(String)session.getAttribute("Mod4") ;    }
       else  {   Mod4=(String)request.getParameter("mod4") ;  }
     
     
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
                     
         String update_sql = "update users set Username='"+Username+"',UserID='"+UserID+"',Module1='"+Mod1+"',Module2='"+Mod2+"' ,Module3= '"+Mod3+"',Module4='"+Mod4+"' where Username='"+Username+"' " ; 
            

         String query_sql = "select * from users where Username='"+Username+"' " ;  
   
         try{
       stmt.execute(update_sql);
        }catch(Exception e){
            e.printStackTrace();}
       
            try {   
                ResultSet rs = stmt.executeQuery(query_sql);     
                while(rs.next()) {  
                    %>     
                    <br/>
                    User name:<%=rs.getString("Username")%> </br>     
                    Password:<%=rs.getString("Password")%> </br>   
                    User ID:<%=rs.getString("UserID")%> </br>   
                    Module1:<%=rs.getString("Module1")%> </br>
                    Module2:<%=rs.getString("Module2")%> </br>   
                    Module3:<%=rs.getString("Module3")%> </br>
                    Module4:<%=rs.getString("Module4")%> </br>            
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
        
         
    </body>
    
    
    
         <a href="choose.jsp"> back</a>
    
    
    
    
</html>
