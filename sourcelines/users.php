<?php

######################################################################
# SourceLines: Open Source Solutions
# ===================================================================
#
# Copyright (c) 2001 by
#                Lutz Henckel (lutz.henckel@fokus.gmd.de) and
#                Norbert Geiges
#
# BerliOS SourceLines: http://sourcelines.berlios.de
# BerliOS - The OpenSource Mediator: http://www.berlios.de
#
# Lists all registered users.
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
###################################################################### 

require("./include/prepend.php3");

page_open(array("sess" => "SourceLines_Session"));
if (isset($auth) && !empty($auth->auth["perm"])) {
  page_close();
  page_open(array("sess" => "SourceLines_Session",
                  "auth" => "SourceLines_Auth",
                  "perm" => "SourceLines_Perm"));
}

require("./include/header.inc");

$bx = new box("100%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$be = new box("80%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);
$bs = new box("100%",$th_strip_frame_color,$th_strip_frame_width,$th_strip_title_bgcolor,$th_strip_title_font_color,$th_strip_title_align,$th_strip_body_bgcolor,$th_strip_body_font_color,$th_strip_body_align);
?>

<!-- content -->
<?php
if (($config_perm_users != "all") && (!isset($perm) || !$perm->have_perm($config_perm_users))) {
  $be->box_full($t->translate("Error"), $t->translate("Access denied"));
} else {

  if (!isset($by) || empty($by)) {
    $by = "";
  }

  $alphabet = array ("A","B","C","D","E","F","G","H","I","J","K","L",
		"M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
  $msg = "[ ";

  while (list(, $ltr) = each($alphabet)) {
    $msg .= "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => $ltr."%"))."\">$ltr</a> | ";
  }

  $msg .= "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "%"))."\">".$t->translate("All")."</a> ]";

  $bs->box_strip($msg);
  $db->query("SELECT * FROM auth_user WHERE username LIKE '$by' ORDER BY username ASC");
  $bx->box_begin();
  $bx->box_title($t->translate("Users"));
  $bx->box_body_begin();
  echo "<table border=0 align=center cellspacing=1 cellpadding=1 width=100%>\n";
  echo "<tr><td><b>".$t->translate("No").".</b></td><td><b>#&nbsp;".$t->translate("Sols")."</b></td><td><b>".$t->translate("Username")."</b></td><td><b>".$t->translate("Realname")."</b></td><td><b>".$t->translate("E-Mail")."</b></td></tr>\n";

  $i = 1;
  while($db->next_record()) {
    $user_id = $db->f("user_id");
    $username = $db->f("username");
    $db2 = new DB_SourceLines;
    $db2->query("SELECT COUNT(*) FROM tblsolutions WHERE username='$username' AND solutions_name != 'no_name'");
    $db2->next_record();
    $num = "[".sprintf("%03d",$db2->f("COUNT(*)"))."]";
    echo "<tr><td>".sprintf("%d",$i)."</td>\n";
    echo "<td><a href=\"".$sess->url("yoursolutions.php").$sess->add_query(array("user" => $username))."\">$num</a></td>\n";
    echo "<td>".$username."</td>\n";
    echo "<td>".$db->f("realname")."</td>";
    echo "<td>&lt;<a href=\"mailto:".$db->f("email_usr")."\">".ereg_replace("@"," at ",htmlentities($db->f("email_usr")))."</a>&gt;</td>";
    echo "</tr>\n";
    $i++;
  }
echo "</table>\n";
$bx->box_body_end();
$bx->box_end();
}
?>
<!-- end content -->

<?php
require("footer.inc");
page_close();
?>