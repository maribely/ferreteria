<html>
<head>
    <title>Logout</title>
    <script src="recurso/js/js.js" type="text/javascript"></script>
    <!--Redidige a la siguiente p�gina-->
    <!--<meta http-equiv="Refresh" content="1; URL=/ferreteria">-->
</head>

<body onLoad="selfp()">

<!--<h3>Cerrando sesi�n</h3>-->
<br>
<br>
<br>
<h2 style="color: #66ff00; text-align: center;">Sesi�n finalizada exitosamente!!</h2>
<div class="center">
    <a href="index.jsp" style="color: #ff9900; font-style: italic;">Ir a iniciar sesi�n</a>    
</div>



<% 
    HttpSession hs = request.getSession(false);
    hs.invalidate();
%>

        
</body>
</html>

<script language="JavaScript">
    caducarPagina(true);
    function caducarPagina(on){
        window.onbeforeunload = (on) ? cargarPagina : null;
    }
    function cargarPagina(){
        //navigator.ClearHistory;
        caducarPagina(false);
        window.location.href = '/ferreteria';
    }
    function click(){
        if (event.button===2){
            window.close() ; 
        }
    }
    document.onmousedown=click;
</script>
<%--
<script>if( window!=window.top) top.location.href=location.href;</script>--%>

<script>
function selfp(){
    if (self.parent.frames.length !== 0) self.parent.location=document.location; 
}
function click(){
    if (event===2){
        window.close() ; 
    }
}

</script>