<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'projectEmployeeSalaryDetails.label', default: 'ProjectEmployeeSalaryDetails')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projectEmployeeSalaryDetails.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projectEmployeeSalaryDetailsInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projectEmployeeSalaryDetails.endDate.label" default="End Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${projectEmployeeSalaryDetailsInstance?.endDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projectEmployeeSalaryDetails.projectEmployeeId.label" default="Project Employee Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projectEmployeeSalaryDetailsInstance, field: "projectEmployeeId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projectEmployeeSalaryDetails.salaryAmount.label" default="Salary Amount" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projectEmployeeSalaryDetailsInstance, field: "salaryAmount")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projectEmployeeSalaryDetails.salaryComponentId.label" default="Salary Component Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projectEmployeeSalaryDetailsInstance, field: "salaryComponentId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="projectEmployeeSalaryDetails.withEffectFrom.label" default="With Effect From" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${projectEmployeeSalaryDetailsInstance?.withEffectFrom}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${projectEmployeeSalaryDetailsInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
