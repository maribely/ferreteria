<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.entity.Cliente"%>
<%@ page import="org.submit.ferreteria.dao.ClienteDAO"%>
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
int id_cliente=request.getParameter("id_cliente")== null ? 0:Integer.parseInt(request.getParameter("id_cliente"));

Cliente d=new Cliente();
ClienteDAO dao=new ClienteDAO();

//d.setUsuario_id(Integer.parseInt( request.getSession().getAttribute("usuario_id").toString() ));
//out.print(d.getNombre());//quitar
System.out.println("Acción="+ go);
if( go.equals("Crear") )
    try{
        d.setNombres(request.getParameter("nombre"));
        d.setApellidos(request.getParameter("apellidos"));
        d.setDni(request.getParameter("dni"));
        d.setSexo(request.getParameter("sexo"));
        d.setEmail(request.getParameter("email"));
        d.setRuc(request.getParameter("ruc"));
        d.setTelefono(request.getParameter("telefono"));
        d.setDireccion(request.getParameter("direccion"));
                
        resp+=""+dao.create(d)+" reg. create in cliente ";
    }catch(GlobalException e){
        throw new GlobalException(e.getMessage());
    }

if( go.equals("Editar") )
    try{ 
        d.setId_cliente(id_cliente);
        d.setNombres(request.getParameter("nombre"));
        d.setApellidos(request.getParameter("apellidos"));
        d.setDni(request.getParameter("dni"));
        d.setSexo(request.getParameter("sexo"));
        d.setEmail(request.getParameter("email"));
        d.setRuc(request.getParameter("ruc"));
        d.setTelefono(request.getParameter("telefono"));
        d.setDireccion(request.getParameter("direccion"));

        resp+=""+dao.update(d)+" reg. edit in cliente ";
    }catch(GlobalException e){
        throw new GlobalException(""+e.getMessage());
    }
if( go.equals("Eliminar") )
    try{ 
        System.out.println(go+"==>"+id_cliente);
        resp+=""+dao.delete(id_cliente)+" reg. remove of cliente ";
    }catch(GlobalException e){
        throw new GlobalException(""+e.getMessage());
    }
 %>
<body onLoad='sf()'>
  <//meta http-equiv='Refresh' content='1; URL=cliente_main.jsp'>
  <table align='center' class='save'>
    <form action='cliente_main.jsp' name='fm' method='post'>
        <input type='hidden' name='go' value=''>
    <tr><td>
            Resultado: <%=resp%>        
        </td></tr>
    <tr><td align='center'>
        <input type='submit' class='btn' name='btn' aling='cliente_save.jsp'>
        </td></tr>
    </form>
  </table>
</body>
</html>

