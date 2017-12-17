var gsSplit="/";	
var giDatePos=0;
var gbPadZero=true;	
var giMonthMode=0;	
var gbShortYear=false;
var gbAutoPos=true;	
var gbPopDown=true;	
var gbAutoClose=true;
var gPosOffset=[0,0];
var gbFixedPos=false;
var gMonths=["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];
var gWeekDay=["Sa","Do","Lu","Ma","Mi","Ju","Vi"];	

var gBegin=[1950,1,1];	
var gEnd=[2030,12,31];	
var gsOutOfRange="Sorry, you may not go beyond the designated range!";	
var guOutOfRange=null;	
var gbEuroCal=true;	
var gcCalBG="#cc3299";	
var guCalBG=null;	
var gcCalFrame="#778899";	
var gsInnerTable="border=0 cellpadding=2 cellspacing=1";	
var gsOuterTable=NN4?"border=1 cellpadding=3 cellspacing=0":"border=0 cellpadding=1 cellspacing=2";	
var gbHideTop=false;	
var giDCStyle=0;	
var gsCalTitle="gMonths[gCurMonth[1]-1]+' '+gCurMonth[0]";	
var gbDCSeq=true;	
var gsYearInBox="i";	
var gsNavPrev="<INPUT type='button' value='&lt;' class='MonthNav' onclick='fPrevMonth(event);this.blur();'>";	
var gsNavNext="<INPUT type='button' value='&gt;' class='MonthNav' onclick='fNextMonth(event);this.blur();'>";	
var gbHideBottom=false;	
var gsBottom="<A href='javascript:void(0)' class='Today' onclick='if(this.blur)this.blur();if(!fSetDate(gToday[0],gToday[1],gToday[2]))alert(\"Today is not a selectable date!\");return false;' onclick='return true;' title='Hoy'>Hoy : "+gToday[2]+" "+gMonths[gToday[1]-1]+" "+gToday[0]+"</A>";	
var giCellWidth=18;	
var giCellHeight=14;	
var giHeadHeight=14;	
var giWeekWidth=22;	
var giHeadTop=1;	
var giWeekTop=0;	
var gcCellBG="#e5e5e5";	
var gsCellHTML="";	
var guCellBGImg="";	
var gsAction=" ";	
var gsDays="dayNo";	
var giWeekCol=-1;	
var gsWeekHead="#ffgggg";	
var gsWeeks="weekNo";	

var gcWorkday="black";	
var gcSat="black";	
var gcSatBG="";	
var gcSun="black";
var gcSunBG="#eaadea";	

var gcOtherDay="silver";
var gcOtherDayBG=gcCellBG;
var giShowOther=2;

var gbFocus=true;	
var gcToggle="yellow";

var gcFGToday="red";	
var gcBGToday="white";	
var guTodayBGImg="";	
var giMarkToday=1; 

var gcFGSelected="white";
var gcBGSelected="#ffgggg";	
var guSelectedBGImg="";	
var giMarkSelected=2;	

var gbBoldAgenda=true;	
var gbInvertBold=false;	
var gbShrink2fit=true;	
var gdSelect=gToday;	
var giFreeDiv=0;	
var gAgendaMask=[-1,-1,-1,null,null,-1,null];

var giResizeDelay=KO3?150:50;	
var gbFlatBorder=false;	
var gbInvertBorder=false;	
var gbShareAgenda=false;	

