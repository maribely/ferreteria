<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Proveedor"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.ProveedorData"%>
<html>
<head>
	<title>Search</title>
	<script src='../../recurso/js/js.js' type='text/javascript'></script>
</head>
<body onLoad='sf()'>
  <table align='center'>
    <tr><td align='center'>
        <input type='button' class='btn' value='Nuevo' onclick='nuevo()'>
        </td></tr>
  </table>
<%
	String go=request.getParameter("go")==null ? "":request.getParameter("go");
	String filter=request.getParameter("filter")==null ? "":request.getParameter("filter");
	filter=filter.trim().replaceAll(" ","%");
	int i=0;
	try{
		ProveedorData data=new ProveedorData();
        List lis = data.listByFilter(filter);
		Iterator lisIterator = lis.iterator();
		if( lisIterator.hasNext() ) {
%>
  <table border='0' cellspacing='2' cellpadding='1' align='center'>
    <tr><th>Elegir</th></tr>
    <form action='proveedor_fm.jsp' method='post' name='res_fm'>
        <input type='hidden' name='go' value='Editar'>
    <tr><td align='center'>
        <select name='id_prov' size='10'>
<%	
		do{
			i++;
			Proveedor p = (Proveedor) lisIterator.next();
			int id=p.getId_prov();
			out.print("<option value='"+id+"'");
			if(i==1) out.print(" selected");
			out.print(" > ");	out.print( p.getNombre()+" :"+p.getDireccion() +":"+p.getRuc() +":"+p.getId_categ() +""); out.print("</option>");
		}while( lisIterator.hasNext() );
%>			
        </select>
        </td></tr>
    <tr><td align='center'>
        <%= i %> Registros encontrados
        </td></tr>
    <tr><td align='center'>
        <input type='submit' class='btn' value='Continuar ->'>
        </td></tr>
    </form>
  </table>
<%		}
		else
        out.print("<br><br><b>B&uacute;squeda sin &eacute;xito, vuelva a intentar de la forma:</b>"+
         "<li>Basta colocar las iniciales del su nombre </li>"+
         "<br>p.e: <input type=text class=txt value=hond>"+
         "<br>");

	}catch(GlobalException e){
		throw new GlobalException(""+e.getMessage());
	}
%>
</body>
</html>

<form action='proveedor_fm.jsp' method='post' name='res_fm2'>
    <input type='hidden' name='go' value=''>
</form>

<script type='text/javascript' language='JavaScript'><!--
    function nuevo(){
      document.res_fm2.go.value='Crear';
      document.res_fm2.submit();
    }
    function enter() {
        if (window.event) keycd = window.event.keyCode;
        else if (evnt && evnt.which) keycd = evnt.which;
        else return ;
        if (keycd==13)
            document.res_fm.submit();
    }
    if (document.captureEvents) {
        document.captureEvents(Event.KEYPRESS);
        document.onkeypress = enter;
    }

<% if(i>0) out.print("document.res_fm.id_prov.onkeyup = enter;");
%>
  function sf(){ 
<% if(i>0) out.print("document.res_fm.id_prov.focus();");
%>  	 
  }
// --></script>



