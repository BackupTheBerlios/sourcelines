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
# Shows solution owned by authorized user.
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
$bx = new box("100%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$be = new box("80%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);
$bs = new box("100%",$th_strip_frame_color,$th_strip_frame_width,$th_strip_title_bgcolor,$th_strip_title_font_color,$th_strip_title_align,$th_strip_body_bgcolor,$th_strip_body_font_color,$th_strip_body_align);

/*----------Table-Definitionen----------*/
$tbw = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","top");
$tbf = new table("100%","0","0","0",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","top");

if (isset($auth) && !empty($auth->auth["perm"]) && !($logout)) {
	if ($perm->have_perm("user") || $perm->have_perm("admin")) {
                /*=========================*/
		If (isset($user)) {
			$username = $user;
		} else {
			$username = $auth->auth["uname"];
		}
		if (!isset($by)) $by = "";
		if (!isset($cnt)) $cnt = 0;
		$prev_cnt = $cnt + $config_show_solsperpage;
		if ($cnt >= $config_show_solsperpage) $next_cnt = $cnt - $config_show_solsperpage;
		else $next_cnt = 0;

		$tables = "tblsolutions,auth_user";
		$columns = "*";
		$where = "tblsolutions.username = auth_user.username AND tblsolutions.username = '$username'";

		switch ($by) {
		case "Name":
			$order = "solutions_name ASC, solutions_modify_date DESC, solutions_id DESC";
			break;
		case "Date":
			$order = "solutions_modify_date DESC, solutions_id DESC";
			break;
		case "Contact":
			$order = "solutions_contact_name ASC, solutions_modify_date DESC, solutions_id DESC";
			break;
		case "Supplier":
			$order = "solutions_supplier_name ASC, solutions_modify_date DESC, solutions_id DESC";
			break;
		default:
			$order = "solutions_modify_date DESC, solutions_id DESC";
			break;
		}

		$limit = $cnt.",".$config_show_solsperpage;

		$query = "SELECT $columns FROM $tables WHERE $where ORDER BY $order LIMIT $limit";

		debug($query);
		$db->query($query);
		if ($db->num_rows() > 0) {
			$sort = $t->translate("sorted by").": "
			."<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "Date"))."\">".$t->translate("Date")."</a>"
			." | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "Name"))."\">".$t->translate("Name")."</a>"
			." | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "Contact"))."\">".$t->translate("Contact")."</a>"
			." | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "Supplier"))."\">".$t->translate("Supplier")."</a>\n";

			$bs->box_strip($sort);

			if ($cnt > 0) {
				$nav = "&lt;&nbsp;<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("cnt" => $next_cnt, "by" => $by))."\">".$t->translate("previous")." $config_show_solsperpage&nbsp;".$t->translate("Solutions")."</a>";
			} else {
				$nav = "&lt;&nbsp;".$t->translate("previous")." $config_show_solsperpage&nbsp;".$t->translate("Solutions");
			}

			$nav .= " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => $by))."\">".$t->translate("Top")."</a>";

			if ($db->num_rows() >=  $config_show_solsperpage) {
				$nav .= " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("cnt" => $prev_cnt, "by" => $by))."\">".$t->translate("next")." $config_show_solsperpage ".$t->translate("Solutions")."</a>&nbsp;&gt;";
			} else {
				$nav .= " | ".$t->translate("next")." $config_show_solsperpage ".$t->translate("Solutions")."&nbsp;&gt;";
			}

			$bs->box_strip($nav);

			while ($db->next_record()) {
				solfull($db);
			}

			$bs->box_strip($nav);
			$bs->box_strip($sort);
		} else {
			$be->box_full($t->translate("Attention"), $t->translate("No more Solutions exist"));
		}
	}
}
?>
<!-- end content -->

<?php
require("footer.inc");
@page_close();
?>