import org.codehaus.groovy.grails.web.servlet.mvc.GrailsHttpSession
import java.text.SimpleDateFormat
import java.text.*;
import java.util.*;

class GrantExpenseController extends GmsController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
		GrailsHttpSession gh=getSession()
        if(!params.max) params.max = 10
        
        /* List all grant allocations with account head */
//       [ grantAllocationInstanceList: GrantAllocation.findAll("from GrantAllocation GA where GA.accountHeads IS NOT NULL and GA.allocationType not in ('Fund') and  GA.projects in "+gh.getValue("ProjectID")+" and   GA.party in "+gh.getValue("PartyID")) ]
 
		def dataSecurityService = new DataSecurityService()
		def grantAllocationInstanceList = dataSecurityService.getGrantAllocationsForLoginUser(null,gh.getValue("ProjectID"),gh.getValue("PartyID"))
        [ grantAllocationInstanceList: grantAllocationInstanceList]	
    }

    def show = {
		System.out.println("Params "+params)
    		
		def grantExpenseService = new GrantExpenseService()
        def grantExpenseInstance =  grantExpenseService.getGrantExpenseById(new Integer(params.id))
        
        if(!grantExpenseInstance) {
            flash.message = "${message(code: 'default.notfond.label')}"
            redirect(action:list)
        }
        else { return [ grantExpenseInstance : grantExpenseInstance ] }
    }

    def delete = {
    	def grantExpenseService = new GrantExpenseService()
		def grantExpenseInstance =  grantExpenseService.getGrantExpenseById(new Integer(params.id))
		def utilizationInstance = Utilization.findAll("from Utilization U where U.projects="+grantExpenseInstance.projects.id)
 		if(utilizationInstance)
 		{
 				   Date temp;
 				   Date attr;
 				   for(int i=0;i<utilizationInstance.size(); i++)
 				   {
 					   temp = utilizationInstance[i].startDate
 					   for (int j=1;j<utilizationInstance.size();j++ )
 					   {
 					   if(utilizationInstance[i].startDate > utilizationInstance[j].startDate)
 					   {
 						   temp = utilizationInstance[j].startDate
 					   }
 					   }
 				   }
 				   
 				   for(int j=0;j<utilizationInstance.size(); j++)
 				   {
 					   attr = utilizationInstance[j].endDate
 					   for (int k=1;k<utilizationInstance.size();k++ )
 					   {
 					   if(utilizationInstance[j].endDate < utilizationInstance[k].endDate)
 					   {
 						   attr = utilizationInstance[k].endDate
 					   }
 					   }
 				   }
 					   SimpleDateFormat sdfDestination = new SimpleDateFormat("dd/MM/yyyy");
 					     
 				          //parse the date into another format
 				          String strDate = sdfDestination.format(temp);
 				          String edDate = sdfDestination.format(attr);
 				          DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
 				          Date strtingDate = df.parse(strDate)
 				          Date endingDate = df.parse(edDate)
 				          Date expenseDate = df.parse(params.dateOfExpense_value)
 				       if(( expenseDate >= strtingDate) && (endingDate >= expenseDate) )
 				   	   {
 						  flash.message="${message(code: 'default.expenseDeleteUtilizationCertificate.label')}"
 							 redirect(action:edit,id:params.id)
 				   	   }
 					else
    				{
						Integer grantAllocationId = grantExpenseService.deleteGrantExpense(new Integer(params.id))
		
						if(grantAllocationId != null)
						{
							if(grantAllocationId > 0)
							{
								flash.message = "${message(code: 'default.deleted.label')}"
								redirect(action:create,id:grantExpenseInstance.projects.id)
							}
						}
						else{
							flash.message = "${message(code: 'default.notfond.label')}"
				            redirect(action:list)
						}
    				}
    	  }
 		  else
 		  {
 		  def fundAdvaneClosure = FundAdvance.find("from FundAdvance FA where FA.fundAdvanceCode='"+params.code+"' and FA.grantAllocation.id="+params.grantAllocation.id)
 		  if(fundAdvaneClosure !=null)
 		  	{
 		  	  	if(fundAdvaneClosure.status=='Closed')
	 		  	{
	 		  		flash.message = "${message(code: 'default.AdvanceFundisAlreadyclosedsocantdeleteenteredExpense.label')}"
					redirect(action:create,id:grantExpenseInstance.projects.id)
	 		  	}
	 		}
 		  	else
 		  	{
	 			 Integer grantAllocationId = grantExpenseService.deleteGrantExpense(new Integer(params.id))
	 			 if(grantAllocationId != null)
	 			 {
					 if(grantAllocationId > 0)
					 {
						 flash.message = "${message(code: 'default.deleted.label')}"
						 redirect(action:create,id:grantExpenseInstance.projects.id)
					 }
				 }
	 			 else
	 			 {
	 				 flash.message = "${message(code: 'default.notfond.label')}"
	 			     redirect(action:list)
	 			 }
	 		}
	 	 }
    }
    def edit = {
		def grantExpenseService = new GrantExpenseService()
		def grantAllocationService = new GrantAllocationService()
		def grantAllocationSplitService=new GrantAllocationSplitService()
		def grantExpenseInstance = grantExpenseService.getGrantExpenseById(new Integer(params.id))
        def dataSecurityService = new DataSecurityService()
		//checking  whether the user has access to the given projects
		if(dataSecurityService.checkForAuthorisedAcsessInProjects(grantExpenseInstance.projects.id,new Integer(getUserPartyID()))==0)
		{
					 redirect uri:'/invalidAccess.gsp'
		}
		else
		{
        /* Get grant allocation details. */
        Integer projectId = grantExpenseInstance.projects.id
        def projectsInstance = Projects.get(projectId)
        projectsInstance.totAllAmount=grantAllocationService.getSumOfAmountAllocatedForProject(projectsInstance.id,getUserPartyID())
		def accountHeadList=grantAllocationSplitService.getAccountHeadByProject(projectsInstance.id)

    	
    	/* Get already allocated expenses */
    	def sdf = new SimpleDateFormat('dd/MM/yyyy') 
        def dateFrom = new Date()
    	def dateTo = new Date()
     	if(params.dateFrom_value)
    		dateFrom = sdf.parse(params.dateFrom_value)
    		
		if(params.dateTo_value)
    		dateTo = sdf.parse(params.dateTo_value)
    		
    	def grantExpenseInstanceList = grantExpenseService.getGrantExpenseByProjectsAndExpenseDateRange(params.grantExpenseId,projectsInstance,dateFrom,dateTo)
    	
    	/* Get summary of expenses */
    	def grantExpenseSummaryList = grantExpenseService.getGrantExpenseTotalForAProject(projectsInstance)
        ConvertToIndainRS currencyFormatter=new ConvertToIndainRS();
        if(!grantExpenseInstance) {
            flash.message = "${message(code: 'default.notfond.label')}"
            redirect(action:list)
        }
        else {
        	grantExpenseInstance.dateFrom = dateFrom
        	grantExpenseInstance.dateTo = dateTo
        	NumberFormat formatter = new DecimalFormat("#0.00");
            return [ 'projectsInstance':projectsInstance,
                     'grantExpenseInstance' : grantExpenseInstance,
                     'grantExpenseInstanceList':grantExpenseInstanceList,
                     'grantExpenseSummaryList':grantExpenseSummaryList,
                     'currencyFormat':currencyFormatter,
                     'accountHeadList':accountHeadList,
                     'amount':formatter.format(grantExpenseInstance.expenseAmount)]
        }
		}
    }

    def update = {
    		
		def grantExpenseService = new GrantExpenseService()
    	def grantAllocationService = new GrantAllocationService()
		def grantExpenseOrginalInstance = grantExpenseService.getGrantExpenseById(new Integer(params.id))
    	def grantExpenseInstance = new GrantExpense(params)
		grantExpenseInstance.utilizationSubmitted = 'N'
    	def grantExpenseWithOutSave = grantExpenseInstance
		GrailsHttpSession gh=getSession()  
    		def allocatedAmount=grantAllocationService.getSumOfAmountAllocatedForProject(gh.getValue("ProjectID"),getUserPartyID())
    		def expenseTotal=GrantExpense.executeQuery("select sum(GE.expenseAmount) from GrantExpense GE where GE.projects="+grantExpenseInstance.projects.id)
    		double balanceAmnt
    		if(expenseTotal[0])
    		{
    		    balanceAmnt= (allocatedAmount+grantExpenseOrginalInstance.expenseAmount)- expenseTotal[0]
    		}
    		else
    		{
    			 balanceAmnt= allocatedAmount
    		}
    		if(grantExpenseInstance.expenseAmount > balanceAmnt)
    	    {
    	    	flash.message = "${message(code: 'default.ExpenseAmountValidationAgainstAllocatedAmount.label')}"
    	    	redirect(action:edit,id:params.id)
    	    }
    	    else
    	    {
    		   def headAllcnAmnt=grantExpenseService.getAllocatedAmntHeadwise(grantExpenseInstance)
    		   def headExpAmnt = grantExpenseService.getExpAmntHeadwise(grantExpenseInstance)
    		   double headBalance
    		   if (headExpAmnt[0])
    		   {
    			   if(grantExpenseOrginalInstance.grantAllocationSplit.id == (new Integer(params.grantAllocationSplit.id)))
    			   {
    				   headBalance = headAllcnAmnt[0]-(headExpAmnt[0] - grantExpenseOrginalInstance.expenseAmount)
    					   //(headAllcnAmnt[0]+grantExpenseOrginalInstance.expenseAmount)-headExpAmnt[0]
    			   }
				   else
				    headBalance = headAllcnAmnt[0]-headExpAmnt[0]
			   }
			  else
    		   {
    			 headBalance = headAllcnAmnt[0] 
    		   }
    		   if(grantExpenseInstance.expenseAmount > headBalance)
    		   {
    			   flash.message = "${message(code: 'default.ExpenseAmountValidationAgaistHeadwiseAllcn.label')}"
    			   redirect(action:edit,id:params.id)
    		   }
    		   else
    		   {
    			if(grantExpenseInstance) 
    			{
        	
    		if(grantExpenseInstance.dateOfExpense < grantExpenseInstance.grantAllocation.DateOfAllocation)
    		{
    			flash.message="${message(code: 'default.DateValidationAgainstAllocationdate.label')}"
    			grantExpenseInstance=grantExpenseWithOutSave
    			redirect(action:edit,id:params.id)
    		}
    		else
 		   {
 			    def utilizationInstance = Utilization.findAll("from Utilization U where U.projects="+grantExpenseInstance.projects.id)
 			    if(utilizationInstance)
 			   {
 				   Date temp;
 				   Date attr;
 				   for(int i=0;i<utilizationInstance.size(); i++)
 				   {
 					   temp = utilizationInstance[i].startDate
 					   for (int j=1;j<utilizationInstance.size();j++ )
 					   {
 					   if(utilizationInstance[i].startDate > utilizationInstance[j].startDate)
 					   {
 						   temp = utilizationInstance[j].startDate
 					   }
 					   }
 				   }
 				   
 				   for(int j=0;j<utilizationInstance.size(); j++)
 				   {
 					   attr = utilizationInstance[j].endDate
 					   for (int k=1;k<utilizationInstance.size();k++ )
 					   {
 					   if(utilizationInstance[j].endDate < utilizationInstance[k].endDate)
 					   {
 						   attr = utilizationInstance[k].endDate
 					   }
 					   }
 				   }
 					   SimpleDateFormat sdfDestination = new SimpleDateFormat("dd/MM/yyyy");
 					     
 				          //parse the date into another format
 				          String strDate = sdfDestination.format(temp);
 				          String edDate = sdfDestination.format(attr);
 				          DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
 				          Date strtingDate = df.parse(strDate)
 				          Date endingDate = df.parse(edDate)
 				          Date expenseDate = df.parse(params.dateOfExpense_value)
 				         if(( expenseDate >= strtingDate) && (endingDate >= expenseDate) )
 				         {
 						  flash.message="${message(code: 'default.expenseUpdateUtilizationCertificate.label')}"
 						  redirect(action:edit,id:params.id)
 				         }
 			else
    		{
    			grantExpenseInstance = grantExpenseService.updateGrantExpense(params)
    			if(grantExpenseInstance.isSaved)
    			{	
    				flash.message = "${message(code: 'default.updated.label')}"
    				redirect(action:create,id:grantExpenseInstance.projects.id)
    			}
    		
    			else 
    			{
                render(view:'edit',model:[grantExpenseInstance:grantExpenseInstance])
            	}
    		}
        }
 			  else
 	    		{
 	    	def fundAdvaneClosure = FundAdvance.find("from FundAdvance FA where FA.fundAdvanceCode='"+params.code+"' and FA.grantAllocation.id="+params.grantAllocation.id)
 		  	if(fundAdvaneClosure !=null)
 		  	{
 		  	  	if(fundAdvaneClosure.status=='Closed')
	 		  	{
	 		  	 	flash.message = "${message(code: 'default.AdvanceFundisAlreadyclosedsocantupdateenteredExpense.label')}"
					redirect(action:create,id:grantExpenseInstance.projects.id)
	 		  	}
	 		}
	 		else
 		  	{
 	    			grantExpenseInstance = grantExpenseService.updateGrantExpense(params)
 	    			if(grantExpenseInstance.isSaved)
 	    			{	
 	    				flash.message = "${message(code: 'default.updated.label')}"
 	    				redirect(action:create,id:grantExpenseInstance.projects.id)
 	    			}
 	    		
 	    			else 
 	    			{
 	                render(view:'edit',model:[grantExpenseInstance:grantExpenseInstance])
 	            	}
 	            	}
 	    		}
 		   }
    			}
        	
        else {
        	grantExpenseInstance=grantExpenseWithOutSave
        	flash.message = "${message(code: 'default.notfond.label')}"
            redirect(action:edit,id:params.id)
        }
    }
    }
    }

    def create = 
    {
    	def grantExpenseService = new GrantExpenseService()
		def grantAllocationService = new GrantAllocationService()
		def grantAllocationSplitService=new GrantAllocationSplitService()
		def grantReceiptService = new GrantReceiptService()
        GrailsHttpSession gh=getSession()
        gh.removeValue("Help")
       	//putting help pages in session
       	gh.putValue("Help","Grant_Expense.htm")
    	/* Get grant allocation details. */
    	def projectsInstance
    	if(params.id){
    		projectsInstance = Projects.get(new Integer(params.id))
    	//account head listing based on default grant period
    	def accountHeadList=grantAllocationSplitService.getAccountHeadByProject(projectsInstance.id)
    	def dataSecurityService = new DataSecurityService()
		//checking  whether the user has access to the given projects
		if(dataSecurityService.checkForAuthorisedAcsessInProjects(projectsInstance.id,new Integer(getUserPartyID()))==0)
		{
					 redirect uri:'/invalidAccess.gsp'
		}
		else
		{
    	 projectsInstance.totAllAmount=grantAllocationService.getSumOfAmountAllocatedForProject(projectsInstance.id,getUserPartyID())
   	     double receivedAmount = grantReceiptService.getSumOfAmountReceivedForProject(projectsInstance.id)
   	     def grantAllocationInstanceList=grantAllocationService.getGrantAllocationsByProject(params.id)
    	 
    	/* Get already allocated expenses */
    	def sdf = new SimpleDateFormat('dd/MM/yyyy')
    	def sdf1 = new SimpleDateFormat('yyyy/MM/dd')
        def dateFrom = new Date()
    	def dateTo = new Date()
   	 
   		if(params.dateFrom_value){
    		dateFrom = sdf.parse(params.dateFrom_value)
    	}
    	if(params.dateTo_value)
    		dateTo = sdf.parse(params.dateTo_value)
    		    	
    	def grantExpenseInstanceList = grantExpenseService.getGrantExpenseByProjectsAndExpenseDateRange(params.grantExpenseId,projectsInstance,dateFrom,dateTo)
    	
    	/* Get summary of expenses */
    	def grantExpenseSummaryList = grantExpenseService.getGrantExpenseTotalForAProject(projectsInstance)
    		
        def grantExpenseInstance = new GrantExpense()
		if(params.expenseAmount)
			
		{
			def grantAllocationInstance = GrantAllocation.find("from GrantAllocation GA where GA.id ="+params.grantAllocationId)
			def grantAllocationSplitInstance = GrantAllocationSplit.find("from GrantAllocationSplit GS where GS.id ="+params.accountHeadId)
			grantExpenseInstance.expenseAmount=new Double(params.expenseAmount)
			grantExpenseInstance.grantAllocation = grantAllocationInstance
			grantExpenseInstance.grantAllocationSplit = grantAllocationSplitInstance
			grantExpenseInstance.modeOfPayment = params.modeOfPayment
			grantExpenseInstance.ddNo =params.ddNo
			grantExpenseInstance.bankName = params.bankName
			grantExpenseInstance.ddBranch = params.ddBranch
			grantExpenseInstance.description = params.description
			
		}
    	grantExpenseInstance.projects = projectsInstance
    	grantExpenseInstance.dateFrom = dateFrom
    	grantExpenseInstance.dateTo = dateTo
    	if(params.grantExpenseId)
		{
    		grantExpenseInstance = grantExpenseService.getGrantExpenseById(new Integer(params.grantExpenseId))
			
		}
        grantExpenseInstance.properties = params
        def fundTransferService = new FundTransferService()
        def fundTransferAmnt = fundTransferService.getFundTransferTotal(grantExpenseInstance)
        def expenseTotal= grantExpenseService.getTotalExpenseAmnt(grantExpenseInstance)
        double totalAdvanceBal = 0.00
        def advanceFundList = grantExpenseService.getAdvanceFundListByGrantAllocation(grantAllocationInstanceList)
        for(advanceFundInstance in advanceFundList){
        	totalAdvanceBal = totalAdvanceBal+advanceFundInstance.balanceAmount
        }
        def grantAllocationInstanceInExternalFundList = grantExpenseService.getgrantAllocationByProjectIdInExternalFundAllocation(params)
        def grantReceiptSumAmountInstance
        double sum =0;
        for(int i=0;i<grantAllocationInstanceInExternalFundList.size();i++ )
 	    {
        	grantReceiptSumAmountInstance = grantExpenseService.getsumReceivedAmountByGrantAllotId(grantAllocationInstanceInExternalFundList[i].id)
        	if(grantReceiptSumAmountInstance)
            sum =sum + grantReceiptSumAmountInstance[0];
 	    }
        if(expenseTotal[0] && fundTransferAmnt[0])
     	  {
        	 grantExpenseInstance.currentBalance = receivedAmount - (expenseTotal[0]+ fundTransferAmnt[0]+totalAdvanceBal)
     	  }
         else if(expenseTotal[0])
         {
        	 grantExpenseInstance.currentBalance = receivedAmount - (expenseTotal[0]+totalAdvanceBal)
         }
         else if(fundTransferAmnt[0])
         {
        	 grantExpenseInstance.currentBalance = receivedAmount - (fundTransferAmnt[0]+totalAdvanceBal)
         }
         else
         {
        	 grantExpenseInstance.currentBalance = receivedAmount-totalAdvanceBal
         }
        ConvertToIndainRS currencyFormatter=new ConvertToIndainRS();
        NumberFormat formatter = new DecimalFormat("#0.00");
         return ['projectsInstance':projectsInstance,'grantExpenseInstance':grantExpenseInstance,
                 'grantExpenseInstanceList':grantExpenseInstanceList,
                 'grantExpenseSummaryList':grantExpenseSummaryList,
                 'grantAllocationInstanceList':grantAllocationInstanceList,
                 'currencyFormat':currencyFormatter,'accountHeadList':accountHeadList,
                 'amount':formatter.format(grantExpenseInstance.expenseAmount),'sum':formatter.format(sum)]
		}
    	}
    	else {    			
    			redirect uri:'/invalidAccess.gsp'}
    }

    def save = 
    {
		GrailsHttpSession gh=getSession()
		def grantExpenseService = new GrantExpenseService()
		def grantAllocationService = new GrantAllocationService()
		def grantAllocationSplitService = new GrantAllocationSplitService()
		def fundTransferService = new FundTransferService()
		params.createdBy="admin"
		params.createdDate = new Date()
        def grantExpenseInstance = new GrantExpense(params)
		grantExpenseInstance.utilizationSubmitted = 'N'
		def allocatedAmount=grantAllocationService.getSumOfAmountAllocatedForProject(gh.getValue("ProjectID"),getUserPartyID())
		def expenseTotal=GrantExpense.executeQuery("select sum(GE.expenseAmount) from GrantExpense GE where GE.projects="+grantExpenseInstance.projects.id)
		def fundTransferAmnt = fundTransferService.getFundTransferTotal(grantExpenseInstance)
		double balanceAmnt
	    def projectsInstance = Projects.get(new Integer(gh.getValue("ProjectID")))
	    ConvertToIndainRS currencyFormatter=new ConvertToIndainRS();
		
		if(expenseTotal[0] != null)
		{
			balanceAmnt= allocatedAmount- expenseTotal[0]
		}
		else
		{
			balanceAmnt= allocatedAmount
		}
		if(fundTransferAmnt[0] != null){
			balanceAmnt = balanceAmnt - fundTransferAmnt[0]
		}
		if(grantExpenseInstance.expenseAmount > allocatedAmount)
	    {
	    	flash.message = "${message(code: 'default.ExpenseAmountValidationAgainstAllocatedAmount.label')}"
	    		 redirect(action:create,id:grantExpenseInstance.projects.id,params:[expenseAmount:grantExpenseInstance.expenseAmount,
	    		                                     			                   grantAllocationId:grantExpenseInstance.grantAllocation.id,accountHeadId:grantExpenseInstance.grantAllocationSplit.id,
	    		                                     			                   modeOfPayment:grantExpenseInstance.modeOfPayment,ddNo:grantExpenseInstance.ddNo,
	    		                                     			                   bankName:grantExpenseInstance.bankName,ddBranch:grantExpenseInstance.ddBranch,
	    		                                     			                   description:grantExpenseInstance.description])
	    }
		else{
			if(grantExpenseInstance.expenseAmount > balanceAmnt)
		    {
		    	flash.message = "${message(code: 'default.NotEnoughBalance.label')}"
		    		 redirect(action:create,id:grantExpenseInstance.projects.id,params:[expenseAmount:grantExpenseInstance.expenseAmount,
		    		                                     			                   grantAllocationId:grantExpenseInstance.grantAllocation.id,accountHeadId:grantExpenseInstance.grantAllocationSplit.id,
		    		                                     			                   modeOfPayment:grantExpenseInstance.modeOfPayment,ddNo:grantExpenseInstance.ddNo,
		    		                                     			                   bankName:grantExpenseInstance.bankName,ddBranch:grantExpenseInstance.ddBranch,
		    		                                     			                   description:grantExpenseInstance.description])
		    }
			 else
			    {
				   def headAllcnAmnt=grantExpenseService.getAllocatedAmntHeadwise(grantExpenseInstance)
				   def headExpAmnt = grantExpenseService.getExpAmntHeadwise(grantExpenseInstance)
				   def headSplitAmtChilds = grantAllocationSplitService.getTotalSubGrantSplit(grantExpenseInstance.projects.id,grantExpenseInstance.grantAllocationSplit.accountHead.id, grantExpenseInstance.grantAllocationSplit.grantPeriod.id)
				   double headBalance
				   if (headExpAmnt[0])
				   {
				     headBalance = headAllcnAmnt[0]-headExpAmnt[0]
				   }
				   else
				   {
					 headBalance = headAllcnAmnt[0] 
				   }
				   if(headSplitAmtChilds){
					   headBalance = headBalance-headSplitAmtChilds
				   }
				   if(grantExpenseInstance.expenseAmount > headBalance)
				   {
					   flash.message = "${message(code: 'default.ExpenseAmountValidationAgaistHeadwiseAllcn.label')}"
					   redirect(action:create,id:grantExpenseInstance.projects.id,params:[expenseAmount:grantExpenseInstance.expenseAmount,
					                   grantAllocationId:grantExpenseInstance.grantAllocation.id,accountHeadId:grantExpenseInstance.grantAllocationSplit.id,
					                   modeOfPayment:grantExpenseInstance.modeOfPayment,ddNo:grantExpenseInstance.ddNo,
					                   bankName:grantExpenseInstance.bankName,ddBranch:grantExpenseInstance.ddBranch,
					                   description:grantExpenseInstance.description])
				   }
				   else
				   {
				   if(grantExpenseInstance.dateOfExpense < grantExpenseInstance.grantAllocation.DateOfAllocation)
			    	{
			    		flash.message="${message(code: 'default.DateValidationAgainstAllocationdate.label')}"
			    			 redirect(action:create,id:grantExpenseInstance.projects.id,params:[expenseAmount:grantExpenseInstance.expenseAmount,
			    			                                     			                   grantAllocationId:grantExpenseInstance.grantAllocation.id,accountHeadId:grantExpenseInstance.grantAllocationSplit.id,
			    			                                     			                   modeOfPayment:grantExpenseInstance.modeOfPayment,ddNo:grantExpenseInstance.ddNo,
			    			                                     			                   bankName:grantExpenseInstance.bankName,ddBranch:grantExpenseInstance.ddBranch,
			    			                                     			                   description:grantExpenseInstance.description])
			    	}
				 
				   else
				   {
					   def utilizationInstance = Utilization.findAll("from Utilization U where U.projects="+grantExpenseInstance.projects.id)
					   if(utilizationInstance)
					   {
						   
						   Date temp;
						   Date attr;
						   for(int i=0;i<utilizationInstance.size(); i++)
						   {
							  
							   temp = utilizationInstance[i].startDate
							   for (int j=1;j<utilizationInstance.size();j++ )
							   {
							   if(utilizationInstance[i].startDate > utilizationInstance[j].startDate)
							   {
								   temp = utilizationInstance[j].startDate
							   }
							   }
						   }
						   
						   for(int j=0;j<utilizationInstance.size(); j++)
						   {
							   
							   attr = utilizationInstance[j].endDate
							   for (int k=1;k<utilizationInstance.size();k++ )
							   {
							   if(utilizationInstance[j].endDate < utilizationInstance[k].endDate)
							   {
								   attr = utilizationInstance[k].endDate
							   }
							   }
						   }
							   
							  
							   SimpleDateFormat sdfDestination = new SimpleDateFormat("dd/MM/yyyy");
							     
						          
						          String strDate = sdfDestination.format(temp);
						          
						          String edDate = sdfDestination.format(attr);
						          
						          DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
						          Date strtingDate = df.parse(strDate)
						          
						          Date endingDate = df.parse(edDate)
						          
						          Date expenseDate = df.parse(params.dateOfExpense_value)
						        
						   if(( expenseDate >= strtingDate) && (endingDate >= expenseDate) )
						   {
							   
							
								  flash.message="${message(code: 'default.expenseUtilizationCertificate.label')}"
								  redirect(action:create,id:grantExpenseInstance.projects.id,params:[expenseAmount:grantExpenseInstance.expenseAmount,
					    			                                     			                   grantAllocationId:grantExpenseInstance.grantAllocation.id,accountHeadId:grantExpenseInstance.grantAllocationSplit.id,
					    			                                     			                   modeOfPayment:grantExpenseInstance.modeOfPayment,ddNo:grantExpenseInstance.ddNo,
					    			                                     			                   bankName:grantExpenseInstance.bankName,ddBranch:grantExpenseInstance.ddBranch,
					    			                                     			                   description:grantExpenseInstance.description])
						   }
						          
						else
			    	    {
			    		grantExpenseInstance = grantExpenseService.saveGrantExpense(grantExpenseInstance)
				
			    		if(grantExpenseInstance.isSaved)
			    		{
			    			flash.message = "${message(code: 'default.created.label')}"
			    			redirect(action:create,id:grantExpenseInstance.projects.id,params:[grantExpenseId:grantExpenseInstance.id])
			    		}
			    		else 
			    		{
			    			render(view:'create',model:[grantExpenseInstance:grantExpenseInstance])
			    		}
			    	}
				   }
					   else
			    	    {
			    		grantExpenseInstance = grantExpenseService.saveGrantExpense(grantExpenseInstance)
				
			    		if(grantExpenseInstance.isSaved)
			    		{
			    			flash.message = "${message(code: 'default.created.label')}"
			    			redirect(action:create,id:grantExpenseInstance.projects.id,params:[grantExpenseId:grantExpenseInstance.id])
			    		}
			    		else 
			    		{
			    			render(view:'create',model:[grantExpenseInstance:grantExpenseInstance,'currencyFormat':currencyFormatter,projectsInstance:projectsInstance])
			    		}
			    	} 
				   }
			    }
		    }
		}
    }
    
    def listExpenses = {
    		
    	
		def grantExpenseService = new GrantExpenseService()
		def grantAllocationService = new GrantAllocationService()
		GrailsHttpSession gh=getSession()
    	gh.putValue("projDashLink", "projectDash/"+params.id);
		gh.removeValue("Help")
       		//putting help pages in session
       	gh.putValue("Help","List_Grant_Expense.htm")
		def projectId
    	/* Get grant allocation details. */
    	if(params.id){
    		projectId = params.id}
    	else if(params.projects){
    		projectId = params.projects.id}
    		else{
    		redirect uri:'/invalidAccess.gsp'}
    	 def projectsInstance = Projects.get(new Integer(projectId))
    	 def dataSecurityService = new DataSecurityService()
		//checking  whether the user has access to the given projects
		if(dataSecurityService.checkForAuthorisedAcsessInProjects(projectsInstance.id,new Integer(getUserPartyID()))==0)
		{
			
					
					 redirect uri:'/invalidAccess.gsp'

		}
		else
		{
   	         projectsInstance.totAllAmount=grantAllocationService.getSumOfAmountAllocatedForProject(projectsInstance.id,getUserPartyID())
    	/* Get already allocated expenses */
    	def sdf = new SimpleDateFormat('dd/MM/yyyy')
		def sdf1 = new SimpleDateFormat('yyyy/MM/dd')
        def dateFrom = new Date()
    	def dateTo = new Date()
   		if(params.dateOfExpenseFrom)
    		dateFrom = sdf.parse(params.dateOfExpenseFrom_value)
    		
		if(params.dateOfExpenseTo)
    		dateTo = sdf.parse(params.dateOfExpenseTo_value)
    	def grantExpenseInstanceList = grantExpenseService.getGrantExpenseByProjectsAndExpenseDateRange(params.grantExpenseId,projectsInstance,dateFrom,dateTo)
    	def grantExpenseInstance = new GrantExpense()
   	  	grantExpenseInstance.projects = projectsInstance
    	grantExpenseInstance.dateFrom=dateFrom
    	grantExpenseInstance.dateTo=dateTo
        grantExpenseInstance.properties = params
        ConvertToIndainRS currencyFormatter=new ConvertToIndainRS();
   	         return['projectsInstance':projectsInstance,
   	       'grantExpenseInstance':grantExpenseInstance,
   	       'grantExpenseInstanceList':grantExpenseInstanceList,
   	       'currencyFormat':currencyFormatter]
		}
    }
    
    def listSummaryExpenses = {
    	def grantExpenseService = new GrantExpenseService()
		def grantAllocationService = new GrantAllocationService()
		GrailsHttpSession gh=getSession()
        gh.removeValue("Help")
       	//putting help pages in session
       	gh.putValue("Help","Grant_Expense_Summary.htm")
    	/* Get grant allocation details. */
    	def projectId
    	
    	if(params.id)
    		projectId = params.id
    	else if(params.projects)
    		projectId = params.projects.id
    	else
    		projectId = gh.getValue("ProjectID")
    	def projectsInstance = Projects.get(new Integer(projectId))
    	def dataSecurityService = new DataSecurityService()
		//checking  whether the user has access to the given projects
		if(dataSecurityService.checkForAuthorisedAcsessInProjects(projectsInstance.id,new Integer(getUserPartyID()))==0)
		{
			
					
					 redirect uri:'/invalidAccess.gsp'

		}
		else
		{
    	       projectsInstance.totAllAmount=grantAllocationService.getSumOfAmountAllocatedForProject(projectsInstance.id,getUserPartyID())
		
    	/* Get summary of expenses */
    	ConvertToIndainRS currencyFormatter=new ConvertToIndainRS();
    	def grantAllocationSplitService=new GrantAllocationSplitService()
    	def grantExpenseSummaryList = grantExpenseService.getGrantExpenseSummaryForAProject(projectsInstance) 
    	def accountHeadList = grantExpenseService.getAccountHeadListByProject(projectId)
    	def accHeadOfGSplit = []
    	for(int i=0;i<grantExpenseSummaryList.size();i++ )
    	{
    		def accountHead = AccountHeads.get(grantExpenseSummaryList[i].grantAllocationSplit.accountHead.id) 
			String accName = accountHead.name+ " | " +grantExpenseSummaryList[i].grantAllocationSplit.grantPeriod.name
			accHeadOfGSplit[i] = accName
		}
      	
        return ['projectsInstance':projectsInstance,
                'grantExpenseSummaryList':grantExpenseSummaryList,
                'currencyFormat':currencyFormatter,
                'accountHeadList':accountHeadList,
                'accHeadOfGSplit':accHeadOfGSplit]
    }
    }
    
    def clear = {
    		def grantExpenseService = new GrantExpenseService()
    		def grantAllocationService = new GrantAllocationService()
    		def grantAllocationSplitService=new GrantAllocationSplitService()

        	/* Get grant allocation details. */
        	def projectsInstance
        	if(params.projects.id){
        		projectsInstance = Projects.get(new Integer(params.projects.id))
        	//account head listing based on default grant period
        	def accountHeadList=grantAllocationSplitService.getAccountHeadByProject(projectsInstance.id)

        	  def dataSecurityService = new DataSecurityService()
    		//checking  whether the user has access to the given projects
    		if(dataSecurityService.checkForAuthorisedAcsessInProjects(projectsInstance.id,new Integer(getUserPartyID()))==0)
    		{
    					 redirect uri:'/invalidAccess.gsp'
    		}
    		else
    		{
            projectsInstance.totAllAmount=grantAllocationService.getSumOfAmountAllocatedForProject(projectsInstance.id,getUserPartyID())
    		def grantAllocationInstanceList=grantAllocationService.getGrantAllocationsByProject(params.projects.id)
        	 
        	/* Get already allocated expenses */
        	def sdf = new SimpleDateFormat('dd/MM/yyyy')
        	def sdf1 = new SimpleDateFormat('yyyy/MM/dd')
            def dateFrom = new Date()
        	def dateTo = new Date()
        	if(params.dateFrom_value){
        		dateFrom = sdf.parse(params.dateFrom_value)
        	}
        		
    		if(params.dateTo_value)
        		dateTo = sdf.parse(params.dateTo_value)
        	def grantExpenseInstanceList = grantExpenseService.getGrantExpenseByProjectsAndExpenseDateRange(params.grantExpenseId,projectsInstance,dateFrom,dateTo)
        	
        	/* Get summary of expenses */
        	def grantExpenseSummaryList = grantExpenseService.getGrantExpenseTotalForAProject(projectsInstance)
        		
            def grantExpenseInstance = new GrantExpense()
        	grantExpenseInstance.projects = projectsInstance
        	grantExpenseInstance.dateFrom = dateFrom
        	grantExpenseInstance.dateTo = dateTo
            grantExpenseInstance.properties = params
            NumberFormat formatter = new DecimalFormat("#0.00");
            ConvertToIndainRS currencyFormatter=new ConvertToIndainRS();
    		redirect(action:create,id:params.projects.id,'projectsInstance':projectsInstance,
    				'grantExpenseInstance':grantExpenseInstance,
                    'grantExpenseInstanceList':grantExpenseInstanceList,
                    'grantExpenseSummaryList':grantExpenseSummaryList,
                    'grantAllocationInstanceList':grantAllocationInstanceList,
                    'currencyFormat':currencyFormatter,'amount':formatter.format(grantExpenseInstance.expenseAmount),
                    'accountHeadList':accountHeadList)
    		}
        	}
        	else 
        	{    			
        			redirect uri:'/invalidAccess.gsp'}
           }
    def listHeadwiseExpenses = {
    		
    		GrailsHttpSession gh=getSession()
    		def projectId
        	projectId = gh.getValue("ProjectID")
        	def projectsInstance = Projects.get(new Integer(projectId))
    		def grantExpenseService = new GrantExpenseService()
    		def grantAllocationSplitList
    		if((params.name).equals(null) || (params.name).equals(''))
    		{
    			grantAllocationSplitList = grantExpenseService.getGrantAllocationSplitListByProjectId(projectId)
    		}
    		else
    		{
    			grantAllocationSplitList=grantExpenseService.getGrantAllocationSplitListByAccountHeadAndprojectId(params.name,projectId)
    		}
    		def grantExpenseSummaryList = grantExpenseService.getGrantExpenseSummaryListBygrantAllocationSplitList(grantAllocationSplitList)
    		//def grantExpenseSummaryList =[]
    		//def grantExpenseInstanceList = []
    		def accountHeadList = grantExpenseService.getAccountHeadListByProject(projectId)
    		def accHeadOfGSplit = []
    		for(int i=0;i<grantAllocationSplitList.size();i++ )
            {
    			
    			
    			def accountHead = AccountHeads.get(grantAllocationSplitList[i].accountHead.id) 
    			String accName = accountHead.name+ " | " +grantAllocationSplitList[i].grantPeriod.name
    			accHeadOfGSplit[i] = accName
    		  }
    		def grantAllocationService = new GrantAllocationService()
    		projectsInstance.totAllAmount=grantAllocationService.getSumOfAmountAllocatedForProject(projectsInstance.id,new Integer(getUserPartyID()))
    		ConvertToIndainRS currencyFormatter=new ConvertToIndainRS();
    		render(view:'listSummaryExpenses',model:['projectsInstance':projectsInstance,
                    'grantExpenseSummaryList':grantExpenseSummaryList,
                    'currencyFormat':currencyFormatter,
                    'accountHeadList':accountHeadList,
                    'accHeadOfGSplit':accHeadOfGSplit
                    ])
    		
    }
    def updateModeOfPayment=
    {
    		if(params.modeOfPayment)
    		{
    			render (template:"fieldSelect")
    		}
    		
    }
    
}
