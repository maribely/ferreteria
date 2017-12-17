<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Producto"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.ProductoData"%>

<html>
<head>
	<title>List</title>
	<script src="../../recurso/js/js.js" type="text/javascript"></script>		
</head>
<body>
  <table align='center' width='100%' cellspacing='0' style='font-family: Arial;'>
    <tr><th width='95%'>
            <%= Config.RAZON_SOCIAL %>
            <br>Reporte de producto
            <input type='button' class='btn_font_min' value=' ' onclick="font_size('articulo',false)">
            <input type='button' class='btn_font_max' value=' ' onclick="font_size('articulo',true)">
        </th></tr>
  </table>
  <table border='0' id="articulo"  cellspacing='2' cellpadding='1' align="center" >
    <tr><td colspan="11" align="center">
            REPORTE DE PRODUCTOS
        </td></tr>
    <tr>
        <th># </th> <th>Codigo</th> <th>Descripcion</th> <th>Precio</th> <th>Stok</th> <th>Id_prov</th>
    </tr>
	<%	int i=0;
		try{
			ProductoData data=new ProductoData();
	        List lis = data.listByFilter("");
			Iterator lisIterator = lis.iterator();
			while(lisIterator.hasNext()) {
		            Producto p = (Producto) lisIterator.next();
	%>
    <tr <% if(i%2!=0) out.print( "class='intercalar'"); %>
        fprolloverstyle="color:#FE2EF7;background-color:#64FE2E;"
        onClick="rollIn(this)" onDblClick="limpiar(this)" onMouseOver="rollIn(this)" onMouseOut="rollOut(this)" >
		<td align="right"><i><%=++i%></i></td>
		<td><%=p.getId_producto()%></td>
		<td><%=p.getDescripcion()%></td>
               <td><%=p.getPrecio()%></td>
		<td><%=p.getStok()%></td>
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