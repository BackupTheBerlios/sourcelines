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
# Main Library file.
# You'll find in SourceLines's documentation a good explanation of the
# functions that are coded in this file.
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
######################################################################

#
# Shows an error when the database access fails
#

function mysql_die() {
	global $t,$be;
	if (isset($be)) {
        $be->box_full($t->translate("Database Access failed"), mysql_errno()." : ".mysql_error());
    }
}

#
# Returns date/time in timestamp format 
#

function mktimestamp($datetime) {
    $timestamp = mktime(substr($datetime,11,2),substr($datetime,14,2),substr($datetime,17,2),substr($datetime,5,2),substr($datetime,8,2),substr($datetime,0,4));
    return $timestamp;
}

#
# Returns timestamp as formatted string
#

function timestr($timestamp) {
    global $t;
    $time = strftime("%A, %e. %B %Y, %H:%M:%S %Z", $timestamp);
    return $time;
}

function timestr_short($timestamp){
    global $t;
    $time = strftime("%e. %b %H:%M", $timestamp);
    return $time;
}

#
# solshow: Shows information stored about a solution
#

function solshow($db) {
	global $bx, $tbw, $t, $sess, $auth, $perm;
	global $sys_logo_dir, $sys_logo_url, $config_maxwidth;

	$solu_id             = $db->f("solutions_id");
	$solu_name           = $db->f("solutions_name");
	$solu_version        = $db->f("solutions_version");
	$solu_logo           = $db->f("solutions_logo");
	$solu_summary        = $db->f("solutions_summary");
	$bran_id             = $db->f("branch_id");
	$cate_id             = $db->f("category_id");
	$solu_url            = $db->f("solutions_url");
	$solu_create_date    = $db->f("solutions_create_date");
	$solu_modify_date    = $db->f("solutions_modify_date");
	$username            = $db->f("username");
	$solu_contact_name   = $db->f("solutions_contact_name");
	$solu_contact_email  = $db->f("solutions_contact_email");
	$solu_contact_url    = $db->f("solutions_contact_url");
	$solu_contact_logo   = $db->f("solutions_contact_logo");
	$solu_supplier_name  = $db->f("solutions_supplier_name");
	$solu_supplier_email = $db->f("solutions_supplier_email");
	$solu_supplier_url   = $db->f("solutions_supplier_url");
	$solu_supplier_logo  = $db->f("solutions_supplier_logo");
	$email_usr           = $db->f("email_usr");

	/*----------------------------------------------------------- Name */
	$bx->box_begin();
	$bx->box_title_begin();
	echo "<b>".$t->translate("Solution").": <a href=\"".$sess->url("solutions.php").$sess->add_query(array("solu_id" => $solu_id))."\">$solu_name</a></b>";
	$bx->box_title_end();
	$bx->box_body_begin();

	/*----------------------------------------------------------- User */
	$timestamp = mktimestamp($solu_modify_date);
	$datetime = timestr($timestamp);
	echo "<b>".$t->translate("by")." <a href=\"mailto:$email_usr\">$username</a> - ".$datetime."</b>\n";

	/*----------------------------------------------------------- Logo */
	if (!empty($solu_logo)) {
		$logodir = $sys_logo_dir.$solu_id."solution_".rawurlencode(basename($solu_logo));
		$logourl = $sys_logo_url.$solu_id."solution_".rawurlencode(basename($solu_logo));
		$size = GetImageSize($logodir);
		$width = $size[0];
		$height = $size[1];
		if ($width > $config_maxwidth) {
			$height = round($height / $width * $config_maxwidth); 
			$width = $config_maxwidth;
		}
		if (($solu_url != "http://" && !empty($solu_url)))
			echo "<p><a href=\"$solu_url\" target=_blank><img src=\"".$logourl."\" width=\"".$width."\" height=\"".$height."\" border=\"0\"></a>";
		else
			echo "<p><img src=\"".$logourl."\" width=\"".$width."\" height=\"".$height."\" border=\"0\">";
	}

	/*-------------------------------------------------------- Summary */
	if (strlen($solu_summary) > 200) {
		$solu_summary = substr($solu_summary, 0, 200)."...<br><b><a href=\"".$sess->url("solutions.php").$sess->add_query(array("solu_id" => $solu_id))."\">".$t->translate("more")."...</a></b><br>&nbsp;";
	}
	echo "<p>$solu_summary\n";

	$tbw->table_begin();
	/*------------------------------------------------------------ Url */
	if ($solu_url != "http://" && $solu_url != "") {
		$tbw->table_row_begin();
		$tbw->table_body_column("<b>".$t->translate("Homepage").":</b>");
		$tbw->table_body_column("<a href=\"$solu_url\" target=\"_blank\">$solu_url</a>");
		$tbw->table_row_end();
	}

	/*--------------------------------------------------- Contact name */
	if ($solu_contact_name != "") {
		$tbw->table_row_begin();
		$tbw->table_body_column("<b>".$t->translate("Contact").":</b>");
		$tbw->table_body_column_begin();
		If ($solu_contact_url != "http://" && !empty($solu_contact_url))
			echo "<a href=\"$solu_contact_url\" target=\"_blank\">$solu_contact_name</a>\n";
		else
			echo "$solu_contact_name\n";
	}

	/*-------------------------------------------------- Contact email */
	if ($solu_contact_email != "") {
		$email = str_replace("@", " at ", $solu_contact_email);
		$email = str_replace(".", " dot ", $email);
		echo " &lt;<a href=\"mailto:$solu_contact_email\">$email</a>&gt;";
		$tbw->table_row_end();
	}

	/*-------------------*/

	$db1 = new DB_SourceLines;

	/*--------------------------------------------------------- Branch */
	$query = "SELECT * FROM tblbranch WHERE branch_id = '$bran_id'";
	$db1->query($query);
	if ($db1->next_record()) {
		$branchstr = "<a href=\"".$sess->url("bybranch.php").$sess->add_query(array("bran_id" => $db1->f("branch_id")))."\">".$db1->f("branch_name")."</a>";
		$tbw->table_row_begin();
		$tbw->table_body_column("<b>".$t->translate("Branch").":</b>");
		$tbw->table_body_column($branchstr);
		$tbw->table_row_end();
	}

	/*------------------------------------------------------- Category */
	$query = "SELECT * FROM tblcategory WHERE category_id = '$cate_id'";
	$db1->query($query);
	while($db1->next_record()) {
		$categorystr = "&gt;&nbsp;<a href=\"".$sess->url("bycategory.php").$sess->add_query(array("cate_id" => $db1->f("category_id")))."\">".$t->translate($db1->f("category_name"))."</a>";
		do {
			$category_parent = $db1->f("category_parent");
			$query = "SELECT * FROM tblcategory WHERE category_id = '$category_parent'";
			$db1->query($query);
			$db1->next_record();
			if ($db1->f("category_name") != "")
				$categorystr = "&gt;&nbsp;".$t->translate($db1->f("category_name"))." ".$categorystr;
		} while ($db1->f("category_parent") > 0);
		$tbw->table_row_begin();
		$tbw->table_body_column("<b>".$t->translate("Category").":</b>");
		$tbw->table_body_column($categorystr);
		$tbw->table_row_end();
	}

	/*------------------------------------------------------- Keywords */
	$query = "SELECT * FROM tblkeyword WHERE solutions_id = '$solutions_id'";
	$db1->query($query);
	while($db1->next_record()) {
		$keywordstr .= ", ".$t->translate($db1->f("keyword_text"));
	}
	$keywordstr = substr($keywordstr, 2, strlen($keywordstr));
	if (strlen($keywordstr) > 0) {
		$tbw->table_row_begin();
		$tbw->table_body_column("<b>".$t->translate("Keywords").":</b>");
		$tbw->table_body_column($keywordstr);
		$tbw->table_row_end();
	}

	/*---------------------------------------------------- Components */
	$query = "SELECT component_name,component_url,component_version FROM tblcomponent WHERE solutions_id = '$solutions_id'";
	$db1->query($query);
	while($db1->next_record()) {
		$componentstr .= "<br><a href=\"".$db1->f("component_url")."\">".$db1->f("component_name")." ".$db1->f("component_version")."</a>";
	}
	$componentstr = substr($componentstr, 4, strlen($componentstr));
	if (strlen($componentstr) > 0) {
		$tbw->table_row_begin();
		$tbw->table_body_column("<b>".$t->translate("Components").":</b>");
		$tbw->table_body_column($componentstr);
		$tbw->table_row_end();
	}

	/*-------------------------------------------------- Supplier name */
	if ($solu_supplier_name != "") {
		$tbw->table_row_begin();
		$tbw->table_body_column("<b>".$t->translate("Supplier").":</b>");
		$tbw->table_body_column_begin();
		If ($solu_supplier_url != "http://" && !empty($solu_supplier_url))
			echo "<a href=\"$solu_supplier_url\" target=\"_blank\">$solu_supplier_name</a>\n";
		else
			echo "$solu_supplier_name\n";
	}

	/*------------------------------------------------- Supplier email */
	if ($solu_supplier_email != "") {
		$email = str_replace("@", " at ", $solu_supplier_email);
		$email = str_replace(".", " dot ", $email);
		echo " &lt;<a href=\"mailto:$solu_supplier_email\">$email</a>&gt;";
		$tbw->table_row_end();
	}

	/*-------------------------------------------------------- Version */
	if ($solu_version != "") {
		$tbw->table_row_begin();
		$tbw->table_body_column("<b>".$t->translate("Version").":</b>");
		$tbw->table_body_column($solu_version);
		$tbw->table_row_end();
	}

	/*------------------------------------------------------------- Id */
	$tbw->table_row_begin();
	$tbw->table_body_column("<b>".$t->translate("Id").":</b>");
	$tbw->table_body_column_begin(1,"80%");
	echo "<a href=\"".$sess->url("solutions.php").$sess->add_query(array("solu_id" => $solu_id))."\">$solu_id</a>";
	$tbw->table_body_column_end();
	$tbw->table_row_end();
	$tbw->table_end();

	$bx->box_body_end();
	$bx->box_title_begin();
	if (isset($auth) && !empty($auth->auth["perm"]) && !($logout)) {
		if (($perm->have_perm("user") && $auth->auth["uname"] == $username) || $perm->have_perm("admin"))
    			echo "<b><a href=\"".$sess->url("newsolutions.php").$sess->add_query(array("solu_id" => $solu_id))."\"><img src=\"images/recycled.png\" border=0 alt=\"".$t->translate("Update Solution")."\">&nbsp;".$t->translate("Update Solution")."</a></b>&nbsp;&nbsp;";
	}
	echo "<b><a href=\"".$sess->url("comment.php").$sess->add_query(array("id" => $solu_id))."\"><img src=\"images/txt.png\" border=0 alt=\"".$t->translate("Add Comment")."\">&nbsp;".$t->translate("Add Comment")."</a></b>";

	$db_cmt = new DB_SourceLines;
	$query = "SELECT COUNT(*) FROM tblcomment WHERE solutions_id = '$solu_id'";
	$db_cmt->query($query);
	if ($db_cmt->next_record()) {
		$count = $db_cmt->f("COUNT(*)");
		if ($count > 0) {
			echo "<b>&nbsp;|&nbsp;<a href=\"".$sess->url("solutions.php").$sess->add_query(array("solu_id" => $solu_id, "action" => "cmt"))."\">".$t->translate("Read Comment")."&nbsp;[$count]</a></b>\n";
		}
	}

	$bx->box_title_end();
	$bx->box_end();
}

