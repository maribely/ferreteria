<%-- 
    Document   : form
    Created on : 19/12/2017, 11:24:20 PM
    Author     : hikaru
--%>
<%@page import="org.submit.ferreteria.entity.Cliente"%>
<%@page import="org.submit.ferreteria.dao.ClienteDAO"%>
<%@page import="org.submit.ferreteria.entity.Factura"%>
<%@page import="org.submit.ferreteria.dao.FacturaDAO"%>
<%@ include file="../../include.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../../recurso/ajax/autocomplete.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">@import "../../recurso/ajax/jquery.datepick.css";</style>
        <script src="../../recurso/js/js.js" type="text/javascript"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.js"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.meiomask.js" charset="utf-8"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.autocomplete.js"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.datepick.js"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.datepick-es-PE.js"></script>
    </head>
    <body class="c-container-short">
        <%
            String go = request.getParameter("go") == null ? "" : request.getParameter("go");
            String id = request.getParameter("id") == null ? "" : request.getParameter("id");
            Factura d = new Factura();
            String titulo = go + " " + d.getClass().getSimpleName();
            try {
                if (go.equals("Editar")) {
                    FacturaDAO dao = new FacturaDAO();
                    d = dao.findByPk(Integer.parseInt(id));
                }
        %>
        <h2 class="text-warm center"><%= titulo%></h2>
        <div class="c-form-container">
            <form action='save.jsp' name='fm' method='post' onsubmit='return enviar()'>
                <input type='hidden' class='txt' name='go' value='<%=go%>'>
                <input type='hidden' class='txt' name='id' value='<%=d.getId_factura()%>'>
                <div class="row">
                    <div class="col-6">
                        <label>Cliente *</label>
                        <select name="id_cliente" class="c-field">
                            <%
                                ClienteDAO cdao = new ClienteDAO();
                                List list = cdao.listarCliente("");
                                Iterator it = list.iterator();
                                do {
                                    Cliente p = (Cliente) it.next();
                                    if (go.equals("Editar")) {
                                        if (p.getId_cliente() == d.getId_cliente()) {
                                            out.print("<option value=" + p.getId_cliente() + " selected>" + p.getApellidos() + " " + p.getNombres() + " </option>");
                                        } else {
                                            out.print("<option value=" + p.getId_cliente() + ">" + p.getApellidos() + " " + p.getNombres() + " </option>");
                                        }
                                    } else {
                                        out.print("<option value=" + p.getId_cliente() + ">" + p.getApellidos() + " " + p.getNombres() + " </option>");
                                    }
                                } while (it.hasNext());
                            %>
                        </select>
                    </div>
                    <div class="col-6">
                        <label>Fecha *</label> 
                        <input type='text' class='c-field' name='fecha' value='<%=d.getFecha()%>' id="popupDatepicker">
                    </div>
                </div>

                <div class="row">
                    <div class="col-8"></div>
                    <div class="col-4">
                        <div class="row">
                            <label class="col-4">Sub total*</label> 
                            <input type='text' class='c-field col-8' name='sub_total' value='<%=d.getSub_total()%>'>
                        </div>
                        <div class="row">

                            <label class="col-4">Igv *</label>
                            <input type='text' class='c-field col-8' name='igv' value='<%=d.getIgv()%>'>
                        </div>
                        <div class="row">

                            <label class="col-4">Total *</label> 
                            <input type='text' class='c-field col-8' name='total' value='<%=d.getTotal()%>'>
                        </div>
                    </div>
                </div>



                <!--botones del formulario-->
                <input type='submit' class="btn btn-default btn-sm"  value='<%= go%>'>
                <% if (go.equals("Editar")) {
                        out.print("<input type='button'  class='btn btn-default btn-sm' value='Eliminar' onclick='eliminarConfirm();'>");
                    }%>
                    <input type='button' class="btn btn-default btn-sm"  value='Cancelar' onclick='cancelar()'>
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
        $(function () {
            $('#popupDatepicker').datepick({dateFormat: "yyyy-mm-dd"});
        });
        function cancelar() {
            document.fm2.submit();
        }
        function enviar() {
            if (document.fm.fecha.value === '') {
                alert('Ingrese nombre por favor');
                document.fm.fecha.select(); //focus()
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
    </script>
</html>
