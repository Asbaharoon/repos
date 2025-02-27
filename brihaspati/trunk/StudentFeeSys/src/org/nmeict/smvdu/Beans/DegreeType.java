package org.nmeict.smvdu.Beans;
// Generated Apr 7, 2013 9:52:58 PM by Hibernate Tools 3.2.1.GA


import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.component.UIData;
import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;

import org.nmeict.smvdu.Beans.SpringClassFile.DegreeTypeService;
import org.nmeict.smvdu.Beans.SpringClassFile.IDegreeType;
import org.nmeict.smvdu.HibernateHelper.OrgProfileSessionDetails;

/**
 * DegreeType generated by hbm2java
 * @author Shaista Bano
 */
@ManagedBean(name="orgDegreeType")
@RequestScoped
public class DegreeType  implements java.io.Serializable {


	private Integer seqNo;
    private OrgProfile orgProfile;
    private OrgDepartmentType orgDepartmentType;
    private String degreeName;
    private String degreeCreatorId;
    private String degreeModifierId;
    private Date degreeCreatedDateTime;
    private Date degreeModifierDateTime;
    private Set scholarshipTypesForDegreeType = new HashSet(0);
    private Set semesterMasters = new HashSet(0);
    private Set otherFeeHeadMasters = new HashSet(0);
    private Set courseGroupMasters = new HashSet(0);
    private Set branchMasters = new HashSet(0);
    private Set studentRegMasters = new HashSet(0);
    private Set modeOfPayments = new HashSet(0);
    private Set adminFeeAdminMasters = new HashSet(0);
    private Set scholarshipTypesForDegreeSeqNo = new HashSet(0);
    private Set examCodeSetUps = new HashSet(0);
    private Set studentMasters = new HashSet(0);
    private  int dCode;
    private static boolean flag = true; 
	     
     private Integer orgDegreeDpType;
     private String orgDepartmentName;
     private UIData dataGrid;
     private IDegreeType iDegreeType = new DegreeTypeService();
     private List<DegreeType> loadAllDegreeType;
     private SelectItem[] items;
     private String degCreaterId;
     private String degModifierId;
     private DegreeType degType;
   
     public DegreeType() {
     }

 	
     public DegreeType(String degreeName) {
         this.degreeName = degreeName;
     }
     public DegreeType(OrgProfile orgProfile, OrgDepartmentType orgDepartmentType, String degreeName, String degreeCreatorId, String degreeModifierId, Date degreeCreatedDateTime, Date degreeModifierDateTime, Set scholarshipTypesForDegreeType, Set semesterMasters, Set otherFeeHeadMasters, Set courseGroupMasters, Set branchMasters, Set studentRegMasters, Set modeOfPayments, Set studentMasters, Set adminFeeAdminMasters, Set scholarshipTypesForDegreeSeqNo, Set examCodeSetUps) {
        this.orgProfile = orgProfile;
        this.orgDepartmentType = orgDepartmentType;
        this.degreeName = degreeName;
        this.degreeCreatorId = degreeCreatorId;
        this.degreeModifierId = degreeModifierId;
        this.degreeCreatedDateTime = degreeCreatedDateTime;
        this.degreeModifierDateTime = degreeModifierDateTime;
        this.scholarshipTypesForDegreeType = scholarshipTypesForDegreeType;
        this.semesterMasters = semesterMasters;
        this.otherFeeHeadMasters = otherFeeHeadMasters;
        this.courseGroupMasters = courseGroupMasters;
        this.branchMasters = branchMasters;
        this.studentRegMasters = studentRegMasters;
        this.modeOfPayments = modeOfPayments;
        this.studentMasters = studentMasters;
        this.adminFeeAdminMasters = adminFeeAdminMasters;
        this.scholarshipTypesForDegreeSeqNo = scholarshipTypesForDegreeSeqNo;
        this.examCodeSetUps = examCodeSetUps;
     }
        public Set getSemesterMasters() {
		return semesterMasters;
	}


	public void setSemesterMasters(Set semesterMasters) {
		this.semesterMasters = semesterMasters;
	}


	public Integer getSeqNo() {
        return this.seqNo;
    }
    
    public void setSeqNo(Integer seqNo) {
        this.seqNo = seqNo;
    }
    public OrgDepartmentType getOrgDepartmentType() {
        return this.orgDepartmentType;
    }
    
    public void setOrgDepartmentType(OrgDepartmentType orgDepartmentType) {
        this.orgDepartmentType = orgDepartmentType;
    }
    public String getDegreeName() {
        return this.degreeName;
    }
    
    public void setDegreeName(String degreeName) {
        this.degreeName = degreeName;
    }
    public Date getDegreeCreatedDateTime() {
        return this.degreeCreatedDateTime;
    }
    
