import java.text.SimpleDateFormat
import java.text.*;
import java.util.*;

class GrantExpenseService {
	
	/**
	 * Get grant expense by ID
	 */
	public GrantExpense getGrantExpenseById(Integer grantExpenseId){
		def grantExpenseInstance = GrantExpense.get( grantExpenseId )
		return grantExpenseInstance
	}
	
	/**
	 * Delete grant expense
	 */
	public Integer deleteGrantExpense(Integer grantExpenseId){
		Integer grantAllocationId = null
		def grantExpenseInstance = getGrantExpenseById( grantExpenseId )
		if(grantExpenseInstance) {
            grantExpenseInstance.delete()
           // grantAllocationId = grantExpenseInstance.grantAllocation.id
            grantAllocationId = 1;
		}
		else{
			grantAllocationId = -1
		}
		return grantAllocationId
	}
	
	/**
	 * Function to get grant expense by grant allocation and range of expense date.
	 */
	public GrantExpense[] getGrantExpenseByGrantAllocationAndExpenseDateRange(def grantAllocationInstance,def dateFrom,def dateTo){
		def grantExpenseInstanceList = GrantExpense.findAllByGrantAllocationAndDateOfExpenseBetween(grantAllocationInstance,dateFrom,dateTo)
		return grantExpenseInstanceList
	}
	
	
	/**
	 * Function to get grant expense by project and range of expense date.
	 */
	public GrantExpense[] getGrantExpenseByProjectsAndExpenseDateRange(def projectInstance,def dateFrom,def dateTo){
		def grantExpenseInstanceList = GrantExpense.findAllByProjectsAndDateOfExpenseBetween(projectInstance,dateFrom,dateTo)
		return grantExpenseInstanceList
	}
	
	/**
	 * Function to get grant expense by grant allocation and range of expense date.
	 */
	public GrantExpense[] getGrantExpenseByProjectsAndExpenseDateRange(def grantExpenseId,def projectInstance,def dateFrom,def dateTo){
		def grantExpenseInstanceList
		def sdf1 = new SimpleDateFormat('yyyy/MM/dd')
		if(grantExpenseId == null){
			String query = "from GrantExpense GE where GE.projects.id = "+projectInstance.id+" and DATE_FORMAT(GE.dateOfExpense,'%Y/%m/%d')  "+
				"between '"+sdf1.format(dateFrom)+"' and '"+sdf1.format(dateTo)+"'order by GE.dateOfExpense" 
			grantExpenseInstanceList = GrantExpense.findAll(query)
		}
		else{
			def grantExpense = getGrantExpenseById(new Integer(grantExpenseId))
			grantExpenseInstanceList = GrantExpense.findAllByProjectsAndDateOfExpense(projectInstance,grantExpense.dateOfExpense)
		}
		return grantExpenseInstanceList
	}
	
	
	/**
	 * Function to get grant expense by grant allocation and range of expense date.
	 */
	public GrantExpense[] getGrantExpenseByGrantAllocationAndExpenseDateRange(def grantExpenseId,def grantAllocationInstance,def dateFrom,def dateTo){
		def grantExpenseInstanceList
		def sdf1 = new SimpleDateFormat('yyyy/MM/dd')
		if(!grantExpenseId){
			String query = "from GrantExpense GE where GE.grantAllocation.id = "+grantAllocationInstance.id+" and GE.dateOfExpense  "+
				"between '"+sdf1.format(dateFrom)+"' and '"+sdf1.format(dateTo)+"' order by GE.dateOfExpense" 
			grantExpenseInstanceList = GrantExpense.findAll(query)
		}
		else{
			def grantExpense = getGrantExpenseById(new Integer(grantExpenseId))
			grantExpenseInstanceList = GrantExpense.findAllByGrantAllocationAndDateOfExpense(grantAllocationInstance,grantExpense.dateOfExpense)
		}
		return grantExpenseInstanceList
	}
	
