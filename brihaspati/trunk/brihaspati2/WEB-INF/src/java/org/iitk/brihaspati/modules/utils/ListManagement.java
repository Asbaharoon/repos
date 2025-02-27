package org.iitk.brihaspati.modules.utils;

/*
 * @(#)ListManagement.java	
 *
 *  Copyright (c) 2004-2008,2010-11,2012-13 ETRG,IIT Kanpur. 
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
 *  WHETHER IN CONTRACT, 
 *  RICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
 *  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
 *  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *  
 *  Contributors: Members of ETRG, I.I.T. Kanpur 
 */

import java.util.Vector;
import java.util.List;
import java.util.ArrayList;
import java.util.ListIterator;
import com.workingdogs.village.Record;
import com.workingdogs.village.Value;
import org.apache.turbine.util.parser.ParameterParser;
import org.apache.commons.lang.StringUtils;
import org.apache.torque.util.Criteria;
import org.iitk.brihaspati.modules.utils.CourseUserDetail;
import org.iitk.brihaspati.modules.utils.UserManagement;
import org.iitk.brihaspati.modules.utils.ErrorDumpUtil;
import org.iitk.brihaspati.modules.utils.TopicMetaDataXmlWriter;
import org.iitk.brihaspati.modules.utils.TopicMetaDataXmlReader;
import org.apache.turbine.services.security.torque.om.TurbineUser;
import org.apache.turbine.services.servlet.TurbineServlet;
import org.apache.turbine.services.security.torque.om.TurbineUserPeer;
import org.apache.turbine.services.security.torque.om.TurbineGroup;
import org.apache.turbine.services.security.torque.om.TurbineGroupPeer;
import org.iitk.brihaspati.om.CoursesPeer;
import org.iitk.brihaspati.om.Courses;
import org.iitk.brihaspati.om.StudentRollnoPeer;
import org.iitk.brihaspati.om.StudentRollno;
import org.iitk.brihaspati.om.TurbineUserGroupRolePeer;
import org.iitk.brihaspati.om.TurbineUserGroupRole;
import org.iitk.brihaspati.om.InstituteAdminUserPeer;
import java.io.FileOutputStream;
import java.io.File;
import org.apache.turbine.services.security.torque.om.TurbineUserPeer;
import org.apache.turbine.services.security.torque.om.TurbineUser;
import org.iitk.brihaspati.om.Department;
import org.iitk.brihaspati.om.DepartmentPeer;
import org.iitk.brihaspati.om.DeptSchoolUnivPeer;
import org.iitk.brihaspati.om.DeptSchoolUniv;
import org.iitk.brihaspati.om.SchoolPeer;
import org.iitk.brihaspati.om.TelephoneDirectoryPeer;
import org.iitk.brihaspati.om.TelephoneDirectory;
import org.iitk.brihaspati.om.ParentInfoPeer;
import org.iitk.brihaspati.om.ParentInfo;
import java.util.LinkedHashSet;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * This class contains methods for listing
 * @author <a href="mailto:sharad23nov@yahoo.com">Sharad Singh</a> 
 * @author <a href="mailto:singh_jaivir@rediffmail.com">Jaivir Singh</a> 
 * @author <a href="mailto:awadhk_t@yahoo.com">Awadhesh Kumar trivedi</a>
 * @author <a href="mailto:nksngh_p@yahoo.co.in">Nagendra Kumar Singh</a> 
 * @author <a href="mailto:richa.tandon1@gmail.com">Richa Tandon</a>
 * @author <a href="mailto:santoshkumarmiracle@gmail.com">Santosh Kumar</a>  
 * @author <a href="mailto:rpriyanka12@ymail.com">Priyanka Rawat</a> 
 * @modify date 14-10-2013
 * @author <a href="mailto:tejdgurung20@gmail.com">Tej Bahadur</a>  
 * @modified date:02-07-2011, 12-02-2013, 22-04-2013,31-05-2013
 */

public class ListManagement
{
      /**
       * List of all the registered courses
       * @see UserManagement in Utils
       * @return Vector
       */

