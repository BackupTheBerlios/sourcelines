<?php

######################################################################
# SourceLines: Software Announcement & Retrieval System
# ================================================
#
# Copyright (c) 2001 by
#                Lutz Henckel (lutz.henckel@fokus.gmd.de) and
#                Gregorio Robles (grex@scouts-es.org)
#
# BerliOS SourceLines: http://sourcewell.berlios.de
# BerliOS - The OpenSource Mediator: http://www.berlios.de
#
# Statistics Library file.
# You'll find in SourceLines's documentation a good explanation of the
# functions that are coded in this file.
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
######################################################################


function stats($result,$var,$message,$position) {
    global $bx, $t;
    $max = 1; 		// max is a number which gives the top 1!!
    $length = 280; 	// length is the maximal lenght of the image

	$bx->box_begin();
	$bx->box_title($t->translate($message));
	$bx->box_body_begin();

    echo "<table border=0 width=100% cellspacing=0>\n";
        
    while($row = mysql_fetch_array($result)) {
       $position +=1;
       if ( ($row[$var] > $max) ) {
	       $max = $row[$var];
       } 

       echo "<tr><td width=5% align=right>&nbsp;".$position.".</td>\n";
       echo "<td width=35%>&nbsp;<a href=\"appbyid.php?id=".$row["appid"]."\">$row[name]</A> (".typestr($row["type"]).")</td>\n";
       echo "<td width=1%>&nbsp;</td>\n";
       echo "<td width=59%><img src=\"images/leftbar.gif\" height=14 width=7 Alt=\"$row[name]\"><img src=\"images/mainbar.gif\" Alt=\"$row[name]\" height=14 width=", $row[$var] * $length / $max, "><img src=\"images/rightbar.gif\" height=14 width=7 Alt=\"$row[name]\">&nbsp; $row[$var]</td></tr>\n";
       echo "</td></tr>\n";
    }
    echo "</table>\n";
	$bx->box_body_end();
	$bx->box_end();
}


## stats_title($message):
##
## Displays the header of the table with the title given by $message

function stats_title($message) {
    global $t;
    echo "<center>\n";
    echo "<table width=600 border=0 cellspacing=0 cellpadding=0 bgcolor=\"".$GLOBALS["th_box_frame_color"]."\" align=center>\n";
    echo "<tr><td>\n";
    echo "<table width=100% border=0 cellspacing=1 cellpadding=3>\n";
    echo "<tr bgcolor=\"".$GLOBALS["th_box_title_bgcolor"]."\">\n";
    echo "<td><b>";
    	echo $t->translate($message);
    		echo "</b></td>\n";
    echo "</tr><tr bgcolor=\"".$GLOBALS["th_box_body_bgcolor"]."\"><td>\n";
    echo "<table border=0 width=100% cellspacing=0>\n";
}

## stats_subtitle($message):
##
## Displays a subtitle

function stats_subtitle($message) {

    echo "<tr><td bgcolor=\"".$GLOBALS["th_box_title_bgcolor"]."\"><B>".$message."</B></td>\n";
    echo "<td bgcolor=\"".$GLOBALS["th_box_title_bgcolor"]."\">&nbsp;</td>";
    echo "<td bgcolor=\"".$GLOBALS["th_box_title_bgcolor"]."\">&nbsp;</td>";
    echo "<td bgcolor=\"".$GLOBALS["th_box_title_bgcolor"]."\">&nbsp;</td>";
    echo "<td bgcolor=\"".$GLOBALS["th_box_title_bgcolor"]."\">&nbsp;</td></tr>";
}


## stats_display($what,$count,$url):
##
## Displays the statistic graphically in one column
## $what is the string which gives the name
## $count gives the number of times it appears
## $url gives the corresponding url
## if $url = 0 then no url is displayed

