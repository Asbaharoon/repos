<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'fundAdvance.label', default: 'FundAdvance')}" />
        <title><g:message code="default.EditExpenseEntry.label"/></title>
    </head>
    <body>
        <div class="wrapper"> 
	        <g:subMenuList/>  
	        <div class="proptable">    
	            <table width="100%" align="left">
	              <tr>
	             	<td ><g:message code="default.ProjectCode.label"/>:</td>
		            <td><strong>${fieldValue(bean:projectsInstance, field:'code')}</strong></td>
		            <td ><g:message code="default.advanceAmount.label"/>:</td>
		            <td ><strong>
		            		<g:message code="default.Rs.label" />
		            		${currencyFormat.ConvertToIndainRS(fundAdvanceWithBalanceInstance?.advanceAmount)}
	            		</strong>
	        		</td>
	        		<td ><g:message code="default.BalanceAmount.label"/>:</td>
		            <td ><strong>
		            		<g:message code="default.Rs.label" />
		            		${currencyFormat.ConvertToIndainRS(fundAdvanceWithBalanceInstance?.balanceAmount)}
	            		</strong>
	        		</td>
		          </tr> 
	          </table> 
      	 	</div> 
	        <div class="body">
	            <h1><g:message code="default.EditExpenseEntry.label"/></h1>
	            <g:if test="${flash.message}">
	            	<div class="message">${flash.message}</div>
	            </g:if>
	            <g:if test="${flash.error}">
	            	<div class="errors">${flash.error}</div>
            	</g:if>
	            <g:hasErrors bean="${fundAdvanceInstance}">
	            <div class="errors">
	                <g:renderErrors bean="${fundAdvanceInstance}" as="list" />
	            </div>
	            </g:hasErrors>
	            <g:form method="post">
	                <div class="dialog">
	                    <table>
	                        <tbody>
	                        
	                        	<tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="dateOfExpense"><g:message code="default.ExpenseDate.label"/></label>: 
                                         </td>
                                         <td valign="top" class="value ${hasErrors(bean:grantExpenseInstance,field:'dateOfExpense','errors')}"> 
                                         <calendar:datePicker name="dateOfExpense" defaultValue="${new Date()}" value="${grantExpenseInstance?.dateOfExpense}" dateFormat= "%d/%m/%Y"/>
                                         <g:hiddenField name="grantExpenseId" value="${grantExpenseInstance?.id}" /> 
                                    </td>
	                                
	                                <td valign="top" class="name">
	                                    <label for="accHead"><g:message code="default.AccountHeads.label"/></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean:grantExpenseInstance,field:'grantAllocationSplit','errors')}"> 
	                                    <g:select optionKey="id" optionValue="accHeadPeriod" from="${accountHeadList}" noSelection="['null':'-Select-']" name="grantAllocationSplit.id" value="${grantExpenseInstance?.grantAllocationSplit?.id}" ></g:select>
	                                    <g:hiddenField name="grantAllnId" value="${fundAdvanceWithBalanceInstance?.grantAllocation.id}"/>
	                                </td>
	                                
	                            </tr>
	                            
	                            <tr class="prop">
	                                <td valign="top" class="name"> 
                                         <label for="expenseAmount"><g:message code="default.ExpenseAmount(Rs).label"/></label>: 
                                         <label for="expenseAmount" style="color:red;font-weight:bold"> * </label>
                                     </td>
                                     <td valign="top" class="value ${hasErrors(bean:grantExpenseInstance,field:'expenseAmount','errors')}"> 
                                         <input type="text" id="expenseAmount" name="expenseAmount" value="${amount}" style="text-align: right" />
                                         <g:hiddenField name="fundAdvanceId" value="${fundAdvanceWithBalanceInstance?.id}"/>
                             		</td>
                             		
	                                <td valign="top" class="name"> 
                                         <label for="description"><g:message code="default.Description.label"/></label>:
                                         <label for="description" style="color:red;font-weight:bold"> * </label> 
                                     </td>
                                     <td valign="top" class="value ${hasErrors(bean:grantExpenseInstance,field:'description','errors')}"> 
                                         <g:textArea name="description" value="${fieldValue(bean:grantExpenseInstance,field:'description')}" rows="3" cols="30"/> 
                                     </td>
	                            </tr>
	                            
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                  <label for="modeOfPayment"><g:message code="default.ModeOfPayment.label" /></label>
	                                  <label for="modeOfPayment" style="color:red;font-weight:bold"> * </label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: grantExpenseInstance, field: 'modeOfPayment', 'errors')}">
	                                  <g:select name="modeOfPayment" from="${['DD','Cheque','Bank Transfer','Cash']}"  
                                       onchange="${remoteFunction(controller:'grantExpense',action:'updateModeOfPayment',update:'fieldSelect',  params:'\'modeOfPayment=\' + this.value' )}"
                                       value="${fieldValue(bean:grantExpenseInstance,field:'modeOfPayment')}"></g:select>
                                    </td>
                                          
	                                  <g:if test="${(grantExpenseInstance.modeOfPayment=='Bank Transfer' || grantExpenseInstance.modeOfPayment=='Cash')}">
			                           <td valign="top" class="name">
			                                <label for="ddNo"><g:message code="default.DD/ChequeNo.label"/></label>:
			                                <label for="ddNo" style="color:red;font-weight:bold"> * </label>
						                </td>
						                <td id="fieldSelect" valign="top" class="value ${hasErrors(bean:grantExpenseInstance,field:'ddNo','errors')}">
						             	 <input type="text" id="ddNo" name="ddNo" value="" disabled="true" />
			                           </td>
									  </g:if>
									  
									  <g:else>
									   <td valign="top" class="name">
			                                <label for="ddNo"><g:message code="default.DD/ChequeNo.label"/></label>:
			                                <label for="ddNo" style="color:red;font-weight:bold"> * </label>
						                </td>
						                <td id="fieldSelect" valign="top" class="value ${hasErrors(bean:grantExpenseInstance,field:'ddNo','errors')}">
						                     <input type="text" id="ddNo" name="ddNo" value="${fieldValue(bean:grantExpenseInstance,field:'ddNo')}" style="text-align: right" />
						                </td>
									 </g:else>
                                </tr>
	                            <tr class="prop">
	                                
	                                 
	                                <td valign="top" class="name">
	                                    <label for="ddDate"><g:message code="default.DD/ChequeDate.label"/></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: grantExpenseInstance, field: 'ddDate', 'errors')}">
	                                    <calendar:datePicker name="ddDate" defaultValue="${new Date()}" value="${grantExpenseInstance?.ddDate}" dateFormat= "%d/%m/%Y"/>
	                                </td>
	                                	                                
	                                <td valign="top" class="name">
	                                    <label for="bankName"><g:message code="default.BankName.label"/></label>
	                                    <label for="bankName" style="color:red;font-weight:bold"> * </label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean:grantExpenseInstance,field:'bankName','errors')}">
                                         <input type="text" id="bankName" name="bankName" value="${fieldValue(bean:grantExpenseInstance,field:'bankName')}" style="text-align: right" />
                                     </td>
	                            </tr>
	                        
	                                                  
	                            <tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="ddBranch"><g:message code="default.Branch.label"/></label>
	                                    <label for="ddBranch" style="color:red;font-weight:bold"> * </label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean:grantExpenseInstance,field:'ddBranch','errors')}">
                                         <input type="text" id="ddBranch" name="ddBranch" value="${fieldValue(bean:grantExpenseInstance,field:'ddBranch')}" style="text-align: right" />
                                     </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                <g:if test="${fundAdvanceInstance.status == 'Closed'}">
			        	<g:message code="default.AlreadyClosedCantUpdate.message"/>
                 	</g:if>	
	     			<g:else>
		                <div class="buttons">
		                    <span class="button"><g:actionSubmit class="save" action="updateExpenseDetails" onClick="return validateExpenseDetails()" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
		                    <span class="button"><g:actionSubmit class="delete" action="deleteExpenseDetails" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		                </div>
	                </g:else>
	            </g:form>
	        </div>
	    </div>
    </body>
</html>