	/* Method is called by in AdminViewAll.java to get all user in a institute.
	 * For this instituteid has to be sent.
	 *  changes made for View All User for Institute Admin(Institute Wise) 
	*/ 
	public static Vector getInstituteUserList(String Institute_Id)
	{
		Vector userDetails=new Vector();
		try{
			List user1=UserManagement.getUserDetail1("All",Institute_Id);
//	ErrorDumpUtil.ErrorLog("User in ListMgmt getInstituteUserList Method======>"+user1+"size of vector==>"+user1.size());
			if(user1.size()>0)
				userDetails=getDetails(user1,"User");
		}
		catch(Exception e)
		{}
		return userDetails;
	}
	public static Vector getUserList()
	{
		Vector userDetails=new Vector();
		try{
			List user=UserManagement.getUserDetail("All");
			userDetails=getDetails(user,"User");
			//ErrorDumpUtil.ErrorLog("Userlist in getUserList method in List Mgmt=====>"+userDetails);
		}
		catch(Exception e)
		{}
		return userDetails;
	}
      /**
       * Deatils of all the registered courses or Users
       * @param list List
       * @param type String
       * @param Istituteid String
       * @return Vector
       */
	public static Vector getInstituteUDetails(List list,String type,String Instituteid)
	{
		Vector Details=new Vector();
		Vector lnamelist=new Vector();
		try
		{
			/**
			 * Add the detail of institute wise user in a vector
			 * and put the same in context for use in template
			 */
			if((type.equals("User"))||(type.equals("UserIns")))
			{
				for(int i=0;i<list.size();i++)
                                {
                                	TurbineUser element=(TurbineUser)(list.get(i));
                                        String loginName=(element.getUserName()).toString();
                                        //ErrorDumpUtil.ErrorLog("Login name after search=="+loginName);
                                        int uid = UserUtil.getUID(loginName);
					Vector GrpList=new Vector();
					if((type.equals("User")))
						GrpList = UserGroupRoleUtil.getGID(uid,3);
					if((type.equals("UserIns")))
						GrpList = UserGroupRoleUtil.getGID(uid,2);
                                        //ErrorDumpUtil.ErrorLog("grplist return from util=="+GrpList);
                                        for(int j=0;j<GrpList.size();j++)
                                        {
						String gId=(String)(GrpList.elementAt(j));
                                                //ErrorDumpUtil.ErrorLog("grpid in util file=="+gId);
                                                String gname = GroupUtil.getGroupName(Integer.parseInt(gId));
                                                //ErrorDumpUtil.ErrorLog("grpname in util file=="+gname);
                                                String Instid = StringUtils.substringAfterLast(gname,"_");
                                                //ErrorDumpUtil.ErrorLog("instid after split in util file=="+Instid);
                                                if(Instid.equals(Instituteid)&&!lnamelist.contains(loginName))
                                                {
                                 	                String firstName=(element.getFirstName()).toString();
                                                        String lastName=(element.getLastName()).toString();
					                String email=null;
					                try{
						                   email=(element.getEmail()).toString();
						            }
							catch(Exception e1){}
                                                        String userName=firstName+" "+lastName;
                                                        CourseUserDetail cuDetail=new CourseUserDetail();
                                                        cuDetail.setLoginName(loginName);
                                                        cuDetail.setUserName(userName);
                                                        cuDetail.setEmail(email);
                                                        Details.add(cuDetail);
                                                        lnamelist.add(loginName);
                                                }
                              		}
                             	}
			}
			else if(type.equals("RollNo"))
			{
				for(int i=0;i<list.size();i++)
        	                {
	                                String rollno=((StudentRollno)list.get(i)).getRollNo();
					//ErrorDumpUtil.ErrorLog("rollno inside util=="+rollno);
	                                String loginname=((StudentRollno)list.get(i)).getEmailId();
	                                String Instid=((StudentRollno)list.get(i)).getInstituteId();
					if(Instid.equals(Instituteid) && !lnamelist.contains(loginname)){
		                                int uid = UserUtil.getUID(loginname);
	        	                        String fullname = UserUtil.getFullName(uid);
		                                CourseUserDetail cuDetail=new CourseUserDetail();
		                                cuDetail.setRollNo(rollno);
		                                cuDetail.setLoginName(loginname);
		                                cuDetail.setUserName(fullname);
		                                cuDetail.setEmail(loginname);
		                                Details.add(cuDetail);
					 	lnamelist.add(loginname);
					}
	                        }
			}
			else
			{
				for(int i=0;i<list.size();i++)
				{
				Courses element=(Courses)(list.get(i));
				String GName=(element.getGroupName()).toString();
				String courseName=(element.getCname()).toString();
				String gAlias=(element.getGroupAlias()).toString();
				String dept=(element.getDept()).toString();
				String description=(element.getDescription()).toString();
				byte active=element.getActive();
				String act=Byte.toString(active);
				String crDate=(element.getCreationdate()).toString();
				CourseUserDetail cuDetail=new CourseUserDetail();
				cuDetail.setGroupName(GName);
                                cuDetail.setCourseName(courseName);
                                cuDetail.setCAlias(gAlias);
                                cuDetail.setDept(dept);
                                cuDetail.setActive(act);
                                cuDetail.setDescription(description);
                                cuDetail.setCreateDate(crDate);
				Details.add(cuDetail);
				}
			}
		}
		catch(Exception ex)
		{
			/**
			* Replacing the value of String from property file.
			* @see MultilingualUtil in utils
	                */
			Details.add("The Error in Details"+ex);
		}
	return(Details);
	}
	/**
	* getDetails method for Super Admin	
	*/
	public static Vector getDetails(List list,String type)
	{
		Vector Details=new Vector();
		Criteria criteria = new Criteria();
		List v = null;
		int uid=0;
		try
		{
			/**
			 * Add the details of each detail in a vector
			 * and put the same in context for use in template
			 */
			if(type.equals("User"))
			{
				for(int i=0;i<list.size();i++)
				{
					TurbineUser element=(TurbineUser)(list.get(i));
					String loginName=(element.getUserName()).toString();
					String firstName=(element.getFirstName()).toString();
					String lastName=(element.getLastName()).toString();
					uid = UserUtil.getUID(loginName);
					String email=null;
	                                try{
		                                email=(element.getEmail()).toString();
	                                }
	                                catch(Exception e1){}
					String userName=firstName+" "+lastName;
					CourseUserDetail cuDetail=new CourseUserDetail();
					cuDetail.setLoginName(loginName);
					cuDetail.setUserName(userName);
					cuDetail.setEmail(email);
					 /* Get all role id of userid */

					Vector v_new=UserGroupRoleUtil.getRoleAllID(element.getUserId());
                                        int k=0;
                                        try {
                                                if((!v_new.contains(2)) && (!v_new.contains(4)) && (!v_new.contains(6)) && (!v_new.contains(7)) ){
                                                        k=1;
                                                }
                                        }catch(Exception e){}
                                        cuDetail.setStudsrid(k);
					/* Check whether parent details exist*/
                                        criteria.add(ParentInfoPeer.STUDENT_ID, uid);
                                        v=ParentInfoPeer.doSelect(criteria);
                                        if(v.size()>0)
                                        {
	                                        cuDetail.setParentFirstName("Exists");
                                        }
                                        else
                                        {
                                                cuDetail.setParentFirstName("NotExists");
                                        }

					Details.add(cuDetail);
				}
			}
			else if(type.equals("RollNo"))
               	        {
	                       Vector lnamelist= new Vector();
        	                for(int i=0;i<list.size();i++)
                	        {
	                                String rollno=((StudentRollno)list.get(i)).getRollNo();
	                                //ErrorDumpUtil.ErrorLog("rollno inside util=="+rollno);
        	                        String loginname=((StudentRollno)list.get(i)).getEmailId();
                	                if(!lnamelist.contains(loginname)){
	                                        uid = UserUtil.getUID(loginname);
	                                        String fullname = UserUtil.getFullName(uid);
						//ErrorDumpUtil.ErrorLog("fullname after search in util=="+fullname);
	                                        CourseUserDetail cuDetail=new CourseUserDetail();
	                                        cuDetail.setRollNo(rollno);
	                                        cuDetail.setLoginName(loginname);
	                                        cuDetail.setUserName(fullname);
						 /* Get all role id of userid */

						Vector v_new=UserGroupRoleUtil.getRoleAllID(uid);
                                        	int k=0;
                                        	try {
                                                	if((!v_new.contains(2)) && (!v_new.contains(4)) && (!v_new.contains(6)) && (!v_new.contains(7)) ){
                                                        	k=1;
                                                	}
                                       		}catch(Exception e){}
                                        	cuDetail.setStudsrid(k);						
						/* Check whether parent details exist*/
						criteria.add(ParentInfoPeer.STUDENT_ID, uid);
						v=ParentInfoPeer.doSelect(criteria);
						if(v.size()>0)
						{
							cuDetail.setParentFirstName("Exists");
						}
						else
						{
							cuDetail.setParentFirstName("NotExists");
						}
	                                        Details.add(cuDetail);
        	                        }
                	                 lnamelist.add(loginname);
	                        }
                        }
			else
			{
				for(int i=0;i<list.size();i++)
				{
					Courses element=(Courses)(list.get(i));
					String GName=(element.getGroupName()).toString();
					String courseName=(element.getCname()).toString();
					String gAlias=(element.getGroupAlias()).toString();
					String dept=(element.getDept()).toString();
					String description=(element.getDescription()).toString();
					byte active=element.getActive();
					String act=Byte.toString(active);
					String crDate=(element.getCreationdate()).toString();
					CourseUserDetail cuDetail=new CourseUserDetail();
					cuDetail.setGroupName(GName);
	                                cuDetail.setCourseName(courseName);
        	                        cuDetail.setCAlias(gAlias);
                	                cuDetail.setDept(dept);
                        	        cuDetail.setActive(act);
                                	cuDetail.setDescription(description);
	                                cuDetail.setCreateDate(crDate);
					Details.add(cuDetail);
				}
			}
		}
		catch(Exception ex)
		{
			/**
			* Replacing the value of String from property file.
			* @see MultilingualUtil in utils
	                */
			Details.add("The Error in Details"+ex);
		}	
	return(Details);
	}
	/*
	*This method for get course list institutewise.
	*parameter instituteId
	*@return List
	*/
	public static List getInstituteCourseList(String instituteId)
	{
		List v=null;
		List w=null;
		Vector vct=new Vector();
		try{
		/**
		*select all group name from TURBINE_GROUP table.
		*/	
		Criteria crit=new Criteria();
		crit.addGroupByColumn(org.iitk.brihaspati.om.TurbineGroupPeer.GROUP_NAME);
		v=org.iitk.brihaspati.om.TurbineGroupPeer.doSelect(crit);
		/**
		*get group name one by one.and store in a vector whose GName ends with InstituteId.
		*if Group Name not endswith InstituteId,then store "author" in that vector.
		*replace this vector in a List .
		*return List .
		*/
		for(int j=0;j<v.size();j++){
                	String GName=((org.iitk.brihaspati.om.TurbineGroup)v.get(j)).getGroupName();
				if(GName.endsWith(instituteId)){
					vct.add(GName);
				}
		}
		vct.add("author");
		w=vct;
		}
		catch(Exception e)
		{ErrorDumpUtil.ErrorLog("Exception in ListManagement getInstituteCourseList "+e);}
		return w;
	}
	/**
	*Method for get all course list.
	*@return List.
	*/
	public static List getCourseList()
        {
                List v=null;
                try{
		/**
		*select all group name from TURBINE_GROUP table.
		*@return List v.
		*/
                Criteria crit=new Criteria();
                //crit.addAscendingOrderByColumn(TurbineGroupPeer.GROUP_NAME);
                crit.addGroupByColumn(TurbineGroupPeer.GROUP_NAME);
                v=TurbineGroupPeer.doSelect(crit);
                }
                catch(Exception e)
                {
                }
                return v;

        }
	public static Vector getInstituteListBySearchString(String Type,String query,String searchString,String instituteId)
	{
		MultilingualUtil m_u=new MultilingualUtil();
		Vector Details=new Vector();
		Vector lnamelist=new Vector();
		try{
			Criteria crit=new Criteria();
			if(Type.equals("CourseWise"))
			{
				String str="GROUP_NAME";
                                if(query.equals("CourseId"))
                                        str="GROUP_NAME";
                                else if(query.equals("Course Name"))
                                        str="CNAME";
                                else if(query.equals("Dept"))
                                        str="DEPT";
                                /**
                                 * Checks for Matching Records
                                 */
				String table="COURSES";
				crit=new Criteria();
				crit.add(table,str,(Object)("%"+searchString+"%"),crit.LIKE);
                                List v=CoursesPeer.doSelect(crit);
				/*
				*Code for search course by string in particular Institute by Jaivir,Sharad
				*/
				for(int i=0;i<v.size();i++)
				{
                                	String GName=((Courses)v.get(i)).getGroupName();
                                	if(GName.endsWith(instituteId)){
                                		String courseName=((Courses)v.get(i)).getCname();
                                		String gAlias=((Courses)v.get(i)).getGroupAlias();
                                		String dept=((Courses)v.get(i)).getDept();
                                		String description=((Courses)v.get(i)).getDescription();
                                		byte active=((Courses)v.get(i)).getActive();
                                		String act=Byte.toString(active);
                                		String crDate=(((Courses)v.get(i)).getCreationdate()).toString();
						////////////////////////////////////add by Richa to get Instructor name.
						String nmeml=StringUtils.substringBeforeLast(GName,"_");
						String pieml=StringUtils.substringAfter(nmeml,gAlias);
                                        	String insname=UserUtil.getFullName(UserUtil.getUID(pieml));
                                		CourseUserDetail cuDetail=new CourseUserDetail();
						cuDetail.setEmail(pieml);
                                		cuDetail.setGroupName(GName);
						cuDetail.setInstName(InstituteIdUtil.getIstName(Integer.parseInt(instituteId)));
						cuDetail.setInstructorName(insname);
                                		cuDetail.setCourseName(courseName);
                                		cuDetail.setCAlias(gAlias);
                                		cuDetail.setDept(dept);
                                		cuDetail.setActive(act);
                                		cuDetail.setDescription(description);
                                		cuDetail.setCreateDate(crDate);
                               		 	Details.add(cuDetail);
					}
				}	
			}
			else
			{
				crit=new Criteria();
		                String str=null;
				if(query.equals("First Name"))
					str="FIRST_NAME";
				else if(query.equals("Last Name"))
				        str="LAST_NAME";
				else if(query.equals("User Name"))
					str="LOGIN_NAME";
				else if(query.equals("Email"))
					str="EMAIL";
				else if(query.equals("RollNo"))
					str="ROLL_NO";
				/**
				 * Checks for Matching Records
				 */
				if (query.equals("RollNo"))
				{
					crit = new Criteria();
					crit.add("STUDENT_ROLLNO",str,(Object)("%"+searchString+"%"),crit.LIKE);
                	                crit.addAscendingOrderByColumn(StudentRollnoPeer.ROLL_NO);
                        	        List v=StudentRollnoPeer.doSelect(crit);
					//ErrorDumpUtil.ErrorLog("list return from util==\n"+v);
					for(int i=0;i<v.size();i++)
					{
						String rollno=((StudentRollno)v.get(i)).getRollNo();
						String loginname=((StudentRollno)v.get(i)).getEmailId();
						String Instid=((StudentRollno)v.get(i)).getInstituteId();
						//ErrorDumpUtil.ErrorLog("login name list after adding=="+lnamelist);
						if(Instid.equals(instituteId) && !lnamelist.contains(loginname)){
							int uid = UserUtil.getUID(loginname);
							String fullname = UserUtil.getFullName(uid);
							CourseUserDetail cuDetail=new CourseUserDetail();
							cuDetail.setRollNo(rollno);
							cuDetail.setLoginName(loginname);
							cuDetail.setUserName(fullname);
							Details.add(cuDetail);	
							lnamelist.add(loginname);
						}
					}
				}
				/**
 				 * Code for search user institute wise done by Richa. 	
 				 * Get list of all user after search in a vector
 				 * get one user from vector and his uid,
 				 * from uid get list of groupid for that user
 				 * get one gid from list then its groupname from that id and from groupname get institute id.
 				 * match this institute id with given id, if match then add into vector and so on.  
 				 */ 	
				else
				{
					int noUid[]={0,1};
					String table="TURBINE_USER";
					crit.addNotIn(TurbineUserPeer.USER_ID,noUid);
					crit.add(table,str,(Object)("%"+searchString+"%"),crit.LIKE);
					List v=TurbineUserPeer.doSelect(crit);
					for(int i=0;i<v.size();i++)
		                        {
		                                TurbineUser element=(TurbineUser)(v.get(i));
	        	                        String loginName=(element.getUserName()).toString();
						//ErrorDumpUtil.ErrorLog("Login name after search=="+loginName);
						int uid = UserUtil.getUID(loginName);
						List GrpList=UserUtil.getAllGrpId(uid);
						//ErrorDumpUtil.ErrorLog("grplist return from util=="+GrpList);
						for(int j=0;j<GrpList.size();j++)
						{
							int gid = ((TurbineUserGroupRole)GrpList.get(j)).getGroupId();
							//ErrorDumpUtil.ErrorLog("grpid in util file=="+gid);
							String gname = GroupUtil.getGroupName(gid);
							//ErrorDumpUtil.ErrorLog("grpname in util file=="+gname);
							List InsAdmin=new ArrayList();
							String Instid="";
							if((gid==3)&&(GrpList.size()>1))
							{
								crit = new Criteria();
								crit.add(InstituteAdminUserPeer.ADMIN_UNAME,loginName);
								crit.and(InstituteAdminUserPeer.INSTITUTE_ID,instituteId);
								InsAdmin = InstituteAdminUserPeer.doSelect(crit);
								//ErrorDumpUtil.ErrorLog("InsAdmin return from mysql==="+InsAdmin);
							}
							else{
							Instid = StringUtils.substringAfterLast(gname,"_");
							//ErrorDumpUtil.ErrorLog("instid after split in util file=="+Instid);
							}
							if((Instid.equals(instituteId)&&!lnamelist.contains(loginName))||(InsAdmin.size()!=0))
							{
		        	        	                String firstName=(element.getFirstName()).toString();
				                                String lastName=(element.getLastName()).toString();
				                                String email=(element.getEmail()).toString();
				                                String userName=firstName+" "+lastName;
				                                CourseUserDetail cuDetail=new CourseUserDetail();
				                                cuDetail.setLoginName(loginName);
				                                cuDetail.setUserName(userName);
				                                cuDetail.setEmail(email);
				                                Details.add(cuDetail);
								lnamelist.add(loginName);
							}
						}
                		        }		
				}
			}
		}
		catch(Exception e)
		{
			String searchMsg="The error in find details !!"+e;
			Details.add(searchMsg);
			
		}
		//ErrorDumpUtil.ErrorLog("vector size after return=="+Details.size());
		return Details;
	}

