<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title><g:message code="default.assignedBudgetDetail.label"/></title>
    </head>
    <body>
     
    <g:javascript library="application"/>
     <g:if test="${params.moduleType=='Notification'}">
            <g:subMenuNotification/>
     </g:if>
     
     <g:else>
            <g:subMenuList/>
     </g:else>
     
    <div class="wrapper">
     <div class="dialog">
       <div class="body">
	      <img src="${createLinkTo(dir:'images/themesky',file:'contxthelp.gif')}" align="right" onClick="window.open('${application.contextPath}/images/help/${session.Help}','mywindow','width=500,height=250,left=0,top=100,screenX=0,screenY=100,scrollbars=yes')" title="Help" alt="Help">

           <h1><g:message code="default.assignedBudgetDetail.label" args="[entityName]" /></h1>
       	 <div class="list">
        	<g:if test="${budgetMasterInstanceList}">
        	   <table>
                 <thead>
                    <tr>
                       <th><g:message code="default.budget.label"/></th>
	                   
	                   <th><g:message code="default.totalBudgetAmount(Rs).label"/></th>
	                </tr>
	              </thead>
               <tbody>
                   
	          <g:each in="${budgetMasterInstanceList}" status="i" var="budgetMasterInstance">
	            <tr>
	        	   <td>${budgetMasterInstanceList[i].title}</td>
	            	   
	               <td>${currencyFormat.ConvertToIndainRS(budgetMasterInstanceList[i].totalBudgetAmount)}</td>
	            </tr>
	         </g:each>
  			 </tbody>
  		    </table>
             </g:if>
             <div class="list">
        	 <g:if test="${budgetDetInstanceList}">
              <table>
                    <thead>
                        <tr>
                           <th><g:message code="default.SINo.label" /></th>
                           
                           <th><g:message code="default.budget.label"/></th>
                           
                           <th><g:message code="default.budgetDetailsAccountHead.label" /></th>
							
						   <th><g:message code="default.budgetDetails.allocatedAmount(Rs).label" /></th>
                        </tr>
                    </thead>
                    <tbody>
                   
                    <g:each in="${budgetDetInstanceList}" status="i" var="budgetDetailsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                           <td>${i+1}</td>
                           
                           <td>${budgetDetailsInstance.budgetMaster.title}</td>
                           
                           <td>${fieldValue(bean: budgetDetailsInstance, field: "accountHeads.code")}</td>
                                                      
                           <td>${currencyFormat.ConvertToIndainRS(budgetDetailsInstance.allocatedAmount)}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
           </g:if>
           <g:else>
    		<td><g:message code="default.NoDetails.label"/></td>
      	   </g:else>
           </div> 
       </div>         
      </div>
    </div>
    </body>
</html>
                    
                    
               