#
# solupd: Shows form with all information to update a solution
#

function solupd($db) {
	global $bx, $tbw, $tbf, $tbg, $t, $sess;
	global $sys_docu_url;

	$solu_id             = $db->f("solutions_id");
	$solu_name           = $db->f("solutions_name");
	$solu_version        = $db->f("solutions_version");
	$solu_logo           = $db->f("solutions_logo");
	$solu_summary        = $db->f("solutions_summary");
	$bran_id             = $db->f("branch_id");
	$cate_id             = $db->f("category_id");
	$solu_url            = $db->f("solutions_url");
	$solu_create_date    = $db->f("solutions_create_date");
	$solu_modify_date    = $db->f("solutions_modify_date");
	$username            = $db->f("username");
	$solu_contact_name   = $db->f("solutions_contact_name");
	$solu_contact_email  = $db->f("solutions_contact_email");
	$solu_contact_url    = $db->f("solutions_contact_url");
	$solu_contact_logo   = $db->f("solutions_contact_logo");
	$solu_supplier_name  = $db->f("solutions_supplier_name");
	$solu_supplier_email = $db->f("solutions_supplier_email");
	$solu_supplier_url   = $db->f("solutions_supplier_url");
	$solu_supplier_logo  = $db->f("solutions_supplier_logo");
	$email_usr           = $db->f("email_usr");

	debug("solu_id: $solu_id");

	/*------------------------------------------- BOX tbllicense */
	$bx->box_begin();
	$bx->box_title($t->translate("Your Solution"));
	$bx->box_body_begin();

	/*------------------------------------------ gesamte Tabelle */
	$tbf->table_begin();
	$tbf->table_row_begin();
	$tbf->table_body_column_begin(1,"80%");

	/*-------------------------------------------- linke Tabelle */
	$tbw->table_begin();
	echo "<form action='".$sess->url("updsolutions.php")."' enctype='multipart/form-data' method='POST'>";

	/*----------------------------------------------------- User */
 	$tbw->table_row_begin();
	$tbw->table_body_column("<b>".$t->translate("User").":</b>");
	$tbw->table_body_column_begin(2);
	echo "<a href=\"mailto:$email_usr\">$username</a>";
	$tbw->table_body_column_end();

	/*------------------------------------------------------- Id */
 	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Id").":</b>");
	$tbw->table_body_column_begin(2);
	echo "<a href=\"".$sess->url("solutions.php").$sess->add_query(array("solu_id" => $solu_id))."\">$solu_id</a>";
	$tbw->table_body_column_end();

	/*----------------------------------------------------- Name */
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Name").":</b>");
	$tbw->table_body_column_begin(2);
	echo "<input type='text' size='40' maxlength='255' name='solu_name' value='$solu_name'>";
	$tbw->table_body_column_end();

	/*-------------------------------------------------- Version */
	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Version").":</b>");
	$tbw->table_body_column_begin(2);
	echo "<input type='text' size='40' maxlength='64' name='solu_version' value='$solu_version'>";
	$tbw->table_body_column_end();

	/*----------------------------------------------------- Logo */

	echo "<input type=\"hidden\" name=\"cursolulogo\" value=\"$solu_logo\">\n";
	if (!empty($solu_logo)) {
  		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Current logo").":</b>");
		$tbw->table_body_column("$solu_logo",2);
  		$tbw->table_row_next();
		$tbw->table_body_column("");
		$tbw->table_body_column_begin(2);
		echo "<input type=radio name=\"solulogoact\" value=\"keep\" checked> ".$t->translate("Keep")."\n";
		echo "<input type=radio name=\"solulogoact\" value=\"new\"> ".$t->translate("New")."\n";
		echo "<input type=radio name=\"solulogoact\" value=\"delete\"> ".$t->translate("Delete")."\n";
		$tbw->table_body_column_end();

	} else {
	    echo "<input type=\"hidden\" name=\"solulogoact\" value=\"new\">\n";
	}
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Logo").":</b>");
	$tbw->table_body_column_begin(2);
	echo "<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"$config_maxlogosize\">\n";
	echo "<input name=\"solulogo\" type=\"file\">\n";
	$tbw->table_body_column_end();

        /*-------------------------------------------------- Summary */
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Summary").":</b>");
	$tbw->table_body_column_begin(2);
        echo "<textarea wrap='virtual' rows='10' cols='40' name='solu_summary'>$solu_summary</textarea>";
	echo "<br>".$t->translate("Allowed HTML").": &lt;p&gt; &lt;b&gt; &lt;i&gt; &lt;a&gt; &lt;em&gt; &lt;br&gt; &lt;strong&gt; &lt;blockquote&gt; &lt;tt&gt; &lt;li&gt; &lt;ol&gt; &lt;ul&gt;";
	$tbw->table_body_column_end();

        /*------------------------------------------------- Homepage */
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Homepage").":</b>");
	$tbw->table_body_column_begin(2);
	if (empty($solu_url)) $solu_url = "http://";
        echo "<input type='text' size='40' maxlength='255' name='solu_url' value='$solu_url'>";
	$tbw->table_body_column_end();

	/*-------------------------------------------- Creation date */
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Created").":</b>");
	$tbw->table_body_column_begin(2);
	if ($solu_create_date == "0000-00-00 00:00:00") $solu_create_date = date("Y-m-d H:i:s");
        echo "<input type='text' size='19' name='solu_create_date' value='$solu_create_date'> (YYYY-MM-DD HH:MM:SS)";
	$tbw->table_body_column_end();

	/*----------------------------------------- Modification date*/
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Last modified").":</b>");
	$tbw->table_body_column_begin(2);
	$solu_modify_date = date("Y-m-d H:i:s");
        echo "<input type='text' size='19' name='solu_modify_date' value='$solu_modify_date'> (YYYY-MM-DD HH:MM:SS)";
	$tbw->table_body_column_end();

	/*--------------------------------------------- Separation */
 	$tbw->table_row_begin();
	$tbw->table_body_column_begin(3);
	echo "<hr>\n";
	$tbw->table_body_column_end();

	/*--------------------------------------------- Contact name */
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Contact name").":</b>");
	$tbw->table_body_column_begin(2);
        echo "<input type='text' size='40' maxlength='255' name='solu_contact_name'  value='$solu_contact_name'>";
	$tbw->table_body_column_end();

    /*-------------------------------------------- Contact email */
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Contact email").":</b>");
	$tbw->table_body_column_begin(2);
        echo "<input type='text' size='40' maxlength='128' name='solu_contact_email' value='$solu_contact_email'>";
	$tbw->table_body_column_end();

    /*---------------------------------------------- Contact Url */
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Contact url").":</b>");
	$tbw->table_body_column_begin(2);
	if (empty($solu_contact_url)) $solu_contact_url = "http://";
        echo "<input type='text' size='40' maxlength='255' name='solu_contact_url' value='$solu_contact_url'>";
	$tbw->table_body_column_end();

    /*--------------------------------------------- Contact logo */
	echo "<input type=\"hidden\" name=\"curcontlogo\" value=\"$solu_contact_logo\">\n";
	if (!empty($solu_contact_logo)) {
  		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Current contact logo").":</b>");
		$tbw->table_body_column("$solu_contact_logo",2);
  		$tbw->table_row_next();
		$tbw->table_body_column("");
		$tbw->table_body_column_begin(2);
		echo "<input type=radio name=\"solucontlogoact\" value=\"keep\" checked> ".$t->translate("Keep")."\n";
		echo "<input type=radio name=\"solucontlogoact\" value=\"new\"> ".$t->translate("New")."\n";
		echo "<input type=radio name=\"solucontlogoact\" value=\"delete\"> ".$t->translate("Delete")."\n";
		$tbw->table_body_column_end();

	} else {
	    echo "<input type=\"hidden\" name=\"solucontlogoact\" value=\"new\">\n";
	}
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Contact logo").":</b>");
	$tbw->table_body_column_begin(2);
	echo "<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"$config_maxlogosize\">\n";
	echo "<input name=\"solucontlogo\" type=\"file\">\n";
	$tbw->table_body_column_end();

	/*--------------------------------------------- Separation */
 	$tbw->table_row_begin();
	$tbw->table_body_column_begin(3);
	echo "<hr>\n";
	$tbw->table_body_column_end();

        /*--------------------------------------------- Supplier name */
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Supplier name").":</b>");
	$tbw->table_body_column_begin(2);
        echo "<input type='text' size='40' maxlength='255' name='solu_supplier_name'  value='$solu_supplier_name'>";
	$tbw->table_body_column_end();

    /*-------------------------------------------- Supplier email */
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Supplier email").":</b>");
	$tbw->table_body_column_begin(2);
        echo "<input type='text' size='40' maxlength='128' name='solu_supplier_email' value='$solu_supplier_email'>";
	$tbw->table_body_column_end();

    /*---------------------------------------------- Supplier Url */
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Supplier url").":</b>");
	$tbw->table_body_column_begin(2);
	if (empty($solu_supplier_url)) $solu_supplier_url = "http://";
        echo "<input type='text' size='40' maxlength='255' name='solu_supplier_url' value='$solu_supplier_url'>";
	$tbw->table_body_column_end();

    /*--------------------------------------------- Supplier logo */
	echo "<input type=\"hidden\" name=\"cursupplogo\" value=\"$solu_supplier_logo\">\n";
	if (!empty($solu_supplier_logo)) {
  		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Current supplier logo").":</b>");
		$tbw->table_body_column("$solu_supplier_logo",2);
  		$tbw->table_row_next();
		$tbw->table_body_column("");
		$tbw->table_body_column_begin(2);
		echo "<input type=radio name=\"solusupplogoact\" value=\"keep\" checked> ".$t->translate("Keep")."\n";
		echo "<input type=radio name=\"solusupplogoact\" value=\"new\"> ".$t->translate("New")."\n";
		echo "<input type=radio name=\"solusupplogoact\" value=\"delete\"> ".$t->translate("Delete")."\n";
		$tbw->table_body_column_end();

	} else {
	    echo "<input type=\"hidden\" name=\"solusupplogoact\" value=\"new\">\n";
	}
  	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Supplier logo").":</b>");
	$tbw->table_body_column_begin(2);
	echo "<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"$config_maxlogosize\">\n";
	echo "<input name=\"solusupplogo\" type=\"file\">\n";
	$tbw->table_body_column_end();

        /*------------------------------------ Buttons: OK and Delete */
  	$tbw->table_row_next();
	$tbw->table_body_column("&nbsp;");
	$tbw->table_body_column_begin();
        echo "<input type='submit' name='sendaction' value='".$t->translate("Send")."'>";
	$tbw->table_body_column_next();
        echo "<input type='submit' name='deleteaction' value='".$t->translate("Delete")."'>";
        echo "<input type='hidden' name='solu_id' value='$solu_id'>";
        echo "<input type='hidden' name='username' value='$username'>";
	$tbw->table_body_column_end();
        echo "</form>";
	$tbw->table_row_end();
	$tbw->table_end();
        /*-------------------------------------- Ende: linke Tabelle */

	$tbf->table_body_column_next();

        /*------------------------------------------- rechte Tabelle */
	$tbf->table_begin();
	$tbf->table_row_begin();
	$tbf->table_body_column_begin(1,"20%");

        /*------------------------------------------- Branch */
	$bx->box_begin();
	$bx->box_title_begin();

	echo "<b>".$t->translate("Branch")."</b>";
        echo " <b>[<a href='".$sess->url("selbranch.php").$sess->add_query(array("solu_id" => $solu_id, "bran_id" => $bran_id))."'>".$t->translate("Select")."</a>]</b>";
#        echo "<form action='".$sess->url("selbranch.php")."' method='POST'>";
#        echo "<input type='submit' value='".$t->translate("Select")."'>";
#        echo "<input type='hidden' name='solu_id' value=$solu_id>";
#        echo "<input type='hidden' name='bran_id' value='$bran_id'>";
	$bx->box_title_end();
#        echo "</form>";

	/*----------*/
	$bx->box_body_begin();
	$db_branch = new DB_SourceLines;
	$query = "SELECT * FROM tblbranch WHERE branch_id='$bran_id'";
	$db_branch->query($query);
	$string = "";
	if($db_branch->next_record()) {
		$string = "<a href=\"".$sess->url("bybranch.php").$sess->add_query(array("bran_id" => $db_branch->f("branch_id")))."\">".$t->translate($db_branch->f("branch_name"))."</a>";
	}
	if (strlen($string) <= 0) {
		$string = $t->translate("no branch selected");
	}
	echo "$string\n";
	$bx->box_body_end();
	$bx->box_end();

        /*-------------------------------------------- Category */
	$tbf->table_body_column_end();
	$tbf->table_row_next();
	$tbf->table_body_column_begin();

	$bx->box_begin();
	$bx->box_title_begin();

	echo "<b>".$t->translate("Category")."</b>";
        echo " <b>[<a href='".$sess->url("selcategory.php").$sess->add_query(array("solu_id" => $solu_id, "cate_id" => $cate_id))."'>".$t->translate("Select")."</a>]</b>";
#	echo "<form action='".$sess->url("selcategory.php")."' method='POST'>";
#        echo "<input type='submit' value='".$t->translate("Select")."'>";
#        echo "<input type='hidden' name='solu_id' value=$solu_id>";
#        echo "<input type='hidden' name='cate_id' value=$cate_id>";

	$bx->box_title_end();
#        echo "</form>";
	/*----------*/
	$bx->box_body_begin();
	$db_cate = new DB_SourceLines;
	$i = 1;
	$string = "";
	do {
		$query = "SELECT * FROM tblcategory WHERE category_id='$cate_id'";
		$db_cate->query($query);
        	while($db_cate->next_record()) {
			if ($db_cate->f("category_name") != "") {
				if ($i == 1) {
					$string = "&gt;&nbsp;<a href=\"".$sess->url("bycategory.php").$sess->add_query(array("cate_id" => $db_cate->f("category_id")))."\">".$db_cate->f("category_name")."</a><br>".$string;
				} else {
					$string = "&gt;&nbsp;".$t->translate($db_cate->f("category_name"))."<br>".$string;
				}
			}
			$i++;
			$cate_id = $db_cate->f("category_parent");
			$query = "SELECT * FROM tblcategory WHERE category_id='$cate_id'";
			$db_cate->query($query);
		}
	} while ($cate_id > 0);
        $stringlength = strlen($string);
	if ($stringlength <= 0) {
		$string = $t->translate("no category selected");
        } else {
        	$string = substr($string, 0, $stringlength - 4);
	}
	echo "$string";
	$bx->box_body_end();
	$bx->box_end();

       /*------------------------------------------------- Keywords */
	$tbf->table_body_column_end();
	$tbf->table_row_next();
	$tbf->table_body_column_begin();

	$bx->box_begin();
	$bx->box_title_begin();
	
	echo "<b>".$t->translate("Keywords")."</b>";
        echo " <b>[<a href='".$sess->url("selkeyword.php").$sess->add_query(array("solu_id" => $solu_id))."'>".$t->translate("Select")."</a>]</b>";
#        echo "<form action='".$sess->url("selkeyword.php")."' method='POST'>";
#        echo "<input type='submit' value='".$t->translate("Select")."'>";
#        echo "<input type='hidden' name='solu_id' value='$solu_id'>";

	$bx->box_title_end();
#        echo "</form>";
        /*----------*/
	$bx->box_body_begin();
        $db_key = new DB_SourceLines;
        $query = "SELECT keyword_id,keyword_text FROM tblkeyword WHERE solutions_id=$solu_id ORDER BY keyword_text";
        $db_key->query($query);
        $string = "";
        while($db_key->next_record()) {
        	$string .= "<br><a href=\"".$sess->url("bykeyword.php").$sess->add_query(array("keyword" => $db_key->f("keyword_text")))."\">".$t->translate($db_key->f("keyword_text"))."</a>";
        }
        $stringlength = strlen($string);
	if ($stringlength <= 0) {
		$string = $t->translate("no keywords selected");
        } else {
        	$string = substr($string, 4, $stringlength);
	}
	echo "$string";
	$bx->box_body_end();
	$bx->box_end();

        /*--------------------------------------------------- Language */
	$tbf->table_body_column_end();
	$tbf->table_row_next();
	$tbf->table_body_column_begin();

	$bx->box_begin();
	$bx->box_title_begin();
		
	echo "<b>".$t->translate("Language")."</b>";
        echo " <b>[<a href='".$sess->url("sellanguage.php").$sess->add_query(array("solu_id" => $solu_id))."'>".$t->translate("Select")."</a>]</b>";
#        echo "<form action='".$sess->url("sellanguage.php")."' method='POST'>";
#        echo "<input type='submit' value='".$t->translate("Select")."'>";
#        echo "<input type='hidden' name='solu_id' value='$solu_id'>";

	$bx->box_title_end();
#        echo "</form>";
        /*----------*/
	$bx->box_body_begin();
        $db_lang = new DB_SourceLines;
        $query  = "SELECT * FROM tblsolutionslanguage, tbllanguage ";
        $query .= "WHERE solutions_id=$solu_id ";
        $query .= "AND tblsolutionslanguage.language_id=tbllanguage.language_id ";
        $query .= "ORDER BY language_name";
        $db_lang->query($query);
        $string = "";
        while($db_lang->next_record()) {
        	$string .= "<br>".$t->translate($db_lang->f("language_name"));
        }
        $stringlength = strlen($string);
	if ($stringlength <= 0) {
		$string = $t->translate("no language selected");
        } else {
        	$string = substr($string, 4, $stringlength);
	}
	echo "$string";
	$bx->box_body_end();
	$bx->box_end();

        /*----------------------------------------------- Components */
	$tbf->table_body_column_end();
	$tbf->table_row_next();
	$tbf->table_body_column_begin();

	$bx->box_begin();
	$bx->box_title_begin();

	echo "<b>".$t->translate("Components")."</b>";
        echo " <b>[<a href='".$sess->url("selcomponent.php").$sess->add_query(array("solu_id" => $solu_id))."'>".$t->translate("Select")."</a>]</b>";
#        echo "<form action='".$sess->url("selcomponent.php")."' method='POST'>";
#        echo "<input type='submit' value='".$t->translate("Select")."'>";
#        echo "<input type='hidden' name='solu_id' value='$solu_id'>";

	$bx->box_title_end();
#        echo "</form>";
        /*----------*/
	$bx->box_body_begin();
        $db_type = new DB_SourceLines;
        $query = "SELECT * FROM tblcomponenttype ORDER BY componenttype_name";
        $db_type->query($query);
        /*-----*/
        $typeid   = array();
        $typename = array();
        /*-----*/
        while ($db_type->next_record()) {
        	$typeid[] = $db_type->f("componenttype_id");
		$typename[] = $db_type->f("componenttype_name");
        }
        /*-----*/
        for ($x = 0; $x < count($typeid); $x++) {
        	$db_comp = new DB_SourceLines;
		$query  = "SELECT component_name,component_url,component_version FROM tblcomponent ";
		$query .= "WHERE solutions_id=$solu_id ";
		$query .= "AND tblcomponent.componenttype_id=".$typeid[$x]." ";
		$query .= "ORDER BY component_name";
		$db_comp->query($query);
		/*-----*/
		$string = "";
		while ($db_comp->next_record()) {
			$string .= "<a href=\"".$db_comp->f("component_url")."\" target=\"_blank\">".$db_comp->f("component_name")." ".$db_comp->f("component_version")."</a>, ";
		}
		/*-----*/
		$stringlength = strlen($string);
		$string = substr($string, 0, $stringlength - 2);
		/*-----*/
		echo "<b>".$t->translate($typename[$x]).":</b><br>";
		if(trim($string)!="")
			echo $string."<br>";
		else
			echo $t->translate("not applicable")."<br>";
	}
	$bx->box_body_end();
	$bx->box_end();

       /*------------------------------------------------- Documents */
	$tbf->table_body_column_end();
	$tbf->table_row_next();
	$tbf->table_body_column_begin();

	$bx->box_begin();
	$bx->box_title_begin();
	
	echo "<b>".$t->translate("Documents")."</b>";
        echo " <b>[<a href='".$sess->url("seldocument.php").$sess->add_query(array("solu_id" => $solu_id))."'>".$t->translate("Select")."</a>]</b>";
#        echo "<form action='".$sess->url("seldocument.php")."' method='POST'>";
#        echo "<input type='submit' value='".$t->translate("Select")."'>";
#        echo "<input type='hidden' name='solu_id' value='$solu_id'>";

	$bx->box_title_end();
#        echo "</form>";
        /*----------*/
	$bx->box_body_begin();
        $db_doc = new DB_SourceLines;
        $query = "SELECT document_title,document_filename FROM tbldocument WHERE solutions_id=$solu_id ORDER BY document_title";
        $db_doc->query($query);
        $string = "";
        while($db_doc->next_record()) {
		$docurl = $sys_docu_url.$solu_id."document_".rawurlencode($db_doc->f("document_filename"));
        	$string .= "<br><a href=\"".$sess->url($docurl)."\" target=\"_blank\">".$db_doc->f("document_title")."</a>";
        }
        $stringlength = strlen($string);
	if ($stringlength <= 0) {
		$string = $t->translate("no documents provided");
        } else {
        	$string = substr($string, 4, $stringlength);
	}
	echo "$string";
	$bx->box_body_end();
	$bx->box_end();

        /*-------------------------------------- Ende: rechte Tabelle */
	$tbf->table_body_column_end();
	$tbf->table_row_end();
	$tbf->table_end();

        /*------------------------------------ Ende: gesamte Tabelle */
	$tbf->table_body_column_end();
	$tbf->table_row_end();
	$tbf->table_end();
        /*-----------------------------------------------------------*/
        $bx->box_body_end();
        $bx->box_end();
}

