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
# Search solutions by filter.
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
######################################################################

require("./include/prepend.php3");

page_open(array("sess" => "SourceLines_Session"));
if (isset($auth) && !empty($auth->auth["perm"])) {
  page_close();
  page_open(array("sess" => "SourceLines_Session",
                  "auth" => "SourceLines_Auth",
                  "perm" => "SourceLines_Perm"));
}

require("./include/header.inc");

/*----------Box-Definitionen----------*/
$bx = new box("100%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$bs = new box("100%",$th_strip_frame_color,$th_strip_frame_width,$th_strip_title_bgcolor,$th_strip_title_font_color,$th_strip_title_align,$th_strip_body_bgcolor,$th_strip_body_font_color,$th_strip_body_align);
$be = new box("",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);

/*----------Table-Definitionen----------*/
$tbw = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","top");
$tbf = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","top");
?>

<!-- content -->
<?php

      // When there's a search for a blank line, we look for "xxxxxxxx"
if (!isset($search) || $search=="") {
  $search = "xxxxxxxx";
}

  if (!isset($by)) $by = "Nothing";
  if (!isset($cnt)) $cnt = 0;
  $prev_cnt = $cnt + $config_show_solsperpage;
  if ($cnt >= $config_show_solsperpage) $next_cnt = $cnt - $config_show_solsperpage;
  else $next_cnt = 0;
 
  $columns = "*";
  $where = "tblsolutions.username = auth_user.username AND tblsolutions.solutions_name LIKE '%$search%'";
  $tables = "tblsolutions,auth_user";

  switch ($by) {      
    case "Name":
      $order = "solutions_name ASC, solutions_modify_date DESC, solutions_id DESC";
      break;
    case "Branch":
      $order = "branch_id ASC, solutions_modify_date DESC, solutions_id DESC";
      break;        
    case "Category":
      $order = "category_id ASC, solutions_modify_date DESC, solutions_id DESC";
      break;        
    case "Contact":
      $order = "solutions_contact_name ASC, solutions_modify_date DESC, solutions_id DESC";
      break;        
    case "Date":
      $order = "solutions_modify_date DESC, solutions_id DESC";
      break;    
    default:
      $order = "solutions_modify_date DESC, solutions_id DESC";
      break;
  }

  $limit = $cnt.",".$config_show_solsperpage;

  $sort = $t->translate("sorted by").": "
  ."<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "Date"))."\">".$t->translate("Date")."</a>"
  ." | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "Name"))."\">".$t->translate("Name")."</a>"
  ." | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "Contact"))."\">".$t->translate("Contact")."</a>"
  ." | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "Branch"))."\">".$t->translate("Branch")."</a>"
  ." | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "Category"))."\">".$t->translate("Category")."</a>\n";

  $bs->box_strip($sort);

  $nav = "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("cnt" => $prev_cnt, "by" => $by))."\">&lt;&nbsp;".$t->translate("previous")." $config_show_solsperpage ".$t->translate("Solutions")."</a>"
  ." | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("by" => "Date"))."\">".$t->translate("Top")."</a>";

  if ($cnt > 0) {
    $nav .= " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("cnt" => $next_cnt, "by" => $by))."\">".$t->translate("next")." $config_show_solsperpage&nbsp;".$t->translate("Solutions")."&nbsp;&gt;</a>";
  } else {
    $nav .= " | ".$t->translate("next")." $config_show_solsperpage&nbsp;".$t->translate("Solutions")."&nbsp;&gt;";
  }

  $bs->box_strip($nav);

  $query = "SELECT $columns FROM $tables WHERE $where ORDER BY $order LIMIT $limit";

  $db->query($query);
  while ($db->next_record()) {
    solshow($db);
  }
  $bs->box_strip($nav);
  $bs->box_strip($sort);
?>
<!-- end content -->

<?php
require("footer.inc");
page_close();
?>
