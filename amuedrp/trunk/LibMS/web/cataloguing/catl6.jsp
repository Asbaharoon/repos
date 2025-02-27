<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.myapp.struts.hbm.Biblio"%>
<html>
    <head>
       <title> Bibliographic Cataloguing According to MARC21 -- 6XX</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ddtabmenufiles/ddtabmenu.js"></script>

<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/marci.gif">

<script type="text/javascript" src="<%=request.getContextPath()%>/cataloguing/animatedcollapse.js">

/***********************************************
* Animated Collapsible DIV- (c) muhammad zeeshan
***********************************************/

</script>
<% session.setAttribute("tag6", "1");%>
<% HashMap hm1 = new HashMap();
    Biblio bib1=new Biblio();
    Biblio bib2=new Biblio();
%>
<%
 hm1 = (HashMap)session.getAttribute("hsmp");
if(hm1!=null){
  if(hm1.containsKey("26")){
       bib1=(Biblio)hm1.get("6");
        }
   if(hm1.containsKey("27")){
       bib2=(Biblio)hm1.get("7");
        }}
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/ddtabmenufiles/solidblocksmenu.css" />
<script type="text/javascript">

ddtabmenu.definemenu("ddtabs3", 7) //initialize Tab Menu #3 with 2nd tab selected
</script>


<script type="text/javascript">
animatedcollapse.addDiv('600', 'fade=1,height=30px')
animatedcollapse.addDiv('600b', 'fade=1,height=30px')
animatedcollapse.addDiv('600c', 'fade=1,height=30px')
animatedcollapse.addDiv('600d', 'fade=1,height=30px')

animatedcollapse.addDiv('650', 'fade=1,height=30px')
animatedcollapse.addDiv('650b', 'fade=1,height=30px')
animatedcollapse.addDiv('650c', 'fade=1,height=30px')
animatedcollapse.addDiv('650d', 'fade=1,height=30px')
animatedcollapse.addDiv('650e', 'fade=1,height=30px')
animatedcollapse.addDiv('6504', 'fade=1,height=30px')
animatedcollapse.addDiv('650v', 'fade=1,height=30px')
animatedcollapse.addDiv('650x', 'fade=1,height=30px')
animatedcollapse.addDiv('650y', 'fade=1,height=30px')
animatedcollapse.addDiv('6502', 'fade=1,height=30px')
animatedcollapse.addDiv('650z', 'fade=1,height=30px')

animatedcollapse.ontoggle=function($, divobj, state){ //fires each time a DIV is expanded/contracted
	//$: Access to jQuery
	//divobj: DOM reference to DIV being expanded/ collapsed. Use "divobj.id" to get its ID
	//state: "block" or "none", depending on state
}


animatedcollapse.init()

</script>
<script type="text/javascript">
   function loadHelp()
    {
        window.status="Press F10 for Help";

    }

</script>
<script type="text/javascript">
var description=new Array()
description[0]='Type of personal name entry element-<b> 0 - Forename, 1 - Surname, 3 - Family name '
description[1]='Thesaurus- <b>0 - Library of Congress Subject Headings, 1 - LC subject headings for children`s literature, 2 - Medical Subject Headings, 3 - National Agricultural Library subject authority file, 4 - Source not specified, 5 - Canadian Subject Headings, 6 - Répertoire de vedettes-matière, 7 - Source specified in subfield $2 '
description[2]='ex- <b>Pushkin, Aleksandr Sergeevich,'
description[3]='ex- <b>(Biblical prophet) '
description[4]='ex- <b>1799-1837'

description[5]='Level of subject- <b># - No information provided, 0 - No level specified, 1 - Primary, 2 - Secondary '
description[6]='Topical subject or a geographic name used as an entry element for a topical term. <b>BASIC (Computer program language) '
description[7]='Topical term that is entered under a geographic name contained in subfield $a.ex- <b>$aCaracas.$bBolivar Statue.'
description[8]='Time period during which an event occurred.'
description[9]='Specifies the relationship between the topical heading and the described materials, e.g.<b> depicted.'
description[10]='MARC code that specifies the relationship between a topical heading and the described materials'
description[11]='Form subdivision that designates a specific kind or genre of material as defined by the thesaurus being used. e.g. <b>Periodicals.'
description[12]='Subject subdivision that is not more appropriately contained in subfields $v, $y or $z.ex- $aRacetracks (Horse-racing)$zUnited States<b>$xHistory.'
description[13]='Subject subdivision that represents a period of time'
description[14]='Geographic subject subdivision. e.g. <b>Tunisia.'
description[15]='MARC code that identifies the source list from which the subject added entry was assigned. e.g. <b>lctgm'

