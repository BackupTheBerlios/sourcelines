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
# Lists contact persons of the solutions in alphabetical order
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
######################################################################

page_open(array("sess" => "SourceLines_Session"));
if (isset($auth) && !empty($auth->auth["perm"])) {
  page_close();
  page_open(array("sess" => "SourceLines_Session",
                  "auth" => "SourceLines_Auth",
                  "perm" => "SourceLines_Perm"));
}

require "header.inc";

$bx = new box("100%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$be = new box("",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);
$bs = new box("100%",$th_strip_frame_color,$th_strip_frame_width,$th_strip_title_bgcolor,$th_strip_title_font_color,$th_strip_title_align,$th_strip_body_bgcolor,$th_strip_body_font_color,$th_strip_body_align);
?>

<!-- content -->
<?php
if (($config_perm_developer != "all") && (!isset($perm) || !$perm->have_perm($config_perm_developer))) {
  $be->box_full($t->translate("Error"), $t->translate("Access denied"));
} else {

  if (!isset($by) || empty($by)) {
    $by = "";
  }

  $alphabet = array ("A","B","C","D","E","F","G","H","I","J","K","L",
		"M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
  $msg = "[ ";

  while (list(, $ltr) = each($alphabet)) {
    $msg .= "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => $ltr."%"))."\">$ltr</a>&nbsp;| ";
  }

  $msg .= "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "%"))."\">".$t->translate("All")."</a>&nbsp;| ";
  $msg .= "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => ""))."\">".$t->translate("Unknown")."</a>&nbsp;]";

  $bs->box_strip($msg);
  $db->query("SELECT DISTINCT solutions_contact_name,solutions_contact_email,solutions_contact_url FROM tblsolutions WHERE solutions_contact_name LIKE '$by' ORDER BY solutions_contact_name ASC");
  $bx->box_begin();
  $bx->box_title($t->translate("Contact"));
  $bx->box_body_begin();		
?>
<table border=0 align=center cellspacing=1 cellpadding=1 width=100%>
<?php
  echo "<tr><td><b>".$t->translate("No").".</b></td><td><b>#&nbsp;".$t->translate("Sols")."</b></td><td><b>".$t->translate("Name")."</b></td><td><b>".$t->translate("E-Mail")."</b></td><td><b>".$t->translate("Homepage")."</b></td></tr>\n";
  $i = 1;
  while($db->next_record()) {
    $solutions_contact_name = addslashes($db->f("solutions_contact_name"));
    $solutions_contact_email = $db->f("solutions_contact_email");
    $solutions_contact_url = $db->f("solutions_contact_url");
    $db2 = new DB_SourceLines;
    $db2->query("SELECT COUNT(*) FROM tblsolutions WHERE solutions_contact_name='$solutions_contact_name' AND solutions_contact_email='$solutions_contact_email' AND solutions_contact_url='$solutions_contact_url'");
    $db2->next_record();
    if ($db2->f("COUNT(*)")) {
      $num = "[".sprintf("%03d",$db2->f("COUNT(*)"))."]";
      echo "<tr><td>".sprintf("%d",$i)."</td>\n";
      if (empty($solutions_contact_name)) {
	echo "<td><a href=\"".$sess->url("a_contact_solutions.php").$sess->add_query(array("solutions_contact_name" => "", "solutions_contact_email" => "$solutions_contact_email", "solutions_contact_url" => "$solutions_contact_url"))."\">$num</a></td>\n";
	echo "<td>".$t->translate("Unknown")."</td>\n";
      } else {
	echo "<td><a href=\"".$sess->url("a_contact_solutions.php").$sess->add_query(array("solutions_contact_name" => $db->f("solutions_contact_name"), "solutions_contact_email" => "$solutions_contact_email", "solutions_contact_url" => "$solutions_contact_url"))."\">$num</a></td>\n";
        echo "<td>".$db->f("solutions_contact_name")."</td>\n";
      }
      if (!empty($solutions_contact_email)) {
        echo "<td>&lt;<a href=\"mailto:".$solutions_contact_email."\">".ereg_replace("@"," at ",htmlentities($solutions_contact_email))."</a>&gt;</td>\n";
      } else {
        echo "<td>&nbsp;</td>\n";
      }
      if (!empty($solutions_contact_url)) {
        echo "<td><a href=\"".$solutions_contact_url."\">".$solutions_contact_url."</a></td>\n";
      } else {
        echo "<td>&nbsp;</td>\n";
      }
      echo "</tr>\n";
      $i++;
    }
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
