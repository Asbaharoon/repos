package in.ac.dei.edrp.pms.updation;
/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

/** 
 * MyEclipse Struts
 * Creation date: 06-18-2009
 * 
 * XDoclet definition:
 * @struts.form name="editform"
 */
@SuppressWarnings("serial")
public class EditForm extends ValidatorForm {
	/*
	 * Generated fields
	 */
	private String maxActualEndDate_task=null;
	private String pcode;
	private String pname; //For holding project name
	private String oldprojectname; //For holding project name
	private String actualStartDate; //For holding actual start date of a project /	private String actualEndDate; //For holding actual end date of a project
	private String actualEndDate;
	private String tbudget; //For holding target budget of a project
	private String priority="Low"; //For holding priority of a project
	private String status="--Select--"; //For holding the status of a project
	private String gcolor; //For holding gantt chart color of a project
	private String darea; //For holding description about the project
	
	/*
	 * Generated Methods
	 */
	

/** 
* Method reset
* @param mapping
* @param request
*/
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		
	}

public String getMaxActualEndDate_task() {
	return maxActualEndDate_task;
}

public void setMaxActualEndDate_task(String maxActualEndDate_task) {
	this.maxActualEndDate_task = maxActualEndDate_task;
}

public String getOldprojectname() {
	return oldprojectname;
}

public void setOldprojectname(String oldprojectname) {
	this.oldprojectname = oldprojectname;
}

public String getActualEndDate() {
	return actualEndDate;
}

public void setActualEndDate(String actualEndDate) {
	this.actualEndDate = actualEndDate;
}

	/*The method getPname return the project name of a project */
	public String getPname() {
		return pname;
	}
/*The method setPname is used for setting the project name of a project */
	public void setPname(String pname) {
		this.pname = pname;
	}


/*The method getTbudget return the target budget of a project */
	public String getTbudget() {
		return tbudget;
	}
/*The method setTbudget is used for setting the target budget of a project */
	public void setTbudget(String tbudget) {
		this.tbudget = tbudget;
	}

/*The method getPriority return the priority of a project */
	public String getPriority() {
		return priority;
	}
	
/*The method setPriority is used for setting the priority of a project */	
	public void setPriority(String priority) {
		this.priority = priority;
	}

/*The method getStatus return the status of a project */
	public String getStatus() {
		return status;
	}

/*The method setStatus is used for setting the status of a project */
	public void setStatus(String status) {
		this.status = status;
	}
	

	
/*The method getGcolor return the gantt chart color of a project */
	public String getGcolor() {
		return gcolor;
	}
	
/*The method setGcolor is used for setting the gantt chart color of a project */
	public void setGcolor(String gcolor) {
		this.gcolor = gcolor;
	}
	
/*The method getDarea return the description about the project */
	public String getDarea() {
		return darea;
	}
	
/*The method setDarea is used for setting the description about the project */
	public void setDarea(String darea) {
		this.darea = darea;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	public String getActualStartDate() {
		return actualStartDate;
	}
	public void setActualStartDate(String actualStartDate) {
		this.actualStartDate = actualStartDate;
	}
}