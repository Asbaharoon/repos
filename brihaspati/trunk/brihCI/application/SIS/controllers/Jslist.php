<?php

defined('BASEPATH') OR exit('No direct script access allowed');
 
/**
 * @name Jslist.php
 * @author Nagendra Kumar Singh nksinghiitk@gmail.com
 */

class Jslist extends CI_Controller
{
 
    	function __construct() {
        	parent::__construct();

        	$this->load->model('Common_model',"commodel");
        	$this->load->model('Login_model',"lgnmodel"); 
        	$this->load->model('SIS_model',"sismodel");
        	$this->load->model('Dependrop_model',"depmodel");

        	if(empty($this->session->userdata('id_user'))) {
            		$this->session->set_flashdata('flash_data', 'You don\'t have access!');
            		redirect('welcome');
        	}
    	}
 
    	public function index(){
    	}

	/* This function has been created for get list of Designation on the basis of  selected Working type */
	public function getwdesiglist_mulsel(){
                $groups = $this->input->post('wtype');

                $datawh=array('desig_type' => $groups);
                $rlid=$this->session->userdata('id_role');
                $usrid=$this->session->userdata('id_user');

                $whorder = "desig_name asc";
                $grp_data = $this->commodel->get_orderlistspficemore('designation','desig_id,desig_name,desig_code',$datawh,$whorder);
                //$grp_data = $this->commodel->get_listspficemore('designation','desig_id,desig_name,desig_code',$datawh);
                $desig_select_box =array();
                $desig_select_box ='';
           //     $desig_select_box.='<option value=null>--Select Designation--';
                $desig_select_box.='<option value='.All.'>'.All. ' ';
                if(count($grp_data)>0){
                        foreach($grp_data as $grprecord){
                                $desig_select_box.='<option value='.$grprecord->desig_id.'>'.$grprecord->desig_name.'('. $grprecord->desig_code .')'.' ';
                        }
                }
                echo json_encode($desig_select_box);
        }


	/* This function has been created for get list of Designation on the basis of  selected Working type */
        public function getwdesiglist(){
                $groups = $this->input->post('wtype');

                $datawh=array('desig_type' => $groups);
		$rlid=$this->session->userdata('id_role');
       	        $usrid=$this->session->userdata('id_user');

		$whorder = "desig_name asc";
        	$grp_data = $this->commodel->get_orderlistspficemore('designation','desig_id,desig_name,desig_code',$datawh,$whorder);
                //$grp_data = $this->commodel->get_listspficemore('designation','desig_id,desig_name,desig_code',$datawh);
                $desig_select_box =array();
                $desig_select_box ='';
                $desig_select_box.='<option value=null>--Select Designation--';
		$desig_select_box.='<option value='.All.'>'.All. ' ';
	        if(count($grp_data)>0){
	                foreach($grp_data as $grprecord){
                        	$desig_select_box.='<option value='.$grprecord->desig_id.'>'.$grprecord->desig_name.'('. $grprecord->desig_code .')'.' ';
                	}
        	}
                echo json_encode($desig_select_box);
	}

    	/* This function has been created for get list of Designation on the basis of  selected Group */
    	public function getgdesiglist(){
        	$groups = $this->input->post('group');
        	$datawh=array('desig_group' => $groups);
		$whorder = ("desig_name asc");
                $grp_data = $this->commodel->get_orderlistspficemore('designation','desig_id,desig_name,desig_code',$datawh,$whorder);
//	        $grp_data = $this->commodel->get_listspficemore('designation','desig_id,desig_name,desig_code',$datawh);
        	$desig_select_box ='';
	        $desig_select_box.='<option value="">--Select Designation--';
        	foreach($grp_data as $grprecord){
	        	$desig_select_box.='<option value='.$grprecord->desig_id.'>'.$grprecord->desig_name.'('. $grprecord->desig_code .')'.' ';
        	}
        	echo json_encode($desig_select_box);
    	}

    	/* This function has been created for get list of Designation on the basis of  selected Group and working type*/
    	public function getgwdesiglist(){
		$combid= $this->input->post('gwt');
		$parts = explode(',',$combid);
	        $datawh=array('desig_group' => $parts[0],'desig_type' => $parts[1]);
		$whorder = ("desig_name asc");
                $grp_data = $this->commodel->get_orderlistspficemore('designation','desig_id,desig_name,desig_code',$datawh,$whorder);
//        	$grp_data = $this->commodel->get_listspficemore('designation','desig_id,desig_name,desig_code',$datawh);
	        $desig_select_box ='';
        	$desig_select_box.='<option value="">--Select Designation--';
	        foreach($grp_data as $grprecord){
        		$desig_select_box.='<option value='.$grprecord->desig_id.'>'.$grprecord->desig_name.'('. $grprecord->desig_code .')'.' ';
        	}
        	echo json_encode($desig_select_box);
	}    

	 /* This function has been created for get list of Pay scales on the basis of  selected Group, working type and designation*/
        public function getgwdesigpaylist(){
                $combid= $this->input->post('gwtdesig');
                $parts = explode(',',$combid);
                $datawh=array('desig_group' => $parts[0],'desig_type' => $parts[1],'desig_id'=> $parts[2]);
                $grp_data = $this->commodel->get_listspficemore('designation','desig_id,desig_payscale',$datawh);
                $desig_select_box ='';
                $desig_select_box.='<option value="">--Select Payscale--';
                foreach($grp_data as $grprecord){
			$payband=$this->sismodel->get_listspfic1('salary_grade_master','sgm_name','sgm_id',$grprecord->desig_payscale)->sgm_name;
        	        $pay_max=$this->sismodel->get_listspfic1('salary_grade_master','sgm_max','sgm_id',$grprecord->desig_payscale)->sgm_max;
	                $pay_min=$this->sismodel->get_listspfic1('salary_grade_master','sgm_min','sgm_id',$grprecord->desig_payscale)->sgm_min;
                	$gardepay=$this->sismodel->get_listspfic1('salary_grade_master','sgm_gradepay','sgm_id',$grprecord->desig_payscale)->sgm_gradepay;
	                $gardepayn=$this->sismodel->get_listspfic1('salary_grade_master','sgm_level','sgm_id',$grprecord->desig_payscale)->sgm_level;
        	        $pb=$payband."(".$pay_min."-".$pay_max.")".$gardepay." ".$gardepayn;

                        //$desig_select_box.='<option value='.$grprecord->desig_id.'>'.$grprecord->desig_payscale.'' ;
                        $desig_select_box.='<option value='.$grprecord->desig_payscale.'>'.$pb.'' ;
                }
                echo json_encode($desig_select_box);
        }

	 /* This function has been created for get list of Pay scales on the basis of  selected working type and group*/
        public function getwgrppaylist(){
		$combid= $this->input->post('wgrp');
                $parts = explode(',',$combid);
                $datawh=array('sgm_wt'=> $parts[1],'sgm_group'=> $parts[0]);
	        $ps_data = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_name,sgm_max,sgm_min,sgm_gradepay,sgm_level',$datawh);
                $ps_select_box ='';
                $ps_select_box.='<option value="">--Select Payscale--';
		if(!empty($ps_data)){
			foreach($ps_data as $psrecord){
				$sgmgrdpay=$psrecord->sgm_gradepay;
				if($sgmgrdpay<1){
					$sgmgrdpay='';
				}
        	                $ps_select_box.='<option value='.$psrecord->sgm_id.'>'.$psrecord->sgm_name.'('.$psrecord->sgm_min.' - '.$psrecord->sgm_max.')'.$sgmgrdpay.$psrecord->sgm_level.'' ;
                	}
		} //if close
               // echo json_encode($combid);
                echo json_encode($ps_select_box);
        }