</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/cataloguing/tooltip.js">

/***********************************************
* ToolTip layer - (c) muhammad zeeshan
***********************************************/

</script>


    </head>
    <jsp:include page="/admin/header.jsp"></jsp:include>
<body onload="loadHelp()">
    <div
   style="  top:20%;
   left:10%;
   right:10%;border: solid 1px black;
      position: absolute;

      visibility: show;">
       <layer name="nsviewer" bgcolor="#FDF5E6" style="border-width:thin;z-index:1"></layer>
<script type="text/javascript">
if (iens6){
document.write("<div id='viewer' style='background-color:#FDF5E6;visibility:hidden;position:absolute;left:0;width:0;height:0;z-index:1;overflow:hidden;border:0px ridge white'></div>")
}
if (ns4){
	hideobj = eval("document.nsviewer")
	hideobj.visibility="hidden"
}


function func1(t){

     document.getElementById("zclick").value= t;

     func2(t);

    }

function func2(t){
   // alert(t);
    if(t.value!=6){

        document.getElementById("cat6").submit();
   //  alert("submitted! ");
}
}


function statwords(message,x,y)
{
document.onkeypress = keyHit
function keyHit(event) {
  if (event.keyCode == event.DOM_VK_F10) {
     setObj(message,'override',x,y);
   //  JavaScript:window.status=message;

    event.stopPropagation()
    event.preventDefault()
  }
}
}
</script>
                                            <h2 align="center"  class="headerStyle" style="height: 25px;">MARC Based Bibliographic Cataloging</h2>

<div id="ddtabs3" class="header1" style="background-color: cyan;line-height: 26px;font-size: 13px;vertical-align: bottom" >

    <a href="<%=request.getContextPath()%>/cataloguing/catlcontrol.jsp" style="text-decoration:none" onclick="func1(10)"  rel="sb10">Control Fields</a><font color="blue">&nbsp;|&nbsp;</font>
<a href="<%=request.getContextPath()%>/cataloguing/catl0.jsp" style="text-decoration:none" onclick="func1(0)"  rel="sb0">0 (01X-09X)</a>&nbsp;|&nbsp;
<a href="<%=request.getContextPath()%>/cataloguing/catl1.jsp" style="text-decoration:none" onclick="func1(1)" rel="sb1">1 (1XX)</a>&nbsp;|&nbsp;
<a href="<%=request.getContextPath()%>/cataloguing/catl2.jsp"  style="text-decoration:none" onclick="func1(2)" rel="sb2">2 (20X-28X)</a>&nbsp;|&nbsp;
<a href="<%=request.getContextPath()%>/cataloguing/catl3.jsp"  style="text-decoration:none" onclick="func1(3)" rel="sb3">3 (3XX)</a>&nbsp;|&nbsp;
<a href="<%=request.getContextPath()%>/cataloguing/catl4.jsp" style="text-decoration:none" onclick="func1(4)" rel="sb4">4 (4XX)</a>&nbsp;|&nbsp;
<a href="<%=request.getContextPath()%>/cataloguing/catl5.jsp" style="text-decoration:none" onclick="func1(5)" rel="sb5">5 (5XX)</a>&nbsp;|&nbsp;
<a href="<%=request.getContextPath()%>/cataloguing/catl6.jsp" style="text-decoration:none" onclick="func1(6)" rel="sb6">6 (6XX)</a>&nbsp;|&nbsp;
<a href="<%=request.getContextPath()%>/cataloguing/catl7.jsp" style="text-decoration:none" onclick="func1(7)" rel="sb7">7 (70X-78X)</a>&nbsp;|&nbsp;
<a href="<%=request.getContextPath()%>/cataloguing/catl8.jsp" style="text-decoration:none" onclick="func1(8)" rel="sb8">8 (80X-88X)</a>&nbsp;|&nbsp;
<a href="<%=request.getContextPath()%>/cataloguing/catl9.jsp" style="text-decoration:none" onclick="func1(9)" rel="sb9">9</a>&nbsp;|&nbsp;
<a href="<%=request.getContextPath()%>/cataloguing/marchome.do" style="text-decoration:none" rel="home">Cancel</a>&nbsp;|&nbsp;

