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
# Admistrate branches.
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
$tby = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top","#ffcc00",$th_box_body_font_color,"left","top");
?>

<!-- content -->
<?php
debugparam();
if (!isset($leaves)) $leaves = ":1:";
if (isset($addid)) $leaves .= ":$addid:";
if (isset($delid)) $leaves = str_replace (":$delid:", "", $leaves);

if ($action == "db_add") {					// DB ADD
	$query = "INSERT tblbranch SET branch_name='$name', branch_parent='$bran_id'";
	if (!$db->query($query)) mysql_die($db);
} 
else if ($action == "db_delete") {				// DB DELETE
	$query = "DELETE FROM tblbranch WHERE branch_id='$bran_id'";
	if (!$db->query($query)) mysql_die($db);
}
else if ($action == "db_change") {				// DB CHANGE
	$query = "UPDATE tblbranch SET branch_name='$name' WHERE branch_id=$bran_id";
	if (!$db->query($query)) mysql_die($db);
}

if ($action == "add") {						// ADD
	$bran_id   = rawurldecode($bran_id);
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Add Branch"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	/*----------*/
	echo "<b>".$t->translate("Branch").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='name' value=''>";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();
	$tbw->table_body_column("");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_add'>";
	echo "<input type='hidden' name='bran_id' value='$bran_id'>";
	echo "<input type='hidden' name='leaves' value='$leaves'>";
	echo "<input type='submit' value='".$t->translate("Add")."'>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==========*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='submit' value='".$t->translate("Back")."'>";	
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	echo "</form>";
	/*----------*/
	$tbw->table_end();
	/*-----------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();
}
else if($action == "delete") {					// DELETE
	$bran_id   = rawurldecode($bran_id);
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Delete Branch"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	/*----------*/
	echo "<b>".$t->translate("Branch").":</b>";
	$tbw->table_body_column_next(2);
	echo "$name";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();
	$tbw->table_body_column("");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_delete'>";	
	echo "<input type='hidden' name='bran_id' value='$bran_id'>";
	echo "<input type='submit' value='".$t->translate("Delete")."'>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==========*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='submit' value='".$t->translate("Back")."'>";	
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	echo "</form>";
	/*----------*/
	$tbw->table_end();
	/*-----------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();
}
else if ($action == "change") {					// CHANGE
	$bran_id   = rawurldecode($bran_id);
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Change Branch"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Branch").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='name' value='$name'>";
	$tbw->table_body_column_end();

	// buttons
	$tbw->table_row_next();
	$tbw->table_body_column("");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='bran_id' value='$bran_id'>";
	echo "<input type='hidden' name='action' value='db_change'>";
	echo "<input type='submit' value='".$t->translate("Change")."'>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==========*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='submit' value='".$t->translate("Back")."'>";	
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	echo "</form>";
	/*----------*/
	$tbw->table_end();
	/*-----------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();
}
else {											// TABLE
	/*------------------------------------------------------- BOX tbllicense */
	$bx->box_begin();
	$bx->box_title($t->translate("Branch Administration"));
	$bx->box_body_begin();
	/*----------------------------------------------------------- whole Tree */

	adm_branch_tree(0,0);

	/*-----------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();

	/*-----------------------------------------------------------------------*/
	echo "<div align='center'>";
	echo "<form action='".$sess->url("index.php")."' method='POST'>";
	echo "<input type='submit' value='".$t->translate("Home")."'>";
	echo "</form>";
	echo "</div>";
}
?>
<!-- end content -->

<?php
require("footer.inc");
@page_close();
?>