<%-- 
    Document   : OtherNavigationLinks
    Created on : Sep 19, 2012, 12:51:57 PM
    Author     : IGNOUERP
--%>

<%@page import="java.io.Serializable"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Left Navigation Links</title>
        <link href="<s:url value="/css/master.css"/>" rel="stylesheet" type="text/css" />         <link href="<s:url value="/css/main.css"/>" rel="stylesheet" type="text/css" />
        <link href="<s:url value="/css/collapse.css"/>" rel="stylesheet" type="text/css" />
        <link href="<s:url value="/css/skin.css"/>" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="<s:url value="/js/jquery-1.6.4.min.js"/>"></script>
        <script type="text/javascript" src="<s:url value="/js/expand.js"/>"></script>
        <script>
            $(function() {
                $( "#accordion" ).accordion();
            });
        </script>
    </head>
    <body><%
            final Logger logger = Logger.getLogger(this.getClass());
            String ipAddress = request.getRemoteAddr();
            logger.warn(session.getAttribute("user_id") + " Accessed from: " + ipAddress + " at: " + new Date());
            String role = session.getAttribute("role").toString();
            if (session.getAttribute("user_id") == null) {
                session.invalidate();
                response.sendRedirect("../Login.jsp");
            }
        %>
        <div class="w100 fl-l">
            <div class="w990p mar0a">
                <!--Header Starts Here-->
                <s:include value="/Header.jsp"/>
                <!--Header Ends Here-->
                <!--Middle Section Starts Here-->
                <div class="w100 fl-l">
                    <div class="middle_bg">
                        <!--Left box Starts Here-->
                        <s:include  value="/Left-Nevigation.jsp"/> 
                        <!--Left box Ends Here-->
                        <!--Right box Starts Here-->
                        <div class="right_box">
                            <div class="my_account_bg">Others Links in Left Navigation</div>
                            <div class="w100 fl-l mart10">
                                <div class="w98 mar0a">
                                    <div class="w100 fl-l mart15">
                                        <fieldset class="mar0a" style="width:600px;">
                                            <legend class="fbld">Left Navigation Others URL</legend> 
                                            <s:form action="AddNavigationLink" method="post" namespace="/Administrator" theme="simple" >
                                                <table width="90%" align="center" class="mar0a" cellpadding="2" cellspacing="0" border="0">
                                                    <tr>
                                                        <td class="fbld">Link Caption</td>
                                                        <td><s:textfield name="caption" cssClass="w425p"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td><td>Sakshat</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="fbld">Link URL</td>
                                                        <td><s:textfield name="url" cssClass="w425p"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td class=""></td><td>http://www.nmeict.ac.in</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <s:submit value="Save" align="center"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </s:form>
                                        </fieldset>
                                    </div>
                                    <div class="mart15 w100 fl-l">
                                        <table class="tablepaging" id="tablepaging" cellspacing="0" cellpadding="5" border="1">
                                            <thead
                                                <tr><td>S.No.</td><td>Caption</td><td>URL</td><td>Delete</td></tr>
                                            </thead>
                                            <s:iterator value="CaptionList" status="stat">
                                                <tr>
                                                    <td><s:property value="#stat.count"/></td>
                                                    <td><s:property value="CaptionList[#stat.index]"/></td>
                                                    <td><s:property value="UrlList[#stat.index]"/></td>
                                                    <td><a href="DeleteLinksNode?Id=<s:property value="#stat.index"/>"><img src="../icons/delete.gif"/></a></td>
                                                </tr>
                                            </s:iterator>
                                        </table>
                                        <div class="w100 fl-l tc fbld fcgreen">
                                            <s:property value="msg"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Right box Starts Here-->
                        </div>
                    </div>
                    <!--Middle Section Ends Here-->
                </div>
            </div>
        </div>
        <s:include value="/Footer.jsp"/>
    </body>
</html>