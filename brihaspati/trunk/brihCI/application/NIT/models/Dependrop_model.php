<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @name: Dependrop model
 * @author: Om Prakash (omprakashkgp@gmail.com)
 */

class Dependrop_model extends CI_Model
{

    function __construct() {
        parent::__construct();
        $this->load->database();
    }


    /*This function has been created for display the list of branch on the basis of program*/
    public function get_branchlist($pgid){
	$brlist = $this->commodel->get_listrow('program','prg_name', $pgid);
        $branch_data = $brlist->result();
        if(count($branch_data)>0){
                $pro_select_box = '';
                $pro_select_box.= '<option value="" selected="true" disabled="disabled">-------Select Branch --------';
                foreach($branch_data as $branch){
                        $pro_select_box.='<option value='.$branch->prg_id.'>'.$branch->prg_branch;
                }
                echo json_encode($pro_select_box);
        }
     }
	 /*This function has been created for display the list of program on the basis of program category*/
    public function get_programlist($pgid){
        $prlist = $this->commodel->get_listrow('program','prg_category', $pgid);
        $prg_data = $prlist->result();
        if(count($prg_data)>0){
                $pro_select_box = '';
                $pro_select_box.= '<option value="" selected="true" disabled="disabled">-------Select Branch --------';
                foreach($prg_data as $prg){
                        $pro_select_box.='<option value='.$prg->prg_id.'>'.$prg->prg_name.'('.$prg->prg_branch.')';
                }
                echo json_encode($pro_select_box);
        }
     }
		

	public function get_statelist($cid){
        $datawh=array('country_id' => $cid);
        $statelist=$this->common_model->get_listspficemore('states','id,name',$datawh);
        if(count($statelist)>0){
            $pro_select_box ='';
            $pro_select_box.= '<option value="" selected="true" disabled="disabled">------------Select states-----------';
            foreach($statelist as $slist){
                    $pro_select_box.='<option value='.$slist->id.'>'.$slist->name;
                }
        	echo json_encode($pro_select_box);

        }
    }

	public function get_citylist($citid){
        	$datawh=array('state_id' => $citid);
        	$citylist=$this->common_model->get_listspficemore('cities','id,name',$datawh);
        	if(count($citylist)>0){
            		$pro_select_box ='';
            		$pro_select_box.= '<option value="" selected="true" disabled="disabled">---------------Select cities--------------';
            		foreach($citylist as $clist){
            			$pro_select_box.='<option value='.$clist->id.'>'.$clist->name;
            		}
            		echo json_encode($pro_select_box);
        	}
    }	

     /* This function has been created for get list of Department on the basis of campus */
     public function getdeptlist_model($scid){
            //$deptcode=$this->commodel->get_listspfic1('org_profile', 'org_id', 'org_code', $scid)->org_id;
	    	
            $resultsc = $this->commodel->get_listrow('Department','dept_orgcode', $scid);
            $dept_data = $resultsc->result();
            if(count($dept_data)>0){
                $dept_select_box = '';
                $dept_select_box.= '<option value="">-------Select Department --------';
                foreach($dept_data as $dept){
                        $dept_select_box.='<option value='.$dept->dept_id.'>'.$dept->dept_name;
                }
                echo json_encode($dept_select_box);
            }
        }


     /*This function has been created for display teacher list on the basis of Department*/
     public function get_teacherlist($deptid){
        $tlist = $this->commodel->get_listrow('user_role_type','deptid', $deptid);
        $teacher_data = $tlist->result();
        if(count($teacher_data)>0){
                $tea_select_box = '';
                $tea_select_box.= '<option value="">-------Select Teacher --------';
                foreach($teacher_data as $tech){
                        if($tech->roleid == 2){
                        $tea_select_box.= '<option value='.$tech->userid.'>'.$this->loginmodel->get_listspfic1('userprofile', 'firstname', 'userid', $tech->userid)->firstname.' '.$this->loginmodel->get_listspfic1('userprofile', 'lastname', 'userid', $tech->userid)->lastname;
                        }
                }
                echo json_encode($tea_select_box);
        }
    }
    /*This function has been created for display paper name on the basis of subject */
    public function get_paperlist($subid){
        $subpaper = $this->commodel->get_listrow('subject_paper','subp_sub_id', $subid);
        $subpaper_data = $subpaper->result();
        if(count($subpaper_data)>0){
                $paper_select_box = '';
                $paper_select_box.= '<option value="">-------Select Paper Name --------';
                foreach($subpaper_data as $paper){
                        $paper_select_box.= '<option value='.$paper->subp_id.'>'.$paper->subp_name;
                }
                echo json_encode($paper_select_box);
        }
    }
                 
   /*This function has been created for display subject on the basis of program and branch */
    public function get_subjectlist($branchid){
        $subid=$this->commodel->get_listspfic1('subject_paper', 'subp_sub_id', 'subp_degree', $branchid)->subp_sub_id;
        $subject = $this->commodel->get_listrow('subject','sub_id', $subid);
        $subject_data = $subject->result();
        if(count($subject_data)>0){
                $sub_select_box ='';
                $sub_select_box.='<option value="">-------Select Subject Name --------';
                foreach($subject_data as $subj){
                        $sub_select_box.='<option value='.$subj->sub_id.'>'.$subj->sub_name.' ';
                }
                echo json_encode($sub_select_box);
        }
  }

 function __destruct() {
        $this->db->close();
    }
}

