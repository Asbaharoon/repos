package pojo.hibernate;
// Generated May 30, 2013 2:31:14 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Suppliermaster generated by hbm2java
 */
public class Suppliermaster  implements java.io.Serializable {


     private Integer smId;
     private ErpmGenMaster erpmGenMasterBySmOwnershipType;
     private ErpmGenMaster erpmGenMasterBySmSupplierType;
     private Institutionmaster institutionmaster;
     private String smName;
     private String smDealsWith;
     private Date smYearEstablishment;
     private String smPanNo;
     private String smTanNo;
     private String smStateStVatRgnNo;
     private String smCenStVatRgnNo;
     private String smEdRgnNo;
     private String smEccCode;
     private String smEntreprenureMemNo;
     private Date smRegDate;
     private String smRemarks;
     private String smCeoOrProprietorName;
     private Set erpmTempOpeningStocks = new HashSet(0);
     private Set erpmPurchaseinvoiceMasters = new HashSet(0);
     private Set erpmIssueMasters = new HashSet(0);
     private Set erpmItemRates = new HashSet(0);
     private Set erpmStockReceiveds = new HashSet(0);
     private Set erpmPoMasters = new HashSet(0);
     private Set supplierAddresses = new HashSet(0);

    public Suppliermaster() {
    }

	
    public Suppliermaster(Institutionmaster institutionmaster, String smName, Date smRegDate) {
        this.institutionmaster = institutionmaster;
        this.smName = smName;
        this.smRegDate = smRegDate;
    }
    public Suppliermaster(ErpmGenMaster erpmGenMasterBySmOwnershipType, ErpmGenMaster erpmGenMasterBySmSupplierType, Institutionmaster institutionmaster, String smName, String smDealsWith, Date smYearEstablishment, String smPanNo, String smTanNo, String smStateStVatRgnNo, String smCenStVatRgnNo, String smEdRgnNo, String smEccCode, String smEntreprenureMemNo, Date smRegDate, String smRemarks, String smCeoOrProprietorName, Set erpmTempOpeningStocks, Set erpmPurchaseinvoiceMasters, Set erpmIssueMasters, Set erpmItemRates, Set erpmStockReceiveds, Set erpmPoMasters, Set supplierAddresses) {
       this.erpmGenMasterBySmOwnershipType = erpmGenMasterBySmOwnershipType;
       this.erpmGenMasterBySmSupplierType = erpmGenMasterBySmSupplierType;
       this.institutionmaster = institutionmaster;
       this.smName = smName;
       this.smDealsWith = smDealsWith;
       this.smYearEstablishment = smYearEstablishment;
       this.smPanNo = smPanNo;
       this.smTanNo = smTanNo;
       this.smStateStVatRgnNo = smStateStVatRgnNo;
       this.smCenStVatRgnNo = smCenStVatRgnNo;
       this.smEdRgnNo = smEdRgnNo;
       this.smEccCode = smEccCode;
       this.smEntreprenureMemNo = smEntreprenureMemNo;
       this.smRegDate = smRegDate;
       this.smRemarks = smRemarks;
       this.smCeoOrProprietorName = smCeoOrProprietorName;
       this.erpmTempOpeningStocks = erpmTempOpeningStocks;
       this.erpmPurchaseinvoiceMasters = erpmPurchaseinvoiceMasters;
       this.erpmIssueMasters = erpmIssueMasters;
       this.erpmItemRates = erpmItemRates;
       this.erpmStockReceiveds = erpmStockReceiveds;
       this.erpmPoMasters = erpmPoMasters;
       this.supplierAddresses = supplierAddresses;
    }
   
    public Integer getSmId() {
        return this.smId;
    }
    
    public void setSmId(Integer smId) {
        this.smId = smId;
    }
    public ErpmGenMaster getErpmGenMasterBySmOwnershipType() {
        return this.erpmGenMasterBySmOwnershipType;
    }
    
    public void setErpmGenMasterBySmOwnershipType(ErpmGenMaster erpmGenMasterBySmOwnershipType) {
        this.erpmGenMasterBySmOwnershipType = erpmGenMasterBySmOwnershipType;
    }
    public ErpmGenMaster getErpmGenMasterBySmSupplierType() {
        return this.erpmGenMasterBySmSupplierType;
    }
    
    public void setErpmGenMasterBySmSupplierType(ErpmGenMaster erpmGenMasterBySmSupplierType) {
        this.erpmGenMasterBySmSupplierType = erpmGenMasterBySmSupplierType;
    }
    public Institutionmaster getInstitutionmaster() {
        return this.institutionmaster;
    }
    