	public static Vector getListBySearchString(String Type,String query,String searchString)
        {
                MultilingualUtil m_u=new MultilingualUtil();
                Vector Details=new Vector();
                try{
                        Criteria crit=new Criteria();
                        if(Type.equals("CourseWise"))
                        {
                                String str="GROUP_NAME";
                                if(query.equals("CourseId"))
                                        str="GROUP_NAME";
                                else if(query.equals("Course Name"))
                                        str="CNAME";
                                else if(query.equals("Dept"))
                                        str="DEPT";
                                /**
                                 * Checks for Matching Records
                                 */
                                String table="COURSES";
                                crit=new Criteria();
                                crit.add(table,str,(Object)("%"+searchString+"%"),crit.LIKE);
                                List v=CoursesPeer.doSelect(crit);
                                Details=getDetails(v,"Course");
				}
                        else
                        {
                                crit=new Criteria();
                                String str=null;
                                if(query.equals("First Name"))
                                        str="FIRST_NAME";
                                else if(query.equals("Last Name"))
                                        str="LAST_NAME";
                                else if(query.equals("User Name"))
                                        str="LOGIN_NAME";
                                else if(query.equals("Email"))
                                        str="EMAIL";
                                /**
                                 * Checks for Matching Records
                                 */
                                int noUid[]={0,1};
                                String table="TURBINE_USER";
                                crit.addNotIn(TurbineUserPeer.USER_ID,noUid);
                                crit.add(table,str,(Object)("%"+searchString+"%"),crit.LIKE);
                                List v=TurbineUserPeer.doSelect(crit);
                                Details=getDetails(v,"User");
                        }
                }
		catch(Exception e)
                {
                        String searchMsg="The error in find details !!"+e;
                        Details.add(searchMsg);

                }
                return Details;
        }

