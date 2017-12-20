<%-- 
    Document   : save
    Created on : 18/12/2017, 11:39:41 PM
    Author     : hikaru
--%>
<%@ include file="../../include.jsp" %>
<%@page import="org.submit.ferreteria.dao.ClienteDAO"%>
<%@page import="org.submit.ferreteria.entity.Cliente"%>
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
        Cliente cliente = new Cliente();
        ClienteDAO dao = new ClienteDAO();
        String go = request.getParameter("go") == null ? "" : request.getParameter("go");
        int id_cliente = request.getParameter("id_cliente") == null ? 0 : Integer.parseInt(request.getParameter("id_cliente"));
//cliente.setUsuario_id(Integer.parseInt( request.getSession().getAttribute("usuario_id").toString() ));
        String resp = "";
        if (go.equals("Eliminar")) {
            try {
                resp += "" + dao.delete(id_cliente) + " registro eliminado del cliente";
            } catch (GlobalException e) {
                throw new GlobalException("" + e.getMessage());
            }
        }
        if (go.equals("Crear")) {
            try {
                cliente.setNombres(request.getParameter("nombres"));
                cliente.setApellidos(request.getParameter("apellidos"));
                cliente.setDni(request.getParameter("dni"));
                cliente.setSexo(request.getParameter("sexo"));
                cliente.setEmail(request.getParameter("email"));
                cliente.setRuc(request.getParameter("ruc"));
                cliente.setTelefono(request.getParameter("telefono"));
                cliente.setDireccion(request.getParameter("direccion"));
                resp += "" + dao.create(cliente) + ". " + cliente.getNombres() + " registrado con éxito";
            } catch (GlobalException e) {
                throw new GlobalException(e.getMessage());
            }
        } else if (go.equals("Editar")) {
            try {
                cliente.setNombres(request.getParameter("nombres"));
                cliente.setApellidos(request.getParameter("apellidos"));
                cliente.setDni(request.getParameter("dni"));
                cliente.setSexo(request.getParameter("sexo"));
                cliente.setEmail(request.getParameter("email"));
                cliente.setRuc(request.getParameter("ruc"));
                cliente.setTelefono(request.getParameter("telefono"));
                cliente.setDireccion(request.getParameter("direccion"));
                cliente.setId_cliente(id_cliente);
                resp += "" + dao.update(cliente) + ". " + cliente.getNombres() + " actualizado con éxito";
            } catch (GlobalException e) {
                throw new GlobalException(e.getMessage());
            }
        }
    %>
    <body class="c-container-short">
        <br><br>
        <div class="c-form-container">
            <h3 class="text-primary"><%=resp%></h3>
        </div> 
    </body>
</html>