	/**
	 * Function to get grant expense summary.
	 */
	public List getGrantExpenseSummary(grantAllocationInstance){
    	/* Get all heads allocated to grant */
    	
    	def grantExpenseSummaryList = new ArrayList()
    	def grantAllocationSplitInstanceList = GrantAllocationSplit.findAllByGrantAllocation(grantAllocationInstance)
    	
		for(int i=0;i<grantAllocationSplitInstanceList.size();i++){
    		GrantAllocationSplit grantAllocationSplitInstance = grantAllocationSplitInstanceList.get(i)
    		def sumAmount = GrantExpense.executeQuery("select sum(GE.expenseAmount) as SumAmt from GrantExpense GE where GE.grantAllocationSplit = ? ",[grantAllocationSplitInstance])
    		def balance = grantAllocationSplitInstance.amount
    		System.out.println(" Account head "+grantAllocationSplitInstance.accountHead.code+" SumAmount "+sumAmount[0])
    		if(sumAmount != null && sumAmount[0] != null)
    			balance = grantAllocationSplitInstance.amount-sumAmount[0]
    		System.out.println("Balance "+balance)
    		GrantExpense grantExpenseInstance = new GrantExpense()
    		grantExpenseInstance.grantAllocationSplit = grantAllocationSplitInstance
    		grantExpenseInstance.expenseAmount = grantAllocationSplitInstance.amount
    		grantExpenseInstance.balanceAmount = balance
    		   		
    		grantExpenseSummaryList.add(grantExpenseInstance)
    	}
    	return grantExpenseSummaryList
    	
    }

	
	/**
	 * Function to get grant expense summary.
	 */
	public List getGrantExpenseSummaryForAProject(projectInstance){
    	/* Get all heads allocated to grant */
    	
    	def grantExpenseSummaryList = new ArrayList()
    	def grantAllocationSplitInstanceList = GrantAllocationSplit.findAllByProjects(projectInstance)
    	
		for(int i=0;i<grantAllocationSplitInstanceList.size();i++){
    		GrantAllocationSplit grantAllocationSplitInstance = grantAllocationSplitInstanceList.get(i)
    		def sumAmount = GrantExpense.executeQuery("select sum(GE.expenseAmount) as SumAmt from GrantExpense GE where GE.grantAllocationSplit = ? ",[grantAllocationSplitInstance])
    		def balance = grantAllocationSplitInstance.amount
    		System.out.println(" Account head "+grantAllocationSplitInstance.accountHead.code+" SumAmount "+sumAmount[0])
    		if(sumAmount != null && sumAmount[0] != null)
    			balance = grantAllocationSplitInstance.amount-sumAmount[0]
    		System.out.println("Balance "+balance)
    		GrantExpense grantExpenseInstance = new GrantExpense()
    		grantExpenseInstance.grantAllocationSplit = grantAllocationSplitInstance
    		grantExpenseInstance.expenseAmount = grantAllocationSplitInstance.amount
    		grantExpenseInstance.balanceAmount = balance
    		   		
    		grantExpenseSummaryList.add(grantExpenseInstance)
    	}
    	return grantExpenseSummaryList
    	
    }
	/**
	 * Function to update grant expense
	 */
	public GrantExpense updateGrantExpense(def grantExpenseparams){
		def grantExpenseInstance = getGrantExpenseById(new Integer(grantExpenseparams.id))
        if(grantExpenseInstance) {
        	grantExpenseInstance.modifiedBy = "admin"
        	grantExpenseInstance.modifiedDate = new Date()
        	grantExpenseInstance.properties = grantExpenseparams
            if(!grantExpenseInstance.hasErrors() && grantExpenseInstance.save()) {
            	grantExpenseInstance.isSaved = true
            }
            else
            	grantExpenseInstance.isSaved = false
        }
		return grantExpenseInstance
	}
	
	/**
	 * Function to save grant expense
	 */
	public GrantExpense saveGrantExpense(def grantExpenseInstance){
		if(!grantExpenseInstance.hasErrors() && grantExpenseInstance.save()) {
			grantExpenseInstance.isSaved = true
		}
		else
			grantExpenseInstance.isSaved = false
			
		return grantExpenseInstance
	}
	
