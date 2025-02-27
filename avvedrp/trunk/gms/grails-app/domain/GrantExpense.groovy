class GrantExpense {
	
	static auditable=true
	Projects projects
	GrantAllocation grantAllocation
	GrantAllocationSplit grantAllocationSplit
	double expenseAmount
	String modeOfPayment
	String ddNo
	Date ddDate
	String bankName
	String ddBranch
	Date dateOfExpense
	String description
	String createdBy
	Date createdDate
	String modifiedBy
	Date modifiedDate
	
	double balanceAmount
	String expenseRequestCode
	String fundAdvanceCode
	char utilizationSubmitted
	
	static constraints={
		grantAllocation(nullable:true)
		grantAllocationSplit(nullable:true)
		expenseAmount(nullable:false)
		dateOfExpense(nullable:false)
		modifiedBy(nullable:true)
		modifiedDate(nullable:true)
		ddNo(nullable:true)
		expenseRequestCode(nullable:true)
		fundAdvanceCode(nullable:true)
		bankName(nullable:true)
		ddBranch(nullable:true)
		ddDate(nullable:true)
	}
	
	Date dateFrom
	Date dateTo
	boolean isSaved
	String accountHeadCode
	double currentBalance
	static transients = [ "balanceAmount","dateFrom","dateTo","isSaved","accountHeadCode","currentBalance" ]

}
