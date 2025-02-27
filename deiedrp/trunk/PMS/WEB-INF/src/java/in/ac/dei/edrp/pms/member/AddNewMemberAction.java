package in.ac.dei.edrp.pms.member;

import java.sql.*;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.apache.struts.action.Action;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

import in.ac.dei.edrp.pms.adminConfig.ReadPropertiesFile;
import in.ac.dei.edrp.pms.dataBaseConnection.MyDataSource;
import in.ac.dei.edrp.pms.myMail.SendingMail;
import in.ac.dei.edrp.pms.viewer.CodeGenerator;
import in.ac.dei.edrp.pms.viewer.PasswordGenerator;
import in.ac.dei.edrp.pms.viewer.checkRecord;

/** 
 * MyEclipse Struts
 * Creation date: 04-15-2010
 * 
 * XDoclet definition:
 * @struts.action path="/addnewmember" name="newmemberform" scope="request" validate="true"
 * @struts.action-forward name="addmembersuccess" path="page.addnewmember"
 * @struts.action-forward name="addmemberfail" path="page.orginfo"
 */
public class AddNewMemberAction extends Action {
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
		NewMemberForm newmemberform = (NewMemberForm) form;// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String valid_code="";
		String pass1="Please use your old password.";
		boolean bool=false;
		int recInUser_Info=0,recInUser_In_Org=0;
		Connection con=null;
		PreparedStatement ps=null,ps1=null,ps2=null,ps3=null;
		Savepoint svpt=null;
		String retstring="addmemberfail";
		request.setAttribute("message", "User could not be added ,because this user already exist in the system!!");
		try{
			con=MyDataSource.getConnection();
			con.setAutoCommit(false);
			//for checking email id of super admin or not
			if(!checkRecord.duplicacyChecker("login_user_id","login","authority","Super Admin").equalsIgnoreCase(newmemberform.getEmailid().trim()))
			{
			if(checkRecord.duplicacyChecker("User_ID","user_info","User_ID",newmemberform.getEmailid().trim())==null)
			{
				System.out.println("does not exist in user info.");
				
				ps=con.prepareStatement("insert into user_info " +
					"(User_ID,First_Name,Last_Name,Phone_No,Skills,Experince,Created_On,Updated_On) " +
					"values(?,?,?,?,?,?,CURDATE(),CURDATE())");
				ps.setString(1, newmemberform.getEmailid().trim());
				ps.setString(2, newmemberform.getFirstname());
				ps.setString(3, newmemberform.getLastname());
				ps.setString(4, newmemberform.getPhoneno());
				ps.setString(5, newmemberform.getSkill());
				ps.setInt(6, Integer.parseInt(newmemberform.getExperience()));
//				ps.setString(7, newmemberform.getSecurequestion());
//				ps.setString(8, newmemberform.getSecureanswer());
				ps.addBatch();
				
				svpt = con.setSavepoint("MySavepoint");
				recInUser_Info=ps.executeUpdate();
			}
			ActionErrors errors = new ActionErrors();
			ActionMessage error=null;
			if(((String)session.getAttribute("authority")).equalsIgnoreCase("User"))
			{
				request.setAttribute("message","This user already work in this portal and organisation.");
				if(checkRecord.twoFieldDuplicacyChecker("Valid_User_ID","user_in_org","valid_user_id",newmemberform.getEmailid().trim(),"Valid_OrgPortal",(String)session.getAttribute("validOrgInPortal"))==null)
				{
					System.out.println("user in user_in_org does not exist.");
				/*
				 * Inserting the record into user_in_org table.
				 */
				ps1=con.prepareStatement("insert into user_in_org values(?,?,?)");
				ps1.setString(1,newmemberform.getEmailid().trim());
				ps1.setString(2,(String)session.getAttribute("validOrgInPortal"));
				PreparedStatement pst=con.prepareStatement("select max(substr(Valid_Key,5)) from user_in_org where substr(Valid_Key,1,4)=Date_Format(Now(),'%Y')");
				ResultSet rst=pst.executeQuery();
				rst.next();
				String maxvalue=rst.getString(1);
				if(maxvalue!=null)
					{
						valid_code=CodeGenerator.gettingCode(Integer.parseInt(maxvalue)+1,6);
					}
					else
						valid_code=CodeGenerator.gettingCode(1,6);
				ps1.setString(3,valid_code);
				ps1.addBatch();
				recInUser_In_Org=ps1.executeUpdate();
				
//				if(recInUser_In_Org>0) /*if recInUser_In_Org is greater than zero it means insertion operation is successful.*/
//				{
					String role_id=checkRecord.twoFieldDuplicacyChecker("Role_ID","role","Role_Name",newmemberform.getRolename().trim(),"ValidOrgPortal",(String)session.getAttribute("validOrgInPortal"));				
					
					ps2=con.prepareStatement("insert into user_role_in_org values(?,?,?,?,?)");
					ps2.setString(1,valid_code);
					ps2.setInt(2,Integer.parseInt(role_id));
					ps2.setString(3,(String)session.getAttribute("uid"));
					ps2.setString(4,"Default");//which authority default/member.
					ps2.setString(5,"Active");//status active/inactive.
					ps2.addBatch();
					ps2.executeUpdate();
		
					if(checkRecord.duplicacyChecker("login_user_id","login","login_user_id",newmemberform.getEmailid().trim())==null)
						{
						ps3=con.prepareStatement("insert into login values(?,?,SHA1(?))");
						ps3.setString(1,newmemberform.getEmailid().trim());
						ps3.setString(2,"User");
						pass1=PasswordGenerator.generatePassword(3,5).toLowerCase();
						ps3.setString(3,pass1);
						ps3.addBatch();
						ps3.executeUpdate();
						}
					
						
					String url="http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
					Locale locale = new Locale("en", "US");
					ResourceBundle message = ResourceBundle.getBundle("in//ac//dei//edrp//pms//propertiesFile//ApplicationResources",locale);
					String s4=message.getString("body.text.mail") + " "+url+
							"\n"+message.getString("label.user")+": "+newmemberform.getEmailid().trim()+
							"\n"+message.getString("label.password")+": "+pass1+
							"\n "+message.getString("body.text.mail.note")+
							"\n "+message.getString("body.text.mail.thanks");
						bool=SendingMail.sendMail(s4,newmemberform.getEmailid().trim(),
								message.getString("mail.subject.newmember.addedby.instituteadmin"),
								ReadPropertiesFile.mailConfig(getServlet().getServletContext().getRealPath("/")+"WEB-INF/"));
//						System.out.println("body="+s4);
//						request.setAttribute("message",s4);
//					}
				}
			}
			con.commit();
			if(bool)
			{
				error = new ActionMessage("msg.addmember_in_orgportal.added");
				errors.add("membermsg",error);
				saveErrors(request,errors);
				retstring="addmembersuccess";
			}
			else if(recInUser_In_Org>0)
			{
				error = new ActionMessage("msg.addmember_in_orgportal.added1");
				errors.add("membermsg",error);
				saveErrors(request,errors);
				retstring="addmembersuccess";
			}
			
			else if(recInUser_Info>0)
			{
				error = new ActionMessage("msg.member.added");
				errors.add("membermsg",error);
				saveErrors(request,errors);
				retstring="addmembersuccess";
			}
		  }//outer if closed
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				con.rollback(svpt);
				con.commit();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}catch(Exception e1){
			System.out.println("Exception in add new member action="+e1);
			try {
			 con.rollback(svpt);
			 con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
		
		finally
		{			
			MyDataSource.freeConnection(con);
		}
		return mapping.findForward(retstring);
	}
}
