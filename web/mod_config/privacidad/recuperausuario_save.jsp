<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_config.entity.Usuario"%>
<%@ page import="org.submit.ferreteria.mod_config.data.UsuarioData"%>
<html>
<head>
	<title>Save</title>
	<script src='../../recurso/js/js.js' type='text/javascript'></script>
	<script type='text/javascript' language='JavaScript'><!--
	    function sf(){ document.fm.btn.focus(); }
	// --></script>
	
</head>
<%
String go=request.getParameter("go")==null ? "":request.getParameter("go");
String usuario_id=request.getParameter("usuario_id")== null ? "0":request.getParameter("usuario_id");

Usuario d=new Usuario();
                d.setUsuario_id(Integer.parseInt( usuario_id ));
                //d.setClave(request.getParameter("clave")== null ? "":request.getParameter("clave"));
  CryptoString crypt=new CryptoString();
  //d.setClave(crypt.encrypt( d.getClave() )) ; es en vano pk se va a recuperar los datos de la db
                       
if( go.equals("Crear") )
	try{
		UsuarioData data=new UsuarioData();
		resp+=""+data.create(d)+" reg. create in usuario ";
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}

if( go.equals("Editar") )
	try{ 
		UsuarioData data=new UsuarioData();

                        d = data.findByPk(Integer.parseInt(usuario_id));//pk solo hay que modificar la clave y si clave es nueva

                        d.setClave(request.getParameter("clave")== null ? "":request.getParameter("clave"));
                        //CryptoString crypt = new CryptoString();
                        d.setClave(crypt.encrypt( request.getParameter("clave")== null ? "":request.getParameter("clave") ));
                        d.setClave_nueva(false);

		resp+=""+data.update(d)+" reg. edit in usuario ";
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}

if( go.equals("Eliminar") )
	try{ 
		UsuarioData data=new UsuarioData();
		resp+=""+data.delete(Integer.parseInt(usuario_id))+" reg. remove of usuario ";
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}
 %>
<body onLoad='sf()'>
  <meta http-equiv='Refresh' content='1; URL=recuperausuario_main.jsp'>
  <table align='center' class='save'>
    <form action='recuperausuario_main.jsp' name='fm' method='post'>
        <input type='hidden' name='go' value=''>
    <tr><td>
            Resultado: <%=resp%>        
        </td></tr>
    <tr><td align='center'>
        <input type='submit' class='btn' name='btn' value='Aceptar'>
        </td></tr>
    </form>
  </table>
</body>
</html>

