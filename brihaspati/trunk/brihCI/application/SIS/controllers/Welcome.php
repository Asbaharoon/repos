<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * @name Login.php
 * @author Nagendra Kumar Singh
 * @Modified by Manorama Pal(palseema30@gmail.com) 06june2017	
 */
class Welcome extends CI_Controller {

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
	function __construct() {
        	parent::__construct();
        	$this->load->model("login_model", "login");
                $this->load->model("User_model", "usrmodel");
                $this->load->model("Common_model", "commodel");
		$this->load->model("SIS_model", "sismodel");
        	//if(!empty($_SESSION['id_user'])){
                    
                //}
            	//	redirect('home');
    	}

	public function index() {
		$cdate = date('Y-m-d');
                $wharray = array('anou_cname=' => 'SIS', 'anou_publishdate<=' => $cdate,'anou_expdate>=' => $cdate);
                $this->annoresult = $this->commodel->get_listarry('announcement','*',$wharray);

            if($_POST) {
                $result = $this->login->validate_user($_POST);
		$empid='';
                /*get role by using model class and set templates according to role*/
                //$roles=$this->commodel->get_listspficarry('user_role_type','roleid','userid',$result->id);
		$empidres=$this->sismodel->get_listspfic1('employee_master', 'emp_id', 'emp_email', $result->username);
		if(!empty($empidres)){
			$empid=$this->sismodel->get_listspfic1('employee_master', 'emp_id', 'emp_email', $result->username)->emp_id;
		}
                $wharray=array('userid'=>$result->id);
		$roles=$this->sismodel->get_listspficemore('user_role_type','roleid,deptid',$wharray);
                if(!empty($result)) {
             		if(!empty($roles)){   
                    		if(count($roles) == 1){
                        		foreach($roles as $row):
                            			if($row->roleid == 1){
                                			$data = [
							'id_emp' => $empid,
			                                'id_user' => $result->id,
                        			        'username' => $result->username,
			                                'id_role' => $row->roleid
                        			        ];
			                                $this->session->set_userdata($data);
                        			        redirect('home');
                           			} 
                            			if($row->roleid == 2){
			                                $data = [
							'id_emp' => $empid,
                        			        'id_user' => $result->id,
			                                'username' => $result->username,
                        			        'id_role' => $row->roleid
			                                ];
                        			        $this->session->set_userdata($data);
			                                redirect('facultyhome'); 
                        			}
                            			if($row->roleid == 3){
			                                $data = [
							'id_emp' => $empid,
                        			        'id_user' => $result->id,
			                                'username' => $result->username,
                        			        'id_role' => $row->roleid
			                                ];
                        			        $this->session->set_userdata($data);
			                                redirect('studenthome'); 
                        			}
                            			if($row->roleid == 4){
			                                $data = [
							'id_emp' => $empid,
                        			        'id_user' => $result->id,
			                                'username' => $result->username,
                        			        'id_role' => $row->roleid
			                                ];
                        			        $this->session->set_userdata($data);
			                                redirect('staffhome'); 
                        			}
                            			if($row->roleid == 5){
			                                $data = [
							'id_emp' => $empid,
                        			        'id_user' => $result->id,
			                                'username' => $result->username,
                        			        'id_role' => $row->roleid,
                        			        'id_dept' => $row->deptid
			                                ];
                        			        $this->session->set_userdata($data);
			                                redirect('hodhome'); 
                        			}
                            			if($row->roleid == 6){
			                                $data = [
							'id_emp' => $empid,
                        			        'id_user' => $result->id,
			                                'username' => $result->username,
                        			        'id_role' => $row->roleid
			                                ];
                        			        $this->session->set_userdata($data);
			                                redirect('coehome'); 
                        			}
                            			if($row->roleid == 7){
			                                $data = [
							'id_emp' => $empid,
                        			        'id_user' => $result->id,
			                                'username' => $result->username,
                        			        'id_role' => $row->roleid
			                                ];
                        			        $this->session->set_userdata($data);
			                                redirect('accoffhome'); 
                        			}
                            			if($row->roleid == 10){
			                                $data = [
							'id_emp' => $empid,
                        			        'id_user' => $result->id,
			                                'username' => $result->username,
                        			        'id_role' => $row->roleid
			                                ];
                        			        $this->session->set_userdata($data);
			                                redirect('uohome'); 
                        			}
                            			if($row->roleid == 14){
			                                $data = [
							'id_emp' => $empid,
                        			        'id_user' => $result->id,
			                                'username' => $result->username,
                        			        'id_role' => $row->roleid
			                                ];
                        			        $this->session->set_userdata($data);
			                                redirect('payhome'); 
                        			}
                        		endforeach;   
                    		}else{
                        		foreach($roles as $row):
                            			$data = [
							'id_emp' => $empid,
		                                	'id_user' => $result->id,
                		                	'username' => $result->username,                                    
                                		];
                            			$this->session->set_userdata($data);
                            			redirect('rolehome'); 
                        		endforeach;
                    		}
			}else{ //if close role empty
                    		$this->session->set_flashdata('err_message', 'You do not have any role in this system!');
                    		redirect('welcome');
            		}
                }//if empty result validate close 
                else {
                    $this->session->set_flashdata('err_message', 'Username or password is wrong!');
                    redirect('welcome');
                }
            }    
            $this->load->view("welcome_message");
        }//close index function
	
    }//close class
