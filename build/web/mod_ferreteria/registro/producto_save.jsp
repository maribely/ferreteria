<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Producto"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.ProductoData"%>
<html>
<head>
    
	<title>Save</title>
	<script src='../../recurso/js/js.js' type='text/javascript'></script>
	<script type='text/javascript' language='JavaScript'><!--
	    function sf(){ document.fm.btn.focus(); }
	// --></script>
	
</head>
<%
if(request.getSession().getAttribute("id_producto")==null) throw new GlobalException("La operación requiere el usuario que registra. Sesion auto terminada, vuelva a ingresar");
String go=request.getParameter("go")==null ? "":request.getParameter("go");
String id_producto=request.getParameter("id_producto")== null ? "0":request.getParameter("id_producto");

Producto d=new Producto();
//persona_id, dni, nombres, sexo, estado_civil,    fecha_nac, grado_instruccion_id, ubigeo_id, direccion, usuario_id,     fecha_create
                d.setId_producto(Integer.parseInt( id_producto ));
                d.setDescripcion(request.getParameter("descripcion")== null ? "":request.getParameter("descripcion"));
                d.setPrecio(request.getParameter("precio")== null ? "":request.getParameter("precio"));
                d.setStok(request.getParameter("stok")== null ? "":request.getParameter("stok"));
               // d.setId_prov(request.getParameter("id_prov")== null ? "":request.getParameter("id_prov"));
                d.setId_prov(Integer.parseInt( request.getSession().getAttribute("id_prov").toString() ));
                out.print(d.getDescripcion());//quitar

if( go.equals("Crear") )
	try{
		ProductoData data=new ProductoData();
		resp+=""+data.create(d)+" reg. create in producto ";
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}

if( go.equals("Editar") )
	try{ 
		ProductoData data=new ProductoData();
		resp+=""+data.update(d)+" reg. edit in producto ";
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}

if( go.equals("Eliminar") )
	try{ 
		ProductoData data=new ProductoData();
		resp+=""+data.delete(Integer.parseInt(id_producto))+" reg. remove of producto ";
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}
 %>
<body onLoad='sf()'>
  <//meta http-equiv='Refresh' content='1; URL=producto_main.jsp'>
  <table align='center' class='save'>
    <form action='producto_main.jsp' name='fm' method='post'>
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

