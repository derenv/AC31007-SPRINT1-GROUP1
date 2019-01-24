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
     user name &nbsp   
  <input name="username"  type ="text">
     Password &nbsp   
  <input name="password"  type ="password">
    User  ID &nbsp   
  <input name="userid"  type ="text">
    Module 1  &nbsp 
  <input name="mod1"  type ="text">
    Module 2  &nbsp 
  <input name="mod2"  type ="text">
  
  <input name="submit"  type ="submit"  value="submit"  >
  

        </form>
    </body>
  
</html>
