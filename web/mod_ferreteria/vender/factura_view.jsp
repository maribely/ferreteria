<%--
    Document   : listadiscap_main
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../../include.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="org.submit.omaped.mod_omaped.entity.Ubigeo"%>
<%@ page import="org.submit.omaped.mod_omaped.data.UbigeoData"%>
<%@ page import="org.submit.omaped.mod_omaped.entity.Persona"%>
<%@ page import="org.submit.omaped.mod_omaped.data.PersonaData"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../../recurso/js/js.js" type="text/javascript"></script>
    </head>
<%
String region_id = request.getParameter("region_id") == null ? "08" : request.getParameter("region_id");
String provincia_id = request.getParameter("provincia_id") == null ? "0808" : request.getParameter("provincia_id");
String distrito_id = request.getParameter("distrito_id") == null ? "" : request.getParameter("distrito_id");
UbigeoData ubigeoData = new UbigeoData();
                String provincia_id_t="";
                if(!provincia_id.equals("")) provincia_id_t=provincia_id.substring(2, 4);
                String distrito_id_t="";
                if(!distrito_id.equals("")) distrito_id_t=distrito_id.substring(4, 6);
%>
    <body>
  <table align='center' width='100%' cellspacing='0' style='font-family: Arial;'>
    <tr><th width='95%'>
            <%= Config.RAZON_SOCIAL %>
            <br>REPORTE DE PERSONAS CON DISCAPACIDAD
            <input type='button' class='btn_font_min' value=' ' onclick="font_size('articulo',false)">
            <input type='button' class='btn_font_max' value=' ' onclick="font_size('articulo',true)">
        </th></tr>
  </table>
  <table border='0' id="articulo"  cellspacing='2' cellpadding='1' align="center" >
      <tr><td colspan="11" align="center">
<%
if(region_id.equals("")) out.print("Reporte a nivel nacional ");
if(provincia_id.equals("")) out.print("Reporte por provincias ");
//if(!region_id.equals("")) out.print("Regi&oacute;n: " + region_id+" " +ubigeoData.findRegionByPk(region_id).getRegion()+" <br>");
//if(!provincia_id.equals("")) out.print("Provincia: " + provincia_id+" " +ubigeoData.findProvinciaByPk(provincia_id).getProvincia()+" <br>");
//if(!distrito_id.equals("")) out.print("Distrito: " + distrito_id+" "+ ubigeoData.findByPk(distrito_id).getDistrito()+" <br>");
%>
        </td></tr>

	<%
 	String region="";
 	String regionx="";
 	String provincia="";
 	String provinciax="";
 	String distrito="";
 	String distritox="";

        int i=0;
		try{
			PersonaData data=new PersonaData();
	        List lis = data.listByLocality(region_id+provincia_id_t+distrito_id_t);
			Iterator lisIterator = lis.iterator();
			while(lisIterator.hasNext()) {
		            Persona p = (Persona) lisIterator.next();
                            Ubigeo d= ubigeoData.findByPk(p.getUbigeo_id());
	%>

    <%
			regionx=p.getUbigeo_id().substring(0, 2);
			if(!regionx.equals(region)){
				region=regionx;
 %>
	<tr>
		<td colspan="7" height='20'></font>
    	</td>
	</tr>
	<tr>
            <td colspan="7" align="center"> <font color="" size="+1">------------- Region: <%= ubigeoData.findRegionByPk(region).getRegion()  %> ------------</font>
    	</td>
	</tr>
<%			}
%>
<%
			provinciax=p.getUbigeo_id().substring(0, 4);
			if(!provinciax.equals(provincia)){
				provincia=provinciax;

 %>
	<tr>
		<td colspan="7" height='20'></font>
    	</td>
	</tr>
	<tr>
            <td colspan="7"> <font color="" size="+0.5">Provincia: <%= ubigeoData.findProvinciaByPk(provincia).getProvincia()  %></font>
    	</td>
	</tr>
<%			}
%>
<%
			distritox=p.getUbigeo_id();
			if(!distritox.equals(distrito)){
				distrito=distritox;

 %>
	<tr>
		<td colspan="2"><b>Distrito:</b> <font color="" size="+0.2"> <%= ubigeoData.findByPk(distrito).getDistrito() %></font>
    	</td>
	</tr>
	<tr>
        <th># </th> <th>DNI</th> <th>Nombre</th> <th>Fecha Nac</th> <th>Direcci&oacute;n</th>
	</tr>
<%			}
%>

    <tr <% if(i%2!=0) out.print( "class='intercalar'"); %>
        fprolloverstyle="color:#FFFFFF;background-color:#CDDBEB;"
        onClick="rollIn(this)" onDblClick="limpiar(this)" onMouseOver="rollIn(this)" onMouseOut="rollOut(this)" >
		<td align="center"><i><%=++i%></i></td>
		<td><%=p.getDni()%></td>
		<td><%=p.getNombres()%></td>
		<td><%=p.getFecha_nac()%></td>
		<td><%=p.getDireccion()%>. <%=d.getDistrito() +" "+d.getProvincia() +" "+d.getRegion() +" ("+p.getUbigeo_id() +") " %></td>
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
