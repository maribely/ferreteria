<%-- 
   Document   : form
   Created on : 18/12/2017, 07:50:30 PM
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
        <%            String go = request.getParameter("go") == null ? "" : request.getParameter("go");
            String id_cliente = request.getParameter("id") == null ? "" : request.getParameter("id");
            try {
                Cliente cliente = new Cliente();
                // ubigeo = new Ubigeo();
                if (go.equals("Editar")) {
                    ClienteDAO dao = new ClienteDAO();
                    cliente = dao.findByPk(Integer.parseInt(id_cliente));
                }
        %>
        <h2 class="text-warm center">Formulario &nbsp;<%= go%> cliente</h2>
        <div class="c-form-container">
            <form action='save.jsp' name='fm' method='post' onsubmit='return enviar()'>
                <input type='hidden' class='txt' name='go' value='<%=go%>'>
                <input type='hidden' class='txt' name='id_cliente' value='<%=cliente.getId_cliente()%>'>

                <label>Nombres *</label> 
                <input type='text' class='c-field' name='nombres' placeholder="Ingrese nombres" value='<%=cliente.getNombres()%>'>
                <label>Apellidos *</label> 
                <input type='text' class='c-field' name='apellidos' placeholder="Ingrese apellidos" value='<%=cliente.getApellidos()%>' size='40'><br>
                <label>DNI *</label> 
                <input type='text' class='c-field' name='dni' placeholder="Ingrese numero de identidad" value='<%=cliente.getDni()%>'>
                <label>RUC <small>(opcional)</small></label> 
                <input type='text' class='c-field' name='ruc' placeholder="Ingrese numero RUC" value='<%=cliente.getRuc()%>'>
                <label>Sexo</label> 
                <select name="sexo" class="c-field">
                    <option value="M" <%if (cliente.getSexo() == "" || cliente.getSexo().equals("M")) {
                            out.print("selected");
                            %> >Masculino</option>
                    <option value="F" <%} else {
                            out.print("selected");
                        }%> >Femenino</option>
                </select>
                <label>Telefono</label> 
                <input type='text' class='c-field' name='telefono' placeholder="Ingrese numero telefono/celular" value='<%=cliente.getTelefono()%>'>
                <label>Email <small>(Opcional)</small></label> 
                <input type='text' class='c-field' name='email' placeholder="Ingrese correo electronico" value='<%=cliente.getEmail()%>'>
                <label>Dirección</label> 
                <input type='text' class='c-field' name='direccion' placeholder="Ingrese dirección" value='<%=cliente.getDireccion()%>'  size='40'>
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
            <input type='hidden' class='txt' name='id_cliente' value='<%=id_cliente%>'>
            <input type='hidden' class="txt" name='go' value=''>
        </form>
    </body>
    <script>
        $(function () {
            $('#popupDatepicker').datepick();
        });
        function cancelar() {
            document.fm2.submit();
        }
        function enviar() {
            if (document.fm.dni.value === '') {
                alert('Ingrese DNI por favor');
                document.fm.dni.select(); //focus()
                return false;
            }
            if (document.fm.nombres.value === '') {
                alert('Ingrese nombre por favor');
                document.fm.nombres.select(); //focus()
                return false;
            }
            if (document.fm.apellidos.value === '') {
                alert('Los apellidos son necesarios');
                document.fm.apellidos.select(); //focus()
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
