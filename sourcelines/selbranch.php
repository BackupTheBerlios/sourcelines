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
# Set branch of a solution.
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
######################################################################  

require("./include/prepend.php3");

page_open(array("sess" => "SourceLines_Session",
                "auth" => "SourceLines_Auth",
                "perm" => "SourceLines_Perm"));

require("./include/header.inc");

/*---------- Box-Definitionen -----------------------------------------------*/
$bx = new box("100%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$be = new box("",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);

/*---------- Table-Definitionen ---------------------------------------------*/
$tbw = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","middle");
$tby = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top","#ffcc00",$th_box_body_font_color,"left","top");
?>

<!-- content -->
<?php
debugparam();
if (isset($bran_id)) {
	if ($bran_id != 0) 
		$leaves = branch_leaves($bran_id);
} else {
	$db->query("SELECT * FROM tblsolutions WHERE solutions_id='$solu_id'");
	$db->next_record();
	$bran_id = $db->f("branch_id");
}
if (!isset($leaves)) $leaves = ":1:";
if (isset($addid)) $leaves .= ":$addid:";
if (isset($delid)) $leaves = str_replace (":$delid:", "", $leaves);

if ($action == "db_set") {					// DB SET
	$query = "UPDATE tblsolutions SET branch_id='$bran_id' WHERE solutions_id='$solu_id'";
	$db->query($query);
}

	/*------------------------------------------------------- BOX tbllicense */
	$bx->box_begin();
	$bx->box_title($t->translate("Select Branch of Solution"));
	$bx->box_body_begin();

	echo "<p><a href=\"http://www.destatis.de/allg/d/klassif/wz93.htm\" target=\"_blank\">Klassifikation der Wirtschaftszweige, Ausgabe 1993 (WZ 93)</a><br>\n";
	echo "Copyright (C) <a href=\"http://www.destatis.de/\" target=\"_blank\">Statistisches Bundesamt</a>, Wiesbaden 1999<br>\n";

	/*----------------------------------------------------------- whole Tree */

	branch_tree(0,0,$bran_id);

	/*-----------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();

	/*-----------------------------------------------------------------------*/
	echo "<p align='center'><b>[<a href='".$sess->url("newsolutions.php").$sess->add_query(array("solu_id" => $solu_id))."'>".$t->translate("Back to your solution")."</a>]</b>";
?>
<!-- end content -->

<?php
require("footer.inc");
@page_close();
?>
