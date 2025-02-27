package pojo.hibernate;
// Generated May 30, 2013 2:31:14 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Workflowmaster generated by hbm2java
 */
public class Workflowmaster  implements java.io.Serializable {


     private Integer wfmId;
     private Departmentmaster departmentmaster;
     private Subinstitutionmaster subinstitutionmaster;
     private Institutionmaster institutionmaster;
     private ErpmGenMaster erpmGenMaster;
     private String wfmName;
     private Set erpmIndentMasters = new HashSet(0);
     private Set workflowtransactions = new HashSet(0);
     private Set workflowdetails = new HashSet(0);

    public Workflowmaster() {
    }

	
    public Workflowmaster(String wfmName) {
        this.wfmName = wfmName;
    }
    public Workflowmaster(Departmentmaster departmentmaster, Subinstitutionmaster subinstitutionmaster, Institutionmaster institutionmaster, ErpmGenMaster erpmGenMaster, String wfmName, Set erpmIndentMasters, Set workflowtransactions, Set workflowdetails) {
       this.departmentmaster = departmentmaster;
       this.subinstitutionmaster = subinstitutionmaster;
       this.institutionmaster = institutionmaster;
       this.erpmGenMaster = erpmGenMaster;
       this.wfmName = wfmName;
       this.erpmIndentMasters = erpmIndentMasters;
       this.workflowtransactions = workflowtransactions;
       this.workflowdetails = workflowdetails;
    }
   
    public Integer getWfmId() {
        return this.wfmId;
    }
    
    public void setWfmId(Integer wfmId) {
        this.wfmId = wfmId;
    }
    public Departmentmaster getDepartmentmaster() {
        return this.departmentmaster;
    }
    
    public void setDepartmentmaster(Departmentmaster departmentmaster) {
        this.departmentmaster = departmentmaster;
    }
    public Subinstitutionmaster getSubinstitutionmaster() {
        return this.subinstitutionmaster;
    }
    
    public void setSubinstitutionmaster(Subinstitutionmaster subinstitutionmaster) {
        this.subinstitutionmaster = subinstitutionmaster;
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
    public String getWfmName() {
        return this.wfmName;
    }
    
    public void setWfmName(String wfmName) {
        this.wfmName = wfmName;
    }
    public Set getErpmIndentMasters() {
        return this.erpmIndentMasters;
    }
    
    public void setErpmIndentMasters(Set erpmIndentMasters) {
        this.erpmIndentMasters = erpmIndentMasters;
    }
    public Set getWorkflowtransactions() {
        return this.workflowtransactions;
    }
    
    public void setWorkflowtransactions(Set workflowtransactions) {
        this.workflowtransactions = workflowtransactions;
    }
    public Set getWorkflowdetails() {
        return this.workflowdetails;
    }
    
    public void setWorkflowdetails(Set workflowdetails) {
        this.workflowdetails = workflowdetails;
    }




}


