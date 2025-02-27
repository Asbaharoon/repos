

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show ExpenseHeadMaster</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ExpenseHeadMaster List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ExpenseHeadMaster</g:link></span>
        </div>
        <div class="body">
            <h1>Show ExpenseHeadMaster</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:expenseHeadMasterInstance, field:'id')}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Expense Head Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:expenseHeadMasterInstance, field:'expenseHeadName')}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Remarks:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:expenseHeadMasterInstance, field:'remarks')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Active Yes No:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:expenseHeadMasterInstance, field:'activeYesNo')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${expenseHeadMasterInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
