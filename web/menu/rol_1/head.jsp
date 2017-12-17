<%@include file="../../include.jsp"%>
<!-- 326698 ffffff-->
<link rel="stylesheet" href="../../recurso/css/html.css"/>
<script src="../../recurso/js/util.js"></script>
<!--<script src="../../recurso/js/js.js" type="text/javascript"></script>-->
<script language="javascript">
<!-- 
  //Rojitas
  var control=1;
  function display(obj){
	if(control==1){
		parent.hiden.cols="21,*";
		parent.menu.scrolling="auto";
		control=0;
		//obj.style.background='beige url(net-inf/img/homeOver.gif) no-repeat top center';
		obj.value=">>";
	}else{
		parent.hiden.cols="200,*";
		parent.menu.scrolling="auto";
		control=1;
		//obj.style.background='beige url(net-inf/img/logoutOver.gif) no-repeat top center';
		obj.value="<<";
	}
  }

  function hiddenframe(){

  }
  function viewframe(){
	control=0;
  }

 -->
</script>


<html>
    
    
   	<head>
   	<title>Main Head</title>
        <body background="imgs/descarga.gif">
	<script src="../../recurso/js/js.js" type="text/javascript"></script>  
    
        
   	</head>
      
   	<BODY leftMargin=0 topMargin=0><!--bgColor=#DBE6F4  -->
	<table border='0' cellspacing='0' cellpadding='0' >
	<tr>
		<td class="bgTradeName" rowspan='3' align="right">
		<input type="button" title="Auto Hiden" style="border-style: none; background-color: transparent;" onmouseover="display(this)" value="x">
		</td>		
   		<td class="bgTradeName" colspan="2" align="right" style='font-size: 10pt;'>
		<%= Config.SIGLAS %>

		&nbsp;

   		</td>
   	</tr>
        
        
   	<tr style="background: White;">
            
            <td class="bgTradeName" colspan="80" align="left" width='100%' 
		 style='font-size: 14pt;font-weight: bold; background-image: url(../../recurso/icono/fondo_head.gif); background-repeat: no-repeat; vertical-align : bottom;background-position: right;'>
                <%= Config.RAZON_SOCIAL %>

            </td>
   	</tr>
                          
        
   	<tr>
               <td  colspan="1" class="copy">
                Integramos tu negocio con las tecnolog&iacute;as de informaci&oacute;n emergentes
            </td>
            <td colspan="1" align="right" class="copy">
            <% 
            String usuario = (String) request.getSession().getAttribute("usuario");
            String usuario_nombres = (String) request.getSession().getAttribute("usuario_nombres");
            if(usuario!=null){
                out.print("Bienvenido: <b>"+usuario+" ("+usuario_nombres+")</b> <a href='../../logout.jsp'>Cerrar sesión</a>");
            }else{
                out.print("Usuario: <b>Anónimo</b> <a href='../../autentica.jsp' target='_top'>Iniciar sesión</a>");
            }
            %>
	&nbsp;
            </td>
   	</tr>
   	</table>


     	</body>
       
</html>