	 /* This function has been created for get list of Pay scales on the basis of  selected working type and pay commission*/
        public function getwpcpaylist(){
                $combid= $this->input->post('wpc');
                $parts = explode(',',$combid);
                $datawh=array();
		if($parts[1] == '6th'){
			$datawh['sgm_pc'] = "6th";
		}else{
			$datawh['sgm_pc'] = "7th";
		}
	        $ps_data = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_name,sgm_max,sgm_min,sgm_gradepay,sgm_level',$datawh);
                $ps_select_box ='';
                $ps_select_box.='<option value="">--Select Payscale--';
		if(!empty($ps_data)){
	                foreach($ps_data as $psrecord){
        	                $ps_select_box.='<option value='.$psrecord->sgm_id.'>'.$psrecord->sgm_name.'('.$psrecord->sgm_min.' - '.$psrecord->sgm_max.')'.$psrecord->sgm_gradepay.$psrecord->sgm_level.'' ;
                	}
		} //if close
                echo json_encode($ps_select_box);
        }

	/* For payscale dispaly in payroll profile */
	public function getpayscleagp(){
		$values=array();
                $combid= $this->input->post('wtpcl');
                $parts = explode(',',$combid);
//                print_r($parts); die();
                $datawh=array();
		$datawh['sgm_wt']=$parts[0];	
                if($parts[1] == '6th'){
                        $datawh['sgm_pc'] = "6th";
                }else{
                        $datawh['sgm_pc'] = "7th";
                }
//		$datawh['sgm_level']=$parts[2];	
		$datawh['sgm_id']=$parts[2];	
//		print_r($datawh);die();
                $psdata = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_max,sgm_min,sgm_gradepay',$datawh);
		if(count($psdata)>0){
	        	foreach($psdata as $detail){
				$range=$detail->sgm_min." - ".$detail->sgm_max;
				$agp=$detail->sgm_gradepay;
				array_push($values,$range,$agp);
			}
		}else{
                        $mess="Please select the valid values or check setup values";
                        array_push($values,$mess);
                }
                echo json_encode($values);
        }


    /* This function has been created for get the plan, non plan, ugc, ICAR, GOI shown against position */
    public function getemppnp(){
        $combval = $this->input->post('combfive');
        $parts = explode(',',$combval);
        $datawh=array('sp_campusid' => $parts[0],'sp_uo' => $parts[1], 'sp_dept' => $parts[2],'sp_emppost' => $parts[3], 'sp_tnt' => $parts[4]);
        $emptype_data = $this->sismodel->get_listspficemore('staff_position', 'sp_plan_nonplan',$datawh);
        $emptype_select_box ='';
        $emptype_select_box.='<option value="">------ Select Plan  Non Plan -----------';
        if(!empty($emptype_data)){
            foreach($emptype_data as $empdata){
                $emptype_select_box.='<option value='.$empdata->sp_plan_nonplan.'>'.$empdata->sp_plan_nonplan.' ';
            }//foreach
        } //if close   
        echo json_encode($emptype_select_box);
    }
   
	/* get the dept list on the basis of UO */
	public function getdeptlist(){
		$combid= $this->input->post('worktypeuo');
        	$parts = explode(',',$combid);
       // echo "sc===".$combid;
        	if($parts[1]!="All"){
            		$datawh=array('dept_uoid' => $parts[1]);
            	//	$datawh=array('emp_worktype' => $parts[0],'emp_uocid' => $parts[1]);
        	}
        	else{
            	//	$datawh=array('emp_worktype' => $parts[0]);
        	}
//      get_orderdistinctrecord($tbname,$selectfield,$whdata,$whorder)
        $whorder = 'dept_name asc';
	$comb_data = $this->commodel->get_orderlistspficemore('Department','dept_id,dept_name,dept_code',$datawh,$whorder);
//        $comb_data = $this->sismodel->get_orderdistinctrecord('employee_master','emp_dept_code',$datawh,$whorder);
        $dept_select_box =' ';
        $dept_select_box.='<option value=null>--Select Department--';
        $dept_select_box.='<option value='.All.'>'.All. ' ';
        if(count($comb_data)>0){
            foreach($comb_data as $detail){
//                $deptname=$this->commodel->get_listspfic1('Department', 'dept_name', 'dept_id',$detail->emp_dept_code)->dept_name;
  //              $deptcode=$this->commodel->get_listspfic1('Department', 'dept_code', 'dept_id',$detail->emp_dept_code)->dept_code;

    //            $dept_select_box.='<option value='.$detail->emp_dept_code.'>'.$deptname. '(' .$deptcode. ')'.' ';
                $dept_select_box.='<option value='.$detail->dept_id.'>'.$detail->dept_name. '(' .$detail->dept_code. ')'.' ';

            }
        }
        echo json_encode($dept_select_box);

	}

	public function getrentpayrange(){
                $pcom = $this->input->post('pcom');

                if($pcom == '6th'){
                        $gpr_select_box ='';
                        $gpr_select_box.='<option value=>-------Select Pay Range--------';
                        $gpr_select_box.='<option value=6000-10199>6000-10199';
                        $gpr_select_box.='<option value=10200-18599>10200-18599';
                        $gpr_select_box.='<option value=18600-1000000>18600-inf';
                }else{
                        $gpr_select_box ='';
                        $gpr_select_box.='<option value=>-------Select Pay Range--------';
                        $gpr_select_box.='<option value=18201-26200>18201-26200';
                        $gpr_select_box.='<option value=26201-48700>26201-48700';
                        $gpr_select_box.='<option value=48700-1000000>48700-inf';
                }
                echo json_encode($gpr_select_box);
        }


	 public function getccapayrange(){
                $pcom = $this->input->post('pcom');

                if($pcom == '6th'){
                        $gpr_select_box ='';
                        $gpr_select_box.='<option value=>-------Select Pay Range--------';
                        $gpr_select_box.='<option value=0-8000>0-8000';
                        $gpr_select_box.='<option value=8001-12000>8001-12000';
                        $gpr_select_box.='<option value=12001-16000>12001-16000';
                        $gpr_select_box.='<option value=16001-1000000>16001-inf';
                }else{
                        $gpr_select_box ='';
                        $gpr_select_box.='<option value=>-------Select Pay Range--------';
                        $gpr_select_box.='<option value=0-20600>0-20600';
                        $gpr_select_box.='<option value=20601-30800>20601-30800';
                        $gpr_select_box.='<option value=30801-41100>30801-41100';
                        $gpr_select_box.='<option value=41101-1000000>41101-inf';
                }
                echo json_encode($gpr_select_box);
        }



	public function getpayrange(){
		$pcom = $this->input->post('pcom');
		
		if($pcom == '6th'){
			$gpr_select_box ='';
                        $gpr_select_box.='<option value=>-------Select Pay Range--------';
			$gpr_select_box.='<option value=0-5299>0-5299';
			$gpr_select_box.='<option value=5300-6699>5300-6699';
			$gpr_select_box.='<option value=6700-8189>6700-8189';
			$gpr_select_box.='<option value=8190-9299>8190-9299';
			$gpr_select_box.='<option value=9300-10599>9300-10599';
			$gpr_select_box.='<option value=10600-11899>10600-11899';
			$gpr_select_box.='<option value=11900-13969>11900-13769';
			$gpr_select_box.='<option value=13770-14509>13770-14509';
			$gpr_select_box.='<option value=14510-15999>14510-15999';
			$gpr_select_box.='<option value=16000-17299>16000-17299';
			$gpr_select_box.='<option value=17300-19529>17300-19529';
			$gpr_select_box.='<option value=19530-20089>19530-20089';
			$gpr_select_box.='<option value=20090-21019>20090-21019';
			$gpr_select_box.='<option value=21020-21579>21020-21579';
			$gpr_select_box.='<option value=21580-22139>21580-22139';
			$gpr_select_box.='<option value=22140-24999>22140-24999';
			$gpr_select_box.='<option value=25000-1000000>25000-inf';
		}else{
			$gpr_select_box ='';
                        $gpr_select_box.='<option value=>-------Select Pay Range--------';
			$gpr_select_box.='<option value=0-13600>0-13600';
			$gpr_select_box.='<option value=13601-17200>13601-17200';
			$gpr_select_box.='<option value=17201-21000>17201-21000';
			$gpr_select_box.='<option value=21001-23900>21001-23900';
			$gpr_select_box.='<option value=23901-27200>23901-27200';
			$gpr_select_box.='<option value=27201-30600>27201-30600';
			$gpr_select_box.='<option value=30601-35400>30601-35400';
			$gpr_select_box.='<option value=35401-37300>35401-37300';
			$gpr_select_box.='<option value=37301-41100>37301-41100';
			$gpr_select_box.='<option value=41101-44500>41101-44500';
			$gpr_select_box.='<option value=44501-50200>44501-50200';
			$gpr_select_box.='<option value=50201-51600>50201-51600';
			$gpr_select_box.='<option value=51601-54000>51601-54000';
			$gpr_select_box.='<option value=54001-55500>54001-55500';
			$gpr_select_box.='<option value=55501-56900>55501-56900';
			$gpr_select_box.='<option value=56901-64200>56901-64200';
			$gpr_select_box.='<option value=64201-1000000>64201-inf';
		}
		echo json_encode($gpr_select_box);
	}