#
# solfull: Shows form with all information to update a solution
#

function solfull($db) {
	global $bx, $tbw, $tbf, $tbg, $t, $sess, $auth, $perm, $action;
	global $sys_logo_url, $sys_logo_dir, $sys_docu_url, $config_maxwidth;

	$solu_id             = $db->f("solutions_id");
	$solu_name           = $db->f("solutions_name");
	$solu_version        = $db->f("solutions_version");
	$solu_logo           = $db->f("solutions_logo");
	$solu_summary        = $db->f("solutions_summary");
	$bran_id             = $db->f("branch_id");
	$cate_id             = $db->f("category_id");
	$solu_url            = $db->f("solutions_url");
	$solu_create_date    = $db->f("solutions_create_date");
	$solu_modify_date    = $db->f("solutions_modify_date");
	$username            = $db->f("username");
	$solu_contact_name   = $db->f("solutions_contact_name");
	$solu_contact_email  = $db->f("solutions_contact_email");
	$solu_contact_url    = $db->f("solutions_contact_url");
	$solu_contact_logo   = $db->f("solutions_contact_logo");
	$solu_supplier_name  = $db->f("solutions_supplier_name");
	$solu_supplier_email = $db->f("solutions_supplier_email");
	$solu_supplier_url   = $db->f("solutions_supplier_url");
	$solu_supplier_logo  = $db->f("solutions_supplier_logo");
	$email_usr           = $db->f("email_usr");

	/*------------------------------------------- BOX tbllicense */
	$bx->box_begin();
	$bx->box_title($t->translate("Solution").": ".$t->translate("$solu_name"));
	$bx->box_body_begin();

	/*------------------------------------------ gesamte Tabelle */
	$tbf->table_begin();
	$tbf->table_row_begin();
	$tbf->table_body_column_begin(1,"80%");

	/*-------------------------------------------- linke Tabelle */
	$tbw->table_begin();

	/*---------------------------------------------------- Logo */
	if (!empty($solu_logo)) {
 		$tbw->table_row_begin();
		$tbw->table_body_column_begin(2);
		$logodir = $sys_logo_dir.$solu_id."solution_".rawurlencode(basename($solu_logo));
		$logourl = $sys_logo_url.$solu_id."solution_".rawurlencode(basename($solu_logo));
		$size = GetImageSize($logodir);
		$width = $size[0];
		$height = $size[1];
		if ($width > $config_maxwidth) {
			$height = round($height / $width * $config_maxwidth); 
			$width = $config_maxwidth;
		}
		if (($solu_url != "http://" && !empty($solu_url)))
			echo "<a href=\"$solu_url\" target=_blank><img src=\"".$logourl."\" width=\"".$width."\" height=\"".$height."\" border=\"0\"></a>";
		else
			echo "<img src=\"".$logourl."\" width=\"".$width."\" height=\"".$height."\" border=\"0\">";
		$tbw->table_body_column_end();
 		$tbw->table_row_end();
	}

	/*-------------------------------------------------- Summary */
	$tbw->table_row_begin();
	$tbw->table_body_column("<b>".$t->translate("Summary").":</b>");
	$tbw->table_body_column_begin();
	echo "$solu_summary";
	$tbw->table_body_column_end();

	/*------------------------------------------------- Homepage */
	If ($solu_url != "http://" && !empty($solu_url)) {
		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Homepage").":</b>");
		$tbw->table_body_column_begin();
		echo "<a href=\"$solu_url\" target=\"_blank\">$solu_url</a>";
		$tbw->table_body_column_end();
	}

	/*-------------------------------------------- Creation date */
	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Created").":</b>");
	$tbw->table_body_column_begin(2);
	$timestamp = mktimestamp($solu_create_date);
	$datetime = timestr($timestamp);
	echo "$datetime";
	$tbw->table_body_column_end();

	/*----------------------------------------- Modification date*/
	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Last modified").":</b>");
	$tbw->table_body_column_begin();
	$timestamp = mktimestamp($solu_modify_date);
	$datetime = timestr($timestamp);
	echo "$datetime";
	$tbw->table_body_column_end();

	/*-------------------------------------------------- Version */
	If (!empty($solu_version)) {
		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Version").":</b>");
		$tbw->table_body_column_begin();
		echo "$solu_version";
		$tbw->table_body_column_end();
	}

	/*----------------------------------------------------- User */
 	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("User").":</b>");
	$tbw->table_body_column_begin();
	echo "<a href=\"mailto:$email_usr\">$username</a>";
	$tbw->table_body_column_end();

	/*------------------------------------------------------- Id */
 	$tbw->table_row_next();
	$tbw->table_body_column("<b>".$t->translate("Id").":</b>");
	$tbw->table_body_column_begin();
	echo "<a href=\"".$sess->url("solutions.php").$sess->add_query(array("solu_id" => $solu_id))."\">$solu_id</a>";
	$tbw->table_body_column_end();

	/*--------------------------------------------- Separation */
	if (!empty($solu_contact_logo) || !empty($solu_contact_name) || !empty($solu_contact_email)) {
 		$tbw->table_row_begin();
		$tbw->table_body_column_begin(2);
		echo "<hr>\n";
		$tbw->table_body_column_end();
	}

	/*--------------------------------------------- Contact Logo */
	if (!empty($solu_contact_logo)) {
 		$tbw->table_row_begin();
		$tbw->table_body_column_begin(2);
		$logourl = $sys_logo_url.$solu_id."contact_".rawurlencode(basename($solu_contact_logo));
		$logodir = $sys_logo_dir.$solu_id."contact_".rawurlencode(basename($solu_contact_logo));
		$size = GetImageSize($logodir);
		$width = $size[0];
		$height = $size[1];
		if ($width > $config_maxwidth) {
			$height = round($height / $width * $config_maxwidth); 
			$width = $config_maxwidth;
		}
		if (($solu_contact_url != "http://" && !empty($solu_contact_url)))
			echo "<a href=\"$solu_contact_url\" target=_blank><img src=\"".$logourl."\" width=\"".$width."\" height=\"".$height."\" border=\"0\"></a>\n";
		else
			echo "<img src=\"".$logourl."\" width=\"".$width."\" height=\"".$height."\" border=\"0\">\n";
		$tbw->table_body_column_end();
 		$tbw->table_row_end();
	}

	/*--------------------------------------------- Contact name */
	If (!empty($solu_contact_name)) {
		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Contact name").":</b>");
		$tbw->table_body_column_begin();
		If ($solu_contact_url != "http://" && !empty($solu_contact_url))
			echo "<a href=\"$solu_contact_url\" target=\"_blank\">$solu_contact_name</a>\n";
		else
			echo "$solu_contact_name\n";
		$tbw->table_body_column_end();
	}

	/*-------------------------------------------- Contact email */
	If (!empty($solu_contact_email)) {
		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Contact email").":</b>");
		$tbw->table_body_column_begin();
		$email = str_replace("@", " at ",$solu_contact_email);
		$email = str_replace(".", " dot ",$email);
		echo "&lt;<a href=\"mailto:$solu_contact_email\">$email</a>&gt;";
		$tbw->table_body_column_end();
	}

	/*--------------------------------------------- Separation */
	if (!empty($solu_supplier_logo) || !empty($solu_supplier_name) || !empty($solu_supplier_email)) {
 		$tbw->table_row_begin();
		$tbw->table_body_column_begin(2);
		echo "<hr>\n";
		$tbw->table_body_column_end();
	}

	/*--------------------------------------------- Supplier Logo */
	if (!empty($solu_supplier_logo)) {
 		$tbw->table_row_begin();
		$tbw->table_body_column_begin(2);
		$logourl = $sys_logo_url.$solu_id."supplier_".rawurlencode(basename($solu_supplier_logo));
		$logodir = $sys_logo_dir.$solu_id."supplier_".rawurlencode(basename($solu_supplier_logo));
		$size = GetImageSize($logodir);
		$width = $size[0];
		$height = $size[1];
		if ($width > $config_maxwidth) {
			$height = round($height / $width * $config_maxwidth); 
			$width = $config_maxwidth;
		}
		if (($solu_supplier_url != "http://" && !empty($solu_supplier_url)))
			echo "<a href=\"$solu_supplier_url\" target=_blank><img src=\"".$logourl."\" width=\"".$width."\" height=\"".$height."\" border=\"0\"></a>\n";
		else
			echo "<img src=\"".$logourl."\" width=\"".$width."\" height=\"".$height."\" border=\"0\">\n";
		$tbw->table_body_column_end();
 		$tbw->table_row_end();
	}

	/*--------------------------------------------- Supplier name */
	If (!empty($solu_supplier_name)) {
		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Supplier name").":</b>");
		$tbw->table_body_column_begin();
		If ($solu_supplier_url != "http://" && !empty($solu_supplier_url))
			echo "<a href=\"$solu_supplier_url\" target=\"_blank\">$solu_supplier_name</a>\n";
		else
			echo "$solu_supplier_name\n";
		$tbw->table_body_column_end();
	}

	/*-------------------------------------------- Supplier email */
	If (!empty($solu_supplier_email)) {
		$tbw->table_row_next();
		$tbw->table_body_column("<b>".$t->translate("Supplier email").":</b>");
		$tbw->table_body_column_begin();
		$email = str_replace("@", " at ",$solu_supplier_email);
		$email = str_replace(".", " dot ",$email);
		echo "&lt;<a href=\"mailto:$solu_supplier_email\">$email</a>&gt;";
		$tbw->table_body_column_end();
	}

	$tbw->table_end();
	/*-------------------------------------- Ende: linke Tabelle */

	$tbf->table_body_column_next(1,"20%");

	/*------------------------------------------- rechte Tabelle */
	$tbf->table_begin();
	$tbf->table_row_begin();
	$tbf->table_body_column_begin();

	/*--------------------------------------------------- Branch */
	$bx->box_begin();
	$bx->box_title("<b>".$t->translate("Branch")."</b>");

	/*----------*/
	$bx->box_body_begin();
	$db_branch = new DB_SourceLines;
	$query = "SELECT * FROM tblbranch WHERE branch_id='$bran_id'";
	debug($query);
	$db_branch->query($query);
	$string = "";
	if($db_branch->next_record()) {
		$string = "<a href=\"".$sess->url("bybranch.php").$sess->add_query(array("bran_id" => $db_branch->f("branch_id")))."\">".$t->translate($db_branch->f("branch_name"))."</a>";
	}
	if (strlen($string) <= 0) {
		$string = $t->translate("no branch selected");
	}
	echo "$string\n";
	$bx->box_body_end();
	$bx->box_end();

	/*-------------------------------------------- Category */
	$tbf->table_body_column_end();
	$tbf->table_row_next();
	$tbf->table_body_column_begin();

	$bx->box_begin();
	$bx->box_title("<b>".$t->translate("Category")."</b>");
	
	/*----------*/
	$bx->box_body_begin();
	$db_cate = new DB_SourceLines;
	$i = 1;
	$string = "";
	do {
		$query = "SELECT * FROM tblcategory WHERE category_id='$cate_id'";
		$db_cate->query($query);
		while($db_cate->next_record()) {
			if ($db_cate->f("category_name") != "") {
				if ($i == 1) {
					$string = "&gt;&nbsp;<a href=\"".$sess->url("bycategory.php").$sess->add_query(array("cate_id" => $db_cate->f("category_id")))."\">".$t->translate($db_cate->f("category_name"))."</a><br>".$string;
				} else {
					$string = "&gt;&nbsp;".$t->translate($db_cate->f("category_name"))."<br>".$string;
				}
			}
			$i++;
			$cate_id = $db_cate->f("category_parent");
			$query = "SELECT * FROM tblcategory WHERE category_id='$cate_id'";
			$db_cate->query($query);
		}
	} while ($cate_id > 0);
	$stringlength = strlen($string);
	if ($stringlength <= 0) {
		$string = $t->translate("no category selected");
	} else {
		$string = substr($string, 0, $stringlength - 4);
	}
	echo "$string";
	$bx->box_body_end();
	$bx->box_end();

	/*---------------------------------- Keywords */
	$tbf->table_body_column_end();
	$tbf->table_row_next();
	$tbf->table_body_column_begin();

	$bx->box_begin();
	$bx->box_title("<b>".$t->translate("Keywords")."</b>");
	
	/*----------*/
	$bx->box_body_begin();
	$db_key = new DB_SourceLines;
	$query = "SELECT keyword_id,keyword_text FROM tblkeyword WHERE solutions_id=$solu_id ORDER BY keyword_text";
	$db_key->query($query);
	$string = "";
	while($db_key->next_record()) {
		$string .= "<br><a href=\"".$sess->url("bykeyword.php").$sess->add_query(array("keyword" => $db_key->f("keyword_text")))."\">".$db_key->f("keyword_text")."</a>";
	}
	$stringlength = strlen($string);
	if ($stringlength <= 0) {
		$string = $t->translate("no keywords selected");
	} else {
		$string = substr($string, 4, $stringlength);
	}
	echo "$string";
	$bx->box_body_end();
	$bx->box_end();

	/*-------------------------------------------- Language */
	$tbf->table_body_column_end();
	$tbf->table_row_next();
	$tbf->table_body_column_begin();

	$bx->box_begin();
	$bx->box_title("<b>".$t->translate("Language")."</b>");
	
	/*----------*/
	$bx->box_body_begin();
	$db_lang = new DB_SourceLines;
	$query  = "SELECT * FROM tblsolutionslanguage, tbllanguage ";
	$query .= "WHERE solutions_id=$solu_id ";
	$query .= "AND tblsolutionslanguage.language_id=tbllanguage.language_id ";
	$query .= "ORDER BY language_name";
	$db_lang->query($query);
	$string = "";
	while($db_lang->next_record()) {
		$string .= "<br>".$t->translate($db_lang->f("language_name"));
	}
	$stringlength = strlen($string);
	if ($stringlength <= 0) {
		$string = $t->translate("no language selected");
	} else {
		$string = substr($string, 4, $stringlength);
	}
	echo "$string";
	$bx->box_body_end();
	$bx->box_end();

	/*---------------------------------- Components */
	$tbf->table_body_column_end();
	$tbf->table_row_next();
	$tbf->table_body_column_begin();

	$bx->box_begin();
	$bx->box_title("<b>".$t->translate("Components")."</b>");
	
	/*----------*/
	$bx->box_body_begin();
	$db_type = new DB_SourceLines;
	$query = "SELECT * FROM tblcomponenttype ORDER BY componenttype_name";
	$db_type->query($query);
	/*-----*/
	$typeid   = array();
	$typename = array();
	/*-----*/
	while ($db_type->next_record()) {
		$typeid[] = $db_type->f("componenttype_id");
		$typename[] = $db_type->f("componenttype_name");
	}
	/*-----*/
	for ($x = 0; $x < count($typeid); $x++) {
		$db_comp = new DB_SourceLines;
		$query  = "SELECT component_name,component_url,component_version FROM tblcomponent ";
		$query .= "WHERE solutions_id=$solu_id ";
		$query .= "AND tblcomponent.componenttype_id=".$typeid[$x]." ";
		$query .= "ORDER BY component_name";
		$db_comp->query($query);
		/*-----*/
		$string = "";
		while ($db_comp->next_record()) {
			$string .= "<a href=\"".$db_comp->f("component_url")."\" target=\"_blank\">".$db_comp->f("component_name")." ".$db_comp->f("component_version")."</a>, ";
		}
		/*-----*/
		$stringlength = strlen($string);
		$string = substr($string, 0, $stringlength - 2);
		/*-----*/
		echo "<b>".$t->translate($typename[$x]).":</b><br>";
		if(trim($string)!="")
			echo $string."<br>";
		else
			echo $t->translate("not applicable")."<br>";
	}
	$bx->box_body_end();
	$bx->box_end();

	/*---------------------------------- Documents */
	$tbf->table_body_column_end();
	$tbf->table_row_next();
	$tbf->table_body_column_begin();

	$bx->box_begin();
	$bx->box_title("<b>".$t->translate("Documents")."</b>");
	
	/*----------*/
	$bx->box_body_begin();
	$db_doc = new DB_SourceLines;
	$query = "SELECT document_title,document_filename FROM tbldocument WHERE solutions_id=$solu_id ORDER BY document_title";
	$db_doc->query($query);
	$string = "";
	while($db_doc->next_record()) {
		$docurl = $sys_docu_url.$solu_id."document_".rawurlencode($db_doc->f("document_filename"));
		$string .= "<br><a href=\"".$sess->url($docurl)."\" target=\"_blank\">".$db_doc->f("document_title")."</a>";
	}
	$stringlength = strlen($string);
	if ($stringlength <= 0) {
		$string = $t->translate("no documents provided");
	} else {
		$string = substr($string, 4, $stringlength);
	}
	echo "$string";
	$bx->box_body_end();
	$bx->box_end();

	/*-------------------------------------- Ende: rechte Tabelle */
	$tbf->table_body_column_end();
	$tbf->table_row_end();
	$tbf->table_end();

	/*------------------------------------- Ende: gesamte Tabelle */
	$tbf->table_body_column_end();
	$tbf->table_row_end();
	$tbf->table_end();
	/*------------------------------------------------------------*/
	$bx->box_body_end();
	$bx->box_title_begin();
	if (isset($auth) && !empty($auth->auth["perm"]) && !($logout)) {
		if (($perm->have_perm("user") && $auth->auth["uname"] == $db->f("username")) || $perm->have_perm("admin"))
			echo "<b><a href=\"".$sess->url("newsolutions.php").$sess->add_query(array("solu_id" => $db->f("solutions_id")))."\"><img src=\"images/recycled.png\" border=0 alt=\"".$t->translate("Update Solution")."\">&nbsp;".$t->translate("Update Solution")."</a></b>&nbsp;&nbsp;";
	}
	echo "<b><a href=\"".$sess->url("comment.php").$sess->add_query(array("id" => $db->f("solutions_id")))."\"><img src=\"images/txt.png\" border=0 alt=\"".$t->translate("Add Comment")."\">&nbsp;".$t->translate("Add Comment")."</a></b>";

	$db_cmt = new DB_SourceLines;
	$query = "SELECT COUNT(*) FROM tblcomment WHERE solutions_id = '".$db->f("solutions_id")."'";
	$db_cmt->query($query);
	if ($db_cmt->next_record()) {
		echo "<b>&nbsp;|&nbsp;<a href=\"".$sess->url("solutions.php").$sess->add_query(array("solu_id" => $db->f("solutions_id"), "action" => "cmt"))."\">".$t->translate("Read Comment")."&nbsp;[".$db_cmt->f("COUNT(*)")."]</a></b>\n";
	}

	$bx->box_title_end();
	$bx->box_end();

	if ($action == "cmt") {
		$query = "SELECT * FROM tblcomment,auth_user WHERE solutions_id = '".$db->f("solutions_id")."' AND tblcomment.comment_username = auth_user.username ORDER BY tblcomment.comment_datetime DESC";
		$db_cmt->query($query);
		while ($db_cmt->next_record()) {
			$timestamp = mktimestamp($db_cmt->f("comment_datetime"));
			$datetime = timestr($timestamp);
			$bx->box_begin();
			$bx->box_title($t->translate("Comment").": ".$db_cmt->f("comment_subject"));
			$bx->box_body_begin();
			echo "<b>by <a href=\"mailto:".$db_cmt->f("email_usr")."\">".$db_cmt->f("comment_username")."</a> - ".$datetime."</b>\n";
			echo "<br><br>".$db_cmt->f("comment_text")."\n";
			$bx->box_body_end();
			$bx->box_end();
		}
	}
}

