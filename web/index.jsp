<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    <script src="recurso/js/js.js" type="text/javascript"></script>
  
</head



<body>
    <center>
      
        <marquee><h1> Sistema Ferreteria </h1></marquee>
        <h4></h4>
        <hr color="yellow">
    </center>
    
<body background="recurso/foto/amazonas.jpg"></body>
<center>
    <%--   <table border="0" cellspacing="6" cellpadding="0"  align="center" class="xform ">  --%>
       
    <center><table border="10" bgcolor="yellow" cellpadding="30" cellspacing="30" width="25%" ></center>
 <title>Aceros Arequipa- Day 1 Sign In</title>

        
        <form  action="autentica.jsp" method="post" name="login" >
            <tr>
                <td rowspan="10" style="vertical-align : middle" align="center"  >
                    
                </td>
            </tr>
            <tr>
            <h1><td><b>U s u a r i o </b><br></h1>
            
                    <input type="text" id="usuario" name="usuario"  value="" size="15" class="txt"  ></td>
            </tr>
            <tr>
           <td><b>C l a v e </b><br>
                    <input type="password" id="clave" name="clave"  value="" size="15" class="txt"></td>
            </tr>
            <tr>
                <td ><br>
                    <input type="submit" value="" class="btn_singin" ></td>
            </tr>
            <tr>
                <td>Si olvid&oacute; su contrase&ntilde;a, comun&iacute;quese con su administrador del sistema</td>
            </tr>
            
        </form>
    </table>
</center>
</body>
</html>