    public void setDegreeCreatedDateTime(Date degreeCreatedDateTime) {
        this.degreeCreatedDateTime = degreeCreatedDateTime;
    }
    public Date getDegreeModifierDateTime() {
        return this.degreeModifierDateTime;
    }
    
    public void setDegreeModifierDateTime(Date degreeModifierDateTime) {
        this.degreeModifierDateTime = degreeModifierDateTime;
    }
    public Set getScholarshipTypesForDegreeType() {
        return this.scholarshipTypesForDegreeType;
    }
    
    public void setScholarshipTypesForDegreeType(Set scholarshipTypesForDegreeType) {
        this.scholarshipTypesForDegreeType = scholarshipTypesForDegreeType;
    }
    public Set getCourseGroupMasters() {
        return this.courseGroupMasters;
    }
    
    public void setCourseGroupMasters(Set courseGroupMasters) {
        this.courseGroupMasters = courseGroupMasters;
    }
    public Set getBranchMasters() {
        return this.branchMasters;
    }
    
    public void setBranchMasters(Set branchMasters) {
        this.branchMasters = branchMasters;
    }
    public Set getModeOfPayments() {
        return this.modeOfPayments;
    }
    
    public void setModeOfPayments(Set modeOfPayments) {
        this.modeOfPayments = modeOfPayments;
    }
    public Set getAdminFeeAdminMasters() {
        return this.adminFeeAdminMasters;
    }
    
    public void setAdminFeeAdminMasters(Set adminFeeAdminMasters) {
        this.adminFeeAdminMasters = adminFeeAdminMasters;
    }
    public Set getStudentMasters() {
		return studentMasters;
	}


	public void setStudentMasters(Set studentMasters) {
		this.studentMasters = studentMasters;
	}


	public Set getScholarshipTypesForDegreeSeqNo() {
        return this.scholarshipTypesForDegreeSeqNo;
    }
    
    public void setScholarshipTypesForDegreeSeqNo(Set scholarshipTypesForDegreeSeqNo) {
        this.scholarshipTypesForDegreeSeqNo = scholarshipTypesForDegreeSeqNo;
    }
    public Set getExamCodeSetUps() {
        return this.examCodeSetUps;
    }
     
    public void setExamCodeSetUps(Set examCodeSetUps) {
        this.examCodeSetUps = examCodeSetUps;
    }

    public void degId()
    { 
    	FacesContext facesContext = FacesContext.getCurrentInstance();
    	HttpServletRequest response = (HttpServletRequest) facesContext.getExternalContext().getRequest();
    	int i = Integer.parseInt(response.getParameter("id"));
    	//System.out.println("Deg Id : "+i);
    	//int i = FacesContext.getCurrentInstance().getExternalContext().getResponse().
    }
    
    

	public Set getStudentRegMasters() {
		return studentRegMasters;
	}


	public void setStudentRegMasters(Set studentRegMasters) {
		this.studentRegMasters = studentRegMasters;
	}


	public Set getOtherFeeHeadMasters() {
		return otherFeeHeadMasters;
	}


	public void setOtherFeeHeadMasters(Set otherFeeHeadMasters) {
		this.otherFeeHeadMasters = otherFeeHeadMasters;
	}


	public Integer getOrgDegreeDpType() {
		return orgDegreeDpType;
	}


	public void setOrgDegreeDpType(Integer orgDegreeDpType) {
		this.orgDegreeDpType = orgDegreeDpType;
	}


	public String getOrgDepartmentName() {
		return orgDepartmentName;
	}


	public void setOrgDepartmentName(String orgDepartmentName) {
		this.orgDepartmentName = orgDepartmentName;
	}

	
	

	
	public boolean isFlag() {
		return flag;
	}


	public void setFlag(boolean flag) {
		this.flag = flag;
	}


	public OrgProfile getOrgProfile() {
		return orgProfile;
	}
	public void setOrgProfile(OrgProfile orgProfile) {
		this.orgProfile = orgProfile;
	}
	public String getDegreeCreatorId() {
		return degreeCreatorId;
	}
	public void setDegreeCreatorId(String degreeCreatorId) {
		this.degreeCreatorId = degreeCreatorId;
	}
	public String getDegreeModifierId() {
		return degreeModifierId;
	}
	public void setDegreeModifierId(String degreeModifierId) {
		this.degreeModifierId = degreeModifierId;
	}
	public UIData getDataGrid() {
		return dataGrid;
	}


	public void setDataGrid(UIData dataGrid) {
		this.dataGrid = dataGrid;
	}


	public IDegreeType getiDegreeType() {
		return iDegreeType;
	}


	public void setiDegreeType(IDegreeType iDegreeType) {
		this.iDegreeType = iDegreeType;
	}

	public void changeDegreeCode(ValueChangeEvent event)
	{
		flag = true;
		if((Object)event.getNewValue()!=null)
		{
		dCode = (Integer)event.getNewValue();
                //System.out.print("\n\n ifffffffffffdCode Degreetype clss==="+dCode);
		flag = false;
		}
		else
		{
			dCode=0;
                        //System.out.print("\n\n elseeeeeeeeee dCode Degreetype clss==="+dCode);
			flag = true;
		}
	}

