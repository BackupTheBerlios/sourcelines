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
# Add/change/delete language of solution.
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
debugparam();
if ($action == "db_change") {					// DB CHANGE
	$query = "UPDATE tblsolutionslanguage SET language_id='$language_id' WHERE solutionslanguage_id='$lang_id'";
	$db->query($query);
}
else if ($action == "db_delete") {				// DB DELETE
	$query = "DELETE FROM tblsolutionslanguage WHERE solutionslanguage_id='$lang_id'";
	$db->query($query);
}
else if ($action == "db_add") {					// DB ADD
	$query = "INSERT tblsolutionslanguage (solutions_id,language_id) VALUES ('$solu_id','$language_id')";
	$db->query($query);
}

if ($action == "change") {					// CHANGE
	$lang_id = rawurldecode($lang_id);
	$solu_id = rawurldecode($solu_id);
	$db_chg = new DB_SourceLines;
	$query = "SELECT * FROM tblsolutionslanguage,tbllanguage  WHERE solutionslanguage_id = '$lang_id' AND solutions_id = '$solu_id' AND tblsolutionslanguage.language_id = tbllanguage.language_id";
	$db_chg->query($query);
	$db_chg->next_record();
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Change language"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();

	// language
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Language").":</b>";
	$tbw->table_body_column_next(2);
	$db_sel = new DB_SourceLines;
	$query = "SELECT * FROM tbllanguage ORDER BY language_name";
	$db_sel->query($query);
	/*-----*/
	echo "<select name='language_id' size='1'>\n";
	while($db_sel->next_record()) {
		echo "<option value=".$db_sel->f("language_id");
		$language_id = $db_chg->f("language_id");
		if ($language_id == $db_sel->f("language_id"))
			echo " selected";
		echo ">".$t->translate($db_sel->f("language_name"))."</option>\n";
	}
	echo "</select>";
	$tbw->table_body_column_end();
	/*----------*/
	$tbw->table_row_next();

	// buttons
	$tbw->table_row_next();
	$tbw->table_body_column("&nbsp;");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_change'>";
	echo "<input type='hidden' name='lang_id' value='$lang_id'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
	echo "<input type='submit' value='".$t->translate("Change")."'>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==========*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='hidden' name='lang_id' value='$lang_id'>";
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
	$lang_id = rawurldecode($lang_id);
	$solu_id = rawurldecode($solu_id);
	$db_del = new DB_SourceLines;
	$query = "SELECT * FROM tblsolutionslanguage,tbllanguage  WHERE solutionslanguage_id = '$lang_id' AND solutions_id = '$solu_id' AND tblsolutionslanguage.language_id = tbllanguage.language_id";
	$db_del->query($query);
	$db_del->next_record();
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Delete language"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();

	// language
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Language").":</b>";
	$tbw->table_body_column_next(2);
	echo $t->translate($db_del->f("language_name"));
	$tbw->table_body_column_end();

	// buttons
	$tbw->table_row_next();
	$tbw->table_body_column("&nbsp;");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_delete'>";
	echo "<input type='hidden' name='lang_id' value='$lang_id'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
	echo "<input type='submit' value='".$t->translate("Delete")."'>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==========*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='hidden' name='lang_id' value='$lang_id'>";
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
	$bx->box_begin();
	$bx->box_title($t->translate("Add a language"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();

	// language
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Language").":</b>";
	$tbw->table_body_column_next(2);
	$db_sel = new DB_SourceLines;
	$query = "SELECT * FROM tbllanguage ORDER BY language_name";
	$db_sel->query($query);
	echo "<select name='language_id' size='1'>\n";
	while($db_sel->next_record()) {
		echo "<option value=".$db_sel->f("language_id").">".$t->translate($db_sel->f("language_name"))."</option>\n";
	}
	echo "</select>";
	$tbw->table_body_column_end();

	// buttons
	$tbw->table_row_next();
	$tbw->table_body_column("&nbsp;");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_add'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
	echo "<input type='submit' value='".$t->translate("Add")."'>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
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
}
else {											// TABLE
	/*------------------------------------------------------- BOX tbllicense */
	$bx->box_begin();
	$bx->box_title($t->translate("Select Languages of Solution"));
	$bx->box_body_begin();
	/*---------------------------------------------------------- whole Table */

	$query  = "SELECT * FROM tbllanguage, tblsolutionslanguage ";
        $query .= "WHERE solutions_id='$solu_id' ";
        $query .= "AND tblsolutionslanguage.language_id=tbllanguage.language_id ";
        $query .= "ORDER BY language_name";
	$db->query($query);
	/*-------------------*/
	$tby->table_begin();
	$tby->table_row_begin();
	while($db->next_record()) {
		/*----------*/
		if (($db->f("language_name") == "") || ($db->f("language_name") == null))
			$tby->table_body_column("&nbsp;");
		else
			$tby->table_body_column($t->translate($db->f("language_name")));
		/*----------*/
		$tby->table_body_column_next();
		echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action" => "change", "lang_id" => $db->f("solutionslanguage_id"), "solu_id" => $solu_id))."'>".$t->translate("Change")."</a></b>";
		/*----------*/
		$tby->table_body_column_next();
		echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action" => "delete", "lang_id" => $db->f("solutionslanguage_id"), "solu_id" => $solu_id))."'>".$t->translate("Delete")."</a></b>";
		$tby->table_body_column_end();
		$tby->table_row_end();
		/*----------*/
	}
	$tby->table_end();
	/*-------------------*/				// ADD, CHANGE, DELETE
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action" => "add", "solu_id" => $solu_id ))."'>".$t->translate("Add")."</a></b> ".$t->translate("new language");
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