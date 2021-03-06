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
# Administration of (registered) users
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

$bx = new box("80%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_body_font_color,$th_box_body_align);
$be = new box("80%",$th_box_frame_color,$th_box_frame_width,$th_box_title_bgcolor,$th_box_title_font_color,$th_box_title_align,$th_box_body_bgcolor,$th_box_error_font_color,$th_box_body_align);
?>

<!-- content -->
<?php
if (($config_perm_admuser != "all") && (!isset($perm) || !$perm->have_perm($config_perm_admuser))) {
  $be->box_full($t->translate("Error"), $t->translate("Access denied"));
} else {

// Check if there was a submission
  while (is_array($HTTP_POST_VARS) && list($key, $val) = each($HTTP_POST_VARS)) {
    switch ($key) {
      case "create": // Create a new user
	if (empty($username) || empty($password) || empty($email_usr)) { // Do we have all necessary data?
	  $be->box_full($t->translate("Error"), $t->translate("Please enter")." <B>".$t->translate("Username")."</B>, <B>".$t->translate("Password")."</B> ".$t->translate("and")." <B>".$t->translate("E-Mail")."</B>!");
	  break;
	}
         /* Does the user already exist?
	    NOTE: This should be a transaction, but it isn't... */
	$db->query("select * from auth_user where username='$username'");
	if ($db->nf()>0) {
	  $be->box_full($t->translate("Error"), $t->translate("User")." <B>$username</B> ".$t->translate("already exists").".");
	  break;
	}

         /* Does an anonymous user already exist?
	    NOTE: This should also be a transaction, but it isn't... */
	$db->query("select * from auth_user where perms='anonymous'");
	if ($db->num_rows()>0 && ereg("anonymous",implode($perms,","))) {
	  $be->box_full($t->translate("Error"), $t->translate("There can only be one anonymous user in the system").".");
	  break;
	}

         /* Does the anonymous user have other permissions? */
        if (ereg("anonymous",implode($perms,",")) && (ereg("user_pending",implode($perms,",")) || ereg("user",implode($perms,",")) || ereg("editor",implode($perms,",")) || ereg("admin",implode($perms,",")) || ereg("user_pending",implode($perms,",")))) {
	  $be->box_full($t->translate("Error"), $t->translate("The anonymous permission is incompatible with another type of permission").".");
	  break;
	}
			// Create a uid and insert the user...
	$u_id=md5(uniqid($hash_secret));
	$permlist = addslashes(implode($perms,","));
	$modification_usr = "NOW()";
	$creation_usr = "NOW()";
	$query = "insert into auth_user values('$u_id','$username','$password','$realname','$email_usr',$modification_usr,$creation_usr,'$permlist')";
	$db->query($query);
	if ($db->affected_rows() == 0) {
	  $be->box_full($t->translate("Error"), "<b>".$t->translate("Database Access failed").":</b> $query");
	  break;
	}
	$bx->box_full($t->translate("User Creation"), $t->translate("User")." \"$username\" ".$t->translate("created").".<BR>");
	break;

      case "u_edit": // Change user parameters
	if (empty($username) || empty($password) || empty($email_usr)) { // Do we have all necessary data?
	  $be->box_full($t->translate("Error"), $t->translate("Please enter")." <B>".$t->translate("Username")."</B>, <B>".$t->translate("Password")."</B> ".$t->translate("and")." <B>".$t->translate("E-Mail")."</B>!");
	  break;
	}
			  // Handles all user contributions to the system
			  // so that we don't loose them when changing username
        if ($username != $old_username) {
	  $query = "update tblsolutions set username='$username' where username='$old_username'";
	  $db->query($query);
	  $query = "update tblcomment set comment_username='$username' where comment_username='$old_username'";
	  $db->query($query);
        }
			// Update user information.
	$permlist = addslashes(implode($perms,","));
	$query = "update auth_user set username='$username', password='$password', realname='$realname', email_usr='$email_usr', modification_usr=NOW(), perms='$permlist' where user_id='$u_id'";
	$db->query($query);
	if ($db->affected_rows() == 0) {
	  $be->box_full($t->translate("Error"), $t->translate("User Change failed").":<br>$query");
	  break;
	}
	$bx->box_full($t->translate("User Change"), $t->translate("User")." <b>$username</b> ".$t->translate("is changed").".<br>");
	break;

      case "u_kill":
			// we change the users contributions to anonymous
			// if the anonymous user exists in the system
        $db->query("SELECT username FROM auth_user WHERE perms='anonymous'");
        $db->next_record();
        $anonymous = $db->f("username");
        $query = "update tblsolutions set username='$anonymous' where username='$old_username'";
        $db->query($query);
        $query = "update tblcomment set comment_username ='$anonymous' where comment_username='$old_username'";
        $db->query($query);

			// Delete that user.
	$query = "delete from auth_user where user_id='$u_id' and username='$username'";
	$db->query($query);
	if ($db->affected_rows() == 0) {
	  $be->box_full($t->translate("Error"), $t->translate("User Deletion failed").":<br>$query");
	  break;
	}
	$bx->box_full($t->translate("User Deletion"), $t->translate("User")." <b>$username</b> ".$t->translate("has been deleted"));
	break;

      default:
	break;
    }
  }

/* Output user administration forms, including all updated
	information, if we come here after a submission...
*/

?>
<table border=0 cellspacing=0 cellpadding=0 bgcolor="<?php echo $th_box_frame_color;?>" align=center>

<tr>
<td>
<table width=100% border=0 align="center" cellspacing=1 cellpadding=3>
 <tr bgcolor="<?php echo $th_box_title_bgcolor;?>" valign=top align=left><td>
<B><?php echo $t->translate("User Administration");?></B></td></tr></table></td></tr>

<tr>
<td>
<table border=0 align="center" cellspacing=1 cellpadding=3>
 <tr bgcolor="<?php echo $th_box_title_bgcolor;?>" valign=top align=left>
<?php
  echo "  <th>".$t->translate("Username")."</th>";
  echo "  <th>".$t->translate("Password")."</th>";
  echo "  <th>".$t->translate("Realname")."</th>";
  echo "  <th>".$t->translate("E-Mail")."</th>";
  echo "  <th>".$t->translate("Last modified")."</th>";
  echo "  <th>".$t->translate("Created")."</th>";
  echo "  <th>".$t->translate("Permission")."</th>";
  echo "  <th>".$t->translate("Action")."</th>";
?>
</tr>
<!-- create a new user -->
<form method="post" action="<?php $sess->pself_url() ?>">
<tr bgcolor="<?php echo $th_box_body_bgcolor;?>" valign=middle align=left>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>"><input type="text" name="username" size=12 maxlength=32 value=""></td>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>"><input type="text" name="password" size=12 maxlength=32 value=""></td>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>"><input type="text" name="realname" size=12 maxlength=64 value=""></td>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>"><input type="text" name="email_usr" size=12 maxlength=128 value=""></td>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>">&nbsp;</td>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>">&nbsp;</td>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>"><?php print $perm->perm_sel("perms","user");?></td>
<?php
  echo "  <td bgcolor=\"$th_box_body_bgcolor\" align=\"right\"><input type=\"submit\" name=\"create\" value=\"".$t->translate("Create User")."\"></td>\n";
?>
</tr>
</form>
<?php
  ## Traverse the result set
  $db->query("select * from auth_user order by username");
  while ($db->next_record()) {
?>
<!-- existing user -->
<form method="post" action="<?php $sess->pself_url() ?>">
<tr bgcolor="<?php echo $th_box_body_bgcolor;?>" valign=middle align=left>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>"><input type="text" name="username" size=12 maxlength=32 value="<?php $db->p("username") ?>"></td>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>"><input type="text" name="password" size=12 maxlength=32 value="<?php $db->p("password") ?>"></td>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>"><input type="text" name="realname" size=12 maxlength=64 value="<?php $db->p("realname") ?>"></td>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>"><input type="text" name="email_usr" size=12 maxlength=32 value="<?php $db->p("email_usr") ?>"></td>
<?php
  $time = mktimestamp($db->f("modification_usr"));
  echo "  <td bgcolor=\"$th_box_body_bgcolor\">".timestr($time)."</td>\n";
  $time = mktimestamp($db->f("creation_usr"));
  echo "  <td bgcolor=\"$th_box_body_bgcolor\">".timestr($time)."</td>\n";
?>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>"><?php print $perm->perm_sel("perms", $db->f("perms")) ?></td>
<td bgcolor="<?php echo $th_box_body_bgcolor;?>" align=right>
<input type="hidden" name="u_id" value="<?php echo $db->p("user_id"); ?>">
<input type="hidden" name="old_username" value="<?php echo $db->p("username"); ?>">
<?php
  echo "   <input type=\"submit\" name=\"u_kill\" value=\"".$t->translate("Delete")."\">\n";
  echo "   <input type=\"submit\" name=\"u_edit\" value=\"".$t->translate("Change")."\">\n";
?>
</td>
</tr>
</form>
<?php
  }
?>
</table>
</td>
</tr>
</table>
<?php
}
?>

<!-- end content -->

<?php
require("footer.inc");
page_close();
?>
