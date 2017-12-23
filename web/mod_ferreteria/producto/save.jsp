<%-- 
    Document   : save
    Created on : 18/12/2017, 11:39:41 PM
    Author     : hikaru
--%>
<%@ include file="../../include.jsp" %>
<%@page import="org.submit.ferreteria.dao.ProductoDAO"%>
<%@page import="org.submit.ferreteria.entity.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save</title>
        <script src='../../recurso/js/js.js' type='text/javascript'></script>
    </head>
    <%
        if (request.getSession().getAttribute("usuario_id") == null) {
            throw new GlobalException("La operación requiere el usuario que registra. Sesion auto terminada, vuelva a ingresar");
        }
        Producto d = new Producto();
        ProductoDAO dao = new ProductoDAO();
        String go = request.getParameter("go") == null ? "" : request.getParameter("go");
        int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
        String mensaje = ""+d.getClass().getSimpleName();
        System.out.println("===Producto save===");
        System.out.println(request);
        System.out.println("===Producto save sesion===");
        System.out.println(request.getSession().getAttribute("carrito"));
        if (go.equals("Eliminar")) {
            try {
                dao.delete(id);
                mensaje += " " + id + " eliminado con éxito";
            } catch (GlobalException e) {
                throw new GlobalException("" + e.getMessage());
            }
        }
        if (go.equals("Crear")) {
            try {
                d.setNombre(request.getParameter("nombre"));
                d.setPrecio_unitario(Float.parseFloat(request.getParameter("precio_unitario")));
                d.setStock(Float.parseFloat(request.getParameter("stock")));
                d.setDescripcion(request.getParameter("descripcion"));
                d.setId_proveedor(Integer.parseInt(request.getParameter("id_proveedor")));
                d.setId_categoria(Integer.parseInt(request.getParameter("id_categoria")));
                dao.create(d);
                mensaje += " '" + d.getNombre()+ "' registrado con éxito";
            } catch (GlobalException e) {
                throw new GlobalException(e.getMessage());
            }
        } else if (go.equals("Editar")) {
            try {
                d.setNombre(request.getParameter("nombre"));
                d.setPrecio_unitario(Float.parseFloat(request.getParameter("precio_unitario")));
                d.setStock(Float.parseFloat(request.getParameter("stock")));
                d.setDescripcion(request.getParameter("descripcion"));
                d.setId_proveedor(Integer.parseInt(request.getParameter("id_proveedor")));
                d.setId_categoria(Integer.parseInt(request.getParameter("id_categoria")));
                d.setId_producto(id);
                dao.update(d);
                mensaje += " '" + d.getNombre()+ "' actualizado con éxito";
            } catch (GlobalException e) {
                throw new GlobalException(e.getMessage());
            }
        }
    %>
    <body class="c-container-short">
        <br><br>
        <div class="c-form-container">
            <h3 class="text-primary"><%=mensaje%></h3>
        </div> 
    </body>
</html>
