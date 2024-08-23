<?php
include('includes/config.php');
error_reporting(0);
if(isset($_POST['submit']))
{
    
	$fullname=$_POST['fullname'];
	$email=$_POST['email'];
	$password=md5($_POST['password']);
	$contactno=$_POST['contactno'];
	$status=1;
	$query=mysqli_query($con,"insert into users(fullName,userEmail,password,contactNo,status) values('$fullname','$email','$password','$contactno','$status')");
	$msg="Registration successfull. Now You can login !";
	 include('login-system-main/connect/connection.php');
        
            //session_start ();
           

            require "login-system-main/Mail/phpmailer/PHPMailerAutoload.php";
            $mail = new PHPMailer;

            $mail->isSMTP();
            $mail->Host='smtp.gmail.com';
            $mail->Port=587;
            $mail->SMTPAuth=true;
            $mail->SMTPSecure='tls';

            // h-hotel account
            $mail->Username='adypugrs@gmail.com';
            $mail->Password='ezxjpwpkkuquftzg';

            // send by h-hotel email
            $mail->setFrom('adypugrs@gmail.com', 'GRS registration');
            // get email from input
            $mail->addAddress($_POST['email']);
            //$mail->addReplyTo('lamkaizhe16@gmail.com');

            // HTML body
            $mail->isHTML(true);
            $mail->Subject="Thank You for Registering - Ajeenkya D Y Patil University Grievance Redressal Website";
            $mail->Body="Dear <b>$fullname</b>,<br><br>" .
           "<p>We are thrilled to welcome you to the <strong>Ajeenkya D Y Patil University Grievance Redressal Website!</strong> Your registration has been successfully processed, and we are delighted to have you as a part of our community.</p><br>" .
           "<p>Your registration details:</p><br>" .
           "<ul>" .
           "<li><strong>Username:</strong> $fullname</li>" .
           "<li><strong>Email Address:</strong> $email</li>" .
           "</ul><br>" .
           "<p>Should you encounter any issues or have any questions regarding our Grievance Redressal Website, please do not hesitate to contact us at <a href='mailto:adypugrs@gmail.com'>adypugrs@gmail.com</a> or reach out through the website.</p><br>" .
           "<p>Thank you once again for choosing to be a part of our community and for your commitment to making Ajeenkya D Y Patil University a better place. We look forward to serving you and ensuring your experience with us is positive and fulfilling.</p><br>" .
           "<p>Best regards,</p><br>" .
           "<p><strong>Grievance Support Team</strong><br>" .
           "Ajeenkya D Y Patil University</p>";


            if(!$mail->send()){
                ?>
                    <script>
                        alert("<?php echo " Invalid Email "?>");
                    </script>
                <?php
            }else{ ?>
                <script>
window.alert("success");
</script> <?php
            }
        

	 

}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Grievance Redressal System | User Registration</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    	<script>
function userAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'email='+$("#email").val(),
type: "POST",
success:function(data){
$("#user-availability-status1").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>
  </head>

  <body>
	  <div id="login-page">
	  	<div class="container">
		
	<h3 align="center" style="color: #333;"><strong><a href="../index.php" style="color: #333;">Grievance Redressal System</a></strong></h3>
<h4 align="center" style="color: #333;"><strong><a href="../index.php" style="color: #333;">Back to Portal</a></strong></h4>

	
	
	<hr />
		      <form class="form-login" method="post">
		        <h2 class="form-login-heading">User Registration</h2>
		        <p style="padding-left: 1%; color: green">
		        	<?php if($msg){
echo htmlentities($msg);
		        		}?>


		        </p>
		        <div class="login-wrap">
		         <input type="text" class="form-control" placeholder="Full Name" name="fullname" required="required" autofocus>
		            <br>
		            <input type="email" class="form-control" placeholder="Email ID" id="email" onBlur="userAvailability()" name="email" required="required">
		             <span id="user-availability-status1" style="font-size:12px;"></span>
		            <br>
					
					<input type="password" class="form-control" placeholder="Password" required="required" name="password"><br >
					<input type="password" class="form-control" placeholder="Confirm Password" required="required" name="repassword"><br >
		             <input type="text" class="form-control" maxlength="10" name="contactno" placeholder="Contact no" required="required" autofocus>
		            <br>
					
					

		            
		            <button class="btn btn-theme btn-block"  type="submit" name="submit" id="submit"><i class="fa fa-user"></i> Register</button>
		            <hr>
		            
		            <div class="registration">
		                Already Registered<br/>
		                <a class="" href="index.php">
		                   Sign in
		                </a>
		            </div>
		
		        </div>
		
		      
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/login-bg.jpg", {speed: 500});
    </script>


  </body>
</html>