	/**
	 * Function to get grant expense summary.
	 */
	public List getGrantExpenseTotalForAProject(projectInstance){
    	/* Get all heads allocated to grant */
    	
		def grantExpenseInstance = null
    	def grantExpenseSummaryList = new ArrayList()
    	def expenseAmount = 0.0
    	def allocatedAmount = 0.0
    	def balanceAmount = 0.0
    	def amtAllocatedList = GrantAllocationSplit.executeQuery("select AH.id,AH.code,sum(GAS.amount) "+
    			"as AmtAllocated from GrantAllocationSplit GAS,AccountHeads AH "+ 
    			"where AH.id = GAS.accountHead.id and GAS.projects.id="+projectInstance.id+" group by GAS.accountHead order by AH.code")
    	
		for(int i=0;i<amtAllocatedList.size();i++){
			expenseAmount = 0.0
	    	allocatedAmount = 0.0
	    	balanceAmount = 0.0
	    	
			grantExpenseInstance = new GrantExpense()
			grantExpenseInstance.accountHeadCode = amtAllocatedList[i][1]
			if(amtAllocatedList[i][2] != null)
				allocatedAmount = amtAllocatedList[i][2]
			    		
    		def sumExpAmountList = GrantExpense.executeQuery("select sum(GE.expenseAmount) as SumAmt from "+
    				"GrantExpense GE where GE.projects.id="+projectInstance.id+" and  GE.grantAllocationSplit.accountHead.id = ? ",[amtAllocatedList[i][0]])
    		if(sumExpAmountList.size() > 0){
    			if(sumExpAmountList[0] != null)
    				expenseAmount = sumExpAmountList[0]
    		}
			balanceAmount = allocatedAmount - expenseAmount
    		
    		grantExpenseInstance.expenseAmount = expenseAmount
    		grantExpenseInstance.balanceAmount = balanceAmount
    		   		
    		grantExpenseSummaryList.add(grantExpenseInstance)
    	}
    	return grantExpenseSummaryList
    	
    }
	/**
	 * Function to check whether expense is entered against headwise allocation.
	 */
	public GrantExpense[] getExpenseForGrantAllocationSplit(def grantAllocationSplitInstance){
		
		def grantExpenseInstance=[]
		grantExpenseInstance = GrantExpense.findAll(" from GrantExpense GE where GE.grantAllocationSplit.id = " + grantAllocationSplitInstance.id)
		
	    return grantExpenseInstance    
		
	}	
	
	/**
	 * Function to get Account Head List 
	 */
	public List getAccountHeadListByProject(def projectId){
		def grantAllocationSplitList=GrantAllocationSplit.findAll("from GrantAllocationSplit GS where GS.projects.id="+projectId+" group by GS.accountHead.id")
    	def accountHeadList = []
    	
    	for(int i=0;i<grantAllocationSplitList.size();i++ )
        {
			accountHeadList[i] = grantAllocationSplitList[i].accountHead
			
        }
		return accountHeadList
	}
	/*
	 * Function to get GrantAllocationSplitList By Account Head Name And Project Id.
	 */
	public List getGrantAllocationSplitListByAccountHeadAndprojectId(def name,def projectId){
		
		def grantAllocationSplitList=GrantAllocationSplit.findAll("from GrantAllocationSplit GS where GS.accountHead.id="+name+ "and GS.projects.id="+projectId)
	
	return grantAllocationSplitList
	}
	/*
	 * Function to get GrantAllocationSplitList based on Project Id.
	 */
	public List getGrantAllocationSplitListByProjectId(def projectId){
		
		def grantAllocationSplitList=GrantAllocationSplit.findAll("from GrantAllocationSplit GS where GS.projects.id="+projectId)
	
	return grantAllocationSplitList
	}
	/*
	 * Function to Get grant expense summary list based on selected account head. 
	 */
	 
	 public List getGrantExpenseSummaryListBygrantAllocationSplitList(def grantAllocationSplitList){
		 def grantExpenseInstanceList = []
		 def grantExpenseSummaryList = []
		 for(int i=0;i<grantAllocationSplitList.size();i++ )
         {
 			grantExpenseInstanceList[i] = new GrantExpense()
 			def expList = GrantExpense.findAll("from GrantExpense GE where GE.grantAllocationSplit.id="+grantAllocationSplitList[i].id)
 			println "expList -->"+expList
 			double sumAmount = 0.0
 			for(int j=0;j<expList.size();j++)
 			{
 				println "expList[j].expenseAmount -->"+expList[j].expenseAmount
 				sumAmount = sumAmount+expList[j].expenseAmount
 			}
 			println "sumAmount -->"+sumAmount
         	
 			double balance
 			balance = grantAllocationSplitList[i].amount-sumAmount
 			println "balance -->"+balance
 		
 			
  			grantExpenseInstanceList[i].balanceAmount = balance
  			grantExpenseInstanceList[i].expenseAmount = grantAllocationSplitList[i].amount
  			
  			  		
 			grantExpenseSummaryList.add(grantExpenseInstanceList[i])
         }
		
		
		return grantExpenseSummaryList
		
		
		
	}
	
