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
# Add new solution.
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
debugparam();
if (isset($auth) && !empty($auth->auth["perm"]) && !($logout)) {
	if ($perm->have_perm("user") || $perm->have_perm("admin")) {
		/*=========================*/
		$username = $auth->auth["uname"];		// !!!
		/*=========================*/
		if(!isset($solu_id)) {	// 1. Eintrag, u.a. zur Bestimmung der solu_id!!!
			$random = rand(0,2147000000);
			$query = "INSERT tblsolutions(solutions_name,username,solutions_create_date,solutions_modify_date) VALUES('$random','$username','".date("Y-m-d H:i:s")."','".date("Y-m-d H:i:s")."')";
			debug($query);
			$db->query($query);
			/*-----*/		// Bestimmung von $solu_id
			$query = "SELECT * FROM tblsolutions WHERE solutions_name='$random' AND username='$username'";
			debug($query);
			$db->query($query);
			$db->next_record();
			$solu_id = $db->f("solutions_id");
			$db1 = new DB_SourceLines;
			$query = "UPDATE tblsolutions SET solutions_name='no_name' WHERE solutions_id = '$solu_id'";
			debug($query);
			$db1->query($query);
			$where = "";
		} else {
			if ($perm->have_perm("admin"))
				$where = "";
			else
				$where = " AND tblsolutions.username='$username'";
		}
		$query = "SELECT * FROM tblsolutions,auth_user WHERE solutions_id='$solu_id' $where  AND tblsolutions.username = auth_user.username";
		debug($query);
		/*---------------------------------------- Daten der aktuellen Seite */
		$db->query($query);
		$db->next_record();
		solupd($db);
	}
}
?>
<!-- end content -->

<?php
require("footer.inc");
@page_close();
?>