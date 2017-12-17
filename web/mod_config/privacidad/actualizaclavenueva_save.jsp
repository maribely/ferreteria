<%@include file="../../include.jsp"%>
<//util:session validate="true" name="Session2" key="3"/>

<html>
<head>
	<title>Save</title>
	<script src="../../recurso/js/js.js" type="text/javascript"></script>
</head>
<%
 String usuario_id = request.getParameter("usuario_id")== null ? "0":request.getParameter("usuario_id");
 String clave = request.getParameter("clave")== null ? "":request.getParameter("clave");//clave nueva
 String forward = request.getParameter("forward")== null ? "":request.getParameter("forward");


if( clave.length() <3 ) throw new GlobalException("Clave nueva muy corta, debe ser de 3 a mas digitos");

  CryptoString crypt=new CryptoString();
 	clave=crypt.encrypt( clave ) ;

	tran=new ConnectDB();
	try{
	 	qry=" update usuario set"+
			" clave=?, clave_nueva='False'  "+
			" where usuario_id=?";
		PreparedStatement ps= tran.getConnection().prepareStatement(qry);
		ps.setString(1, clave );
		ps.setInt(2, Integer.parseInt(usuario_id) );
		resp=" "+ps.executeUpdate()+" reg. in usuario";
		ps.close();
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}finally{ tran.close();
	}
 %>

<table align='center'><tr><td>
<body class="body" onLoad="sf()">
	<table class="save">
	<form action='../../<%=forward%>' name="fm" method='post'>
	<tr>
		<td><h3>Felicitaciones!, Ud. a cambiado su clave correctamente</h3></td>
	</tr>
	<tr>
		<td>=======================</td>
		<meta http-equiv='Refresh' content='2; URL=../../<%=forward%>' >
	</tr>
	<tr>
		<td align="center"><input type="submit" name="btn" value="Acept"></td>
	</tr>
	</form>
	</table>

</body>
</td></tr></table>
</html>
<script type="text/javascript" language="JavaScript">
<!--
function sf(){ document.fm.btn.focus(); }
// -->
</script>

