<%-- 
    Document   : save
    Created on : 19/12/2017, 11:24:57 PM
    Author     : hikaru
--%>
<%@ include file="../../include.jsp" %>
<%@page import="org.submit.ferreteria.dao.FacturaDAO"%>
<%@page import="org.submit.ferreteria.entity.Factura"%>
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
        String id_usuario = request.getSession().getAttribute("usuario_id").toString();
        Factura d = new Factura();
        FacturaDAO dao = new FacturaDAO();
        String go = request.getParameter("go") == null ? "" : request.getParameter("go");
        int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
        String mensaje = "" + d.getClass().getSimpleName();

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
                d.setFecha(request.getParameter("fecha"));
                d.setSub_total(Float.parseFloat(request.getParameter("sub_total")));
                d.setIgv(Float.parseFloat(request.getParameter("igv")));
                d.setTotal(Float.parseFloat(request.getParameter("total")));
                d.setId_cliente(Integer.parseInt(request.getParameter("id_cliente")));
                d.setId_usuario(Integer.parseInt(id_usuario));
                dao.create(d);
                mensaje += " '" + d.getFecha() + "' registrado con éxito";
            } catch (GlobalException e) {
                throw new GlobalException(e.getMessage());
            }
        } else if (go.equals("Editar")) {
            try {
                d.setFecha(request.getParameter("fecha"));
                d.setSub_total(Float.parseFloat(request.getParameter("sub_total")));
                d.setIgv(Float.parseFloat(request.getParameter("igv")));
                d.setTotal(Float.parseFloat(request.getParameter("total")));
                d.setId_cliente(Integer.parseInt(request.getParameter("id_cliente")));
                d.setId_usuario(Integer.parseInt(id_usuario));
                d.setId_factura(id);
                dao.update(d);
                mensaje += " '" + d.getFecha()+ "' actualizado con éxito";
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
