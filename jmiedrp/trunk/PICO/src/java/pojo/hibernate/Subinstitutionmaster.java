package pojo.hibernate;
// Generated May 30, 2013 2:31:14 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Subinstitutionmaster generated by hbm2java
 */
public class Subinstitutionmaster  implements java.io.Serializable {


     private Integer simId;
     private Statemaster statemaster;
     private Employeemaster employeemaster;
     private Countrymaster countrymaster;
     private Institutionmaster institutionmaster;
     private ErpmGenMaster erpmGenMaster;
     private String simName;
     private String simShortName;
     private String simAddressLine1;
     private String simAddressLine2;
     private String simDistrict;
     private String simPinNo;
     private String simEmailId;
     private String simHeadDesignation;
     private Set committeemasters = new HashSet(0);
     private Set erpmIssueReturnMasters = new HashSet(0);
     private Set fileMasters = new HashSet(0);
     private Set erpmIssueReceives = new HashSet(0);
     private Set erpmIndentMasters = new HashSet(0);
     private Set erpmPurchaseinvoiceMasters = new HashSet(0);
     private Set fileDetails = new HashSet(0);
     private Set workflowmasters = new HashSet(0);
     private Set budgetmasters = new HashSet(0);
     private Set departmentalBudgetAllocations = new HashSet(0);
     private Set erpmPurchasechallanMasters = new HashSet(0);
     private Set employeemasters = new HashSet(0);
     private Set supplierregistrationauthorities = new HashSet(0);
     private Set erpmIssueMastersForIsmToSubinstituteId = new HashSet(0);
     private Set erpmTenderSchedules = new HashSet(0);
     private Set erpmTenderMasters = new HashSet(0);
     private Set erpmPoMasters = new HashSet(0);
     private Set itemcategories = new HashSet(0);
     private Set erpmIssueMastersForIsmFromSubinstituteId = new HashSet(0);
     private Set erpmuserroles = new HashSet(0);
     private Set departmentmasters = new HashSet(0);
     private Set erpmStockReceiveds = new HashSet(0);
     private Set erpmTempOpeningStocks = new HashSet(0);
     private Set erpmTenderSubmissions = new HashSet(0);
     private Set erpmTenderRevisionses = new HashSet(0);

    public Subinstitutionmaster() {
    }

	
    public Subinstitutionmaster(Institutionmaster institutionmaster, String simName) {
        this.institutionmaster = institutionmaster;
        this.simName = simName;
    }
    public Subinstitutionmaster(Statemaster statemaster, Employeemaster employeemaster, Countrymaster countrymaster, Institutionmaster institutionmaster, ErpmGenMaster erpmGenMaster, String simName, String simShortName, String simAddressLine1, String simAddressLine2, String simDistrict, String simPinNo, String simEmailId, String simHeadDesignation, Set committeemasters, Set erpmIssueReturnMasters, Set fileMasters, Set erpmIssueReceives, Set erpmIndentMasters, Set erpmPurchaseinvoiceMasters, Set fileDetails, Set workflowmasters, Set budgetmasters, Set departmentalBudgetAllocations, Set erpmPurchasechallanMasters, Set employeemasters, Set supplierregistrationauthorities, Set erpmIssueMastersForIsmToSubinstituteId, Set erpmTenderSchedules, Set erpmTenderMasters, Set erpmPoMasters, Set itemcategories, Set erpmIssueMastersForIsmFromSubinstituteId, Set erpmuserroles, Set departmentmasters, Set erpmStockReceiveds, Set erpmTempOpeningStocks, Set erpmTenderSubmissions, Set erpmTenderRevisionses) {
       this.statemaster = statemaster;
       this.employeemaster = employeemaster;
       this.countrymaster = countrymaster;
       this.institutionmaster = institutionmaster;
       this.erpmGenMaster = erpmGenMaster;
       this.simName = simName;
       this.simShortName = simShortName;
       this.simAddressLine1 = simAddressLine1;
       this.simAddressLine2 = simAddressLine2;
       this.simDistrict = simDistrict;
       this.simPinNo = simPinNo;
       this.simEmailId = simEmailId;
       this.simHeadDesignation = simHeadDesignation;
       this.committeemasters = committeemasters;
       this.erpmIssueReturnMasters = erpmIssueReturnMasters;
       this.fileMasters = fileMasters;
       this.erpmIssueReceives = erpmIssueReceives;
       this.erpmIndentMasters = erpmIndentMasters;
       this.erpmPurchaseinvoiceMasters = erpmPurchaseinvoiceMasters;
       this.fileDetails = fileDetails;
       this.workflowmasters = workflowmasters;
       this.budgetmasters = budgetmasters;
       this.departmentalBudgetAllocations = departmentalBudgetAllocations;
       this.erpmPurchasechallanMasters = erpmPurchasechallanMasters;
       this.employeemasters = employeemasters;
       this.supplierregistrationauthorities = supplierregistrationauthorities;
       this.erpmIssueMastersForIsmToSubinstituteId = erpmIssueMastersForIsmToSubinstituteId;
       this.erpmTenderSchedules = erpmTenderSchedules;
       this.erpmTenderMasters = erpmTenderMasters;
       this.erpmPoMasters = erpmPoMasters;
       this.itemcategories = itemcategories;
       this.erpmIssueMastersForIsmFromSubinstituteId = erpmIssueMastersForIsmFromSubinstituteId;
       this.erpmuserroles = erpmuserroles;
       this.departmentmasters = departmentmasters;
       this.erpmStockReceiveds = erpmStockReceiveds;
       this.erpmTempOpeningStocks = erpmTempOpeningStocks;
       this.erpmTenderSubmissions = erpmTenderSubmissions;
       this.erpmTenderRevisionses = erpmTenderRevisionses;
    }
   
