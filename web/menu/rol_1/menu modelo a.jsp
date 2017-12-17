
<LINK href="menu_imgs/master.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="menu_imgs/funciones.js" type=text/javascript></SCRIPT>

<BODY>
<% 
	String levelname=request.getSession().getAttribute("usuario_privilegio")+"";
	if (levelname.equals("1")) levelname="Administrador";
	if (levelname.equals("2")) levelname="Usuario";

	String logo="sinlogo.gif";
%>

<table width="138" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable imgs/gedusite.jpg-->
  <tr>
    <td height="80" align=center>
    <img src="../../recurso/imagen_submit/<%= logo %>">
    </td>
    <body background="recurso/foto/amazonas.jpg"></body>
  </tr>
  <tr>
  	<td height="6" align="center" valign="top" class="user">
  	
  	<%= levelname %>  	
  	</td>
  </tr>
</table>


<TABLE class=br1MenuCerrado id=menu_dominiosx cellSpacing=0  cellPadding=0 width=180 border=0>
<TR>
<TD vAlign=top align=left>
                      
                        

                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                                <TR vAlign=bottom align=left>
                            <TD width=20><IMG height=12 src="menu_imgs/br1_ic_dominio_1.gif" width=37></TD>
                            <TD><IMG height=8  src="menu_imgs/spacer.gif" width=141></TD>
                            <TD width=10>&nbsp;</TD>
                          </TR>
                          <TR vAlign=bottom align=left>
                            <TD width=20><IMG height=17  src="menu_imgs/br1_ic_dominio_2.gif" width=37></TD>
                            <TD class=br1MenuTitulo onclick="return opentree ('menu_dominiosx');"  vAlign=center 
                            background="menu_imgs/br1_menu_fdo.gif"><STRONG>Dominios</STRONG></TD>
                            <TD class=btHabilitar  onclick="return opentree ('menu_dominiosx');" 
                            width=10><IMG height=17 alt="Abrir / Cerrar Menu"  src="menu_imgs/spacer.gif" width=17></TD>
                          </TR>
                        </TABLE>
                              
                              
                              
                              
                              
</TD></TR>
<TR>
    <TD vAlign=top align=left>
                        
                <DIV class=tree>              
                        
                        
                        
                        

                <TABLE class=br1FondoItemsMenu cellSpacing=0 cellPadding=0 width="100%" border=0>
                  <TR>
                    <TD>
                               
                               
                               
                               <TABLE cellSpacing=0 cellPadding=0 width="100%"  border=0>
                               <TR vAlign=center align=left>
                                <TD width=2><IMG height=15 src="menu_imgs/spacer.gif"  width=3></TD>
                                <TD width=5><IMG height=7  src="menu_imgs/br1_ic_menu_item.gif"  width=8></TD>
                                <TD width=2><IMG height=15 src="menu_imgs/spacer.gif" width=3></TD>
                                <TD  >
                                	<a class=br1ItemMenu href="../../ventas/item/item_main.jsp" target='main'>Items</a></TD>
                                </TR>
                               </TABLE>
                                
                                
                                
                                
                                
			       </TD></TR>
			       <TR><TD>
                              
                              
                              
                              
                               <TABLE cellSpacing=0 cellPadding=0 width="100%"  border=0>
                               <TR vAlign=center align=left>
                                <TD width=2><IMG height=15 src="menu_imgs/spacer.gif"  width=3></TD>
                                <TD width=5><IMG height=7  src="menu_imgs/br1_ic_menu_item.gif"  width=8></TD>
                                <TD width=2><IMG height=15 src="menu_imgs/spacer.gif" width=3></TD>
                                <TD  >
                                	<a class=br1ItemMenu href="/park/index.php" target='main'>Parkeo de dominios</a></TD>
                                </TR>
                               </TABLE>
                                
                                
                                
                                
	            </TD></TR>
	            </DIV></TABLE>
         
