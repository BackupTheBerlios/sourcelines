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
# Search solutions by keywords.
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

/*---------- Box-Definitionen -----------------------------------------------*/
$bx = new box("80%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$be = new box("",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);

/*---------- Table-Definitionen ---------------------------------------------*/
$tbw = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top",$th_box_body_bgcolor,$th_box_body_font_color,"left","middle");
$tby = new table("100%","0","1","4",$th_box_title_bgcolor,$th_box_title_font_color,"center","top","#ffcc00",$th_box_body_font_color,"left","top");
?>

<!-- content -->
<?php
debugparam();
/*------------------------------------------------------- BOX tbllicense */
$bx->box_begin();
$bx->box_title($t->translate("Solutions by Keyword"));
$bx->box_body_begin();

/*---------------------------------------------------------- Select form */

echo "<form action='".$sess->url("bykeyword.php")."' method='POST'>";
$tbw->table_begin();
$tbw->table_row_begin();
$tbw->table_body_column_begin();
echo "<b>".$t->translate("Keyword").":</b>";
$tbw->table_body_column_next(2);

$query = "SELECT DISTINCT keyword_text FROM tblkeyword ORDER BY keyword_text";
$db->query($query);
echo "<select name='keyword' size='5'>\n";
while($db->next_record()) {
	echo "<option>";
	echo $t->translate($db->f("keyword_text"))."</option>\n";
}
echo "</select>\n";

$tbw->table_body_column_end();

// buttons
$tbw->table_row_next();
$tbw->table_body_column("");
$tbw->table_body_column_begin();
echo "<input type='submit' value='".$t->translate("Go")."'>";
$tbw->table_body_column_end();
echo "</form>";
$tbw->table_row_end();
$tbw->table_end();

/*-----------------------------------------------------------------------*/
$bx->box_body_end();
$bx->box_end();

/*-----------------------------------------------------------------------*/
?>
<!-- end content -->

<?php
require("footer.inc");
@page_close();
?>