    public Integer getSimId() {
        return this.simId;
    }
    
    public void setSimId(Integer simId) {
        this.simId = simId;
    }
    public Statemaster getStatemaster() {
        return this.statemaster;
    }
    
    public void setStatemaster(Statemaster statemaster) {
        this.statemaster = statemaster;
    }
    public Employeemaster getEmployeemaster() {
        return this.employeemaster;
    }
    
    public void setEmployeemaster(Employeemaster employeemaster) {
        this.employeemaster = employeemaster;
    }
    public Countrymaster getCountrymaster() {
        return this.countrymaster;
    }
    
    public void setCountrymaster(Countrymaster countrymaster) {
        this.countrymaster = countrymaster;
    }
    public Institutionmaster getInstitutionmaster() {
        return this.institutionmaster;
    }
    
    public void setInstitutionmaster(Institutionmaster institutionmaster) {
        this.institutionmaster = institutionmaster;
    }
    public ErpmGenMaster getErpmGenMaster() {
        return this.erpmGenMaster;
    }
    
    public void setErpmGenMaster(ErpmGenMaster erpmGenMaster) {
        this.erpmGenMaster = erpmGenMaster;
    }
    public String getSimName() {
        return this.simName;
    }
    
    public void setSimName(String simName) {
        this.simName = simName;
    }
    public String getSimShortName() {
        return this.simShortName;
    }
    
    public void setSimShortName(String simShortName) {
        this.simShortName = simShortName;
    }
    public String getSimAddressLine1() {
        return this.simAddressLine1;
    }
    
    public void setSimAddressLine1(String simAddressLine1) {
        this.simAddressLine1 = simAddressLine1;
    }
    public String getSimAddressLine2() {
        return this.simAddressLine2;
    }
    
    public void setSimAddressLine2(String simAddressLine2) {
        this.simAddressLine2 = simAddressLine2;
    }
    public String getSimDistrict() {
        return this.simDistrict;
    }
    
    public void setSimDistrict(String simDistrict) {
        this.simDistrict = simDistrict;
    }
    public String getSimPinNo() {
        return this.simPinNo;
    }
    
    public void setSimPinNo(String simPinNo) {
        this.simPinNo = simPinNo;
    }
    public String getSimEmailId() {
        return this.simEmailId;
    }
    
    public void setSimEmailId(String simEmailId) {
        this.simEmailId = simEmailId;
    }
    public String getSimHeadDesignation() {
        return this.simHeadDesignation;
    }
    
    public void setSimHeadDesignation(String simHeadDesignation) {
        this.simHeadDesignation = simHeadDesignation;
    }
    public Set getCommitteemasters() {
        return this.committeemasters;
    }
    
    public void setCommitteemasters(Set committeemasters) {
        this.committeemasters = committeemasters;
    }
    public Set getErpmIssueReturnMasters() {
        return this.erpmIssueReturnMasters;
    }
    
    public void setErpmIssueReturnMasters(Set erpmIssueReturnMasters) {
        this.erpmIssueReturnMasters = erpmIssueReturnMasters;
    }
    public Set getFileMasters() {
        return this.fileMasters;
    }
    
    public void setFileMasters(Set fileMasters) {
        this.fileMasters = fileMasters;
    }
    public Set getErpmIssueReceives() {
        return this.erpmIssueReceives;
    }
    
    public void setErpmIssueReceives(Set erpmIssueReceives) {
        this.erpmIssueReceives = erpmIssueReceives;
    }
    public Set getErpmIndentMasters() {
        return this.erpmIndentMasters;
    }
    
    public void setErpmIndentMasters(Set erpmIndentMasters) {
        this.erpmIndentMasters = erpmIndentMasters;
    }
    public Set getErpmPurchaseinvoiceMasters() {
        return this.erpmPurchaseinvoiceMasters;
    }
    