	/**
	 * Partion of List
	 * This shows the list containing records at a time,
	 * if there are more records than it will appear on next page.
	 * @param list Vector Complete list FOR divide
	 * @param startIndex int By default this is 0
	 * @param list_size int contains the value for dividing the list()
	 * @return Vector
	 */
	
	public static Vector listDivide(Vector list, int startIndex, int list_size)
	{
		Vector divideList=new Vector();
		MultilingualUtil m_u=new MultilingualUtil();
		try
		{
			int endIndex=startIndex+list_size;
			int check=(list.size()-startIndex);
			int i=0;
		
		 	/**
		  	* Divide List of any vector
		  	* Vector has whole details of topic
		  	*/

			if(check>=list_size)
			{
				for(i=startIndex;i<endIndex;i++)
				{
					divideList.add(list.get(i));
				}
	 		}
	 		else
			{
				for(i=startIndex;i<startIndex+check;i++)
				{
				divideList.add(list.get(i));
				}
			}
		}
		catch(Exception e)
		{
			String message="The error in list Dividing"+e;
			divideList.add(message);
		}
		return divideList;
	}
	/**
	 * This is common method which is used with the above methods.
	 * This is used for the links First, Next, Previous, Last, 
	 * these links are used to move from one page to another page
	 * here we are using an array of size 8
	 * value[0] is for startIndex, initial value of records:
	 * value[1] is for endIndex, last value of records:
	 * value[2] is for check_first, shows first page having first three records:
	 * value[3] is for check_pre, shows the previous page:
	 * value[4] is for check_last1, gives the remainder value:
	 * value[5] is for check_last, shows the last page:
	 * value[6] is for startIndex+1:
	 * value[7] is for total size-2:
	 * @param startIndex int
	 * @param size int
	 * @param list_size int contains the value for dividing the list
	 * @return int[]
	 */
	public static int[] linkVisibility(int startIndex, int size, int list_size)
	{
		int value[]=new int[7];
		int endIndex=startIndex+list_size;	 
		int check_first=0;
	
 		int check_pre=startIndex-list_size;
		int check_last1=size%list_size;
		int check_last=0;
	
		if(check_last1 == 0){
			check_last=size-list_size;
		}
		else{
			check_last=size-check_last1;
		}
		value[0]=startIndex;
		value[1]=endIndex;
		value[2]=check_first;
		value[3]=check_pre;
		value[4]=check_last1;
		value[5]=check_last;
		value[6]=startIndex+1;
		return value;
	}

