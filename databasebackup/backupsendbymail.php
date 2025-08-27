<?php

date_default_timezone_set('Asia/Dhaka');
$currentDate = date("Y_m_d");

// (A) EMAIL SETTINGS
// $mailTo = "rubel714@yahoo.com,bbssl6303@gmail.com";
$mailTo = "rubel714@yahoo.com";
$mailSubject = "Talukder International Database Backup (talukder_mtidb) ".$currentDate;
$mailMessage = "<strong>This is talukder international mti database backup</strong>";
$mailAttach = $currentDate."_talukder_mtidb.sql.gz";
//2022_08_24_talukder_mtidb.sql.gz


// (B) GENERATE RANDOM BOUNDARY TO SEPARATE MESSAGE & ATTACHMENTS
// https://www.w3.org/Protocols/rfc1341/7_2_Multipart.html
$mailBoundary = md5(time());
$mailHead = implode("\r\n", [
  "MIME-Version: 1.0",
  "Content-Type: multipart/mixed; boundary=\"$mailBoundary\""
]);

// (C) DEFINE THE EMAIL MESSAGE
$mailBody = implode("\r\n", [
  "--$mailBoundary",
  "Content-type: text/html; charset=utf-8",
  "",
  $mailMessage
]);

// (D) MANUALLY ENCODE & ATTACH THE FILE
$mailBody .= implode("\r\n", [
  "",
  "--$mailBoundary",
  "Content-Type: application/octet-stream; name=\"". basename($mailAttach) . "\"",
  "Content-Transfer-Encoding: base64",
  "Content-Disposition: attachment",
  "",
  chunk_split(base64_encode(file_get_contents($mailAttach))),
  "--$mailBoundary--"
]);

// (E) SEND
echo mail($mailTo, $mailSubject, $mailBody, $mailHead)
  ? "OK" : "ERROR" ;