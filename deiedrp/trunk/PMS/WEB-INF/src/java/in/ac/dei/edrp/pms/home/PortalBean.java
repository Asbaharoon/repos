/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package in.ac.dei.edrp.pms.home;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

/** 
 * MyEclipse Struts
 * Creation date: 04-12-2010
 * 
 * XDoclet definition:
 * @struts.form name="portalnameform"
 */
public class PortalBean extends ValidatorForm {
	/*
	 * Generated fields
	 */

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** portalname property */
	private String portalname;
	private String orgname;
	private String rolename;
	/*
	 * Generated Methods
	 */

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
//	public ActionErrors validate(ActionMapping mapping,
//			HttpServletRequest request) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	/** 
	 * Returns the portalname.
	 * @return String
	 */
	public String getPortalname() {
		return portalname;
	}

	/** 
	 * Set the portalname.
	 * @param portalname The portalname to set
	 */
	public void setPortalname(String portalname) {
		this.portalname = portalname;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
}