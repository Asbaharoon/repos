<%@ page session="true" contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib uri="http://www.tonbeller.com/jpivot" prefix="jp" %>
<%@ taglib uri="http://www.tonbeller.com/wcf" prefix="wcf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%--

  JPivot / WCF comes with its own "expression language", which simply
  is a path of properties. E.g. #{customer.address.name} is
  translated into:
    session.getAttribute("customer").getAddress().getName()
  WCF uses jakarta commons beanutils to do so, for an exact syntax
  see its documentation.

  With JSP 2.0 you should use <code>#{}</code> notation to define
  expressions for WCF attributes and <code>\${}</code> to define
  JSP EL expressions.

  JSP EL expressions can not be used with WCF tags currently, all
  tag attributes have their <code>rtexprvalue</code> set to false.
  There may be a twin library supporting JSP EL expressions in
  the future (similar to the twin libraries in JSTL, e.g. core
  and core_rt).

  Check out the WCF distribution which contains many examples on
  how to use the WCF tags (like tree, form, table etc).

--%>

<html>
<head>
	<title>Mondrian/JPivot Test Page - 4</title>
	<meta http-equiv="Content-Type" name="layout" content="main">
	<link rel="stylesheet" type="text/css" href="jpivot/table/mdxtable.css">
	<link rel="stylesheet" type="text/css" href="jpivot/navi/mdxnavi.css">
	<link rel="stylesheet" type="text/css" href="wcf/form/xform.css">
	<link rel="stylesheet" type="text/css" href="wcf/table/xtable.css">
	<link rel="stylesheet" type="text/css" href="wcf/tree/xtree.css">
</head>

<body>
<div id="wrapper">
		<div id="head">
		<div id="logo_user_details">&nbsp;</div>
		<!-- Menu Starts here -->
<div id="menus_wrapper">
    <div id="sec_menu">
				<ul>
				<%
				String URL=session.getAttribute("ROLE").toString();
				String user=session.getAttribute("UserId").toString();
				%>				
				<%
				if(URL.equals("ROLE_STAFF"))
				{
				%>
				<li><a  class="house" href='<c:out value="courseActivity/listStaffCourses"/>'>Home</a></li>
				<%
				}
				%>
				<%
				if(URL.equals("ROLE_STUDENT"))
				{
				%>
				<li><a  class="house" href=''>Home</a></li>
				<%
				}
				%>
				
				<%
				if(URL.equals("ROLE_INSTITUTE"))
				{
				%>
				<li><a  class="house" href='<c:out value="settings/lmsSettings"/>'>Home</a></li>
				<%
				}
				%>				
				<%
				if(URL.equals("ROLE_SUPERADMIN") || URL.equals("ROLE_ADMIN") || URL.equals("ROLE_UNIVERSITY"))
				{
				%>
				<li><a  class="dashboard" href='<c:out value="dashboard/admindashboard"/>'>Dashboard</a></li>
				<%
				}
				%>	
				<%
				if(URL.equals("ROLE_INSTITUTE"))
				{
				%>
				<li><a  class="dashboard" href='<c:out value="dashboard/institutedashboard"/>'>Dashboard</a></li>
				<%
				}
				%>
				<%
				if(URL.equals("ROLE_STAFF"))
				{
				%>
				<li><a  class="dashboard" href='<c:out value="dashboard/staffdashboard"/>'>Dashboard</a></li>
				<%
				}
				%>
				<%
				if(URL.equals("ROLE_SUPERADMIN"))
				{
				%>
				<li><a href='<c:out value="authority/list"/>'  class="manage_page">Roles Privileges</a></li>
				<li><a href='<c:out value="person/list"/>'  class="useradd">Users</a></li>
				<%
				}
				%>
				<li><a  class="house" href='<c:out value="helpdoc/divehelp.html"/>' class="help" target="_blank">Technical-Documentation</a></li>
				<li><a  class="house" href='<c:out value="logout"/>' class="logout">Logout</a></li>
				</ul>
						
						<div  align="right"  style="padding:10px 10px 0px 0px; font-size:12px; font-family:Arial">
						<font color="#FFFFFF">Logged in as <strong> <%=user%></strong></font></div>
		   </div>
    </div>
		<!-- Menu Ends here -->    
</div>

