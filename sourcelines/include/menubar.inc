<!-- BerliOS menu -->
<table BORDER=0 CELLSPACING=0 CELLPADDING=3 WIDTH="100%">
<tr BGCOLOR="<?php echo $th_navstrip_bgcolor;?>">
<td ALIGN=CENTER>
<span class="titlebar"><font color="<?php echo $th_navstrip_font_color;?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $sys_name?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></span></td>
</tr>

<tr ALIGN=RIGHT BGCOLOR="<?php echo $th_nav_bgcolor;?>">
<td><a href="<?php $sess->purl("index.php") ?>" class="menus"><?php echo $t->translate("Home"); ?></a>
<br><a href="<?php $sess->purl("faq.php") ?>" class="menus"><?php echo $t->translate("Q&amp;A"); ?></a>

<br><br>

<?php
if (isset($auth) && !empty($auth->auth["perm"]) && !($logout) ) {
  if ($perm->have_perm("user") || $perm->have_perm("user_pending") || $perm->have_perm("editor") || $perm->have_perm("admin") || $perm->have_perm("anonymous")) {
?>
<a href="<?php $sess->purl("logout.php") ?>" class="menus"><?php echo $t->translate("Logout"); ?></a>
<?php
  }
} else {
?>
<a href="<?php $sess->purl("login.php") ?>" class="menus"><?php echo $t->translate("Login"); ?></a>
<?php
}
?>
<br><a href="<?php $sess->purl("register.php") ?>" class="menus"><?php echo $t->translate("New User"); ?></a>
<br><a href="<?php $sess->purl("remind.php") ?>" class="menus"><?php echo $t->translate("Forgot Password"); ?></a>
<?php
if (isset($auth) && !empty($auth->auth["perm"]) && !($logout)) {
	if (($perm->have_perm("user") || $perm->have_perm("user_pending") || $perm->have_perm("editor") || $perm->have_perm("admin")) && !($perm->have_perm("anonymous"))) {
?>
<br><a href="<?php $sess->purl("chguser.php") ?>" class="menus"><?php echo $t->translate("Change User"); ?></a>
<?php
	}
}

if (($config_perm_users == "all") || (isset($perm) && $perm->have_perm($config_perm_users))  && !($logout)) {
?>
<br><a href="<?php $sess->purl("users.php") ?>" class="menus"><?php echo $t->translate("Users"); ?></a>
<?php
}
?>
</td>
</tr>
</table>
<table BORDER=0 CELLSPACING=0 CELLPADDING=3 WIDTH="100%">
<tr BGCOLOR="<?php echo $th_navstrip_bgcolor;?>">
<td ALIGN=CENTER>
<span class="titlebar"><font color="<?php echo $th_navstrip_font_color;?>"><?php echo $t->translate("Solutions"); ?></font></span></td>
</tr>

<tr ALIGN=RIGHT BGCOLOR="<?php echo $th_nav_bgcolor;?>">
<td>
<a href="<?php $sess->purl("index.php") ?>" class="menus"><?php echo $t->translate("Recent Solutions"); ?></a>
<br><a href="<?php $sess->purl("solbybranch.php") ?>" class="menus"><?php echo $t->translate("by Branch"); ?></a>
<br><a href="<?php $sess->purl("solbycategory.php") ?>" class="menus"><?php echo $t->translate("by Category"); ?></a>
<br><a href="<?php $sess->purl("solbykeyword.php") ?>" class="menus"><?php echo $t->translate("by Keyword"); ?></a>
<br><a href="<?php $sess->purl("solbycontact.php") ?>" class="menus"><?php echo $t->translate("by Contact"); ?></a>
<?php

echo "<br><a href=\"".$sess->url("newsolutions.php")."\" class=\"menus\">".$t->translate("New Solution")."</a>\n";
echo "<br><a href=\"".$sess->url("yoursolutions.php")."\" class=\"menus\">".$t->translate("Your Solutions")."</a>\n";

?>
<br>
<?php
if ($ml_list) {
  echo "<br><a href=\"".$sess->url("newsletter.php")."\" class=\"menus\">".$t->translate("Newsletter")."</a>\n";
}
?>
<br><a href="<?php $sess->purl("backend.php"); ?>" class="menus"><?php echo $t->translate("Backend"); ?></a>
<?php
/*
// The credits have been moved to the footer
<br><a href="/html" class="menus"><?php echo $t->translate("About"); ?></a>
*/
?>
</td>
</tr>
</table>
<!-- end BerliOS menu -->
<!-- Admin menu -->
<?php

