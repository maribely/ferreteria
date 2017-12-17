<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<html>
<head>
	<title>Main</title>
	<script src='../../recurso/js/js.js' type='text/javascript'></script>
    <script type='text/javascript' language='JavaScript'><!--
    function listar(){
      document.bus_fm.action='usuario_list.jsp';
      document.bus_fm.submit();
    }
    function sf(){ document.bus_fm.filter.select(); }
    // --></script>	
</head>
<% 
  String filter=request.getParameter("filter")== null ? "":request.getParameter("filter");
 %>
<body  onload='sf()'>
  <table align="center">
	<form action='usuario_main.jsp' method='post' name='bus_fm'>
	<tr><td>
        <table><tr><td class='label'>
            Buscar usuario:
			<input type='text' name='filter' class='txt' size='30' value='<%=filter%>'/>
            <input type='hidden' name='go' value='x'>
            <input type='submit' class='btn' value='Buscar'>
            <input type='button' class='btn' value='Listar' onclick='listar()' >
		</td></tr></table>
    </td></tr>
    </form>
    <tr><td>
		<%
		 String go =request.getParameter("go")== null ? "":request.getParameter("go");
		 if( !go.equals("")) {
		%>
		<jsp:include page="usuario_result.jsp" flush="false" />
		<% }  else out.print("<br><b>AYUDA:</b> <br>"+
		              "<li>Haga clic en el bot&oacute;n Buscar para agregar nuevo usuario o editar datos del usuario o para eliminarlo</li>"+
		              "<li>Haga clic en el bot&oacute;n Listar para obtener el reporte de usuarios</li>");
		%> 				
    </td></tr>
  </table>
</body>
</html>

