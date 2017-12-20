<%@page import="org.submit.ferreteria.entity.Factura"%>
<%@page import="org.submit.ferreteria.dao.FacturaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../../include.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
        <script src='../../recurso/js/js.js' type='text/javascript'></script>
    </head>
    <%    String filter = request.getParameter("filter") == null ? "" : request.getParameter("filter");
        String titulo = "Factura";
        String buscar_por = "fecha";
    %>
    <body onload="focus_on_filter()" class="c-container">
        <h2 class="center text-warm"><%=titulo%></h2>
        <!--        formulario busqueda-->
        <form action="" method="GET" name="bus_fm" class="center">
            <label class="text-acent">Buscar por <%=buscar_por%></label>            
            <input type='text' name='filter' class='txt'  value='<%=filter%>'/>
            <input type='hidden' name='go' value='x'>
            <input type='submit' class="btn btn-default btn-sm"  value='Buscar'>
            <input type='button' class="btn btn-default btn-sm" value='Listar' onclick='listar()' >
        </form>
        <%
            String go = request.getParameter("go") == null ? "" : request.getParameter("go");
            if (!go.equals("")) {
                filter = filter.trim().replaceAll(" ", "%");
                int i = 0;
                try {
                    FacturaDAO dao = new FacturaDAO();
                    List list = dao.list(filter);
                    Iterator it = list.iterator();
                    if (it.hasNext()) {
        %>
        <!--        formulario crear/editar-->
        <form action="form.jsp" method="POST" name="resultado_form" class="center" onsubmit="return editar()">
            <label class="text-acent">Elige una opción</label><br>
            <input type="hidden" name="go" value="Editar">            
            <select name="id"  size="10">
                <%
                    do {
                        i++;
                        Factura d = (Factura) it.next();
                        out.print("<option value=" + d.getId_factura() + ">" + d.getFecha() + " </option>");
                    } while (it.hasNext());
                %>
            </select>
            <h4 class="text-info"><%=i%> Registros encontrados</h4>
            <button type="button" class="btn btn-default btn-sm"  onclick='nuevo()'>Nuevo</button>
            <input type='submit' class="btn btn-default btn-sm"  value='Editar'>
        </form>

        <%
                } else {
                    out.print("<br><br><b>B&uacute;squeda sin &eacute;xito, vuelva a intentar de la forma:</b>"
                            + "<li>Basta colocar las iniciales del su nombre </li>"
                            + "<br>p.e: <input type=text class=txt value=hond>"
                            + "<br>"
                            + "<form action='form.jsp' method='GET' class='center'>"
                            + "<input type='hidden' name='go' value='Crear'>"
                            + "<input type='submit' value='Nuevo' name='Nuevo' />"
                            + "</form>");
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
    <script src="../../recurso/js/functions.js"></script>
</html>
