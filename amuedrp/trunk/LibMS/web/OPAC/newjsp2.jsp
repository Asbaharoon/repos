<%@ page import="com.myapp.struts.hbm.*,java.util.*,com.myapp.struts.systemsetupDAO.DocumentCategoryDAO;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
    <%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
    <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
 <style>

    th a:link      { text-decoration: none; color: black }
     th a:visited   { text-decoration: none; color: black }
     .rows          { background-color: white;border: solid 1px blue; }
     .hiliterows    { background-color: pink; color: #000000; font-weight: bold;border: solid 1px blue; }
     .alternaterows { background-color: #efefef; }
     .header        { background-color: #c0003b; color: #FFFFFF;font-weight: bold;text-decoration: none;padding-left: 10px; }

     .datagrid      {  font-family: arial; font-size: 9pt;
	    font-weight: normal;}
     .item{ padding-left: 10px;}

</style>

<script language="javaScript" src="fulldetail.js"></script>
</head>
<body>
<%! String title,author,publ_pl,pub_name,pub_yr,pages,index,callno,phy_width,loc,pubyr,copy,vol,ed,publ,place,isbn,accno,subtitle,subject,id,lib_id,status,location,booktype;
int no_of_copy=0;
 List<BibliographicDetails> dd=new ArrayList<BibliographicDetails>();
    
%>
<%


    List<DocumentDetails> list=(List<DocumentDetails>)session.getAttribute("documentDetail");




//dd = (List<BibliographicDetails>)session.getAttribute("documentDetail1");
        if(!list.isEmpty()){
            
           booktype=list.get(0).getBookType();
            title=list.get(0).getTitle();
            subtitle=list.get(0).getSubtitle();
            author=list.get(0).getMainEntry();
            publ_pl=list.get(0).getPublicationPlace();
            pub_name=list.get(0).getPublisherName();
            pub_yr=list.get(0).getPublishingYear();
          
         accno=list.get(0).getAccessionNo();
           // index=dd.get(0).getIndexNo();
            callno=list.get(0).getCallNo();
            isbn=list.get(0).getIsbn10();
            ed=list.get(0).getEdition();
           // location=dd.getLocation();
            lib_id = list.get(0).getId().getLibraryId();
          //  phy_width=dd.getPhysicalWidth();
            status =list.get(0).getStatus();
            String sublib_id = (String)list.get(0).getId().getSublibraryId();
            if(title==null)title="";
            if(subtitle==null)subtitle="";
            if(author==null)author="";
            if(publ_pl==null)publ_pl="";
            if(pub_name==null)pub_name="";
            if(pub_yr==null)pub_yr="";
            if(pages==null)pages="";
            if(index==null)index="";
            if(callno==null)callno="";
            if(isbn==null)isbn="";
            if(ed==null)ed="";
            if(lib_id==null)lib_id="";
            if(phy_width==null)phy_width="";
            if(status==null)status="";
            if(accno==null)accno="";
            DocumentCategory docc = (DocumentCategory)DocumentCategoryDAO.searchDocumentCategory(lib_id, sublib_id, booktype);
            String issuetype ="";
            if(docc!=null)
                issuetype=docc.getIssueCheck();
 %>

<%!
    Locale locale;
    String locale1="en";
    String rtl="ltr";
    String align="left";
%>

<%
try{
locale1=(String)session.getAttribute("locale");
    if(session.getAttribute("locale")!=null)
    {
        locale1 = (String)session.getAttribute("locale");
        System.out.println("locale="+locale1);
    }
    else locale1="en";
}catch(Exception e){locale1="en";}
     locale = new Locale(locale1);
    if(!(locale1.equals("ur")||locale1.equals("ar"))){ rtl="LTR";align="left";}
    else{ rtl="RTL";align="right";}
    ResourceBundle resource = ResourceBundle.getBundle("multiLingualBundle", locale);

    %>
<button  onmousedown="fontResize('-5')">Font Size -&nbsp;-</button><button  onmousedown="fontResize('+5')">Font Size ++</button>
<br>
<TABLE align="<%=align%>" dir="<%=rtl%>"  border='0' class="datagrid" cellspacing='0' cellpadding='0' valign="top" width="200px">
   
   
    <TR dir="<%=rtl%>">
        <TD NOWRAP valign='top' dir="<%=rtl%>"  width=10%><%=resource.getString("opac.newjsp.title")%></TD>
        <TD valign='top' dir="<%=rtl%>" >&nbsp; </TD>
        <TD  colspan=2 dir="<%=rtl%>"><%=title%></TD>
    </TR>

    <TR dir="<%=rtl%>">
        <TD NOWRAP valign='top' dir="<%=rtl%>"  width="10%"><%=resource.getString("opac.newjsp.mainauthor")%></TD>
        <TD valign='top' dir="<%=rtl%>">&nbsp; </TD>
        <TD  colspan=2 dir="<%=rtl%>"><%=author%></TD>
    </TR>
      
    <TR dir="<%=rtl%>">
        <TD NOWRAP valign='top' dir="<%=rtl%>" width=10%><%=resource.getString("opac.newjsp.pubplace")%>  </TD>
        <TD valign='top' dir="<%=rtl%>" >&nbsp; </TD>
        <TD  colspan=2 dir="<%=rtl%>"><%=publ_pl%></TD>
    </TR>
    <TR dir="<%=rtl%>">
        <TD NOWRAP valign='top' dir="<%=rtl%>" width=10%><%=resource.getString("opac.newjsp.pubname")%>  </TD>
        <TD valign='top' dir="<%=rtl%>">&nbsp; </TD>
        <TD colspan=2 dir="<%=rtl%>"><%=pub_name%></TD>
    </TR>
    <TR dir="<%=rtl%>">
        <TD NOWRAP valign='top' dir="<%=rtl%>" width=10%><%=resource.getString("opac.newjsp.pubyear")%>  </TD>
        <TD valign='top' dir="<%=rtl%>">&nbsp; </TD>
        <TD  colspan=2 dir="<%=rtl%>"><%=pub_yr%></TD>
    </TR>
    
    <TR dir="<%=rtl%>">
        <TD NOWRAP valign='top' dir="<%=rtl%>" width=10%><%=resource.getString("opac.newjsp.callno")%> </TD>
        <TD valign='top' dir="<%=rtl%>">&nbsp; </TD>
        <TD  colspan=2 dir="<%=rtl%>"><%=callno%></TD>
    </TR>
    
    <TR dir="<%=rtl%>">
        <TD NOWRAP valign='top' dir="<%=rtl%>"  width=10%><%=resource.getString("opac.newjsp.isbn")%></TD>
        <TD valign='top' dir="<%=rtl%>">&nbsp; </TD>
        <TD  colspan=2 dir="<%=rtl%>"><%=isbn%></TD>
    </TR>
<%-- <TR dir="<%=rtl%>">
        <TD NOWRAP valign='top' dir="<%=rtl%>"  width=10%>No of Copies</TD>
        <TD valign='top' dir="<%=rtl%>">&nbsp; </TD>
        <TD  colspan=2 dir="<%=rtl%>"><%=no_of_copy %></TD>
    </TR>--%>

    <TR dir="<%=rtl%>">
        <TD NOWRAP valign='top' dir="<%=rtl%>"  width=10%>AccessionNo</TD>
        <TD valign='top' dir="<%=rtl%>">&nbsp; </TD>
        <TD  colspan=2 dir="<%=rtl%>"><%=accno %></TD>
    </TR>
     <TR dir="<%=rtl%>">
        <TD NOWRAP valign='top' dir="<%=rtl%>"  width=10%>Issue Type</TD>
        <TD valign='top' dir="<%=rtl%>">&nbsp; </TD>
        <TD  colspan=2 dir="<%=rtl%>"><%=issuetype %></TD>
    </TR>




    <tr>
      <TD NOWRAP valign='top' dir="<%=rtl%>"  width=10%>Current Status</TD>
        <TD valign='top' dir="<%=rtl%>">&nbsp; </TD>
    <td colspan="2">
        <%if(status.equalsIgnoreCase("available")&& issuetype.equals("Issuable")){%>
 <a href="<%=request.getContextPath()%>/OPAC/checkoutRequest.do?docId=<%= list.get(0).getId().getDocumentId()%>&libId=<%= list.get(0).getId().getLibraryId()%>&sublibId=<%= list.get(0).getId().getSublibraryId() %>">Request for Check Out</a><%}else if(status.equalsIgnoreCase("available")&& !issuetype.equals("Issuable")){%>
 Not Issuable<%}else{%>
 Issued
 <%}%>
</td></tr>
</TABLE><br><br>
<%       }
%>


</body>
</html>