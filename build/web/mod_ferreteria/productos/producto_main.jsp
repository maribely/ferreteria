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
  <table border='0' id="articulo"  cellspacing='2' cellpadding='1' align="center" >
      <caption>LISTA DE PRODUCTOS</caption>
    <tr>
        <th># </th> <th>Id_producto</th> <th>Descripcion</th> <th>Precio</th> <th>Stok</th> <th>Id_prov</th>
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
        fprolloverstyle="color:#FFFFFF;background-color:#CDDBEB;"
        onClick="rollIn(this)" onDblClick="limpiar(this)" onMouseOver="rollIn(this)" onMouseOut="rollOut(this)" >
        <td align="right"><i><%=++i%></i></td>
        <td><%=p.getId_producto()%></td>
        <td><%=p.getDescripcion()%></td>
        <td><%=p.getPrecio()%></td>
        <td><%=p.getStok() %></td>
        <td><%=p.getId_prov() %></td>
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