package org.iitk.brihaspati.modules.actions;

/*
 * @(#)InstructorList_Action.java     
 *
 *  Copyright (c) 2005,2010 ETRG,IIT Kanpur. 
 *  All Rights Reserved.
 *
 *  Redistribution and use in source and binary forms, with or 
 *  without modification, are permitted provided that the following 
 *  conditions are met:
 * 
 *  Redistributions of source code must retain the above copyright  
 *  notice, this  list of conditions and the following disclaimer.
 * 
 *  Redistribution in binary form must reproducuce the above copyright 
 *  notice, this list of conditions and the following disclaimer in 
 *  the documentation and/or other materials provided with the 
 *  distribution.
 * 
 * 
 *  THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 *  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *  DISCLAIMED.  IN NO EVENT SHALL ETRG OR ITS CONTRIBUTORS BE LIABLE
 *  FOR ANY DIRECT, INDIRECT, INCIDENTAL,SPECIAL, EXEMPLARY, OR 
 *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 *  OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
 *  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 *  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
 *  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
 *  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


import java.io.File;
import java.util.List;
import java.util.Vector;
import org.apache.turbine.util.RunData;
import org.apache.velocity.context.Context;
import org.apache.turbine.om.security.User;
import java.util.StringTokenizer;
import org.apache.torque.util.Criteria;
import org.apache.turbine.util.parser.ParameterParser;
import org.iitk.brihaspati.modules.utils.UserUtil;
import org.iitk.brihaspati.modules.utils.GroupUtil;
import org.iitk.brihaspati.modules.utils.InstituteIdUtil;
import org.iitk.brihaspati.modules.utils.MultilingualUtil;
import org.iitk.brihaspati.modules.utils.ErrorDumpUtil;
import org.iitk.brihaspati.modules.actions.SecureAction;
import org.iitk.brihaspati.om.InstructorPermissionsPeer;
import org.iitk.brihaspati.om.InstructorPermissions;
import org.iitk.brihaspati.om.TurbineUserGroupRolePeer;
import org.iitk.brihaspati.modules.utils.MultilingualUtil;
import org.apache.turbine.services.security.torque.om.TurbineUserPeer;
import org.apache.turbine.services.security.torque.om.TurbineUser;
import org.apache.turbine.services.servlet.TurbineServlet;
import org.apache.turbine.services.security.TurbineSecurity;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * This class is responsible for removing secondary instructor and changing their permission to the system.
 * @author <a href="mailto:mail2sunil00@gmail.com">Sunil Yadav</a>
 */

public class InstructorList_Action extends SecureAction
{
	/**
 	 * Method for removing temporarily secondary instructor
 	 * @param data RunData instance
 	 * @param context Context instance
 	 */
	private String LangFile=null;
	private Log log = LogFactory.getLog(this.getClass());
	public void doRemoveUser(RunData data, Context context)
	{
		User user=data.getUser();
		ParameterParser pp=data.getParameters();
		String username="";
		String mid_delete = pp.getString("deleteFileNames","");
		String mode = pp.getString("mode","");
		String institudeName=data.getParameters().getString("institudeName","");
		String gName="";
		String msg="";
		
                if(institudeName.equals("ListAll")){
                        gName=data.getParameters().getString("cName","");
                        context.put("institudeName",institudeName);
			context.put("cName",gName);
                }else{
                        gName=(String)user.getTemp("course_id");
                }
		try{	
			if(!mid_delete.equals("")) {
				java.util.StringTokenizer st=new java.util.StringTokenizer(mid_delete,"^");
				for(int j=0;st.hasMoreTokens();j++)  {
					username=st.nextToken();
					String inst_id=(data.getUser().getTemp("Institute_id")).toString();
					int uid=UserUtil.getUID(username);
					int GID=GroupUtil.getGID(gName);
					Criteria crit=new Criteria();
					crit.add(TurbineUserGroupRolePeer.ROLE_ID,2);
					crit.add(TurbineUserGroupRolePeer.USER_ID,uid);
					crit.add(TurbineUserGroupRolePeer.GROUP_ID,GID);
					crit.add(InstructorPermissionsPeer.INSTITUTE_ID,inst_id);
					TurbineUserGroupRolePeer.doDelete(crit);
		     		}
				msg=MultilingualUtil.ConvertedString("brih_remsec",LangFile);
			}
			data.addMessage(msg);
			//Maintain Log
			 User user1 = TurbineSecurity.getUser(username);
                         String mailId=user1.getEmail();

			String loginName = user.getName();
			String strInstId =  (String)user.getTemp("Institute_id","");
                        String instName=InstituteIdUtil.getIstName(Integer.parseInt(strInstId));
                        log.info("Secondry Instructor removed by -->"+loginName+ " | Institute Name -->"+instName+ " | Instructor's Email --> "+mailId+ "| Course Name --> "+gName+ " | IP Address --> "+data.getRemoteAddr());

		}catch (Exception ex){ data.setMessage("Error in Removing Secondary Instructor !!  " +ex); }
		context.put("mode",mode);
	}

