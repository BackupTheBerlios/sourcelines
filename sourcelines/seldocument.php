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
# Add/change/delete documents of a solution.
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
if($action == "db_change") {					// DB CHANGE
	$query = "UPDATE tbldocument SET document_title='$dtitle', ";
	switch ($fileact) {
	case "keep":
		$query .= "document_filename='$curfilename' ";
		break;
	case "new":
		$query .= "document_filename='$filename_name' ";
		break;
	case "delete":
		$query .= "document_filename='' ";
		break;
	default:
		$query .= "document_filename='$filename_name' ";
	}
	$query .= "WHERE document_id='$id'";
	debug($query);
	$db->query($query);

	// Set new filename
	if ($fileact == "new") {
		// Delete old file if present
		if (isset($curfilename) && !empty($curfilename)) {
			if (!unlink($sys_docu_dir.$solu_id."document_".$curfilename)) {
				$be->box_full($t->translate("Error"), $t->translate("Unable to remove current document"));
			}
		}
		// Copy document to document directory
		if (!empty($filename_name)) {
			if (!copy($filename, $sys_docu_dir.$solu_id."document_".$filename_name)) {
				$be->box_full($t->translate("Error"), $t->translate("Unable to copy document to document directory"));
			}
			@chmod($sys_docu_dir.$solu_id."document_".basename($filename_name),0666);
		}

	// Delete document
	} else if ($fileact == "delete") {
		if (!unlink($sys_docu_dir.$solu_id."document_".$curfilename)) {
			$be->box_full($t->translate("Error"), $t->translate("Unable to remove document"));
		}
	}
}
else if ($action == "db_delete") {				// DB DELETE

	// Delete document
	debug("unlink ".$sys_docu_dir.$solu_id."document_".$filename);
	if (!empty($filename)) {
		if (!unlink($sys_docu_dir.$solu_id."document_".$filename)) {
			$be->box_full($t->translate("Error"), $t->translate("Unable to remove document"));
		}
	}

	$query = "DELETE FROM tbldocument WHERE document_id='$id'";
	debug($query);
	$db->query($query);

}
else if($action == "db_add") {					// DB ADD
	$query = "INSERT tbldocument(solutions_id,document_title,document_filename) VALUES('$solu_id','$dtitle','$filename_name') ";
	debug($query);
	$db->query($query);

	// Copy document to document directory
	if (!copy($filename, $sys_docu_dir.$solu_id."document_".basename($filename_name))) {
		$be->box_full($t->translate("Error"), $t->translate("Unable to copy document to document directory"));
	}
	@chmod($sys_docu_dir.$solu_id."document_".basename($filename_name),0666);
}