	public function getpayband(){
                $wtype = $this->input->post('pcwt');
                $parts = explode(',',$wtype);
       // echo json_encode("this is testing----".$wtype);
                if(($parts[0] == 'Teaching')&&($parts[1] == '6th')){
                    $datawh=array('sgm_wt' => $parts[0],'sgm_pc' => $parts[1]);
                    $psdata = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_name,sgm_level',$datawh);
                    $pb_select_box ='';
                    $pb_select_box.='<option value=>-------Select Pay Band--------';
                    if(!empty($psdata)){
                        
                        foreach($psdata as $emppscale){
                            $pb_select_box.='<option value='.$emppscale->sgm_id.'>'.$emppscale->sgm_name.' ';
                        }//foreach
                        
                        
                        /*$pb_select_box.='<option value=UGC1> UGC1';
                        $pb_select_box.='<option value=UGC2> UGC2';
                        $pb_select_box.='<option value=UGC3> UGC3';
                        $pb_select_box.='<option value=UGC4> UGC4';
                        $pb_select_box.='<option value=UGC5> UGC5';
                        $pb_select_box.='<option value=HGP> HGP';
                        $pb_select_box.='<option value=Fixed> Fixed';*/
                        
                    }
                }
                elseif(($parts[0] == 'Non Teaching')&&($parts[1] == '6th')){
                    
                    $datawh=array('sgm_wt' => $parts[0],'sgm_pc' => $parts[1]);
                    $psdatant = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_name,sgm_max,sgm_min,sgm_gradepay,sgm_level',$datawh);
                    $pb_select_box ='';
                    $pb_select_box.='<option value= >-------Select Pay Band--------';
                    if(!empty($psdatant)){
                        
                        foreach($psdatant as $emppscalent){
                            $pb_select_box.='<option value='.$emppscalent->sgm_id.'>'.$emppscalent->sgm_name.' ';
                        }//foreach
                        
                    }
                       /* $pb_select_box.='<option value=PB1A> PB1A';
                        $pb_select_box.='<option value=PB1> PB1';
                        $pb_select_box.='<option value=PB2> PB2';
                        $pb_select_box.='<option value=PB3> PB3';
                        $pb_select_box.='<option value=PB4> PB4';*/
                }else{
                        $pb_select_box ='';
                }
                echo json_encode($pb_select_box);
        }

        public function getlevelpay(){
                $wtype = $this->input->post('wt','');
                $parts = explode(',',$wtype);
                
               // echo json_encode("this is testing----".$parts[0],$parts[1],$wtype);
                             
                $lpb_select_box ='';
                $lpb_select_box.='<option value=>-------Select Level of Pay -------';
                
                if($parts[1] == 'Teaching'){
                    //echo json_encode("this is if===testing----".$wtype);
                    
                    $datawh=array('sgm_pc'=>$parts[0],'sgm_wt' => $parts[1]);
                    $leveldata = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_level',$datawh);
                   
                    if(!empty($leveldata)){
                        
                        foreach( $leveldata  as $emplevel){
                            $lpb_select_box.='<option value='.$emplevel->sgm_id.'>'.$emplevel->sgm_level.' ';
                        }//foreach
                        
                    }
                    
                }
		else{
                   // echo json_encode("this is else===testing----");
                   
                    $datawh=array('sgm_pc'=>$parts[0]);
                    $leveldata = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_level',$datawh);
                    if(!empty($leveldata)){
                        foreach($leveldata  as $emplevel){
                            $lpb_select_box.='<option value='.$emplevel->sgm_id.'>'.$emplevel->sgm_level.' ';
                        }//foreach
                        
                    }
                    
                }
                echo json_encode($lpb_select_box);
        }

	public function getpaybandi(){
                $wtype = $this->input->post('pcwt');
                $parts = explode(',',$wtype);
       // echo json_encode("this is testing----".$wtype);
                if(($parts[0] == 'Teaching')&&($parts[1] == '6th')){
                   // $datawh=array('sgm_wt' => $parts[0],'sgm_pc' => $parts[1]);
                  //  $psdata = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_name,sgm_level',$datawh);
                    $pb_select_box ='';
                    $pb_select_box.='<option value=>-------Select Pay Band--------';
                   // if(!empty($psdata)){
                        
                      //  foreach($psdata as $emppscale){
                       //     $pb_select_box.='<option value='.$emppscale->sgm_id.'>'.$emppscale->sgm_name.' ';
                       // }//foreach
                        
                        $pb_select_box.='<option value=UGC1> UGC1';
                        $pb_select_box.='<option value=UGC2> UGC2';
                        $pb_select_box.='<option value=UGC3> UGC3';
                        $pb_select_box.='<option value=UGC4> UGC4';
                        $pb_select_box.='<option value=UGC5> UGC5';
                        $pb_select_box.='<option value=HGP> HGP';
                        $pb_select_box.='<option value=Fixed> Fixed';
                        
                  //  }
                }
                elseif(($parts[0] == 'Non Teaching')&&($parts[1] == '6th')){
                    
                  //  $datawh=array('sgm_wt' => $parts[0],'sgm_pc' => $parts[1]);
                    //$psdatant = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_name,sgm_max,sgm_min,sgm_gradepay,sgm_level',$datawh);
                    $pb_select_box ='';
                    $pb_select_box.='<option value= >-------Select Pay Band--------';
                   // if(!empty($psdatant)){
                        
                     //   foreach($psdatant as $emppscalent){
                       //     $pb_select_box.='<option value='.$emppscalent->sgm_id.'>'.$emppscalent->sgm_name.' ';
                      //  }//foreach
                        
                  //  }
                        $pb_select_box.='<option value=PB1A> PB1A';
                        $pb_select_box.='<option value=PB1> PB1';
                        $pb_select_box.='<option value=PB2> PB2';
                        $pb_select_box.='<option value=PB3> PB3';
                        $pb_select_box.='<option value=PB4> PB4';
       //         }else{
                //        $pb_select_box ='';
                }
                echo json_encode($pb_select_box);
        }

