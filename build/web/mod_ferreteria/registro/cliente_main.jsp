<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<!DOCTYPE html>
<html lang="es">
<head>    
    <title>Main</title>
    <script src='../../recurso/js/js.js' type='text/javascript'></script>
    <!--<link rel="stylesheet" href="../../recurso/css/html.css"/>-->
    <!--<script src="../../recurso/js/util.js"></script>-->
    <script type='text/javascript' language='JavaScript'><!--
        function listar(){
          document.bus_fm.action='cliente_list.jsp';
          document.bus_fm.submit();
        }
        function sf(){ document.bus_fm.filter.select(); }
    </script>	
</head>
<% 
  String filter=request.getParameter("filter")== null ? "":request.getParameter("filter");
%>
<body  onload='sf()'>
    <table align="center">
        <form action='cliente_main.jsp' method='post' name='bus_fm'>
	<tr><td>
        <table><tr><td class='label'>
            Buscar persona:
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
        <jsp:include page="cliente_result.jsp" flush="false" />
        <% }  else out.print("<br><b>AYUDA:</b> <br>"+
            "<li>Haga clic en el bot&oacute;n Buscar para agregar nuevo cliente o editar datos del cliente o para eliminarlo</li>"+
            "<li>Haga clic en el bot&oacute;n Listar para obtener el reporte de clientes</li>");
        %> 				
    </td></tr>
  </table>
</body>
</html>

