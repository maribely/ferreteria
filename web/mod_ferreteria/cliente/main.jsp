<%@page import="org.submit.ferreteria.entity.Cliente"%>
<%@page import="org.submit.ferreteria.dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../../include.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
        <script src='../../recurso/js/js.js' type='text/javascript'></script>
    </head>
    <%    String filter = request.getParameter("filter") == null ? "" : request.getParameter("filter");%>
    <body onload="focus_on_filter()" class="c-container">
        <h2 class="center text-warm">Clientes</h2>
        <!--        formulario busqueda-->
        <form action="" method="GET" name="bus_fm" class="center">
            <label class="text-acent">Buscar por apellidos:</label>            
            <input type='text' name='filter' class='txt'  value='<%=filter%>'/>
            <input type='hidden' name='go' value='x'>
            <input type='submit'  value='Buscar'>
            <input type='button'  value='Listar' onclick='listar()' >
        </form>
        <%
            String go = request.getParameter("go") == null ? "" : request.getParameter("go");
            if (!go.equals("")) {
                filter = filter.trim().replaceAll(" ", "%");
                int i = 0;
                try {
                    ClienteDAO dao = new ClienteDAO();
                    List clientes = dao.listarCliente(filter);
                    Iterator it = clientes.iterator();
                    if (it.hasNext()) {
        %>
        <!--        formulario crear/editar-->
        <form action="form.jsp" method="POST" name="resultado_form" class="center" onsubmit="return editar()">
            <label class="text-acent">Elige una opción</label>
            <hr>
            <input type="hidden" name="go" value="Editar">            
            <select name="id_cliente"  size="10">
                <%
                    do {
                        i++;
                        Cliente d = (Cliente) it.next();
                        out.print("<option value=" + d.getId_cliente() + ">" + d.getApellidos() + " " + d.getNombres() + "</option>");
                    } while (it.hasNext());
                %>
            </select>
            <h4 class="text-info"><%=i%> Registros encontrados</h4>
            <button type="button" onclick='nuevo()'>Nuevo</button>
            <input type='submit' value='Editar'>
        </form>
        <%
                } else {
                    out.print("<br><br><b>B&uacute;squeda sin &eacute;xito, vuelva a intentar de la forma:</b>"
                            + "<li>Basta colocar las iniciales del su nombre </li>"
                            + "<br>p.e: <input type=text class=txt value=hond>"
                            + "<br>");
                }
            } catch (GlobalException e) {
                throw new GlobalException(e.getMessage());
            }
        %>
        <%--<jsp:include page="cliente_result.jsp" flush="false" />--%>

        <% } else
                out.print("<div class='text-acent'><h5>AYUDA:</h5>"
                        + "<ul><li>Haga clic en el bot&oacute;n Buscar para agregar nuevo cliente o editar datos del cliente o para eliminarlo</li>"
                        + "<li>Haga clic en el bot&oacute;n Listar para obtener el reporte de clientes</li></ul></div>");
        %> 

    </body>
    <script>
        function listar() {
            document.bus_fm.action = 'list.jsp';
            document.bus_fm.submit();
        }
        function focus_on_filter() {
            document.bus_fm.filter.select();
        }
        function nuevo() {
            document.resultado_form.go.value = 'Crear';
            document.resultado_form.submit();
        }
        function editar() {
            if (document.resultado_form.id_cliente.value === '') {
                alert('Escoja una opción por favor');
                return false;
            }
            return true;
        }
        function enter() {
            if (window.event)
                keycd = window.event.keyCode;
            else if (evnt && evnt.which)
                keycd = evnt.which;
            else
                return;
            if (keycd === 13)
                document.res_fm.submit();
        }
        if (document.captureEvents) {
            document.captureEvents(Event.KEYPRESS);
            document.onkeypress = enter;
        }
    </script>
</html>