if($action == "change") {					// CHANGE
	$id = rawurldecode($id);
	$solu_id = rawurldecode($solu_id);
	$db_chg = new DB_SourceLines;
	$query = "SELECT * FROM tbldocument WHERE document_id = '$id' AND solutions_id = '$solu_id'";
	$db_chg->query($query);
	$db_chg->next_record();
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Change document"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' enctype='multipart/form-data' method='POST'>";
	$tbw->table_begin();

	// title
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Title").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='dtitle' value='".$db_chg->f("document_title")."'>";
	$tbw->table_body_column_end();

        // Filename

	echo "<input type=\"hidden\" name=\"curfilename\" value=\"".$db_chg->f("document_filename")."\">\n";
	if ($db_chg->f("document_filename") != "") {
  		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Current document").":</b>");
		$tbw->table_body_column($db_chg->f("document_filename"),2);
  		$tbw->table_row_next();
		$tbw->table_body_column("");
		$tbw->table_body_column_begin(2);
		echo "<input type=radio name=\"fileact\" value=\"keep\" checked> ".$t->translate("Keep")."\n";
		echo "<input type=radio name=\"fileact\" value=\"new\"> ".$t->translate("New")."\n";
		echo "<input type=radio name=\"fileact\" value=\"delete\"> ".$t->translate("Delete")."\n";
		$tbw->table_body_column_end();

	} else {
	    echo "<input type=\"hidden\" name=\"fileact\" value=\"new\">\n";
	}
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Document").":</b>");
	$tbw->table_body_column_begin(2);
	echo "<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"$config_maxdocsize\">\n";
	echo "<input name=\"filename\" type=\"file\">\n";
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
	/*==========*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='post'>";
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value=''>";
	echo "<input type='hidden' name='id' value='$id'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
	echo "<input type='submit' value='".$t->translate("Back")."'>";
	echo "</td></form></tr>";
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	echo "</form>";
	/*----------*/
	$tbw->table_end();
	/*-----------------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_end();
}
else if ($action== "delete") {					// DELETE
	$id = rawurldecode($id);
	$solu_id = rawurldecode($solu_id);
	$db_del = new DB_SourceLines;
	$query = "SELECT * FROM tbldocument WHERE document_id = '$id' AND solutions_id = '$solu_id'";
	$db_del->query($query);
	$db_del->next_record();
	/*-----------------------------------------------------------------------*/
	$bx->box_begin();
	$bx->box_title($t->translate("Delete document"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' method='POST'>";
	$tbw->table_begin();

	// title
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Title").":</b>";
	$tbw->table_body_column_next(2);
	echo $db_del->f("document_title");
	$tbw->table_body_column_end();

	// buttons
	$tbw->table_row_next();
	$tbw->table_body_column("&nbsp;");
	$tbw->table_body_column_begin();
	echo "<input type='hidden' name='action' value='db_delete'>";
	echo "<input type='hidden' name='id' value='$id'>";
	echo "<input type='hidden' name='solu_id' value='$solu_id'>";
	echo "<input type='hidden' name='filename' value='".$db_del->f("document_filename")."'>";
	echo "<input type='submit' value='".$t->translate("Delete")."'>";
	$tbw->table_body_column_end();
	echo "</form>";
	/*==========*/
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
else if ($action == "add") {					// ADD
	$bx->box_begin();
	$bx->box_title($t->translate("Add a document"));
	$bx->box_body_begin();
	/*-----------------------------------------------------------------------*/
	echo "<form action='".$sess->url(basename($PHP_SELF))."' enctype='multipart/form-data' method='POST'>";
	$tbw->table_begin();

	// title
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b>".$t->translate("Title").":</b>";
	$tbw->table_body_column_next(2);
	echo "<input type='text' size='40' maxlength='255' name='dtitle' value=''>";
	$tbw->table_body_column_end();

        // Filename

	echo "<input type=\"hidden\" name=\"curfilename\" value=\"$filename\">\n";
	if (!empty($filename)) {
  		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Current document").":</b>");
		$tbw->table_body_column("$filename",2);
  		$tbw->table_row_next();
		$tbw->table_body_column("");
		$tbw->table_body_column_begin(2);
		echo "<input type=radio name=\"fileact\" value=\"keep\" checked> ".$t->translate("Keep")."\n";
		echo "<input type=radio name=\"fileact\" value=\"new\"> ".$t->translate("New")."\n";
		echo "<input type=radio name=\"fileact\" value=\"delete\"> ".$t->translate("Delete")."\n";
		$tbw->table_body_column_end();

	} else {
	    echo "<input type=\"hidden\" name=\"fileact\" value=\"new\">\n";
	}
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Document").":</b>");
	$tbw->table_body_column_begin(2);
	echo "<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"$config_maxdocsize\">\n";
	echo "<input name=\"filename\" type=\"file\">\n";
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
	$bx->box_title($t->translate("Provide Document of Solution"));
	$bx->box_body_begin();
	/*---------------------------------------------------------- whole Table */
	$query = "SELECT * FROM tbldocument WHERE solutions_id='$solu_id' ORDER BY document_title";
	$db->query($query);
	/*-------------------*/
	$tby->table_begin();
	$tby->table_row_begin();
	while($db->next_record()) {
		/*----------*/
		if(($db->f("document_title")=="") || ($db->f("document_title")==null))
			$tby->table_body_column("&nbsp;");
		else
			$tby->table_body_column($db->f("document_title"));
		/*----------*/
		$tby->table_body_column_begin();
		echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action" => "change","id" => $db->f("document_id"), "solu_id" => $solu_id))."'>".$t->translate("Change")."</a></b>";
		echo "</td>";
		/*----------*/
		$tby->table_body_column_next();
		echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action" => "delete", "id" => $db->f("document_id"), "solu_id"=> $solu_id))."'>".$t->translate("Delete")."</a></b>";
		$tby->table_body_column_end();
		$tby->table_row_end();
		/*----------*/
	}
	if($db->num_rows() > 0) $db->seek(0);
	$tby->table_end();
	/*-------------------*/				// ADD, CHANGE, DELETE
	$tbw->table_begin();
	$tbw->table_row_begin();
	$tbw->table_body_column_begin();
	echo "<b><a href='".$sess->url(basename($PHP_SELF)).$sess->add_query(array("action" => "add", "solu_id" => $solu_id ))."'>".$t->translate("Add")."</a></b> ".$t->translate("new document");
	echo "</td>";
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