package com.myapp.struts.hbm;
// Generated Oct 20, 2012 11:20:56 AM by Hibernate Tools 3.2.1.GA



/**
 * SerBiolioDetails generated by hbm2java
 */
public class SerBiolioDetails  implements java.io.Serializable {


     private SerBiolioDetailsId id;
     private String newSerialId;
     private Integer noOfCopies;
     private String issueNo;
     private String volumeNo;
     private String periodicity;
     private String issueYr;
     private String issueMonth;
     private String issueDetails;
     private String subject;
     private Integer unitPrice;
     private String currency;
     private String primaryBudget;
     private String requestedBy;
     private String requestedDate;
     private String vendor;
     private String status;

    public SerBiolioDetails() {
    }

	
    public SerBiolioDetails(SerBiolioDetailsId id, String newSerialId) {
        this.id = id;
        this.newSerialId = newSerialId;
    }
    public SerBiolioDetails(SerBiolioDetailsId id, String newSerialId, Integer noOfCopies, String issueNo, String volumeNo, String periodicity, String issueYr, String issueMonth, String issueDetails, String subject, Integer unitPrice, String currency, String primaryBudget, String requestedBy, String requestedDate, String vendor, String status) {
       this.id = id;
       this.newSerialId = newSerialId;
       this.noOfCopies = noOfCopies;
       this.issueNo = issueNo;
       this.volumeNo = volumeNo;
       this.periodicity = periodicity;
       this.issueYr = issueYr;
       this.issueMonth = issueMonth;
       this.issueDetails = issueDetails;
       this.subject = subject;
       this.unitPrice = unitPrice;
       this.currency = currency;
       this.primaryBudget = primaryBudget;
       this.requestedBy = requestedBy;
       this.requestedDate = requestedDate;
       this.vendor = vendor;
       this.status = status;
    }
   
    public SerBiolioDetailsId getId() {
        return this.id;
    }
    
    public void setId(SerBiolioDetailsId id) {
        this.id = id;
    }
    public String getNewSerialId() {
        return this.newSerialId;
    }
    
    public void setNewSerialId(String newSerialId) {
        this.newSerialId = newSerialId;
    }
    public Integer getNoOfCopies() {
        return this.noOfCopies;
    }
    
    public void setNoOfCopies(Integer noOfCopies) {
        this.noOfCopies = noOfCopies;
    }
    public String getIssueNo() {
        return this.issueNo;
    }
    
    public void setIssueNo(String issueNo) {
        this.issueNo = issueNo;
    }
    public String getVolumeNo() {
        return this.volumeNo;
    }
    
    public void setVolumeNo(String volumeNo) {
        this.volumeNo = volumeNo;
    }
    public String getPeriodicity() {
        return this.periodicity;
    }
    
    public void setPeriodicity(String periodicity) {
        this.periodicity = periodicity;
    }
    public String getIssueYr() {
        return this.issueYr;
    }
    
    public void setIssueYr(String issueYr) {
        this.issueYr = issueYr;
    }
    public String getIssueMonth() {
        return this.issueMonth;
    }
    
    public void setIssueMonth(String issueMonth) {
        this.issueMonth = issueMonth;
    }
    public String getIssueDetails() {
        return this.issueDetails;
    }
    
    public void setIssueDetails(String issueDetails) {
        this.issueDetails = issueDetails;
    }
    public String getSubject() {
        return this.subject;
    }
    
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public Integer getUnitPrice() {
        return this.unitPrice;
    }
    
    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }
    public String getCurrency() {
        return this.currency;
    }
    
    public void setCurrency(String currency) {
        this.currency = currency;
    }
    public String getPrimaryBudget() {
        return this.primaryBudget;
    }
    
    public void setPrimaryBudget(String primaryBudget) {
        this.primaryBudget = primaryBudget;
    }
    public String getRequestedBy() {
        return this.requestedBy;
    }
    
    public void setRequestedBy(String requestedBy) {
        this.requestedBy = requestedBy;
    }
    public String getRequestedDate() {
        return this.requestedDate;
    }
    
    public void setRequestedDate(String requestedDate) {
        this.requestedDate = requestedDate;
    }
    public String getVendor() {
        return this.vendor;
    }
    
    public void setVendor(String vendor) {
        this.vendor = vendor;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}