	 public List getAllocatedAmntHeadwise(def grantExpenseInstance)
	 {
		 def headAllcnAmnt=GrantAllocationSplit.executeQuery("select sum(GS.amount) from GrantAllocationSplit GS where GS.id="+grantExpenseInstance.grantAllocationSplitId)
		 return headAllcnAmnt
	 }
	 public List getExpAmntHeadwise(def grantExpenseInstance)
	 {
		 def headExpAmnt=GrantExpense.executeQuery("select sum(GE.expenseAmount) from GrantExpense GE where GE.grantAllocationSplit.id="+grantExpenseInstance.grantAllocationSplitId)
		 return headExpAmnt
	 }
	 /*
	 * Getting GrantExpense by Request Code
	 */
	 public getGrantExpenseByRequestCode(def RequestCode)
	 {
		 def grantExpenseInstanceList = GrantExpense.findAll("from GrantExpense GE where GE.expenseRequestCode ='"+RequestCode+"'")
		 return grantExpenseInstanceList
	 }
	 
	 public List getGrantExpenseAmountByRequestCode(def RequestCode)
	 {
		 def grantExpenseAmnt=GrantExpense.executeQuery("select sum(GE.expenseAmount) from GrantExpense GE where GE.expenseRequestCode ='"+RequestCode+"'")
	 	return grantExpenseAmnt
	 }
	 
	 public List getTotalExpenseAmnt(def grantExpenseInstance)
	 {
		 def expenseTotal = GrantExpense.executeQuery("select sum(GE.expenseAmount) from GrantExpense GE where GE.projects="+grantExpenseInstance.projects.id)
		 return expenseTotal
	 }
	 
	 /*
	  * Getting sum of GrantExpenses on account heads by project id
	  */
	 
	 public List accountHeadsExpenseTotalAmnt(def projectsId)
	 {
		 def accountHeadsExpenseTotal = GrantExpense.executeQuery("select sum(GE.expenseAmount) from GrantExpense GE where GE.projects.id="+projectsId)
		 return accountHeadsExpenseTotal
	 }
	 
	 /*
	  * Getting the Advance Fund List by grant allocation
	  */
	  
	  public List getAdvanceFundListByGrantAllocation(def grantAllocationInstanceList)
	 {
		 def advanceFundInstanceList = []
		 def formatter = new SimpleDateFormat("dd/MM/yy")
		 def numformatter = new DecimalFormat("#0.00")
		 for(grantAllocationInstance in grantAllocationInstanceList)
 		{
			 def advanceFundList = FundAdvance.findAll("from FundAdvance FA where FA.grantAllocation.id="+grantAllocationInstance.id)
			 for(fundAdvance in advanceFundList)
			 {
				String s = formatter.format(grantAllocationInstance.DateOfAllocation)
				fundAdvance.grntAlln = s+"-"+numformatter.format(grantAllocationInstance.amountAllocated)
				def fundAdvanceInstance = getBalanceAmount(fundAdvance)
				advanceFundInstanceList.add(fundAdvanceInstance)
			 }
 		}
		 return advanceFundInstanceList
	 }
	 
	 /*
	  * Getting Advance fund Balance against one fund Advance
	  */
	  public FundAdvance getBalanceAmount(def fundAdvanceInstance)
	 {
		def totalExpense = getTotalExpense(fundAdvanceInstance.fundAdvanceCode)
		if(fundAdvanceInstance.status == "Closed")
		{
		fundAdvanceInstance.balanceAmount = 0.00
		}
		else{
			fundAdvanceInstance.balanceAmount = (fundAdvanceInstance.advanceAmount-totalExpense)
		}
		return fundAdvanceInstance
	 }

	  /*
	  * Getting Total Expense against one fund Advance
	  */
	  public getTotalExpense(def fundAdvanceCode)
	 {
		def totalExpense = GrantExpense.executeQuery("select sum(GE.expenseAmount) from GrantExpense GE where GE.fundAdvanceCode='"+fundAdvanceCode+"'")
  		if(totalExpense[0] == null)
  		{
  			totalExpense[0] = 0.00
  		}
		return totalExpense[0]
	 }
	  
