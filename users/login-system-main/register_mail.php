<?php
 require "Mail/phpmailer/PHPMailerAutoload.php";
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
            $mail->setFrom('adypugrs@gmail.com', 'Password Reset');
            // get email from input
            $mail->addAddress($row['email']);
            //$mail->addReplyTo('lamkaizhe16@gmail.com');

            // HTML body
            $mail->isHTML(true);
            $mail->Subject="Registration successfulld";
            $mail->Body="<b>Dear User</b>
            <h3>Registration successfull. Now You can login !</h3>
            <p>Kindly click the below link to login </p>
            https://adypugrs.misotech.in/users/
            <br><br>
            <p>With regrads,</p>
            <b>DY patil</b>";
            
            ?>