    public void setErpmPurchaseinvoiceMasters(Set erpmPurchaseinvoiceMasters) {
        this.erpmPurchaseinvoiceMasters = erpmPurchaseinvoiceMasters;
    }
    public Set getFileDetails() {
        return this.fileDetails;
    }
    
    public void setFileDetails(Set fileDetails) {
        this.fileDetails = fileDetails;
    }
    public Set getWorkflowmasters() {
        return this.workflowmasters;
    }
    
    public void setWorkflowmasters(Set workflowmasters) {
        this.workflowmasters = workflowmasters;
    }
    public Set getBudgetmasters() {
        return this.budgetmasters;
    }
    
    public void setBudgetmasters(Set budgetmasters) {
        this.budgetmasters = budgetmasters;
    }
    public Set getDepartmentalBudgetAllocations() {
        return this.departmentalBudgetAllocations;
    }
    
    public void setDepartmentalBudgetAllocations(Set departmentalBudgetAllocations) {
        this.departmentalBudgetAllocations = departmentalBudgetAllocations;
    }
    public Set getErpmPurchasechallanMasters() {
        return this.erpmPurchasechallanMasters;
    }
    
    public void setErpmPurchasechallanMasters(Set erpmPurchasechallanMasters) {
        this.erpmPurchasechallanMasters = erpmPurchasechallanMasters;
    }
    public Set getEmployeemasters() {
        return this.employeemasters;
    }
    
    public void setEmployeemasters(Set employeemasters) {
        this.employeemasters = employeemasters;
    }
    public Set getSupplierregistrationauthorities() {
        return this.supplierregistrationauthorities;
    }
    
    public void setSupplierregistrationauthorities(Set supplierregistrationauthorities) {
        this.supplierregistrationauthorities = supplierregistrationauthorities;
    }
    public Set getErpmIssueMastersForIsmToSubinstituteId() {
        return this.erpmIssueMastersForIsmToSubinstituteId;
    }
    
    public void setErpmIssueMastersForIsmToSubinstituteId(Set erpmIssueMastersForIsmToSubinstituteId) {
        this.erpmIssueMastersForIsmToSubinstituteId = erpmIssueMastersForIsmToSubinstituteId;
    }
    public Set getErpmTenderSchedules() {
        return this.erpmTenderSchedules;
    }
    
    public void setErpmTenderSchedules(Set erpmTenderSchedules) {
        this.erpmTenderSchedules = erpmTenderSchedules;
    }
    public Set getErpmTenderMasters() {
        return this.erpmTenderMasters;
    }
    
    public void setErpmTenderMasters(Set erpmTenderMasters) {
        this.erpmTenderMasters = erpmTenderMasters;
    }
    public Set getErpmPoMasters() {
        return this.erpmPoMasters;
    }
    
    public void setErpmPoMasters(Set erpmPoMasters) {
        this.erpmPoMasters = erpmPoMasters;
    }
    public Set getItemcategories() {
        return this.itemcategories;
    }
    
    public void setItemcategories(Set itemcategories) {
        this.itemcategories = itemcategories;
    }
    public Set getErpmIssueMastersForIsmFromSubinstituteId() {
        return this.erpmIssueMastersForIsmFromSubinstituteId;
    }
    
    public void setErpmIssueMastersForIsmFromSubinstituteId(Set erpmIssueMastersForIsmFromSubinstituteId) {
        this.erpmIssueMastersForIsmFromSubinstituteId = erpmIssueMastersForIsmFromSubinstituteId;
    }
    public Set getErpmuserroles() {
        return this.erpmuserroles;
    }
    
    public void setErpmuserroles(Set erpmuserroles) {
        this.erpmuserroles = erpmuserroles;
    }
    public Set getDepartmentmasters() {
        return this.departmentmasters;
    }
    
    public void setDepartmentmasters(Set departmentmasters) {
        this.departmentmasters = departmentmasters;
    }
    public Set getErpmStockReceiveds() {
        return this.erpmStockReceiveds;
    }
    
    public void setErpmStockReceiveds(Set erpmStockReceiveds) {
        this.erpmStockReceiveds = erpmStockReceiveds;
    }
    public Set getErpmTempOpeningStocks() {
        return this.erpmTempOpeningStocks;
    }
    
    public void setErpmTempOpeningStocks(Set erpmTempOpeningStocks) {
        this.erpmTempOpeningStocks = erpmTempOpeningStocks;
    }
    public Set getErpmTenderSubmissions() {
        return this.erpmTenderSubmissions;
    }
    
    public void setErpmTenderSubmissions(Set erpmTenderSubmissions) {
        this.erpmTenderSubmissions = erpmTenderSubmissions;
    }
    public Set getErpmTenderRevisionses() {
        return this.erpmTenderRevisionses;
    }
    
    public void setErpmTenderRevisionses(Set erpmTenderRevisionses) {
        this.erpmTenderRevisionses = erpmTenderRevisionses;
    }




}


