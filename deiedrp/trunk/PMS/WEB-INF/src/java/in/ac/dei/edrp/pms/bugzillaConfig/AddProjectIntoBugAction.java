/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package in.ac.dei.edrp.pms.bugzillaConfig;

import in.ac.dei.edrp.pms.viewer.checkRecord;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/** 
 * MyEclipse Struts
 * Creation date: 30-Nov-2010
 * 
 * XDoclet definition:
 * @struts.action path="/addProjectIntoBugzilla" 
 */
public class AddProjectIntoBugAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ProjectConfigFormIntoBugzilla projectConfigFormIntoBugzilla = (ProjectConfigFormIntoBugzilla)form;
		String projectName = projectConfigFormIntoBugzilla.getProjectName();
		String projectVersion = projectConfigFormIntoBugzilla.getProjectVersion();
		System.out.println(projectName);
		System.out.println(projectVersion);
		ActionErrors errors = new ActionErrors();
		ActionMessage error = null;
		if (AddProjectInBugzilla.insertProduct(projectName,
				checkRecord.duplicacyChecker("description","project","Project_Name",projectName)) > 0){
			AddProjectInBugzilla.insertVersions(projectName,projectVersion);
			AddProjectInBugzilla.insertSeries_Categories(projectName);
			error = new ActionMessage("msg.project.added.bugzilla");
			errors.add("project_into_bugzilla_msg",error);
			saveErrors(request,errors);
			
		}
		else if(AddProjectInBugzilla.insertVersions(projectName,projectVersion)>0){
			
			error = new ActionMessage("msg.project.version.bugzilla");
			errors.add("project_into_bugzilla_msg",error);
			saveErrors(request,errors);
		}
		else{
			error = new ActionMessage("msg.project.notadded.bugzilla");
			errors.add("project_into_bugzilla_msg",error);
			saveErrors(request,errors);
		}
		
		return mapping.findForward("accountCreationPage");
	}
}