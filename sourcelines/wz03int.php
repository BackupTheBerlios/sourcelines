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
# Creates sql for setting up the table of branches
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
?>

<!-- content -->
<?php
if (($config_perm_wz93int != "admin") && (!isset($perm) || !$perm->have_perm($config_perm_wz93int))) {
    $be->box_full($t->translate("Error"), $t->translate("Access denied"));
} else {
	$ft = @fopen("sql/wz03int.txt", "r");
	$fs = @fopen("sql/tblbranch03.sql", "w");
	$i = 1;
	fputs($fs, "INSERT INTO tblbranch VALUES ($i,\"\",\"\",\"\");\n");
	$i++;
	$curida = array();
	$curpar = array(1);
	echo "<p>";
	do {
		$line = @fgets($ft, 40960);
		$line = trim($line);
		if (!empty($line)) {
			$id = strtok($line, ' ');
     		$ida = $curida;
			$k = 1;
			$idpos = strcspn($id, ".");
			while ($idpos) {
    			$idtok = substr($id, 0, $idpos);
    			$id = substr($id, $idpos+1, strlen($id));
				if ($k == 1 && ereg("[A-Z]", $idtok)) {
					if (strlen($idtok) > 1) {
						$curida = array(substr($idtok, 0, 1), substr($idtok, 1, 1));
					} else {
						$curida = array($idtok);
					}
					$ida = $curida;
				} else if ($k == 2 && strlen($idtok) > 1) {
					$ida[] = substr($idtok, 0, 1);
					$ida[] = substr($idtok, 1, 1);
				} else {
					$ida[] = $idtok;
				}
     			$idpos = strcspn($id, ".");
				$k++;
			}
			$curpar[count($ida)] = $i;
			$parent = $curpar[count($ida) - 1];
			$branch = trim(strstr ($line, ' '));
			$output = "INSERT INTO tblbranch VALUES ($i, \"$line\", $parent, \"\");";
			echo "$output<br>\n";
			fputs($fs, "$output\n");
			$i++;
		}
	} while (! @feof($ft));
	@fclose($ft);
	@fclose($fs);
}
?>
<!-- end content -->

<?php
require("footer.inc");
page_close();
?>
 
