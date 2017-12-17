<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="Session2" key="3"/>

<html>
<head>
	<title>UserChangeclaveForm</title>
	<script src="../../recurso/js/js.js" type="text/javascript"></script>
</head>
<% 
  String usuario_id =(String)request.getSession().getAttribute("usuario_id");
  if( usuario_id==null) throw new GlobalException("Sesion cerrada, vuelva a ingresar");
  String usuario = (String)request.getSession().getAttribute("usuario");
  String clave = request.getParameter("clave")== null ? "":request.getParameter("clave");
  String nameperson = "";
	tran=new ConnectDB();
	try{
	 	qry="select clave, nombres as usuario from usuario where usuario_id=?";
		PreparedStatement ps= tran.getConnection().prepareStatement(qry);
		ps.setInt(1, Integer.parseInt(usuario_id) );
		ResultSet rs= ps.executeQuery();
		if( rs.next() ){ 
			clave=rs.getString("clave"); if(clave==null) clave="";
			nameperson=rs.getString("usuario");
		}
		ps.close();
		rs.close();
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}finally{ tran.close();
	}
 %>

<table width='100%'><tr><td class='title' width='100%'>
	<img src='../../recurso/icono/user.gif' height='18' alt='' border='0'>
	Cambiar Password
</td></tr></table>
	

<body class="body" onLoad="sf()">

<table align='center' class="form" cellpadding="0" cellspacing="0" >
<tr>
	<td colspan="1" class='title_table'> <%= nameperson %> 
	</td>
</tr>
<tr><td>
	<table align='center'>
<form action="cambpasswd_save.jsp" name="fm" method='post' onsubmit="return submitx()">
		<input type="hidden" id="txt" name="usuario_id" value="<%=usuario_id%>">
	<tr>
		<td align="right">Nombre de usuario</td>
		<td><b><%= usuario %></b></td>
	</tr>
	<tr>
		<td align="right">Password actual</td>
		<td>
		<input type="password" class="txt" name="claveac" value="">
		</td>
	</tr>
	<tr>
		<td align="right">Nuevo password</td>
		<td><input type="password" class="txt" name="clave" value=""></td>
	</tr>
	<tr>
		<td align="right">Confirmar nueva clave</td>
		<td><input type="password" class="txt" name="clavec" value=""></td>
	</tr>
	</table>
	</td>
</tr>
<tr>
	<td colspan='1' height='10'></td>
</tr>	
<tr>
	<td colspan="1" class='fm_opcs'>
		<input type="submit" value="Cambiar clave">
		<input type="button" value="Cancel" onclick="cancel()">
	</td>
</tr>
</form>
</table>

</body>

</html>

<form action='../../white.html' method='post' name='fm2'>
	<input type="hidden" id="txt" name="usuario_id" value="<%=usuario_id%>">
</form>
<script type="text/javascript" language="JavaScript">
<!--
function sf(){ document.fm.claveac.focus(); }
function cancel(){ document.fm2.submit(); }

function submitx(){ 
	if( document.fm.claveac.value==''){
		alert('Complete password actual');
		document.fm.claveac.select();
		return false;
	}
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
// -->
</script>