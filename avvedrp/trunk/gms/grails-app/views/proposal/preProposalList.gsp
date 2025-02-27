

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'preProposal.label', default: 'PreProposal')}" />
        <title><g:message code="default.PreProposalList.label"  /></title>
    </head>
    <body>
       
        <div class="wrapper">
        <div class="body">
        <img src="${createLinkTo(dir:'images/themesky',file:'contxthelp.gif')}" align="right" onClick="window.open('${application.contextPath}/images/help/${session.Help}','mywindow','width=500,height=250,left=0,top=100,screenX=0,screenY=100,scrollbars=yes')" title="Help" alt="Help">
            <h1><g:message code="default.PreProposalList.label"  /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                    
                        <tr>
                        	<g:sortableColumn property="id" title="${message(code: 'default.SINo.label', default: 'Id')}" />
                            
                            <g:sortableColumn property="projectTitle" title="${message(code: 'default.ProposalTitle.label')}" />
                        
                            <th><g:message code="default.ProposalCategory.label"  /></th>
                         
                            <g:sortableColumn property="preProposalStatus" title="${message(code: 'default.PreProposalStatus.label')}" />
                            
                            <th><g:message code="default.Edit.label"/></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${proposalInstanceList}" status="i" var="proposalInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                             <td>${i+1}</td> 
                             <td>${proposalApplicationInstanceList[i].projectTitle}</td>
                               
                             <td>${proposalApplicationInstanceList[i].proposalCategory.name}</td>
                              
                             <g:if test ="${proposalInstance.proposalStatus == 'Submitted'}">
                              <td><g:link action="preProposalReviewalStatus" controller = "proposal" id="${fieldValue(bean:proposalInstance, field:'id')}"><g:message code="default.Reviewing.label"/></g:link></td>
                             </g:if>
                          	 <g:else>
	                           <g:if test = "${proposalInstance.proposalStatus =='Approved'}">
	                            <td><g:link action="preProposalReviewalStatus" controller = "proposal" id="${fieldValue(bean:proposalInstance, field:'id')}" >${proposalInstance.proposalStatus}</g:link></td>
	                           </g:if>
	                           <g:else>
	                           <g:if test = "${proposalInstance.proposalStatus =='NeedMoreInfo'}">
	                            <td><g:link action="preProposalReviewalStatus" controller = "proposal" id="${fieldValue(bean:proposalInstance, field:'id')}" >${proposalInstance.proposalStatus}</g:link></td>
	                           </g:if>
	                      	 <g:else>
                             <td>${proposalInstance.proposalStatus}</td>
                             </g:else>
                             </g:else>
                             </g:else>
                             <g:if test = "${proposalInstance.proposalStatus =='NeedMoreInfo' || proposalInstance.proposalStatus =='Submitted' || proposalInstance.proposalStatus =='Saved'}">
                              <td><g:link action="preProposalEdit" id="${fieldValue(bean:proposalInstance, field:'id')}"><g:message code="default.Edit.label"/></g:link></td>
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
        </div>
    </body>
</html>
