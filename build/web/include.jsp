<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.submit.ferreteria.common.data.*"%>
<%@ page errorPage="../../error.jsp" %>

<%
 ConnectDB tran;
 String qry=""; //enviar el query a la DB
 String resp=""; //mostrar la respuesta de la transacciones hecas con la db
%>
