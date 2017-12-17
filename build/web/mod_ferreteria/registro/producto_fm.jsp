
<%@ include file="../../include.jsp" %>
<//util:session validate="false" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Cliente"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.ClienteData"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Producto"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.ProductoData"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Factura"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.FacturaData"%>
<html>
    <head>
  
        <script src="../../recurso/js/js.js" type="text/javascript"></script>

        <script type="text/javascript" src="../../recurso/ajax/jquery.js"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.meiomask.js" charset="utf-8"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.autocomplete.js"></script>
        <link href="../../recurso/ajax/autocomplete.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">@import "../../recurso/ajax/jquery.datepick.css";</style>
        <script type="text/javascript" src="../../recurso/ajax/jquery.datepick.js"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.datepick-es-PE.js"></script>


        <script type='text/javascript' language='JavaScript'><!--
            function cancelar(){ document.fm2.submit(); }
            function enviar(){
                if( document.fm.descripcion.value===''){
                    alert('Complete descripcion');
                    document.fm.descripcion.select(); //focus()
                    return false;
                }
                if(confirm('Esta seguro enviar?')) return true;
                else return false;
            }

            function eliminarConfirm() {
                if(confirm('Eliminar por completo?')){
                    document.fm2.action='producto_save.jsp';
                    document.fm2.go.value='Eliminar';
                    document.fm2.submit();
                }
                else return false;
            }

            // --></script>
        <script type="">
(function($){
    $(function(){
        $('input:text').setMask();
    }
    );
})(jQuery);
$(document).ready(function(){
    $('#ubigeo_txt').autocomplete('distrito_search_save.jsp?opcion=buscar', {
        delay: 100
    }).result(function(event,data) {
        $('#ubigeo_txt').val(data[0]);
        $('#ubigeo_id').val(data[1]);

        //var provis = "../provincial/"+data[4]+"/"+data[3]+".jsp";
        //window.location=provis;
    });
});
function sf(ID){
    document.getElementById(ID).select();
}
        </script>
<script type="text/javascript">
$(function() {
	$('#popupDatepicker').datepick();
});
</script>
    </head>
    <%
                String go = request.getParameter("go") == null ? "" : request.getParameter("go");
                String id_producto = request.getParameter("id_producto") == null ? "" : request.getParameter("id_producto");
                try {
                    Producto d = new Producto();
                    // ubigeo = new Ubigeo();
                    if (go.equals("Editar")) {
                        ProductoData data = new ProductoData();
                        d = data.findByPk(Integer.parseInt(id_producto));
                    //    UbigeoData ubigeoData = new UbigeoData();
                   //     ubigeo = ubigeoData.findByPk(d.getUbigeo_id());
                    }
                    //onload="sf('dni');"
    %>
    <//body onload="sf('id_producto')">
    <body onload="sf('id_producto')">
        <table class='form' border='0' cellpadding='0' cellspacing='0' align='center'>
            <!-- head -->
            <tr><td colspan='3' class='title_table'>
                    <b>Formulario: Registro Producto</b>
                </td></tr>
            <tr>
                <td colspan='3' class='legend_bottom'>
                    &nbsp;<%= go%> producto, por favor complete los datos con *.
                    <br>&nbsp;Luego precione el bot&oacute;n <b><%= go%></b> para guardar la informaci&oacute;n ingresada.
                </td></tr>

            <!-- img upload -->
            <form action='producto_fm.jsp' method='post' name='fmUF' enctype='multipart/form-data'>
                <tr>
                    <td rowspan='3' class='img' width='130' align='center'>
                        <//img src='../../recurso/imagen/<//%= d.getImagen() %>' width='120' height='140'>
                        <% if (go.equals("Editar")) {%>
                        <//input type=hidden name='todo' value='upload'>
                        <//input type='file' name='contenido' size='1' onchange='uploadFile()'>
                        <% }%>
                    </td>
                    <td rowspan='3' style='width: 5px;vertical-align : top;' class='fonc'></td>
                    <td colspan='1'></td>
                </tr>
            </form>

            <form action='producto_save.jsp' name='fm' method='post' onsubmit='return enviar()'>

                <input type='hidden' class='txt' name='go' value='<%=go%>'>
                <input type='hidden' class='txt' name='id_producto' value='<%=d.getId_producto()%>'>
                <tr><td valign='top'>

                        <fieldset class='fieldset_middle'>
                            <legend class='legend'><b>Datos del producto</b></legend>
                            <table>
                                <tr><td colspan='2' class='legend_bottom'>
                                        Instrucciones
                                    </td></tr>
                                <tr>
                                    <td>descripcion: </td>
                                    <td><input type='text' class='txt' name='descripcion' value='<%=d.getDescripcion()%>'></td>
                                </tr>
                                <tr>
                                    <td>stok: *</td>
                                    <td><input type='text' class='txt' name='stok' value='<%=d.getStok()%>' size='40'></td>
                                </tr>
                                <tr>
                                    
                                    <td>precio: *</td>
                                    <td><input type='text' class='txt' name='precio' value='<%=d.getPrecio()%>' size='40'></td>
                                </tr>
                                <tr>
                                    
                                    <td>id_proveedor: *</td>
                                    <td><input type='text' class='txt' name='id_prov' value='<%=d.getId_prov()%>' size='40'></td>
                                </tr>
                                                                                  
                                                         
                             
                           
                            </table>
                        </fieldset>


                    </td></tr>
                <tr><td valign='top'>

                        <fieldset class='fieldset_middle'>
                            <legend class='legend'><b>Ayuda</b></legend>
                            <table>
                                <tr><td colspan='2' class='legend_bottom'>
                                        Le recomendamos leer las siguientes indicaciones
                                    </td></tr>
                                <tr>
                                    <td><b>Ubigeo:</b> </td>
                                    <td>Ingrese las 3 iniciales del nombre del distrito, si no recuerda ingrese las iniciales de la provincia o regi�n
                                        <br>para obtener m&aacute;s resultados precione la barra espaciadora</td>
                                </tr>
                            </table>
                        </fieldset>

                    </td></tr>

                <!-- foot -->
                <tr><td colspan='3' height='10'></td></tr>
                <tr><td colspan='3' class='fm_opcs'>
                        <input type='submit' class='btn' value='<%= go%>'>
                        <% if (go.equals("Editar")) {
                      out.print("<input type='button' class='btn' value='Eliminar' onclick='eliminarConfirm();'>");
                  }%>
                        <input type='button' class='btn' value='Cancelar' onclick='cancelar()'>
                    </td></tr>
            </form>
            <!-- end form fm (main Body)-->
        </table>
    </body>
    <%
                } catch (GlobalException e) {
                    throw new GlobalException("" + e.getMessage());
                }
    %>
</html>

<form action='producto_main.jsp' method='post' name='fm2'>
    <input type='hidden' class='txt' name='id_producto' value='<%=id_producto%>'>
    <input type='hidden' class="txt" name='go' value=''>
</form>
<!-- para la fecha -->

