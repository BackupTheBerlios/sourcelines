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
# The SourceLines Project Page
#
# It also shows the number of apps in each one
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
###################################################################### 

require("header.inc");

?>

<!-- content -->

<A NAME="international">
<P><H2>International support</H2>

<P>SourceLines can easily be translated into different
languages. If you see that SourceLines does not support your
language, you are invited to help us with the
internationalization of SourceLines by sending us your translation.

<P>You don't need to have any computer or programming experience to do a
translation.

<A NAME="normal_outputs">
<P><H3>1. Main outputs</H3>

<P>Download the <A HREF="../include/lang-translate.inc">lang-translate.inc</A> file (it also comes in SourceLines's tarball) . If you edit it, you'll find
lines like this:

<PRE>
     case "Home": $tmp = ""; break;
</PRE>

<P>We will explain it briefly: after the <I>case</I> you will see the English text to translate written in
quotes (in our example, the English text is "Home"). Then you'll find a
sort of equation. The content of your translation from English into your
language should be placed in between these second quotes. For example, 
in the case you were making a translation into German, this would be the 
result for this line:

<PRE>
     case "Home": $tmp = "Heim"; break;
</PRE>

<P>Ok, now that you're an expert, you'll notice that "Home" is translated
into German as "Heim" ;-). The procedure just explained should be repeated with
all the lines in this file. 

<P>Once you're finished, save it as <I>YourLanguage-lang.inc</I> and please send it to the authors. We will include
it in the next releases so that everybody can benefit of your work.

<A NAME="contributors">
<P><H3>2. Contributors</H3>

<P>Here's a list of all the people that have contributed to the
translation of SourceLines.

<P>Main files:
<BR>&nbsp;

<CENTER>
<TABLE width=95%>
<TR><TD>Language</TD><TD>Translator</TD><TD>Version</TD><TD>Last Modified</TD></TR>
<TR><TD><A HREF="../include/German-lang.inc">German</A></TD><TD>Lutz Henckel &lt;<A
HREF="mailto:lutz.henckel@fokus.gmd.de">lutz.henckel@fokus.gmd.de</A>&gt;</TD><TD>1.0</TD><TD>11 November 2001</TD></TR>
</TABLE></CENTER>


<P>&nbsp;

<!-- end content -->

<?php
require("footer.inc");
?>