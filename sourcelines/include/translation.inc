<?php
 class translation {
     var $tolang;

     function translation($lang = "German") {
          $this->$tolang = $lang;
     }
   
     function translate($phrase) {
      switch ($this->$tolang) {
      case "English":
	    require("English-lang.inc");
        break;
      case "German":
	    require("German-lang.inc");
        break;
      default:
	    require("German-lang.inc");
        break;
      }
	  return($tmp);
     }
 }
?>