function stats_display($what,$count,$url) {
    $max= 400;		// max is a number to ensure the maximum lenght of the graph
    $length = 575; 	// length is the maximal lenght of the image

    echo "<tr><td width=47%>&nbsp;<a href=\"".$url."\">".$what."</A>:</td>\n";
    echo "<td width=1%>&nbsp;</td>\n";
    echo "<td width=52%><img src=\"images/leftbar.gif\" height=14 width=7 Alt=\"${$type}[$i]\"><img src=\"images/mainbar.gif\" Alt=\"${$type}[$i]\" height=14 width=", $count * $length / $max, "><img src=\"images/rightbar.gif\" height=14 width=7 Alt=\"${$type}[$i]\">&nbsp; $count</td></tr>\n";
    echo "</FONT></td></tr>";
}

## stats_display_alt($what,$count,$url,$total):
##
## Displays the statistic graphically in one column
## $what is the string which gives the name
## $count gives the number of times it appears
## $url gives the corresponding url
## $total gives the total sum of all the studied items

function stats_display_alt($what,$count,$url,$total) {

  $epsilon = 0.0001;    // To avoid having division by zero
			// To avoid that by 100% the graph is too big
  if ($count/($total + $epsilon) >= 0.95) {
    $total_normalize = 1.1 * ($total+ $epsilon);
  } else {
    $total_normalize = $total+ $epsilon;
  }

  echo "<tr><td width=246>&nbsp;";
    if (strcmp($url,"0")) echo "<a href=\"".$url."\">";
       echo $what;
	 if (strcmp($url,"0")) echo "</A>:</td>\n";
  echo "<td width=6>&nbsp;</td>\n";
  echo "</td width=42><td>&nbsp; $count</td>\n";

  echo "<td><table width=264><TR><td><img src=\"images/leftbar.gif\" height=14 width=7 Alt=\"$what\"><img src=\"images/mainbar.gif\" Alt=\"$what\" height=14 width=", $count * 264 / $total_normalize, "><img src=\"images/rightbar.gif\" height=14 width=7 Alt=\"$what\"></td></tr></table>\n";

  echo "</td><td width=42>&nbsp;".(Ceil(($count*100 /($total+$epsilon))*10)/10)."%</td></tr>\n";
}

## stats_end():
##
## Finishes the table


function stats_end(){
    echo "</table>\n";
    echo "</TD></TR></TABLE>\n";
    echo "</TD></TR></TABLE></CENTER>\n";
    echo "<BR>\n";
}


######################################################################
# Domaines
#
# Please, do not touch this!
# It is used in the statistics
#
######################################################################

$domain_country[1][0] = "com";	$domain_country[1][1] = "Commercial (.com)";
$domain_country[2][0] = "org";	$domain_country[2][1] = "Organization (.org)";
$domain_country[3][0] = "net";	$domain_country[3][1] = "Network (.net)";
$domain_country[4][0] = "de";	$domain_country[4][1] = "Germany (.de)";
$domain_country[5][0] = "fr";	$domain_country[5][1] = "France (.fr)";
$domain_country[6][0] = "edu";	$domain_country[6][1] = "Educational (.edu)";
$domain_country[7][0] = "uk";	$domain_country[7][1] = "United Kingdom (.uk)";
$domain_country[8][0] = "it";	$domain_country[8][1] = "Italy (.it)";
$domain_country[9][0] = "se";	$domain_country[9][1] = "Sweden (.se)";
$domain_country[10][0] = "nl";	$domain_country[10][1] = "The Netherlands (.nl)";
$domain_country[11][0] = "be";	$domain_country[11][1] = "Belgium (.be)";
$domain_country[12][0] = "es";	$domain_country[12][1] = "Spain (.es)";
$domain_country[13][0] = "nu";	$domain_country[13][1] = "Niue (.nu)";
$domain_country[14][0] = "ca";	$domain_country[14][1] = "Canada (.ca)";
$domain_country[15][0] = "jp";	$domain_country[15][1] = "Japan (.jp)";
$domain_country[16][0] = "cz";	$domain_country[16][1] = "Czech Republik (.cz)";
$domain_country[17][0] = "ru";	$domain_country[17][1] = "Russian Federation (.ru)";
$domain_country[21][0] = "no";	$domain_country[21][1] = "Norway (.no)";
$domain_country[24][0] = "at";	$domain_country[24][1] = "Austria (at.)";

