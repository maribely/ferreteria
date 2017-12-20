<%@page import="org.submit.ferreteria.entity.Categoria"%>
<%@page import="org.submit.ferreteria.dao.CategoriaDAO"%>
<%@page import="org.submit.ferreteria.entity.Proveedor"%>
<%@page import="org.submit.ferreteria.dao.ProveedorDAO"%>
<%@page import="org.submit.ferreteria.dao.ProductoDAO"%>
<%@page import="org.submit.ferreteria.entity.Producto"%>
<%@ include file="../../include.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../../recurso/js/js.js" type="text/javascript"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.js"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.meiomask.js" charset="utf-8"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.autocomplete.js"></script>
        <link href="../../recurso/ajax/autocomplete.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">@import "../../recurso/ajax/jquery.datepick.css";</style>
        <script type="text/javascript" src="../../recurso/ajax/jquery.datepick.js"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.datepick-es-PE.js"></script>
    </head>
    <body class="c-container-short">
        <%
            String go = request.getParameter("go") == null ? "" : request.getParameter("go");
            String id = request.getParameter("id") == null ? "" : request.getParameter("id");
            Producto d = new Producto();
            System.out.println("#=====///====");
            System.out.println("id_prove:" + d.getId_proveedor());
            System.out.println("id_categ:" + d.getId_categoria());
            System.out.println("#=====///====");
            String titulo = go + " " + d.getClass().getSimpleName();
            try {
                if (go.equals("Editar")) {
                    ProductoDAO dao = new ProductoDAO();
                    d = dao.findByPk(Integer.parseInt(id));
                }
        %>
        <h2 class="text-warm center"><%= titulo%></h2>
        <div class="c-form-container">
            <form action='save.jsp' name='fm' method='post' onsubmit='return enviar()'>
                <input type='hidden' class='txt' name='go' value='<%=go%>'>
                <input type='hidden' class='txt' name='id' value='<%=d.getId_proveedor()%>'>

                <label>Nombre*</label> 
                <input type='text' class='c-field' name='nombre' placeholder="Ingrese nombre" value='<%=d.getNombre()%>'>
                <label>Precio unitario*</label> 
                <input type='text' class='c-field' name='precio_unitario' placeholder="Ingrese precio unitario" value='<%=d.getPrecio_unitario()%>'>
                <label>Stock *</label> 
                <input type='text' class='c-field' name='stock' placeholder="Ingrese stock" value='<%=d.getStock()%>'>
                <label>Descripción *</label>
                <input type='text' class='c-field' name='descripcion' placeholder="Ingrese descripcion" value='<%=d.getDescripcion()%>'>
                <label>Proveedor *</label>
                <select name="id_proveedor" class="c-field">
                    <%
                        ProveedorDAO pdao = new ProveedorDAO();
                        List list = pdao.list("");
                        Iterator it = list.iterator();
                        do {
                            Proveedor p = (Proveedor) it.next();
                            if (go.equals("Editar")) {
                                if (p.getId_proveedor() == d.getId_proveedor()) {
                                    out.print("<option value=" + p.getId_proveedor() + " selected>" + p.getRazon_social() + " </option>");
                                } else {
                                    out.print("<option value=" + p.getId_proveedor() + ">" + p.getRazon_social() + " </option>");
                                }
                            } else {
                                out.print("<option value=" + p.getId_proveedor() + ">" + p.getRazon_social() + " </option>");
                            }
                        } while (it.hasNext());
                    %>
                </select>
                <label>Categoria *</label>
                <select name="id_categoria" class="c-field">
                    <%
                        CategoriaDAO cdao = new CategoriaDAO();
                        List list1 = cdao.list("");
                        Iterator it1 = list1.iterator();
                        do {
                            Categoria c = (Categoria) it1.next();
                            if (go.equals("Editar")) {
                                if (c.getId_categoria() == d.getId_categoria()) {
                                    out.print("<option value=" + c.getId_categoria() + " selected>" + c.getNombre() + " </option>");
                                } else {
                                    out.print("<option value=" + c.getId_categoria() + ">" + c.getNombre() + " </option>");
                                }
                            } else {
                                out.print("<option value=" + c.getId_categoria() + ">" + c.getNombre() + " </option>");
                            }
                        } while (it.hasNext());
                    %>
                </select>

                <!--botones del formulario-->
                <input type='submit' value='<%= go%>'>
                <% if (go.equals("Editar")) {
                        out.print("<input type='button'  value='Eliminar' onclick='eliminarConfirm();'>");
                    }%>
                <input type='button' value='Cancelar' onclick='cancelar()'>
            </form>
        </div>
        <%
            } catch (GlobalException e) {
                throw new GlobalException(e.getMessage());
            }
        %>
        <form action='main.jsp' method='GET' name='fm2'>
            <input type='hidden' class='txt' name='id' value='<%=id%>'>
            <input type='hidden' class="txt" name='go' value=''>
        </form>
    </body>
    <script>
        function cancelar() {
            document.fm2.submit();
        }
        function enviar() {
            if (document.fm.nombre.value === '') {
                alert('Ingrese nombre por favor');
                document.fm.nombre.select(); //focus()
                return false;
            }
            return true;
        }

        function eliminarConfirm() {
            if (confirm('Eliminar por completo?')) {
                document.fm2.action = 'save.jsp';
                document.fm2.go.value = 'Eliminar';
                document.fm2.submit();
            }
            else
                return false;
        }
        function sf() {
            document.bus_fm.filter.select();
        }
    </script>
</html>
