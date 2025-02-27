
    <%@page import="com.myapp.struts.admin.RequestDoc,com.myapp.struts.hbm.*,com.myapp.struts.AdminDAO.*"%>
    <%@page import="com.myapp.struts.admin.AdminReg_Institute"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
    <%@ page import="org.apache.taglibs.datagrid.DataGridParameters"%>
     <%@ page import="org.apache.taglibs.datagrid.DataGridTag"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.io.*"   %>
    <%@ taglib uri="http://jakarta.apache.org/taglibs/datagrid-1.0" prefix="ui" %>
    <%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>LibMS </title>
   
    <%
try{
if(session.getAttribute("library_id")!=null){
System.out.println("library_id"+session.getAttribute("library_id"));
}
else{
    request.setAttribute("msg", "Your Session Expired: Please Login Again");
    %><script>parent.location = "<%=request.getContextPath()%>"+"/login.jsp?session=\"expired\"";</script><%
    }
}catch(Exception e){
    request.setAttribute("msg", "Your Session Expired: Please Login Again");
    %>sessionout();<%
    }

%>

<%!


   RequestDoc Ob;
   ArrayList requestList;
   int fromIndex=0, toIndex;
%>
 <%


AdminRegistrationDAO admindao = new AdminRegistrationDAO();
List rs =(List) session.getAttribute("rejected");
AdminRegistration adminReg= new AdminRegistration();

   requestList = new ArrayList();
   int tcount =0;
   int perpage=4;
   int tpage=0;
 if(request.getParameter("pageSize")!=null && request.getParameter("pageSize")!="")
    perpage = Integer.parseInt((String)request.getParameter("pageSize"));

if (!rs.isEmpty())
{
Iterator it = rs.iterator();

   while (it.hasNext()) {
        adminReg = (AdminRegistration)rs.get(tcount);
       tcount++;
	Ob = new RequestDoc ();
	Ob.setRegistration_id(adminReg.getRegistrationId());
	Ob.setInstitute_name(adminReg.getInstituteName());
	//Ob.setLibrary_name(rs.getString(21));
	Ob.setAdmin_email(adminReg.getAdminEmail());
         Ob.setAddress(adminReg.getInstituteAddress());
        Ob.setUser_name(adminReg.getAdminFname()+" "+adminReg.getAdminLname());
        Ob.setStatus(adminReg.getStatus());
   requestList.add(Ob);
adminReg=null;
it.next();

		     }
}
System.out.println("tcount="+tcount);

%>

<%
   fromIndex = (int) DataGridParameters.getDataGridPageIndex (request, "datagrid1");
   if ((toIndex = fromIndex+perpage) >= requestList.size ())
   toIndex = requestList.size();
   request.setAttribute ("requestList", requestList.subList(fromIndex, toIndex));
   pageContext.setAttribute("tCount", tcount);
   pageContext.setAttribute("pagecontext", request.getContextPath());
   pageContext.setAttribute("rec",perpage);
%>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/page.css"/>
 <script>
    function changerec(){
        var x=document.getElementById('rec').value;
    var loc = window.location;
    loc = "http://<%=request.getHeader("host")%><%=request.getContextPath()%>/admin/rejectlibrary.jsp";

  //  alert(loc);
        loc = loc + "?pageSize="+x;
    window.location = loc;

    }

      document.onkeyup = keyHit
function keyHit(event) {

  if (event.keyCode == 13) {
  changerec();

    event.stopPropagation()
    event.preventDefault()
  }
}

function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
    </script>

</head>

<body>
 
<body>

<table border="1" style="margin: 0px 0px 0px 0px;padding: 0px 0px 0px 0px;border-collapse: collapse;  border-spacing: 0;" align="center"  width="80%" >
        <tr><td class="headerStyle" align="center">View All Rejected Institute 
            </td></tr>
        <tr><td align="center">
