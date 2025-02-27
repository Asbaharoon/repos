
package com.erp.nfes;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Locale;

public class RecordTypeSettingServlet extends HttpServlet{

	public void service (HttpServletRequest request, HttpServletResponse response) throws IOException{

			String language=(String) request.getSession().getAttribute("language");
			response.setContentType("text/html; charset=UTF-8");
			Locale locale = new Locale(language, "");
			MultiLanguageString ml=new MultiLanguageString();
			ml.init("RecordTypeSettingServlet.java", language);
			
			String action="";
			action=request.getParameter("action");
			PrintWriter out = response.getWriter();

			out.println("<HTML><HEAD><TITLE>Search</TITLE>");
	  	    out.println("<link href=\"./css/oiostyles.css\" rel=\"stylesheet\" type=\"text/css\"/>");
	  	    out.println("<script type=\"text/javascript\" src=\"./js/search.js\" ></script>");
	  	    out.println("<script>'"+action+"'</script>");
	  	    out.println("</HEAD><BODY class=\"bodystyle\">");
			out.println("<form name=\"RecordAccessSettings\" method=\"post\" action=\"RecordTypeSettingServlet\">");

			 initPage(request,response,ml);
			 if(action.equals("initPage")){
				 	out.print(ml.getValue("loading_status"));
				 	out.print("<br/>");
				 	out.println("<Script>showRecords();</script>");
				}
			 else if(action.equals("showRecords")){
				try {
					showRecords(request,response,ml);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}else if(action.equals("update_records")){
				String doc_ids=request.getParameter("updated_document_ids");
				//out.println(doc_ids);
				if (doc_ids.equals("null")==false){
					try {
						updateRecords(doc_ids,request,response,ml,out);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			out.println("</div></form></BODY></HTML>");
	}


	private void initPage(HttpServletRequest request, HttpServletResponse response,MultiLanguageString ml) throws IOException{
		PrintWriter out = response.getWriter();
		out.println("<div align=\"center\" class=\"listdiv\">");
		out.println("<div style='text-align: center; font-size:14px;font-weight: bold;height:8px;'>"+ ml.getValue("public_private_records") +"</div>");
		out.println("<br>");

		out.println("<input type=\"HIDDEN\" ID=\"action\" name=\"action\" value=\"\"/>");
		out.println("<input type=\"HIDDEN\" ID=\"updated_document_ids\" name=\"updated_document_ids\"/>");

		out.println("<table class=\"search_field_div\" width=98%>");

		out.println("<tr><td>"+ml.getValue("university")+"</td>");
  	    GetRecordValue getUserDetails=new GetRecordValue();  	    
  	    if (getUserDetails.getRole(request.getUserPrincipal().getName()).equals("ROLE_ADMIN_UNIVERSITY")){
  	    	out.println("<td><input tye=\"text\" SIZE=\"35\" id=\"university\" name=\"university\" disabled value=\""+ getUserDetails.getUniversity(request.getUserPrincipal().getName()) +"\" ></td>");
  	    }else{
  	    	out.println("<td><input tye=\"text\" SIZE=\"35\" id=\"university\" name=\"university\" ></td>");
  	    }
		out.println("<td>"+ml.getValue("institution")+"</td><td><Input Type=\"text\" SIZE=\"35\" id=\"institution\" name=\"institution\"></td></tr>");
		out.println("<tr><td>"+ml.getValue("department")+"</td><td><Input Type=\"text\" SIZE=\"35\" id=\"department\" name=\"department\"></td>");									
		out.println("<td>"+ml.getValue("title")+"</td>");		
		out.println("<td>");
		out.println("<Select name=\"searchbytitle\"  id=\"searchbytitle\">");
		out.println("<option value=\"\" SELECTED>-Select-</option>");
		try
			{	
				ConnectDB conObj=new ConnectDB();		  	
				Connection conn = conObj.getMysqlConnection();	
		        PreparedStatement pst=null;
				pst=conn.prepareStatement("SELECT fld_value FROM `general_master` WHERE category='Title' AND  active_yes_no=1 ORDER BY fld_value");						
				ResultSet rs=pst.executeQuery();		
				while(rs.next())		
				{
					out.println("<option value="+rs.getString("fld_value")+">"+rs.getString("fld_value")+"</option>");		 			
				}
			 }catch (Exception e) {
				    e.printStackTrace();
			  }	 			
			out.println("</select></td></tr>");
			
		out.println("<tr><td>"+ml.getValue("first_name")+"<td><Input Type=\"text\" SIZE=\"35\" id=\"username\" name=\"username\"></td>");
		out.println("<td>"+ml.getValue("last_name")+"<td><Input Type=\"text\" SIZE=\"35\" id=\"last_name\" name=\"last_name\"></td></tr>");

		out.println("<tr>");
		//out.println("<td>Category:<label class=\"mandatory\">*</label></td>");
		out.println("<td>"+ml.getValue("category")+"</td>");
		out.println("<td>");
		out.println("<select id=\"category\" name=\"category\">");
		//out.println("<option value=%>-Select-</option>");
		out.println("<option value=%>All</option>");
		out.println("<option value=\"personal_details\">PersonalDetails</option>	");
		out.println("<option value=\"qualification\">Qualification</option>");
		out.println("<option value=\"awards\">Award</option>");
		out.println("<option value=\"journal_papers\">Publications</option>");
		out.println("<option value=\"conference_papers\">Conference Papers</option>");
		out.println("<option value=\"books_chapter\">Books or Chapter</option>");
		out.println("<option value=\"talks_lectures\">Invited Talks</option>");
		out.println("<option value=\"training\">Seminars</option>");
		out.println("<option value=\"projects\">Projects</option>");
		out.println("<option value=\"patents\">Patents</option>");
		out.println("<option value=\"media_publication\">Media Publication</option>");
		out.println("<option value=\"thesis\">Student Project</option>");
		out.println("<option value=\"faculty_exchange\">Faculty Exchange</option>");
		out.println("<option value=\"professional_body\">Professional Bodies</option>");
		out.println("<option value=\"consultancy_offered\">Consultancy Offered</option>");
		out.println("<option value=\"governance\">Governance</option>");
		out.println("<option value=\"review_committees\">Review Committees</option>");
		out.println("<option value=\"community_service\">Community Service</option>");
		out.println("<option value=\"masterdetails\">Faculty Profile</option>");
		out.println("</select>");
		out.println("</td>");
		out.println("<td>"+ml.getValue("filter_by")+"</td>");
		out.println("<td>");
		out.println("<select id=\"approval_status\" name=\"approval_status\">");
		//out.println("<option value=\"=''\">-Select-</option>");
		out.println("<option value=\"in('0','1')\">All</option>");
		out.println("<option value=\"='0'\">Pending</option>	");
		out.println("<option value=\"='1'\">Approved</option>");		
		out.println("</select>");
		out.println("</td></tr>");
		
		out.println("<tr><td>"+ml.getValue("record_type")+"</td>");
		out.println("<td>");
		out.println("<select id=\"record_type\" name=\"record_type\">");
		//out.println("<option value=\"=''\">-Select-</option>");
		out.println("<option value=\"='Y'\">Public</option>	");
		out.println("<option value=\"='N'\">Private</option>");
		out.println("<option value=\"in('Y','N')\">All</option>");	
				
		out.println("</select>");
		out.println("</td></tr>");
		
		out.println("<tr><td></td><td><input type=\"button\" value=\""+ ml.getValue("search") + "\" onclick=\"showRecords();\"/></td></tr>");
		out.println("</table>");
		out.println("<br>");


	}
	private void updateRecords(String document_ids,HttpServletRequest request, HttpServletResponse response,MultiLanguageString ml,PrintWriter out) throws SQLException, IOException{
		ConnectDB conObj=new ConnectDB();
		Connection connect = conObj.getMysqlConnection();
		Statement sst = null;
		sst = connect.createStatement();		
		String[] documentids=	document_ids.split("\\.");				
		String update_approval_dets=",last_modified_by='" + request.getUserPrincipal().getName()+"',last_modified_date_time=NOW() ";
		String sql_public="UPDATE entity_document_master SET public_record ='Y'"+update_approval_dets +" WHERE document_id IN("+documentids[0]+")";
		String sql_private="UPDATE entity_document_master SET public_record ='N'"+update_approval_dets +" WHERE document_id IN("+documentids[1]+")";
		out.println("<script type=\"text/javascript\">showRecords();</script>");
		try {
			sst.execute(sql_public);
			sst.execute(sql_private);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				connect.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	    }
	}
	private void showRecords(HttpServletRequest request, HttpServletResponse response,MultiLanguageString ml) throws IOException, SQLException{
		Connection conn = null;
		Statement stentity=null;
		ResultSet rsentity=null;
		Statement stentity_det=null;
		ResultSet rsentity_det=null;
		String title_criteria="";
		String last_name_criteria="";
		
		ConnectDB conObj=new ConnectDB();
		conn = conObj.getMysqlConnection();
		stentity=conn.createStatement();

		String username="";
		String university="";
		String institution="";
		String department="";
		String username_criteria="";
		String university_criteria="";
		String institution_criteria="";
		String department_criteria="";
		String entity_criteria="";
		String approval_status_criteria="";
		String record_type="";
		String qryStr="";
		String rowclass="1";
		String classname="";
		String entity_type="";
		int userid;
		int document_id;
		long rec_cnt=0;
		
		String file_entity="";
		String tabHead="";
		String query="";
		String displayed_fields="";

		try {
			username_criteria = request.getParameter("username");
			university_criteria=request.getParameter("university");
			institution_criteria=request.getParameter("institution");
			department_criteria=request.getParameter("department");
			entity_criteria=request.getParameter("category");
			approval_status_criteria=request.getParameter("approval_status");
			record_type=request.getParameter("record_type");
			title_criteria=request.getParameter("searchbytitle");
			last_name_criteria=request.getParameter("last_name");
			
			PrintWriter out = response.getWriter();

		
			out.println("<script type=\"text/javascript\">");
			out.println("document.RecordAccessSettings.username.value='"+username_criteria+"';");
			out.println("document.RecordAccessSettings.university.value='"+university_criteria+"';");
			out.println("document.RecordAccessSettings.institution.value='"+institution_criteria+"';");
			out.println("document.RecordAccessSettings.department.value='"+ department_criteria +"';");
			out.println("document.RecordAccessSettings.category.value='"+ entity_criteria +"';");
			out.println("document.RecordAccessSettings.approval_status.value=\"" +approval_status_criteria+"\";");
			out.println("document.RecordAccessSettings.record_type.value=\"" +record_type+"\";");		
			out.println("document.approval.searchbytitle.value=\"" +title_criteria+"\";");
			out.println("document.approval.last_name.value=\"" +last_name_criteria+"\";");
			out.println("</script>");
			
			out.println("<table  align=\"left\" ><tr><td><input align=\"left\" type=\"button\" value=\""+ ml.getValue("update_records") +"\" onclick=\"update_record_access_type();\"/></td></tr></table>");
			out.println("<table class=\"ListTable\" width=\"90%\" align=\"center\">");
			//out.println("<tr><td colspan=\"2\"><input align=\"left\" type=\"button\" value=\"Approve Selected Records\" onclick=\"approve_without_verification();\"/></td></tr>");
			out.println("<TR>");
			out.println("<TD  class=\"hidetd\">userid</TD>");
			out.println("<TD  class=\"hidetd\">number</TD>");
			out.println("<TD  class=\"ListHeader\">"+ml.getValue("col_record_type")+"<input type=\"checkbox\" name=\"chk_public_records\" id=\"select_all\" onClick='javascript:select_deselect_all()'  title=\"Select/Deselect\"/></TD>");//Select/Dselect
			out.println("<TD  class=\"ListHeader\">"+ml.getValue("col_facultyName")+"</TD>");
			out.println("<TD  class=\"ListHeader\">"+ml.getValue("col_university")+"</TD>");
			out.println("<TD  class=\"ListHeader\">"+ml.getValue("col_institution")+"</TD>");
			out.println("<TD  class=\"ListHeader\">"+ml.getValue("col_department")+"</TD>");
			out.println("<TD  class=\"ListHeader\">"+ml.getValue("col_category")+"</TD>");
			out.println("<TD  class=\"ListHeader\">"+ml.getValue("col_details")+"</TD>");
			out.println("<TD class=\"ListHeader\">"+ml.getValue("col_aproval_status")+"</TD>");			
			out.println("</TR>");
			File file = new File(getServletContext().getRealPath("/")+"xml/basic_search_settings.xml");				
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder docbuilder;
			try {
				docbuilder = dbf.newDocumentBuilder();
				Document doc = docbuilder.parse(file);
				doc.getDocumentElement().normalize();
				NodeList nodeLst;
				if(entity_criteria.equals("%")){					 
					nodeLst= doc.getElementsByTagName("table");}
				else{						
					nodeLst = doc.getElementsByTagName(entity_criteria);	
				}						
				stentity_det=conn.createStatement();
				 for (int s = 0; s < nodeLst.getLength(); s++) {
					 Node fstNode = nodeLst.item(s);	
					 if (fstNode.getNodeType() == Node.ELEMENT_NODE) {
						 Element rootElmnt = (Element) fstNode;	
				    	 
				    	  NodeList fldNameElmntLstentity = rootElmnt.getElementsByTagName("entity");
					      Element fld_nameElmtentity = (Element) fldNameElmntLstentity.item(0);
					      NodeList fld_nameentity = fld_nameElmtentity.getChildNodes();
					      file_entity=((Node) fld_nameentity.item(0)).getNodeValue();
					      //out.println("entity "  + entity);
					      if(!file_entity.equals("masterdetails")){	
							  NodeList fldCaptionElmntLst = rootElmnt.getElementsByTagName("description");
							  Element fld_caption_Elmnt = (Element) fldCaptionElmntLst.item(0);
							  NodeList fld_caption = fld_caption_Elmnt.getChildNodes();
							  tabHead=((Node) fld_caption.item(0)).getNodeValue();
							  //out.println("Description: "  + description);
							
							  NodeList fldNameElmntLst = rootElmnt.getElementsByTagName("query");
							  Element fld_nameElmt = (Element) fldNameElmntLst.item(0);
							  NodeList fld_name = fld_nameElmt.getChildNodes();
							  query=((Node) fld_name.item(0)).getNodeValue();
							  //out.println("Query :" + query);
							
							
							  NodeList fldNameElmntLstfields = rootElmnt.getElementsByTagName("displayed_fields");
							  Element fld_nameElmtfields = (Element) fldNameElmntLstfields.item(0);
							  NodeList fld_namefields = fld_nameElmtfields.getChildNodes();
							  displayed_fields=((Node) fld_namefields.item(0)).getNodeValue();
							  //out.println("fields "  + displayed_fields);	
							  
							  qryStr=query;
							  stentity_det=conn.createStatement();
							  if (qryStr!=""){									
								GetRecordValue  getUserDetails= new GetRecordValue();		
								if (getUserDetails.getRole(request.getUserPrincipal().getName()).equals("ROLE_ADMIN_UNIVERSITY")){		  	    
									qryStr=qryStr+" AND  staff_profile_masterdetails_v0_values.university = '" + getUserDetails.getUniversity(request.getUserPrincipal().getName())+"'";
									out.println("<script>");			
									out.println("document.RecordAccessSettings.university.value='"+getUserDetails.getUniversity(request.getUserPrincipal().getName())+"';");
									out.println("</script>");
								}else{			
									qryStr=qryStr+" AND  staff_profile_masterdetails_v0_values.university LIKE '"+ university_criteria +"%'";
								}
								
								qryStr=qryStr+" AND  staff_profile_masterdetails_v0_values.institution LIKE '"+ institution_criteria +"%'";
								qryStr=qryStr+" AND  staff_profile_masterdetails_v0_values.department LIKE '"+ department_criteria +"%'";
								qryStr=qryStr+" AND  staff_profile_masterdetails_v0_values.user_full_name LIKE '"+ username_criteria +"%'";
								qryStr=qryStr+" AND entity_document_master.approved_yesno " + approval_status_criteria ;
								qryStr=qryStr+" AND entity_document_master.public_record " +record_type;
							    qryStr=qryStr+" AND  staff_profile_masterdetails_v0_values.user_title LIKE '"+ title_criteria +"%'";
							    qryStr=qryStr+" AND  staff_profile_masterdetails_v0_values.last_name LIKE '"+ last_name_criteria +"%'";								
								qryStr=qryStr+" order by staff_profile_masterdetails_v0_values.university,staff_profile_masterdetails_v0_values.institution,staff_profile_masterdetails_v0_values.department,staff_profile_masterdetails_v0_values.full_name;";
							  }
							  rsentity_det=stentity_det.executeQuery(qryStr);
							  String[] displayedfields = displayed_fields.split(",");
							  while(rsentity_det.next()){
									if (rowclass=="1"){
										rowclass="0";
										classname="ListRow";
									}
									else	{
									rowclass="1";
									classname="ListRownext";
									}
									rec_cnt=rec_cnt+1;
									userid=rsentity_det.getInt("idf");
									document_id=rsentity_det.getInt("document_id");
									institution=rsentity_det.getString("institution");
									university=rsentity_det.getString("university");
									username=rsentity_det.getString("full_name");
									department=rsentity_det.getString("department");
									String approvalstatus=rsentity_det.getString("approved_yesno");
									String approved_by=rsentity_det.getString("approved_by");
									String approved_date=rsentity_det.getString("approved_date");
									String public_record=rsentity_det.getString("public_record");
									if(approved_by==null){
										approved_by="";
										approved_date="";
									}else{
										approved_by=approved_by.replace("@","@ ")+" , "+approved_date;
									}
									entity_type=rsentity_det.getString("entity_type");
									entity_type = entity_type.toLowerCase();
									entity_type =entity_type.substring(0,1).toUpperCase()+entity_type.substring(1,entity_type.length());
									out.println("<tr>");
									out.println("<td  class=\"hidetd\" id=\"user_"+document_id+ "\"  >"+userid+"</td>");
									out.println("<td  class=\"hidetd\"  id=\"docid_"+document_id+ "\" >"+document_id+"</td>");
									if(approvalstatus.equals("1")){
										//classname="approved";
										approvalstatus="Yes";
										//out.println("<td width=\"2%\" class=\""+classname+"\"></td>");
									}else{
										approvalstatus="No";				
									}
									if(public_record.equals("Y")){
										out.println("<td  class=\""+classname+"\"><input type=\"checkbox\" CHECKED=\"CHECKED\" value="+document_id+" name=\"chk_public_records\" id=\"chk_public_records\"/></td>");
									}else{
										out.println("<td  class=\""+classname+"\"><input type=\"checkbox\" value="+document_id+" name=\"chk_public_records\" id=\"chk_public_records\"/></td>");				
									}
									
									out.println("<td  class=\""+classname+"\">"+username+"</td>");
									out.println("<td  class=\""+classname+"\">"+university+"</td>");
									out.println("<td  class=\""+classname+"\">"+institution+"</td>");
									out.println("<td  class=\""+classname+"\">"+department+"</td>");
									out.println("<td  class=\""+classname+"\">"+entity_type.replace("_"," ")+"</td>");
									out.println("<TD  class=\"" +classname +"\"><a href=\"#\" onclick=\"showRecordDetails("+userid+","+document_id+",'"+entity_type+"')\">");								
									for(int col=0;col<displayedfields.length;col++){
										if(rsentity_det.getString(displayedfields[col])!=null){	    			
											String details=rsentity_det.getString(displayedfields[col]);
											 details=details.replace("<b>", "");
										 details=details.replace("</b>", "");
										 out.println(details );
										 if (col!=displayedfields.length){out.println(",");}												
										 } 			           
									}
									out.println("</a></TD>");
									out.println("<td  class=\"" +classname +"\">"+approvalstatus+"</TD>");
							  }//end while																	
					      }//end if
					 }//end if					 
				 }//end for	 
		   } //end try
			catch (ParserConfigurationException e) {
						e.printStackTrace();
			} catch (SAXException e) {
				e.printStackTrace();
			}
		if (rec_cnt>5){
			out.println("<tr><td colspan=\"2\"><input align=\"left\" type=\"button\" value=\""+ ml.getValue("update_records") +"\" onclick=\"update_record_access_type();\"/></td></tr>");			
		}
		out.println("</table>");
		out.println("<br/>");
		out.println("<table  align=\"left\"><tr><td class=\"search_resul_category\">&nbsp;&nbsp;&nbsp;"+ ml.getValue("summary") + rec_cnt +"&nbsp;&nbsp;&nbsp;</td></tr></table>");
		out.println("<br/>");
		}finally{
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
	}