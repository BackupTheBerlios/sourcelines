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
# Administrate licenses
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
if (($config_perm_admlicens != "all") && (!isset($perm) || !$perm->have_perm($config_perm_admlicens))) {
  $be->box_full($t->translate("Error"), $t->translate("Access denied"));
} else {

if($action=="db_change") {					// DB CHANGE
	$query = "UPDATE tbllicense SET license_name='$name', license_url='$lurl' WHERE license_id=$id";
	$db->query($query);
}
else if($action=="db_delete") {					// DB DELETE
	$query = "DELETE FROM tbllicense WHERE license_id=$id";
	$db->query($query);
}
else if($action=="db_add") {					// DB ADD
	$query = "INSERT tbllicense(license_name,license_url) VALUES('$name','$lurl')";
	$db->query($query);
}

if($action=="change") {						// CHANGE
	$id   = rawurldecode($id);
	$name = rawurldecode($name);
	$ourl  = rawurldecode($ourl);
	/*-------------------------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Change License"));
	$bx->box_body_begin();
	/*-------------------------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>\n";
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	/*----------*/
	echo "<b>".$t->translate("License").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='name' value='$name'>\n";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Homepage").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='lurl' value='$ourl'>\n";	
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();
	$tbw->table_body_column("");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='id' value='$id'>\n";
	echo "<input type='hidden' name='action' value='db_change'>\n";
	echo "<input type='submit' value='".$t->translate("Change")."\n'>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==========*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>\n";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='submit' value='".$t->translate("Back")."'>\n";	
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	echo "</form>";
	/*----------*/
	$tbw->table_end();
	/*-------------------------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();
}
else if($action=="delete") {					// DELETE
	$id   = rawurldecode($id);
	$name = rawurldecode($name);
	$ourl  = rawurldecode($ourl);
	/*-------------------------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Delete License"));
	$bx->box_body_begin();
	/*-------------------------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>\n";
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	/*----------*/
	echo "<b>".$t->translate("Name").":</b>\n";
	$tbw->table_body_column_next(2);
	echo "$name";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Homepage").":</b>\n";
	$tbw->table_body_column_next(2);
	echo "$ourl";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();
	$tbw->table_body_column("");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='id' value='$id'>\n";
	echo "<input type='hidden' name='action' value='db_delete'>\n";
	echo "<input type='submit' value='".$t->translate("Delete")."'>\n";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==========*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>\n";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='submit' value='".$t->translate("Back")."'>\n";	
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	echo "</form>";
	/*----------*/
	$tbw->table_end();
	/*-------------------------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();
}
else if($action=="add") {					// ADD
	$bx->box_begin();
	$bx->box_title($t->translate("Add License"));
	$bx->box_body_begin();
	/*-------------------------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>\n";
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	/*----------*/
	echo "<b>".$t->translate("Name").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='name' value=''>\n";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Homepage").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='lurl' value=''>\n";	
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();
	$tbw->table_body_column("");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_add'>\n";
	echo "<input type='submit' value='".$t->translate("Add")."'>\n";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==========*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>\n";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='submit' value='".$t->translate("Back")."'>\n";	
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	echo "</form>";
	/*----------*/
	$tbw->table_end();
	/*-------------------------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();

}
else {											// TABLE
	/*------------------------------------------------------- BOX tbllicense */
	$bx->box_begin();
	$bx->box_title($t->translate("License Administration"));
	$bx->box_body_begin();
	/*------------------------------------------------------ gesamte Tabelle */
	$query = "SELECT * FROM tbllicense ORDER BY license_name ";
	$db->query($query);	
	/*-------------------*/	
	$tby->table_begin();
	$tby->table_row_begin();
	$tby->table_head_column_begin();
	echo "<b>".$t->translate("Name")."</b>\n";
	$tby->table_head_column_next();
	echo "<b>".$t->translate("Homepage")."</b>\n";
	$tby->table_head_column_end();
	$tby->table_head_column("&nbsp;");
	$tby->table_head_column("&nbsp;");
	$tby->table_row_next();
	while($db->next_record()) {
		/*----------*/
		if (($db->f("license_name")=="") || ($db->f("license_name")==null))
			$tby->table_body_column("&nbsp;");
		else
			$tby->table_body_column($db->f("license_name"));
		if (($db->f("license_url")=="") || ($db->f("license_url")==null))
			$tby->table_body_column("&nbsp;");
		else {
			$tby->table_body_column_begin($db->f("license_url"));
			echo "<a href=\"".$db->f("license_url")."\" target=\"_blank\">".$db->f("license_url")."</a>\n";
			$tby->table_body_column_end();
		}
		/*----------*/
		$tby->table_body_column_begin();
		echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action"=>"change", "id"=>$db->f("license_id"), "name"=>$db->f("license_name"), "ourl"=>$db->f("license_url")))."'>".$t->translate("Change")."</a></b>";
		/*----------*/				
		$tby->table_body_column_next();
		echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action"=>"delete", "id"=>$db->f("license_id"), "name"=>$db->f("license_name"), "ourl"=>$db->f("license_url")))."'>".$t->translate("Delete")."</a></b>";
		$tby->table_body_column_end();
		$tby->table_row_end();
		/*----------*/
	}
	if($db->num_rows()>0) $db->seek(0);
	$tby->table_end();
	/*----------*/						// Tabelle genommen wegen Style
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action"=>"add"))."'>".$t->translate("Add")."</a></b> ".$t->translate("new license");
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	$tbw->table_end();
	/*-------------------------------------------------------------------------------------*/
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