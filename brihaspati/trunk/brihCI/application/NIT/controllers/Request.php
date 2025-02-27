<?php
/******************************************************
* @name Request.php(controller)    		      *
* @author Nagendra Kumar Singh(nksinghiitk@gmail.com)       *
* @author Sumit Saxena(sumitsesaxena@gmail.com)       *
*******************************************************/

defined('BASEPATH') OR exit('No direct script access allowed');

class Request extends CI_Controller {
/******************************************************************************/	
	public function __construct(){
		parent::__construct();
//		$this->load->model('user_model');
       		$this->load->model("user_model","usermodel");
		$this->load->model('Common_model',"commodel");
		$this->load->model("Student_model","stumodel");
		$this->load->model("Mailsend_model","mailmodel");
		$this->load->model("DateSem_model","datmodel");
	}
/******************************************************************************/	
//$this->load->helper('url');

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	
	
/******************************************Student semester registration start*******************************************************************/
	public function semesterregi(){
		$suid=$this->session->userdata('id_user');
		$Stuid=$this->commodel->get_listspfic1("student_master","sm_id","sm_userid",$suid)->sm_id;
		$this->appno = $this->commodel->get_listspfic1('student_entry_exit','senex_entexamapplicationno','senex_smid',$Stuid)->senex_entexamapplicationno;
		$stud_prg_rec = $this->commodel->get_listrow('student_program','sp_smid',$Stuid);
        	$degree_id = $stud_prg_rec->row()->sp_programid;
        	$noofsemester = sizeof($stud_prg_rec->result());

		
		$cacadyer = $this->usermodel->getcurrentAcadYear();
        	$semestertype = $this->usermodel->getcurrentSemester();
        	$semesterrec = $this->stumodel->get_semester_no($Stuid,$cacadyer);
//        	$semsize = sizeof($semesterrec);
//		$this->curresem = $semsize;


		//student personnel detail
		$this->name=$this->commodel->get_listspfic1("student_master","sm_fname","sm_userid",$suid)->sm_fname;
		$this->sturollno = $this->commodel->get_listspfic1('student_entry_exit','senex_rollno','senex_smid',$Stuid)->senex_rollno;
		$this->mobile=$this->commodel->get_listspfic1('student_master','sm_mobile','sm_id',$Stuid)->sm_mobile;
		$this->email=$this->commodel->get_listspfic1('student_master','sm_email','sm_id',$Stuid)->sm_email;
		$this->dob=$this->commodel->get_listspfic1('student_master','sm_dob','sm_id',$Stuid)->sm_dob;
		$this->uid=$this->commodel->get_listspfic1('student_master','sm_uid','sm_id',$Stuid)->sm_uid;
		$this->bgroup=$this->commodel->get_listspfic1('student_master','sm_bloodgroup','sm_id',$Stuid)->sm_bloodgroup;
		$this->gender=$this->commodel->get_listspfic1('student_master','sm_gender','sm_id',$Stuid)->sm_gender;
		$this->religname=$this->commodel->get_listspfic1('student_master','sm_religion','sm_id',$Stuid)->sm_religion;
             
		//student parent and course detail
		$this->mname = $this->commodel->get_listspfic1('student_parent','spar_mothername','spar_smid',$Stuid)->spar_mothername;		
		$this->fathname=$this->commodel->get_listspfic1('student_parent','spar_fathername','spar_smid',$Stuid)->spar_fathername;
		
		$this->sem = $this->commodel->get_listspfic1('student_program','sp_semester','sp_smid',$Stuid)->sp_semester;
		
		$this->ncid = $this->commodel->get_listspfic1('student_program','sp_programid','sp_smid',$Stuid)->sp_programid;
		//get programe name
		$this->pname = $this->commodel->get_listspfic1('program','prg_name','prg_id',$this->ncid)->prg_name;
		$this->progid = $this->commodel->get_listspfic1('program','prg_id','prg_name',$this->pname)->prg_id;
		
		//get program category name
		$this->pcatid = $this->commodel->get_listspfic1('student_program','sp_pcategory','sp_smid',$Stuid)->sp_pcategory;
		$this->pcatname = $this->commodel->get_listspfic1('programcategory','prgcat_name','prgcat_id',$this->pcatid)->prgcat_name;

		//postal address detail
		$this->padd=$this->commodel->get_listspfic1('student_parent','spar_caddress','spar_smid',$Stuid)->spar_caddress;
		$this->pcity=$this->commodel->get_listspfic1('student_parent','spar_ccity','spar_smid',$Stuid)->spar_ccity;
		$this->ppost=$this->commodel->get_listspfic1('student_parent','spar_cpostoffice','spar_smid',$Stuid)->spar_cpostoffice;
		$this->pdist=$this->commodel->get_listspfic1('student_parent','spar_cdistrict','spar_smid',$Stuid)->spar_cdistrict;
		$this->pstat=$this->commodel->get_listspfic1('student_parent','spar_cstate','spar_smid',$Stuid)->spar_cstate;
		$this->ppin=$this->commodel->get_listspfic1('student_parent','spar_cpincode','spar_smid',$Stuid)->spar_cpincode;
		$this->pcounname=$this->commodel->get_listspfic1('student_parent','spar_ccountry','spar_smid',$Stuid)->spar_ccountry;
		
		//get student category
		$this->cateid=$this->commodel->get_listspfic1('student_master','sm_category','sm_id',$Stuid)->sm_category;
		$this->catename=$this->commodel->get_listspfic1('category','cat_name','cat_id',$this->cateid)->cat_name;

		//get study center
		$this->sccode=$this->commodel->get_listspfic1('student_master','sm_sccode','sm_id',$Stuid)->sm_sccode;
		$this->scname=$this->commodel->get_listspfic1('study_center','sc_name','sc_code',$this->sccode)->sc_name;
		//get branch name
		$this->brid=$this->commodel->get_listspfic1('student_program','sp_branch','sp_smid',$Stuid)->sp_branch;
		$this->brname=$this->commodel->get_listspfic1('program','prg_branch','prg_id',$this->brid)->prg_branch;
		//get department name
		$this->depid=$this->commodel->get_listspfic1('student_program','sp_deptid','sp_smid',$Stuid)->sp_deptid;
		$this->depname=$this->commodel->get_listspfic1('Department','dept_name','dept_id',$this->depid)->dept_name;

//		echo $getspid = array('sp_smid' => $Stuid, 'sp_semester' => $semsize);
		$getspid = array('sp_smid' => $Stuid, 'sp_semester' => $noofsemester);
	   	$spstid = $this->commodel->get_listspficemore('student_program','sp_id',$getspid);
		
		foreach($spstid as $stspid){
			$this->cusem = $this->commodel->get_listspfic1('student_program','sp_semester','sp_id',$stspid->sp_id)->sp_semester;
		}
//		$datawh = array('sp_smid' => $Stuid, 'sp_semester' => $semsize);
		$datawh = array('sp_smid' => $Stuid, 'sp_semester' => $noofsemester);
	    $diffdate = $this->commodel->get_listspficemore('student_program','sp_programid,sp_semregdate',$datawh);
		foreach($diffdate as $spdate):
		    $semdiffdate = $this->datmodel->diffdays($spdate->sp_semregdate);
			$spprgid = $spdate->sp_programid;
		endforeach;	
        echo $spprgid;
		echo $prgpattern=$this->commodel->get_listspfic1('program','prg_pattern','prg_id',$spprgid)->prg_pattern;
        echo "<br>";
		    $tmonth = $semdiffdate/30;
        // get semester no in which student have to be registered.

            /* get the total semester count in an academic year,if semester is even,there may be two 
             * records in an academic year ,if not so ask for current semester registraion.
             * if semester id Odd there will be 1 records in an academic year otherwise ask for 
             * semester registration.
             */
            $semesterrec = $this->stumodel->get_semester_no($suid,$cacadyear);
            $semsize = sizeof($semesterrec);

            if($semestertype == "Odd")
            {
                if($semsize == 1)
                {
                    $semester = $noofsemester;
                }
                else
                {
                    $semester = $noofsemester + 1;
                    //$semester = "Please register in the semester ".$semester;
                    //echo message for semester registration
                    // redirect('studenthome/studentsubject/');
                    // return;
                }
            }
            if($semestertype == "Even")
            {
                if($semsize == 2)
                {
                    $semester = $noofsemester;
                }
                else
                {
                    $semester = $noofsemester + 1;
                    //$semester = "Please register in the semester ".$semester;
                    // redirect('studenthome/studentsubject/');
                    // return;
                }
            }
            $this->cusem = $semester;

        /* calculate minimum months required to complete a semester or year. 
         * for yearly program, it should be greater than 11 months and semester 
         * system it should be months to register in a next year and semester 
         * as well as. 
         */
        					
		if((($tmonth > 5) && ($prgpattern == 'Semester')) || (($tmonth > 11) && ($prgpattern == 'Yearly')))
		{
		    if(isset($_POST['register']))
			{	
			    $this->form_validation->set_rules('Ssem','Semseter','trim|xss_clean|required');
				//Re-populate field
				if($_POST)
				{
				    $this->data['Ssem']=$this->input->get_post('Ssem');
				}//re populate if close	
				if ($this->form_validation->run() == FALSE) {	
							//$message = '<h3>Your some detail is incorrect .</h3>';
	  						//$this->session->set_flashdata('msg',$message);
							//redirect('request/registartionsemester');
				}				
				else{
					//update in student_master
       	 		    $this->db->trans_begin();

					$cdate = date("Y-m-d h:i:sa");					 	
			 		if($_POST['Ssem'] != $semsize){				
					    //insert program data in student_program
						$progdata = array (
								'sp_smid'	=>	$Stuid,
								'sp_programid'	=>	$this->ncid,
								'sp_deptid'	=>	$this->depid,		
								'sp_sccode'	=>	$this->sccode,
								'sp_pcategory'	=>	$this->pcatid,
								'sp_branch'	=>	$this->brid,
								'sp_acadyear'	=>	$cacadyer,
								'sp_semregdate' =>	$cdate,
								'sp_semester'	=>      $_POST['Ssem']
								); 
			 			$this->db->insert('student_program',$progdata);
			 			$sprogramid = $this->db->insert_id();
					}
					else
                    			{
					    	$message1 = $semsize;
						$message = '<h3>You are already register in'." ". $semsize ." ". $prgpattern.'</h3>';
	  					$this->session->set_flashdata('msg',$message);
						redirect('request/semesterregi');
					}

					//insert smid and spid in student fees
					$feesdata = array (
					    'sfee_smid'	=>	$Stuid,
						'sfee_spid'	=>	$sprogramid
				   		); 
					$this->db->insert('student_fees',$feesdata);

				    //make transaction complete
        			$this->db->trans_complete();
			
	 				//check if transaction status TRUE or FALSE
        			if ($this->db->trans_status() === FALSE) {
			
            		//if something went wrong, rollback everything
            		    $this->db->trans_rollback();
						$this->logger->write_logmessage("update", "Student registration not update record in student_master table.");
                    	$this->logger->write_dblogmessage("update", "Student registration not update record in student_master table.");
						$this->load->view('request/registartionsemester');
						//redirect('request/stufeesdetail');
           				//return FALSE;
      			    } else {	
            					//if everything went right, commit the data to the database
           			    $this->db->trans_commit();
			 			$message = '<h3>Your registration successfully done.</h3>';
	  					$this->session->set_flashdata('msg',$message);			
						$this->logger->write_logmessage("update", "Student registration successfull update record in student_master table");
                    	$this->logger->write_dblogmessage("update", "Student registration successfull update record in student_master table" );
						redirect('request/stufeesdetail');
           		 			//return TRUE;
       			 	}
			    }//close first else	
			}//if post close
		}//close semster difference if
		else{
			$message = '<h3>You can not register for next semester registration because you can not complete minimum duration.</h3>';
  			$this->session->set_flashdata('err_message',$message);
			redirect('studenthome');
            //redirect('request/semesterregi');
		    }	
	$this->load->view('request/registartionsemester');
	}

	
	public function stufeesdetail(){
		$suid=$this->session->userdata('id_user');
        //get student id from student master
		$this->Stuid=$this->commodel->get_listspfic1("student_master","sm_id","sm_userid",$suid)->sm_id;
		//get program(semesters) of a student 
		$stud_prg_rec = $this->commodel->get_listrow('student_program','sp_smid',$this->Stuid);
        $degree_id = $stud_prg_rec->row()->sp_programid;
        $noofsemester = sizeof($stud_prg_rec->result());
        if($noofsemester == 1)
        {
		    $cacadyer = $this->usermodel->getcurrentAcadYearfadm();
        }
        else
            $cacadyer = $this->usermodel->getcurrentAcadYear();
        //$semestertype = $this->user_model->getcurrentSemester();
        //print_r($semestertype);
        //$semesterrec = $this->stumodel->get_semester_no($this->Stuid,$cacadyer);
        //echo $semsize = sizeof($semesterrec);
		$this->db->select('sp_id')->from('student_program')->where('sp_smid',$this->Stuid)->where('sp_semester',$noofsemester);
		$spid = $this->db->get()->row()->sp_id;
		/*foreach($spid as $stspid){
			$this->cusem = $this->commodel->get_listspfic1('student_program','sp_semester','sp_id',$stspid)->sp_semester;
			//print_r($this->cusem);
		}
		*/
		$this->appno=$this->commodel->get_listspfic1('student_entry_exit','senex_entexamapplicationno','senex_smid',$this->Stuid)->senex_entexamapplicationno;
		$this->sname=$this->commodel->get_listspfic1('student_master','sm_fname','sm_id',$this->Stuid)->sm_fname;
		$this->fname=$this->commodel->get_listspfic1('student_parent','spar_fathername','spar_smid',$this->Stuid)->spar_fathername;
		$this->gender=$this->commodel->get_listspfic1('student_master','sm_gender','sm_id',$this->Stuid)->sm_gender;
		//echo $this->acadyear=$this->user_model->getcurrentAcadYearfadm();
		$this->prgid=$this->commodel->get_listspfic1('student_program','sp_programid','sp_smid',$this->Stuid)->sp_programid;
		$sarray='prg_name,prg_branch';	
		$wharray = array('prg_id' => $this->prgid);
    	$this->resultprg=$this->commodel->get_listarry("program",$sarray,$wharray);

		$this->catid=$this->commodel->get_listspfic1('student_master','sm_category','sm_id',$this->Stuid)->sm_category;
		//$wharray = array('fm_programid' => $this->prgid, 'fm_semester' => $this->cusem);
		$wharray = array('fm_programid' => $this->prgid, 'fm_semester' => $noofsemester);
		$sarray = 'fm_head,fm_amount';
		$wgenr = array('All', $this->gender);
		$wcateid = array('1', $this->catid);
		$this->db->select($sarray);
		$this->db->from('fees_master');
		$this->db->where_in('fm_gender',$wgenr);
		$this->db->where_in('fm_category',$wcateid);
		$this->db->where($wharray);
		$this->feesresult =  $this->db->get()->result();
        print_r(sizeof($this->feesresult));
        $data['cacadyer'] = $cacadyer;
        $data['noofsemester'] = $noofsemester;	
				

		$this->load->view('request/student_feesdetail',$data);
	}
	