	/**
         * Method for changing secondary instructor permission
         */		

	public void doPermissionUser(RunData data, Context context)
	{
		User user=data.getUser();
		ParameterParser pp=data.getParameters();
		String username=pp.getString("username");
		int permission=Integer.parseInt(pp.getString("permission"));
		int uid=UserUtil.getUID(username);
		String inst_id=(data.getUser().getTemp("Institute_id")).toString();
		String institudeName=data.getParameters().getString("institudeName","");
                String gName="";
                if(institudeName.equals("ListAll")){
                        gName=data.getParameters().getString("cName","");
                        context.put("institudeName",institudeName);
                        context.put("cName",gName);
                }else{
                        gName=(String)user.getTemp("course_id");
                }
                int GID=GroupUtil.getGID(gName);
		try{
			Criteria crit=new Criteria();
			crit.add(InstructorPermissionsPeer.USER_ID,uid);
			crit.add(InstructorPermissionsPeer.INSTITUTE_ID,inst_id);
			List l=InstructorPermissionsPeer.doSelect(crit);
			if(l.size()>0) {
				for(int i=0;i<l.size();i++) {
					InstructorPermissions element=(InstructorPermissions)(l.get(i));
   					int id=element.getId();
                                	crit=new Criteria();
					crit.add(InstructorPermissionsPeer.ID,id);
					InstructorPermissionsPeer.doDelete(crit);
					//Maintain Log
                        		User user1 = TurbineSecurity.getUser(username);
                        		String mailId=user1.getEmail();
                        		String loginName = user.getName();
                        		String strInstId =  (String)user.getTemp("Institute_id","");
                        		String instName=InstituteIdUtil.getIstName(Integer.parseInt(strInstId));
                        		log.info("Grant of Instructor's Disable Permission by -->"+loginName+ " | Institute Name -->"+instName+ " | Instructor's Email --> "+mailId +"| Course Name --> "+gName+ " | IP Address --> "+data.getRemoteAddr());
			    	}
			 }else{
				crit=new Criteria();
				crit.add(InstructorPermissionsPeer.USER_ID,uid);
				crit.add(InstructorPermissionsPeer.GROUP_NAME,GID);
				crit.add(InstructorPermissionsPeer.INSTITUTE_ID,inst_id);
				crit.add(InstructorPermissionsPeer.PERMISSION_STATUS,permission);
				InstructorPermissionsPeer.doInsert(crit);
				ErrorDumpUtil.ErrorLog("Permission Disable");
				//Maintain Log
                        	User user1 = TurbineSecurity.getUser(username);
                        	String mailId=user1.getEmail();
                        	String loginName = user.getName();
                        	String strInstId =  (String)user.getTemp("Institute_id","");
                        	String instName=InstituteIdUtil.getIstName(Integer.parseInt(strInstId));
                        	log.info("Grant of Instructor's Enable Permission by -->"+loginName+ " | Institute Name -->"+instName+ " | Instructor's Email --> "+mailId +" | Course Name --> "+gName+ " | IP Address --> "+data.getRemoteAddr());

			}
			String msg=MultilingualUtil.ConvertedString("brih_secperm",LangFile);	
			data.addMessage(msg);

		}catch(Exception ex){data.setMessage("Error in Grant of Instructor's Permission !!  " +ex); }
	}			

	public void doPerform(RunData data,Context context) throws Exception
	{
		User user=data.getUser();
		LangFile=(String)data.getUser().getTemp("LangFile");
		String action=data.getParameters().getString("actionName","");
		 if(action.equals("eventSubmit_doRemoveUser")){
                        doRemoveUser(data,context);
		}else if(action.equals("eventSubmit_doPermissionUser")){
                        doPermissionUser(data,context);
		}else {
			String c_msg=MultilingualUtil.ConvertedString("c_msg",LangFile);
                        data.setMessage(c_msg);

		}
	}
}
		
