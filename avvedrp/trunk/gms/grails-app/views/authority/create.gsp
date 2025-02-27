<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'authority.label', default: 'Authority')}" />
        <title><g:message code="default.Role.CreateRole.head"/></title>
        <g:javascript library="jquery" />
   </head>
    <body>
    	<div class="wrapper">
			<div id="spinner" class="spinner" style="display:none;">
	            <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
	        </div>	
       <div id="messageBox">
	   </div>
     <div class="wrapper">
       <table class="tablewrapper"> 
        <tr>
         <td> 
           <div class="body">
        <img src="${createLinkTo(dir:'images/themesky',file:'contxthelp.gif')}" align="right" onClick="window.open('${application.contextPath}/images/help/${session.Help}','mywindow','width=500,height=250,left=0,top=100,screenX=0,screenY=100,scrollbars=yes')" title="Help" alt="Help"> 
            <h1><g:message code="default.Role.CreateRole.head" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
              <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${authorityInstance}">
              <div class="errors">
                <g:renderErrors bean="${authorityInstance}" as="list" />
              </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="authority"><g:message code="default.Role.label"/>:</label>
                                    <label for="role" style="color:red;font-weight:bold"> * </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: authorityInstance, field: 'authority', 'errors')}">
                            	<input type="text" id="authority" name="authority" style="width:250px"
                                 value="ROLE_" onBlur="return validAuthority(this);"/>
  						       <label for="role" style="color:blue;font-weight:bold"> <g:message code="default.Role.NameFormat.label"/></label> 
  						       </td>
                                <td valign="left">
                                   
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="default.Description.label"/>:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: authorityInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${authorityInstance?.description}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.Create.button')}" onClick="return combineAlertAndValidateAuthority();"/></span>
                </div>
            </g:form>
           </div>
           <div class="body">
             <h1></h1>
           
             <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'default.SINo.label')}" />
                        
                            <g:sortableColumn property="authority" title="${message(code: 'default.Role.label')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'default.Description.label')}" />                        

                        	<th><g:message code="default.Edit.label"/></th>
                        	
                        </tr>
                    </thead>
                    <tbody>
                      <% int j=0 %>
                      <g:each in="${authorityInstanceList}" status="i" var="authorityInstance">
                        <%  j++ %>
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${j}</td>
                                                    
                            <td>${fieldValue(bean: authorityInstance, field: "authority")}</td>                        
                            
                            <td>${fieldValue(bean: authorityInstance, field: "description")}</td>
                            
                            <g:if test="${(authorityInstance.authority != 'ROLE_STAFF') && (authorityInstance.authority != 'ROLE_SITEADMIN') && (authorityInstance.authority != 'ROLE_PI') && (authorityInstance.authority != 'ROLE_PROPOSALADMIN') && (authorityInstance.authority != 'ROLE_REVIEWER') && (authorityInstance.authority != 'ROLE_USER') && (authorityInstance.authority != 'ROLE_FINANCE') && (authorityInstance.authority != 'ROLE_SUPERADMIN')}">
                            
                        	<td><g:link action="edit" id="${authorityInstance.id}"><g:message code="default.Edit.label"/></g:link></td>
                        	</g:if>
                        	<g:else>
                        	<td></td>
                        	</g:else>

                        </tr>
                      </g:each>
                    </tbody>
                </table>
             </div>
           </div>
         </td>
        </tr>
       </table>
     </div>
   </body>
</html>