	public function stufeespayment(){
		$suid=$this->session->userdata('id_user');
		//print_r($suid);
		$Stuid=$this->commodel->get_listspfic1("student_master","sm_id","sm_userid",$suid)->sm_id;
		
		$email= $this->commodel->get_listspfic1('student_master','sm_email','sm_id',$Stuid)->sm_email;
		$name= $this->commodel->get_listspfic1('student_master','sm_fname','sm_id',$Stuid)->sm_fname;

		$stud_prg_rec = $this->commodel->get_listrow('student_program','sp_smid',$Stuid);
      	 	$degree_id = $stud_prg_rec->row()->sp_programid;
       		$noofsemester = sizeof($stud_prg_rec->result());

        	if($noofsemester == 1)
        	{
           		 $cacadyer = $this->user_model->getcurrentAcadYearfadm();
        	}
        	else
            	$cacadyer = $this->user_model->getcurrentAcadYear();
		
		//$cacadyer = $this->user_model->getcurrentAcadYear();
		//print_r($cacadyer);
       		$semestertype = $this->user_model->getcurrentSemester();
        	//print_r($semestertype);
       		$semesterrec = $this->stumodel->get_semester_no($Stuid,$cacadyer);
//       	$semsize = sizeof($semesterrec);
		
//		$this->db->select('sp_id')->from('student_program')->where('sp_smid',$Stuid)->where('sp_semester',$semsize);
		$this->db->select('sp_id')->from('student_program')->where('sp_smid',$Stuid)->where('sp_semester',$noofsemester);
		$spid = $this->db->get()->row();
		//print_r($spid);
		/*foreach($spid as $stspid){
			$this->cusem = $this->commodel->get_listspfic1('student_program','sp_semester','sp_id',$stspid)->sp_semester;
			//print_r($this->cusem);
		}
        */

		$this->gender=$this->commodel->get_listspfic1('student_master','sm_gender','sm_id',$Stuid)->sm_gender;
		//$this->acadyear=$this->user_model->getcurrentAcadYearfadm();
		$this->prgid=$this->commodel->get_listspfic1('student_program','sp_programid','sp_smid',$Stuid)->sp_programid;
		$this->catid=$this->commodel->get_listspfic1('student_master','sm_category','sm_id',$Stuid)->sm_category;
		//$wharray = array('fm_programid' => $this->prgid, 'fm_semester' => $this->cusem);
		$wharray = array('fm_programid' => $this->prgid, 'fm_semester' => $noofsemester);
		$sarray = 'fm_head,fm_amount';
		$wgenr = array('All', $this->gender);
		$wcateid = array('1', $this->catid);

		$this->db->select($sarray);
		$this->db->from('fees_master');
		$this->db->where_in('fm_gender',$wgenr);
		$this->db->where_in('fm_category',$wcateid);
		$this->db->where($wharray);
		$this->feesresult =  $this->db->get()->result();
		//print_r($this->feesresult);
		$this->totalfees = '';
		foreach($this->feesresult as $d2){
			$d2->fm_head;$d2->fm_amount;
			$this->totalfees = $this->totalfees+$d2->fm_amount;
			//print_r($this->totalfees);
		}
		
		if(isset($_POST['payment']))
		{
			$this->form_validation->set_rules('refNo','Reference number','trim|xss_clean|numeric|required');
            		$this->form_validation->set_rules('bank','Bank detail','trim|xss_clean|required');
            		$this->form_validation->set_rules('amount','Amount','trim|xss_clean|required');
            		$this->form_validation->set_rules('ftype','fees type field','trim|xss_clean|required');

			if($_POST){
				$this->data['refNo'] = $this->input->get_post('refNo');
				$this->data['bank']  = $this->input->get_post('bank');
				$this->data['amount']= $this->input->get_post('amount');
				$this->data['ftype']=$this->input->get_post('ftype');
			}

			if($this->form_validation->run() == FALSE){			
				$this->load->view('request/stu_feesoffline');
				return;
			}else{	
				//start the transaction
       	 			$this->db->trans_begin();		
				//update student fees table
				if(($_POST['amount']) == $this->totalfees)	
				{	
					$offline = array(
						'sfee_referenceno'   	=>	$_POST['refNo'],
                				'sfee_bankname'  	=>	$_POST['bank'],
                				'sfee_feeamount'  	=>	$_POST['amount'],
                				'sfee_feename'   	=>	$_POST['ftype'],
						'sfee_paymentmethod'    =>	'Offline'
                				);
					//print_r($data);
					foreach($spid as $stspid){
						$this->db->where('sfee_spid',$stspid);
						$this->db->where('sfee_smid',$Stuid);
						$this->db->update('student_fees', $offline); 
					}
				}
				else {				
					$message = '<h3>The payble fees and fees deposit in bank should be equal.</h3>';
	  				$this->session->set_flashdata('msg',$message);
					$this->logger->write_logmessage("update", "Offline payment  fees match error.");
	                    		$this->logger->write_dblogmessage("update", "Offline payment fees match error." );
					$this->load->view('request/stu_feesoffline');
					return;
				     }
				
				$this->logger->write_logmessage("update", "semester registration fees update in fees_master table.");
                    		$this->logger->write_dblogmessage("update", "semester registration fees update in fees_master table." );
				
				//make transaction complete
        			$this->db->trans_complete();
			
	 			//check if transaction status TRUE or FALSE
        			if ($this->db->trans_status() === FALSE) {
				
            			//if something went wrong, rollback everything
            				$this->db->trans_rollback();
					$this->logger->write_logmessage("update", "Student registration not update record in student_master table.");
                    			$this->logger->write_dblogmessage("update", "Student registration not update record in student_master table.");
					$this->load->view('request/stufeespayment');
					//redirect('request/stufeesdetail');
           				//return FALSE;
      				 } else {	
            				//if everything went right, commit the data to the database
           				$this->db->trans_commit();

					//if sucess send mail to user with login details 
		 					$sub='Student Semester Registration' ;
                        				$mess="Your registration is complete. Student email is ".$email." and name is ".$name ;
                	       				$mails = $this->mailmodel->mailsnd($email, $sub, $mess);
							 //  mail flag check 			
							if($mails){
                        					$error[] ="At row".$i."sufficient data and mail sent sucessfully";
                        					$this->logger->write_logmessage("insert","semester registration fees submitted", "record added successfully for.".$name ." ".$email);
		      						$this->logger->write_dblogmessage("insert","semester registration fees submitted", "record added successfully for.".$name ." ".$email);
				    			}
							else{
        		       					$error[] ="At row".$i."sufficient data and mail does not sent";
		                				$this->logger->write_logmessage("insert"," semester registration fees not submitted", "record not added successfully for.".$name ." ".$email ." and mail does sent");
								$this->logger->write_dblogmessage("insert"," semester registration fees not submitted ", "record not added successfully for.".$name ." ".$email." and mail does sent");
			   				}

			 		$message = '<h3>Your offline payment successfull done.</h3>';
	  				$this->session->set_flashdata('msg',$message);			
					$this->logger->write_logmessage("update", "Student registration successfull update record in student_master table");
                    			$this->logger->write_dblogmessage("update", "Student registration successfull update record in student_master table" );
				 	redirect('studenthome/index'); 
           		 		//return TRUE;
       			 		}
	
			}//first else close

		}//close if post
		$this->load->view('request/stu_feesoffline');
	}

//Duplicate record check in exam registration		   
    public function examemail($etype) {
        $is_exist = $this->commodel->isduplicate('student_exam','sex_examtype',$etype);
	//print_r($is_exist);
        if ($is_exist)
        {
		$this->form_validation->set_message('examemail','You are already applied for'." ".$etype);
            return false;
        }
        else {
            return true;
        }
}
/******************************************Student semester registration end****************************************************************


/*********************************************************Student Exam Registration Start************************************************************************/
	public function exam_regi(){
		$suid=$this->session->userdata('id_user');
		//print_r($suid);
		$Stuid=$this->commodel->get_listspfic1("student_master","sm_id","sm_userid",$suid)->sm_id;
		//print_r($Stuid);
           	//get current academic year
           	//$acadyear = $this->user_model->getcurrentAcadYear();
		$this->cdate = date('d-m-Y');
		$this->appno = $this->commodel->get_listspfic1('student_entry_exit','senex_entexamapplicationno','senex_smid',$Stuid)->senex_entexamapplicationno;
		$stud_prg_rec = $this->commodel->get_listrow('student_program','sp_smid',$Stuid);
           	$degree_id = $stud_prg_rec->row()->sp_programid;
           	$noofsemester = sizeof($stud_prg_rec->result());
       		
		$cacadyer = $this->usermodel->getcurrentAcadYear();
		
		$data['cacadyer'] = $cacadyer;
        	$data['noofsemester'] = $noofsemester;
		//print_r($this->cacadyer);
            	//$semestertype = $this->usermodel->getcurrentSemester();
        	//print_r($semestertype);
            	//$semesterrec = $this->stumodel->get_semester_no($Stuid,$this->cacadyer);
           	//$semsize = sizeof($semesterrec);
		//$this->curresem = $semsize;
		//print_r($semsize);
		
		$this->signresult = $this->commodel->get_listspfic1('student_master','sm_signature','sm_id',$Stuid)->sm_signature;
            	$this->seresult = $this->commodel->get_listrow('student_education','sedu_smid',$Stuid)->result();
		$this->phresult = $this->commodel->get_listspfic1('student_master','sm_photo','sm_id',$Stuid)->sm_photo;
		//student personnel detail
		$this->name=$this->commodel->get_listspfic1("student_master","sm_fname","sm_userid",$suid)->sm_fname;
		
		$this->mobile=$this->commodel->get_listspfic1('student_master','sm_mobile','sm_id',$Stuid)->sm_mobile;
		$this->email=$this->commodel->get_listspfic1('student_master','sm_email','sm_id',$Stuid)->sm_email;
		$this->dob=$this->commodel->get_listspfic1('student_master','sm_dob','sm_id',$Stuid)->sm_dob;
		$this->uid=$this->commodel->get_listspfic1('student_master','sm_uid','sm_id',$Stuid)->sm_uid;
		$this->bgroup=$this->commodel->get_listspfic1('student_master','sm_bloodgroup','sm_id',$Stuid)->sm_bloodgroup;
		$this->gender=$this->commodel->get_listspfic1('student_master','sm_gender','sm_id',$Stuid)->sm_gender;
		$this->religname=$this->commodel->get_listspfic1('student_master','sm_religion','sm_id',$Stuid)->sm_religion;

		//student parent and course detail
		$this->mname = $this->commodel->get_listspfic1('student_parent','spar_mothername','spar_smid',$Stuid)->spar_mothername;		
		$this->fathname=$this->commodel->get_listspfic1('student_parent','spar_fathername','spar_smid',$Stuid)->spar_fathername;
		
		$this->sem = $this->commodel->get_listspfic1('student_program','sp_semester','sp_smid',$Stuid)->sp_semester;
		
		$this->ncid = $this->commodel->get_listspfic1('student_program','sp_programid','sp_smid',$Stuid)->sp_programid;
		//get programe name
		$this->pname = $this->commodel->get_listspfic1('program','prg_name','prg_id',$this->ncid)->prg_name;
		$this->progid = $this->commodel->get_listspfic1('program','prg_id','prg_name',$this->pname)->prg_id;
		
		//get program category name
		$this->pcatid = $this->commodel->get_listspfic1('student_program','sp_pcategory','sp_smid',$Stuid)->sp_pcategory;
		$this->pcatname = $this->commodel->get_listspfic1('programcategory','prgcat_name','prgcat_id',$this->pcatid)->prgcat_name;

		//postal address detail
		$this->padd=$this->commodel->get_listspfic1('student_parent','spar_caddress','spar_smid',$Stuid)->spar_caddress;
		$this->pcity=$this->commodel->get_listspfic1('student_parent','spar_ccity','spar_smid',$Stuid)->spar_ccity;
		$this->ppost=$this->commodel->get_listspfic1('student_parent','spar_cpostoffice','spar_smid',$Stuid)->spar_cpostoffice;
		$this->pdist=$this->commodel->get_listspfic1('student_parent','spar_cdistrict','spar_smid',$Stuid)->spar_cdistrict;
		$this->pstat=$this->commodel->get_listspfic1('student_parent','spar_cstate','spar_smid',$Stuid)->spar_cstate;
		$this->ppin=$this->commodel->get_listspfic1('student_parent','spar_cpincode','spar_smid',$Stuid)->spar_cpincode;
		$this->pcounname=$this->commodel->get_listspfic1('student_parent','spar_ccountry','spar_smid',$Stuid)->spar_ccountry;
		
		//get student category
		$this->cateid=$this->commodel->get_listspfic1('student_master','sm_category','sm_id',$Stuid)->sm_category;
		$this->catename=$this->commodel->get_listspfic1('category','cat_name','cat_id',$this->cateid)->cat_name;

		//get study center
		$this->sccode=$this->commodel->get_listspfic1('student_master','sm_sccode','sm_id',$Stuid)->sm_sccode;
		$this->scname=$this->commodel->get_listspfic1('study_center','sc_name','sc_code',$this->sccode)->sc_name;
		//get branch name
		$this->brid=$this->commodel->get_listspfic1('student_program','sp_branch','sp_smid',$Stuid)->sp_branch;
		$this->brname=$this->commodel->get_listspfic1('program','prg_branch','prg_id',$this->brid)->prg_branch;
		//get department name
		$this->depid=$this->commodel->get_listspfic1('student_program','sp_deptid','sp_smid',$Stuid)->sp_deptid;
		$this->depname=$this->commodel->get_listspfic1('Department','dept_name','dept_id',$this->depid)->dept_name;

		//$sprogid = $this->commodel->get_listspfic1('student_program','sp_id','sp_smid',$Stuid)->sp_id;
		//print_r($sprogid);

		//$this->db->select('sp_id')->from('student_program')->where('sp_smid',$Stuid)->where('sp_semester',$semsize);
		//$spstid = $this->db->get()->row();
		$getspid = array('sp_smid' => $Stuid, 'sp_semester' => $noofsemester);
	    	$spstid = $this->commodel->get_listspficemore('student_program','sp_id',$getspid);
		
		//print_r($spstid);
		foreach($spstid as $stspid){
			$this->cusem = $this->commodel->get_listspfic1('student_program','sp_semester','sp_id',$stspid->sp_id)->sp_semester;
			//print_r($this->cusem);
		}
			$datawh = array('sp_smid' => $Stuid, 'sp_semester' => $noofsemester);
	    		$diffdate = $this->commodel->get_listspficemore('student_program','sp_programid,sp_semregdate',$datawh);
			//print_r($diffdate);
			foreach($diffdate as $spdate):
				$semdiffdate = $this->datmodel->diffdays($spdate->sp_semregdate);
				$spprgid = $spdate->sp_programid;
			endforeach;	
			//print_r($semdiffdate);
			$prgpattern=$this->commodel->get_listspfic1('program','prg_pattern','prg_id',$spprgid)->prg_pattern;
			$tmonth = $semdiffdate/30;

        /*get student academic year along with semester
        $studprogram = $this->commodel->get_listrow('student_program','sp_smid',$Stuid)->result();
        foreach($studprogram as $prgrec)
        {
            $semes = $prgrec->sp_semester;
            $acad = $prgrec->sp_acadyear;
            $rid = $prgrec->sp_id;
            $prg_id = $prgrec->sp_programid;
        }
        get program name
        $prg_name = $this->commodel->get_listrow('program','prg_id',$spprgid)->row()->prg_name;
        $semester = $semes;
        $acadyear = $acad;    
        $prg_id = $prg_id;
        $data['acadyear'] = $acadyear;
        $data['semester'] = $semester;
        $data['rid'] = $rid;
        $data['prg_name'] = $prg_name;*/

        //get semester rule, semester min credit max credit of a program
        $wheredata = array('semcr_prgid' => $spprgid,'semcr_semester' => $this->cusem );
        $selectfield = 'semcr_mincredit,semcr_maxcredit,semcr_semcpi';
        $semrule = $this->commodel->get_listspficemore('semester_rule',$selectfield,$wheredata);

        //get subject/papers in a semester of a program from subject_semester
        $wheredata1 = array('subsem_prgid' => $spprgid,'subsem_semester' => $this->cusem);
        $selectfield1 = 'subsem_subid,subsem_subtype';
        $semsubject =  $this->commodel->get_listspficemore('subject_semester',$selectfield1,$wheredata1);    
        
        $subjectsem = array();
        $compcr = 0;
        $upsubdata = array();
        $incrid = 1;
        foreach($semsubject as $row)
        {
            $subid = $row->subsem_subid;
            $subtype = $row->subsem_subtype; 
            $substring = $subid."#".$subtype;
            $subjectsem[] = $substring;
            if($subtype == "Compulsory")
            {
                //$incrid = 1;
                $subcr = $this->commodel->get_listrow('subject','sub_id',$subid)->row()->sub_ext1;
                $compcr = $compcr + $subcr;
                
                $upsubdata[] =  $subid;
                $incrid = $incrid + 1;
            }
        }
        $data['subjectsem']  = $subjectsem;

        //get subject from subject table
        $this->load->model("map_model", "mapmodel");
        $data['subject_list'] = $this->mapmodel->getsubject();

        //update subject of student
       

	if(isset($_POST['exm_regi']))
	{
		
			$this->form_validation->set_rules('Exname','Exam name','trim|xss_clean|required|callback_examemail');
            		$this->form_validation->set_rules('Excourse','Course name','trim|xss_clean|required');
            		$this->form_validation->set_rules('Exsem','Semester','trim|xss_clean|required');
            		$this->form_validation->set_rules('Exsname','Student name','trim|xss_clean|required');
			$this->form_validation->set_rules('Exmname','Student mother name','trim|xss_clean|required');
            		$this->form_validation->set_rules('Exfname','Student father name','trim|xss_clean|required');
			//$this->form_validation->set_rules('Exemail','Student father name','trim|xss_clean|callback_examemail');

			if($_POST){
				$this->data['Exname'] = $this->input->get_post('Exname');
				$this->data['Excourse']  = $this->input->get_post('Excourse');
				$this->data['Exsem']= $this->input->get_post('Exsem');
				$this->data['Exsname']=$this->input->get_post('Exsname');
			}

			if($this->form_validation->run() == FALSE){			
				$this->load->view('request/stu_exam_regi',$data);
				return;
			}
			else{	
				//start the transaction
       	 			$this->db->trans_begin();		
				//add student exam detail
					//$sem = $this->commodel->get_listspfic1('student_exam','sex_sem','sex_smid',$Stuid)->sex_sem;
				//if($sem == $_POST['Exsem']){
					$cdate = date('Y-m-d');
					$exam = array(
							'sex_smid'   		=>	$Stuid,
                					'sex_prgid'  		=>	$this->ncid,
                					'sex_sem'  		=>	$_POST['Exsem'],
                					'sex_examtype'   	=>	$_POST['Exname'],
							'sex_applydate'    	=>	$cdate,
							//'sex_examgiven'	=>	$_POST['Exname'],
							//'sex_resultdate'  	=>	$_POST['Exname'],
							//'sex_resultstatus' 	=>	$_POST['Exname'],
							//'sex_remark'	   	=>	$_POST['Exname'],
							'sex_creatorid'	   	=>	$_POST['Exemail'],
							'sex_createdate'   	=>	$cdate
							//'sex_modifierid'   	=>	,
							//'sex_modifydate'   	=>	,		
                				);
					$this->commodel->insertrec('student_exam', $exam);
								
				$this->logger->write_logmessage("insert", "Exam registration detail insert.");
                    		$this->logger->write_dblogmessage("update", "Exam registration detail insert." );
				
				//make transaction complete
        			$this->db->trans_complete();
			
	 			//check if transaction status TRUE or FALSE
        			if ($this->db->trans_status() === FALSE) {
				
            			//if something went wrong, rollback everything
            				$this->db->trans_rollback();
					$message = '<h3>Your exam detail not done.</h3>';
	  				$this->session->set_flashdata('msg',$message);
					$this->logger->write_logmessage("insert", "Exam registration detail not insert.");
                    			$this->logger->write_dblogmessage("insert", "Exam registration detail not insert.");
					$this->load->view('request/exam_regi');
					
           				//return FALSE;
      				 } else {	
            				//if everything went right, commit the data to the database
           				$this->db->trans_commit();
			 		$message = '<h3>Your exam registration successfull done.</h3>';
	  				$this->session->set_flashdata('msg',$message);			
					$this->logger->write_logmessage("insert", "Exam registration detail insert.");
                    			$this->logger->write_dblogmessage("insert", "Exam registration detail insert." );
				 	redirect('request/admit_card');
           		 		//return TRUE;
       			 		}
	
			}//first else close
	}

	$this->load->view('request/stu_exam_regi',$data);
	}
	
