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
 String claveac = request.getParameter("claveac")== null ? "":request.getParameter("claveac"); //clave actual
 String clavea = "";//clave actual de la db

if( clave.length() <3 ) throw new GlobalException("Clave nueva muy corta, debe ser de 3 a mas digitos");

  CryptoString crypt=new CryptoString();
	claveac=crypt.encrypt( claveac ) ;
 	clave=crypt.encrypt( clave ) ;

	tran=new ConnectDB();
	try{
		
	 	qry="select clave from usuario where usuario_id=?";
		PreparedStatement ps= tran.getConnection().prepareStatement(qry);
		ps.setInt(1, Integer.parseInt(usuario_id) );
		ResultSet rs= ps.executeQuery();
		if( rs.next() ){ 
			clavea=rs.getString("clave"); if(clavea==null) clavea="";
		}
		if( !claveac.equals(clavea) ) throw new GlobalException("Clave actual no valido");
		
	 	qry=" update usuario set"+
			" clave=?  "+
			" where usuario_id=?";
		ps= tran.getConnection().prepareStatement(qry);
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
	<form action="../../white.html" name="fm" method='post'>
	<tr>
		<td><h3>Felicitaciones!, Ud. a cambiado su clave correctamente</h3></td>
	</tr>
	<tr>
		<td>=======================</td>
		<meta http-equiv='Refresh' content='2; URL=../../white.html' >
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

