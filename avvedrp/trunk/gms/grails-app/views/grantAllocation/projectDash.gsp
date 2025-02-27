<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${createLinkTo(dir:'images',file:'hro.css')}" />
        <meta name="layout" content="main" />
        <title><g:message code="default.FundList.title" /></title>
        <script type="text/javascript" src="${createLinkTo(dir:'images',file:'jquery-1.3.2.min.js')}">
        </script> 
		<style>
 		</style>
	</head>
<!-- Main Container Start -->
	<body>
    	<div class="wrapper">
    	<g:if test="${projectInstance.status=='Closed'}">
    	</g:if>
    	<g:else>
    		<g:subMenuList/>
    	</g:else>
    	
        	
        	<div class="dashbody">
 <!-- Prodetials Start-->	
				<table width="100%" align="center" border="0" cellspacing="5" cellpadding="5">
         			<tr>
           				<td width="60%" >
 		 					<table width="100%"  border="0" cellspacing="0" cellpadding="0">
 			  					<tr>
 									<td>
					<!-- info Start-->	
										<table width="50%"  border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td>
			 										<div class="prjInfo">
								       				   <strong>
							       					      <g:message code="default.Project.label" />
						       							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						       							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						       							  : ${projectInstance.code}
							       						</strong>
								        				<br>
													    
													    <g:if test="${grantAllocationInstance.granter!=null}"> 
													    	<strong>
													    		<g:message code="default.Grantor.label" />
													    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							       								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													    		: ${grantAllocationInstance.granter.code}
												    		</strong>
												    		<br>
												    		<strong>
												    			<g:message code="default.FundList.ParentProject.label"/>
												    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
												    			${parentProjectInstance.code}
												    		</strong>
												    		<br>
												    	</g:if>
												    	<g:if test="${subProjectString}">
										    	       	<strong>
												    		<g:message code="default.FundList.Sub-Project/s.label"/>
												    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
												    		</strong>
												    		${subProjectString}
												    		<br>
										    	       	</g:if>
										    	       	
										    	       	<strong>
								     						<g:message code="default.FundList.ProjectDuration.label" />
								     						:
							     						</strong>
							     							<g:formatDate format="dd MMM yyyy" date="${projectInstance.projectStartDate}"/>- 
								      						<g:formatDate format="dd MMM yyyy" date="${projectInstance.projectEndDate}"/> 
									      					(${Math.round((projectInstance.projectEndDate.getTime()-
									      					projectInstance.projectStartDate.getTime())/86400000)} days)
								     					<br>
								     					
								     					<strong>
								     						<g:message code="default.FundList.DaysRemaining.label" />
								     						&nbsp;:
							     						</strong>
								     						(<g:if test="${Math.round((projectInstance.projectEndDate.getTime()-
								     							new Date().getTime())/86400000) > 0}">${Math.round((projectInstance.projectEndDate.getTime()-
								     							new Date().getTime())/86400000)} days
								     							</g:if>
								     							<g:else>0 days</g:else>)	    	
									    	       </div>
							    	       		</td>
						    	       		</tr>
						    	        </table>
					    	       	 </td>
							    	 <td width="40%">
						    	       	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
						    	       		<tr>
							    	       		<td>
							    	       			<div class="prjInfo">
										    	       	<strong>
											    	       	<g:message code="default.FundList.SanctionedAmount.label"/>
											    	       &nbsp;&nbsp;&nbsp;
											    	       	: <g:message code="default.Rs.label"/>
										    	       	</strong>
										  				${currencyFormat.ConvertToIndainRS(projectInstance.totAllAmount)} 
		<img src="${createLinkTo(dir:'images/themesky',file:'contxthelp.gif')}" align="right" onClick="window.open('${application.contextPath}/images/help/${session.Help}','mywindow','width=500,height=250,left=0,top=100,screenX=0,screenY=100,scrollbars=yes')" title="Help" alt="Help">
								    					<br>
								       					
								       					<strong>
								       						<g:message code="default.FundList.FundReceived.label" />
								       						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								       						: <g:message code="default.Rs.label"/>
								       					</strong> 
							       						${currencyFormat.ConvertToIndainRS(sumGrantRecieve[0].doubleValue())} 
								    					<br>
								    					
								    					<strong>
								    						<g:message code="default.FundList.FundAwaiting.label" />
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
															<g:message code="default.Rs.label"/> 
														</strong>
														${currencyFormat.ConvertToIndainRS(projectInstance.totAllAmount-sumGrantRecieve[0].doubleValue())}			     						
							     						<br>
								    					
								    					<strong>
															<g:message code="default.FundTransferred.label"/>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											    	       		: <g:message code="default.Rs.label"/>
									    	       		</strong>
									  					${currencyFormat.ConvertToIndainRS(fundTransferInstance)} 
								    					<br>
								    					
								    					<strong>
								    						<g:message code="default.FundList.FundUtilized.label" />
								    						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								    						: <g:message code="default.Rs.label"/>
								    					</strong> 
								    					${currencyFormat.ConvertToIndainRS(sumAmount[0].doubleValue() + childExpnseSum)}
								    					<br>
								    					
								    					<strong><g:message code="default.CurrentBalance.label" />
								    						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								    						: <g:message code="default.Rs.label"/> 
							    						</strong> 
							    						${currencyFormat.ConvertToIndainRS(sumGrantRecieve[0].doubleValue()-
								    						sumAmount[0].doubleValue() + refundAmt.doubleValue()-childExpnseSum)}
								    					<br>
							     					</div>
		     									</td>
			     						 	</tr>
	     						       </table>
									</td>
    				<!-- info End-->    				
		  						</tr>
	  						</table>
		  					<tr>
		    					<td align="left"> <table align="center" width="95%">
									<tr>
										<td  style="background-color: #cbe2f0; border: solid #FFFFFF 1px; 
	    										margin: 5px; border-right: none;" 
	    										width="33%" align="left">
 							<!-- piechart Start-->	
 							    	
											<br>
											<br>
											<br>
											<img src ="${resultPiechart}" align="middle" />	
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
 							<!-- piechart End--> 				
							  			 </td>
							  			 <td  style="background-color: #cbe2f0; border: solid #FFFFFF 1px; 
								  			 		border-left: none; margin: 5px;" width="34%" align="right">
						<!-- Linechart Start-->	
											
	 								  	 	<img src ="${resultLinechart}" align="right" />
 						<!-- Linechart End --> 	
										 </td>
									  </tr>
									</table>
								</td>
  							</tr>
 		  				
 		   <!-- Prodetials End-->
	  				</td>
 			  	</tr>
 		 	 </table>
           </div>  
        </div>
    </body>
</html>