	public function admit_card(){
		$suid=$this->session->userdata('id_user');
		//print_r($suid);
		$Stuid=$this->commodel->get_listspfic1("student_master","sm_id","sm_userid",$suid)->sm_id;
		$this->cacadyer = $this->usermodel->getcurrentAcadYear();
		$this->name=$this->commodel->get_listspfic1("student_master","sm_fname","sm_userid",$suid)->sm_fname;
		$this->enrono=$this->commodel->get_listspfic1("student_master","sm_enrollmentno","sm_userid",$suid)->sm_enrollmentno;
		$this->enrono=$this->commodel->get_listspfic1("student_master","sm_enrollmentno","sm_userid",$suid)->sm_enrollmentno;
		$this->rollno=$this->commodel->get_listspfic1("student_entry_exit","senex_rollno","senex_smid",$Stuid)->senex_rollno;
		//get study center
		$this->sccode=$this->commodel->get_listspfic1('student_master','sm_sccode','sm_id',$Stuid)->sm_sccode;
		$this->scname=$this->commodel->get_listspfic1('study_center','sc_name','sc_code',$this->sccode)->sc_name;
		$this->cacadyer = $this->usermodel->getcurrentAcadYear();
		//print_r($this->cacadyer);
            	$semestertype = $this->usermodel->getcurrentSemester();
        	//print_r($semestertype);
            	$semesterrec = $this->stumodel->get_semester_no($Stuid,$this->cacadyer);
           	$semsize = sizeof($semesterrec);
		$this->curresem = $semsize;
		$getspid = array('sp_smid' => $Stuid, 'sp_semester' => $semsize);
	    	$spstid = $this->commodel->get_listspficemore('student_program','sp_id',$getspid);
		$this->ncid = $this->commodel->get_listspfic1('student_program','sp_programid','sp_smid',$Stuid)->sp_programid;
		$this->brname = $this->commodel->get_listspfic1('program','prg_branch','prg_id',$this->ncid)->prg_branch;
		
		//get programe name
		$this->pname = $this->commodel->get_listspfic1('program','prg_name','prg_id',$this->ncid)->prg_name;
		//print_r($spstid);
		foreach($spstid as $stspid){
			$this->cusem = $this->commodel->get_listspfic1('student_program','sp_semester','sp_id',$stspid->sp_id)->sp_semester;
			//print_r($this->cusem);
		}
		$this->phresult = $this->commodel->get_listspfic1('student_master','sm_photo','sm_id',$Stuid)->sm_photo;

		//$this->papername = $this->commodel->get_listspfic1('subject_paper','subp_name','subp_degree',$this->ncid)->subp_name;
		//$this->papercode = $this->commodel->get_listspfic1('subject_paper','subp_code','subp_degree',$this->ncid)->subp_code;
		
		//get paper name and code
		$getdata = array('subp_branch' =>$this->ncid, 'subp_branch' => $this->brname);
	    	$this->papercode = $this->commodel->get_listspficemore('subject_paper','subp_name,subp_code',$getdata);
		//print_r($this->papercode);
		

			//$datawh = array('subsem_prgid' => $this->ncid, 'subsem_subtype' => $semsize);
	    		//$subsem = $this->commodel->get_listspficemore('subject_semester','subsem_subid,subsem_subtype',$datawh);	
			//print_r($subsem);		

		$this->load->view('request/stu_admit_card');
	}
/*********************************************************Student Exam Registration End************************************************************************/


/**********************************************************Student Fees Deposit Start*****************************************************************/

