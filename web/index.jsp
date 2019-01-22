<%-- 
    Document   : index
    Created on : 22-Jan-2019, 12:11:29
    Author     : sarahsmall
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
    <center><h1>login here</h1></center>
    <center>
        <div>
            <form action="loginServlet" method="POST">
            <table>
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="username"></td>
                </tr>
                 <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="CLICK HERE" />
                </tr>
            </table>
            </form>
        </div>
    </center>
                
            
        
    </body>
</html>