## select_branch()
##
## select by branch

function select_branch($parent,$depth) {
	global $leaves,$sess,$PHP_SELF;

	$db = new DB_SourceLines;
	$query = "SELECT * FROM tblbranch WHERE branch_parent='$parent' ORDER BY branch_name ASC";
	debug($query);
	$db->query($query);
	while($db->next_record()) {
		echo "<br>";
		for ($i=1; $i<=$depth; $i++) {
			echo "<img src=\"images/dirnext.png\" alt=\".\" align=\"absbottom\">&nbsp;";
		}
		$isleave = 0;
		$issol = 0;
		$db_leave = new DB_SourceLines;
		$query = "SELECT branch_id FROM tblbranch WHERE branch_parent='".$db->f("branch_id")."'";
		debug($query);
		$db_leave->query($query);
		debug($db_leave->num_rows());
		if ($db_leave->num_rows() <= 0) $isleave = 1;
		if (ereg("^[0-9]",$db->f("branch_name"))) {
			$issol = 1;
			$db_sol = new DB_SourceLines;
			$db_sol->query("SELECT COUNT(*) FROM tblsolutions WHERE branch_id='".$db->f("branch_id")."' AND solutions_name != 'no_name'");
			$db_sol->next_record();
			$sol_cnt = $db_sol->f("COUNT(*)");
		}
		if (strstr($leaves, ":".$db->f("branch_id").":")) {
			echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "delid" => $db->f("branch_id")))."\">";
			if ($isleave)
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			else
				echo "<img src=\"images/dirclose.png\" alt=\"[-]\" align=\"absbottom\" border=\"0\">";
			echo "</a>&nbsp;";
			if ($issol)
				echo "<a href=\"".$sess->url("bybranch.php").$sess->add_query(array("bran_id" => $db->f("branch_id")))."\">";
			echo $db->f("branch_name");
			if ($issol)
				echo "</a> [$sol_cnt]\n";
			$ndepth = $depth + 1;
			select_branch($db->f("branch_id"),$ndepth);
		} else {
			echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "addid" => $db->f("branch_id")))."\">";
			if ($isleave)
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			else
				echo "<img src=\"images/diropen.png\" alt=\"[+]\" align=\"absbottom\" border=\"0\">";
			echo "</a>&nbsp;";
			if ($issol)
				echo "<a href=\"".$sess->url("bybranch.php").$sess->add_query(array("bran_id" => $db->f("branch_id")))."\">";
			echo $db->f("branch_name");
			if ($issol)
				echo "</a> [$sol_cnt]\n";
		}
	}
}

