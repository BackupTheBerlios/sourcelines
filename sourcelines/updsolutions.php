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
# Updates solution.
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
$bx = new box("100%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$be = new box("",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);

/*----------Table-Definitionen----------*/
$tbw = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","top");
$tbf = new table("100%","0","0","0",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","top");
$tbg = new table("100%","0","0","0",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_title_bgcolor,$th_box_body_font_color,"left","middle");

debugparam();

if (isset($sendaction)) {

	// set new or changed solution entry 
	$query  = "UPDATE tblsolutions SET ";
	$query .= "solutions_name='$solu_name', ";
	$query .= "solutions_version='$solu_version',";
	switch ($solulogoact) {
	case "keep":
		$query .= "solutions_logo='$cursolulogo',";
		break;
	case "new":
		$query .= "solutions_logo='$solulogo_name',";
		break;
	case "delete":
		$query .= "solutions_logo='',";
		break;
	default:
		$query .= "solutions_logo='$solulogo_name',";
	}
	$query .= "solutions_summary='$solu_summary', ";
	$query .= "solutions_url='$solu_url', ";
	$query .= "solutions_create_date='$solu_create_date', ";
	$query .= "solutions_modify_date='$solu_modify_date', ";
	$query .= "solutions_contact_name='$solu_contact_name', ";
	$query .= "solutions_contact_email='$solu_contact_email', ";
	$query .= "solutions_contact_url='$solu_contact_url', ";
	switch ($solucontlogoact) {
	case "keep":
		$query .= "solutions_contact_logo='$curcontlogo', ";
		break;
	case "new":
		$query .= "solutions_contact_logo='$solucontlogo_name', ";
		break;
	case "delete":
		$query .= "solutions_contact_logo='', ";
		break;
	default:
		$query .= "solutions_contact_logo='$solucontlogo_name', ";
	}
	$query .= "solutions_supplier_name='$solu_supplier_name', ";
	$query .= "solutions_supplier_email='$solu_supplier_email', ";
	$query .= "solutions_supplier_url='$solu_supplier_url', ";
	switch ($solusupplogoact) {
	case "keep":
		$query .= "solutions_supplier_logo='$cursupplogo' ";
		break;
	case "new":
		$query .= "solutions_supplier_logo='$solusupplogo_name' ";
		break;
	case "delete":
		$query .= "solutions_supplier_logo='' ";
		break;
	default:
		$query .= "solutions_supplier_logo='$solusupplogo_name' ";
	}
	$query .= "WHERE solutions_id='$solu_id' AND username='$username'";
	debug($query);
	$db->query($query);

	// Set new solution logo
	if ($solulogoact == "new" && !empty($solulogo_name)) {
		// Delete old solution logo if present
		if (isset($cursolulogo) && !empty($cursolulogo)) {
			if (!unlink($sys_logo_dir.$solu_id."solution_".basename($cursolulogo))) {
				$be->box_full($t->translate("Error"), $t->translate("Unable to remove current solution logo"));
			}
		}
		// Copy solution logo to logo directory
		if (!empty($solulogo_name)) {
			if (!copy($solulogo, $sys_logo_dir.$solu_id."solution_".basename($solulogo_name))) {
				$be->box_full($t->translate("Error"), $t->translate("Unable to copy solution logo to logo directory"));
			}
			@chmod($sys_logo_dir.$solu_id."solution_".basename($solulogo_name),0666);
		}

	// Delete solution logo
	} else if ($solulogoact == "delete") {
		if (!unlink($sys_logo_dir.$solu_id."solution_".basename($cursolulogo))) {
			$be->box_full($t->translate("Error"), $t->translate("Unable to remove solution logo"));
		}
	}

	// Set new contact logo
	if ($solucontlogoact == "new" && !empty($solucontlogo_name)) {
		// Delete old contact logo if present
		if (isset($curcontlogo) && !empty($curcontlogo)) {
			if (!unlink($sys_logo_dir.$solu_id."contact_".basename($curcontlogo))) {
				$be->box_full($t->translate("Error"), $t->translate("Unable to remove current contact logo"));
			}
		}
		// Copy contact logo to logo directory
		if (!empty($solucontlogo_name)) {
			if (!copy($solucontlogo, $sys_logo_dir.$solu_id."contact_".basename($solucontlogo_name))) {
				$be->box_full($t->translate("Error"), $t->translate("Unable to copy contact logo to logo directory"));
			}
			@chmod($sys_logo_dir.$solu_id."contact_".basename($solucontlogo_name),0666);
		}

	// Delete contact logo
	} else if ($solucontlogoact == "delete") {
		if (!unlink($sys_logo_dir.$solu_id."contact_".basename($curcontlogo))) {
			$be->box_full($t->translate("Error"), $t->translate("Unable to remove contact logo"));
		}
	}

	// Set new supplier logo
	if ($solusupplogoact == "new" && !empty($solusupplogo_name)) {
		// Delete old supplier logo if present
		if (isset($cursupplogo) && !empty($cursupplogo)) {
			if (!unlink($sys_logo_dir.$solu_id."supplier_".basename($cursupplogo))) {
				$be->box_full($t->translate("Error"), $t->translate("Unable to remove current supplier logo"));
			}
		}
		// Copy supplier logo to logo directory
		if (!empty($solusupplogo_name)) {
			if (!copy($solusupplogo, $sys_logo_dir.$solu_id."supplier_".basename($solusupplogo_name))) {
				$be->box_full($t->translate("Error"), $t->translate("Unable to copy supplier logo to logo directory"));
			}
			@chmod($sys_logo_dir.$solu_id."supplier_".basename($solusupplogo_name),0666);
		}

	// Delete supplier logo
	} else if ($solusupplogoact == "delete") {
		if (!unlink($sys_logo_dir.$solu_id."supplier_".basename($cursupplogo))) {
			$be->box_full($t->translate("Error"), $t->translate("Unable to remove supplier logo"));
		}
	}

	// Sent notification mail to administrators
	if ($ml_notify) {
		$message  = "insert/update $solu_name $solu_version by ".$auth->auth["uname"]."\n";
		mailuser("admin", "insert/update solution", $message);
	}

	// Show updated solution
	$query = "SELECT * FROM tblsolutions,auth_user WHERE solutions_id='$solu_id' AND tblsolutions.username = auth_user.username";
	debug($query);
	$db->query($query);
	$db->next_record();
	solfull($db);

} else if (isset($deleteaction)) {

	// delete solution entry
	$query = "DELETE FROM tblsolutions WHERE solutions_id='$solu_id' AND username='$username'";
	debug($query);
	$db->query($query);

	// Delete solution logo if present
	if (isset($cursolulogo) && !empty($cursolulogo)) {
		if (!unlink($sys_logo_dir.$solu_id."solution_".basename($cursolulogo))) {
			$be->box_full($t->translate("Error"), $t->translate("Unable to remove current solution logo"));
		}
	}

	// Delete contact logo if present
	if (isset($curcontlogo) && !empty($curcontlogo)) {
		if (!unlink($sys_logo_dir.$solu_id."contact_".basename($curcontlogo))) {
			$be->box_full($t->translate("Error"), $t->translate("Unable to remove current contact logo"));
		}
	}

	// Delete supplier logo if present
	if (isset($cursupplogo) && !empty($cursupplogo)) {
		if (!unlink($sys_logo_dir.$solu_id."supplier_".basename($cursupplogo))) {
			$be->box_full($t->translate("Error"), $t->translate("Unable to remove current supplier logo"));
		}
	}

	// Delete components
	$query = "DELETE FROM tblcomponent WHERE solutions_id='$solu_id'";
	debug($query);
	$db->query($query);

	// Delete languages
	$query = "DELETE FROM tblsolutionslanguage WHERE solutions_id='$solu_id'";
	debug($query);
	$db->query($query);

	// Delete keywords
	$query = "DELETE FROM tblkeyword WHERE solutions_id='$solu_id'";
	debug($query);
	$db->query($query);

	// Delete comments
	$query = "DELETE FROM tblcomment WHERE solutions_id='$solu_id'";
	debug($query);
	$db->query($query);

	// Delete components
	debug($query);
	$query = "DELETE FROM tblcomponent WHERE solutions_id='$solu_id'";
	$db->query($query);

	// Delete languages
	$query = "DELETE FROM tblsolutionslanguage WHERE solutions_id='$solu_id'";
	debug($query);
	$db->query($query);

	// Delete keywords
	$query = "DELETE FROM tblkeyword WHERE solutions_id='$solu_id'";
	debug($query);
	$db->query($query);

	// Delete comments
	$query = "DELETE FROM tblcomment WHERE solutions_id='$solu_id'";
	debug($query);
	$db->query($query);

	// Delete documents in document directory
	$query = "SELECT document_filename FROM tbldocument WHERE solutions_id='$solu_id'";
	debug($query);
	$db->query($query);
	while ($db->next_record()) {
		if (!unlink($sys_docu_dir.$solu_id."document_".$db->f("document_filename"))) {
			$be->box_full($t->translate("Error"), $t->translate("Unable to remove document"));
		}
	}

	// Delete documents
	$query = "DELETE FROM tbldocument WHERE solutions_id='$solu_id'";
	debug($query);
	$db->query($query);

	// Sent notification mail to administrators
	if ($ml_notify) {
		$message  = "delete solution $solu_id by ".$auth->auth["uname"]."\n";
		mailuser("admin", "delete solution", $message);
	}

	$bx->box_full($t->translate("Delete Solution"), $t->translate("Solution successful deleted"));
}
?>

<!-- end content -->
<?php
require("footer.inc");
@page_close();
?>