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
# The Netscape 6 sitebar of the system
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
###################################################################### 

page_open(array("sess" => "SourceLines_Session"));
// Disabling cache
header("Last-Modified: ".gmdate("D, d M Y H:i:s")." GMT");
header("Expires: ".gmdate("D, d M Y H:i:s")." GMT");
header("Cache-Control: no-cache, must-revalidate");     // HTTP/1.1
header("Pragma: no-cache"); 				// HTTP/1.0

require "config.inc";
require "lib.inc";
require("translation.inc");
require("lang.inc");
require("box.inc");
$t = new translation($la);
$db = new DB_SourceLines;

$bx = new box("95%",$th_box_frame_color,0,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <meta http-equiv="expires" content="0">
   <meta http-equiv="Refresh" content="1200; URL=<?php echo $sys_url."sitebar.php"?>">
   <title><?php echo $sys_name;?> - <?php echo $t->translate($sys_title);?></title>
<link rel="stylesheet" type="text/css" href="berlios.css">
</head>
<body bgcolor="<?php echo $th_body_bgcolor;?>" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" marginheight="0" marginwidth="0">

<!-- content -->

<p>&nbsp;
<?php
$bx->box_begin();
$bx->box_title("<font size=\"1\">".$t->translate("Recent Solutions")."</font>");
$db->query("SELECT * FROM tblsolutions WHERE tblsolutions.solutions_name != 'no_name' ORDER BY solutions_modify_date DESC limit 20");
$bx->box_body_begin();
while($db->next_record()) {
  echo "<li><font size=\"1\"><a href=\"".$sys_url."solutions.php?solu_id=".$db->f("solutions_id")."\" target=\"_content\">".$db->f("solutions_name")."</a></font></li>\n";
}
$bx->box_body_end();
$bx->box_end();
?>
</body>
</html>
<?php
@page_close();
?>
