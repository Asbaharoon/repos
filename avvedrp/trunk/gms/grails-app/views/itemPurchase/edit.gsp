<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Edit Item Purchase</title>
        <script type="text/javascript">
	    </script>
    </head>
    <body>
      <div class="wrapper"> 
      <g:subMenuList/>  
	        <div class="body">
	            <h1><g:message code="default.EditItemPurchase.edit.head"/></h1>
	            <g:if test="${flash.message}">
	            	<div class="message">${flash.message}</div>
	            </g:if>
	            <g:hasErrors bean="${itemPurchaseInstance}">
		            <div class="errors">
		                <g:renderErrors bean="${itemPurchaseInstance}" as="list" />
		            </div>
	            </g:hasErrors>
	            <g:form method="post" >
	                <g:hiddenField name="id" value="${itemPurchaseInstance?.id}" />
	                <g:hiddenField name="version" value="${itemPurchaseInstance?.version}" />
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        	<tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="name"><g:message code="default.itemPurchase.NameOfItem.label" /></label>:
	                                  <label for="NameOfItem" style="color:red;font-weight:bold"> * </label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemPurchaseInstance, field: 'name', 'errors')}">
	                                    <g:textField name="name" value="${itemPurchaseInstance?.name}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="assetCode"><g:message code="default.itemPurchase.AssetCode.label" /></label>:
	                                  <label for="AssetCode" style="color:red;font-weight:bold"> * </label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemPurchaseInstance, field: 'assetCode', 'errors')}">
	                                    <g:textField name="assetCode" value="${itemPurchaseInstance?.assetCode}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="billNo"><g:message code="default.itemPurchase.BillNo.label" /></label>:
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemPurchaseInstance, field: 'billNo', 'errors')}">
	                                    <g:textField name="billNo" value="${fieldValue(bean: itemPurchaseInstance, field: 'billNo')}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="cost"><g:message code="default.itemPurchase.Cost(Rs).label" /></label>:
	                                  <label for="Cost" style="color:red;font-weight:bold"> * </label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemPurchaseInstance, field: 'cost', 'errors')}">
	                                    <g:textField name="cost" value="${amount}" />
	                                </td>
	                            </tr>
	                        
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="dateReceived"><g:message code="default.itemPurchase.DateReceived.label" /></label>:
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemPurchaseInstance, field: 'dateReceived', 'errors')}">
	                                <calendar:datePicker name="dateReceived" value="${itemPurchaseInstance?.dateReceived}" defaultValue="${new Date()}" 
					    				dateFormat="%d/%m/%Y"/>
					    				
	                                </td>
	                            </tr>
	                                                                           
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="orderNo"><g:message code="default.itemPurchase.OrderNo.label" /></label>:
	                                  <label for="OrderNo" style="color:red;font-weight:bold"> * </label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemPurchaseInstance, field: 'orderNo', 'errors')}">
	                                    <g:textField name="orderNo" value="${fieldValue(bean: itemPurchaseInstance, field: 'orderNo')}" />
	                                </td>
	                            </tr>
	                        
	                            
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="remarks"><g:message code="default.Remarks.label" /></label>:
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: itemPurchaseInstance, field: 'remarks', 'errors')}">
	                                    <g:textField style='width: 200px; height: 50px;' name="remarks" 
	                                    value="${itemPurchaseInstance?.remarks}" />
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>                       
	                </div>
	                 
	                <div class="buttons">
	                    <span class="button"><g:actionSubmit class="save" action="update" onClick="return validateItemPurchase()" 
	                    	value="${message(code: 'default.Update.button')}" />
	                	</span>
						<span class="button">
								<g:actionSubmit class="delete"  action="delete" 
								value="${message(code: 'default.Delete.button')}" 
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</span>
	                </div>   
	            </g:form>
	        </div>
        </div>
    </body>
</html>