	public List<DegreeType> getLoadAllDegreeType() {
                
		loadAllDegreeType = getiDegreeType().allDegreeType(dCode);
		dataGrid.setValue(loadAllDegreeType);
		return loadAllDegreeType;
	}


	public void setLoadAllDegreeType(List<DegreeType> loadAllDegreeType) {
		this.loadAllDegreeType = loadAllDegreeType;
	}


	public SelectItem[] getItems() {
		//System.out.println("Dt : "+dCode);
		List<DegreeType> sesionCode = getiDegreeType().allDegreeType(dCode);
		items = new SelectItem[sesionCode.size()];
		for(int i=0;i<sesionCode.size();i++)
		{
			DegreeType dt = sesionCode.get(i);
			SelectItem si = new SelectItem(dt.getSeqNo(),dt.getDegreeName());
			items[i] = si;
		}
		dCode = 0;
		return items;
	}


	public void setItems(SelectItem[] items) {
		this.items = items;
	}
    	
	public String getDegCreaterId() {
		return degCreaterId;
	}

	public void setDegCreaterId(String degCreaterId) {
		this.degCreaterId = degCreaterId;
	}


	public String getDegModifierId() {
		return degModifierId;
	}


	public void setDegModifierId(String degModifierId) {
		this.degModifierId = degModifierId;
	}
	
	public DegreeType getDegType() {
		//System.out.println("Id : Deg "+degType.getDegreeName()); 
		return degType;
	}


	public void setDegType(DegreeType degType) {
		this.degType = degType;
	}


    public String saveDegreeType()
    {
    	try
    	{
            List<DegreeType> dtList = (ArrayList<DegreeType>) dataGrid.getValue();
            for(DegreeType dt: dtList){
                
                if(dt.getDegreeName().equalsIgnoreCase(this.getDegreeName())){
                   FacesContext.getCurrentInstance().addMessage("", new FacesMessage(FacesMessage.SEVERITY_INFO, dt.getDegreeName()+" : Already exist", "" ));
                   return null;
                }
            }
            this.setDegreeName(this.getDegreeName().toUpperCase());
            OrgProfile op =  new OrgProfile();
            OrgDepartmentType odt = new OrgDepartmentType();
            odt.setOdtSeqNo(this.getOrgDegreeDpType());
            op.setOrgId(new OrgProfileSessionDetails().getOrgProfileSession().getOrgId());
            this.setOrgProfile(op);
            this.setOrgDepartmentType(odt);
            this.setDegreeCreatedDateTime(new Date());
            this.setDegreeCreatorId(new OrgProfileSessionDetails().getOrgProfileSession().getOrgAdminemailid());
            getiDegreeType().addDegreeType(this);
            //FacesContext.getCurrentInstance().addMessage("", new FacesMessage(FacesMessage.SEVERITY_INFO, ""+degreeName+" : Saved Successfully", ""));
             return  "DegreeType.xhtml?faces-redirect=true";
    	}
    	catch(Exception ex)
    	{
    		FacesContext.getCurrentInstance().addMessage("", new FacesMessage(FacesMessage.SEVERITY_ERROR, "Degree could not Updated"+ex, ""));
                return null;
    	}
    }

	@SuppressWarnings("unchecked")
	public void update()
	{
		try
		{
			List<DegreeType> dt = (ArrayList<DegreeType>) dataGrid.getValue();
			getiDegreeType().updateDegreeType(dt); 
			FacesContext.getCurrentInstance().addMessage("", new FacesMessage(FacesMessage.SEVERITY_INFO, "  Updated Successfully", ""));
		}
		catch(Exception ex)
		{
			FacesContext.getCurrentInstance().addMessage("", new FacesMessage(FacesMessage.SEVERITY_ERROR, ""+ex, ""));
		}
	}
     
        public String delete(DegreeType dtParam){
            try{
                List<DegreeType> dtList = (ArrayList<DegreeType>) dataGrid.getValue();
                for(DegreeType dt: dtList){
                    if(dt.getDegreeName().equalsIgnoreCase(dtParam.getDegreeName())){
                        boolean bl=getiDegreeType().deleteDegreeType(dt); 
                        break;
                    }
                }
                //FacesContext.getCurrentInstance().addMessage("", new FacesMessage(FacesMessage.SEVERITY_INFO, dt.getDegreeName()+" : Already exist", "" ));
                return  "DegreeType.xhtml?faces-redirect=true";
            }
            catch(Exception e){
                FacesContext.getCurrentInstance().addMessage("", new FacesMessage(FacesMessage.SEVERITY_INFO, " Given Department: could not Deleted", "" ));
                return null;
            }
               
        }
    
    


}


