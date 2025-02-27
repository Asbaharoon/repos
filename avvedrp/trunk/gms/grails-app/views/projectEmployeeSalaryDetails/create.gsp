<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" 
        	value="${message(code: 'projectEmployeeSalaryDetails.label', default: 'ProjectEmployeeSalaryDetails')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script type="text/javascript">
		</script>
    </head>
    <body>  
    	<div class="wrapper"> 
    	<g:subMenuList/>   
			<div class="body">
      	<img src="${createLinkTo(dir:'images/themesky',file:'contxthelp.gif')}" align="right" onClick="window.open('${application.contextPath}/images/help/${session.Help}','mywindow','width=500,height=250,left=0,top=100,screenX=0,screenY=100,scrollbars=yes')" title="Help" alt="Help">
		        <h1><g:message code="default.ProjectEmployeeSalary.create.head" /></h1>
		        <g:if test="${flash.message}">
		        	<div class="message">${flash.message}</div>
		        </g:if>
		        <g:hasErrors bean="${projectEmployeeSalaryDetailsInstance}">
		        	<div class="errors">
		            	<g:renderErrors bean="${projectEmployeeSalaryDetailsInstance}" as="list" />
		        	</div>
		        </g:hasErrors>
		        
		        <g:form action="save" method="post" >
		        	<div class="dialog">
						<table>
							<tbody>
								<tr>
									<td><label><g:message code="default.EmployeeName.label" /></label>:</td>    		
									<td>${fieldValue(bean: projectEmployeeInstance,field: "empName")}
											(${fieldValue(bean: projectEmployeeInstance,field: "empNo")})
									</td>
										<input type="hidden" name="projectEmployee.id" id="projectEmployee.id" 
											value="${projectEmployeeInstance.id}"/>
									<td><label><g:message code="default.Designation.label" /></label>:</td>
									<td>${fieldValue(bean: projectEmployeeInstance.employeeDesignation,
										field: "Designation")}</td>
						    	</tr>
								<tr >
								    <td><label><g:message code="default.SalaryComponent.label" /></label>:
								    <label for="SalaryComponent" style="color:red;font-weight:bold"> * </label>
								    </td>
								    <td><g:select name='salaryComponent.id' optionKey="id" optionValue="Name" 
								    		from="${salaryComponentInstance}" noSelection="['null':'-Select-']" 
								    		value="${projectEmployeeSalaryDetailsInstance?.salaryComponent?.id}"></g:select>
						    		</td>
									<td><label><g:message code="default.ProjectEmployeeSalary.SalaryAmount.label" />
											 (<g:message code="default.Rs.label" />)
										</label>:
										<label for="SalaryAmount" style="color:red;font-weight:bold"> * </label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: projectEmployeeSalaryDetailsInstance, 
										field: 'salaryAmount', 'errors')}">
										<g:textField name="salaryAmount" 
										value="${fieldValue(bean: projectEmployeeSalaryDetailsInstance, field: 'salaryAmount')}" />
							        </td>
						        </tr>
								<tr >
									<td><label><g:message code="default.ProjectEmployeeSalary.WithEffectFrom.label" /></label>:</td>
									<td><calendar:datePicker id="withEffectFrom" name="withEffectFrom" defaultValue="${new Date()}" 
										dateFormat="%d/%m/%Y"/>
									</td>
									<!--<td><label>End Date</label></td>-->
							  		<!--<td><calendar:datePicker name="endDate"/></td>-->
								</tr>
							</tbody>
				   	</table>
			   	</div>	
		   		<div class="buttons">
					<span class="button"><g:submitButton name="create" class="save" 
						onClick="return validateProjectEmployeeSalaryDetails()" 
						value="${message(code: 'default.Save.button')}" />
					</span>
				</div>
			</g:form>
		</div>
			
	<div class="body">
            <div class="list">
            	<g:if test="${projectEmployeeSalaryDetailsInstanceList}">	
                	<table> 
                		<thead>
	  						<tr>
	  							<g:sortableColumn property="id" title="${message(code: 'default.SINo.label')}" />
	                       
	                   	        <g:sortableColumn property="projectEmployeeSalaryDetailsInstance.salaryComponent.Name" 
	                   	        	title="${message(code: 'default.SalaryComponent.label')}" />
	                   	        
	                   	        <g:sortableColumn property="projectEmployeeSalaryDetailsInstance.salaryAmount" 
	                   	        	title="${message(code: 'default.ProjectEmployeeSalary.Amount(Rs).label')}" />
	                                              
	                   	        <g:sortableColumn property="projectEmployeeSalaryDetailsInstance.withEffectFrom" 
	                   	        	title="${message(code: 'default.ProjectEmployeeSalary.WithEffectFrom.label')}"/>
	                	       
	                   	       	<th><g:message code="default.Edit.label" /></th>
	           	             </tr>
               		 	</thead>
   	               		<tbody>	
	   	     				<g:each in="${projectEmployeeSalaryDetailsInstanceList}" status="i" var="projectEmployeeSalaryDetailsInstance">
                        	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
								
								<td>${i+1}</td>
                            	
                            	<td>${projectEmployeeSalaryDetailsInstance.salaryComponent.Name}</td>
                                
                                <td>${currencyFormat.ConvertToIndainRS(projectEmployeeSalaryDetailsInstance.salaryAmount)}</td>
                            	
                            	<td><g:formatDate format="MM/dd/yyyy" date="${projectEmployeeSalaryDetailsInstance.withEffectFrom}"/></td>
                        
                                <g:hiddenField name="id" value="${projectEmployeeSalaryDetailsInstance?.id}" />
	         						<input type="hidden" name="projectEmployee.id" id="projectEmployee.id" value="${projectEmployeeInstance.id}"/>
	        					<td><g:link  action="edit" params="['projectEmployee.id':projectEmployeeInstance.id]" 
	        							id="${fieldValue(bean:projectEmployeeSalaryDetailsInstance,field:'id')}"><g:message code="default.Edit.label" />
        							</g:link>
    							</td>
                            </tr>
                    	</g:each>
                	</tbody>	
				</table>
                </g:if>
         		<g:else>
         			<br><g:message code="default.NoRecordsAvailable.label"/></br>
        		</g:else>
    		 </div>
		   </div>
		</div>
	 </body>
</html>
