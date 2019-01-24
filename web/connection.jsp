<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
 
<html>
   <head>
      <title>SELECT Operation</title>
   </head>

   <body>
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam1db"
         user = "18agileteam1"  password = "7845.at1.5487"/>
      
      
    <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from pdf;
      </sql:query>
 
      <table border = "1" width = "100%">
          
         <tr>
            <th>Mod code</th>
            <th>Path</th>
             <th>Current stage</th> 
             <th>Edit</th>    
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Mod_code}"/></td>
               <td><c:out value = "${row.pdf_path}"/></td>
               <td><c:out value = "${row.Current_stage}"/></td>
               <td><c:out value = "${row.Edit}"/></td>
            </tr>
         </c:forEach>
            
            
      </table>
         
         
             <a href="uploadindex.jsp">back</a>  
   </body>
</html>
