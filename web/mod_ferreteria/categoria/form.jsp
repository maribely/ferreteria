<%@page import="org.submit.ferreteria.dao.CategoriaDAO"%>
<%@page import="org.submit.ferreteria.entity.Categoria"%>
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
            Categoria d = new Categoria();
            String titulo = go + " " + d.getClass().getSimpleName();
            System.out.println("=====////=====");
            System.out.println(request);
            System.out.println("=====////=====");
            try {
                if (go.equals("Editar")) {
                    CategoriaDAO dao = new CategoriaDAO();
                    d = dao.findByPk(Integer.parseInt(id));
                }
        %>
        <h2 class="text-warm center"><%= titulo%></h2>
        <div class="c-form-container">
            <form action='save.jsp' name='fm' method='post' onsubmit='return enviar()'>
                <input type='hidden' class='txt' name='go' value='<%=go%>'>
                <input type='hidden' class='txt' name='id' value='<%=d.getId_categoria()%>'>

                <label>Nombre *</label> 
                <input type='text' class='c-field' name='nombre' placeholder="Ingrese nombre de categoria" value='<%=d.getNombre()%>'>
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
        $(function () {
            $('#popupDatepicker').datepick();
        });
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
