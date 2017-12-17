//font_size: agranda y achica la letras de un determinado contendo
function font_size(contenido, increase)
{
    fsize = document.getElementById(contenido).style.fontSize ? document.getElementById(contenido).style.fontSize: '16 px';
    fsize = fsize.slice(0,-2);
    if (increase == true)
    {
        fsize++;
    } else
    {
        fsize--;
    }
    if (fsize>=24) fsize=24;
    if (fsize<=11) fsize=11;
    return document.getElementById(contenido).style.fontSize = fsize+'px';
}




//<!Name:animaButton.js>
/*Este .js sirve p' cambiar la apariencia de un button o submit
Ej: <input type="button" name="btnAceptar" value="Aceptar" 
		   fprolloverstyle="color:3300FF;background-color:33CC33;border-color:339933;"
	   	   onmouseover="rollIn(this)" onmouseout="rollOut(this)">*/
function rollIn(el){
		var ms = navigator.appVersion.indexOf("MSIE")
		ie4 = (ms>0) && (parseInt(navigator.appVersion.substring(ms+5, ms+6)) >= 4)
		if(ie4){
			el.initstyle=el.style.cssText;el.style.cssText=el.fprolloverstyle
		}//if
		el.style.cursor = 'hand';
}//rollIn
function rollOut(el){
		var ms = navigator.appVersion.indexOf("MSIE")
		ie4 = (ms>0) && (parseInt(navigator.appVersion.substring(ms+5, ms+6)) >= 4)
		if(ie4){
			el.style.cssText=el.initstyle;
		}//if
}//rollOut
