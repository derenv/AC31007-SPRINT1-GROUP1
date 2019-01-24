<%-- 
    Document   : index
    Created on : 22-Jan-2019, 12:11:29
    Author     : sarahsmall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //ensure already logged in user does not have access to login page (must log out first)
    String username = (String) session.getAttribute("username");
    if(username != null){
        //check type and compare for redirect
	String type = (String) session.getAttribute("type");
        if ("Teacher".equals(type)){
            response.sendRedirect("HTML/teacherDash.jsp");
        }else if ("Admin".equals(type)){
            response.sendRedirect("HTML/adminDash.jsp");
        }else if ("ExternalMod".equals(type)){
            response.sendRedirect("HTML/externalModDash.jsp");
        }else if ("InternalMod".equals(type)){
            response.sendRedirect("HTML/internalModDash.jsp");
        }else if ("ExternalVet".equals(type)){
            response.sendRedirect("HTML/examVettingDash.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
 <head>
 <link rel="stylesheet" type="text/css" href="css/style2.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<header>
  <ul>
    <li>
      <div class="blur"><img src="img/UoDlogo.jpg"/></div>
    </li>
  </ul>
  </header>
<body>
    
<div class="bg">
<div class="login">
   
  <form method="post" action="login.jsp">
    <center> <h1>Sign in</h1>
        <br>



                <label for="username">Username</label>
                <input type="text" style="font-size:16px" name="username" required/>
<br>
                <label>Password</label>
                <input type="password" style="font-size:16px" name="password" required/>
                <br>
<br>
              <div class="submit"><input type="submit" value="Login" style="float: right;background-color: rgb(67,101,226);border: none;color:white;
                        padding: 1.5px 2px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;"/></div>
                    



    </center>
</form>
</div>
</div>

</body>
<footer>
  <p>This is a project completed by Team1 in Agile Software engineering</p>
  </<footer>
</html>