	/**
         * Method for getting list of users who shared their content
         */ 
	public static Vector SharedUserList(String Path)
	{
		Vector userList=new Vector();
		Vector UsDetail = new Vector();
		List l = null;
                try
		{
			/**
 			 * Getting path where xml has to be created 
                         */ 
			String sharedPath=TurbineServlet.getRealPath("/SharedUserList");
	                File f=new File(sharedPath);
	                if(!f.exists())
	                       f.mkdirs();
	                File updatexml = null;
	                XmlWriter xmlwriter=null;
			TopicMetaDataXmlReader topicmetadata=null;
	                updatexml = new File(sharedPath+"/SharedUserList__des.xml");
	                Vector updatelist = new Vector();
			/**
 			 * Getting list of all users from database 	
 			 */ 	
                        int rid[]={1,5,6};
                        int uid[]={0,1};
                        Criteria crit=new Criteria();
                        crit.addJoin(TurbineUserPeer.USER_ID,TurbineUserGroupRolePeer.USER_ID);
                        crit.addNotIn(TurbineUserGroupRolePeer.ROLE_ID,rid);
                        crit.addNotIn(TurbineUserPeer.USER_ID,uid);
                        crit.addGroupByColumn(TurbineUserPeer.LOGIN_NAME);
                        l=TurbineUserPeer.doSelect(crit);
			/**
 			 * check if user has any content in shared area 
 			 */ 	
                        for(int k=0;k<l.size();k++)
                        {
                                TurbineUser element = (TurbineUser)l.get(k);
                                String Uname = element.getUserName();
                                //ErrorDumpUtil.ErrorLog("uname in shared dir ========="+Uname);
                                File ContentDir=new File(Path+"/"+Uname+"/Shared/");
                                if(ContentDir.exists())
                                {
                                        File shared=new File(ContentDir+"/Shared__des.xml");
                                        if(shared.exists())
                                        {
                                                TopicMetaDataXmlReader topicMeta=new TopicMetaDataXmlReader(ContentDir+"/"+"Shared__des.xml");
                                                String topicdc=topicMeta.getTopicDescription();
                                                Vector filedc=topicMeta.getFileDetails();
                                                if(filedc!=null)
                                                {
                                                        UsDetail.add(Uname);
                                                }
                                        }
                                 }
                	}
			/**
 			 * Write list of users in xml file who have content in shared area  
 			 */ 
			TopicMetaDataXmlWriter.updationRootOnly(updatexml.getAbsolutePath());
                        xmlwriter=new XmlWriter(sharedPath+"/SharedUserList__des.xml");
			for(int j=0;j<UsDetail.size();j++)
			{
				String UserName=(String)UsDetail.elementAt(j);
				TopicMetaDataXmlWriter.appendFileElement(xmlwriter,UserName,"","");
				xmlwriter.writeXmlFile();
			}

                }
                        catch(Exception e){ErrorDumpUtil.ErrorLog("The error in display Shared userlist "+e);}
			return UsDetail;
		}
	/**
	 *List of users in a course
	 */
	public static Vector getCourseUser(int userid,int gid)
	{
		Vector userList=new Vector();
		try
		{
		        Criteria crit =new Criteria();
                        crit.addJoin(TurbineUserPeer.USER_ID,TurbineUserGroupRolePeer.USER_ID);
                        crit.add(TurbineUserGroupRolePeer.ROLE_ID,3);
                        crit.and(TurbineUserGroupRolePeer.GROUP_ID,gid);
                        crit.setDistinct();
                        List v=TurbineUserPeer.doSelect(crit);
                        for(int i=0;i<v.size();i++)
                        {
                        	TurbineUser element=(TurbineUser)v.get(i);
                                String studentname=element.getUserName();
				if(!studentname.equals("guest"))
                                        userList.addElement(studentname);
                        }

		}
		catch(Exception e)
		{
			ErrorDumpUtil.ErrorLog("The error in display Shared userlist "+e); 
		}
		 return userList;
	}
		
