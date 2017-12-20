<%-- 
    Document   : list
    Created on : 19/12/2017, 09:34:40 AM
    Author     : hikaru
--%>

<%@ include file="../../include.jsp" %>
<%@page import="org.submit.ferreteria.entity.Proveedor"%>
<%@page import="org.submit.ferreteria.dao.ProveedorDAO"%>
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
            <h2 class="text-warm">Lista de proveedores</h2>
            <input type='button' class='btn_font_min' value=' ' onclick="font_size('articulo', false)">
            <input type='button' class='btn_font_max' value=' ' onclick="font_size('articulo', true)">
        </div>
        <div class="c-form-container">
            <table border='0' id="articulo"  cellspacing='2' cellpadding='1' align="center" >
                <tr>
                    <th># </th><th>Razon social</th><th>RUC</th><th>Dirección</th>
                </tr>
                <%  int i = 0;
                    try {
                        ProveedorDAO dao = new ProveedorDAO();
                        List lis = dao.list("");
                        Iterator lisIterator = lis.iterator();
                        while (lisIterator.hasNext()) {
                            Proveedor d = (Proveedor) lisIterator.next();
                %>
                <tr <% if (i % 2 != 0) {
                        out.print("class='intercalar'");
                    }%>
                    fprolloverstyle="color:#FFFFFF;background-color:#CDDBEB;"
                    onClick="rollIn(this)" onDblClick="limpiar(this)" onMouseOver="rollIn(this)" onMouseOut="rollOut(this)" >
                    <td align="right"><i><%=++i%></i></td>
                    <td><%=d.getRazon_social() %></td>
                    <td><%=d.getRuc() %></td>
                    <td><%=d.getDireccion()%></td>
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
