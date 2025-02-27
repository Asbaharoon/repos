<!--@name pendingincomereq.php
    @author Deepika Chaudhary (chaudharydeepika88@gmail.com)
 -->

<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<html>

<title>View Pending Leave Requests</title>
  <head>
   <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/tablestyle.css">
   <?php $this->load->view('template/header'); ?>
   </head>
<body>
    <table width="100%">
         <tr align="left">
             <td width="15%">
                                 <?php echo anchor('setup4/approvedincomereq/', "Approved Saving Master", array('title' => 'Approved Saving Master' ,'class' =>'top_parent'));?>
                                 </td>
                                 <td width="15%">
                                 <?php echo anchor('setup4/rejectedincomereq/', "Rejected Saving Master", array('title' => 'Rejected Saving Master' ,'class' =>'top_parent'));?>
                                 </td>
                                 <?php
                                         echo "<td align=\"center\">";
                                         echo "<b>Pending Saving Master Requests</b>";
                                         echo "</td>";
                                 ?>
                                 <td align="right" width="15%">
                                 </td>
                <div>
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
         </tr>
        </table>
 <div class="scroller_sub_page">
   <table class="TFtable">
            <thead>
                                        <tr>
                        <th width="2%">S.No</th>
			<th width="2%">User Name</th>
			<th width="2%">Financial Year</th>
			<!--<th width="2%">PF Number</th> -->
                        <th width="2%">U/S 80 C</th>
                        <th width="2%">U/S 80 CCD(1-B)</th>
                        <th width="2%">U/S 80 D</th>
             		<th width="2%">U/S 80 DD</th>
                        <th width="2%">U/S 80 E</th>
                        <th width="3%">U/S 80 G</th>
                        <th width="2%">U/S 80 GGA</th>
                        <th width="2%">U/S 80 U</th>
			<th width="2%">U/S 24 B</th>
		        <th width="2%">U S M Other</th>
			<th width="2%">Action</th>
                                        </tr>
                                </thead>
                                <tbody>
<?php
			$iddept=$this->session->userdata('id_dept');
                        $idrole=$this->session->userdata('id_role');
        			$count =0;
					if(!empty($this->usmresult))
					 {
                foreach ($this->usmresult as $row)

         		 {

        			 ?>
        		    <tr>
            	 <td> <?php echo ++$count; ?> </td>
			<?php echo " <td>";
		echo $this->sismodel->get_listspfic1('employee_master','emp_name','emp_id', $row['userid'])->emp_name;
		echo "( ".$row['usmpfno']." )"; 
                     echo "</td>";
			?>
                <td> <?php echo $row['usmfyear'] ?></td>
		<td> <?php echo $row['usm80C'] ?></td>
		<td> <?php echo $row['usm80CCD'] ?></td>
		<td> <?php echo $row['usm80D'] ?></td>
		<td> <?php echo $row['usm80DD'] ?></td>
		<td> <?php echo $row['usm80E'] ?></td>
		<td> <?php echo $row['usm80G'] ?></td>
		<td> <?php echo $row['usm80GGA'] ?></td>
		<td> <?php echo $row['usm80U'] ?></td>
		<td> <?php echo $row['usm24B'] ?></td>
		<td> <?php echo $row['usmother'] ?></td>

<td>

		<?php 
                        $empdeptid=$this->sismodel->get_listspfic1('user_saving_master','usm_deptid','usm_empid', $row['userid'])->usm_deptid;
                        if(($idrole == 1)||($idrole == 14)||(($idrole == 5)&&($iddept == $empdeptid))){
				echo anchor('setup4/approve/' . $row['usmid'] , "Approve",array('onclick' => "return confirm('Are you sure you want to approve leave request')")) . " ";
				echo " | ";
                         	echo anchor('setup4/reject/' . $row['usmid'] , "Reject", array('title' => 'Reject Leave Requests' ,'class' =>'top_parent'));
			}
?>
                                        </td>

                                        </tr>
                                        <?php
                                        }}
                                        else {
                    echo "<td colspan=\"15\" align=\"center\"> No Records found...!</td>";
                    }?>
                </tbody>
   </table>
                        </div>
</body>
<br><br>
<div align="center">  <?php $this->load->view('template/footer');?></div>
</html>