        public function getlevelpayi(){
                $wtype = $this->input->post('wt','');
             //   $parts = explode(',',$wtype);
                
               // echo json_encode("this is testing----".$parts[0],$parts[1],$wtype);
                             
                $lpb_select_box ='';
                $lpb_select_box.='<option value=>-------Select Level of Pay -------';
                if($wtype == 'Teaching'){
      //                  $lpb_select_box ='';
//                        $lpb_select_box.='<option value=>-------Select Level of Pay -------';
  //                      $lpb_select_box.='<option value=Level10> Level10';
          //              $lpb_select_box.='<option value=Level11> Level11';
        //                $lpb_select_box.='<option value=Level12> Level12';
              //          $lpb_select_box.='<option value=Level13A> Level13A';
            //            $lpb_select_box.='<option value=Level14> Level14';
                //        $lpb_select_box.='<option value=Level15> Level15';
                  //      $lpb_select_box.='<option value=Fixed> Fixed';
 
    //            if($parts[1] == 'Teaching'){
                    //echo json_encode("this is if===testing----".$wtype);
 		        $lpb_select_box.='<option value=Level10> Level10';
                        $lpb_select_box.='<option value=Level11> Level11';
                        $lpb_select_box.='<option value=Level12> Level12';
                        $lpb_select_box.='<option value=Level13A> Level13A';
                        $lpb_select_box.='<option value=Level14> Level14';
                        $lpb_select_box.='<option value=Level15> Level15';
                        $lpb_select_box.='<option value=Fixed> Fixed';
             
       //             $datawh=array('sgm_pc'=>$parts[0],'sgm_wt' => $parts[1]);
         //           $leveldata = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_level',$datawh);
                   
           //         if(!empty($leveldata)){
                        
             //           foreach( $leveldata  as $emplevel){
               //             $lpb_select_box.='<option value='.$emplevel->sgm_id.'>'.$emplevel->sgm_level.' ';
                 //       }//foreach
                        
                   // }
                    
                }
		else{
                   // echo json_encode("this is else===testing----");
      //                else{
        //                $lpb_select_box ='';
          //              $lpb_select_box.='<option value=>-------Select Level of Pay -------';
                        $lpb_select_box.='<option value=Level1> Level1';
                        $lpb_select_box.='<option value=Level2> Level2';
                        $lpb_select_box.='<option value=Level3> Level3';
                        $lpb_select_box.='<option value=Level4> Level4';
                        $lpb_select_box.='<option value=Level5> Level5';
                        $lpb_select_box.='<option value=Level6> Level6';
                        $lpb_select_box.='<option value=Level7> Level7';
                        $lpb_select_box.='<option value=Level8> Level8';
                        $lpb_select_box.='<option value=Level9> Level9';
                        $lpb_select_box.='<option value=Level10> Level10';
                        $lpb_select_box.='<option value=Level11> Level11';
                        $lpb_select_box.='<option value=Level12> Level12';
                        $lpb_select_box.='<option value=Level13> Level13';
                        $lpb_select_box.='<option value=Level14> Level14';
                        $lpb_select_box.='<option value=Level15> Level15';
                        $lpb_select_box.='<option value=Level16> Level16';
                        $lpb_select_box.='<option value=Level17> Level17';
                        $lpb_select_box.='<option value=Level18> Level18';
                        $lpb_select_box.='<option value=Level19> Level19';
                        $lpb_select_box.='<option value=Level20> Level20';
                        $lpb_select_box.='<option value=Level21> Level21';
                        $lpb_select_box.='<option value=Level22> Level22';
                        $lpb_select_box.='<option value=Level23> Level23';
                        $lpb_select_box.='<option value=Level24> Level24';
                        $lpb_select_box.='<option value=Level25> Level25';
                        $lpb_select_box.='<option value=Level26> Level26';
                        $lpb_select_box.='<option value=Level27> Level27';
                        $lpb_select_box.='<option value=Level28> Level28';
                        $lpb_select_box.='<option value=Level29> Level29';
                        $lpb_select_box.='<option value=Level30> Level30';
                        $lpb_select_box.='<option value=Level31> Level31';
                        $lpb_select_box.='<option value=Level32> Level32';
             
    //                $datawh=array('sgm_pc'=>$parts[0]);
  //                  $leveldata = $this->sismodel->get_listspficemore('salary_grade_master','sgm_id,sgm_level',$datawh);
//                    if(!empty($leveldata)){
                       // foreach($leveldata  as $emplevel){
                      //      $lpb_select_box.='<option value='.$emplevel->sgm_id.'>'.$emplevel->sgm_level.' ';
                    //    }//foreach
                        
                  //  }
                    
                }
                echo json_encode($lpb_select_box);
        }

	public function getempuname(){
	        $values=array();
        	$pfno= $this->input->post('emplypfno');
	        $empid=$this->sismodel->get_listspfic1('employee_master', 'emp_id', 'emp_code',$pfno)->emp_id;
	        $empname=$this->sismodel->get_listspfic1('employee_master', 'emp_name', 'emp_code',$pfno)->emp_name;
		if(!empty($empname)){
				array_push($values, $empname,$empid);
		}
		else{
			$mess="Please enter the valid PF Number";
			array_push($values,$mess);
		}
		echo json_encode($values);
	}

