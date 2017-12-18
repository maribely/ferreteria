<%@ include file="../../include.jsp" %>
<//util:session validate="true" name="sesion_2" key="2"/>
<%@ page import="org.submit.ferreteria.entity.Cliente"%>
<%@ page import="org.submit.ferreteria.dao.ClienteDAO"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>List</title>
    <script src="../../recurso/js/js.js" type="text/javascript"></script>		
</head>
<body>
  <table align='center' width='100%' cellspacing='0' style='font-family: Arial;'>
    <tr><th width='95%'>
            <%= Config.RAZON_SOCIAL %>
            <br>Reporte de clientes
            <input type='button' class='btn_font_min' value=' ' onclick="font_size('articulo',false)">
            <input type='button' class='btn_font_max' value=' ' onclick="font_size('articulo',true)">
        </th></tr>
  </table>
  <table border='0' id="articulo"  cellspacing='2' cellpadding='1' align="center" >
      <caption>REPORTE DE CLIENTES</caption>
    <tr>
        <th># </th><th>Nombres</th><th>Apellidos</th> <th>DNI</th><th>Género</th><th>Email</th><th>Telefono</th><th>Dirección</th>
    </tr>
    <%  int i=0;
        try{
            ClienteDAO dao=new ClienteDAO();
            List lis = dao.listarCliente("");
            Iterator lisIterator = lis.iterator();
            while(lisIterator.hasNext()) {
                Cliente p = (Cliente) lisIterator.next();
     %>
    <tr <% if(i%2!=0) out.print( "class='intercalar'"); %>
        fprolloverstyle="color:#FFFFFF;background-color:#CDDBEB;"
        onClick="rollIn(this)" onDblClick="limpiar(this)" onMouseOver="rollIn(this)" onMouseOut="rollOut(this)" >
        <td align="right"><i><%=++i%></i></td>
        <td><%=p.getNombres()%></td>
        <td><%=p.getApellidos()%></td>
        <td align="rigth"><%=p.getDni()%></td>
        <td align="rigth"><%=p.getSexo()%></td>
        <td align="rigth"><%=p.getEmail()%></td>
        <td align="rigth"><%=p.getTelefono()%></td>
        <td align="rigth"><%=p.getDireccion()%></td>
    </tr>
    <%      }
        }catch(GlobalException e){
            throw new GlobalException(""+e.getMessage());
        }
        if(i==0) out.print("<br><br><b>0 Registros Encontrados</b>");
    %>
  </table>
</body>
</html>