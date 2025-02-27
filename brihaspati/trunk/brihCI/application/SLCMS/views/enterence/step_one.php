<!-------------------------------------------------------
    -- @name step_one.php --	
    -- @author Sumit saxena(sumitsesaxena@gmail.com) --
--------------------------------------------------------->
<?php
defined('BASEPATH') OR exit('No direct script access allowed');


?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>IGNTU:Student Detail</title>
	<link rel="shortcut icon" href="<?php echo base_url('assets/images'); ?>/index.jpg">
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/jquery-2.1.3.min.js" ></script>
	<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css'); ?>/message.css">

	<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css'); ?>/studentNavbar.css">

<style type="text/css">
label{font-size:18px;}
input[type='text']{font-size:17px;height:35px;background-color:white;width:99%;font-weight:bold;}
input[type='email']{font-size:17px;height:35px;background-color:white;width:98%;font-weight:bold;}

#filltoo{font-size:20px;}
tr td{font-size:15px;}
thead tr th{background-color:#38B0DE;color:white;font-weight:bold;font-size:15px;}
select{width:98%;font-size:17px;height:35px;font-weight:bold;}


</style>

<script type="text/javascript">
function filladd()
{
	 if(filltoo.checked == true) 
     	{
             var street11 =document.getElementById("street").value;
	     var city11 =document.getElementById("city").value;
	     var state11 =document.getElementById("state").value;
             var pcode11 =document.getElementById("pcode").value;
	     var country11 =document.getElementById("country").value; 
           
            var copystreet =street11;
            var copycity =city11;
            var copystate =state11;
	    var copypcode =pcode11;
            var copycount =country11;	
            
            document.getElementById("street1").value = copystreet;
            document.getElementById("city1").value = copycity;
            document.getElementById("state1").value = copystate;
	    document.getElementById("pcode1").value = copypcode;
            document.getElementById("country1").value = copycount;	
	 }
	 else if(filltoo.checked == false)
	 {
		 document.getElementById("street1").value='';
		 document.getElementById("city1").value='';
		 document.getElementById("state1").value='';
		 document.getElementById("pcode1").value='';
		 document.getElementById("country1").value='';
	 }
}
</script>

</head>
<body >


<div>
 	<div id="body">
	<?php $this->load->view('template/header'); ?>
	<nav> 	<h2><?php echo "Welcome ".$email;?></h2></nav></br>
	<?php $this->load->view('enterence/admission_steps');?>
<!--------------------------------------------------------ERROR DISPLAY-------------------------------------------------------------->

<?php echo validation_errors('<div class="isa_warning">','</div>');?>
        <?php echo form_error('<div class="">','</div>');?>
        <?php 
	    if(!empty($_SESSION['success'])){	
		if(isset($_SESSION['success'])){?>
         <div class="isa_success" style="font-size:18px;"><?php echo $_SESSION['success'];?></div>
         <?php
          } };
         ?>
	
        <?php if(isset($_SESSION['err_message'])){?>
             <div class="isa_error"><div ><?php echo $_SESSION['err_message'];?></div></div>
        <?php
        };
	?>  	</br> 
<center><?php //echo $scname;?>
<form action="<?php echo site_url('enterence/step_one'); ?>"  method="POST">

	<table style="width:100%;">
		<thead><tr><th align=left colspan="8" style="font-size:22px;">Personal</th></tr></thead>
		<tr height=10></tr>
	    <tr>	
		<td>	
			<label for="nnumber">Course Applied For</label></br>
					
			<input type="text" name="entcouname" placeholder="Enter Your Email" value="<?php echo $prgname;?>" readonly/>
		<td/>
				
		<td>	<!---<span style="color:red;"><?php echo form_error('Scenters');?></span>--->
			<?php ?>
			<label for="ennumber">Study Centers</label></br>
			<select name="entcenter" style="height:37px;font-size:18px;font-weight:bold;" >
 			<!--<option  disabled selected>Study Centers</option>-->
				<?php foreach($this->scresult as $scrow): 
					$scid = $this->commodel->get_listspfic1('study_center','sc_id','sc_id',$scrow->prg_scid)->sc_id;
					$scname = $this->commodel->get_listspfic1('study_center','sc_name','sc_id',$scid)->sc_name;
				?>
					<option value="<?php echo $scid;?>"><?php echo $scname; ?></option>
				<?php endforeach; ?>
			<!-- <?php 
			if(($prgcat == 'Diploma Course') || ($prgcat == 'Under Graduate')|| ($prgcat == 'Certificate Course')){
			?>	
			<option value="<?php echo '1'; ?>"><?php echo 'IGNTU, HQ, Amarkantak'; ?></option>
			<?php }  ?>
			<?php 
			if(($prgcat == 'Post Graduate') || ($prgcat == 'Research')){
			?>
			<option value="<?php echo '1'; ?>"><?php echo 'IGNTU, HQ, Amarkantak'; ?></option>
			<option value="2"><?php echo 'Regional campus,manipur'; ?></option>
			<?php } ?>--->
			</select>   
		<td/>

		<td>	<!---<span style="color:red;"><?php echo form_error('Stypeprogramme');?></span>--->
			<label for="nnumber">Entrance Exam Center</label></br>
			<select name="entexamcenter" style="height:37px;font-size:18px;font-weight:bold;">

			<option selected="true" disabled="disabled" style="font-size:18px;">Center</option>
					<?php foreach($this->examcenter as $row): ?>	
					<option value="<?php echo $row->eec_id;?>"><?php echo $row->eec_name; ?></option>
					<?php endforeach; ?>
			</select>		
		<td/>
		<td>	
			<label for="nnumber">Applicant Name</label></br>	
			<input type="text" name="entappliname" placeholder="Enter Your Name" value="<?php echo isset($_POST["entappliname"]) ? $_POST["entappliname"] : ''; ?>"/>
		<td/>
	</tr>
				
	<tr height=10></tr>

	<tr>
		<td>	
			<label for="nnumber">Email</label></br>	
			<input type="text" name="entemail" placeholder="Enter Your Email" value="<?php echo $email;?>" readonly/>		
		<td/>

		<td>	
			<label>Mobile/Phone No.</label></br>
			<input type="text" name="entmobile" placeholder="Enter Mobile Number" MaxLength="10" pattern="/^+91(7\d|8\d|9\d)\d{9}$/" value="<?php echo $mobile; ?>" readonly/>				
		<td/>

		
		<td>	<!---<span style="color:red;"><?php echo form_error('Sgender');?></span>--->
			<label>Gender</label></br>
			<select name="entgender" style="height:37px;font-size:18px;font-weight:bold;">
 			<option value=""disabled selected>Select Gender</option>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
				<option value="Transgender">Transgender</option>			
			</select>  
			<!--<input type="text" name="Sgender" placeholder="Enter Gender" >--->		
		<td/>

		<td>	<!---<span style="color:red;"><?php echo form_error('Sgender');?></span>--->
			<label>Maritial Status</label></br>
			<select name="entmaritial" style="height:37px;font-size:18px;font-weight:bold;width:100%;">
 			<option value=""disabled selected>Select Maritial Status</option>
				<option value="Married">Married</option>
				<option value="Un-Married">Un-Married</option>			
			</select>  
			<!--<input type="text" name="Sgender" placeholder="Enter Gender" >--->		
		<td/>

	</tr>
		<tr height=10></tr>
	<tr>
		<td>	
			 <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/jquery-ui.min.css">
  			  <script type="text/javascript" src="<?php echo base_url();?>assets/js/jquery-ui.min.js" ></script>

		<label>Select Date Of Birth</label></br>
		<input id="dob" type="text" name="entdob" placeholder="Enter Your Dob" value="<?php echo $dob; ?>" readonly>

			<script>
				/*$('#dob').datepicker({
 				onSelect: function(value, ui) {
 			        console.log(ui.selectedYear)
       				var today = new Date(), 
         			dob = new Date(value), 
          			age = 2017-ui.selectedYear;

   				$("#age").text(age);
   				},
  	 			//(set for show current month or current date)maxDate: '+0d',
				
    				changeMonth: true,
    				changeYear: true,
    				dateFormat: 'yy-mm-dd',
     				defaultDate: '1yr',
    				yearRange: 'c-47:c+50',
				});*/
			</script>	
		<td/>
		<td>	
			<label for="Co-ordinator Contact">Your Age</label></br>
			<!--<textarea id="age" class="form-control" placeholder="Your Age" name="entage" style="height:31px;font-size:15px;width:97%;font-weight:bold;" 
			value="<?php echo $age ?>" readonly required></textarea>--->	
			<input type="text" name="entage" placeholder="Enter Your Age" value="<?php echo $age; ?>" readonly>
		<td/>
		<td>	
			<label>Category</label></br>
			<select name="entcate" style="height:37px;font-size:18px;font-weight:bold;">
				<option selected="true" disabled>Select your category</option>
				<?php foreach($categorylist as $row){?>
					<option value="<?php echo $row->cat_id; ?>"><?php echo $row->cat_name;?></option>
				<?php }?>	
			</select>
		<td/>

		<td>	
			<label>Nationality</label></br>
			<input type="text" name="entnationality" value="<?php echo isset($_POST["entnationality"]) ? $_POST["entnationality"] : ''; ?>" placeholder="Enter Nationality"/>
		<td/>


	</tr>
	
		<tr height=10></tr>
	<tr>
		<td>	
			<label>Are you physically handicapped ?</label></br>
			<select name="entdisability" style="height:37px;font-size:18px;font-weight:bold;">
				<option selected="true" disabled>Select disability</option>
				<option value="Yes">Yes</option>	
				<option value="No">No</option>
			</select>
		<td/>
	
		<td>
			<label>Select Religion</label></br>
			<select name="entreligion" style="height:37px;font-size:18px;font-weight:bold;">
				<option selected="true" disabled="disabled" style="font-size:18px;">Select Religion</option>
				<option value="HINDUISM">HINDUISM</option>
				<option value="ISLAM">ISLAM</option>
				<option value="CHRISTIANITY">CHRISTIANITY</option>
				<option value="SIKHISM">SIKHISM</option>
				<option value="BUDDHISM">BUDDHISM</option>
				<option value="JAINISM">JAINISM</option>
				<option value="ZOROASTRIANISM">ZOROASTRIANISM</option>
				<option value="judaism">JUDAISM</option>
	 		</select>
		<td/>
		
		<td>
			<label>Reservation Type</label></br>
			<?php $this->load->view('enterence/multi_drop');?>
			<select name="basic[]" multiple="multiple" class="3col active" style="">
        			<option value="Diffrently Abled">Differently Abled</option>
        			<option value="Supernumerary Seats">Supernumerary Seats</option>
       				<option value="N.C.C. Cadets">N.C.C. Cadets</option>
				<option value="N.S.S. Volunteers">N.S.S. Volunteers</option>
        			<option value="Sports">Sports</option>
       				<option value="Wards / Dependants of Defence Personnel">Wards / Dependants of Defence Personnel</option>
				<option value="Kasmiri Migrants">Kashmiri Migrants</option>
        
   			</select>

    <script>
    $(function () {
        $('select[multiple].active.3col').multiselect({
            columns: 1,
            placeholder: 'Select Reservation',
            //search: true,
           // searchOptions: {
                //'default': 'Search States'
            //},
           // selectAll: true
        });

    });
</script>
		<td/>

		<td>	
			<label>Aadhar No.</label></br>
			<input type="text" name="entaadhar" placeholder="Enter Aadhar Number" MaxLength="13" value="<?php echo isset($_POST["entaadhar"]) ? $_POST["entaadhar"] : ''; ?>" >				
		<td/>

	</tr>
		
	<tr height=10></tr>
	<tr>
		
	</tr>
	</table>
</br>
<table style="width:100%;" border=2>
	<thead><tr><th align=left style="font-size:22px;" colspan=3>Permanent and Correspondence Address</th>
		<th align=right colspan=2  style="font-size:18px;">
		
	</th>
	</tr>
	
	</thead>
	<thead></thead>
	<tr>
		<td>
		<table style="width:100%;">
				<tr><td style="background-color:black;color:white;font-size:20px;text-align:left;" colspan=3><b>Permanent Address</b></td></tr>
		<tr height=10></tr>
			<tr><td>
			<label for="nnumber">Street</label></br>
			<input type="text" name="entpstreet" placeholder="Enter Your Street" id="street" value="<?php echo isset($_POST["entpstreet"]) ? $_POST["entpstreet"] : ''; ?>">
				   </td>
					
			<td><label for="nnumber">City</label></br>
			<input type="text" name="entpcity" placeholder="Enter Your City" id="city" value="<?php echo isset($_POST["entpcity"]) ? $_POST["entpcity"] : ''; ?>"></td>
			
		
			<td><label for="nnumber">State</label></br>
			<input type="text" name="entpstate" placeholder="Enter Your State" id="state" value="<?php echo isset($_POST["entpstate"]) ? $_POST["entpstate"] : ''; ?>"></td></tr><tr>
			<td><label for="nnumber">Postal Code</label></br>
			<input type="text" name="entpcode" placeholder="Enter Your Postal Code" id="pcode" value="<?php echo isset($_POST["entpcountry"]) ? $_POST["entpcountry"] : ''; ?>"></td>
				<td><label for="nnumber">Country</label></br>
			<input type="text" name="entpcountry" placeholder="Enter Your Country" id="country" value="<?php echo isset($_POST["entpcode"]) ? $_POST["entpcode"] : ''; ?>"></td>
		</table>
		</td>

		
	</tr>
	<tr height=20></tr>
	<tr>
		<td colspan=3 style="background-color:#38B0DE;color:white;font-weight:bold;font-size:20px;">Correspondence Address same as Permanent Address
			<input type="checkbox" value="" name="filltoo" id="filltoo" onclick="filladd()"/>
		</td>	
	</tr>
	<tr>
		<td colspan=3>
			<table style="width:100%;">
				<tr><td style="background-color:black;color:white;font-size:20px;text-align:left;"  colspan=3><b>Correspondence Address</b></td></tr>
		<tr height=10></tr>
				<tr><td>
					<label for="nnumber">Street</label></br>
					<input type="text" name="entcostreet" placeholder="Enter Your Street" id="street1" value="<?php echo isset($_POST["stu_addcostreet"]) ? $_POST["stu_addcostreet"] : ''; ?>">
				   </td>
				
			<td><label for="nnumber">City</label></br>
			<input type="text" name="entcocity" placeholder="Enter Your City" id="city1" value="<?php echo isset($_POST["stu_addcocity"]) ? $_POST["stu_addcocity"] : ''; ?>"></td>
			
		
			<td><label for="nnumber">State</label></br>
			<input type="text" name="entcostate" placeholder="Enter Your State" id="state1" value="<?php echo isset($_POST["stu_addcostate"]) ? $_POST["stu_addcostate"] : ''; ?>"></td></tr><tr>
			<td><label for="nnumber">Postal Code</label></br>
			<input type="text" name="entcocode" placeholder="Enter Your Postal Code" id="pcode1" value="<?php echo isset($_POST["stu_addcocode"]) ? $_POST["stu_addcocode"] : ''; ?>"></td>
				<td><label for="nnumber">Country</label></br>
			<input type="text" name="entcocountry" placeholder="Enter Your Country" id="country1" value="<?php echo isset($_POST["stu_addcocountry"]) ? $_POST["stu_addcocountry"] : ''; ?>"></td>
		</table>
		</tr>	
	</tr>
</table>

</br></br>
	<table style="width:100%;">
		<thead><tr><th align=left colspan="8" style="font-size:22px;">Family Detail</th></tr></thead>
		<tr height=10></tr>
		<tr>	
		<td>	
			<label for="nnumber">Father's Name</label></br>
			<input type="text" name="entfathername" placeholder="Enter Father Name" value="<?php echo isset($_POST["entfathername"]) ? $_POST["entfathername"] : ''; ?>"/>
		<td/>
				
		<td>	
			<label for="nnumber">Mother's Name</label></br>
			<input type="text" name="entmothername" placeholder="Enter Mother Name" value="<?php echo isset($_POST["entmothername"]) ? $_POST["entmothername"] : ''; ?>"/>
		<td/>

		<td>	
			<label for="nnumber">Father's Mobile No.</label></br>
			<input type="text" name="entfathermono" placeholder="Enter father mo. no." MaxLength="10" pattern="/^+91(7\d|8\d|9\d)\d{9}$/" value="<?php echo isset($_POST["entfathermono"]) ? $_POST["entfathermono"] : ''; ?>"/>		
		<td/>
		<td>	
			<label for="nnumber">Mother's Mobile No.</label></br>
			<input type="text" name="entmothermono" placeholder="Enter mother mo. no." MaxLength="10" pattern="/^+91(7\d|8\d|9\d)\d{9}$/" value="<?php echo isset($_POST["entmothermono"]) ? $_POST["entmothermono"] : ''; ?>"/>	
		<td/>
	</tr>


	<tr>	
		<td>	
			<label for="nnumber">Father's Occupation</label></br>
			<input type="text" name="entfatheroccu" placeholder="Enter father occupation" value="<?php echo isset($_POST["entfatheroccu"]) ? $_POST["entfatheroccu"] : ''; ?>"/>
		<td/>
				
		<td>	
			<label for="nnumber">Mother's Occupation</label></br>
			<input type="text" name="entmotheroccu" placeholder="Enter mother occupation" value="<?php echo isset($_POST["entmotheroccu"]) ? $_POST["entmotheroccu"] : ''; ?>"/>
		<td/>

	</tr>
		 
	</table>

</br>
<table style="width:10%;">
	<tr>
			<td><input type="submit" name="addstudent" value="Submit" style="width:100%;height:35px;font-size:18px;"></td>
			<td><input type="reset" name="reset" value="Reset" style="width:100%;height:35px;font-size:18px;"></td>
		</tr>
</table>

</form>

</center>


<?php $this->load->view('template/footer'); ?>
</body>
</html>
