<%-- 
    Document   : list
    Created on : 19/12/2017, 11:24:39 PM
    Author     : hikaru
--%>
<%@ include file="../../include.jsp" %>
<%@page import="org.submit.ferreteria.entity.Factura"%>
<%@page import="org.submit.ferreteria.dao.FacturaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List</title>
        <script src="../../recurso/js/js.js" type="text/javascript"></script>		
    </head>
    <body class="c-container">
        <div class="center">
            <h2 class="text-warm">Lista de Facturas</h2>
            <input type='button' class='btn_font_min' value=' ' onclick="font_size('articulo', false)">
            <input type='button' class='btn_font_max' value=' ' onclick="font_size('articulo', true)">
        </div>
        <div class="c-form-container">
            <table border='0' id="articulo"  cellspacing='2' cellpadding='1' align="center" >
                <tr>
                    <th>#</th><th>Fecha</th><th>Sub total</th><th>Total</th>
                </tr>
                <%  int i = 0;
                    try {
                        FacturaDAO dao = new FacturaDAO();
                        List lis = dao.list("");
                        Iterator lisIterator = lis.iterator();
                        while (lisIterator.hasNext()) {
                            Factura d = (Factura) lisIterator.next();
                %>
                <tr <% if (i % 2 != 0) {
                        out.print("class='intercalar'");
                    }%>
                    fprolloverstyle="color:#FFFFFF;background-color:#CDDBEB;"
                    onClick="rollIn(this)" onDblClick="limpiar(this)" onMouseOver="rollIn(this)" onMouseOut="rollOut(this)" >
                    <td align="right"><i><%=++i%></i></td>
                    <td><%=d.getFecha()%></td>
                    <td><%=d.getSub_total()%></td>
                    <td><%=d.getTotal()%></td>
                </tr>
                <%      }
                    } catch (GlobalException e) {
                        throw new GlobalException(e.getMessage());
                    }
                    if (i == 0) {
                        out.print("<br><br><b>0 Registros Encontrados</b>");
                    }
                %>
            </table>
        </div>
    </body>
</html>