	/**
         * This Method is used for getting Department List
	 * @parameter:String departmentId 
	 * @return: List (Department)
         */
	public static List getDepartmentList(String departmentId)
	{
	List deptlist = new ArrayList(); 
	try{
		Criteria crit=new Criteria();
		if(departmentId.equals(""))
		{
			crit.addGroupByColumn(DepartmentPeer.DEPARTMENT_ID);
               		deptlist=DepartmentPeer.doSelect(crit);
		}
		else
		{	
			int deptid=Integer.parseInt(departmentId);
               		crit.add(DepartmentPeer.DEPARTMENT_ID,deptid);
               		deptlist=DepartmentPeer.doSelect(crit);
		}
	}
	catch(Exception e)
	{
		ErrorDumpUtil.ErrorLog("The error in getting department list -- "+e); 
	}
	return deptlist;
	}

	/**
         * This Method is used for getting School List
         * @parameter:String SchoolId
         * @return: List (School)
         */

	public static List getSchoolList(String SchoolId)
	{
		List schoollist = new ArrayList(); 
        	try
		{
			Criteria crit=new Criteria();
			if(SchoolId.equals(""))
			{
                       		crit.addGroupByColumn(SchoolPeer.SCHOOL_ID);
			}
			else
			{
               			int schid=Integer.parseInt(SchoolId);
                		crit.add(SchoolPeer.SCHOOL_ID,schid);
			}
                        	schoollist = SchoolPeer.doSelect(crit);
		}
        	catch(Exception e)
		{
			ErrorDumpUtil.ErrorLog("The error in getting School list -- "+e); 
		}
                return schoollist;
        }

