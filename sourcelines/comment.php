<?php

######################################################################
# SourceLines: Open Source Solutions
# ===================================================================
#
# Copyright (c) 2001 by
#                Lutz Henckel (lutz.henckel@fokus.gmd.de) and
#                Gregorio Robles (grex@scouts-es.org)
#
# BerliOS SourceLines: http://sourcelines.berlios.de
# BerliOS - The OpenSource Mediator: http://www.berlios.de
#
# Adding comments to a solution.
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
######################################################################

page_open(array("sess" => "SourceLines_Session",
                "auth" => "SourceLines_Auth",
                "perm" => "SourceLines_Perm"));

require("header.inc");

/*---------- Box-Definitionen -----------------------------------------------*/
$bx = new box("100%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$be = new box("",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);

/*---------- Table-Definitionen ---------------------------------------------*/
$tbw = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","middle");
$tbf = new table("100%","0","0","0",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","top");
$tbg = new table("100%","0","0","0",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_title_bgcolor,$th_box_body_font_color,"left","middle");
?>

<!-- content -->
<?php
if ($perm->have_perm("user_pending")) {
	$be->box_full($t->translate("Error"), $t->translate("Access denied"));
} else {
	if (isset($id)) {
    	$query = "SELECT * FROM tblsolutions WHERE solutions_id='$id'";
    	$db->query($query);
    	$db->next_record();

		// If solution in table ask for comment
    	$db_status = $db->f("status");
    	if ($db->num_rows() > 0) {
			if ($action == "cmt") {
    			$query = "INSERT tblcomment SET solutions_id='$id',comment_subject='$subject',comment_text='$text',comment_username='".$auth->auth["uname"]."',comment_datetime='".date("Y-m-d H:i:s")."'";
    			$db_cmt = new DB_SourceLines;
    			$db_cmt->query($query);
				solfull($db);
			} else {
				$bx->box_begin();
				$bx->box_title($t->translate("Your Comment about")." \"".$db->f("solutions_name")."\"");
				$bx->box_body_begin();
				echo "<form action=\"".$sess->url(basename($PHP_SELF))."\" method=\"POST\">\n";
				echo "<table border=0 align=center cellspacing=0 cellpadding=3>\n";
				echo "<tr><td align=right>".$t->translate("Subject")." (128):</td><td><input type=\"TEXT\" name=\"subject\" size=40 maxlength=128></td></tr>\n";
				echo "<tr><td align=right>".$t->translate("Comment")." (*):</td><td><textarea cols=40 rows=7 name=\"text\" wrap=\"virtual\" maxlength=255></textarea></td></tr>\n";
				echo "<tr><td align=right>&nbsp;</td><td><input type=\"Submit\" value=\"".$t->translate("Send")."\"></td>\n";
				echo "<input type=\"hidden\" name=\"action\" value=\"cmt\">\n";
				echo "<input type=\"hidden\" name=\"id\" value=\"$id\">\n";
				echo "</form>\n";
				echo "</tr></table>\n";
				$bx->box_body_end();
				$bx->box_end();
			}
		// If solution is not in table
    	} else {
        	$be->box_full($t->translate("Error"), $t->translate("Solution")." (ID: $id) ".$t->translate("does not exist").".");
		}
	} else {
		$be->box_full($t->translate("Error"), $t->translate("No Solution ID specified"));
	}
}
?>
<!-- end content -->

<?php
require("footer.inc");
page_close();
?>