	public function getemppdata(){
	        $values=array();
        	$pfno= $this->input->post('emplypfno');

		$empdeptid=$this->sismodel->get_listspfic1('employee_master', 'emp_dept_code', 'emp_code',$pfno)->emp_dept_code;
        	$uname=$this->session->userdata('username');
        	$ssiondeptid=$this->session->userdata('id_dept');
	      	if(($empdeptid != $ssiondeptid)&&((strcasecmp($uname,"admin"))!=0)&&((strcasecmp($uname,"payrolladmin"))!=0)){
        	      	$mess="You do not have the right to access detial of this PF Number";
                	array_push($values,$mess);
	      	}else{

	        $empid=$this->sismodel->get_listspfic1('employee_master', 'emp_id', 'emp_code',$pfno)->emp_id;
       // echo "pfno---".$pfno;
        	$emp_data=$this->sismodel->get_listrow('employee_master','emp_code',$pfno);
	        $empdetail = $emp_data->result();
        	if(count($empdetail)>0){
			 foreach($empdetail as $detail){
		                $campus=$this->commodel->get_listspfic1('study_center', 'sc_name', 'sc_id',$detail->emp_scid)->sc_name;
                		$uocname=$this->lgnmodel->get_listspfic1('authorities', 'name', 'id',$detail->emp_uocid)->name;
		                $deptname=$this->commodel->get_listspfic1('Department', 'dept_name', 'dept_id',$detail->emp_dept_code)->dept_name;
		                $schme=$this->sismodel->get_listspfic1('scheme_department', 'sd_name', 'sd_id',$detail->emp_schemeid)->sd_name;
				$designame=$this->commodel->get_listspfic1('designation', 'desig_name', 'desig_id',$detail->emp_desig_code)->desig_name;
		                $empname=$detail->emp_name;
				$ddo=$this->sismodel->get_listspfic1('ddo','ddo_name','ddo_id',$detail->emp_ddoid)->ddo_name;
				$hragrade = $this->sismodel->get_listspfic1('employee_master_support','ems_hragrade','ems_empid',$empid)->ems_hragrade;
				$ccagrade = $this->sismodel->get_listspfic1('employee_master_support','ems_ccagrade','ems_empid',$empid)->ems_ccagrade;
				array_push($values, $campus,$uocname,$deptname,$schme,$ddo,$detail->emp_worktype,$designame,$empname,$hragrade,$ccagrade,$empid);
			}
		}
		else{
			$mess="Please enter the valid PF Number";
			array_push($values,$mess);
		}
		}//dept check else
		//implode("+",$values);
		echo json_encode($values);
	}

 
    /***** This function has been created for get the employee detail by pf no ********************************/
    public function getempdata(){
        $this->orgcode=$this->commodel->get_listspfic1('org_profile','org_code','org_id',1)->org_code;
        $this->campus=$this->commodel->get_listspfic2('study_center','sc_id','sc_name','org_code',$this->orgcode);
        $this->uoc=$this->lgnmodel->get_list('authorities');
        $pfno= $this->input->post('emplypfno');
        $emp_data=$this->sismodel->get_listrow('employee_master','emp_code',$pfno);
        $empdetail = $emp_data->result();
        if(count($empdetail)>0){
            foreach($empdetail as $detail){
                $campus=$this->commodel->get_listspfic1('study_center', 'sc_name', 'sc_id',$detail->emp_scid)->sc_name;
                $campusbox='<option value='.$detail->emp_scid.'>'.$campus.' ';
                foreach($this->campus as $camdata){	
                 $campusbox.='<option  value='.$camdata->sc_id.'>'.$camdata->sc_name.''; 
                }            
                $uocname=$this->lgnmodel->get_listspfic1('authorities', 'name', 'id',$detail->emp_uocid)->name;
                $uocbox='<option value='.$detail->emp_uocid.'>'.$uocname.' ';
                foreach($this->uoc as $ucodata){	
                    $uocbox.='<option  value='.$ucodata->id.'>'.$ucodata->name.''; 
                }            
                $deptname=$this->commodel->get_listspfic1('Department', 'dept_name', 'dept_id',$detail->emp_dept_code)->dept_name;
                $deptcode=$this->commodel->get_listspfic1('Department', 'dept_code', 'dept_id',$detail->emp_dept_code)->dept_code;
                $deptbox='<option value='.$detail->emp_dept_code.'>'.$deptname."(".$deptcode.")".' ';
                
                $schme=$this->sismodel->get_listspfic1('scheme_department', 'sd_name', 'sd_id',$detail->emp_schemeid)->sd_name;
                $schmecd=$this->sismodel->get_listspfic1('scheme_department', 'sd_code', 'sd_id',$detail->emp_schemeid)->sd_code;
                $schmbox='<option value='.$detail->emp_schemeid.'>'.$schme."(".$schmecd.")".' ';
                
                /*$workbox='<option value='.$detail->emp_worktype.'>'.$detail->emp_worktype.' ';
                $workbox.='<option value='.'Teaching'.'>'.'Teaching'.' ';
                $workbox.='<option value='."Non Teaching".'>'."Non Teaching".' ';*/
                
                $designame=$this->commodel->get_listspfic1('designation', 'desig_name', 'desig_id',$detail->emp_desig_code)->desig_name;
                $desigcd=$this->commodel->get_listspfic1('designation', 'desig_code', 'desig_id',$detail->emp_desig_code)->desig_code;
                $desigbox='<option value='.$detail->emp_desig_code.'>'.$designame."(".$desigcd.")".' ';
                
                $empname=$detail->emp_name;
                $empbox='<option value='.$detail->emp_id.'>'.$detail->emp_name.' ';
                
                $ddocode=$this->sismodel->get_listspfic1('ddo', 'ddo_code', 'ddo_id',$detail->emp_ddoid)->ddo_code;
                $ddoname=$this->sismodel->get_listspfic1('ddo', 'ddo_name', 'ddo_id',$detail->emp_ddoid)->ddo_name;
                $ddobox='<option value='.$detail->emp_ddoid.'>'.$ddoname."(".$ddocode.")".' ';
                                
                $groupbox='<option value='.$detail->emp_group.'>'.$detail->emp_group.' ';
                
                $payband=$this->sismodel->get_listspfic1('salary_grade_master','sgm_name','sgm_id',$detail->emp_salary_grade)->sgm_name;
                $pay_max=$this->sismodel->get_listspfic1('salary_grade_master','sgm_max','sgm_id',$detail->emp_salary_grade)->sgm_max;
                $pay_min=$this->sismodel->get_listspfic1('salary_grade_master','sgm_min','sgm_id',$detail->emp_salary_grade)->sgm_min;
                $gardepay=$this->sismodel->get_listspfic1('salary_grade_master','sgm_gradepay','sgm_id',$detail->emp_salary_grade)->sgm_gradepay;
                
                $pgbox='<option value='.$detail->emp_salary_grade.'>'.$payband."(".$pay_min."-".$pay_max.")".$gardepay.' ';
               // array_push($values,$campusbox,$uocbox,$deptbox,$schmbox,$detail->emp_worktype,$desigbox,
                $values=$campusbox."^".$uocbox."^".$deptbox."^".$schmbox."^".$detail->emp_worktype."^".$desigbox.
                "^".$empbox."^".$detail->emp_post."^".$detail->emp_type_code."^".$ddobox."^".$groupbox."^".$pgbox;
                    //    ."^".$ddobox."^".$pgbox."^".$groupbox;
            }
            echo json_encode($values);
        }            
    }
    /****************************************closer employee detail by pf no *********************************/
    
