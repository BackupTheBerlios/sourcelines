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
# XML backend (RDF-type document)
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
###################################################################### 

require "./include/prepend.php3";

header("Content-Type: text/xml");

// Disabling cache
header("Cache-Control: no-cache, must-revalidate");     // HTTP/1.1
header("Pragma: no-cache");                             // HTTP/1.0

require "./include/config.inc";
require "./include/lib.inc";

echo "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n";
echo "<!DOCTYPE rss PUBLIC \"-//Netscape Communications//DTD RSS 0.91//EN\"\n";
echo "           \"http://my.netscape.com/publish/formats/rss-0.91.dtd\">\n";
echo "<rss version=\"0.91\">\n";

echo "  <channel>\n";
echo "    <title>".htmlspecialchars($sys_name)."</title>\n";
echo "    <link>http:".$sys_url."</link>\n";
echo "    <description>".htmlspecialchars($sys_name." - ".$sys_title)."</description>\n";
echo "    <language>en-us</language>\n";

echo "  <image>\n";
echo "    <title>".htmlspecialchars($sys_name)."</title>\n";
echo "    <url>".$sys_url.$sys_logo_image."</url>\n";
echo "    <link>http:".$sys_url."</link>\n";
echo "    <description>".htmlspecialchars($sys_name." - ".$sys_title)."</description>\n";
echo "    <width>66</width>\n";
echo "    <height>73</height>\n";
echo "  </image>\n";

$db = new DB_SourceLines;
$db->query("SELECT * FROM tblsolutions,auth_user WHERE tblsolutions.username = auth_user.username AND tblsolutions.solutions_name != 'no_name' ORDER BY tblsolutions.solutions_modify_date DESC limit 10");
$i=0;
while($db->next_record()) {
  echo "  <item>\n";
  echo "    <title>".htmlspecialchars($db->f("solutions_name"))."</title>\n";
  echo "    <link>http:".$sys_url."solutions.php?solu_id=".$db->f("solutions_id")."</link>\n";
  echo "  </item>\n";
  $i++;
} 

echo "  </channel>\n";
echo "</rss>\n";
?>
