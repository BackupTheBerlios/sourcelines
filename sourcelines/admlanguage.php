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
# Add/change/delete languages of a solution.
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

/*----------Box-Definitionen----------*/
$bx = new box("60%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$be = new box("",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);

/*----------Table-Definitionen----------*/
$tbw = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","middle");
$tby = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top","#ffffcc",$th_box_body_font_color,"left","top");
?>

<!-- content -->
<?php
if (($config_perm_admlang != "all") && (!isset($perm) || !$perm->have_perm($config_perm_admlang))) {
  $be->box_full($t->translate("Error"), $t->translate("Access denied"));
} else {

if ($action == "db_change") {					// DB CHANGE
	$query = "UPDATE tbllanguage SET language_name='$name' WHERE language_id=$id";
	if (!$db->query($query)) mysql_die($db);
}
else if ($action == "db_delete") {				// DB DELETE
	$query = "DELETE FROM tbllanguage WHERE language_id=$id ";
	if (!$db->query($query)) mysql_die($db);
}
else if ($action == "db_add") {					// DB_ADD
	$query = "INSERT tbllanguage(language_name) VALUES('$name') ";
	if (!$db->query($query)) mysql_die($db);
}

if ($action == "change") {						// CHANGE
	$id   = rawurldecode($id);
	$name = rawurldecode($name);
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Change Language"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Language").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='128' name='name' value='$name'>";
	$tbw->table_body_column_end();

	// buttons
	$tbw->table_row_next();
	$tbw->table_body_column("");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='id' value='$id'>";
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
else if($action == "delete") {					// DELETE
	$id   = rawurldecode($id);
	$name = rawurldecode($name);
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Delete Language"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	/*----------*/
	echo "<b>".$t->translate("Language").":</b>";
	$tbw->table_body_column_next(2);
	echo "$name";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();
	$tbw->table_body_column("");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='id' value='$id'>";
	echo "<input type='hidden' name='action' value='db_delete'>";	
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
else if ($action == "add") {					// ADD
	$bx->box_begin();
	$bx->box_title($t->translate("Add Language"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	/*----------*/
	echo "<b>".$t->translate("Language").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='128' name='name' value=''>";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();
	$tbw->table_body_column("");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_add'>";
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
else {											// TABLE
	/*------------------------------------------------------- BOX tbllicense */
	$bx->box_begin();
	$bx->box_title($t->translate("Language Administration"));
	$bx->box_body_begin();
	/*---------------------------------------------------------- whole Table */
	$query = "SELECT * FROM tbllanguage ORDER BY language_name";
	$db->query($query);	
	/*-------------------*/	
	$tby->table_begin();
	$tby->table_row_begin();
	while($db->next_record()) {
		$tby->table_body_column_begin();
		/*----------*/
		echo $db->f("language_name");
		/*----------*/				
		$tby->table_body_column_next();
		echo '<b><a href="'.$sess->url(basename($PHP_SELF)).$sess->add_query(array("action"=>"change", "id"=>$db->f("language_id"), "name"=>$db->f("language_name"))).'">'.$t->translate("Change").'</a></b>';
		/*----------*/
		$tby->table_body_column_next();
		echo '<b><a href="'.$sess->url(basename($PHP_SELF)).$sess->add_query(array("action"=>"delete", "id"=>$db->f("language_id"), "name"=>$db->f("language_name"))).'">'.$t->translate("Delete").'</a></b>';
		/*----------*/
		$tby->table_body_column_end();
		$tby->table_row_end();
	}
	if($db->num_rows()>0) $db->seek(0);
	$tby->table_end();
	/*----------*/						// Tabelle genommen wegen Style
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action"=>"add"))."'>".$t->translate("Add")."</a></b> ".$t->translate("new language");
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	$tbw->table_end();
	/*-----------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();
}
}
?>
<!-- end content -->

<?php
require("footer.inc");
@page_close();
?>