     /***** This function has been created for get the employee detail by pf no for payroll profile ********************************/
    public function getempdata2(){
        $values=array();
        $pfno= $this->input->post('emplypfno');
 //       echo "pfno---".$pfno;
//	$empid=$this->sismodel->get_listspfic1('employee_master', 'emp_id', 'emp_code',$pfno)->emp_id;
	$empiddata=$this->sismodel->get_listspfic1('employee_master', 'emp_id', 'emp_code',$pfno);
	if(empty($empiddata)){
		$mess="Please enter the valid PF Number";
                array_push($values,$mess);
        }else{
	$empdeptid=$this->sismodel->get_listspfic1('employee_master', 'emp_dept_code', 'emp_code',$pfno)->emp_dept_code;
	$uname=$this->session->userdata('username');	
	$ssiondeptid=$this->session->userdata('id_dept');
      	if(($empdeptid != $ssiondeptid)&&((strcasecmp($uname,"admin"))!=0)&&((strcasecmp($uname,"payrolladmin"))!=0)){
		$mess="You do not have the right to access detial of this PF Number";
               	array_push($values,$mess);
	}else{

	if(!empty($empiddata)){
	$empid=	$empiddata->emp_id;
	$sel1="emp_scid,emp_uocid,emp_dept_code,emp_schemeid,emp_desig_code,emp_name,emp_post,emp_bank_ifsc_code,emp_bankname,emp_bankbranch,emp_bank_accno,emp_phone,emp_address,emp_secndemail,emp_ddoid,emp_dor,emp_doj,emp_dob,emp_salary_grade,emp_aadhaar_no,emp_paycomm,emp_pan_no,emp_nhisidno,emp_worktype,emp_group,emp_type_code";
	$whdata1= array('emp_code'=>$pfno);
        //$emp_data=$this->sismodel->get_listrow('employee_master','emp_code',$pfno);
       // $empdetail = $emp_data->result();
        $empdetail=$this->sismodel->get_orderlistspficemore('employee_master',$sel1,$whdata1,'');
        if(count($empdetail)>0){
            
            foreach($empdetail as $detail){
		if(!empty($this->commodel->get_listspfic1('study_center', 'sc_name', 'sc_id',$detail->emp_scid))){
                	$campus=$this->commodel->get_listspfic1('study_center', 'sc_name', 'sc_id',$detail->emp_scid)->sc_name;
		}else{
			$campus='';
		}
//echo		json_encode("nks".$campus);
                $uocname=$this->lgnmodel->get_listspfic1('authorities', 'name', 'id',$detail->emp_uocid)->name;
                $deptname=$this->commodel->get_listspfic1('Department', 'dept_name', 'dept_id',$detail->emp_dept_code)->dept_name;
                $deptcode=$this->commodel->get_listspfic1('Department', 'dept_code', 'dept_id',$detail->emp_dept_code)->dept_code;
                $schme=$this->sismodel->get_listspfic1('scheme_department', 'sd_name', 'sd_id',$detail->emp_schemeid)->sd_name;
                $schmecd=$this->sismodel->get_listspfic1('scheme_department', 'sd_code', 'sd_id',$detail->emp_schemeid)->sd_code;
                $designame=$this->commodel->get_listspfic1('designation', 'desig_name', 'desig_id',$detail->emp_desig_code)->desig_name;
                $desigcd=$this->commodel->get_listspfic1('designation', 'desig_code', 'desig_id',$detail->emp_desig_code)->desig_code;
                $empname=$detail->emp_name;

                $postname=$detail->emp_post;
		$designame=  $designame ."@".$postname;

                $ifcbank=$detail->emp_bank_ifsc_code;
		$bank=$detail->emp_bankname;
		$bnkadd=str_replace(","," ",$detail->emp_bankbranch);
//		$ifcbank=$bank[0]."#".$bank[1]."#".$bnkadd;

                $accno=$detail->emp_bank_accno;
                $phno=$detail->emp_phone;
                $address=str_replace(","," ",$detail->emp_address);
		$address=preg_replace("/[\n\r]/","", $address);
                $email=$detail->emp_secndemail;
		$ddo='';
		if($detail->emp_ddoid > 0){
//			if(!empty($this->sismodel->get_listspfic1('ddo','ddo_name','ddo_id',$detail->emp_ddoid)){
		                $ddo=$this->sismodel->get_listspfic1('ddo','ddo_name','ddo_id',$detail->emp_ddoid)->ddo_name;
//			}
		}
//	echo            json_encode("nks".$ddo);
                $dor=date('d-m-Y',strtotime($detail->emp_dor));
                $doj=date('d-m-Y',strtotime($detail->emp_doj));
                $dob=date('d-m-Y',strtotime($detail->emp_dob));
		if(!empty($this->sismodel->get_listspfic1('salary_grade_master','sgm_name','sgm_id',$detail->emp_salary_grade))){
        	        $payband=$this->sismodel->get_listspfic1('salary_grade_master','sgm_name','sgm_id',$detail->emp_salary_grade)->sgm_name;
		}else{
			$payband='';
		}
		if(!empty($this->sismodel->get_listspfic1('salary_grade_master','sgm_max','sgm_id',$detail->emp_salary_grade))){
	                $pay_max=$this->sismodel->get_listspfic1('salary_grade_master','sgm_max','sgm_id',$detail->emp_salary_grade)->sgm_max;
		}else{
			$pay_max='';
		}
		if(!empty($this->sismodel->get_listspfic1('salary_grade_master','sgm_min','sgm_id',$detail->emp_salary_grade))){
                	$pay_min=$this->sismodel->get_listspfic1('salary_grade_master','sgm_min','sgm_id',$detail->emp_salary_grade)->sgm_min;
		}else{
			$pay_min='';
		}
		if(!empty($this->sismodel->get_listspfic1('salary_grade_master','sgm_gradepay','sgm_id',$detail->emp_salary_grade))){
        	        $gardepay=$this->sismodel->get_listspfic1('salary_grade_master','sgm_gradepay','sgm_id',$detail->emp_salary_grade)->sgm_gradepay;
		}else{
			$gardepay='';
		}
		if(!empty($this->sismodel->get_listspfic1('salary_grade_master','sgm_level','sgm_id',$detail->emp_salary_grade))){
			$level=$this->sismodel->get_listspfic1('salary_grade_master','sgm_level','sgm_id',$detail->emp_salary_grade)->sgm_level;
		}else{
			$level='';
		}
                $payscale=$payband."(".$pay_min."-".$pay_max.")".$gardepay."-".$level;
                $aadhaarno=substr($detail->emp_aadhaar_no, -4);
                $paycomm=$detail->emp_paycomm;
//		if(empty($paycomm)){
//			$paycomm ="";
//		}
		$panno=$detail->emp_pan_no;
		$nhisid=$detail->emp_nhisidno;
		$paycomm=$paycomm."@".$panno ."@".$nhisid;
       // 22 item push                         
                array_push($values, $campus,$uocname,$deptname,$schme,$ddo,$detail->emp_worktype,$detail->emp_group,$designame,$detail->emp_type_code,
                $doj,$empname,$accno,$aadhaarno,$dob, $address,$detail->emp_phone,$dor,$payscale,$bank,$ifcbank,$bnkadd,$paycomm);

//		array_push($values, $campus,$uocname,$deptname,$schme,$ddo,$detail->emp_worktype,$detail->emp_group,$designame,$detail->emp_type_code,
  //              $doj,$empname,$accno,$aadhaarno,$dob, $address,$detail->emp_phone,$dor."16",$payscale."17",$ifcbank.'181920',$paycomm.'21');
            }
        } 
	$sel2="ems_house_type,ems_house_no,ems_pensioncontri,ems_upfno,ems_universityemp,ems_washingallowance,ems_deductupf,ems_hragrade,ems_ccagrade,ems_inclsummary,ems_lic1no,ems_lic1amount,ems_lic2no,ems_lic2amount,ems_lic3no,ems_lic3amount,ems_lic4no,ems_lic4amount,ems_lic5no,ems_lic5amount,ems_prdno1,ems_prdno2,ems_prdno3,ems_plino1,ems_plino2,ems_society,ems_societymember,ems_erfq,ems_erfqhra,ems_qoccupai,ems_rentgrade,ems_spfcgs,ems_spfcgs2000,ems_fsfno,ems_fsfamount,ems_bbmicr,ems_acctype,ems_bbadd,ems_bbphone,ems_bbemail,ems_nhisamount,ems_socamount,ems_pli2amount,ems_pli1amount,ems_prd3amount,ems_prd2amount,ems_prd1amount,ems_fsfamount,ems_spfcgs2amount,ems_spfcgsamount";
	$whdata2=array('ems_code'=>$pfno);
        //$emp_data2=$this->sismodel->get_listrow('employee_master_support','ems_code',$pfno);
        //$empdetail2 = $emp_data2->result();
	$empdetail2 =$this->sismodel->get_orderlistspficemore('employee_master_support',$sel2,$whdata2,'');
        if(count($empdetail2)>0){
            
            foreach($empdetail2 as $detail2){
                $housetype=$detail2->ems_house_type;
                $houseno=$detail2->ems_house_no;
                $pensioncontri=$detail2->ems_pensioncontri;
                $upfno=$detail2->ems_upfno;
		if((strncmp($upfno, "V", 1) !== 0)||(strncmp($upfno, "C", 1) !== 0)){
			$upfno=$pfno;
		}
                $univemp=$detail2->ems_universityemp;
                $washallowance=$detail2->ems_washingallowance;
                $dedtupf=$detail2->ems_deductupf;
                $hragrade=$detail2->ems_hragrade;
                $ccagrade=$detail2->ems_ccagrade;
                $inclsummary=$detail2->ems_inclsummary;
                $lic1no=$detail2->ems_lic1no;
                $lic1amount=$detail2->ems_lic1amount;
                $lic2no=$detail2->ems_lic2no;
                $lic2amount=$detail2->ems_lic2amount;
                $lic3no=$detail2->ems_lic3no;
                $lic3amount=$detail2->ems_lic3amount;
                $lic4no=$detail2->ems_lic4no;
                $lic4amount=$detail2->ems_lic4amount;
                $lic5no=$detail2->ems_lic5no;
                $lic5amount=$detail2->ems_lic5amount;
                $prdno1=$detail2->ems_prdno1;
                $prdno2=$detail2->ems_prdno2;
                $prdno3=$detail2->ems_prdno3;
                $plino1=$detail2->ems_plino1;
                $plino2=$detail2->ems_plino2;
                $society=$detail2->ems_society;
                $socmem=$detail2->ems_societymember;
                $erfq=$detail2->ems_erfq;
		$erfqhra=$detail2->ems_erfqhra;
		$qoccupai=$detail2->ems_qoccupai;
		$rentgrade=$detail2->ems_rentgrade;
		$spfcgs=$detail2->ems_spfcgs;
		$spfcgs2000=$detail2->ems_spfcgs2000;
		$fsfno=$detail2->ems_fsfno;
		$ems_nhisamt=$detail2->ems_nhisamount;
		$ems_bbemail=$detail2->ems_bbemail;
		$ems_bbphone=$detail2->ems_bbphone;
		$ems_bbadd =str_replace(","," ",$detail2->ems_bbadd);
		$ems_acctype =$detail2->ems_acctype;
		$ems_bbmicr =$detail2->ems_bbmicr;
		$ems_socamt =$detail2->ems_socamount;
		$ems_pli2amt =$detail2->ems_pli2amount;
		$ems_pli1amt =$detail2->ems_pli1amount;
		$ems_prd3amt =$detail2->ems_prd3amount;
		$ems_prd2amt =$detail2->ems_prd2amount;
		$ems_prd1amt =$detail2->ems_prd1amount;
		$fsfamt=$detail2->ems_fsfamount;
		$spfcgs2amt=$detail2->ems_spfcgs2amount;
		$spfcgsamt=$detail2->ems_spfcgsamount;
                // 28 item push,7 item push,15 item push
                array_push($values,$pensioncontri,$upfno,$houseno,$housetype,$univemp,$washallowance,$dedtupf,$hragrade,$ccagrade,
                $inclsummary,$lic1no,$lic1amount,$lic2no,$lic2amount,$lic3no,$lic3amount,$lic4no,$lic4amount,$lic5no,$lic5amount,$prdno1,
                $prdno2,$prdno3,$plino1,$plino2,$society, $socmem,$empid,$erfq,$erfqhra,$qoccupai,$rentgrade,$spfcgs,$spfcgs2000,$fsfno,
		$ems_nhisamt,$ems_bbemail,$ems_bbphone,$ems_bbadd,$ems_acctype,$ems_bbmicr,$ems_socamt,$ems_pli2amt, $ems_pli1amt,$ems_prd3amt,
		$ems_prd2amt,$ems_prd1amt, $fsfamt,$spfcgs2amt,$spfcgsamt);      

//                array_push($values,$pensioncontri,$upfno,$houseno,$housetype,$univemp,$washallowance,$dedtupf,$hragrade,$ccagrade,
  //              $inclsummary,$lic1no,$lic1amount,$lic2no,$lic2amount,$lic3no,$lic3amount,$lic4no,$lic4amount,$lic5no,$lic5amount,$prdno1,
    //            $prdno2,$prdno3,$plino1,$plino2,$society, $socmem);      
            }
   	}         
        }else{
		$mess="Please enter the valid PF Number";
                array_push($values,$mess);
	}
	}//end for dept check
	}//end pf exist else
       // echo "values in controller===".$values;
        echo json_encode($values);
    }
    /****************************************closer employee detail by pf no *********************************/
    
    
    /* This function has been created for get society members on the basis of society */
    public function getsocietymembers(){
        $selval = $this->input->post('society');
        $socmember=$this->sismodel->get_listspfic1('societies','society_members','society_id',$selval)->society_members;
        echo json_encode($socmember);
    }
    public function getsocietyno(){
        $selval = $this->input->post('society');
        $socno=$this->sismodel->get_listspfic1('society_master_list','soc_regno','soc_id',$selval)->soc_regno;
        echo json_encode($socno);
    }
    
