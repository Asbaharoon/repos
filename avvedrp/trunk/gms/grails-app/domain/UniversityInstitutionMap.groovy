class UniversityInstitutionMap {
	
	UniversityMaster universityMaster;
	Party party;
	char activeYesNo;
	String createdBy;
	Date createdDate;
	String modifiedBy;
	Date modifiedDate;
	static constraints ={
		createdBy(nullable:true)
	    createdDate(nullable:true)
		modifiedBy(nullable:true)
		modifiedDate(nullable:true)
		}

}