## branch_tree($parent,$depth,$select)
##
## shows tree of branches

function branch_tree($parent,$depth,$select) {
	global $solu_id,$leaves,$sess,$PHP_SELF;

	$db = new DB_SourceLines;
	$db->query("SELECT * FROM tblbranch WHERE branch_parent='$parent' ORDER BY branch_name ASC");
	while($db->next_record()) {
		echo "<br>";
		for ($i=1; $i<=$depth; $i++) {
			echo "<img src=\"images/dirnext.png\" alt=\".\" align=\"absbottom\">&nbsp;";
		}
		$isleave = 0;
		$issol = 0;
		$db_leave = new DB_SourceLines;
		$db_leave->query("SELECT branch_id FROM tblbranch WHERE branch_parent='".$db->f("branch_id")."'");
		if ($db_leave->num_rows() <= 0) $isleave = 1;
		if (ereg("^[0-9]",$db->f("branch_name"))) $issol = 1;
		if (strstr($leaves, ":".$db->f("branch_id").":")) {
			echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("solu_id" => $solu_id, "leaves" => $leaves, "delid" => $db->f("branch_id")))."\">";
			if ($isleave)
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			else
				echo "<img src=\"images/dirclose.png\" alt=\"[-]\" align=\"absbottom\" border=\"0\">";
			echo "</a>&nbsp;";
			if ($select == $db->f("branch_id")) echo "<b>";
			if ($issol) echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("solu_id" => $solu_id, "leaves" => $leaves, "action" => "db_set", "bran_id" => $db->f("branch_id")))."\">";
			echo $db->f("branch_name");
			if ($issol) echo "</a>";
			debug (" (".$db->f("branch_id").")");
			if ($select == $db->f("branch_id")) echo "</b>\n";
			$ndepth = $depth + 1;
			branch_tree($db->f("branch_id"),$ndepth,$select);
		} else {
			echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("solu_id" => $solu_id, "leaves" => $leaves, "addid" => $db->f("branch_id")))."\">";
			if ($isleave)
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			else
				echo "<img src=\"images/diropen.png\" alt=\"[+]\" align=\"absbottom\" border=\"0\">";
			echo "</a>&nbsp;";
			if ($select == $db->f("branch_id")) echo "<b>";
			if ($issol) echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("solu_id" => $solu_id, "leaves" => $leaves, "action" => "db_set", "bran_id" => $db->f("branch_id")))."\">";
			echo $db->f("branch_name");
			if ($issol) echo "</a>";
			debug (" (".$db->f("branch_id").")");
			if ($select == $db->f("branch_id")) echo "</b>\n";
		}
	}
}

