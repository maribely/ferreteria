<%@ include file="../../include.jsp" %>
<//util:session validate="false" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_config.entity.Usuario"%>
<%@ page import="org.submit.ferreteria.mod_config.data.UsuarioData"%>
<html>
    <head>
        <script src="../../recurso/js/js.js" type="text/javascript"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.js"></script>
        <style type="text/css">@import "../../recurso/ajax/jquery.datepick.css";</style>
        <script type="text/javascript" src="../../recurso/ajax/jquery.datepick.js"></script>
        <script type="text/javascript" src="../../recurso/ajax/jquery.datepick-es-PE.js"></script>

<script type="text/javascript">
$(function() {
	$('#popupDatepicker').datepick();
});
</script>
        <script type='text/javascript' language='JavaScript'><!--
            function cancelar(){ document.fm2.submit(); }
            function enviar(){
                if( document.fm.nombre.value==''){
                    alert('Complete nombres');
                    document.fm.nombres.select(); //focus()
                    return false;
                }
                if(confirm('Esta seguro enviar?')) return true;
                else return false;
            }
	
            function eliminarConfirm() {
                if(confirm('Eliminar por completo?')){
                    document.fm2.action='usuario_save.jsp';
                    document.fm2.go.value='Eliminar';
                    document.fm2.submit();
                }
                else return false;
            }
            function sf(){ document.fm.nombres.focus(); }
            // --></script>
    </head>
    <%//http://keith-wood.name/datepick.html
                String go = request.getParameter("go") == null ? "" : request.getParameter("go");
                String usuario_id = request.getParameter("usuario_id") == null ? "0" : request.getParameter("usuario_id");
                try {
                    Usuario d = new Usuario();
                    if (go.equals("Editar")) {
                        UsuarioData data = new UsuarioData();
                        d = data.findByPk( Integer.parseInt(usuario_id) );
                        CryptoString crypt = new CryptoString();
                        d.setClave(crypt.decrypt(d.getClave()));
                    }
    %>
    <body onload="sf()">
        <table class='form' border='0' cellpadding='0' cellspacing='0' align='center'>
            <!-- head -->
            <tr><td colspan='3' class='title_table'>
                    <b>Formulario: Registro usuario</b>
                </td></tr>
            <tr>
                <td colspan='3' class='legend_bottom'>
                    &nbsp;<%= go%> usuario, por favor complete los datos con *.
                    <br>&nbsp;Luego precione el bot&oacute;n <b><%= go%></b> para guardar la informaci&oacute;n ingresada.
                </td></tr>

            <!-- img upload -->
            <form action='usuario_fm.jsp' method='post' name='fmUF' enctype='multipart/form-data'>
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

            <form action='usuario_save.jsp' name='fm' method='post' onsubmit='return enviar()'>
                <input type='hidden' class='txt' name='go' value='<%=go%>'>
                <input type='hidden' class='txt' name='usuario_id' value='<%=d.getUsuario_id()%>'>
                <tr><td valign='top'>

                        <fieldset class='fieldset_middle'>
                            <legend class='legend'><b>Datos del usuario</b></legend>
                            <table>
                                <tr><td colspan='2' class='legend_bottom'>
                                        Instrucciones
                                    </td></tr>
                                <tr>
                                    <td>nombres: *</td>
                                    <td><input type='text' class='txt' name='nombres' value='<%=d.getNombres()%>' size='40'></td>
                                </tr>
                                <tr>
                                    <td>cargo: </td>
                                    <td><input type='text' class='txt' name='cargo' value='<%=d.getCargo()%>'></td>
                                </tr>
                                <tr>
                                    <td>usuario: </td>
                                    <td><input type='text' class='txt' name='usuario' value='<%=d.getUsuario()%>'></td>
                                </tr>
                                <tr>
                                    <td>clave: </td>
                                    <td><input type='password' class='txt' name='clave' value='<%=d.getClave()%>'></td>
                                </tr>
                                <tr>
                                    <td>es clave_nueva: </td>
                                    <td>
                                        <input type="radio" name="clave_nueva" value="False" <%if (!d.isClave_nueva()) {
                                                      out.print("checked");
                                                  }%> >No
                                        <input type="radio" name="clave_nueva" value="True" <%if (d.isClave_nueva()) {
                                                      out.print("checked");
                                                  }%> >Si (Fuerza cambio de clave al momento de ingresar)
                                    </td>
                                </tr>
                                <tr>
                                    <td>e_mail: </td>
                                    <td><input type='text' class='txt' name='e_mail' value='<%=d.getE_mail()%>'></td>
                                </tr>
                                <tr>
                                    <td>privilegio: </td>
                                    <td>
                                        <select name="privilegio" >
                                            <option value="" >Sin privilegio</option>
                                            <option value="1" <%if (d.getPrivilegio().equals("1")) {
                                          out.print("selected");
                                      }%>>Administrador</option>
                                            <option value="2" <%if (d.getPrivilegio().equals("2")) {
                                          out.print("selected");
                                      }%>>Usuario</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>es cuenta_activa: </td>
                                    <td>
                                        <input type="radio" name="cuenta_activa" value="True" <%if (d.isCuenta_activa()) {
                                                      out.print("checked");
                                                  }%> >Habilitado
                                        <input type="radio" name="cuenta_activa" value="False" <%if (!d.isCuenta_activa()) {
                                                      out.print("checked");
                                                  }%> >Deshabilitado
                                </tr>
                                <tr>
                                    <td>fecha_create: </td>
                                    <td><%=d.getFecha_create()%></td>
                                </tr>
                            </table>
                        </fieldset>


                    </td></tr>
                <tr><td valign='top'>

                        <fieldset class='fieldset_middle'>
                            <legend class='legend'><b>Testing</b></legend>
                            <table>
                                <tr><td colspan='2' class='legend_bottom'>
                                        No complete esta pesta&ntilde;a, es solo para pruebas
                                    </td></tr>
                                <tr>
                                    <td>Fecha: </td>
                                    <td><input type='text' class='txt' name='fecha' value='' id="popupDatepicker" size='10'></td>
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

<form action='usuario_main.jsp' method='post' name='fm2'>
    <input type='hidden' class='txt' name='usuario_id' value='<%=usuario_id%>'>
    <input type='hidden' class="txt" name='go' value=''>
</form>