// In alfabetical order
$domain_country[25][0] = "ac";	$domain_country[25][1] = "Ascension Island (.ac)";
$domain_country[26][0] = "ad";	$domain_country[26][1] = "Andorra (.ad)";
$domain_country[27][0] = "ae";	$domain_country[27][1] = "United Arab Emirates (.ae)";
$domain_country[28][0] = "af";	$domain_country[28][1] = "Afghanistan (.af)";
$domain_country[29][0] = "ag";	$domain_country[29][1] = "Antigua and Barbuda (.ag)";
$domain_country[30][0] = "ai";	$domain_country[30][1] = "Anguilla (.ai)";
$domain_country[31][0] = "al";	$domain_country[31][1] = "Albania (.al)";
$domain_country[32][0] = "am";	$domain_country[32][1] = "Armenia (.am)";
$domain_country[33][0] = "an";	$domain_country[33][1] = "Netherlands Antilles (.an)";
$domain_country[34][0] = "ao";	$domain_country[34][1] = "Angola (.ao)";
$domain_country[35][0] = "aq";	$domain_country[35][1] = "Antartica (.aq)";
$domain_country[36][0] = "ar";	$domain_country[36][1] = "Argentina (.ar)";
$domain_country[37][0] = "as";	$domain_country[37][1] = "American Samoa (.as)";
$domain_country[38][0] = "au";	$domain_country[38][1] = "Australia (.au)";
$domain_country[39][0] = "aw";	$domain_country[39][1] = "Aruba (.aw)";
$domain_country[40][0] = "az";	$domain_country[40][1] = "Azerbaijan (.az)";
$domain_country[41][0] = "ba";	$domain_country[41][1] = "Bosnia and Herzegovina (.ba)";
$domain_country[42][0] = "bb";	$domain_country[42][1] = "Barbados (.bb)";
$domain_country[43][0] = "bd";	$domain_country[43][1] = "Bangladesh (.bd)";
$domain_country[44][0] = "bf";	$domain_country[44][1] = "Burkina Faso";
$domain_country[45][0] = "bg";	$domain_country[45][1] = "Bulgaria";
$domain_country[46][0] = "bh";	$domain_country[46][1] = "Bahrain";
$domain_country[47][0] = "bi";	$domain_country[47][1] = "Burundi";
$domain_country[48][0] = "bj";	$domain_country[48][1] = "Benin";
$domain_country[49][0] = "bm";	$domain_country[49][1] = "Bermuda";
$domain_country[50][0] = "bn";	$domain_country[50][1] = "Brunei Darussalam";
$domain_country[51][0] = "bo";	$domain_country[51][1] = "Bolivia";
$domain_country[52][0] = "br";	$domain_country[52][1] = "Brazil (.br)";
$domain_country[53][0] = "bs";	$domain_country[53][1] = "Bahamas";
$domain_country[54][0] = "bt";	$domain_country[54][1] = "Bhutan";
$domain_country[55][0] = "bv";	$domain_country[55][1] = "Bouvet Island";
$domain_country[56][0] = "bw";	$domain_country[56][1] = "Botswana";
$domain_country[57][0] = "by";	$domain_country[57][1] = "Belarus";
$domain_country[58][0] = "bz";	$domain_country[58][1] = "Belize";
$domain_country[59][0] = "cc";	$domain_country[59][1] = "Cocos (Keeling) Islands";
$domain_country[60][0] = "cd";	$domain_country[60][1] = "Congo, Democratic People's Republic";
$domain_country[61][0] = "cf";	$domain_country[61][1] = "Central African Republic";
$domain_country[62][0] = "cg";	$domain_country[62][1] = "Congo, Republic of";
$domain_country[63][0] = "ch";	$domain_country[63][1] = "Switzerland";
$domain_country[64][0] = "ci";	$domain_country[64][1] = "Cote d''Ivoire";
$domain_country[65][0] = "ck";	$domain_country[65][1] = "Cook Islands";
$domain_country[66][0] = "cl";	$domain_country[66][1] = "Chile";
$domain_country[67][0] = "cm";	$domain_country[67][1] = "Cameroon";
$domain_country[68][0] = "cn";	$domain_country[68][1] = "China";
$domain_country[69][0] = "co";	$domain_country[69][1] = "Colombia";
$domain_country[70][0] = "cr";	$domain_country[70][1] = "Costa Rica";
$domain_country[71][0] = "cu";	$domain_country[71][1] = "Cuba";
$domain_country[72][0] = "cv";	$domain_country[72][1] = "Cap Verde";
$domain_country[73][0] = "cx";	$domain_country[73][1] = "Christmas Island";
$domain_country[74][0] = "cy";	$domain_country[74][1] = "Cyprus";
$domain_country[75][0] = "dj";	$domain_country[75][1] = "Djibouti";
$domain_country[76][0] = "dk";	$domain_country[76][1] = "Denmark";
$domain_country[77][0] = "dm";	$domain_country[77][1] = "Dominica";
$domain_country[78][0] = "do";	$domain_country[78][1] = "Dominican Republic";
$domain_country[79][0] = "dz";	$domain_country[79][1] = "Algeria";
$domain_country[80][0] = "ec";	$domain_country[80][1] = "Ecuador";
$domain_country[81][0] = "ee";	$domain_country[81][1] = "Estonia";
$domain_country[82][0] = "eg";	$domain_country[82][1] = "Egypt";
$domain_country[83][0] = "eh";	$domain_country[83][1] = "Western Sahara";
$domain_country[84][0] = "er";	$domain_country[84][1] = "Eritrea";
$domain_country[85][0] = "et";	$domain_country[85][1] = "Ethiopia";
$domain_country[86][0] = "fi";	$domain_country[86][1] = "Finland";
$domain_country[87][0] = "fj";	$domain_country[87][1] = "Fiji";
$domain_country[88][0] = "fk";	$domain_country[88][1] = "Falkland Islands (Malvina)";
$domain_country[89][0] = "fm";	$domain_country[89][1] = "Micronesia, Federal State of";
$domain_country[90][0] = "fo";	$domain_country[90][1] = "Faroe Islands";
$domain_country[91][0] = "ga";	$domain_country[91][1] = "Gabon";
$domain_country[92][0] = "gd";	$domain_country[92][1] = "Grenada";
$domain_country[93][0] = "ge";	$domain_country[93][1] = "Georgia";
$domain_country[94][0] = "gf";	$domain_country[94][1] = "French Guiana";
$domain_country[95][0] = "gg";	$domain_country[95][1] = "Guernse";
$domain_country[96][0] = "gh";	$domain_country[96][1] = "Ghana";
$domain_country[97][0] = "gi";	$domain_country[97][1] = "Gibraltar";

