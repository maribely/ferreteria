
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
                if( document.fm.dni.value===''){
                    alert('Ingrese DNI por favor');
                    document.fm.dni.select(); //focus()
                    return false;
                }
                if( document.fm.nombre.value===''){
                    alert('Ingrese nombre por favor');
                    document.fm.nombre.select(); //focus()
                    return false;
                }
                if( document.fm.apellidos.value===''){
                    alert('Los apellidos son necesarios');
                    document.fm.apellidos.select(); //focus()
                    return false;
                }
                if(confirm('Esta seguro enviar?')) return true;
                else return false;
            }

            function eliminarConfirm() {
                if(confirm('Eliminar por completo?')){
                    document.fm2.action='cliente_save.jsp';
                    document.fm2.go.value='Eliminar';
                    document.fm2.submit();
                }
                else return false;
            }
            function sf(){ document.bus_fm.filter.select(); }

            // --></script>
        <script type="">
        </script>
<script type="text/javascript">
$(function() {
	$('#popupDatepicker').datepick();
});
</script>
    </head>
    <%
    String go = request.getParameter("go") == null ? "" : request.getParameter("go");
    String id_cliente = request.getParameter("id_cliente") == null ? "" : request.getParameter("id_cliente");
    try {
        Cliente d = new Cliente();
        // ubigeo = new Ubigeo();
        if (go.equals("Editar")) {
            ClienteData data = new ClienteData();
            d = data.findByPk(Integer.parseInt(id_cliente));
        //    UbigeoData ubigeoData = new UbigeoData();
       //     ubigeo = ubigeoData.findByPk(d.getUbigeo_id());
        }
        //onload="sf('dni');"
    %>
    
    <//body onload="sf('dni')">
    <body onload="sf('dni')">
        
       
        <table class='form' border='0' bgcolor="yellow" cellpadding='0' cellspacing='20' align='center'>
            <!-- head -->
            <tr><td colspan='5' class='title_table'>
                    <b>Formulario: Registro cliente</b>
                </td></tr>
            <tr>
                <td colspan='8' class='legend_bottom'>
                    &nbsp;<%= go%> cliente, por favor complete los datos con *.
                    <br>&nbsp;Luego precione el bot&oacute;n <b><%= go%></b> para guardar la informaci&oacute;n ingresada.
                </td></tr>

            <!-- img upload -->
            <form action='cliente_fm.jsp' method='post' name='fmUF' enctype='multipart/form-data'>
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

            <form action='cliente_save.jsp' name='fm' method='post' onsubmit='return enviar()'>

                <input type='hidden' class='txt' name='go' value='<%=go%>'>
                <input type='hidden' class='txt' name='id_cliente' value='<%=d.getId_cliente()%>'>
                <tr><td valign='top'>

                        <fieldset class='fieldset_middle'>
                            <legend class='legend'><b>Datos del cliente</b></legend>
                            <table>
                                <tr><td colspan='2' class='legend_bottom'>
                                        Instrucciones
                                    </td></tr>
                                <tr>
                                    <td>dni: *</td>
                                    <td><input type='text' class='txt' name='dni' value='<%=d.getDni()%>'></td>
                                </tr>
                                <tr>
                                    <td>nombre: *</td>
                                    <td><input type='text' class='txt' name='nombre' value='<%=d.getNombre()%>' size='40'></td>
                                </tr>
                                <tr>
                                    <td>apellidos: *</td>
                                    <td><input type='text' class='txt' name='apellidos' value='<%=d.getApellido()%>' size='40'></td>
                                </tr>
                                <tr>
                                    <td>sexo: </td>
                                    <td>
			<select name="sexo">
				<option value="M" <%if(d.getSexo().equals("M"))out.print("selected");%> >Masculino</option>
				<option value="F" <%if(d.getSexo().equals("F"))out.print("selected");%> >Femenino</option>
			</select>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>telefono </td>
                                    <td><input type='text' class='txt' name='telefono' value='<%=d.getTelefono()%>'  size='40'></td>
                                  

                              </tr>
                                <tr>
                                      <td>ruc </td>
                                    <td><input type='text' class='txt' name='ruc' value='<%=d.getRuc()%>'  size='40'></td>
                                                                   
                                </tr>
                                <tr>
                                    <td>E_mail </td>
                                    <td><input type='text' class='txt' name='e_mail' value='<%=d.getE_mail()%>'  size='40'></td>
                                                  
                                </tr>
                                
                                                              
                                
                                <tr>
                                    <td>direccion: </td>
                                    <td><input type='text' class='txt' name='direccion' value='<%=d.getDireccion()%>'  size='40'></td>
                                
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
                              
                            </table>
                            
                            <body background="menu\rol_1\imgs1\amazonas.jpg"></body>
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

<form action='cliente_main.jsp' method='post' name='fm2'>
    <input type='hidden' class='txt' name='id_cliente' value='<%=id_cliente%>'>
    <input type='hidden' class="txt" name='go' value=''>
</form>
<!-- para la fecha -->

