<%-- 
    Document   : newjsp
    Created on : 11/10/2017, 06:58:51 PM
    Author     : JORGE
--%>
<%@ page isErrorPage="true" import="java.io.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
	<script src="../../recurso/js/js.js" type="text/javascript"></script>
    </head>
    <body>
        <h4>Ha ocurrido un error:</h4>
        <p class=error><%= exception.getMessage() %></p>
    </body>
</html>

<% // Ver detalle interno
out.println("< ! --");
StringWriter sw = new StringWriter();
PrintWriter pw = new PrintWriter(sw);
exception.printStackTrace(pw);
out.print(sw);
sw.close();
pw.close();
out.println("-->");
%>