if (
    (($config_perm_admuser == "all") ||
       ($config_perm_admlicens == "all") ||
       ($config_perm_admcomment == "all") ||
       ($config_perm_admsec == "all") ||
       ($config_perm_admcat == "all") ||
       ($config_perm_nladm == "all") ||
       ($config_perm_admfaq == "all") ||
       ($config_perm_configure == "all"))
  || (isset($perm) &&
       (($perm->have_perm($config_perm_admuser)) ||
        ($perm->have_perm($config_perm_admlicens)) ||
        ($perm->have_perm($config_perm_admcomment)) ||
        ($perm->have_perm($config_perm_admsec)) ||
        ($perm->have_perm($config_perm_admcat)) ||
        ($perm->have_perm($config_perm_nladm)) ||
        ($perm->have_perm($config_perm_admfaq)) ||
        ($perm->have_perm($config_perm_configure) ) ))
  && !($logout)) {

?>
<table BORDER=0 CELLSPACING=0 CELLPADDING=3 WIDTH="100%">
<tr BGCOLOR="<?php echo $th_navstrip_bgcolor;?>">
<td ALIGN=CENTER>
<span class="titlebar"><font color="<?php echo $th_navstrip_font_color;?>"><?php echo $t->translate("Administration"); ?></font></span></td>
</tr>

<tr ALIGN=RIGHT BGCOLOR="<?php echo $th_nav_bgcolor;?>">
<td>
<?php

  if (($config_perm_admuser == "all") || (isset($perm) && $perm->have_perm($config_perm_admuser))  && !($logout)) {
    $db->query("SELECT COUNT(*) FROM auth_user");
    $db->next_record();
    echo "<a href=\"".$sess->url("admuser.php")."\" class=\"menus\">".$t->translate("Users")." [".$db->f("COUNT(*)")."]</a>\n";
  }

  if (($config_perm_admbranch == "all") || (isset($perm) && $perm->have_perm($config_perm_admbranch))  && !($logout)) {
    $db->query("SELECT COUNT(*) FROM tblbranch");
    $db->next_record();
    echo "<br><a href=\"".$sess->url("admbranch.php")."\" class=\"menus\">".$t->translate("Branches")." [".$db->f("COUNT(*)")."]</a>\n";
  }

  if (($config_perm_admcat == "all") || (isset($perm) && $perm->have_perm($config_perm_admcat))  && !($logout)) {
    $db->query("SELECT COUNT(*) FROM tblcategory");
    $db->next_record();
    echo "<br><a href=\"".$sess->url("admcategory.php")."\" class=\"menus\">".$t->translate("Categories")." [".$db->f("COUNT(*)")."]</a>\n";
  }

  if (($config_perm_admtype == "all") || (isset($perm) && $perm->have_perm($config_perm_admtype))  && !($logout)) {
    $db->query("SELECT COUNT(*) FROM tblcomponenttype");
    $db->next_record();
    echo "<br><a href=\"".$sess->url("admcomptype.php")."\" class=\"menus\">".$t->translate("Types of Components")." [".$db->f("COUNT(*)")."]</a>\n";
  }

  if (($config_perm_admlicens == "all") || (isset($perm) && $perm->have_perm($config_perm_admlicens))  && !($logout)) {
    $db->query("SELECT COUNT(*) FROM tbllicense");
    $db->next_record();
    echo "<br><a href=\"".$sess->url("admlicense.php")."\" class=\"menus\">".$t->translate("Licenses")." [".$db->f("COUNT(*)")."]</a>\n";
  }

  if (($config_perm_admlang == "all") || (isset($perm) && $perm->have_perm($config_perm_admlang))  && !($logout)) {
    $db->query("SELECT COUNT(*) FROM tbllanguage");
    $db->next_record();
    echo "<br><a href=\"".$sess->url("admlanguage.php")."\" class=\"menus\">".$t->translate("Languages")." [".$db->f("COUNT(*)")."]</a>\n";
  }

#  if (($config_perm_admcomment == "all") || (isset($perm) && $perm->have_perm($config_perm_admcomment))  && !($logout)) {
#    $db->query("SELECT COUNT(*) FROM comments");
#    $db->next_record();
#    echo "<br><a href=\"".$sess->url("admcomment.php")."\" class=\"menus\">".$t->translate("Comments")." [".$db->f("COUNT(*)")."]</a>\n";
#  }

  if (($config_perm_admfaq == "all") || (isset($perm) && $perm->have_perm($config_perm_admfaq))  && !($logout)) {
    $db->query("SELECT COUNT(*) FROM faq WHERE language='$la'");
    $db->next_record();
    echo "<br><a href=\"".$sess->url("admfaq.php")."\" class=\"menus\">".$t->translate("Q&amp;A")." [".$db->f("COUNT(*)")."]</a>\n";
  }

  if (($config_perm_nladm == "all") || (isset($perm) && $perm->have_perm($config_perm_nladm))  && !($logout) && ($ml_list)) {
				// Daily Newsletter
    $where = "DATE_FORMAT(tblsolutions.solutions_modify_date,'%Y-%m-%d')=\"".date("Y-m-d")."\"";
    $db->query("SELECT COUNT(*) FROM tblsolutions WHERE $where"); 
    $db->next_record();
    echo "<br><a href=\"".$sess->url("nladm.php?period=daily")."\" class=\"menus\">".$t->translate("Daily Newsletter")." [".$db->f("COUNT(*)")."]</a>\n";
				// Weekly Newsletter
    $lastday = time() - 7 * 24 * 60 * 60;
    $where = "DATE_FORMAT(tblsolutions.solutions_modify_date,'%Y-%m-%d')<=\"".date("Y-m-d")."\" AND DATE_FORMAT(tblsolutions.solutions_modify_date,'%Y-%m-%d')>\"".date("Y-m-d",$lastday)."\"";
    $db->query("SELECT COUNT(*) FROM tblsolutions WHERE $where"); 
    $db->next_record();
    echo "<br><a href=\"".$sess->url("nladm.php?period=weekly")."\" class=\"menus\">".$t->translate("Weekly Newsletter")." [".$db->f("COUNT(*)")."]</a>\n";
  }
?>
</td>
</tr>
</table>
<?php
}
?>
<!-- end Admin menu -->
<!-- Search menu -->
<table BORDER=0 CELLSPACING=0 CELLPADDING=3 WIDTH="100%">
<tr BGCOLOR="<?php echo $th_navstrip_bgcolor;?>">
<td ALIGN=CENTER>
<span class="titlebar"><font color="<?php echo $th_navstrip_font_color;?>"><?php echo $t->translate("Search"); ?></font></span></td>
</tr>

