<?php
require_once 'vendor/autoload.php';

use PHPMailer\PHPMailer\PHPMailer;

function send_email($subject, $to, $to_name, $from_name, $html, $alt_body = '')
{
    $mail = new PHPMailer();
    $mail->isSMTP();
    $mail->Host = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'rezavanessa.accggl@gmail.com';
    $mail->Password = 'pcumxzbhklenfuxs';
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port = 587;

    $mail->setFrom('rezavanessa.accggl@gmail.com', $from_name);
    $mail->addAddress($to, $to_name);
    $mail->Subject = $subject;
    // Set HTML 
    $mail->isHTML(TRUE);
    $mail->Body = $html;
    $mail->AltBody = $alt_body;

    if (!$mail->send()) {
        // echo 'Message could not be sent.';
        // echo 'Mailer Error: ' . $mail->ErrorInfo;
        return false;
    } else {
        return true;
        // echo 'Message has been sent';
    }
}
