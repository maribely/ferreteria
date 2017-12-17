<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Factura"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.FacturaData"%>
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
String numero_factura=request.getParameter("numero_factura")== null ? "0":request.getParameter("numero_factura");

System.out.println("Factura_save==>");
System.out.println(request);
System.out.println("Usuario ID:"+request.getSession().getAttribute("usuario_id"));

Factura d=new Factura();
//persona_id, dni, nombres, sexo, estado_civil,    fecha_nac, grado_instruccion_id, ubigeo_id, direccion, usuario_id,     fecha_create
d.setNumero_factura(Integer.parseInt(numero_factura));
d.setCodigo_client(request.getParameter("codigo_client")== "" ? "":request.getParameter("codigo_client"));
d.setRuc_client(request.getParameter("ruc_client")== "" ? "":request.getParameter("ruc_client"));
d.setSub_total(request.getParameter("sub_total")== "" ? "":request.getParameter("sub_total"));
d.setIgv(request.getParameter("igv")== "" ? "":request.getParameter("igv"));
d.setTotal(request.getParameter("total")== "" ? "":request.getParameter("total"));
d.setFecha(request.getParameter("fecha")== "" ? "":request.getParameter("fecha"));
//d.setNumero_det(Integer.parseInt( request.getSession().getAttribute("numero_det").toString() ));
//d.setId_cliente(Integer.parseInt( request.getSession().getAttribute("id_cliente").toString() ));
d.setUsuario_id(Integer.parseInt( request.getSession().getAttribute("usuario_id").toString() ));


//out.print(d.getRuc_client());//quitar
                
if( go.equals("Crear") )
    try{
        FacturaData data=new FacturaData();
        resp+=""+data.create(d)+" reg. create in factura ";
    }catch(GlobalException e){
        throw new GlobalException(""+e.getMessage());
    }

if( go.equals("Editar") )
    try{ 
        FacturaData data=new FacturaData();
        resp+=""+data.update(d)+" reg. edit in factura ";
    }catch(GlobalException e){
        throw new GlobalException(""+e.getMessage());
    }

if( go.equals("Eliminar") )
    try{ 
        FacturaData data=new FacturaData();
        resp+=""+data.delete(Integer.parseInt(numero_factura))+" reg. remove of factura ";
    }catch(GlobalException e){
        throw new GlobalException(""+e.getMessage());
    }
 %>
<body onLoad='sf()'>
  <//meta http-equiv='Refresh' content='1; URL=factura_main.jsp'>
  <table align='center' class='save'>
    <form action='factura_main.jsp' name='fm' method='post'>
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

