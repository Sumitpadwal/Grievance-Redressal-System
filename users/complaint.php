<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
  { 
header('location:index.php');
}
else{

if(isset($_POST['submit']))
{

$uid=$_SESSION['id'];
$category=$_POST['category'];
$subcat=$_POST['subcategory'];
$complaintype=$_POST['complaintype'];
$state=$_POST['state'];
$priority=$_POST['priority'];
$noc=$_POST['noc'];
$complaintdetials=$_POST['complaindetails'];
$compfile=$_FILES["compfile"]["name"];



move_uploaded_file($_FILES["compfile"]["tmp_name"],"complaintdocs/".$_FILES["compfile"]["name"]);
$query=mysqli_query($con,"insert into tblcomplaints(userId,category,subcategory,complaintType,state,noc,complaintDetails,complaintFile,priority) values('$uid','$category','$subcat','$complaintype','$state','$noc','$complaintdetials','$compfile','$priority')");
// code for show complaint number
$sql=mysqli_query($con,"select complaintNumber from tblcomplaints  order by complaintNumber desc limit 1");
while($row=mysqli_fetch_array($sql))
{
 $cmpn=$row['complaintNumber'];
}
$complainno=$cmpn;
echo '<script> alert("Your complain has been successfully filled and your complaintno is  "+"'.$complainno.'")</script>';
}
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link href="assets/css/bootstrap.css" rel="stylesheet">
	 <link rel="stylesheet" href="assets/css/child-style.css">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
    <link href="assets/css/style.css" rel="stylesheet">
	 <link rel="stylesheet" href="assets/css/child-style.css">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
	 <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
	     <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  
    <title>Hello, world!</title>
 <script>
function getCat(val) {
  $.ajax({
    type: "POST",
    url: "getsubcat.php",
    data: 'catid=' + val,
    success: function(data) {
      $("#subcategory").html(data);
    }
  });
}
  
  $("#subcategory").on("change", function(event) {
  event.preventDefault();
  getCat($(this).val());
}, { passive: false });
  </script>
  </head>
  <body>
      
<?php include("includes/header.php");?>

<div class="usershome">
<?php include("includes/sidebar.php");?>
</div>

<div class="col-lg-10" style="top: 10em;
    left: 11%;">
                  <div class="form-panel">
											
						 <?php if($successmsg)
											  {?>
											  <div class="alert alert-success alert-dismissable">
											   <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
											  <b>Well done!</b> <?php echo htmlentities($successmsg);?></div>
											  <?php }?>

						   <?php if($errormsg)
											  {?>
											  <div class="alert alert-danger alert-dismissable">
						 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
											  <b>Oh snap!</b> </b> <?php echo htmlentities($errormsg);?></div>
											  <?php }?>

                  
	
	
                 <form class="form-horizontal style-form" method="post" name="complaint" enctype="multipart/form-data" >
					 
					<div class="form-group">
					
				

						<div class="col-sm-6 cmpinput1">
							<label>Complaint Number</label>
							<input type="text" name="fullname" required="required" value="<?php echo htmlentities($row['fullName']);?>" class="form-control" readonly>
						</div>

						<div class="col-sm-6 cmpinput2">
							<label>State</label>
							<select name="state" required="required" class="form-control" disabled>
								<option value="new">New</option >
								
							</select>
						</div>
						
						<div class="col-sm-6 cmpinput1">
							<label>Priority</label>
							<select name="priority" required="required" class="form-control">
								<option value="P1">P1</option>
								<option value="P2">P2</option>

							</select>
						</div>

						<div class="col-sm-6 cmpinput2">
							<label>Opened On</label> 
							<input type="text" name="contactno" required="required" value="<?php echo htmlentities($row['contactNo']);?>" class="form-control" readonly>
						</div>
						
						<div class="col-sm-6 cmpinput1">
							<label>Applicant Type</label>
							<select name="noc"  class="form-control" required="">
								<option value="applicanttype">Applicant Type</option>
								<option value="Student"> Student</option>
								<option value="Teacher">Teacher</option>
								<option value="Parent">Parent</option>
								<option value="Alumini">Alumini</option>
								<option value="Staff">Staff</option>
								<option value="HOD">HOD</option>
							</select> 
						</div>

						<div class="col-sm-6 cmpinput1">
							<label>Assignment Deptartment</label>
							<input type="text" name="fullname" required="required" value="<?php echo htmlentities($row['fullName']);?>" class="form-control" readonly>
						</div>
						<div class="col-sm-6 cmpinput1">
							<label>Category</label>
							<select name="category" id="category" class="form-control" onChange="getCat(this.value);" required="">
								<option value="">Select Category</option>
								<?php $sql=mysqli_query($con,"select id,categoryName from category ");
								while ($rw=mysqli_fetch_array($sql)) {
								  ?>
								  <option value="<?php echo htmlentities($rw['id']);?>"><?php echo htmlentities($rw['categoryName']);?></option>
								<?php
								}
								?>
							</select>
						</div>
						<div class="col-sm-6 cmpinput2">
							<label>SubCategory</label>
							<select name="subcategory" id="subcategory" class="form-control" >
								<option value="">Select Subcategory</option>
							</select>
						</div>
						
						<div class="col-sm-6 cmpinput2">
							<label>Assigned to</label>
							<input type="text" name="contactno" required="required" value="<?php echo htmlentities($row['contactNo']);?>" class="form-control" readonly>
						</div>
						
						<div class="col-sm-6 cmpinput2">
							<label>Complaint Type</label>
							<select name="complaintype" class="form-control" required="">
								<option value=" Complaint"> Complaint</option>
								<option value="General Query">General Query</option>
							</select> 
						</div>
						
						<div class="col-sm-12 cmpinput1 shortdesc">
							<label>Short Description</label>
							<textarea  name="complaindetails" required="required" cols="10" rows="3" class="form-control" maxlength="2000"></textarea>
						</div>
						
						

						
					 <div class="form-group">
						<div class="col-sm-12" style="text-align:center;">
							
							<button type="submit" name="submit" class="btn btn-primary">Submit</button>
						</div>
						</div>
					</div>

				</form>
											  </div>
											  </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	    <!-- js placed at the end of the document so the pages load faster -->
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="assets/js/bootstrap-switch.js"></script>
	
	<!--custom tagsinput-->
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	<!--custom checkbox & radio-->
	
	<script type="text/javascript" src="assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
	
	<script src="assets/js/form-component.js"></script>    
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

	  <script src="assets/js/child-script.js"></script>
   
  </body>
</html>
<?php } ?>