$domain_country[98][0] = "gl";	$domain_country[98][1] = "Greenland";
$domain_country[99][0] = "gm";	$domain_country[99][1] = "Gambia";
$domain_country[100][0] = "gn";	$domain_country[100][1] = "Guinea";
$domain_country[101][0] = "gp";	$domain_country[101][1] = "Guadeloupe";
$domain_country[102][0] = "gq";	$domain_country[102][1] = "Equatorial Guinea";
$domain_country[103][0] = "gr";	$domain_country[103][1] = "Greece (.gr)";
$domain_country[104][0] = "gs";	$domain_country[104][1] = "South Georgia and the South Sandwich Islands";
$domain_country[105][0] = "gt";	$domain_country[105][1] = "Guatemala";
$domain_country[106][0] = "gu";	$domain_country[106][1] = "Guam";
$domain_country[107][0] = "gw";	$domain_country[107][1] = "Guinea-Bissau";
$domain_country[108][0] = "gy";	$domain_country[108][1] = "Guyana";
$domain_country[109][0] = "hk";	$domain_country[109][1] = "Hong Kong";
$domain_country[110][0] = "hm";	$domain_country[110][1] = "Heard and McDonald Island";
$domain_country[111][0] = "hn";	$domain_country[111][1] = "Honduras";
$domain_country[112][0] = "hr";	$domain_country[112][1] = "Croatia/Hrvatska";
$domain_country[113][0] = "ht";	$domain_country[113][1] = "Haiti";
$domain_country[114][0] = "hu";	$domain_country[114][1] = "Hungary";
$domain_country[115][0] = "id";	$domain_country[115][1] = "Indonesia";
$domain_country[116][0] = "ie";	$domain_country[116][1] = "Ireland";
$domain_country[117][0] = "il";	$domain_country[117][1] = "Israel (.il)";
$domain_country[118][0] = "im";	$domain_country[118][1] = "Isle of Man";
$domain_country[119][0] = "in";	$domain_country[119][1] = "India";
$domain_country[120][0] = "io";	$domain_country[120][1] = "British Indian Ocean Territory";
$domain_country[121][0] = "iq";	$domain_country[121][1] = "Iraq";
$domain_country[122][0] = "ir";	$domain_country[122][1] = "Iran (Islamic Republic of)";
$domain_country[123][0] = "is";	$domain_country[123][1] = "Iceland";
$domain_country[124][0] = "je";	$domain_country[124][1] = "Jersey";
$domain_country[125][0] = "jm";	$domain_country[125][1] = "Jamaica";
$domain_country[126][0] = "jo";	$domain_country[126][1] = "Jordan";
$domain_country[127][0] = "ke";	$domain_country[127][1] = "Kenya";
$domain_country[128][0] = "kg";	$domain_country[128][1] = "Kyrgyzstan";
$domain_country[129][0] = "kh";	$domain_country[129][1] = "Cambodia";
$domain_country[130][0] = "ki";	$domain_country[130][1] = "Kiribati";
$domain_country[131][0] = "km";	$domain_country[131][1] = "Comoros";
$domain_country[132][0] = "kn";	$domain_country[132][1] = "Saint Kitts and Nevis";
$domain_country[133][0] = "kp";	$domain_country[133][1] = "Korea, Democratic People''s Republic";
$domain_country[134][0] = "kr";	$domain_country[134][1] = "Korea, Republic of";
$domain_country[135][0] = "kw";	$domain_country[135][1] = "Kuwait";
/*
$domain_country[136][0] = "ky";	$domain_country[136][1] = "Cayman Islands";
$domain_country[137][0] = "kz";	$domain_country[137][1] = "Kazakhstan";
$domain_country[138][0] = "la";	$domain_country[138][1] = "Lao, People''s Democratic Republic";
$domain_country[139][0] = "lb";	$domain_country[139][1] = "Lebanon";
$domain_country[140][0] = "lc";	$domain_country[140][1] = "Saint Lucia";
$domain_country[141][0] = "li";	$domain_country[141][1] = "Liechtenstein";
$domain_country[142][0] = "lk";	$domain_country[142][1] = "Sri Lanka";
$domain_country[143][0] = "lr";	$domain_country[143][1] = "Liberia";
$domain_country[144][0] = "ls";	$domain_country[144][1] = "Lesotho";
$domain_country[145][0] = "lt";	$domain_country[145][1] = "Lithuania";
$domain_country[146][0] = "lu";	$domain_country[146][1] = "Luxembourg";
$domain_country[147][0] = "lv";	$domain_country[147][1] = "Latvia";
$domain_country[148][0] = "ly";	$domain_country[148][1] = "Libyan Arab Jamahiriya";
$domain_country[149][0] = "ma";	$domain_country[149][1] = "Morocco";
$domain_country[150][0] = "mc";	$domain_country[150][1] = "Monaco";
$domain_country[151][0] = "md";	$domain_country[151][1] = "Moldova, Republic of";
$domain_country[152][0] = "mg";	$domain_country[152][1] = "Madagascar";
/*
$domain_country[153][0] = "";	$domain_country[153][1] = "";
$domain_country[154][0] = "";	$domain_country[154][1] = "";
$domain_country[155][0] = "";	$domain_country[155][1] = "";
$domain_country[156][0] = "";	$domain_country[156][1] = "";
$domain_country[157][0] = "";	$domain_country[157][1] = "";
$domain_country[158][0] = "";	$domain_country[158][1] = "";
$domain_country[159][0] = "";	$domain_country[159][1] = "";
$domain_country[160][0] = "";	$domain_country[160][1] = "";
$domain_country[161][0] = "";	$domain_country[161][1] = "";
$domain_country[162][0] = "";	$domain_country[162][1] = "";
$domain_country[163][0] = "";	$domain_country[163][1] = "";
$domain_country[164][0] = "";	$domain_country[164][1] = "";
$domain_country[165][0] = "";	$domain_country[165][1] = "";
$domain_country[166][0] = "";	$domain_country[166][1] = "";
$domain_country[167][0] = "";	$domain_country[167][1] = "";
$domain_country[168][0] = "";	$domain_country[168][1] = "";
$domain_country[169][0] = "";	$domain_country[169][1] = "";
$domain_country[170][0] = "";	$domain_country[170][1] = "";
$domain_country[171][0] = "";	$domain_country[171][1] = "";
$domain_country[172][0] = "";	$domain_country[172][1] = "";
$domain_country[173][0] = "";	$domain_country[173][1] = "";
$domain_country[174][0] = "";	$domain_country[174][1] = "";
$domain_country[175][0] = "";	$domain_country[175][1] = "";
$domain_country[176][0] = "";	$domain_country[176][1] = "";
$domain_country[177][0] = "";	$domain_country[177][1] = "";
$domain_country[178][0] = "";	$domain_country[178][1] = "";
$domain_country[179][0] = "";	$domain_country[179][1] = "";
$domain_country[180][0] = "";	$domain_country[180][1] = "";
$domain_country[181][0] = "";	$domain_country[181][1] = "";
$domain_country[182][0] = "";	$domain_country[182][1] = "";
$domain_country[183][0] = "";	$domain_country[183][1] = "";
$domain_country[184][0] = "";	$domain_country[184][1] = "";
$domain_country[185][0] = "";	$domain_country[185][1] = "";
$domain_country[186][0] = "";	$domain_country[186][1] = "";
$domain_country[187][0] = "";	$domain_country[187][1] = "";
$domain_country[188][0] = "";	$domain_country[188][1] = "";
$domain_country[189][0] = "";	$domain_country[189][1] = "";
$domain_country[190][0] = "";	$domain_country[190][1] = "";
$domain_country[191][0] = "";	$domain_country[191][1] = "";
$domain_country[192][0] = "";	$domain_country[192][1] = "";
$domain_country[193][0] = "";	$domain_country[193][1] = "";
$domain_country[194][0] = "";	$domain_country[194][1] = "";
$domain_country[195][0] = "";	$domain_country[195][1] = "";
$domain_country[196][0] = "";	$domain_country[196][1] = "";
$domain_country[197][0] = "";	$domain_country[197][1] = "";
$domain_country[198][0] = "";	$domain_country[198][1] = "";
$domain_country[199][0] = "";	$domain_country[199][1] = "";
$domain_country[200][0] = "";	$domain_country[200][1] = "";
$domain_country[201][0] = "";	$domain_country[201][1] = "";
$domain_country[202][0] = "";	$domain_country[202][1] = "";
$domain_country[203][0] = "";	$domain_country[203][1] = "";
$domain_country[204][0] = "";	$domain_country[204][1] = "";
$domain_country[205][0] = "";	$domain_country[205][1] = "";
$domain_country[206][0] = "";	$domain_country[206][1] = "";
$domain_country[207][0] = "";	$domain_country[207][1] = "";
$domain_country[208][0] = "";	$domain_country[208][1] = "";
$domain_country[209][0] = "";	$domain_country[209][1] = "";
$domain_country[210][0] = "";	$domain_country[210][1] = "";
$domain_country[211][0] = "";	$domain_country[211][1] = "";
$domain_country[212][0] = "";	$domain_country[212][1] = "";
$domain_country[213][0] = "";	$domain_country[213][1] = "";
$domain_country[214][0] = "";	$domain_country[214][1] = "";
$domain_country[215][0] = "";	$domain_country[215][1] = "";
$domain_country[216][0] = "";	$domain_country[216][1] = "";
$domain_country[217][0] = "";	$domain_country[217][1] = "";
$domain_country[218][0] = "";	$domain_country[218][1] = "";
$domain_country[219][0] = "";	$domain_country[219][1] = "";
$domain_country[220][0] = "";	$domain_country[220][1] = "";
$domain_country[221][0] = "";	$domain_country[221][1] = "";
$domain_country[222][0] = "";	$domain_country[222][1] = "";
$domain_country[223][0] = "";	$domain_country[223][1] = "";
$domain_country[224][0] = "";	$domain_country[224][1] = "";
$domain_country[225][0] = "";	$domain_country[225][1] = "";
$domain_country[226][0] = "";	$domain_country[226][1] = "";
$domain_country[227][0] = "";	$domain_country[227][1] = "";
$domain_country[228][0] = "";	$domain_country[228][1] = "";
$domain_country[229][0] = "";	$domain_country[229][1] = "";
$domain_country[230][0] = "";	$domain_country[230][1] = "";
$domain_country[231][0] = "";	$domain_country[231][1] = "";
$domain_country[232][0] = "";	$domain_country[232][1] = "";
$domain_country[233][0] = "";	$domain_country[233][1] = "";
$domain_country[234][0] = "";	$domain_country[234][1] = "";
$domain_country[235][0] = "";	$domain_country[235][1] = "";
$domain_country[236][0] = "";	$domain_country[236][1] = "";
$domain_country[237][0] = "";	$domain_country[237][1] = "";
$domain_country[238][0] = "";	$domain_country[238][1] = "";
$domain_country[239][0] = "";	$domain_country[239][1] = "";
$domain_country[240][0] = "";	$domain_country[240][1] = "";
$domain_country[241][0] = "";	$domain_country[241][1] = "";
$domain_country[242][0] = "";	$domain_country[242][1] = "";
$domain_country[243][0] = "";	$domain_country[243][1] = "";
$domain_country[244][0] = "";	$domain_country[244][1] = "";
$domain_country[245][0] = "";	$domain_country[245][1] = "";
$domain_country[246][0] = "";	$domain_country[246][1] = "";
$domain_country[247][0] = "";	$domain_country[247][1] = "";
$domain_country[248][0] = "";	$domain_country[248][1] = "";
$domain_country[249][0] = "";	$domain_country[249][1] = "";
$domain_country[250][0] = "";	$domain_country[250][1] = "";
$domain_country[251][0] = "";	$domain_country[251][1] = "";
$domain_country[252][0] = "";	$domain_country[252][1] = "";
$domain_country[253][0] = "";	$domain_country[253][1] = "";
$domain_country[254][0] = "";	$domain_country[254][1] = "";
*/

?>
