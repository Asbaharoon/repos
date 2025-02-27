<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1251"/>
        <meta name="layout" content="main" />
        
        <title><g:message code="default.projects.create.head"/></title>   
        <script src="${createLinkTo(dir:'js',file:'vk_popup.js?vk_layout=AM Armenian Eastern')}"> </script>  
        
    </head>
    <body>
    	<div class="wrapper">   
        <div class="body">
        <img src="${createLinkTo(dir:'images/themesky',file:'contxthelp.gif')}" align="right" onClick="window.open('${application.contextPath}/images/help/${session.Help}','mywindow','width=500,height=250,left=0,top=100,screenX=0,screenY=100,scrollbars=yes')" title="Help" alt="Help"> 
            <h1><g:message code="default.projects.create.head"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${projectsInstance}">
            <div class="rejerrors">
                <g:renderErrors bean="${projectsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table >
                        <tbody>
                              <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="default.Name.label"/>:</label>
                                    <label for="name" style="color:red;font-weight:bold"> * </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projectsInstance,field:'name','errors')}">
                                    <input type="text" size="45" id="name" name="name" onfocus="PopupVirtualKeyboard.attachInput(this)" value="${fieldValue(bean:projectsInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="default.Code.label"/>:</label>
                                    <label for="code" style="color:red;font-weight:bold"> * </label>
                                    
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projectsInstance,field:'code','errors')}">
                                    <input type="text"  id="code" name="code" onfocus="PopupVirtualKeyboard.attachInput(this)" value="${fieldValue(bean:projectsInstance,field:'code')}"/>
                                    <label for="code" style="color:blue;font-weight:bold"> <g:message code="default.projects.projectCode.label"/></label>
                                </td>
                            </tr> 
                        	
                        	<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="code"><g:message code="default.ProjectType.label"/>:</label>
                                    <label for="projectyype" style="color:red;font-weight:bold"> * </label>  
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projectsInstance,field:'projectType','errors')}">
                                    <g:select optionKey="id" optionValue="type" id="projectType" from="${ProjectType.findAll('from ProjectType P where P.activeYesNo=\'Y\' ')}"  name="projectType.id" value="${projectsInstance?.projectType?.id}" noSelection="['null':'-Select-']" ></g:select>
                                </td>
                            </tr> 
                          <tr class="prop">   
	                            <td valign="top" class="name">
	                                <label for="amountAllocated">
	                                	<g:message code="default.AmountAllocated(Rs).label"/>:
	                            	</label>
	                            	<label for="amountAllocated" style="color:red;font-weight:bold"> * </label>
	                            </td>
	                            <td valign="top" 
	                            	class="value ${hasErrors(bean:grantAllocationInstance,field:'amountAllocated','errors')}">
	                                <input type="text" id="amountAllocated" name="amountAllocated" value="${amount}" style="text-align: right"/>
	                            </td>
                           </tr>   
                           <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="investigator"><g:message code="default.Investigator.label"/>:</label>
                                      <label for="code" style="color:red;font-weight:bold"> * </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projectsInstance,field:'investigator','errors')}">
                                    <g:select optionKey="id" optionValue="fullName" from="${investigatorList}" name="investigator.id" value="${projectsInstance?.investigator?.id}" noSelection="['null':'-Select-']" ></g:select>
                                 </td>
                            </tr> 
                         </tr>                           
                         <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="projectStartDate"><g:message code="default.StartDate.label"/>:</label>
                                    <label for="projectStartDate" style="color:red;font-weight:bold"> * </label> 
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projectsInstance,field:'projectStartDate','errors')}">
                                <calendar:datePicker id="projectStartDate" name="projectStartDate" defaultValue="${new Date()}" value="${projectsInstance?.projectStartDate}" dateFormat= "%d/%m/%Y"/>
                                    </td>
                            </tr> 
                            
                            
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="projectEndDate"><g:message code="default.EndDate.label"/>:</label>
                                    <label for="projectEndDate" style="color:red;font-weight:bold"> * </label> 
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:projectsInstance,field:'projectEndDate','errors')}">
                                    <calendar:datePicker id="projectEndDate" name="projectEndDate" value="${projectsInstance?.projectEndDate}" defaultValue="${new Date()}"  dateFormat= "%d/%m/%Y"/>
                                </td>
                            </tr>
                         
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" onClick="return validateProject()" value="${message(code: 'default.Create.button')}" /></span>
                    <div id="testb">
				       <div id="td"></div>
				       <input id="showkb" type="button" value="Keyboard" onclick="PopupVirtualKeyboard.toggle('testb','td'); return false;" />
				      </div>
                </div>
            </g:form>
        </div>
                        </td>
        </tr>
        
         </table>
         </div>
    </body>
</html>