<tr ALIGN=RIGHT BGCOLOR="<?php echo $th_nav_bgcolor;?>">
<td align=center>
<p>
<form action="<?php $sess->purl("solsearch.php"); ?>">
<input TYPE="text" SIZE="10" NAME="search" VALUE="">
<?php
echo "<p><input TYPE=\"submit\" NAME=\"Search\" VALUE=\"".$t->translate("Search")."\">";
?>
</form>
</td>
</tr>
</table>
<!-- end Search menu -->
<!-- Language menu -->
<table BORDER=0 CELLSPACING=0 CELLPADDING=3 WIDTH="100%">
<tr BGCOLOR="<?php echo $th_navstrip_bgcolor;?>">
<td ALIGN=CENTER>
<span class="titlebar"><font color="<?php echo $th_navstrip_font_color;?>"><?php echo $t->translate("Language");?></font></span></td>
</tr>

<tr ALIGN=RIGHT BGCOLOR="<?php echo $th_nav_bgcolor;?>">
<td align=center>
<p>
<form action="<?php $sess->pself_url()?>">
<?php
while (is_array($HTTP_GET_VARS) 
		&& list($key, $val) = each($HTTP_GET_VARS)) {
	if ($key != "lang" && $key != "go") {
		echo "<input TYPE=\"hidden\" NAME=\"$key\" VALUE=\"$val\">\n";
	}
}
?>
<select name="lang" size=1>
<?php
while (list(, $ln) = each($la_array)) {
	if ($la == $ln) {
		$sel = "selected";
	} else {
		$sel ="";
	}
	echo "<option value=\"$ln\" $sel>".$t->translate($ln)."\n";
}
?>
</select>
<?php
echo "<p><input TYPE=\"submit\" NAME=\"go\" VALUE=\"".$t->translate("Go")."\">";
?>
</form>
</td>
</tr>
</table>
<?php
if (ereg("Gecko", "$HTTP_USER_AGENT")) {
	echo "<p align=center><a href=\"javascript:addNetscapePanel();\"><img SRC=\"images/add-button.gif\" BORDER=0 height=45 width=100></a>\n";
}
?>
<!-- end Language menu -->
