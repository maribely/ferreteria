<%@ include file="../../include.jsp" %>
<//util:session validate="false" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_config.entity.Usuario"%>
<%@ page import="org.submit.ferreteria.mod_config.data.UsuarioData"%>
<html>
    <head>
        <script src="../../recurso/js/js.js" type="text/javascript"></script>
        <script type='text/javascript' language='JavaScript'><!--
            function cancelar(){ document.fm2.submit(); }
            function enviar(){
                if( document.fm.clave.value==''){
                    alert('Complete nuevo password');
                    document.fm.clave.select();
                    return false;
                }
                if( document.fm.clave.value==document.fm.clavec.value){
                    return true;
                }
                else{
                    alert('Passwrds distintos');
                    document.fm.clave.select();
                    document.fm.clavec.value="";
                    return false;
                }

            }
	
            function sf(){ document.fm.clave.select(); }
            // --></script>
    </head>
    <%
                String go = request.getParameter("go") == null ? "" : request.getParameter("go");
                String usuario_id = request.getParameter("usuario_id") == null ? "" : request.getParameter("usuario_id");
                try {
                    Usuario d = new Usuario();
                    if (go.equals("Editar")) {
                        UsuarioData data = new UsuarioData();
                        d = data.findByPk(Integer.parseInt(usuario_id));
                        CryptoString crypt = new CryptoString();
                        d.setClave(crypt.decrypt(d.getClave()));
                    }
    %>
    <body onload="sf()">
        <table class='form' border='0' cellpadding='0' cellspacing='0' align='center'>
            <!-- head -->
            <tr><td colspan='3' class='title_table'>
                    <b>Formulario: Recupara usuario</b>
                </td></tr>
            <tr>
                <td colspan='3' class='legend_bottom'>
                    &nbsp;<%= go%> usuario, por favor complete los datos con *.
                    <br>&nbsp;Luego precione el bot&oacute;n <b><%= go%></b> para guardar la informaci&oacute;n ingresada.
                </td></tr>

            <!-- img upload -->
            <form action='recuperausuario_fm.jsp' method='post' name='fmUF' enctype='multipart/form-data'>
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

            <form action='recuperausuario_save.jsp' name='fm' method='post' onsubmit='return enviar()'>
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
                                    <td>Nombres: *</td>
                                    <td><%=d.getNombres()%></td>
                                </tr>
                                <tr>
                                    <td>Cargo: </td>
                                    <td><%=d.getCargo()%></td>
                                </tr>
                                <tr>
                                    <td>E Mail: </td>
                                    <td><<%=d.getE_mail()%></td>
                                </tr>
                                <tr>
                                    <td>Usuario: </td>
                                    <td><b><%=d.getUsuario()%></b></td>
                                </tr>
                                <tr>
                                    <td>Privilegio: </td>
                                    <td><%
                                                        if (d.getPrivilegio().equals("1")) {
                                                            out.print("Administrador");
                                                        }
                                                        if (d.getPrivilegio().equals("2")) {
                                                            out.print("usuario");
                                                        }
                                        %>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Cuenta activa?: </td>
                                    <td>
                                        <%
                                                            if (d.isCuenta_activa()) {
                                                                out.print("SI");
                                                            } else {
                                                                out.print("NO");
                                                            }
                                        %>
                                </tr>
                                <tr>
                                    <td>Fecha alta: </td>
                                    <td><%=d.getFecha_create()%></td>
                                </tr>

                                <tr>
                                    <td>Clave nueva: </td>
                                    <td><input type='password' class='txt' name='clave' value='<%=d.getClave()%>'></td>
                                </tr>
                                <tr>
                                    <td>Confirmar clave nueva:</td>
                                    <td><input type="password" class="txt" name="clavec" value=""> <br>El ingreso será directo, no pedirá cambiar clave</td>
                                </tr>

                            </table>
                        </fieldset>


                    </td></tr>

                <!-- foot -->
                <tr><td colspan='3' height='10'></td></tr>
                <tr><td colspan='3' class='fm_opcs'>
                        <input type='submit' class='btn' value='<%= go%>'>
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

<form action='recuperausuario_main.jsp' method='post' name='fm2'>
    <input type='hidden' class='txt' name='usuario_id' value='<%=usuario_id%>'>
    <input type='hidden' class="txt" name='go' value=''>
</form>
<script type="text/javascript" language="JavaScript">
    <!--
    
    // -->
</script>