	public function fees_deposit(){
		$suid=$this->session->userdata('id_user');
		
		//print_r($suid);
		$this->Sid=$this->commodel->get_listspfic1("student_master","sm_id","sm_userid",$suid)->sm_id;

		$this->appno=$this->commodel->get_listspfic1('student_entry_exit','senex_entexamapplicationno','senex_smid',$this->Sid)->senex_entexamapplicationno;
		$this->sname=$this->commodel->get_listspfic1('student_master','sm_fname','sm_id',$this->Sid)->sm_fname;
		$this->fname=$this->commodel->get_listspfic1('student_parent','spar_fathername','spar_smid',$this->Sid)->spar_fathername;
		$this->gender=$this->commodel->get_listspfic1('student_master','sm_gender','sm_id',$this->Sid)->sm_gender;
		$stud_prg_rec = $this->commodel->get_listrow('student_program','sp_smid',$this->Sid);
           	$degree_id = $stud_prg_rec->row()->sp_programid;
           	$noofsemester = sizeof($stud_prg_rec->result());
       		
		$cacadyer = $this->usermodel->getcurrentAcadYear();
		
		$data['cacadyer'] = $cacadyer;
        	$data['noofsemester'] = $noofsemester;
		//$this->prgid=$this->commodel->get_listspfic1('student_program','sp_programid','sp_smid',$Sid)->sp_programid;
		$this->prgid=$this->commodel->get_listspfic1('student_program','sp_programid','sp_smid',$this->Sid)->sp_programid;
		$sarray='prg_name,prg_branch';	
		$wharray = array('prg_id' => $this->prgid);
    		$this->resultprg=$this->commodel->get_listarry("program",$sarray,$wharray);

		$this->catid=$this->commodel->get_listspfic1('student_master','sm_category','sm_id',$this->Sid)->sm_category;
		// in future we add acdamic year
		//$wharray = array('fm_programid' => $this->prgid,('fm_gender' => (All)||($this->gender))&&('fm_category'=>(All)||($this->catid)));
		// display fees detail on the basis of gender, category and program with semester
		$wharray = array('fm_programid' => $this->prgid, 'fm_semester' => $noofsemester);
		$sarray = 'fm_head,fm_amount';
		$wgenr = array('All', $this->gender);
		$wcateid = array('1', $this->catid);
		$this->db->select($sarray);
		$this->db->from('fees_master');
		$this->db->where_in('fm_gender',$wgenr);
		$this->db->where_in('fm_category',$wcateid);
		$this->db->where($wharray);
		$this->feesresult =  $this->db->get()->result();
			
		$getspid = array('sp_smid' => $this->Sid, 'sp_semester' => $noofsemester);
	    	$spstid = $this->commodel->get_listspficemore('student_program','sp_id',$getspid);
		$this->ncid = $this->commodel->get_listspfic1('student_program','sp_programid','sp_smid',$this->Sid)->sp_programid;
		//get programe name
		$this->pname = $this->commodel->get_listspfic1('program','prg_name','prg_id',$this->ncid)->prg_name;
		
		$wharray = array('fm_programid' => $this->prgid, 'fm_semester' => $noofsemester);
		$sarray = 'fm_head,fm_amount';
		$wgenr = array('All', $this->gender);
		$wcateid = array('1', $this->catid);

		$this->db->select($sarray);
		$this->db->from('fees_master');
		$this->db->where_in('fm_gender',$wgenr);
		$this->db->where_in('fm_category',$wcateid);
		$this->db->where($wharray);
		$this->feesresult =  $this->db->get()->result();
		//print_r($this->feesresult);
		$this->totalfees = '';
		foreach($this->feesresult as $d2){
			$d2->fm_head;$d2->fm_amount;
			$this->totalfees = $this->totalfees+$d2->fm_amount;
			//print_r($this->totalfees);
		}
		$this->load->view('request/stu_fee_deposit',$data);
	}

