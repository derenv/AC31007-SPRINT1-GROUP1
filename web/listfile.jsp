<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="session_check.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Download file</title>
  </head>
  
  <body>
      
    <c:forEach var="me" items="${fileNameMap}">
        <c:url value="/Source Packages/DownLoadServlet" var="downurl">
            <c:param name="filename" value="${me.key}"></c:param>
        </c:url>
        ${me.value}<a href="${downurl}">download</a>
        <br/>
    </c:forEach>
  </body>
  
                 <a href="uploadindex.jsp">back</a>  

      
</html>