	/**
         * This Method is used for getting Mapped Department List
         * @parameter:String InstituteId
         * @return: List (All Mapped Department/School/University List)
         */

	public static List getDeptScoolUnivList(String InstituteId)
	{
		List dsulist=new ArrayList();
		String univid=InstituteId;
                try
		{
                	Criteria crit=new Criteria();
                	crit.addGroupByColumn(DeptSchoolUnivPeer.ID);
                	crit.add(DeptSchoolUnivPeer.UNIVERSITY_ID,univid);
                	dsulist=DeptSchoolUnivPeer.doSelect(crit);
		}
		catch(Exception e)
		{
			ErrorDumpUtil.ErrorLog("The error in getting department school university map list -- "+e); 
		}
                return dsulist;
	}

	/**
         * This Method is used for getting Mapped Department List
         * @parameter:String InstituteId
         * @return: List (All unique/soretd Mapped DepartmentList)
         */
	public static List getMapDeptList(String InstituteId) 
	{
		ArrayList mapdeptlist = new ArrayList();
               	try
		{
			List lsdsu=getDeptScoolUnivList(InstituteId);
			//Initialize Arraylist for getting sort department list
                       	for(int i=0;i<lsdsu.size();i++)
                       	{
                             	DeptSchoolUniv element=(DeptSchoolUniv)lsdsu.get(i);
                               	String deptid=element.getDeptId().toString();
				List deptlist=getDepartmentList(deptid);
                                //Add department list in Arraylist
                                mapdeptlist.addAll(deptlist);
			}
			// Get unique list and removing duplicate entry from list.
			mapdeptlist = new ArrayList(new LinkedHashSet(mapdeptlist));
			// Get sorted list using Collection method.
			Collections.sort(mapdeptlist);
                }
                catch(Exception ex)
                {
                       	ErrorDumpUtil.ErrorLog("Exception in getting mapped deaprtment list"+ex.getMessage());
                }	
                return mapdeptlist;
	}
	/**
        * This Method is used for getting Mapped department and school/center list along with institute
	* and mapped department list along wioth school/center.
        * @parameter:String InstituteId.
        * @parameter:String mode (mode is used for getting mapped school list using "school" parameter and mapped department list associated with school using "schooldept" parameter).
        * @return: List (All unique/soretd Mapped Department and school/center).
        */
	public static List getMapSchoolDeptList(String InstituteId,String mode)
        {
                ArrayList mapschlist = new ArrayList();
		Map map = new HashMap();
                try
                {
                	List lsdsu=getDeptScoolUnivList(InstituteId);
                        for(int i=0;i<=lsdsu.size();i++)
                        {
                        	DeptSchoolUniv element=(DeptSchoolUniv)lsdsu.get(i);
                                String schoolid=element.getSchoolId();
                                if(schoolid != null)
                                {	
					//if mode equals to "school" then getting map school list according to schoolid associated with institute.
					if(mode.equals("school"))
					{
                                        	List mapschool=getSchoolList(schoolid);
                                        	mapschlist.addAll(mapschool);
					}
					//if mode equals to "schooldept" then getting mapped department list associated with school/center.
					if(mode.equals("schooldept"))
					{
						String deptid=null;
						deptid=element.getDeptId().toString();
						if(deptid!=null)
						{
							try
							{
								//Get Department list using department id
                                				List deptlist=getDepartmentList(deptid);
								Department newelement=(Department)deptlist.get(0);
			                        		String Deptname=newelement.getName().toString();
								//set school id and department name in hash table alongwith keys for display in template
								map = new HashMap();
                                                		map.put("schid",schoolid );
                                                		map.put("deptname",Deptname);
								mapschlist.add(map);
							}
							catch(Exception ex) 
							{	
								ErrorDumpUtil.ErrorLog("Error in getting department list alongwith school/center--"+ex.getMessage());
							}
						}
					}
                                }
				// Get unique list and removing duplicate entry from list.
				mapschlist = new ArrayList(new LinkedHashSet(mapschlist));
			}
			// Get sorted list using Collection method.
			Collections.sort(mapschlist);
		}
                catch(Exception e)
                {
                	ErrorDumpUtil.ErrorLog("Exception in getting mapped school list"+e);
                }
		return mapschlist;
	}
	
}

