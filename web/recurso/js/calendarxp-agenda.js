//pagina agenda.js
fAddEvent(2003,3,28," March 28, 2003 \n Click to detect calendar size. ","alert('Here is the current size of the calendar - \"width='+gfSelf.offsetWidth+' height='+gfSelf.offsetHeight+'\"');","#87ceeb","dodgerblue");
fAddEvent(2002,12,2," Your comments're of vital importance. ","popup('mailto:descargas@calendarxp.net?subject=Comments on PopCalendarXP')","#87ceeb","dodgerblue",null,true);
fAddEvent(2003,4,18," Hola Mundo! ","alert('Hola Mundo!');","#87ceeb","dodgerblue");

function fHoliday(y,m,d) {
	var r=fGetEvent(y,m,d);
	if (r) return r;
	if (m==1&&d==1)
		r=[" Enero 1, "+y+" \n Feliz Año Nuevo! ","","#87ceeb","red"];
	else if (m==12&&d==25)
		r=[" Diciembre 25, "+y+" \n Feliz Navidad! ",null,"#87ceeb","red"];	
	else if (m==5&&d>8) {
		var date=getDateByDOW(y,5,2,7);
		if (d==date) r=["Mayo "+d+", "+y+" Feliz Día a Todas las Madres",gsAction,"#87ceeb","red"];	
	}
	else if (m==1&&d==12)
		r=[" ENERO 12, "+y+" \n Feliz Cumpleaños Angel SULLÓN M.! ",null,"#87ceeb","red"];	
	return r;	
}
function popup(url,framename) {	
	var w=parent.open(url,framename,"top=200,left=200,width=400,height=200,scrollbars=1,resizable=1");
	if (w&&url.split(":")[0]=="mailto") w.close();
	else if (w&&!framename) w.focus();
}
function getDateByDOW(y,m,q,n) { 
	var dom=new Date(y,m-1,1).getDay();
	var d=7*q-6+n-dom;
	if (dom>n) d+=7;
	if (d>fGetDays(y)[m]) d-=7;
	return d;	
}