	  /*
	   * Getting Total Expense against one grant allocation split id
	   */
		  public getTotalExpenseForAnAccthd(def grantAllocationSplitInstance)
		 {
			  def totalExpenseForAnAccthd = GrantExpense.executeQuery("select sum(GE.expenseAmount) from GrantExpense GE where GE.grantAllocationSplit.id="+grantAllocationSplitInstance.id)
	  		if(totalExpenseForAnAccthd[0] == null)
	  		{
	  			totalExpenseForAnAccthd[0] = 0.00
	  		}
			return totalExpenseForAnAccthd[0]
		 }
		  
	 
	  /*
	  * Getting expense list against one fund Advance
	  */

	  public getExpenseListAgainstFundAdvance(def fundAdvanceInstance)
		 {
			def grantExpenseInstanceList = GrantExpense.findAll("from GrantExpense GE where GE.fundAdvanceCode='"+fundAdvanceInstance.fundAdvanceCode+"'")
	  		return grantExpenseInstanceList
		 }

	  /*
	  * Getting FundAdvanceInstance against one grantReceipt
	  */

	  public getFundAdvanceByCode(def grantExpenseInstance)
		 {
			def fundAdvanceInstance = FundAdvance.find("from FundAdvance FA where FA.fundAdvanceCode='"+grantExpenseInstance.fundAdvanceCode+"'")
	  		return fundAdvanceInstance
		 }
	  /*
		  * Getting FundAdvanceCode from grantExpense
		  */
	 public getGrantExpenseByAdvanseCode(def fundAdvanceInstance)
	  {
		  def advanceExpenseEntry = GrantExpense.find("from GrantExpense GE where GE.fundAdvanceCode='"+fundAdvanceInstance.fundAdvanceCode+"'")
		  return advanceExpenseEntry
	  }

	 /**
	 * Get sum of Expense for a grant Allocation 
	 */
	 public double getTotalExpenseByGrantAllocation(def grantAllocationInstance){
		 double totalExpense = 0.0
		 def sumAmt = GrantExpense.executeQuery("select sum(GE.expenseAmount) as total from GrantExpense GE where GE.grantAllocation.id= "+grantAllocationInstance.id+" group by GE.grantAllocation");
		 if(sumAmt[0]!=null)
			 totalExpense = new Double(sumAmt[0]).doubleValue()
		 return totalExpense
	}
	 
	 /**
	 * Get sum of Advance for a grant Allocation 
	 */
	 public double getTotalAdvanceByGrantAllocation(def grantAllocationInstance){
		 double totalAdvance = 0.0
		 def sumAmt = FundAdvance.executeQuery("select sum(FA.advanceAmount) as total from FundAdvance FA where  FA.grantAllocation.id= "+grantAllocationInstance.id+" group by FA.grantAllocation");
		 if(sumAmt[0]!=null)
			 totalAdvance = new Double(sumAmt[0]).doubleValue()
		 return totalAdvance
	}
	 
	 /**
	  *Method To list All GrantAllocation By project Id That Grant AllocationAlso in ExternalFundAllocation 
	 */
	 	public List getgrantAllocationByProjectIdInExternalFundAllocation(def params)
	 	{
	 		def grantAllocationInstanceInExternalFundList = GrantAllocation.findAll("from GrantAllocation GA where GA.projects.id='"+params.id+"' and GA.id IN (SELECT EF.grantAllocation.id from ExternalFundAllocation EF)")
		 	return grantAllocationInstanceInExternalFundList
	 	}
	 
	 	/**
	 	 * Method To sum of receivedAmount By GrantAllocation Id In External Fund
	 	 */
	 	public  getsumReceivedAmountByGrantAllotId(grantAllocationInstanceInExternalFundList)
	 	{
	 		def grantReceiptSumAmountInstance = GrantReceipt.executeQuery("select SUM(GR.amount)as total from GrantReceipt GR where GR.grantAllocation="+grantAllocationInstanceInExternalFundList+" group by GR.grantAllocation")
		 	return grantReceiptSumAmountInstance
	 	}
		
		 /**
		 * Get sum of Expense for a project
		 */
		 public double getTotalExpenseByProject(def projectId){
			 double totalExpense = 0.0
			 def totExpense = GrantExpense.executeQuery("select sum(GE.expenseAmount) as SumAmt from GrantExpense GE where GE.projects.id ="+projectId)
			 if(totExpense[0]!=null)
				 totalExpense = new Double(totExpense[0]).doubleValue()
			 return totalExpense
		}
		 
