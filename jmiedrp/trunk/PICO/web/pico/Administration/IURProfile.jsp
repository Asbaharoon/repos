<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERP Mission - A Project sponsored by NMEICT, MHRD, Govt. of India</title>
        <script language="JavaScript" type="text/JavaScript" src="../javaScript/ajax/jquery2.js"></script>
        <script language="JavaScript" type="text/JavaScript" src="../javaScript/Administration/Admin.js"></script>
        <script language="JavaScript" type="text/JavaScript" src="../javaScript/ajax/jquery2.js"></script>
        <script language="JavaScript" type="text/JavaScript" src="../javaScript/PrePurchase/country.js"></script>
        <link href="../css/pico.css" rel="stylesheet" type="text/css" />
        <meta HTTP-EQUIV="CONTENT-TYPE" CONTENT="text/html; charset=UTF-8">
        <meta name="description" content="ERP for Universities">
        <meta name="keywords" content="ERP">
        <meta name="author" content="S.Kazim Naqvi, Jamia Millia Islamia">
        <meta name="email" content="sknaqvi@jmi.ac.in">
        <meta name="copyright" content="NMEICT, MHRD, Govt. of India">
    </head>
    <body class="twoColElsLtHdr">
        <div id="container">
            <div id="headerbar1">
                <jsp:include page="header.jsp" flush="true"></jsp:include>
            </div>

            <div id="sidebar1">
                <jsp:include page="menu.jsp" flush="true"></jsp:include>
            </div>
            <!-- *********************************End Menu****************************** -->
            <div id ="mainContent">
                <br><br>
                <div style ="background-color: #215dc6;">
                    <p align="center" class="pageHeading" style="color: #ffffff">INSTITUTION USER ROLE PRIVILEGES MANAGEMENT</p>
                    <p align="center" class="mymessage" style="color: #ffff99"><s:property value="message" /></p>
                </div>

                <p align="left" class="pageText">You are now setting up privileges for '<s:property value="iur.iurName" />'
                    role in '<s:property value="iur.institutionmaster.imName" />' institution.</p>
                <p align="left" class="pageText">Please Choose generic role to initialize '<s:property value="iur.iurName" />' </p>

                <div style="border: solid 1px #000000; background: gainsboro">

                    <s:form name="frmIURPCreate" action="CreateIURP">
                        <s:hidden name="iur.iurId"/>
                        <s:hidden name="ImId" />
                        <%--    <s:hidden name="InstitutionRole"/> --%>
                        <table border="0" cellpadding="4" cellspacing="0" align="center" >
                            <tr>
                                <td>
                                    <s:select cssClass="textInput" label="Generic Role" name="gurId" headerKey="" headerValue="-- Please Select --" list="gurList" listKey="gurId" listValue="gurRoleName"
                                              onchange="showRoleRemarks('CreateIURP_gurId','CreateIURP_gurDescription');"/>
                                    <s:textfield cssClass="textInputRO" label="Role Description"  name="gurDescription" maxLength="100" size="100"  readonly="true"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <s:submit theme="simple" name="btnSubmit" value="Initialize Role" action="CreateIURP"/>
                                </td>
                            </tr>

                        </table>
                    </s:form>
                    <br>
                </div>
                &nbsp;
            </div>

        </div>
        <div id="footer">
            <jsp:include page="footer.jsp" flush="true"></jsp:include>
        </div>
    </body>
</html>