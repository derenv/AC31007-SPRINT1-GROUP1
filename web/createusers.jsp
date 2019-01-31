<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : createusers
    Created on : 24-Jan-2019, 16:28:42
    Author     : zhendongliu
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>

 <head>  
<title>Create Users Page</title>
 <link rel="stylesheet" type="text/css" href="css/Style.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<header>
      <div class="content"><img src="img/UoDlogo.jpg"/></div>
</header>
    

    <body>   
        
        
            
<div class="main">
<div class="sidebar">
    
  <ul>
      
    <br>
   
 
       <li><a href="createusers.jsp">Create user </a></li>
      <li><a href="choose.jsp">Edit user </a></li>
      
      <li><a href="admintoexam.jsp">Admin edit exam</a></li> 
      
      
    <li><a href="AdminAccount.jsp">Account Details</a></li>
    <div class="signout"><li><a href='logout.jsp'>Sign out</a></li></div>
    
    
    
  </ul>
</div>
    
   <div align="center">
	<fieldset style="background-color: white ; width: 600px ; ">
    <legend style="text-align: center ; color: black; background-color: white ; font-size:40px">Create User Page</legend>
      <legend style="text-align: center ; background-color: white ;" >Please enter user's information </legend>
	
        <div style="text-align: center; padding:20px">      
      <form action="insertusers.jsp" method="post">
    User name &nbsp               
  <input name="username"  type ="text"> <br/> <br/>
    Password &nbsp  
  <input name="password"  type ="password"><br/><br/>
    User ID &nbsp  &nbsp 
    <select name="userid"  type ="text">
      <option value="Admin">Admin</option>
      <option value="ExternalMod">ExternalMod</option>
      <option value="InternalMod">InternalMod</option>
      <option value="Teacher">Teacher</option>
       <option value="Exam_Vetting_Committee">Exam Vetting Committee</option>
  </select><br/><br/>
    Module 1  &nbsp 
  <input name="mod1"  type ="text"><br/><br/>
    Module 2  &nbsp 
  <input name="mod2"  type ="text"><br/><br/>
    Module 3  &nbsp 
  <input name="mod3"  type ="text"><br/><br/>
    Module 4  &nbsp 
  <input name="mod4"  type ="text"><br/><br/>
  
  <input name="submit"  type ="submit"  value="submit"  ><br/>
  

        </form>
        
          </div>

		</fieldset>
        
     
       
		</div>
  
        
    </body>
  
</html>