    public function getppdetail(){
        $values=array();
        $combthree='';
        $pfval = $this->input->post('pfshid');
//	if(empty($pfval){
//		$pfval= $this->session->flashdata('emppfval');
//	}
      //  echo "pfval===".$pfval;
        $parts = explode(',',$pfval);
	if(empty($this->sismodel->get_listspfic1('employee_master', 'emp_dept_code', 'emp_code',$parts[1]))){
         	$mess="Please enter the valid PF Number";
            	array_push($values,$mess);
	}
        else{
		$empdeptid=$this->sismodel->get_listspfic1('employee_master', 'emp_dept_code', 'emp_code',$parts[1])->emp_dept_code;
	        $uname=$this->session->userdata('username');
        	$ssiondeptid=$this->session->userdata('id_dept');
	      	if(($empdeptid != $ssiondeptid)&&((strcasecmp($uname,"admin"))!=0)&&((strcasecmp($uname,"payrolladmin"))!=0)){
              		$mess="You do not have the right to access detial of this PF Number";
                	array_push($values,$mess);
      		}else{
       			// echo "pfno in  part0===".$parts[0]."part1===".$parts[1];
         		// $empid=$this->sismodel->get_listspfic1('employee_master','emp_id','emp_code',$pfval)->emp_id;
        		if(empty($this->sismodel->get_listspfic1('employee_master','emp_id','emp_code',$parts[1]))){
            			$mess="Please enter the valid PF Number";
            			array_push($values,$mess);
			}
        		else{
            			$empid=$this->sismodel->get_listspfic1('employee_master','emp_id','emp_code',$parts[1])->emp_id;
            			$emppaycom=$this->sismodel->get_listspfic1('employee_master','emp_paycomm','emp_id',$empid)->emp_paycomm;
           			// echo "seema2===".$empid.$emppaycom;
				//if(empty($emppaycom)){
            			if ((strlen($emppaycom) == 0)||($emppaycom == "null")){
					$mess="Please set the pay commission for this  PF Number";
	        			array_push($values,$mess);
            			}
            			else{
	        			$cmonth = date('M');
        				$cyear= date("Y");
        
               //if($parts[0] == '#tab6'){
                    			$emppaycom=$this->sismodel->get_listspfic1('employee_master','emp_paycomm','emp_id',$empid)->emp_paycomm;
                    			$empwtype=$this->sismodel->get_listspfic1('employee_master','emp_worktype','emp_id',$empid)->emp_worktype;
                    			$wdata1=array('shc_paycom'=>$emppaycom, 'shc_wtype'=>$empwtype);
                    			$shcsalhdid=$this->sismodel->get_orderlistspficemore('salaryhead_configuration','shc_salheadid',$wdata1,'');
                    			foreach($shcsalhdid as $row){
						$listhdid=$row->shc_salheadid;
                    			}
                    			$hdid_arr = explode (",", $listhdid);
                   // print_r($hdid_arr);
                    			$i=0;
                    			if($parts[0] == '#tab6'){
                    				foreach($hdid_arr as $hid){
                        				$hname=$this->sismodel->get_listspfic1('salary_head','sh_name','sh_id',$hid)->sh_name;
                        				$hcode=$this->sismodel->get_listspfic1('salary_head','sh_code','sh_id',$hid)->sh_code;
                        				$htype=$this->sismodel->get_listspfic1('salary_head','sh_type','sh_id',$hid)->sh_type;
                       
                        				if($htype == 'I'){
                            					$sgflag='N';
                            					$sgflag=$this->sismodel->get_listspfic1('salary_head','sh_calc_type','sh_id',$hid)->sh_calc_type;
                            					$hfor='';
                            					$hfor1='';
                            					if($sgflag == 'Y'){
                                					$hfor2=$this->sismodel->get_listspfic1('salary_formula','sf_formula','sf_salhead_id',$hid);
                                					if(!empty($hfor2)){
                                    						$hfor1=$hfor2->sf_formula;
                                					}
                                					$hfor=" ( ".$hfor1." )";
                            					}
                            //get max value of salary earning head from salary earning head 
                            $hvalue=0;
                            $wdata2=array('seh_empid' =>$empid,'seh_headid'=>$hid);
                            $mrecord=$this->sismodel->get_maxvalue('salary_earnings_head','seh_id',$wdata2);
                            $msehid='';
                            if(!empty($mrecord)){
                                foreach($mrecord as $mr){
                                    $msehid=$mr->seh_id;
                                }
                                if(!empty($msehid)){
                                    $hvalue=round($this->sismodel->get_listspfic1('salary_earnings_head','seh_headamount','seh_id',$msehid)->seh_headamount,0);
                                }
                            }
	//	$maxrecv=$this->sismodel->get_orderlistspficemore('salary_earnings_head','seh_id,seh_headamount',$wdata2,'seh_id asc');
	//	foreach($maxrecv as $mrv){
	//		$hvalue=round($mrv->seh_headamount,0);
	//	}
                            $hnme='"headamtI'.$i.'"';
                            if(!empty($hfor)){
                                $input1='<input type="text" class="headamtI" name='.$hnme.' id="headamtI'.$i.'" value="'.$hvalue.'" readonly>';
                            }else{
                                $input1='<input type="text" class="headamtI" name='.$hnme.' id="headamtI'.$i.'" value='.$hvalue.'>';
                            }
//		create box for increment
                            if($hname == "Basic Pay"){
                                $input2='</td><td><input type="text" class="increment" name="increment'.$i.'" id="increment"  value="0" >';
                            }else{
                                $input2='</td><td>';
                            }
                            $input1=$input1.$input2;
                            $hidin='<input type="hidden" name="sheadidin'. $i.'" id="shidearn'.$i.'" value= "'.$hid.'">';
                            $ii=$i+1;
                            $combthree=$combthree.'<tr><td>'.$ii.'</td><td>'.$hcode.'</td><td>'.$hname.' '.$hfor.'</td><td>'.$input1.$hidin.'</td></tr>';
                            $i++;
                        }//closer I
                    }//closerforeach
                    $hidin2='<input type="hidden" name="totalcount" id="tcount" value="'. $i.'">';
                    $combthree=$combthree.$hidin2;
                    array_push($values,$combthree);
                   // }//closerforeach//tab6
            //     $wdata = array('seh_empid' =>$empid,'seh_month'=>$cmonth,'seh_year'=>$cyear);
             //    $hdval= $this->sismodel->get_orderlistspficemore('salary_earnings_head','seh_headid,seh_headname,seh_headamount',$wdata,''); 
                }//closer tab6 
               
            if($parts[0]== '#tab7'){
                foreach($hdid_arr as $hid){
                    $hname=$this->sismodel->get_listspfic1('salary_head','sh_name','sh_id',$hid)->sh_name;
                    $hcode=$this->sismodel->get_listspfic1('salary_head','sh_code','sh_id',$hid)->sh_code;
                    $htype=$this->sismodel->get_listspfic1('salary_head','sh_type','sh_id',$hid)->sh_type;
           //             print_r("dd===".$hid);
	//		print_r("dd===".$htype);
                    if($htype == 'D'){
          //              print_r("dd===".$hid);
                        $hno=0;
                        $hvalue=0;
                        $uchname='';
                        $wdata2=array('ssdh_empid' =>$empid,'ssdh_headid'=>$hid);
                        $mdrecord=$this->sismodel->get_maxvalue('salary_subsdeduction_head','ssdh_id',$wdata2);
                        $mssdhid='';
                        if(!empty($mdrecord)){
                            foreach($mdrecord as $mr){
                                $mssdhid=$mr->ssdh_id;
                            }
                            if(!empty($mssdhid)){
                                $hno1=$this->sismodel->get_listspfic1('salary_subsdeduction_head','ssdh_headno','ssdh_id',$mssdhid);
                                if(!empty($hno1)){
                                    $hno=$hno1->ssdh_headno;
                                }
                                else{
                                    $hno=0;    
                                }
                                if(strpos($parts[1],'V') === 0){
                                    //$uchid=$this->sismodel->get_listspfic1('salary_subsdeduction_head','ssdh_headno','ssdh_id',$mssdhid);
                                    $uchname=$this->sismodel->get_listspfic1('salary_subsdeduction_head','ssdh_headname','ssdh_id',$mssdhid)->ssdh_headname;
                                  //  echo "unmcv==".$uchname."mssid==".$mssdhid;
                                    if(strpos($uchname,'UPF Subscription')!== false){
                                    //    echo "case1";
                                        $hvalue=round($this->sismodel->get_listspfic1('salary_subsdeduction_head','ssdh_headamount','ssdh_id',$mssdhid)->ssdh_headamount,0);
                                    }
                                    elseif(strpos($uchname,'CPS Subscription')!== false){
                                      //  echo "case2";
                                        $hvalue=0;
                                    }
                                    else{
                                       // echo "case3";
                                        $hvalue=round($this->sismodel->get_listspfic1('salary_subsdeduction_head','ssdh_headamount','ssdh_id',$mssdhid)->ssdh_headamount,0);    
                                    }
                                }
                                elseif(strpos($parts[1],'C') === 0){
                                    $uchname=$this->sismodel->get_listspfic1('salary_subsdeduction_head','ssdh_headname','ssdh_id',$mssdhid)->ssdh_headname;
                                    if(strpos($uchname,'UPF Subscription')!== false){
                                      //  echo "case4";
                                        $hvalue=0;
                                    }
                                    elseif(strpos($uchname,'CPS Subscription')!== false){
                                       // echo "case5";
                                        $hvalue=round($this->sismodel->get_listspfic1('salary_subsdeduction_head','ssdh_headamount','ssdh_id',$mssdhid)->ssdh_headamount,0);
                                    }
                                    else{
                                        //echo "case6";
                                        $hvalue=round($this->sismodel->get_listspfic1('salary_subsdeduction_head','ssdh_headamount','ssdh_id',$mssdhid)->ssdh_headamount,0);
                                    }
                                    
                                }
                                else{
                                    $hvalue=round($this->sismodel->get_listspfic1('salary_subsdeduction_head','ssdh_headamount','ssdh_id',$mssdhid)->ssdh_headamount,0);
                                }
                            }
                           // die;
                        }
                        $combthree=$hno."^".$hvalue;
//                        print_r($combthree);
                        array_push($values,$combthree);
                    }
                }//forachhidarr        
                 
            }//closer of tab7  
            if($parts[0]== '#tab8'){
            foreach($hdid_arr as $hid){
                    $hname=$this->sismodel->get_listspfic1('salary_head','sh_name','sh_id',$hid)->sh_name;
                    $hcode=$this->sismodel->get_listspfic1('salary_head','sh_code','sh_id',$hid)->sh_code;
                    $htype=$this->sismodel->get_listspfic1('salary_head','sh_type','sh_id',$hid)->sh_type;
                    if($htype == 'L'){
                       // print_r("dd===".$hid);
                        $hno=0;
                        $hvalue=0;
                        $wdata2=array('slh_empid' =>$empid,'slh_headid'=>$hid);
                        $mdrecord=$this->sismodel->get_maxvalue('salary_loan_head','slh_id',$wdata2);
                        $mslhid='';
                        if(!empty($mdrecord)){
                            foreach($mdrecord as $mr){
                                $mslhid=$mr->slh_id;
                            }
                            if(!empty($mslhid)){
                                $hno1=$this->sismodel->get_listspfic1('salary_loan_head','slh_headno','slh_id',$mslhid);
                                if(!empty($hno1)){
                                    $hno=$hno1->slh_headno;
                                }
                                else{
                                    $hno=0;    
                                }
                                $hvalue=round($this->sismodel->get_listspfic1('salary_loan_head','slh_headamount','slh_id',$mslhid)->slh_headamount,0);
                                $intlttno=$this->sismodel->get_listspfic1('salary_loan_head','slh_totalintall','slh_id',$mslhid)->slh_totalintall;
                                $intlno=$this->sismodel->get_listspfic1('salary_loan_head','slh_intallmentno','slh_id',$mslhid)->slh_intallmentno;
                                $intlhvalue=round($this->sismodel->get_listspfic1('salary_loan_head','slh_installamount','slh_id',$mslhid)->slh_installamount,0);
                            }
                        }
                        	$combthree=$hno."^".$hvalue."^".$intlttno."^".$intlno."^".$intlhvalue;
                       		// print_r($combthree);
                        	array_push($values,$combthree);
                    	}
                	}//forachhidarr     
            	}// close if if tab8
    
				}//close second else
      			}//close first else 
		}// close dept check else
	}
        echo json_encode($values);
    }
    public function getheadfromula(){
      //  echo "seema--- in js"; 
        $values=array();
        $hcval = $this->input->post('hcval');
        $parts = explode(',',$hcval);
      //  echo "pfno in tab4=1=".$pfval.$parts[0].$parts[1];
        $empid=$this->sismodel->get_listspfic1('employee_master','emp_id','emp_code',$parts[2])->emp_id;
        /*
        if(!empty($hdval)){
            foreach($hdval as $alldata){
                array_push($values,$combthree);
            }
        }
        else{
           // echo "in else part==id===".$empid;
            $mess="Please enter the valid PF Number";
            array_push($values,$mess);
           // $headval=0;   
        }*/
      //  array_push($values,$empid);
        echo json_encode($values);
       // echo json_encode($empid);
    }
}    