## adm_branch_tree($parent,$depth)
##
## administrate tree of branches

function adm_branch_tree($parent,$depth) {
	global $solu_id,$t,$leaves,$sess,$PHP_SELF;

	$db = new DB_SourceLines;
	$db->query("SELECT * FROM tblbranch WHERE branch_parent='$parent' ORDER BY branch_name ASC");
	if ($parent == 0 && $db->num_rows() <= 0) {
		echo " <b>[<a href=\"";
		echo $sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "add", "bran_id" => 0))."\">".$t->translate("Add Root")."</a>]</b>";
	}
	while($db->next_record()) {
		echo "<br>";
		for ($i=1; $i<=$depth; $i++) {
			echo "<img src=\"images/dirnext.png\" alt=\".\" align=\"absbottom\">&nbsp;";
		}
		$isleave = 0;
		$db_leave = new DB_SourceLines;
		$query = "SELECT branch_id FROM tblbranch WHERE branch_parent='".$db->f("branch_id")."'";
		debug($query);
		$db_leave->query($query);
		debug($db_leave->num_rows());
		if ($db_leave->num_rows() <= 0)
			$isleave = 1;
		if (strstr($leaves, ":".$db->f("branch_id").":")) {
			if ($isleave) {
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			} else {
				echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "delid" => $db->f("branch_id")))."\">";
				echo "<img src=\"images/dirclose.png\" alt=\"[-]\" align=\"absbottom\" border=\"0\"></a>";
			}
			echo "&nbsp;".$db->f("branch_name");
			echo " (".$db->f("branch_id").")";
			echo " <b>[<a href=\"";
			echo $sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "add", "bran_id" => $db->f("branch_id")))."\">".$t->translate("Add")."</a>";
			echo " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "change", "bran_id" => $db->f("branch_id"), "name" => $db->f("branch_name")))."\">".$t->translate("Change")."</a>";
			$db_par = new DB_SourceLines;
			$db_par->query("SELECT * FROM tblbranch WHERE branch_parent='".$db->f("branch_id")."'");
			if ($db_par->num_rows() <= 0)
				echo " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "delete", "bran_id" => $db->f("branch_id"), "name" => $db->f("branch_name")))."\">".$t->translate("Delete")."</a>";
			echo "]</b>\n";
			$ndepth = $depth + 1;
			adm_branch_tree($db->f("branch_id"),$ndepth);
		} else {
			if ($isleave) {
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			} else {
				echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "addid" => $db->f("branch_id")))."\">";
				echo "<img src=\"images/diropen.png\" alt=\"[+]\" align=\"absbottom\" border=\"0\"></a>";
			}
			echo "&nbsp;".$db->f("branch_name");
			echo " (".$db->f("branch_id").")";
			echo " <b>[<a href=\"";
			echo $sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "add", "bran_id" => $db->f("branch_id")))."\">".$t->translate("Add")."</a>";
			echo " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "change", "bran_id" => $db->f("branch_id"), "name" => $db->f("branch_name")))."\">".$t->translate("Change")."</a>";
			$db_par = new DB_SourceLines;
			$db_par->query("SELECT * FROM tblbranch WHERE branch_parent='".$db->f("branch_id")."'");
			if ($db_par->num_rows() <= 0)
				echo " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "delete", "bran_id" => $db->f("branch_id"), "name" => $db->f("branch_name")))."\">".$t->translate("Delete")."</a>";
			echo "]</b>\n";
		}
	}
}

## branch_leaves($bran_id)
##
## get all leaves of branch tree to open

