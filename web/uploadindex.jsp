<%@page contentType="text/html" %>

<!DOCTYPE html>

<html>
    <head>
        <style type="text/css">

            body {background-color: khaki;}           

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File Upload App in JSP</title>
    </head>
    <body>
        <form action="upload.jsp" method="post" enctype="multipart/form-data">
            <b>Select File:</b>   
            <input type="file" name="fname"><br/>
            
            Mode Code:<input type="text" name ="Mod" required> <br/>
       
           <input type="submit" value="Upload">
        </form>  

        <br>
        <a href="Source Packages/ListFileServlet" >download the file</a>   
        
        <a href="connection.jsp">view data </a>   
    </body>
</html> 
