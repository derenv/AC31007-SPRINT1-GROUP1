<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : createusers
    Created on : 24-Jan-2019, 16:28:42
    Author     : zhendongliu
--%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Users Page</title>
         
        <link rel="stylesheet" type="text/css" href="../css/Style.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
   
    </head>
    <body>
        
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
    	  <button> <a href="#" onclick="javascript:history.back(-1);">Back</a></button>
		</fieldset>
        
     
       
		</div>
  
        
    </body>
  
</html>
