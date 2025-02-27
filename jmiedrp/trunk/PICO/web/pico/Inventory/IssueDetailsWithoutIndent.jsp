<%--
    Document   : IssueDetailsWithoutIndent
    Created on : 7 Aug, 2012, 10:48:10 PM
    Author     : Mohd. Manauwar Alam
    I18n By    : Mohd. Manauwar Alam
               : March 2014
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sx" uri="/struts-dojo-tags" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERP Mission - A Project sponsored by NMEICT, MHRD, Govt. of India</title>
        <script language="JavaScript" type="text/JavaScript" src="../javaScript/ajax/jquery2.js"></script>
        <script language="JavaScript" type="text/JavaScript" src="../javaScript/PrePurchase/country.js"></script>
        <script language="JavaScript" type="text/JavaScript" src="../javaScript/PrePurchase/ItemMasterScript.js"></script>
        <script language="JavaScript" type="text/JavaScript" src="../javaScript/Administration/Admin.js"></script>
        <script language="JavaScript" type="text/JavaScript" src="../javaScript/Inventory/Inventory.js"></script>
        <link href="../css/pico.css" rel="stylesheet" type="text/css" />
        <meta HTTP-EQUIV="CONTENT-TYPE" CONTENT="text/html; charset=UTF-8">
        <meta name="description" content="ERP for Universities">
        <meta name="keywords" content="ERP">
        <meta name="author" content="manauwar, Jamia Millia Islamia">
        <meta name="email" content="manauwar.alam@live.com">
        <meta name="copyright" content="NMEICT, MHRD, Govt. of India">
        <sx:head />
    </head>
    <body class="twoColElsLtHdr">
        <div id="container">
            <div id="headerbar1">
                <jsp:include page="../Administration/header.jsp" flush="true"></jsp:include>
                </div>
                <div id="sidebar1">
                <jsp:include page="../Administration/menu.jsp" flush="true"></jsp:include>
                </div>
                <!-- *********************************End Menu****************************** -->
                <div id ="mainContent" >
                <s:bean name="java.util.HashMap" id="qTableLayout">
                    <s:param name="tablecolspan" value="%{8}" />
                </s:bean>
                <br>
                <br>
                <div style ="background-color: #215dc6;">
                    <p align="center" class="pageHeading" style="color: #ffffff" ><s:property value="getText('Inventory.ManageIssueDetails')" /></p>
                    <p align="center" class="mymessage" style="color: #ffff99"><s:property value="message" /></p>
                </div>
                <%--------------------this is a issue items  form --------------------%>

                <s:actionerror />
                <div style="border: solid 1px #000000; background: gainsboro">
                    <s:form name="frmIssueDetails" action="SaveIssueDetails"  theme="qxhtml">
                        <table border="0" cellpadding="4" cellspacing="0" align="center">
                            <s:hidden name="EIMID"/>
                            <s:hidden name="EIDID"/>
                            <s:hidden name="Indent_Title"/>
                            <s:hidden name="Issue_No"/>
                            <s:hidden name="Issue_Date"/>
                            <s:hidden name="ItemId"/>
                            <s:hidden name="eid.isdId"/>

                            <%--   <s:textfield label="Indent Title" name="" readonly="true" value="%{Indent_Title}" cssClass="textInput" maxLength="50" size="40" >
                                <s:param name="labelcolspan" value="%{1}" />
                                <s:param name="inputcolspan" value="%{7}" />
                                 </s:textfield> --%>

                            <s:textfield key="Inventory.IssueNo" name="" readonly="true" value="%{Issue_No}" cssClass="textInput" maxLength="50" size="40">
                                <s:param name="labelcolspan" value="%{1}" />
                                <s:param name="inputcolspan" value="%{3}" />
                            </s:textfield>
                            <s:label value=". . ." cssClass="tdSpace"/>

                            <s:textfield key="Inventory.IssueDate" name="" readonly="true" value="%{Issue_Date}" cssClass="textInput" maxLength="50" size="40">
                                <s:param name="labelcolspan" value="%{1}" />
                                <s:param name="inputcolspan" value="%{3}" />
                            </s:textfield>

                            <s:select key="Inventory.ItemType" name ="eid.erpmItemMaster.erpmItemCategoryMasterByErpmimItemCat1.erpmicmItemId" headerKey="" headerValue="-- Please Select --"
                                      list="erpmIcmList1" listKey="erpmicmItemId" listValue="erpmicmCatDesc" disabled="+VAL1" cssClass="textInput"
                                      onchange="getSubCategoryList('SaveIssueDetails_eid_erpmItemMaster_erpmItemCategoryMasterByErpmimItemCat1_erpmicmItemId', 'SaveIssueDetails_eid_erpmItemMaster_erpmItemCategoryMasterByErpmimItemCat2_erpmicmItemId');">
                                <s:param name="labelcolspan" value="%{1}" />
                                <s:param name="inputcolspan" value="%{3}" />
                            </s:select>
                            <s:label value=". . ." cssClass="tdSpace"/>

                            <s:select key="Inventory.ItemCategory" name="eid.erpmItemMaster.erpmItemCategoryMasterByErpmimItemCat2.erpmicmItemId" headerKey="" headerValue="-- Please Select --"
                                      list="erpmIcmList2" listKey="erpmicmItemId" listValue="erpmicmCatDesc" disabled="+VAL1" cssClass="textInput"
                                      onchange="getSubCategoryList('SaveIssueDetails_eid_erpmItemMaster_erpmItemCategoryMasterByErpmimItemCat2_erpmicmItemId', 'SaveIssueDetails_eid_erpmItemMaster_erpmItemCategoryMasterByErpmimItemCat3_erpmicmItemId');">
                                <s:param name="labelcolspan" value="%{1}" />
                                <s:param name="inputcolspan" value="%{3}" />
                            </s:select>

                            <s:select key="Inventory.ItemSubCategory" name="eid.erpmItemMaster.erpmItemCategoryMasterByErpmimItemCat3.erpmicmItemId" headerKey="" headerValue="-- Please Select --" list="erpmIcmList3"
                                      listKey="erpmicmItemId" listValue="erpmicmCatDesc" cssClass="textInput" disabled="+VAL1" 
                                      onchange="getItemListTOS('SaveIssueDetails_eid_erpmItemMaster_erpmItemCategoryMasterByErpmimItemCat3_erpmicmItemId', 'SaveIssueDetails_eid_erpmItemMaster_erpmimId')"
                                      ondblclick="getItemListTOS('SaveIssueDetails_eid_erpmItemMaster_erpmItemCategoryMasterByErpmimItemCat3_erpmicmItemId', 'SaveIssueDetails_eid_erpmItemMaster_erpmimId');" >
                                <s:param name="labelcolspan" value="%{1}" />
                                <s:param name="inputcolspan" value="%{3}" />
                            </s:select>
                            <s:label value=". . ." cssClass="tdSpace"/>

                            <s:select cssClass="textInput" key="Inventory.ItemName" name="eid.erpmItemMaster.erpmimId" headerKey="" headerValue="-- Please Select --"
                                      list="itemList" listKey="erpmimId" listValue="erpmimItemBriefDesc" title="Select Item from the List" disabled="+VAL1" value="%{ItemId}">
                                <s:param name="labelcolspan" value="%{1}" />
                                <s:param name="inputcolspan" value="%{3}" />
                            </s:select>

                            <s:textfield key="Inventory.IssueQuantity" name="eid.isdIssuedQuantity"  value="%{IssQnty_val}" readonly="+IssueQtyReadOnly" cssClass="textInput">
                                <s:param name="labelcolspan" value="%{1}" />
                                <s:param name="inputcolspan" value="%{3}" />
                            </s:textfield>
                            <s:label value=". . ." cssClass="tdSpace"/>

                            <s:textfield key="Inventory.UnitOfMeasurement" name="" cssClass="textInput">
                                <s:param name="labelcolspan" value="%{1}" />
                                <s:param name="inputcolspan" value="%{3}" />
                            </s:textfield>

                            <tr>
                                <td align="right">
                                    <s:submit  name="btnSubmit"  key="Inventory.SaveWithoutIndent" disabled="+BTNDSBL" action="SaveIssueDetailsWithoutIndent" theme="simple" />
                                </td>
                            </tr>

                        </table>
                    </s:form>
                
                 <s:if test="issueDetList1.size > 0">
                        <hr>

                        <s:label value="%{getText('Inventory.ItemDetailsAre')}" cssClass= "pageSubHeading" >
                            <s:param name="labelcolspan" value="%{1}" />
                            <s:param name="inputcolspan" value="%{9}" />
                        </s:label>

                        <hr>
                    <s:form name="frmIssueDetailGrid" action="SaveIssueDetails">
                        <table width="100%">

                            <tr><td>
                                    <display:table  name="issueDetList1" pagesize=""
                                                    excludedParams="*"  cellpadding="8"
                                                    cellspacing="0" id="doc"
                                                    requestURI="/pico/Inventory/SaveIssueItemsAction.action">
                                        <display:column  class="griddata" title="SNo" sortable="true" maxLength="100" headerClass="gridheader">
                                    <c:out> ${doc_rowNum}
                                    </display:column>
                                    <display:column property="erpmItemMaster.erpmimItemBriefDesc" title="Item Name"
                                                    maxLength="100" headerClass="gridheader" style="width:40%"
                                                    class="<s:if test= ${doc_rowNum}%2== 0>even</s:if><s:else>odd</s:else>" sortable="false" />
                                    <display:column  property="isdIssuedQuantity" title="Issue Qnty" style="width:10%"
                                                     headerClass="gridheader" class="griddata"  sortable="true"/>
                                    <display:column paramId="EIDID" paramProperty="isdId"
                                                    href="/pico/Inventory/EditIssueDetailsWithoutIndent"
                                                    headerClass="gridheader" class="griddata" media="html"  title="Edit" >
                                        Edit
                                    </display:column>
                                </display:table>
                        </table>

                    </s:form>
                     </s:if>
                    <br>

                </div>
            </div>
                <br>
            <div id="footer">
                <jsp:include page="../Administration/footer.jsp" flush="true"></jsp:include>
            </div>
        </div>
    </body>
</html>
