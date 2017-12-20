
<%@ include file="../../include.jsp" %>
<//util:session validate="false" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Cliente"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.ClienteData"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Producto"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.ProductoData"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Factura"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.FacturaData"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Proveedor"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.ProveedorData"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Categoria"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.CategoriaData"%>

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
            function cancelar() {
                document.fm2.submit();
            }
            function enviar() {
                if (document.fm.numero_factura.value === '') {
                    alert('Complete numero_factura');
                    document.fm.numero_factura.select(); //focus()
                    return false;
                }
                if (confirm('Esta seguro enviar?'))
                    return true;
                else
                    return false;
            }

            function eliminarConfirm() {
                if (confirm('Eliminar por completo?')) {
                    document.fm2.action = 'factura_save.jsp';
                    document.fm2.go.value = 'Eliminar';
                    document.fm2.submit();
                }
                else
                    return false;
            }

            // --></script>
        <script type="">
        </script>
        <script type="text/javascript">
            $(function () {
                $('#popupDatepicker').datepick({dateFormat: "yyyy-mm-dd"});
            });
        </script>
    </head>
    <%
        String go = request.getParameter("go") == null ? "" : request.getParameter("go");
        String numero_factura = request.getParameter("numero_factura") == null ? "" : request.getParameter("numero_factura");
        try {
            Factura d = new Factura();
            // ubigeo = new Ubigeo();
            if (go.equals("Editar")) {
                FacturaData data = new FacturaData();
                d = data.findByPk(Integer.parseInt("numero_factura"));
        //    UbigeoData ubigeoData = new UbigeoData();
                //     ubigeo = ubigeoData.findByPk(d.getUbigeo_id());
            }
        //onload="sf('dni');"
%>
    <//body onload="sf(' codigo_client')">
    <!--<body onload="sf('numero_factura')">-->
    <table class='form' border='0' cellpadding='0' cellspacing='0' align='center'>
        <!-- head -->
        <tr><td colspan='3' class='title_table'>
                <b>Formulario: Registro factura</b>
            </td></tr>
        <tr>
            <td colspan='3' class='legend_bottom'>
                &nbsp;<%= go%> factura, por favor complete los datos con *.
                <br>&nbsp;Luego precione el bot&oacute;n <b><%= go%></b> para guardar la informaci&oacute;n ingresada.
            </td></tr>

        <!-- img upload -->
        <form action='factura_fm.jsp' method='post' name='fmUF' enctype='multipart/form-data'>
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

        <form action='factura_save.jsp' name='fm' method='post' onsubmit='return enviar()'>

            <input type='hidden' class='txt' name='go' value='<%=go%>'>
            <input type='hidden' class='txt' name='numero_factura' value='<%=d.getNumero_factura()%>'>
            <tr><td valign='top'>

                    <fieldset class='fieldset_middle'>
                        <legend class='legend'><b>Datos de la factura </b></legend>
                        <table>
                            <tr><td colspan='2' class='legend_bottom'>
                                    Instrucciones
                                </td></tr>

                            <tr>
                                <td>codigo cliente</td>
                                <td><input type='text' class='txt' name='codigo_client' value='<%=d.getCodigo_client()%>'></td>
                            </tr>

                            <tr>
                                <td>ruc cliente</td>
                                <td><input type='text' class='txt' name='ruc_client' value='<%=d.getRuc_client()%>'></td>
                            </tr>
                            <tr>
                                <td>sub_total *</td>
                                <td><input type='text' class='txt' name='sub_total' value='<%=d.getSub_total()%>' size='40'></td>
                            </tr>
                            <tr>

                            <tr>
                                <td>igv: </td>
                                <td><input type='text' class='txt' name='igv' value='<%=d.getIgv()%>'></td>
                            </tr>             


                            <tr>
                                <td>total: </td>
                                <td><input type='text' class='txt' name='total' value='<%=d.getTotal()%>'></td>
                            </tr>

                            <tr>
                                <td>fecha: </td>
                                <td><input type='text' class='txt' name='fecha' value='<%=d.getFecha()%>' id="popupDatepicker" size='10'></td>
                                </td>
                            </tr>

                            <!--                                <tr>
                                                                <td>numero_detalle: </td>
                                                                <td><input type='text' class='txt' name='numero_det' value='<%=d.getNumero_det()%>'></td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td>id_cliente: </td>
                                                                <td><input type='text' class='txt' name='id_cliente' value='<%=d.getId_cliente()%>'></td>
                                                            </tr>-->


                            </tr>
                            <tr>
                                </td>
                            </tr>
                            <tr>
                                <!--           <td>fecha_nac: </td>
                                           </td> -->
                            </tr>
                            <tr>
                                <!--            <td>grado_instruccion_id: </td>
                                           <td>
                                <%

                                %> -->
                                </td>
                            </tr>
                            <tr>

                            <tr>

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
                                <td>Ingrese las 3 iniciales del nombre del distrito, si no recuerda ingrese las iniciales de la provincia o región
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

<form action='factura_main.jsp' method='post' name='fm2'>
    <input type='hidden' class='txt' name='numero_factura' value='<%=numero_factura%>'>
    <input type='hidden' class="txt" name='go' value=''>
</form>
<!-- para la fecha -->

