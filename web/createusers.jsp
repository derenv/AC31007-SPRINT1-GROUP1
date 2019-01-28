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
    </head>
    <body>
        
        
      <form action="insertusers.jsp" method="post">
    User name &nbsp   
  <input name="username"  type ="text"> <br/>
    Password &nbsp  
  <input name="password"  type ="password"><br/>
    User ID &nbsp  &nbsp 
    <select name="userid"  type ="text">
      <option value="Admin">Admin</option>
      <option value="ExternalMod">ExternalMod</option>
      <option value="InternalMod">InternalMod</option>
      <option value="Teacher">Teacher</option>
       <option value="Exam_Vetting_Committee">Exam Vetting Committee</option>
  </select><br/>
    Module 1  &nbsp 
  <input name="mod1"  type ="text"><br/>
    Module 2  &nbsp 
  <input name="mod2"  type ="text"><br/>
    Module 3  &nbsp 
  <input name="mod3"  type ="text"><br/>
    Module 4  &nbsp 
  <input name="mod4"  type ="text"><br/>
  
  <input name="submit"  type ="submit"  value="submit"  ><br/>
  

        </form>
        
        
    </body>
  
</html>