function branch_leaves($bran_id) {
	global $sess;

	$db = new DB_SourceLines;
	$leaves = "";
	do {
	   	$query = "SELECT * FROM tblbranch WHERE branch_id='$bran_id'";
	   	$db->query($query);
		while ($db->next_record()) {
			$leaves .= ":".$db->f("branch_id").":";
			$branch_id = $db->f("branch_parent");
	   		$query = "SELECT * FROM tblbranch WHERE branch_id='$branch_id'";
	   		$db->query($query);
		}
	} while ($branch_id > 0);
	return ($leaves);
}

## select_category($parent,$depth)
##
## select by categories

function select_category($parent,$depth) {
	global $solu_id,$t,$leaves,$sess,$PHP_SELF;

	$db = new DB_SourceLines;
	$db->query("SELECT * FROM tblcategory WHERE category_parent='$parent' ORDER BY category_name ASC");
	while($db->next_record()) {
		echo "<br>";
		for ($i=1; $i<=$depth; $i++) {
			echo "<img src=\"images/dirnext.png\" alt=\".\" align=\"absbottom\">&nbsp;";
		}
		$isleave = 0;
		$db_leave = new DB_SourceLines;
		$query = "SELECT category_id FROM tblcategory WHERE category_parent='".$db->f("category_id")."'";
		debug($query);
		$db_leave->query($query);
		debug($db_leave->num_rows());
		if ($db_leave->num_rows() <= 0) {
			$isleave = 1;
			$db_sol = new DB_SourceLines;
			$db_sol->query("SELECT COUNT(*) FROM tblsolutions WHERE category_id='".$db->f("category_id")."' AND solutions_name != 'no_name'");
			$db_sol->next_record();
			$sol_cnt = $db_sol->f("COUNT(*)");
		}
		if (strstr($leaves, ":".$db->f("category_id").":")) {
			echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("solu_id" => $solu_id, "leaves" => $leaves, "delid" => $db->f("category_id")))."\">";
			if ($isleave)
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			else
				echo "<img src=\"images/dirclose.png\" alt=\"[-]\" align=\"absbottom\" border=\"0\">";
			echo "</a>&nbsp;";
			if ($isleave)
				echo "<a href=\"".$sess->url("bycategory.php").$sess->add_query(array("cate_id" => $db->f("category_id")))."\">";
			echo $t->translate($db->f("category_name"));
			if ($isleave)
				echo "</a> [$sol_cnt]\n";
			$ndepth = $depth + 1;
			select_category($db->f("category_id"),$ndepth);
		} else {
			echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("solu_id" => $solu_id, "leaves" => $leaves, "addid" => $db->f("category_id")))."\">";
			if ($isleave)
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			else
				echo "<img src=\"images/diropen.png\" alt=\"[+]\" align=\"absbottom\" border=\"0\">";
			echo "</a>&nbsp;";
			if ($isleave)
				echo "<a href=\"".$sess->url("bycategory.php").$sess->add_query(array("cate_id" => $db->f("category_id")))."\">";
			echo $t->translate($db->f("category_name"));
			if ($isleave)
				echo "</a> [$sol_cnt]\n";
		}
	}
}

## category_tree($parent,$depth,$select)
##
## shows tree of categories

function category_tree($parent,$depth,$select) {
	global $solu_id,$leaves,$sess,$PHP_SELF;

	$db = new DB_SourceLines;
	$db->query("SELECT * FROM tblcategory WHERE category_parent='$parent' ORDER BY category_name ASC");
	while($db->next_record()) {
		echo "<br>";
		for ($i=1; $i<=$depth; $i++) {
			echo "<img src=\"images/dirnext.png\" alt=\".\" align=\"absbottom\">&nbsp;";
		}
		$isleave = 0;
		$db_leave = new DB_SourceLines;
		$db_leave->query("SELECT category_id FROM tblcategory WHERE category_parent='".$db->f("category_id")."'");
		if ($db_leave->num_rows() <= 0) $isleave = 1;
		if (strstr($leaves, ":".$db->f("category_id").":")) {
			echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("solu_id" => $solu_id, "leaves" => $leaves, "delid" => $db->f("category_id")))."\">";
			if ($isleave)
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			else
				echo "<img src=\"images/dirclose.png\" alt=\"[-]\" align=\"absbottom\" border=\"0\">";
			echo "</a>&nbsp;";
			if ($select == $db->f("category_id")) echo "<b>";
			if ($isleave) echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("solu_id" => $solu_id, "leaves" => $leaves, "action" => "db_set", "cate_id" => $db->f("category_id")))."\">";
			echo $db->f("category_name");
			if ($isleave) echo "</a>";
			debug (" (".$db->f("category_id").")\n");
			if ($select == $db->f("category_id")) echo "</b>\n";
			$ndepth = $depth + 1;
			category_tree($db->f("category_id"),$ndepth,$select);
		} else {
			echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("solu_id" => $solu_id, "leaves" => $leaves, "addid" => $db->f("category_id")))."\">";
			if ($isleave)
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			else
				echo "<img src=\"images/diropen.png\" alt=\"[+]\" align=\"absbottom\" border=\"0\">";
			echo "</a>&nbsp;";
			if ($select == $db->f("category_id")) echo "<b>";
			if ($isleave) echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("solu_id" => $solu_id, "leaves" => $leaves, "action" => "db_set", "cate_id" => $db->f("category_id")))."\">";
			echo $db->f("category_name");
			if ($isleave) echo "</a>";
			debug (" (".$db->f("category_id").")\n");
			if ($select == $db->f("category_id")) echo "</b>\n";
		}
	}
}

## adm_category_tree($parent,$depth)
##
## administrate tree of categories

function adm_category_tree($parent,$depth) {
	global $solu_id,$t,$leaves,$sess,$PHP_SELF;

	$db = new DB_SourceLines;
	$db->query("SELECT * FROM tblcategory WHERE category_parent='$parent' ORDER BY category_name ASC");
	if ($parent == 0 && $db->num_rows() <= 0) {
		echo " <b>[<a href=\"";
		echo $sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "add", "cate_id" => 0))."\">Add Root</a>]</b>";
	}
	while($db->next_record()) {
		echo "<br>";
		for ($i=1; $i<=$depth; $i++) {
			echo "<img src=\"images/dirnext.png\" alt=\".\" align=\"absbottom\">&nbsp;";
		}
		$isleave = 0;
		$db_leave = new DB_SourceLines;
		$query = "SELECT category_id FROM tblcategory WHERE category_parent='".$db->f("category_id")."'";
		debug($query);
		$db_leave->query($query);
		debug($db_leave->num_rows());
		if ($db_leave->num_rows() <= 0)
			$isleave = 1;
		if (strstr($leaves, ":".$db->f("category_id").":")) {
			if ($isleave) {
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			} else {
				echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "delid" => $db->f("category_id")))."\">";
				echo "<img src=\"images/dirclose.png\" alt=\"[-]\" align=\"absbottom\" border=\"0\"></a>";
			}
			echo "&nbsp;".$db->f("category_name");
			debug(" (".$db->f("category_id").")");
			echo " <b>[<a href=\"";
			echo $sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "add", "cate_id" => $db->f("category_id")))."\">".$t->translate("Add")."</a>";
			echo " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "change", "cate_id" => $db->f("category_id"), "name" => $db->f("category_name")))."\">".$t->translate("Change")."</a>";
			$db_par = new DB_SourceLines;
			$db_par->query("SELECT * FROM tblcategory WHERE category_parent='".$db->f("category_id")."'");
			if ($db_par->num_rows() <= 0)
				echo " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "delete", "cate_id" => $db->f("category_id"), "name" => $db->f("category_name")))."\">".$t->translate("Delete")."</a>";
			echo "]</b>\n";
			$ndepth = $depth + 1;
			adm_category_tree($db->f("category_id"),$ndepth);
		} else {
			if ($isleave) {
				echo "<img src=\"images/dirleave.png\" alt=\"...\" align=\"absbottom\" border=\"0\">";
			} else {
				echo "<a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "addid" => $db->f("category_id")))."\">";
				echo "<img src=\"images/diropen.png\" alt=\"[+]\" align=\"absbottom\" border=\"0\"></a>";
			}
			echo "&nbsp;".$db->f("category_name");
			debug(" (".$db->f("category_id").")");
			echo " <b>[<a href=\"";
			echo $sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "add", "cate_id" => $db->f("category_id")))."\">".$t->translate("Add")."</a>";
			echo " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "change", "cate_id" => $db->f("category_id"), "name" => $db->f("category_name")))."\">".$t->translate("Change")."</a>";
			$db_par = new DB_SourceLines;
			$db_par->query("SELECT * FROM tblcategory WHERE category_parent='".$db->f("category_id")."'");
			if ($db_par->num_rows() <= 0)
				echo " | <a href=\"".$sess->url(basename($PHP_SELF)).$sess->add_query(array("leaves" => $leaves, "action" => "delete", "cate_id" => $db->f("category_id"), "name" => $db->f("category_name")))."\">".$t->translate("Delete")."</a>";
			echo "]</b>\n";
		}
	}
}

## category_leaves($cate_id)
##
## get all leaves of category tree to open

function category_leaves($cate_id) {
	global $sess;

	$db = new DB_SourceLines;
	$leaves = "";
	do {
	   	$query = "SELECT * FROM tblcategory WHERE category_id='$cate_id'";
	   	$db->query($query);
		while ($db->next_record()) {
			$leaves .= ":".$db->f("category_id").":";
			$category_id = $db->f("category_parent");
	   		$query = "SELECT * FROM tblcategory WHERE category_id='$category_id'";
	   		$db->query($query);
		}
	} while ($category_id > 0);
	return ($leaves);
}

## solrecent()
##
## get all leaves of category tree to open

function solrecent() {
	global $db, $t, $sess, $bx;

	$bx->box_begin();
	$bx->box_title($t->translate("Recent Solutions"));
	$bx->box_body_begin();
	$query = "SELECT * FROM tblsolutions WHERE tblsolutions.solutions_name != 'no_name' ORDER BY solutions_modify_date DESC, solutions_id DESC";
	$db->query($query);
	$i = 1;
	while ($db->next_record() && $i <= 20) {
		$timestamp = mktimestamp($db->f("solutions_modify_date"));
		$datetime = timestr_short($timestamp);
		echo "<li><a href=\"".$sess->url("solutions.php").$sess->add_query(array("solu_id" => $db->f("solutions_id")))."\">".$db->f("solutions_name")."</a> (".$datetime.")\n";
		$i++;
	}
	$bx->box_body_end();
	$bx->box_end();
}