</div>


<DIV class="tabcontainer ieclass">
<FONT color="#8B008B">
<div id="sb0" class="tabcontent">
Number and Code Fields.
</div>


<div id="sb1" class="tabcontent">
Main Entry Fields.
</div>

<div id="sb2" class="tabcontent">
Title, Edition, Imprints etc Fields .
</div>

<div id="sb3" class="tabcontent">
Physical Description, etc Fields.
</div>


<div id="sb4" class="tabcontent">
Series Statements Field.
</div>


<div id="sb5" class="tabcontent">
Note Fields.
</div>


<div id="sb6" class="tabcontent">
Subject Access Fields.
</div>


<div id="sb7" class="tabcontent">
Added Entry and Linking Entry Fields.
</div>


<div id="sb8" class="tabcontent">
Series added Entry, Holding, Location, Alternate Graphics Fields.
</div>


<div id="sb9" class="tabcontent">
Local Fields 900 and onwards.
</div>
     <div id="home" class="tabcontent">
Go BACK to Manage MARC Bibliography.
</div>
    <div id="sb10" class="tabcontent">
Control Field Entry
</div>
</FONT>
</DIV>
You are on MARC Page : 6 Tag Page
                                      <!-- Marc entries Starts from here . -->


<div>
<html:form styleId="cat6" action="/cataction6.do" method="post">
     <table height="400px"><tr><td valign="top" >&nbsp;&nbsp;&nbsp;
<table width="100%" cellspacing="5" >
  <tr><input type="hidden" value="" name="zclick" id="zclick" /></tr>
<tr>
    <td>&nbsp;&nbsp;&nbsp;Subject Added Entry-Personal Name (R)(600) : <a href="javascript:animatedcollapse.toggle('600')">ind</a> <div id="600" style="width: 150px; display:none" >&nbsp;&nbsp;&nbsp;ind1<input type="text" value="<% if(bib1.getIndicator1()!=null){%><%= bib1.getIndicator1() %><%}%>"  name="in6001" maxlength="1" size="1" onFocus="statwords(description[0],800,30)" onBlur="clearTimeout(openTimer);stopIt()" /> ind2<input type="text" value="<% if(bib1.getIndicator2()!=null){%><%= bib1.getIndicator2() %><%}%>" name="in6002" maxlength="1" size="1" onFocus="statwords(description[1],800,60)" onBlur="clearTimeout(openTimer);stopIt()" /></div></td>
<td>
$a Personal name (NR) <input type="text" value="<% if(bib1.get$a()!=null){%><%= bib1.get$a() %><%}%>" name="z600a" id="600a" onFocus="statwords(description[2],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
<font size="2">
<a href="javascript:animatedcollapse.toggle('600b')">$b </a>

<div id="600b" style=" background: #FDF5E6; display:none">
Numeration (NR) <input type="text" value="<% if(bib1.get$b()!=null){%><%= bib1.get$b() %><%}%>" name="z600b" id="600b" />
</div>
<a href="javascript:animatedcollapse.toggle('600c')">$c </a>

<div id="600c" style=" background: #FDF5E6; display:none">
Titles and other words associated with a name (R)<input type="text" value="<% if(bib1.get$c()!=null){%><%= bib1.get$c() %><%}%>" name="z600c" id="600c" onFocus="statwords(description[3],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
</div>

<a href="javascript:animatedcollapse.toggle('600d')">$d </a>

<div id="600d" style=" background: #FDF5E6; display:none">
Dates associated with a name (NR) <input type="text" value="<% if(bib1.get$d()!=null){%><%= bib1.get$d() %><%}%>" name="z600d" id="600d" onFocus="statwords(description[4],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />

</div>
</font></td></tr>

<tr><td colspan="2"><hr width="90%" size="2" color="green"/></td></tr>
<tr>
    <td>&nbsp;&nbsp;&nbsp;Subject Added Entry-Topical Term (R)(650) : <a href="javascript:animatedcollapse.toggle('650')">ind</a> <div id="650" style="width: 150px; display:none" >&nbsp;&nbsp;&nbsp;ind1<input type="text" value="<% if(bib2.getIndicator1()!=null){%><%= bib2.getIndicator1() %><%}%>" name="in6501" maxlength="1" size="1" onFocus="statwords(description[5],800,30)" onBlur="clearTimeout(openTimer);stopIt()" /> ind2<input type="text" value="<% if(bib2.getIndicator2()!=null){%><%= bib2.getIndicator2() %><%}%>"  name="in6502" maxlength="1" size="1" onFocus="statwords(description[1],800,30)" onBlur="clearTimeout(openTimer);stopIt()" /></div></td>
