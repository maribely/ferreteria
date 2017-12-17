<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Proveedor"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.ProveedorData"%>
<html>
<head>
    
	<title>Save</title>
	<script src='../../recurso/js/js.js' type='text/javascript'></script>
	<script type='text/javascript' language='JavaScript'><!--
	    function sf(){ document.fm.btn.focus(); }
	// --></script>
	
</head>
<%
if(request.getSession().getAttribute("usuario_id")==null) throw new GlobalException("La operación requiere el usuario que registra. Sesion auto terminada, vuelva a ingresar");
String go=request.getParameter("go")==null ? "":request.getParameter("go");
String id_prov=request.getParameter("id_prov")== null ? "0":request.getParameter("id_prov");

Proveedor d=new Proveedor();
//persona_id, dni, nombres, sexo, estado_civil,    fecha_nac, grado_instruccion_id, ubigeo_id, direccion, usuario_id,     fecha_create
                d.setId_prov(Integer.parseInt( id_prov ));
                d.setNombre(request.getParameter("nombre")== null ? "":request.getParameter("nombre"));
                d.setDireccion(request.getParameter("direccion")== null ? "":request.getParameter("direccion"));
                d.setRuc(request.getParameter("ruc")== null ? "":request.getParameter("ruc"));
                d.setId_categ(request.getParameter("id_categ")== null ? "":request.getParameter("id_categ"));
                out.print(d.getNombre());//quitar
                
if( go.equals("Crear") )
	try{
		ProveedorData data=new ProveedorData();
		resp+=""+data.create(d)+" reg. create in proveedor ";
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}

if( go.equals("Editar") )
	try{ 
		ProveedorData data=new ProveedorData();
		resp+=""+data.update(d)+" reg. edit in proveedor ";
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}

if( go.equals("Eliminar") )
	try{ 
		ProveedorData data=new ProveedorData();
		resp+=""+data.delete(Integer.parseInt(id_prov))+" reg. remove of proveedor ";
	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}
 %>
<body onLoad='sf()'>
  <//meta http-equiv='Refresh' content='1; URL=proveedor_main.jsp'>
  <table align='center' class='save'>
    <form action='proveedor_main.jsp' name='fm' method='post'>
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

