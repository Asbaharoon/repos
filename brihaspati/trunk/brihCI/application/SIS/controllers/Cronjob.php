
<?php

 defined('BASEPATH') OR exit('No direct script access allowed');
 
/**
 * @name Cronjob.php
 * @author Nagendra Kumar Singh (nksinghiitk@gmail.com) Earned Leave, run 
 * @author Manorama Pal (palseema30@gmail.com) Autoretirement 
 */
 
class Cronjob extends CI_Controller
{

 
    function __construct() {
        parent::__construct();
        $this->load->model('Common_model',"commodel");
        $this->load->model('Login_model',"lgnmodel"); 
        $this->load->model('SIS_model',"sismodel");
//        if(empty($this->session->userdata('id_user'))) {
  //          $this->session->set_flashdata('flash_data', 'You don\'t have access!');
    //        redirect('welcome');
      //  }
    }


	public function run()
 	{
    		$this->load->library('CronRunner');
    		$cron = new CronRunner();
    		$cron->run();
 	}



    public function index(){
 	echo "This is cron page";       
	$this->autoretirement();
    }
    /* this function is created to check staff retire date for the staff retirement process */
    public function autoretirement(){ 
        $today = date("Y-m-d H:i:s");//please check and change according to the database format $today = date("Y/m/d H:i:s")or $today = date("Y-m-d H:i:s")
       // echo $today;die;
        $selectfield ="emp_id,emp_code,emp_userid,emp_desig_code,emp_dob,emp_dor,emp_doj,emp_leaving,emp_email";
        $whdata = array ('emp_leaving' => NULL,'emp_dor <=' =>$today);
        $dordata = $this->sismodel->get_listspficemore('employee_master',$selectfield,$whdata);
	$message='';
        if(!empty($dordata)){ 
            foreach($dordata as $combdata){
                $empdata = array(
                    'sre_empid' => $combdata->emp_id,
                    'sre_empcode' => $combdata->emp_code,
                    'sre_empemailid' => $combdata->emp_email,
                    'sre_doj'  => $combdata->emp_doj,
                    'sre_dor'  => $combdata->emp_dor,
                    'sre_reason' =>'superannuation' ,
                    'sre_reasondate' =>$today,
                    'sre_remark' => '',	
                    'sre_creatorid' => $this->session->userdata('username'),
                    'sre_creatordate' => date('y-m-d'),
                    'sre_modifierid' => $this->session->userdata('username'), 
                    'sre_modifydate' => date('y-m-d')
                );
                $retupdateflag=$this->sismodel->insertrec('staff_retirement', $empdata);
                if(!$retupdateflag)
                {
                    $this->logger->write_logmessage("error"," Trying to insert in  staff retirement record", "staff retirement record is not added. Employee PF No' = ".$combdata->emp_code  );
                    $this->logger->write_dblogmessage("error","Trying to insert in  staff retirement record", "staff retirement record is not added. Employee PF No' = ".$combdata->emp_code  );
			$message = $message . "staff retirement record is not added. Employee PF No' = ".$combdata->emp_code ."<br>";
                }    
                $empup_data = array(
                  'emp_leaving' => 'superannuation' 
                );
                $empmasterflag=$this->sismodel->updaterec('employee_master', $empup_data, 'emp_id', $combdata->emp_id);
                if(!$empmasterflag){
                    $this->logger->write_logmessage("error","Error in update employee profile ", "Error in employee profile updation".$combdata->emp_code );
                    $this->logger->write_dblogmessage("error","Error in update employee profile", "Error in employee profile updation".$combdata->emp_code);
			$message = $message . "Error in employee profile updation. Employee PF No' = ".$combdata->emp_code ."<br>";
                }    
           	/*update staff position table on staff retirement*/
                $dept=$this->sismodel->get_listspfic1('employee_master', 'emp_dept_code', 'emp_id',$combdata->emp_id)->emp_dept_code;
		$desig=$this->sismodel->get_listspfic1('employee_master', 'emp_desig_code', 'emp_id',$combdata->emp_id)->emp_desig_code;
		//get the shown against post
		//if both are same then no change
		//else post value  copy to desig
		 //get the shown against post
                $post=$this->sismodel->get_listspfic1('employee_master', 'emp_post', 'emp_id',$combdata->emp_id)->emp_post;
		$postid=$this->commodel->get_listspfic1('designation', 'desig_id', 'desig_name',$post)->desig_id;
                //if both are same then no change
		if ($desig != $postid){
			$desig = $postid;
		}
                //else post value  copy to desig
                $worktype=$this->sismodel->get_listspfic1('employee_master', 'emp_worktype', 'emp_id',$combdata->emp_id)->emp_worktype;
                $emptype=$this->sismodel->get_listspfic1('employee_master', 'emp_type_code', 'emp_id',$combdata->emp_id)->emp_type_code;
                $empscid=$this->sismodel->get_listspfic1('employee_master', 'emp_scid', 'emp_id',$combdata->emp_id)->emp_scid;
                $empuocid=$this->sismodel->get_listspfic1('employee_master', 'emp_uocid', 'emp_id',$combdata->emp_id)->emp_uocid;
                $empschmid=$this->sismodel->get_listspfic1('employee_master', 'emp_schemeid', 'emp_id',$combdata->emp_id)->emp_schemeid;
                $upspdata_flag=$this->sismodel->updatestaffposition2($empscid,$empuocid,$dept,$desig,$worktype,$emptype,$empschmid);
                if(!$upspdata_flag){
                    $this->logger->write_logmessage("error","Error in update staff position ", "Error in staff position record update" .$combdata->emp_code);
                    $this->logger->write_dblogmessage("error","Error in update staff position", "Error in staff position record update".$combdata->emp_code);
			$message = $message . "Error in staff position record update. Employee PF No' = ".$combdata->emp_code ."<br>";
                }
                else{
                    $this->logger->write_logmessage("update","update staff position ", "staff position record updated successfully ".$combdata->emp_code);
                    $this->logger->write_dblogmessage("update","staff position", "staff position record updated successfully".$combdata->emp_code);
			$message = $message . "staff position record updated successfully. Employee PF No' = ".$combdata->emp_code ."<br>";
                }
 
            }//foreach
        }//ifdordata
        else{
            $this->logger->write_logmessage("error"," Trying to insert in  staff retirement record", "staff retirement record is not added may be list is empty.");
            $this->logger->write_dblogmessage("error","Trying to insert in  staff retirement record", "staff retirement record is not added may be list is empty.");
	    $message = $message . "staff retirement record is not added may be list is empty. <br>";
        }
		$this->session->set_flashdata('flash_data', $message);	
		redirect('home');
        
    }

