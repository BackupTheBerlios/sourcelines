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

<P><H2>SourceLines</H2>

<P><B>Latest Version: 0.1 (Development)
<BR>Latest Stable Version: 0.1</B>

<P>SourceLines is a highly configurable, well documented Open Source Solutions system entirely written in PHP3 and database independent. It includes user authentication and autherization system (anonymous/user/admin), sessions with and without cookies, high configurability, multilangual support, ease of administration, RDF-type document backend, announcing mailing lists, solution indexing by branches, categories and contacts, installation support and many other useful features.

<P>SourceLines depends on the PHPLib library (version 7.2 or later). Only if you want to have diary and weekly mailing lists with the announcements, you should also have Mailman installed in your box.

<P>You can see a fully working example of the SourceLines system at BerliOS
SourceLines by visiting <A HREF="http://sourcelines.berlios.de">http://sourcelines.berlios.de</A>. A close look at it will show you what
you can do with SourceLines.

<P>BerliOS SourceLines is part of the BerliOS project at GMD FOKUS. Please, have
a look at <A HREF="http://www.berlios.de">http://www.berlios.de</A> for further information.

<P>SourceLines can be easily translated into different
languages. If you see that SourceLines does not have support in your
language, you're gladly invited to <A HREF="translating.php3">help us with the
internationalization</A> of SourceLines by sending us your translation.

<P>You can download the latest version of SourceLines (sources and documentation) at:
<A HREF="http://developer.berlios.de/projects/sourcelines">http://developer.berlios.de/projects/sourcelines</A>

<center><table width=99%>

<tr><td>

<P>SourceLines Features:
<UL>
<LI>Different type of users (nonauthorized users, users and administrators) with different functions
<LI>Session management with and without cookies
<LI>Database independent
<LI>Advanced configurability from a single file
<LI>Simple, intuitive use of the system
<LI>Documentation for further development and/or adjustment
<LI>Comments on solutions
<LI>Through-the-web administration of solutions, branches, categories, type of components, languages, comments and licenses
<LI>system FAQ with through-the-web administration
<LI>Dynamic order of solutions by date (default), contact, supplier or
by alphabetical order
<LI>Multilingual support
<LI>The administrator can easily administrate whether there are anonymous users allowed or not
<LI>Dynamic permission configuration
<LI>XML Backend (RDF-document format)
<LI>Daily and Weekly automatic Newsletters
<LI>EMail advice for administrators when new users register
<LI>Test page (very helpfull when installing the system and something goes wrong)
<LI>Web browser independence
<LI>Cache avoidance
</UL>

</td>
</tr></table>
</center>

<P>&nbsp;

<!-- end content -->

<?php
require("footer.inc");
?>