<td>
$a Topical term or geographic name entry element (NR) <input type="text" value="<% if(bib2.get$a()!=null){%><%= bib2.get$a() %><%}%>" name="z650a" id="650a" onFocus="statwords(description[6],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
<font size="2">
<a href="javascript:animatedcollapse.toggle('650b')">$b </a>

<div id="650b" style=" background: #FDF5E6; display:none">
Topical term following geographic name entry element (NR) <input type="text" value="<% if(bib2.get$b()!=null){%><%= bib2.get$b() %><%}%>" name="z650b" id="650b" onFocus="statwords(description[7],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
</div>
<a href="javascript:animatedcollapse.toggle('650c')">$c </a>

<div id="650c" style=" background: #FDF5E6; display:none">
Location of event (NR) <input type="text" value="<% if(bib2.get$c()!=null){%><%= bib2.get$c() %><%}%>" name="z650c" id="650c"  />
</div>

<a href="javascript:animatedcollapse.toggle('650d')">$d </a>

<div id="650d" style=" background: #FDF5E6; display:none">
Active dates (NR) <input type="text" value="<% if(bib2.get$d()!=null){%><%= bib2.get$d() %><%}%>" name="z650d" id="650d" onFocus="statwords(description[8],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
</div>

<a href="javascript:animatedcollapse.toggle('650e')">$e</a>

<div id="650e" style=" background: #FDF5E6; display:none">
Relator term (R) <input type="text" value="<% if(bib2.get$e()!=null){%><%= bib2.get$e() %><%}%>" name="z650e" id="650e" onFocus="statwords(description[9],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
</div>
<a href="javascript:animatedcollapse.toggle('6504')">$4 </a>

<div id="6504" style=" background: #FDF5E6; display:none">
Relator code (R)  <input type="text" value="<% if(bib2.get$4()!=null){%><%= bib2.get$4() %><%}%>" name="z6504" id="6504" onFocus="statwords(description[10],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
</div>

<a href="javascript:animatedcollapse.toggle('650v')">$v </a>

<div id="650v" style=" background: #FDF5E6; display:none">
Form subdivision (R) <input type="text" value="<% if(bib2.get$v()!=null){%><%= bib2.get$v() %><%}%>" name="z650v" id="650v" onFocus="statwords(description[11],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
</div>

<a href="javascript:animatedcollapse.toggle('650x')">$x </a>
<div id="650x" style=" background: #FDF5E6; display:none">
General subdivision (R) <input type="text" value="<% if(bib2.get$x()!=null){%><%= bib2.get$x() %><%}%>" name="z650x" id="650x" onFocus="statwords(description[12],'override',800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
</div>

<a href="javascript:animatedcollapse.toggle('650y')">$y </a>
<div id="650y" style=" background: #FDF5E6; display:none">
Chronological subdivision (R) <input type="text" value="<% if(bib2.get$y()!=null){%><%= bib2.get$y() %><%}%>" name="z650y" id="650y" onFocus="statwords(description[13],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
</div>


<a href="javascript:animatedcollapse.toggle('650z')">$z </a>
<div id="650z" style=" background: #FDF5E6; display:none">
Geographic subdivision (R) <input type="text" value="<% if(bib2.get$z()!=null){%><%= bib2.get$z() %><%}%>" name="z650z" id="650z" onFocus="statwords(description[14],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
</div>

<a href="javascript:animatedcollapse.toggle('6502')">$2 </a>
<div id="6502" style=" background: #FDF5E6; display:none">
Source of heading or term (NR) <input type="text" value="<% if(bib2.get$2()!=null){%><%= bib2.get$2() %><%}%>" name="z6502" id="6502" onFocus="statwords(description[15],800,30)" onBlur="clearTimeout(openTimer);stopIt()" />
</div>

</font></td></tr>


</table></td></tr></table></html:form>
</div></div>
    </body>
</html>
