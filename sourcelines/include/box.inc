<?php

######################################################################
# The HTML Table Library
# ===================================================================
#
# Copyright (c) 2001 by
#		 Lutz Henckel (lutz.henckel@fokus.gmd.de) and
#        Gregorio Robles (grex@scouts-es.org)
#
# BerliOS - The OpenSource Mediator: http://www.berlios.de
#
# The HTML table library
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
######################################################################

class box {
	var $box_width;
	var $box_frame_color;
	var $box_frame_width;
	var $box_title_bgcolor;
	var $box_title_font_color;
	var $box_title_align;
	var $box_body_bgcolor;
	var $box_body_font_color;
	var $box_body_align;

	function box($box_width="",$frame_color="#000000",$frame_width="1",$title_bgcolor="#CCCCCC",$title_font_color="#000000",$title_align="",$body_bgcolor="#FFFFFF",$body_font_color="#000000",$body_align="") {
		$this->box_width = $box_width;
		$this->box_frame_color = $frame_color;
		$this->box_frame_width = $frame_width;
		$this->box_title_bgcolor = $title_bgcolor;
		$this->box_title_font_color = $title_font_color;
		$this->box_title_align = $title_align;
		$this->box_body_bgcolor = $body_bgcolor;
		$this->box_body_font_color = $body_font_color;
		$this->box_body_align = $body_align;
	}
   
	function box_begin() {
		echo "\n<!-- box begin -->\n";
    	echo "<table border=0 cellspacing=0 cellpadding=0 bgcolor=\"$this->box_frame_color\" width=\"$this->box_width\" align=center>\n";
		echo "<tr><td>\n";
		echo "<table border=0 cellspacing=\"$this->box_frame_width\" cellpadding=3 align=\"center\" width=\"100%\">\n";
	}

	function box_end() {
		echo "</table>\n";
		echo "</td></tr></table><br>\n";
		echo "<!-- box end -->\n";
	}

	function box_title_begin() {
		echo "<!-- box title begin -->\n";
		echo "<tr bgcolor=\"$this->box_title_bgcolor\"><td align=\"$this->box_title_align\">\n";
	}

	function box_title_end() {
		echo "</td></tr>\n";
		echo "<!-- box title end -->\n";
	}

	function box_title($title) {
		$this->box_title_begin();
		echo "<font color=\"$this->box_title_font_color\"><b>$title</b></font>\n";
		$this->box_title_end();
	}

	function box_body_begin() {
		echo "<!-- box body begin -->\n";
		echo "<tr bgcolor=\"$this->box_body_bgcolor\"><td align=\"$this->box_body_align\"><font color=\"$this->box_body_font_color\">\n";
	}

	function box_body_end() {
		echo "</font></td></tr>\n";
		echo "<!-- box body end -->\n";
	}

	function box_body($text) {
		$this->box_body_begin();
		echo "<font color=\"$this->box_body_font_color\">$text</font>\n";
		$this->box_body_end();
	}

	function box_full($title, $text) {
		$this->box_begin();
		$this->box_title($title);
		$this->box_body($text);
		$this->box_end();
	}

	function box_strip($title) {
		$this->box_begin();
		$this->box_title($title);
		$this->box_end();
	}
}

class table {
	var $table_width;
	var $table_border;
	var $table_cellspacing;
	var $table_cellpadding;
	var $table_head_bgcolor;
	var $table_head_font_color;
	var $table_head_align;
	var $table_head_valign;
	var $table_body_bgcolor;
	var $table_body_font_color;
	var $table_body_align;
	var $table_body_valign;

	function table($table_width="",$table_border="0",$table_cellspacing="1",$table_cellpadding="1",$table_head_bgcolor="#CCCCCC",$table_head_font_color="#000000",$table_head_align="center",$table_head_valign="top",$table_body_bgcolor="#FFFFFF",$table_body_font_color="#000000",$table_body_align="left",$table_body_valign="top") {
		$this->table_width = $table_width;
		$this->table_border = $table_border;
		$this->table_cellspacing = $table_cellspacing;
		$this->table_cellpadding = $table_cellpadding;
		$this->table_head_bgcolor = $table_head_bgcolor;
		$this->table_head_font_color = $table_head_font_color;
		$this->table_head_align = $table_head_align;
		$this->table_head_valign = $table_head_valign;
		$this->table_body_bgcolor = $table_body_bgcolor;
		$this->table_body_font_color = $table_body_font_color;
		$this->table_body_align = $table_body_align;
		$this->table_body_valign = $table_body_valign;
	}
   
	function table_begin() {
		echo "<!-- table begin -->\n";
		echo "<table border=\"$this->table_border\" cellspacing=\"$this->table_cellspacing\" cellpadding=\"$this->table_cellpadding\" width=\"$this->table_width\">\n";
	}

	function table_end() {
		echo "</table>\n";
		echo "<!-- table end -->\n";
	}		

	function table_row_begin() {
		echo "<!-- row begin -->\n";
		echo "<tr>\n";
	}

	function table_row_end() {
		echo "</tr>\n";
		echo "<!-- row end -->\n";
	}
	
	function table_row_next() {
		$this->table_row_end();
		$this->table_row_begin();		
	}		

	function table_head_column_begin($colspan="1",$width="") {
		echo "<!-- head column begin -->\n";
		echo "<th colspan=\"$colspan\" bgcolor=\"$this->table_head_bgcolor\" align=\"$this->table_head_align\" valign=\"$this->table_head_valign\" width=\"$width\">\n";
		echo "<font color=\"$this->table_head_font_color\">\n";
	}

	function table_head_column_end() {
		echo "</font></td>\n";
		echo "<!-- head column end -->\n";
	}

	function table_head_column_next($colspan="1",$width="") {
		$this->table_head_column_end();
		$this->table_head_column_begin($colspan,$width);		
	}		

	function table_head_column($text="",$colspan="1") {
		$this->table_head_column_begin($colspan);
		echo $text;
		$this->table_head_column_end();
	}

	function table_body_column_begin($colspan="1",$width="") {
		echo "<!-- body column begin -->\n";
		echo "<td colspan=\"$colspan\" bgcolor=\"$this->table_body_bgcolor\" align=\"$this->table_body_align\" valign=\"$this->table_body_valign\" width=\"$width\">\n";
		echo "<font color=\"$this->table_body_font_color\">\n";
	}

	function table_body_column_end() {
		echo "</font></td>\n";
		echo "<!-- body column end -->\n";
	}

	function table_body_column_next($colspan="1",$width="") {
		$this->table_body_column_end();
		$this->table_body_column_begin($colspan,$width);		
	}		

	function table_body_column($text="",$colspan="1",$width="") {
		$this->table_body_column_begin($colspan,$width);
		echo $text;
		$this->table_body_column_end();
	}

}
?>