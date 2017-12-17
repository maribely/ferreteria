<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Proveedor"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.ProveedorData"%>

<html>
<head>
	<title>List</title>
	<script src="../../recurso/js/js.js" type="text/javascript"></script>		
</head>
<body>
  <table align='center' width='100%' cellspacing='0' style='font-family: Arial;'>
    <tr><th width='95%'>
            <%= Config.RAZON_SOCIAL %>
            <br>Reporte de proveedor
            <input type='button' class='btn_font_min' value=' ' onclick="font_size('articulo',false)">
            <input type='button' class='btn_font_max' value=' ' onclick="font_size('articulo',true)">
        </th></tr>
  </table>
  <table border='0' id="articulo"  cellspacing='2' cellpadding='1' align="center" >
    <tr><td colspan="11" align="center">
            REPORTE DE PROVEEDOR
        </td></tr>
    <tr>
        <th># </th> <th>Codigo</th> <th>Nombre</th> <th>Direcion</th> <th>Ruc</th> <th>Id_categ</th>
    </tr>
	<%	int i=0;
		try{
			ProveedorData data=new ProveedorData();
	        List lis = data.listByFilter("");
			Iterator lisIterator = lis.iterator();
			while(lisIterator.hasNext()) {
		            Proveedor p = (Proveedor) lisIterator.next();
	%>
    <tr <% if(i%2!=0) out.print( "class='intercalar'"); %>
        fprolloverstyle="color:#FFFFFF;background-color:#CDDBEB;"
        onClick="rollIn(this)" onDblClick="limpiar(this)" onMouseOver="rollIn(this)" onMouseOut="rollOut(this)" >
		<td align="right"><i><%=++i%></i></td>
		<td><%=p.getId_prov()%></td>
		<td><%=p.getNombre()%></td>
               <td><%=p.getDireccion()%></td>
		<td><%=p.getRuc()%></td>
		<td><%=p.getId_categ()%></td>

</tr>
	<%		}
		}catch(GlobalException e){
			throw new GlobalException(""+e.getMessage());
		}
		if(i==0) out.print("<br><br><b>0 Registros Encontrados</b>");
	%>
  </table>
</body>
</html>