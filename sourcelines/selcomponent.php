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
# Add a component to existing solution.
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
######################################################################  

page_open(array("sess" => "SourceLines_Session",
                "auth" => "SourceLines_Auth",
                "perm" => "SourceLines_Perm"));

require("header.inc");

/*----------Box-Definitionen----------*/
$bx = new box("60%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$be = new box("",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);

/*----------Table-Definitionen----------*/
$tbw = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","middle");
$tby = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top","#ffffcc",$th_box_body_font_color,"left","top");
?>

<!-- content -->
<?php
if ($action == "db_change") {					// DB CHANGE
	$query  = "UPDATE tblcomponent ";
        $query .= "SET solutions_id='$solu_id', componenttype_id='$componenttype_id', component_name='$component_name', ";
        $query .= "component_version='$component_version', component_url='$component_url', license_id='$license_id'";
        $query .= "WHERE component_id='$id'";
	$db->query($query);
}
else if ($action == "db_delete") {				// DB DELETE
	$query = "DELETE FROM tblcomponent WHERE component_id='$id'";
	$db->query($query);
}
else if ($action == "db_add") {					// DB ADD
	$query  = "INSERT tblcomponent (solutions_id,componenttype_id,component_name,component_version,component_url,license_id) ";
        $query .= "VALUES($solu_id,$componenttype_id,'$component_name','$component_version','$component_url','$license_id') ";
	$db->query($query);
}

if ($action == "change") {						// CHANGE
	$id = rawurldecode($id);
	$solu_id = rawurldecode($solu_id);
	$db_chg = new DB_SourceLines;
	$query = "SELECT * FROM tblcomponent,tblcomponenttype,tbllicense  WHERE component_id = '$id' AND solutions_id = '$solu_id' AND tblcomponent.componenttype_id = tblcomponenttype.componenttype_id AND tblcomponent.license_id = tbllicense.license_id";
	$db_chg->query($query);
	$db_chg->next_record();
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Change component"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();

	// componenttype
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Type").":</b>";
	$tbw->table_body_column_next(2);
	$db_sel = new DB_SourceLines;
	$query = "SELECT * FROM tblcomponenttype ORDER BY componenttype_name";
	$db_sel->query($query);
	/*-----*/
	echo "<select name='componenttype_id' size='1'>\n";
	while($db_sel->next_record()) {
		echo "<option value=".$db_sel->f("componenttype_id");
		$componenttype_id = $db_chg->f("componenttype_id");
		if ($componenttype_id == $db_sel->f("componenttype_id"))
			echo " selected";
		echo ">".$t->translate($db_sel->f("componenttype_name"))."</option>\n";
	}
	if ($db_sel->num_rows() > 0) $db_sel->seek(0);
	echo "</select>";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();

	// component_name
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Name").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='component_name' value='".$db_chg->f("component_name")."'>";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();

	// component_version
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Version").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='64' name='component_version' value='".$db_chg->f("component_version")."'>";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();

	// component_url
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Homepage").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='component_url' value='".$db_chg->f("component_url")."'>";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();

	// license
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("License").":</b>";
	$tbw->table_body_column_next(2);
	$query = "SELECT * FROM tbllicense ORDER BY license_name";
	$db_sel->query($query);
	echo "<select name='license_id' size='1'>";
	echo "<option value='$license_id'>$license_name</option>";
	while($db_sel->next_record()) {
		echo "<option value=".$db_sel->f("license_id");
		$license_id = $db_chg->f("license_id");
		if ($license_id == $db_sel->f("license_id"))
			echo " selected";
		echo ">".$db_sel->f("license_name")."</option>\n";
	}
	if ($db_sel->num_rows() > 0) $db_sel->seek(0);
		echo "</select>";
	$tbw->table_body_column_end();

	// buttons
	$tbw->table_row_next();
	$tbw->table_body_column("&nbsp;");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_change'>";
	echo "<input type='hidden' name='id' value='$id'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
	echo "<input type='submit' value='".$t->translate("Change")."'>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==============*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='hidden' name='id' value='$id'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
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
else if ($action == "delete") {					// DELETE
	$id = rawurldecode($id);
	$solu_id = rawurldecode($solu_id);
	$db_del = new DB_SourceLines;
	$query = "SELECT * FROM tblcomponent,tblcomponenttype,tbllicense  WHERE component_id = '$id' AND solutions_id = '$solu_id' AND tblcomponent.componenttype_id = tblcomponenttype.componenttype_id AND tblcomponent.license_id = tbllicense.license_id";
	$db_del->query($query);
	$db_del->next_record();
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Delete component"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();

	// componenttype
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Type").":</b>";
	$tbw->table_body_column_next(2);
	echo $db_del->f("componenttype_name");
	$tbw->table_body_column_end();

	// component_name
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Name").":</b>";
	$tbw->table_body_column_next(2);
	echo $db_del->f("component_name");
	$tbw->table_body_column_end();

	// component_version
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Version").":</b>";
	$tbw->table_body_column_next(2);
	echo $db_del->f("component_version");
	$tbw->table_body_column_end();

	// component_url
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Homepage").":</b>";
	$tbw->table_body_column_next(2);
	echo "<a href=\"".$db_del->f("component_url")."\" target=\"_blank\">".$db_del->f("component_url")."</a>";
	$tbw->table_body_column_end();

	// license
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("License").":</b>";
	$tbw->table_body_column_next(2);
	echo "<a href=\"".$db_del->f("license_url")."\" target=\"_blank\">".$db_del->f("license_name")."</a>";
	$tbw->table_body_column_end();

	// buttons
	$tbw->table_row_next();
	$tbw->table_body_column("&nbsp;");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_delete'>";
	echo "<input type='hidden' name='id' value='$id'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
	echo "<input type='submit' value='".$t->translate("Delete")."'>";
	echo "</td></form>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==========*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>\n";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='hidden' name='id' value='$id'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
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
	$solu_id = rawurldecode($solu_id);
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Add a component"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();

	// componenttype
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Type").":</b>";
	$tbw->table_body_column_next(2);
	$db_sel = new DB_SourceLines;
	$query = "SELECT * FROM tblcomponenttype ORDER BY componenttype_name";
	$db_sel->query($query);
	echo "<select name='componenttype_id' size='1'>";
	while($db_sel->next_record()) {
		echo "<option value=".$db_sel->f("componenttype_id").">".$t->translate($db_sel->f("componenttype_name"))."</option>";
	}
	if ($db_sel->num_rows() > 0) $db_sel->seek(0);
	echo "</select>";
	$tbw->table_body_column_end();

	// component_name
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Name").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='component_name' value=''>";
	$tbw->table_body_column_end();

	// component_version
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Version").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='64' name='component_version' value=''>";
	$tbw->table_body_column_end();

	// component_url
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Homepage").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='component_url' value='http://'>";
	$tbw->table_body_column_end();

	// license
	$tbw->table_row_next();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("License").":</b>";
	$tbw->table_body_column_next(2);
	$query = "SELECT * FROM tbllicense ORDER BY license_name";
	$db_sel->query($query);
	echo "<select name='license_id' size='1'>";
	while($db_sel->next_record()) {
		echo "<option value=".$db_sel->f("license_id").">".$db_sel->f("license_name")."</option>";
	}
	if ($db_sel->num_rows() > 0) $db_sel->seek(0);
	echo "</select>";
	$tbw->table_body_column_end();

	// buttons
	$tbw->table_row_next();
	$tbw->table_body_column("");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_add'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
	echo "<input type='submit' value='".$t->translate("Add")."'>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*----------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='hidden' name='id' value='$id'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
	echo "<input type='submit' value='".$t->translate("Back")."'>";
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	echo "</form>";
	/*===============*/
	$tbw->table_end();
	/*-----------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();
} else {											// TABLE
	/*------------------------------------------------------- BOX tbllicense */
	$bx->box_begin();
	$bx->box_title($t->translate("Select Components of Solution"));
	$bx->box_body_begin();
	/*------------------------------------------------------- all components */

	$query = "SELECT * FROM tblcomponent, tblcomponenttype, tbllicense ";
        $query .= "WHERE solutions_id = '$solu_id' ";
        $query .= "AND tblcomponent.componenttype_id = tblcomponenttype.componenttype_id ";
        $query .= "AND tblcomponent.license_id = tbllicense.license_id ";
        $query .= "ORDER BY componenttype_name, component_name";
	$db->query($query);
	/*-------------------*/
	$tby->table_begin();
	$tby->table_row_begin();
	$tby->table_head_column_begin();
	echo "<b>".$t->translate("Type")."</b>\n";
	$tby->table_head_column_next();
	echo "<b>".$t->translate("Name")."</b>\n";
	$tby->table_head_column_next();
	echo "<b>".$t->translate("Version")."</b>\n";
	$tby->table_head_column_next();
	echo "<b>".$t->translate("Homepage")."</b>\n";
	$tby->table_head_column_next();
	echo "<b>".$t->translate("License")."</b>\n";
	$tby->table_head_column_end();
	$tby->table_head_column("&nbsp;");
	$tby->table_head_column("&nbsp;");
	$tby->table_row_next();
	while($db->next_record()) {
		if (($db->f("componenttype_name")=="") || ($db->f("componenttype_name")==null))
			$tby->table_body_column("&nbsp;");
		else
			$tby->table_body_column($t->translate($db->f("componenttype_name")));

		if (($db->f("component_name")=="") || ($db->f("component_name")==null))
			$tby->table_body_column("&nbsp;");
		else
			$tby->table_body_column($db->f("component_name"));

		if (($db->f("component_version")=="") || ($db->f("component_version")==null))
			$tby->table_body_column("&nbsp;");
		else
			$tby->table_body_column($db->f("component_version"));

		if (($db->f("component_url")=="") || ($db->f("component_url")==null))
			$tby->table_body_column("&nbsp;");
		else
			$tby->table_body_column("<a href=\"".$db->f("component_url")."\" target=\"_blank\">".$db->f("component_url")."</a>");

		if (($db->f("license_name")=="") || ($db->f("license_name")==null))
			$tby->table_body_column("&nbsp;");
		else
			$tby->table_body_column("<a href=\"".$db->f("license_url")."\" target=\"_blank\">".$db->f("license_name")."</a>");
		/*----------*/
		$tby->table_body_column_begin();
		echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action" => "change", "id" => $db->f("component_id"), "solu_id" => $solu_id))."'>".$t->translate("Change")."</a></b>";
		/*----------*/
		$tby->table_body_column_next();
		echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action" => "delete", "id" => $db->f("component_id"), "solu_id" => $solu_id))."'>".$t->translate("Delete")."</a></b>";
		$tby->table_body_column_end();
		$tby->table_row_end();
		/*----------*/
	}
	if($db->num_rows()>0) $db->seek(0);
	$tby->table_end();
    /*-------------------*/				// ADD, CHANGE, DELETE
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action" => "add", "solu_id" => $solu_id))."'>".$t->translate("Add")."</a></b> ".$t->translate("new component");
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	$tbw->table_end();

	/*-----------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();

	/*-----------------------------------------------------------------------*/
	echo "<p align='center'><b>[<a href='".$sess->url("newsolutions.php").$sess->add_query(array("solu_id" => $solu_id))."'>".$t->translate("Back to your solution")."</a>]</b>";
}
?>
<!-- end content -->

<?php
require("footer.inc");
@page_close();
?>