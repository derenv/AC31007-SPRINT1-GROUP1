<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="session_check.jsp" %>
  <!DOCTYPE HTML>
  <html>
    <head>
     <title>document upload</title>
    </head>
   <body>
     <form action="${pageContext.request.contextPath}/Source Packages/UploadHandleServlet" enctype="multipart/form-data" method="post">

        upload document：<input type="file" name="file1"><br/>
        <input type="submit" value="submit">
     </form>
   </body>
 </html>