	public function fees_deposit_payment(){
		$suid=$this->session->userdata('id_user');
		$smid=$this->commodel->get_listspfic1("student_master","sm_id","sm_userid",$suid)->sm_id;
		$spid = $this->commodel->get_listspfic1("student_program","sp_id","sp_smid",$smid)->sp_id;
		$data['ftype'] = $_POST['ftype'];
		$data['fees']  = $_POST['fees'];
		if($data['ftype'] == 'semfee'){
			$data['fees'] = $_POST['totalfees'];
			
		}
		
		$data['refNo']  = '';
		$data['bank']  = '';
		$data['amount']  = '';
		
		
		if(isset($_POST['sem_payment'])){
			$this->form_validation->set_rules('fees','Payble fees','trim|xss_clean|numeric|required');
			$this->form_validation->set_rules('refNo','Reference number','trim|xss_clean|required');
            		$this->form_validation->set_rules('bank','Bank detail','trim|xss_clean|required');
            		$this->form_validation->set_rules('amount','Amount','trim|xss_clean|required');
            		$this->form_validation->set_rules('ftype','fees type','trim|xss_clean|required');

			if($_POST){
				$data['refNo'] = $this->input->post('refNo', TRUE);
				$data['bank']  = $this->input->post('bank', TRUE);
				$data['amount']= $this->input->post('amount', TRUE);
				$data['ftype']=$this->input->post('ftype', TRUE);
				$data['fees']=$this->input->post('fees', TRUE);
				
			}

			if($this->form_validation->run() == FALSE){			
				//redirect('request/fees_deposit_payment');
				$this->load->view('request/sem_fee_offline',$data);
				return;
			}else{	
				//start the transaction
       	 			$this->db->trans_begin();		
				//update student fees table
				if(($_POST['amount']) == ($_POST['fees']))	
				{	
					//foreach($spid as $stuspid){
					$offline = array(
						'sfee_smid'		=>	$smid,
						'sfee_spid'		=>	$spid,
						'sfee_referenceno'   	=>	$_POST['refNo'],
                				'sfee_bankname'  	=>	$_POST['bank'],
                				'sfee_feeamount'  	=>	$_POST['amount'],
                				'sfee_feename'   	=>	$_POST['ftype'],
						'sfee_paymentmethod'    =>	'Offline'
                				);
						$fee = $this->commodel->insertrec('student_fees', $offline);
					//}
				}
				else {				
					$message = '<h3>The payble fees and fees deposit in bank should be equal.</h3>';
	  				$this->session->set_flashdata('msg',$message);
					$this->logger->write_logmessage("update", "Offline payment  fees match error.");
	                    		$this->logger->write_dblogmessage("update", "Offline payment fees match error." );
					//print_r($data);
					$this->load->view('request/sem_fee_offline',$data);
					return;
				     }
				
				$this->logger->write_logmessage("update", "semester registration fees update in fees_master table.");
                    		$this->logger->write_dblogmessage("update", "semester registration fees update in fees_master table." );
				
				//make transaction complete
        			$this->db->trans_complete();
			
	 			//check if transaction status TRUE or FALSE
        			if ($this->db->trans_status() === FALSE) {
				
            			//if something went wrong, rollback everything
            				$this->db->trans_rollback();
					$this->logger->write_logmessage("update", "Student registration not update record in student_master table.");
                    			$this->logger->write_dblogmessage("update", "Student registration not update record in student_master table.");
					$this->load->view('request/sem_fee_offline',$data);
					//redirect('request/stufeesdetail');
           				//return FALSE;
      				 } else {	
            				//if everything went right, commit the data to the database
           				$this->db->trans_commit();

					//if sucess send mail to user with login details 
					$email=$this->commodel->get_listspfic1("student_master","sm_email","sm_id",$smid)->sm_email;
					$name=$this->commodel->get_listspfic1("student_master","sm_fname","sm_id",$smid)->sm_fname;
		 					$sub='Student Fees Deposit' ;
                        				$mess="Your fees deposit .The email is ".$email." and name is ".$name ;
                	       				$mails = $this->mailmodel->mailsnd($email, $sub, $mess);
							 //  mail flag check 			
							if($mails){
                        					$error[] ="At row sufficient data and mail sent sucessfully";
                        					$this->logger->write_logmessage("insert","semester registration fees submitted", "record added successfully for.".$name ." ".$email);
		      						$this->logger->write_dblogmessage("insert","semester registration fees submitted", "record added successfully for.".$name ." ".$email);
				    			}
							else{
        		       					$error[] ="At row sufficient data and mail does not sent";
		                				$this->logger->write_logmessage("insert"," semester registration fees not submitted", "record not added successfully for.".$name ." ".$email ." and mail does sent");
								$this->logger->write_dblogmessage("insert"," semester registration fees not submitted ", "record not added successfully for.".$name ." ".$email." and mail does sent");
			   				}

			 		$message = '<h3>Your offline payment successfull done.</h3>';
	  				$this->session->set_flashdata('msg',$message);			
					$this->logger->write_logmessage("update", "Student registration successfull update record in student_master table");
                    			$this->logger->write_dblogmessage("update", "Student registration successfull update record in student_master table" );
				 	redirect('studenthome'); 
           		 		//return TRUE;
       			 		}
	
			}//first else close

		}//post if close

		$this->load->view('request/sem_fee_offline',$data);
	}

/**********************************************************Student Fees Deposit End*****************************************************************/


}

?>