		 /**
		  * Get sum of Expense for a Grant Allocation Split
		  */
		  public double getTotalExpenseBySplit(def grantAllocationSplitId){
			  double totalExpense = 0.0
			  def totExpense = GrantExpense.executeQuery("select sum(GE.expenseAmount) as SumAmt from GrantExpense GE where GE.grantAllocationSplit.id ="+grantAllocationSplitId)
			  if(totExpense[0]!=null)
				  totalExpense = new Double(totExpense[0]).doubleValue()
			  return totalExpense
		 }
		  
		  /**
		   * Function to get total sub-project expense by parent project and range of expense date.
		   */
		  public getTotalSubProjectExpenseByParentProjectsAndExpenseDateRange(def utilizationInstance){
			  def sdf1 = new SimpleDateFormat('yyyy/MM/dd')
			  def totExp = GrantExpense.executeQuery("select sum(GE.expenseAmount) as SumAmt from GrantExpense GE where GE.projects.id = "+utilizationInstance.projects.id+" and DATE_FORMAT(GE.dateOfExpense,'%Y/%m/%d')  "+
					  "between '"+sdf1.format(utilizationInstance.startDate)+"' and '"+sdf1.format(utilizationInstance.endDate)+"'")
			 if(totExp[0] == null)
			 	totExp[0] = 0
			  return totExp[0]
		  }
		  
		  
		  /**
		   * Function to get total sub-project expense shown in submitted utilization by parent project and range of expense date.
		   */
		 public getTotalChildExpense(def projectInstance){
			 def subProjectInstanceList = []
			 def subProjectInstancesList = []
			 def childExpnseSum = 0
			 subProjectInstanceList = getSubProjectList(projectInstance,subProjectInstancesList)
			 for(subProjectInstance in subProjectInstanceList){
				 def childUtilizationInstance = Utilization.find("from Utilization U where U.projects.id="+subProjectInstance.id)
				 if(childUtilizationInstance){
					 def childSum = getTotalSubProjectExpenseByParentProjectsAndExpenseDateRange(childUtilizationInstance)
					 childExpnseSum = childExpnseSum + childSum
				 }
			 }
			 return childExpnseSum
		 }
		 
		 /**
		  * Recursive function to get all child projects upto n-th level
		  */
		 public List getSubProjectList(def projectInstance, def subProjectInstancesList){
			 def subInstanceList = Projects.findAll("from Projects  P where  P.parent.id="+projectInstance.id)
			 if(subInstanceList){
				 for(subProjectInstance in subInstanceList){
					 subProjectInstancesList.add(subProjectInstance)
					 getSubProjectList(subProjectInstance,subProjectInstancesList)
					 
				 }
			 }
			 return subProjectInstancesList
		 }
		 
		 
		 /**
		  * Function to get grant expense List by grant allocation and range of expense date.
		  */
		 public GrantExpense[] getGrantExpenseListByProjectsAndExpenseDateRange(def projectInstance,def dateFrom,def dateTo){
			 def grantExpenseInstanceList
			 def sdf1 = new SimpleDateFormat('yyyy/MM/dd')
			 
				 String query = "from GrantExpense GE where GE.projects.id = "+projectInstance.id+" and DATE_FORMAT(GE.dateOfExpense,'%Y/%m/%d')  "+
					 "between '"+sdf1.format(dateFrom)+"' and '"+sdf1.format(dateTo)+"'order by GE.dateOfExpense"
				 grantExpenseInstanceList = GrantExpense.findAll(query)
			 
			return grantExpenseInstanceList
		 }
		 
		 /**
		  * Function to save grant expense as utilization submitted
		  */
		 public setExpenseAsUtilizationSubmitted(def expenseInstanceList){
			if(expenseInstanceList){
			  for(grantExpenseInstance in expenseInstanceList){
				 grantExpenseInstance.utilizationSubmitted = 'Y'
				 grantExpenseInstance.save()
			  }
			}
		 }
		 
		 /**
		  * Function to save grant expense as utilization Not submitted
		  */
		 public setExpenseAsUtilizationNotSubmitted(def expenseInstanceList){
			if(expenseInstanceList){
			  for(grantExpenseInstance in expenseInstanceList){
				 grantExpenseInstance.utilizationSubmitted = 'N'
				 grantExpenseInstance.save()
			  }
			}
		 }
}