    	/* earned leave*/
	public function earnedleave() {
        	$letype = "Earned Leave";
                $earn=15;
                //  get the current year
                $cyear = date('Y');
                //  get the current month
                $cmonth = date('m');
                //  get the current day
                $cday = date('d');
                //if(($cmonth==12)&&($cday==31))
                //{
                	//get the list of users
                        $rest=$this->sismodel->get_orderlistspficemore('employee_master','emp_email','','');
                        foreach($rest as $rw)
                        {
                                $email = $rw->emp_email;
                                $eid = $this->logmodel->get_listspfic1('edrpuser','id','username',$email)->id;
                                //check the entry exist for this user
                                $whdata = array('le_userid'=>$eid,'le_type'=>$letype,'le_year'=>$cyear);
                                $is_exist = $this->sismodel->isduplicatemore('leave_earned',$whdata);
                        	if(!($is_exist))
                        	{
          				// check for earned leave  used this year or not if yes then calculate remaining
                                        $lid=$this->sismodel->get_listspfic1('leave_type_master','lt_id','lt_name',$letype)->lt_id;
                                        // get master values on the basis of leave type
                                        $msval=$this->sismodel->get_listspfic1('leave_type_master','lt_value','lt_id',$lid)->lt_value;
                                        // get the academic year
                                        $cyear = date('Y');
                                        // get the sum of leave taken on the basis of year, user, leave type
                                        $whdata1 = array('la_status'=>1,'la_userid' => $eid,'la_type'=>$lid, 'la_year'=>$cyear);
                                        // $res= $this->sismodel->get_listspficemore('leave_apply','sum(la_taken) as latk',$whdata1);
                                        $res= $this->sismodel->get_listspficemore('leave_apply','sum(la_days) as ldays',$whdata1);
                                        foreach ($res as $row1)
                                        {
                                                //$ltval = $row1->latk;
                                                $ltval = $row1->ldays;
                                        }
                                        // calculte the leave remaining = master value - taken value
                                        $lrmain = $msval - $ltval;
                                        // create data array for this user
                                        $data = array(
                                                'le_type'=>$letype,
                                                'le_userid' => $eid ,
                                                'le_year' => $cyear,
                                                'le_earned'=> $lrmain
                                        );
					$leaveearned=$this->sismodel->insertrec('leave_earned', $data);
					if(!$retupdateflag)
                			{
						$this->logger->write_logmessage("error"," Trying to insert in  Leave Earned record", "Leave Earned record is not added may be list is empty. Employee Userid = ".$eid." Year ".$cyear ." Remaiing E L ".$lrmain);
						$this->logger->write_dblogmessage("error","Trying to insert in  Leave Earned record", "Leave Earned record is not added may be list is empty.Employee Userid = ".$eid." Year ".$cyear ." Remaiing E L ".$lrmain);
					}
                                //        $this->lrmain=$lrmain;
                                }
        		}
                //}
 //               $this->result = $this->sismodel->get_list('leave_earned');
   //             $this->load->view('leavemgmt/earnedleave');
     //           return;
	}
   
}    
    