<%if(tcount==0)
{%>
<p class="err" style="font-size:12px">No Record Found</p>
<%}
else
{%>
<p align="right" class="txtStyle">View Next<input type="textbox" id="rec" onkeypress="return isNumberKey(event)" onblur="changerec()" style="width:50px"/></p>
<ui:dataGrid items="${requestList}"  var="doc" name="datagrid1" cellPadding="0" cellSpacing="0" styleClass="datagrid">
    
  <columns>
      
   

    <column width="100">
      <header value="Registration_ID" hAlign="left" styleClass="header"/>
      <item   value="${doc.registration_id}" hyperLink="${pagecontext}/admin/index3.jsp?id=${doc.registration_id}"  hAlign="left"    styleClass="item"/>
    </column>

    <column width="200">
      <header value="Institute Name" hAlign="left" styleClass="header"/>
      <item   value="${doc.institute_name}" hAlign="left" hyperLink="${pagecontext}/admin/index3.jsp?id=${doc.registration_id}"  styleClass="item"/>
    </column>
 <column width="200">
      <header value="Institute Address" hAlign="left" styleClass="header"/>
      <item   value="${doc.address}" hyperLink="${pagecontext}/admin/index3.jsp?id=${doc.registration_id}"  hAlign="left" styleClass="item"/>
    </column>
<column width="200">
      <header value="Institute AdminName" hAlign="left" styleClass="header"/>
      <item   value="${doc.user_name}" hyperLink="${pagecontext}/admin/index3.jsp?id=${doc.registration_id}"  hAlign="left" styleClass="item"/>
    </column>
       
    <column width="100">
      <header value="Admin_Email" hAlign="left" styleClass="header"/>
      <item   value="${doc.admin_email}" hyperLink="${pagecontext}/admin/index3.jsp?id=${doc.registration_id}"  hAlign="left" styleClass="item"/>
    </column>

   <column width="100">
   <header value="Status" hAlign="left" styleClass="header"/>
 <item  value="${doc.status}" hyperLink="${pagecontext}/admin/index3.jsp?id=${doc.registration_id}"  hAlign="left" styleClass="item"/>
    </column>
       <column width="100">
   <header value="Working Status" hAlign="left" styleClass="header"/>
 <item  value="Blocked" hyperLink="${pagecontext}/admin/index3.jsp?id=${doc.registration_id}"  hAlign="left" styleClass="item"/>
    </column>
 </columns>

<rows styleClass="rows" hiliteStyleClass="hiliterows"/>
  <alternateRows styleClass="alternaterows"/>

 <paging size="${rec}" count="${tCount}" custom="true" nextUrlVar="next"
       previousUrlVar="previous" pagesVar="pages"/>
  <order imgAsc="up.gif" imgDesc="down.gif"/>
</ui:dataGrid>
<table width="600" style="font-family: arial; font-size: 10pt" border=0>
<tr>
<td align="left" width="100px">
<c:if test="${previous != null}">
<a href="<c:out value="${previous}"/>">Previous</a>
</c:if>&nbsp;
<c:if test="${next != null}">
<a href="<c:out value="${next}"/>">Next</a>
</c:if>

</td><td width="350px" align="center">

<c:forEach items="${pages}" var="page">
<c:choose>
  <c:when test="${page.current}">
    <b><a href="<c:out value="${page.url}"/>"><c:out value="${page.index}"/></a></b>
  </c:when>
  <c:otherwise>
    <a href="<c:out value="${page.url}"/>"><c:out value="${page.index}"/></a>
  </c:otherwise>
</c:choose>
</c:forEach>
</td>
<td align="right">
     Import :<img src="<%=request.getContextPath()%>/images/excel.jpeg" border="1" height="25" width="25">
    <img src="<%=request.getContextPath()%>/images/xml.jpeg" height="25" border="1" width="25">
    <img src="<%=request.getContextPath()%>/images/pdf.jpeg" height="25"border="1" width="25">
</td>
</tr>
<tr><td colspan="2">
        <%

String msg=(String)request.getAttribute("msg");
if(msg!=null)
    {%>
    <p class="err" style="font-size:12px"><%=msg%></p>


<%}%>

    </td></tr>
</table>
<%}%>
</td></tr></table>
    </body>






</html>
 