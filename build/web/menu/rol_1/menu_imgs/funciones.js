// Nueva Ventana *****************************************************************************************
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}


// Menu DHTML *****************************************************************************************
function UpdateMenu(Opciones)
{
	var todas=Opciones;
	var paramarray = todas.split("|");
	for (i = 0 ; i < paramarray.length; i++)
	{
		if ( readCookie(paramarray[i]) == "1")
			opentree(paramarray[i]);		
	}
}

var treeopened = null;

function opentree(tree)
{
	var cls = '';
	if (document.getElementById) 
	{
		var el = document.getElementById (tree);
//		if (el && el.className) {
//			el.className = (el.className == 'br1MenuAbierto') ? 'br1MenuCerrado' : 'br1MenuAbierto';
//		}

		if (el && el.className) {
			if ( el.className == 'br1MenuAbierto' )
			{
				el.className = 'br1MenuCerrado';
				eraseCookie(tree);
			}
			else
			{
				el.className = 'br1MenuAbierto';
				createCookie(tree, 1, 30);
			}
		}
	}
	return false;
}


// COOKIES *****************************************************************************************
function createCookie(name,value,days)
{
	if (days)
	{
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	var ck = name+"="+value+expires+"; path=/";
	//if (days != -1) alert('Cookie\n' + ck + '\ncreated');
	document.cookie = ck;
}

function readCookie(name)
{
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i<ca.length;i++)
	{
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function eraseCookie(name)
{
	createCookie(name,"",-1);
}


// Reloj ***********************************************************************************************
function JSClock() {          
	var time = new Date()          
	var hour = time.getHours()          
	var minute = time.getMinutes()          
	var second = time.getSeconds()          
	var temp = ((hour > 12) ? hour - 12 : hour)          
	temp += ((minute < 10) ? ":0" : ":") + minute          
	temp += ((second < 10) ? ":0" : ":") + second          
	temp += (hour >= 12) ? "&nbsp;P.M." : "&nbsp;A.M."          
	document.getElementById("relojito").innerHTML = temp
	id = setTimeout("JSClock()",1000)
}


// Boton Derecho Disable *******************************************************************************
function navigatorIsIE7() {
	agent = navigator.userAgent.toLowerCase();
	this.major = parseInt(navigator.appVersion);
	this.minor = parseFloat(navigator.appVersion);
	this.ie = ((agent.indexOf("msie") != -1) && (agent.indexOf("opera") == -1));

	this.ie7 = (this.ie && (this.major == 4) && (agent.indexOf("msie 7") != -1));

	if (this.ie7) {
		return true;
	}
	else {
		return false;
	}
}


function disableRightClick(e)
{
  var message = "Boton derecho no soportado";
  
  if(!document.rightClickDisabled) // initialize
  {
    if(document.layers) 
    {
      document.captureEvents(Event.MOUSEDOWN);
      document.onmousedown = disableRightClick;
    }
    else document.oncontextmenu = disableRightClick;
    return document.rightClickDisabled = true;
  }
  if(document.layers || (document.getElementById && !document.all))
  {
    if (e.which==2||e.which==3)
    {
      alert(message);
      return false;
    }
  }
  else
  {
	if (!navigatorIsIE7()) {
		alert(message);
	}
	return false;
  }
}
//disableRightClick();


// Tool Tips ************************************************************************************
// Example:
//  onMouseOver="toolTip('Acceda a su correo via web');" onMouseOut="toolTip();"
// -or-
// onMouseOver="toolTip('more good stuff', '#FFFF00', 'orange');" onMouseOut="toolTip();" 
/*
MOVE this to the <body>:
<div id="toolTipLayer" style="position:absolute; visibility: hidden"></div>
<script language="JavaScript"><!--
initToolTips(); //--></script>
*/
var ns4 = document.layers;
var ns6 = document.getElementById && !document.all;
var ie4 = document.all;
offsetX = 0;
offsetY = 20;
var toolTipSTYLE="";
function initToolTips()
{
  if(ns4||ns6||ie4)
  {
    if(ns4) toolTipSTYLE = document.toolTipLayer;
    else if(ns6) toolTipSTYLE = document.getElementById("toolTipLayer").style;
    else if(ie4) toolTipSTYLE = document.all.toolTipLayer.style;
    if(ns4) document.captureEvents(Event.MOUSEMOVE);
    else
    {
      toolTipSTYLE.visibility = "visible";
      toolTipSTYLE.display = "none";
    }
    document.onmousemove = moveToMouseLoc;
  }
}
function toolTip(msg, fg, bg)
{
  if(toolTip.arguments.length < 1) // hide
  {
    if(ns4) toolTipSTYLE.visibility = "hidden";
    else toolTipSTYLE.display = "none";
  }
  else // show
  {
    if(!fg) fg = "#777777";
    if(!bg) bg = "#FFFFFF";
    var content =
    '<table border="0" cellspacing="0" cellpadding="1" bgcolor="' + fg + '"><td>' +
    '<table border="0" cellspacing="0" cellpadding="1" bgcolor="' + bg + 
    '"><td align="center"><font face="sans-serif" color="' + fg +
    '" size="-2">&nbsp\;' + msg +
    '&nbsp\;</font></td></table></td></table>';
    if(ns4)
    {
      toolTipSTYLE.document.write(content);
      toolTipSTYLE.document.close();
      toolTipSTYLE.visibility = "visible";
    }
    if(ns6)
    {
      document.getElementById("toolTipLayer").innerHTML = content;
      toolTipSTYLE.display='block'
    }
    if(ie4)
    {
      document.all("toolTipLayer").innerHTML=content;
      toolTipSTYLE.display='block'
    }
  }
}
function moveToMouseLoc(e)
{
  if(ns4||ns6)
  {
    x = e.pageX;
    y = e.pageY;
  }
  else
  {
    x = event.x + document.body.scrollLeft;
    y = event.y + document.body.scrollTop;
  }
  toolTipSTYLE.left = x + offsetX;
  toolTipSTYLE.top = y + offsetY;
  return true;
}