<%--
    Document   : listadiscap_main
    
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../../include.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="org.submit.ferreteria.mod_ferreteria.entity.Factura"%>
<%@ page import="org.submit.ferreteria.mod_ferreteria.data.FacturaData"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../../recurso/js/js.js" type="text/javascript"></script>
<script type="text/javascript" language="JavaScript">
<!--
function getProvincias() { 	document.fm1.submit(); }
function getDistritos() { 	document.fm2.submit(); }
// -->
</script>
    </head>
<%
String numero_factura = request.getParameter("numero_factura") == null ? "08" : request.getParameter("numero_factura");
String provincia_id = request.getParameter("provincia_id") == null ? "0808" : request.getParameter("provincia_id");
String distrito_id = request.getParameter("distrito_id") == null ? "" : request.getParameter("distrito_id");
//if(region_id==null ) { distrito_id=""; provincia_id=""; distrito_id="";}
//if(provincia_id==null ) { provincia_id=""; distrito_id="";}
if(region_id.equals("")) { provincia_id=""; distrito_id="";}
if(provincia_id.equals("")) { distrito_id="";}

UbigeoData data = new UbigeoData();
%>
    <body>
        <table width='100%'><tr><td class='th2' width='100%' align='center'>
		Reporte de personas con discapacidad :
                </td></tr>
        </table>
	<table  align="center">
		<tr><td>
		<form action="discap_show.jsp" method='post' name='fm1'>
		<table><tr><td>
                        <%
                                    List lis = data.listRegiones();
                                    Iterator lisIterator = lis.iterator();
                        %>

                        Regi&oacute;n:<select name='region_id' onchange="getProvincias()">
                            <option value="">--En todo el Per&uacute;--</option>
                            <%if(lisIterator.hasNext())
                                        do {

                                            Ubigeo p = (Ubigeo) lisIterator.next();
                                            String id = p.getUbigeo_id();
                                            out.print("<option value='" + id + "'");
                                            if (id.equals( region_id ) ) {
                                                out.print(" selected");
                                            }
                                            out.print(" > ");
                                            out.print(p.getRegion() + " :" + id + "");
                                            out.print("</option>");
                                        } while (lisIterator.hasNext());
                            %>
                        </select>
		</td></tr></table>
                <input type="hidden" name="provincia_id" value="" id="txt">
		<input type="hidden" name="go" value="view" id="txt">
		</form>

                        <%
                                    List lis2 = data.listProvincias(region_id);
                                    Iterator lisIterator2 = lis2.iterator();
                        %>

		<form action="discap_show.jsp" method='post' name='fm2'>
		<table><tr><td>
                        Provincia: <select name='provincia_id' onchange="getDistritos()">
                            <option value="">--Todos--</option>
                            <%
                            if(!region_id.equals(""))
                            if(lisIterator2.hasNext())
                                        do {

                                            Ubigeo p = (Ubigeo) lisIterator2.next();
                                            String id = p.getUbigeo_id();
                                            out.print("<option value='" + id + "'");
                                            if (id.equals( provincia_id )) {
                                                out.print(" selected");
                                            }
                                            out.print(" > ");
                                            out.print(p.getProvincia() + " :" + id + "");
                                            out.print("</option>");
                                        } while (lisIterator2.hasNext());
                            %>
                        </select>
		</td></tr></table>
		<input type="hidden" name="region_id" value="<%=region_id%>" id="txt">

                <input type="hidden" name="go" value="view" id="txt">
		</form>

                <%
                String provincia_id_t="";
                if(!provincia_id.equals("")) provincia_id_t=provincia_id.substring(2, 4);
                                    List lis3 = data.listDistritos(region_id+provincia_id_t);
                                    Iterator lisIterator3 = lis3.iterator();
                        %>

		<form action="discap_view.jsp" method='post' name='fm3' target="iframe">
		<table><tr><td>
                        Distrito:<select name='distrito_id'>
                            <option value="">--Todos--</option>
                            <%
                            if(!provincia_id.equals(""))
                            if(lisIterator3.hasNext())
                                        do {

                                            Ubigeo p = (Ubigeo) lisIterator3.next();
                                            String id = p.getUbigeo_id();
                                            out.print("<option value='" + id + "'");
                                            if (id.equals( distrito_id )) {
                                                out.print(" selected");
                                            }
                                            out.print(" > ");
                                            out.print(p.getDistrito() + " :" + id + "");
                                            out.print("</option>");
                                        } while (lisIterator3.hasNext());

                            %>

			<input type="submit" value="Ver">

		</td></tr></table>
                <input type="hidden" name="region_id" value="<%=region_id%>" id="txt">
                <input type="hidden" name="provincia_id" value="<%=provincia_id%>" id="txt">
		<input type="hidden" name="go" value="view" id="txt">
		</form>

		</td>
	</tr>
	</table>


    </body>
</html>
