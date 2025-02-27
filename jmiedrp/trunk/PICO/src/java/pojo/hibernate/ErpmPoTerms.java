package pojo.hibernate;
// Generated May 30, 2013 2:31:14 PM by Hibernate Tools 3.2.1.GA



/**
 * ErpmPoTerms generated by hbm2java
 */
public class ErpmPoTerms  implements java.io.Serializable {


     private Integer potPotId;
     private ErpmPoMaster erpmPoMaster;
     private ErpmGenMaster erpmGenMaster;
     private String potTermsDescription;

    public ErpmPoTerms() {
    }

	
    public ErpmPoTerms(ErpmPoMaster erpmPoMaster, ErpmGenMaster erpmGenMaster) {
        this.erpmPoMaster = erpmPoMaster;
        this.erpmGenMaster = erpmGenMaster;
    }
    public ErpmPoTerms(ErpmPoMaster erpmPoMaster, ErpmGenMaster erpmGenMaster, String potTermsDescription) {
       this.erpmPoMaster = erpmPoMaster;
       this.erpmGenMaster = erpmGenMaster;
       this.potTermsDescription = potTermsDescription;
    }
   
    public Integer getPotPotId() {
        return this.potPotId;
    }
    
    public void setPotPotId(Integer potPotId) {
        this.potPotId = potPotId;
    }
    public ErpmPoMaster getErpmPoMaster() {
        return this.erpmPoMaster;
    }
    
    public void setErpmPoMaster(ErpmPoMaster erpmPoMaster) {
        this.erpmPoMaster = erpmPoMaster;
    }
    public ErpmGenMaster getErpmGenMaster() {
        return this.erpmGenMaster;
    }
    
    public void setErpmGenMaster(ErpmGenMaster erpmGenMaster) {
        this.erpmGenMaster = erpmGenMaster;
    }
    public String getPotTermsDescription() {
        return this.potTermsDescription;
    }
    
    public void setPotTermsDescription(String potTermsDescription) {
        this.potTermsDescription = potTermsDescription;
    }




}


