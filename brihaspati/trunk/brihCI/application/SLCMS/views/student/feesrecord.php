<!--@name feerecord.php  @author kishore kr Shukla(kishore.shukla@gmail.com) -->

<?php defined('BASEPATH') OR exit('No direct script access allowed');?>

<html>
    <head> 
    <title>Fees Detail</title>   
        <?php $this->load->view('template/header'); ?>
          <!--<h1>Welcome <?//= $this->session->userdata('username') ?>  </h1>-->
          <?php //$this->load->view('template/stumenu'); ?>
          <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/tablestyle.css">
        <style>
            thead th{
               
                background-color: #DCDCDC;
              }
		.tag_color{
			color:red;
		}
		
       </style>
    </head>    
    <body>
<?php
                    //echo "<table style=\"padding: 20px 8px 8px 20px;\">";
                    echo "<table style=\"padding: 10px 0px 0px 10px;width:100%;\">";
                    echo "<tr valign=\"top\">";
                    echo "<td  style='width:53%;' align=right>";
                  echo "<b>Fees Record</b>";
             echo "<td>";
                    $help_uri = site_url()."/help/helpdocstudent#FeesRecord";
                    echo "<a target=\"_blank\" href=$help_uri><b style=\"float:right;margin-left:60%;position:absolute;margin-top:-0%\">Click for Help</b></a>";
                    echo "</td>";
                    echo "</tr>";
                    echo "</table>";
                    ?>
         <table style="margin-left:2%;width:100%"> 
          <tr><td> 
               <div  style="margin-left:2%; width:90%;" >
               <?php echo validation_errors('<div class="isa_warning">','</div>');?>
                <?php if(isset($_SESSION['success'])){?>
                   <div class="isa_success"><?php echo $_SESSION['success'];?></div>
                <?php
                };
                ?>
                <?php if(isset($_SESSION['err_message'])){?>
                   <div class="isa_error"><?php echo $_SESSION['err_message'];?></div>
                <?php
                };
                ?>        
        	</div>
        </td></tr>  
        </table>  
        
      <!--  <a href="<?php //echo site_url(); ?>/studentrecord/mypdf">pdf</a>-->
      <!-- <div class="panel panel-primary"> -->
            <table cellpadding="16" class="TFtable">
            <thead >
            <tr align="center">
                <th>Program Name(Branch)</th>
                <th>Semester</th>
                <th>Academic Year</th>
                <th>Fees Type</th>
                <th>Fees Amount</th>
                <th>Fees Mode</th>
                <th>Bank Name/Payment Gateway</th>
                <th>Reference Number</th> 
                <th>Action</th>
            </tr>
	<?php
  if(!empty($this->result)){
	    foreach($this->result as $row){
            	echo "<tr align=\"center\">";
		/*echo "<td>" . $row->sfee_spid ."</td>";*/
                echo "<td>";
		$prgid= $this->commodel->get_listspfic1('student_program','sp_programid','sp_id',$row->sfee_spid)->sp_programid ;
		echo $this->commodel->get_listspfic1('program','prg_name','prg_id',$prgid)->prg_name ;
		echo " ( ";
		echo $this->commodel->get_listspfic1('program','prg_branch','prg_id',$prgid)->prg_branch ;
		echo " ) ";
		echo "</td>";
		echo "<td>" . $this->commodel->get_listspfic1('student_program','sp_semester','sp_id',$row->sfee_spid)->sp_semester ."</td>";
		echo "<td>" . $this->commodel->get_listspfic1('student_program','sp_acadyear','sp_id',$row->sfee_spid)->sp_acadyear ."</td>";
		echo "<td>" . $row->sfee_feename ."</td>";
		echo "<td>" . $row->sfee_feeamount ."</td>";
		echo "<td>" . $row->sfee_paymentmethod ."</td>";
		echo "<td>" . $row->sfee_bankname . "  " . $row->sfee_paymentgateway."</td>";
		echo "<td>" . $row->sfee_referenceno ."</td>";
		if(!empty($row->sfee_feeamount)){
		 echo "<td>" . anchor('studentrecord/feesreceiptdw/'.$row->sfee_id, "Download Receipt") . "</td>";
		}
		else{
			echo "<td> </td>";
		}
		?>
		<!--<td> <a href="<?php echo site_url(); ?>/studentrecord/mypdf">Download Receipt</a></td>-->
		<?php
		echo "</tr>";
		}
    }else{
    echo "<tr align=\"center\">"; echo "<td colspan=9 style='text-align:center;'> <b>Your Fees Not Reconciled !</b>  </td>";  echo "</tr>";
  }
	?>
        </thead>
        <tbody>
         </tbody>
        </table> 
  <!-- </div>  -->     
    </body>  
   <div align="center">  <?php $this->load->view('template/footer');?></div>
</html>

