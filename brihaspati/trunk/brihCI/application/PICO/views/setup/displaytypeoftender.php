<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<html>
<title>VIEW|MODE|TENDER </title>
  <head>
   <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/tablestyle.css">
   <?php $this->load->view('template/header'); ?>
    
  </head>
 <body>
        
      <table width="100%">
            <tr>
                <?php 
		 echo "<td align=\"left\"width=\"33%\">";
	         echo anchor('picosetup/tender_type/', "Add Mode Type", array('title' => 'Add Detail','class' =>'top_parent'));
                 echo "</td>";
		 ?>
                 <?php
		 echo "<td align=\"center\" width=\"34%\">";
                 echo "<b>Tender Details</b>";
                 echo "</td>";
                 echo "<td align=\"right\" width=\"33%\">";
                 $help_uri = site_url()."/help/helpdoc#ViewRoleDetail";
		 echo "<a style=\"text-decoration:none\" target=\"_blank\" href=$help_uri><b>Click for Help</b></a>";
		 echo "</td>";
                 ?>
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
        <table class="TFtable" >
                <tr>
<thead><th>Sr.No</th><th>Mode Name</th><th>Description</th><th>Action</th></tr></thead>
<tbody>
   <?php
        $count =0;
        //foreach ($query->result() as $row)
        // foreach is changed so that thier will be no database error
        foreach ($result as $row)
        {  
         ?>
             <tr>
            <td> <?php echo ++$count; ?> </td> 
            <td> <?php echo $row->tt_name ?></td>
            <td> <?php echo $row->tt_desc ?></td>
	    <td>
            <?php  
		$suname=$this->session->userdata['username'];
	   if((strcasecmp($suname,"admin"))==0)
	
	
	     {
	    		echo "&nbsp; ";
            		echo anchor('picosetup/edittypeoftender/' . $row->tt_id , "Edit", array('title' => 'Details' , 'class' => 'red-link')) . " ";
		      echo "&nbsp; ";
            		echo anchor('picosetup/deletetypeoftender/' . $row->tt_id , "Delete", array('title' => 'Details' , 'class' => 'red-link')) . " ";
		
		  }
            echo "</td>";
            echo "</tr>";
          
        }
          ?>
</tbody>
</table>
</div><!------scroller div------>
</body>
<p>&nbsp;</p>
<div align="center">  <?php $this->load->view('template/footer');?></div>
</html>