function wrap($string,$width=75,$break=" ") {
	$out = "";
	$lin = "";
	$tok = strtok($string,$break);
	while ($tok) {
		if ((strlen($lin) + strlen($tok)) > $width) {
			$out .= $lin."\n";
			$lin = "";
		}
		if (strlen($lin) > 0)
			$lin .= " ";
		$lin .= $tok;
		$tok = strtok (" ");
	}
	$out .= $lin;
	return $out;
}

function typestr($type) {
	global $t;
	if ($type == "S")
		$str = $t->translate("Stable");
	if ($type == "D")
		$str = $t->translate("Development");
	return $str;
}

function increasecnt($id, $type) {
  global $db;

  $db_local = new DB_SourceLines;
  $db_local->query("SELECT * FROM counter WHERE appid='$id'");

           // If application in table and first access today update counters
  $first = checkcnt($id, $GLOBALS[REMOTE_ADDR], $type);

  $db_local->next_record();
  if ($first == 1) {
    $counter = $db_local->f($type) + 1;
    $db->query("UPDATE counter SET $type='$counter' WHERE appid='$id'");
  }
}

function checkcnt($id, $ipaddr, $type) {
  global $db;

  $ret = 1;

			// Delete all entries from yesterday
  $today = date("Y-m-d");
  $tables = "counter_check";
  $where = "DATE_FORMAT(creation_cnt,'%Y-%m-%d') != '$today'";
  $db->query("DELETE FROM $tables WHERE $where");

  $columns = "*";
  $where = "appid='$id' AND cnt_type='$type' AND ipaddr='$ipaddr'";
  $db->query("SELECT $columns FROM $tables WHERE $where");

  if ($db->num_rows() > 0) {
			// If remote host already accessed the apps link,
			// don´t increase corresponding counter
    $ret = 0;
  } else {
  			  // Include entry for remote host
    $set = "appid='$id',cnt_type='$type',ipaddr='$ipaddr'";
    $db->query("INSERT $tables SET $set");
  }
  return $ret;
}

function nlmsg($period) {
  global $db;

  switch ($period) {
    case "weekly":
      $lastday = time() - 7 * 24 * 60 * 60;
      $where = "tblsolutions.solutions_modify_date <= \"".date("Y-m-d H:i:s")."\" AND tblsolutions.solutions_modify_date > \"".date("Y-m-d H:i:s",$lastday)."\"";
      break;
    case "daily":
    default:
      $where = "tblsolutions.solutions_modify_date <= \"".date("Y-m-d H:i:s")."\" AND tblsolutions.solutions_modify_date > \"".date("Y-m-d")." 00:00:00\"";
      break;
  }

  $db->query("SELECT * FROM tblsolutions WHERE solutions_name != 'no_name' AND $where ORDER BY tblsolutions.solutions_modify_date DESC");

#echo "SELECT * FROM tblsolutions WHERE $where ORDER BY tblsolutions.solutions_modify_date DESC\n";

  if ($db->num_rows() <= 0) return 0;

  $msg = $GLOBALS["sys_name"]." $period newsletter for ".date("l, dS of F Y, H:i:s T")."\n";
  $msg .= "Number of Solutions: ".$db->num_rows()."\n";
  $msg .= "\n                   -----------------------------\n";
  $msg .= "                       Solution Headlines\n";
  $msg .= "                   -----------------------------\n\n";
	
  $i = 1;
  while($db->next_record()) {
    $msg .= "$i: ".$db->f("solutions_name")." ".$db->f("solutions_version")."\n";
    $i++;
  }

  $msg .= "\n                   -----------------------------\n";
  $msg .= "                       Solution Details\n";
  $msg .= "                   -----------------------------\n";

//  @mysql_data_seek($result, 0);
  $db->seek(0);

  $i = 1;
  while ($db->next_record()) {
    $timestamp = mktimestamp($db->f("solutions_modify_date"));
    $msg .= "\nSolution          : $i\n";
    $msg .= "Name              : ".$db->f("solutions_name")."\n";
    $msg .= "by                : ".$db->f("username")."\n";
    $msg .= "Last modified     : ".date("l, dS of F Y, H:i:s T", $timestamp)."\n";
    $msg .= "Version           : ".$db->f("solutions_version")."\n";
    if ($period == "daily") {
      $msg .= "Summary           : ".substr($db->f("solutions_summary"), 0, 200)."...\n";
      $msg .= "Homepage          : ".$db->f("solutions_url")."\n";
      $msg .= "Contact name      : ".$db->f("solutions_contact_name")."\n";
      $msg .= "Contact email     : ".$db->f("solutions_contact_email")."\n";
      $msg .= "Contact Homepage  : ".$db->f("solutions_contact_url")."\n";
      $msg .= "Supplier name     : ".$db->f("solutions_supplier_name")."\n";
      $msg .= "Supplier email    : ".$db->f("solutions_supplier_email")."\n";
      $msg .= "Supplier Homepage : ".$db->f("solutions_supplier_url")."\n";
      $msg .= "\n";
    }
    $msg .= $GLOBALS["sys_name"]."       : ".$GLOBALS["sys_url"]."solutions.php?solu_id=".$db->f("solutions_id")."\n";
    $msg .= "\n                   -----------------------------\n";
    $i++;
  }
  $msg .= "\nYou get this ".$GLOBALS["sys_name"]." $period newsletter,"
  ."\nbecause you have subscribed to the mailing list ";

  switch ($period) {
    case "weekly":
      $msg .= "\n".$GLOBALS["ml_weeklynewstoaddr"]."."
      ."\nTo unsubscribe from this mailing list,"
      ."\nsend a message by email to"
      ."\n".$GLOBALS["ml_weeklynewsreqaddr"]
      ."\nwith \"unsubscribe <password>\" as subject or visit"
      ."\n".$GLOBALS["ml_weeklylisturl"];
      break;
    case "daily":
    default:
      $msg .= "\n".$GLOBALS["ml_newstoaddr"]."."
      ."\nTo unsubscribe from this mailing list,"
      ."\nsend a message by email to"
      ."\n".$GLOBALS["ml_newsreqaddr"]
      ."\nwith \"unsubscribe <password>\" as subject or visit"
      ."\n".$GLOBALS["ml_listurl"];
      break;
  }
  $msg .= "\nand follow the instructions there."
  ."\n\n - ".$GLOBALS["sys_name"]." crew";

  return $msg;
}

function mailuser($perms, $subj, $message) {
  global $t, $db;
  $db->query("SELECT email_usr FROM auth_user WHERE perms LIKE '%$perms%'");
  while($db->next_record()) {
    mail($db->f("email_usr"),"[".$GLOBALS["sys_name"]."] ".$subj,$message,"From: ".$GLOBALS["ml_fromaddr"]."\nReply-To: ".$GLOBALS["ml_replyaddr"]."\nX-Mailer: PHP");
  }
}

function debug($string) {
	if ($GLOBALS["sys_debug"]) {
		echo "<p>$string\n";
	}
}

function debugparam() {
	if ($GLOBALS["sys_debug"]) {
	echo "<p>GATEWAY_INTERFACE: ".$GLOBALS["GATEWAY_INTERFACE"]."\n";
	echo "<br>SERVER_NAME: ".$GLOBALS["SERVER_NAME"]."\n";
	echo "<br>SERVER_SOFTWARE: ".$GLOBALS["SERVER_SOFTWARE"]."\n";
	echo "<br>SERVER_PROTOCOL: ".$GLOBALS["SERVER_PROTOCOL"]."\n";
	echo "<br>REQUEST_METHOD: ".$GLOBALS["REQUEST_METHOD"]."\n";
	echo "<br>QUERY_STRING: ".$GLOBALS["QUERY_STRING"]."\n";
	echo "<br>DOCUMENT_ROOT: ".$GLOBALS["DOCUMENT_ROOT"]."\n";
	echo "<br>HTTP_ACCEPT: ".$GLOBALS["HTTP_ACCEPT"]."\n";
	echo "<br>HTTP_ACCEPT_CHARSET: ".$GLOBALS["HTTP_ACCEPT_CHARSET"]."\n";
	echo "<br>HTTP_ACCEPT_ENCODING: ".$GLOBALS["HTTP_ACCEPT_ENCODING"]."\n";
	echo "<br>HTTP_ACCEPT_LANGUAGE: ".$GLOBALS["HTTP_ACCEPT_LANGUAGE"]."\n";
	echo "<br>HTTP_CONNECTION: ".$GLOBALS["HTTP_CONNECTION"]."\n";
	echo "<br>HTTP_HOST: ".$GLOBALS["HTTP_HOST"]."\n";
	echo "<br>HTTP_REFERER: ".$GLOBALS["HTTP_REFERER"]."\n";
	echo "<br>HTTP_USER_AGENT: ".$GLOBALS["HTTP_USER_AGENT"]."\n";
	echo "<br>REMOTE_ADDR: ".$GLOBALS["REMOTE_ADDR"]."\n";
	echo "<br>REMOTE_PORT: ".$GLOBALS["REMOTE_PORT"]."\n";
	echo "<br>SCRIPT_FILENAME: ".$GLOBALS["SCRIPT_FILENAME"]."\n";
	echo "<br>SERVER_ADMIN: ".$GLOBALS["SERVER_ADMIN"]."\n";
	echo "<br>SERVER_PORT: ".$GLOBALS["SERVER_PORT"]."\n";
	echo "<br>SERVER_SIGNATURE: ".$GLOBALS["SERVER_SIGNATURE"]."\n";
	echo "<br>PATH_TRANSLATED: ".$GLOBALS["PATH_TRANSLATED"]."\n";
	echo "<br>SCRIPT_NAME: ".$GLOBALS["SCRIPT_NAME"]."\n";
	echo "<br>REQUEST_URI: ".$GLOBALS["REQUEST_URI"]."\n";

	echo "<br>HTTP_POST_VARS:\n";
	while (is_array($GLOBALS["HTTP_POST_VARS"]) && list($key, $val) = each($GLOBALS["HTTP_POST_VARS"])) {
		echo "<br>$key: $val\n";
	}

	echo "<br>HTTP_GET_VARS:\n";
	while (is_array($GLOBALS["HTTP_GET_VARS"]) && list($key, $val) = each($GLOBALS["HTTP_GET_VARS"])) {
		echo "<br>$key: $val\n";
	}
	echo "<br>\n";
	}
}
?>