</TD></TR>
</TABLE>


                  
<TABLE class=br1MenuCerrado id=menu_2 cellSpacing=0  cellPadding=0 width=180 border=0>
<TR>
<TD vAlign=top align=left>
                      
                        

                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                          <TR vAlign=bottom align=left>
                            <TD width=20><IMG height=12 src="menu_imgs/br1_ic_scripts_1.gif" width=37></TD>
                            <TD><IMG height=8  src="menu_imgs/spacer.gif" width=141></TD>
                            <TD width=10>&nbsp;</TD>
                          </TR>
                          <TR vAlign=bottom align=left>
                            <TD width=20><IMG height=17  src="menu_imgs/br1_ic_scripts_2.gif" width=37></TD>
                            <TD class=br1MenuTitulo onclick="return opentree ('menu_2');"  vAlign=center 
                            background="menu_imgs/br1_menu_fdo.gif"><STRONG>Dominios</STRONG></TD>
                            <TD class=btHabilitar  onclick="return opentree ('menu_2');" 
                            width=10><IMG height=17 alt="Abrir / Cerrar Menu"  src="menu_imgs/spacer.gif" width=17></TD>
                          </TR>
                        </TABLE>
                              
                              
                              
                              
                              
</TD></TR>
<TR>
    <TD vAlign=top align=left>
                        
                <DIV class=tree>              
                        
                        
                        
                        

                <TABLE class=br1FondoItemsMenu cellSpacing=0 cellPadding=0 width="100%" border=0>
                  <TR>
                    <TD>
                               
                               
                               
                               <TABLE cellSpacing=0 cellPadding=0 width="100%"  border=0>
                               <TR vAlign=center align=left>
                                <TD width=2><IMG height=15 src="menu_imgs/spacer.gif"  width=3></TD>
                                <TD width=5><IMG height=7  src="menu_imgs/br1_ic_menu_item.gif"  width=8></TD>
                                <TD width=2><IMG height=15 src="menu_imgs/spacer.gif" width=3></TD>
                                <TD  >
                                	<a class=br1ItemMenu href="../../ventas/item/item_main.jsp" target='main'>Items</a></TD>
                                </TR>
                               </TABLE>
                                
                                
                                
                                
                                
			       </TD></TR>
			       <TR><TD>
                              
                              
                              
                              
                               <TABLE cellSpacing=0 cellPadding=0 width="100%"  border=0>
                               <TR vAlign=center align=left>
                                <TD width=2><IMG height=15 src="menu_imgs/spacer.gif"  width=3></TD>
                                <TD width=5><IMG height=7  src="menu_imgs/br1_ic_menu_item.gif"  width=8></TD>
                                <TD width=2><IMG height=15 src="menu_imgs/spacer.gif" width=3></TD>
                                <TD  >
                                	<a class=br1ItemMenu href="../../ventas/item/item_main.jsp" target='main'>Items</a></TD>
                                </TR>
                               </TABLE>
                                
                                
                                
                                
	            </TD></TR>
	            </DIV></TABLE>
         
</TD></TR>
</TABLE>   


<TABLE class=br1MenuCerrado id=menu_f cellSpacing=0  cellPadding=0 width=180 border=0>
<TR>
<TD vAlign=top align=left>
                      
                        

                        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                          <TR vAlign=bottom align=left>
                            <TD width=20><IMG height=12 src="menu_imgs/br1_ic_usuario_1.gif" width=37></TD>
                            <TD><IMG height=8  src="menu_imgs/spacer.gif" width=141></TD>
                            <TD width=10>&nbsp;</TD>
                          </TR>
                          <TR vAlign=bottom align=left>
                            <TD width=20><IMG height=17  src="menu_imgs/br1_ic_usuario_2.gif" width=37></TD>
                            <TD class=br1MenuTitulo   vAlign=center 
                            background="menu_imgs/br1_menu_fdo.gif">
                            <a href="../logout.jsp" target='_top'><STRONG>Cerrar</STRONG></a>
                            </TD>
                          </TR>
                        </TABLE>
                              
                              
                              
                                      
</TD></TR>
</TABLE>   