<div id="content"> <!-- Start of content div -->
 <div>
			<div style="height:500px;padding-left:5px;overflow: scroll;white-space: nowrap">
							   	<form action="analytics.jsp" method="post">
								<c:url var="url" value='/'></c:url>


								<%-- include query and title, so this jsp may be used with different queries --%>
								<wcf:include id="include01" httpParam="query" prefix="WEB-INF/queries/" suffix=".jsp"/>
								<c:if test="${query01 == null}">
									<jsp:forward page="${url}"/>
								</c:if>

								<%-- define table, navigator and forms --%>
								<jp:table id="table01" query="#{query01}"/>
								<jp:navigator id="navi01" query="#{query01}" visible="false"/>
								<wcf:form id="mdxedit01" xmlUri="/WEB-INF/jpivot/table/mdxedit.xml" model="#{query01}" visible="false"/>
								<wcf:form id="sortform01" xmlUri="/WEB-INF/jpivot/table/sortform.xml" model="#{table01}" visible="false"/>

								<jp:print id="print01"/>
								<wcf:form id="printform01" xmlUri="/WEB-INF/jpivot/print/printpropertiesform.xml" model="#{print01}" visible="false"/>

								<jp:chart id="chart01" query="#{query01}" visible="false"/>
								<wcf:form id="chartform01" xmlUri="/WEB-INF/jpivot/chart/chartpropertiesform.xml" model="#{chart01}" visible="false"/>
								<wcf:table id="query01.drillthroughtable" visible="false" selmode="none" editable="true"/>

								<h2><c:out value="${title01}"/></h2>

								<%-- define a toolbar --%>
								<wcf:toolbar id="toolbar01" bundle="com.tonbeller.jpivot.toolbar.resources">

									<wcf:scriptbutton id="cubeNaviButton" tooltip="toolb.cube" img="cube" model="#{navi01.visible}"/>

									<wcf:scriptbutton id="mdxEditButton" tooltip="toolb.mdx.edit" img="mdx-edit" model="#{mdxedit01.visible}"/>
									<wcf:scriptbutton id="sortConfigButton" tooltip="toolb.table.config" img="sort-asc" model="#{sortform01.visible}"/>
									<wcf:separator/>
									<wcf:scriptbutton id="levelStyle" tooltip="toolb.level.style" img="level-style" model="#{table01.extensions.axisStyle.levelStyle}"/>
									<wcf:scriptbutton id="hideSpans" tooltip="toolb.hide.spans" img="hide-spans" model="#{table01.extensions.axisStyle.hideSpans}"/>
									<wcf:scriptbutton id="propertiesButton" tooltip="toolb.properties"  img="properties" model="#{table01.rowAxisBuilder.axisConfig.propertyConfig.showProperties}"/>
									<wcf:scriptbutton id="nonEmpty" tooltip="toolb.non.empty" img="non-empty" model="#{table01.extensions.nonEmpty.buttonPressed}"/>
									<wcf:scriptbutton id="swapAxes" tooltip="toolb.swap.axes"  img="swap-axes" model="#{table01.extensions.swapAxes.buttonPressed}"/>
									<wcf:separator/>
									<wcf:scriptbutton model="#{table01.extensions.drillMember.enabled}"	 tooltip="toolb.navi.member" radioGroup="navi" id="drillMember"   img="navi-member"/>
									<wcf:scriptbutton model="#{table01.extensions.drillPosition.enabled}" tooltip="toolb.navi.position" radioGroup="navi" id="drillPosition" img="navi-position"/>
									<wcf:scriptbutton model="#{table01.extensions.drillReplace.enabled}"	 tooltip="toolb.navi.replace" radioGroup="navi" id="drillReplace"  img="navi-replace"/>
									<wcf:scriptbutton model="#{table01.extensions.drillThrough.enabled}"  tooltip="toolb.navi.drillthru" id="drillThrough01"  img="navi-through"/>
									<wcf:separator/>
									<wcf:scriptbutton id="chartButton01" tooltip="toolb.chart" img="chart" model="#{chart01.visible}"/>
									<wcf:scriptbutton id="chartPropertiesButton01" tooltip="toolb.chart.config" img="chart-config" model="#{chartform01.visible}"/>
									<wcf:separator/>
									<wcf:scriptbutton id="printPropertiesButton01" tooltip="toolb.print.config" img="print-config" model="#{printform01.visible}"/>
									<wcf:imgbutton id="printpdf" tooltip="toolb.print" img="print" href="./Print?cube=01&type=1"/>
									<wcf:imgbutton id="printxls" tooltip="toolb.excel" img="excel" href="./Print?cube=01&type=0"/>
								</wcf:toolbar>

								<%-- render toolbar --%>
								<wcf:render ref="toolbar01" xslUri="/WEB-INF/jpivot/toolbar/htoolbar.xsl" xslCache="true"/>

								<%-- if there was an overflow, show error message --%>
								<c:if test="${query01.result.overflowOccured}">
									<p><strong style="color:red">Resultset overflow occured</strong></p>
								</c:if>

								<%-- render navigator --%>
								<wcf:render ref="navi01" xslUri="/WEB-INF/jpivot/navi/navigator.xsl" xslCache="true"/>

								<%-- edit mdx --%>
								<c:if test="${mdxedit01.visible}">
									<h3>MDX Query Editor</h3>
									<wcf:render ref="mdxedit01" xslUri="/WEB-INF/wcf/wcf.xsl" xslCache="true"/>
								</c:if>

								<%-- sort properties --%>
								<wcf:render ref="sortform01" xslUri="/WEB-INF/wcf/wcf.xsl" xslCache="true"/>

								<%-- chart properties --%>
								<wcf:render ref="chartform01" xslUri="/WEB-INF/wcf/wcf.xsl" xslCache="true"/>

								<%-- print properties --%>
								<wcf:render ref="printform01" xslUri="/WEB-INF/wcf/wcf.xsl" xslCache="true"/>

								<!-- render the table -->
								<p>
									<wcf:render ref="table01" xslUri="/WEB-INF/jpivot/table/mdxtable.xsl" xslCache="true"/>
								</p>
								<p>
									Slicer:
									<wcf:render ref="table01" xslUri="/WEB-INF/jpivot/table/mdxslicer.xsl" xslCache="true"/>
								</p>

								<!-- drill through table -->
								<wcf:render ref="query01.drillthroughtable" xslUri="/WEB-INF/wcf/wcf.xsl" xslCache="true"/>

								<!-- render chart -->
								<wcf:render ref="chart01" xslUri="/WEB-INF/jpivot/chart/chart.xsl" xslCache="true"/>



							</form>
          <div style="clear: both;">&nbsp;</div>
		<br />	
        </div>
       </div>
	   <!-- Middle area ends here -->	
  </div> <!-- End of content div -->
  	   <br /> <br />
	</div>
<div id="footer">
          <div style="padding:8px 30px 20px 0px" align="right"><h4><font color="white">Developed by Amrita University under ERP, NME ICT, MHRD</font></h4></div>
</div>