    public void setInstitutionmaster(Institutionmaster institutionmaster) {
        this.institutionmaster = institutionmaster;
    }
    public String getSmName() {
        return this.smName;
    }
    
    public void setSmName(String smName) {
        this.smName = smName;
    }
    public String getSmDealsWith() {
        return this.smDealsWith;
    }
    
    public void setSmDealsWith(String smDealsWith) {
        this.smDealsWith = smDealsWith;
    }
    public Date getSmYearEstablishment() {
        return this.smYearEstablishment;
    }
    
    public void setSmYearEstablishment(Date smYearEstablishment) {
        this.smYearEstablishment = smYearEstablishment;
    }
    public String getSmPanNo() {
        return this.smPanNo;
    }
    
    public void setSmPanNo(String smPanNo) {
        this.smPanNo = smPanNo;
    }
    public String getSmTanNo() {
        return this.smTanNo;
    }
    
    public void setSmTanNo(String smTanNo) {
        this.smTanNo = smTanNo;
    }
    public String getSmStateStVatRgnNo() {
        return this.smStateStVatRgnNo;
    }
    
    public void setSmStateStVatRgnNo(String smStateStVatRgnNo) {
        this.smStateStVatRgnNo = smStateStVatRgnNo;
    }
    public String getSmCenStVatRgnNo() {
        return this.smCenStVatRgnNo;
    }
    
    public void setSmCenStVatRgnNo(String smCenStVatRgnNo) {
        this.smCenStVatRgnNo = smCenStVatRgnNo;
    }
    public String getSmEdRgnNo() {
        return this.smEdRgnNo;
    }
    
    public void setSmEdRgnNo(String smEdRgnNo) {
        this.smEdRgnNo = smEdRgnNo;
    }
    public String getSmEccCode() {
        return this.smEccCode;
    }
    
    public void setSmEccCode(String smEccCode) {
        this.smEccCode = smEccCode;
    }
    public String getSmEntreprenureMemNo() {
        return this.smEntreprenureMemNo;
    }
    
    public void setSmEntreprenureMemNo(String smEntreprenureMemNo) {
        this.smEntreprenureMemNo = smEntreprenureMemNo;
    }
    public Date getSmRegDate() {
        return this.smRegDate;
    }
    
    public void setSmRegDate(Date smRegDate) {
        this.smRegDate = smRegDate;
    }
    public String getSmRemarks() {
        return this.smRemarks;
    }
    
    public void setSmRemarks(String smRemarks) {
        this.smRemarks = smRemarks;
    }
    public String getSmCeoOrProprietorName() {
        return this.smCeoOrProprietorName;
    }
    
    public void setSmCeoOrProprietorName(String smCeoOrProprietorName) {
        this.smCeoOrProprietorName = smCeoOrProprietorName;
    }
    public Set getErpmTempOpeningStocks() {
        return this.erpmTempOpeningStocks;
    }
    
    public void setErpmTempOpeningStocks(Set erpmTempOpeningStocks) {
        this.erpmTempOpeningStocks = erpmTempOpeningStocks;
    }
    public Set getErpmPurchaseinvoiceMasters() {
        return this.erpmPurchaseinvoiceMasters;
    }
    
    public void setErpmPurchaseinvoiceMasters(Set erpmPurchaseinvoiceMasters) {
        this.erpmPurchaseinvoiceMasters = erpmPurchaseinvoiceMasters;
    }
    public Set getErpmIssueMasters() {
        return this.erpmIssueMasters;
    }
    
    public void setErpmIssueMasters(Set erpmIssueMasters) {
        this.erpmIssueMasters = erpmIssueMasters;
    }
    public Set getErpmItemRates() {
        return this.erpmItemRates;
    }
    
    public void setErpmItemRates(Set erpmItemRates) {
        this.erpmItemRates = erpmItemRates;
    }
    public Set getErpmStockReceiveds() {
        return this.erpmStockReceiveds;
    }
    
    public void setErpmStockReceiveds(Set erpmStockReceiveds) {
        this.erpmStockReceiveds = erpmStockReceiveds;
    }
    public Set getErpmPoMasters() {
        return this.erpmPoMasters;
    }
    
    public void setErpmPoMasters(Set erpmPoMasters) {
        this.erpmPoMasters = erpmPoMasters;
    }
    public Set getSupplierAddresses() {
        return this.supplierAddresses;
    }
    
    public void setSupplierAddresses(Set supplierAddresses) {
        this.supplierAddresses = supplierAddresses;
    }




}


