<%-- 
    Document   : save
    Created on : 18/12/2017, 11:39:41 PM
    Author     : hikaru
--%>
<%@ include file="../../include.jsp" %>
<%@page import="org.submit.ferreteria.dao.ProveedorDAO"%>
<%@page import="org.submit.ferreteria.entity.Proveedor"%>
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
        Proveedor d = new Proveedor();
        ProveedorDAO dao = new ProveedorDAO();
        String go = request.getParameter("go") == null ? "" : request.getParameter("go");
        int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
        String mensaje = ""+d.getClass().getSimpleName();

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
                d.setRazon_social(request.getParameter("razon_social"));
                d.setRuc(request.getParameter("ruc"));
                d.setDireccion(request.getParameter("direccion"));
                dao.create(d);
                mensaje += " '" + d.getRazon_social()+ "' registrado con éxito";
            } catch (GlobalException e) {
                throw new GlobalException(e.getMessage());
            }
        } else if (go.equals("Editar")) {
            try {
                d.setRazon_social(request.getParameter("razon_social"));
                d.setRuc(request.getParameter("ruc"));
                d.setDireccion(request.getParameter("direccion"));
                d.setId_proveedor(id);
                dao.update(d);
                mensaje += " '" + d.getRazon_social()+ "' actualizado con éxito";
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
