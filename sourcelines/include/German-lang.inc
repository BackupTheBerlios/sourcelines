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
# File with the main German translation
# translated by Lutz Henckel <lutz.henckel@fokus.gmd.de>
#
# This program is free software. You can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 or later of the GPL.
######################################################################

switch($phrase) {

// Top strip
     case "Home": $tmp = "$phrase"; break;
     case "About us": $tmp = "&Uuml;ber uns"; break;
     case "Partners": $tmp = "Partner"; break;
     case "Contact": $tmp = "Kontakt"; break;

     case "Logged in": $tmp = "Eingeloggt als"; break;
     case "Expires": $tmp = "Endet"; break;
     case "Not Logged in": $tmp = "Nicht eingeloggt"; break;

// Top title
     case "Open Source Solutions":  $tmp = "Open Source Lösungen"; break;

// Menue bar
     case "Recent Solutions": $tmp = "Neueste Lösungen"; break;
     case "Q&amp;A": $tmp = "F&amp;A"; break;
     case "Login": $tmp = "Einloggen"; break;
     case "Logout": $tmp = "Ausloggen"; break;
     case "New User": $tmp = "Neuer Benutzer"; break;
     case "Forgot Password": $tmp = "Passwort vergessen"; break;
     case "Change User": $tmp = "Benutzer &auml;ndern"; break;
     case "Users": $tmp = "Benutzer"; break;

     case "by Branch": $tmp = "nach Wirtschaftszweig"; break;
     case "by Category": $tmp = "nach Kategorie"; break;
     case "by Keyword": $tmp = "nach Schlüsselwort"; break;
     case "by Contact": $tmp = "nach Kontakt"; break;
     case "New Solution": $tmp = "Neue Lösung";break;
     case "Your Solutions": $tmp = "Ihre Lösungen";break;
     case "Modified Apps": $tmp = "Modifizierte Anw.";break;

     case "Newsletter": $tmp = "$phrase"; break;
     case "Backend": $tmp = "$phrase"; break;
     case "Statistics": $tmp = "Statistiken"; break;

     case "Administration": $tmp = "$phrase"; break;
     case "Branches": $tmp = "Wirtschaftszweige"; break;
     case "Categories": $tmp = "Kategorien"; break;
     case "Types of Components": $tmp = "Komponenttypen"; break;
     case "Licenses": $tmp = "Lizenzen"; break;
     case "Languages": $tmp = "Sprachen"; break;
     case "Daily Newsletter": $tmp = "Täglicher Newsletter"; break;
     case "Weekly Newsletter": $tmp = "Wöchentlicher Newsletter"; break;
     case "Configure": $tmp = "Konfigurieren"; break;

     case "Search": $tmp = "Suche"; break;
     case "Advanced Search": $tmp = "Erweiterte Suche"; break;
     case "Language": $tmp = "Sprache"; break;
     case "Go": $tmp = "Los"; break;

// Languages
	case "English": $tmp = "Englisch"; break;
	case "German": $tmp = "Deutsch"; break;
	case "French": $tmp = "Französisch"; break;
	case "Spanish": $tmp = "Spanisch"; break;
	case "Turkish": $tmp = "Türkisch"; break;
	case "Italian": $tmp = "Italienisch"; break;
	case "Other Language": $tmp = "Andere Sprache"; break;

// sorted by
	case "sorted by": $tmp = "sortiert nach"; break;
	case "Date": $tmp = "Datum"; break;
	case "Name": $tmp = "$phrase"; break;
	case "Contact": $tmp = "Kontakt"; break;
	case "Branch": $tmp = "Wirtschaftszweig"; break;
	case "Category": $tmp = "Kategorie"; break;
	case "Supplier": $tmp = "Anbieter"; break;

// navigation
	case "previous": $tmp = "vorige"; break;
	case "next": $tmp = "nächste"; break;
	case "Solutions": $tmp = "Lösungen"; break;
	case "Select": $tmp = "Auswählen"; break;
	case "no branch selected": $tmp = "kein Wirtschaftszweig ausgewählt"; break;
	case "no category selected": $tmp = "keine Kategorie ausgewählt"; break;
	case "no keywords selected": $tmp = "keine Schlüsselwörter ausgewählt"; break;
	case "no language selected": $tmp = "keine Sprache ausgewählt"; break;

	case "not applicable": $tmp = "nicht anwendbar"; break;
	case "no documents provided": $tmp = "keine Dokumente vorhanden"; break;

// set solutions
	case "Solution": $tmp = "Lösung"; break;
	case "Your Solution": $tmp = "Ihre Lösung";break;
	case "by": $tmp = "von"; break;
	case "Version": $tmp = "$phrase"; break;
	case "Current logo": $tmp = "Momentanes Logo"; break;
	case "Logo": $tmp = "$phrase"; break;
	case "Summary": $tmp = "Beschreibung"; break;
	case "Allowed HTML": $tmp = "Erlaubter HTML Code"; break;

	case "Homepage": $tmp = "$phrase"; break;
	case "Created": $tmp = "Erzeugt"; break;
	case "Last modified": $tmp = "Modifiziert"; break;
	case "Contact name": $tmp = "Kontaktname"; break;
	case "Contact email": $tmp = "Kontakt-Email"; break;
	case "Contact url": $tmp = "Kontakt-URL"; break;
	case "Current contact logo": $tmp = "Momentanes Kontaktlogo"; break;
	case "Contact logo": $tmp = "Kontaktlogo"; break;
	case "Supplier name": $tmp = "Anbietername"; break;
	case "Supplier email": $tmp = "Anbieter-Email"; break;
	case "Supplier url": $tmp = "Anbieter-URL"; break;
	case "Current supplier logo": $tmp = "Momentanes Anbieterlogo"; break;
	case "Supplier logo": $tmp = "Anbieterlogo"; break;
	case "Keywords": $tmp = "Schlüsselwörter"; break;
	case "Components": $tmp = "Komponenten"; break;
	case "Documents": $tmp = "Dokumentation"; break;
	case "Keep": $tmp = "Beibehalten"; break;
	case "New": $tmp = "Neu"; break;
	case "Delete Solution": $tmp = "Lösung löschen"; break;
	case "Solution successful deleted": $tmp = "Lösung wurde erfolgreich gelöscht"; break;
	case "more": $tmp = "mehr"; break;
	case "Update Solution": $tmp = "Lösung ändern"; break;
	case "Add Comment": $tmp = "Kommentar erstellen"; break;
	case "Read Comment": $tmp = "Kommentar lesen"; break;


// set branches
	case "Select Branch of Solution": $tmp = "Wirtschaftszweig der Lösung auswählen"; break;
	case "Back to your solution": $tmp = "Zurück zur Lösung"; break;

// set categories
	case "Select Category of Solution": $tmp = "Kategorie der Lösung auswählen"; break;

// set keywords
	case "Select Keywords of Solution": $tmp = "Schlüsselwörter der Lösung auswählen"; break;
	case "Add a keyword": $tmp = "Schlüsselwort hinzufügen"; break;
	case "Change keyword": $tmp = "Schlüsselwort ändern"; break;
	case "Delete keyword": $tmp = "Schlüsselwort löschen"; break;
	case "Add": $tmp = "Erzeuge"; break;
	case "new keyword": $tmp = "neues Schlüsselwort"; break;
	case "Existing keywords": $tmp = "Existierende Schlüsselwörter"; break;
	case "New keyword": $tmp = "Neues Schlüsselwort"; break;
	case "Back": $tmp = "Zurück"; break;

// set languages
	case "Select Languages of Solution": $tmp = "Sprache der Lösung auswählen"; break;
	case "Add a language": $tmp = "Sprache hinzufügen"; break;
	case "Change language": $tmp = "Sprache ändern"; break;
	case "Delete language": $tmp = "Sprache löschen"; break;
	case "new language": $tmp = "neue Sprache"; break;

// set components
	case "Select Components of Solution": $tmp = "Komponenten der Lösung auswählen"; break;
	case "Add a component": $tmp = "Komponente hinzufügen"; break;
	case "Change component": $tmp = "Komponente ändern"; break;
	case "Delete component": $tmp = "Komponente löschen"; break;
	case "new component": $tmp = "neue Komponente"; break;
	case "Type": $tmp = "Typ"; break;

// set documents
	case "Provide Document of Solution": $tmp = "Dokument der Lösung bereitstellen"; break;
	case "new document": $tmp = "neues Dokument"; break;
	case "Add a document": $tmp = "Dokument hinzufügen"; break;
	case "Change document": $tmp = "Dokument ändern"; break;
	case "Delete document": $tmp = "Dokument löschen"; break;
	case "Title": $tmp = "Titel"; break;
	case "Current document": $tmp = "Momentanes Dokument"; break;
	case "Document": $tmp = "Dokument"; break;

// types of components
	case "Applications": $tmp = "Applikationen"; break;
	case "Databases": $tmp = "Datenbanken"; break;
	case "Operating Systems": $tmp = "Betriebssysteme"; break;
	case "Others": $tmp = "Anderes"; break;
	case "Programming Languages": $tmp = "Programmiersprachen"; break;

// branches
	case "Solutions by Branch": $tmp = "Lösungen nach Wirtschaftszweigen"; break;
	case "Root": $tmp = "Wurzel"; break;

// categories
	case "Solutions by Category": $tmp = "Lösungen nach Kategorien"; break;
	case "Communications": $tmp = "Kommunikation"; break;
	case "Databases": $tmp = "Datenbanken"; break;
	case "Desktop Environment": $tmp = "Arbeitsplatzumgebung"; break;
	case "Games/Entertainment": $tmp = "Spiele/Unterhaltung"; break;
	case "Internet": $tmp = "$phrase"; break;
	case "Multimedia": $tmp = "$phrase"; break;
	case "Office/Business": $tmp = "$phrase"; break;
	case "Other Categories": $tmp = "Andere Kategorien"; break;
	case "Printing": $tmp = "Drucken"; break;
	case "Security": $tmp = "Sicherheit"; break;
	case "Software Development": $tmp = "Softwareentwicklung"; break;
	case "System": $tmp = "$phrase"; break;

// keywords
	case "Solutions by Keyword": $tmp = "Lösungen nach Schlüsselwort"; break;
	case "Keyword": $tmp = "Schlüsselwort"; break;

// FAQ
     case "Frequently Asked Questions": $tmp = "Oft gestellte Fragen"; break;
     case "Question": $tmp = "Frage"; break;
     case "Answer": $tmp = "Antwort"; break;


// User registration
     case "Register as a new User": $tmp = "Registrierung als neuer Benutzer"; break;
     case "Username": $tmp = "Benutzername"; break;
     case "Password": $tmp = "Passwort"; break;
     case "Confirm Password": $tmp = "Passwort bestätigen"; break;
     case "Realname": $tmp = "Name"; break;
     case "Register": $tmp = "Registrieren"; break;
     case "User Registration": $tmp = "Benutzerregistrierung"; break;
     case "Congratulations": $tmp = "Gratulation"; break;
     case "You have registered on $GLOBALS[sys_name]": $tmp = "Sie haben sich bei $GLOBALS[sys_name] registriert"; break;
     case "Your new username is": $tmp = "Ihr neuer Benutzername ist"; break;
     case "You are now being sent a confirmation email to verify your email address": $tmp = "Es wurde eine Bestätigung per E-Mail an Sie gesendet, um Ihre E-Mail-Adresse zu überprüfen"; break;
     case "Visiting the link sent to you in this email will activate your account": $tmp = "Wenn Sie die in dieser E-Mail gesendete Seite besuchen wird Ihre Benutzerkennung freigeschaltet"; break;
     case "Thank you for registering on the $GLOBALS[sys_name] Site. In order": $tmp = "Danke für Ihre Registrierung bei $GLOBALS[sys_name]. Um Ihre"; break;
     case "to complete your registration, visit the following URL": $tmp = "Registrierung abzuschließen, besuchen Sie die folgende URL"; break;
     case "Enjoy the site": $tmp = "Wir hoffen, dass Ihnen $GLOBALS[sys_name] gefällt"; break;
     case " -- the $GLOBALS[sys_name] crew": $tmp = " -- die $GLOBALS[sys_name] Crew"; break;
     case "Verification of Registration": $tmp = "Verifikation der Registrierung"; break;
     case "Your account is now activated. Please login": $tmp = "Ihre Benutzerkennung ist jetzt freigeschaltet. Bitte loggen Sie sich ein."; break;
     case "Your account is already active. Please login": $tmp = "Ihr Benutzerkennung ist bereits freigeschaltet. Bitte loggen Sie sich ein."; break;

// Forget password / Remind me
     case "Register as a new User": $tmp = "Registrierung als neuer Benutzer"; break;
     case "Remind me": $tmp = "Erinnern"; break;
     case "Your Username and Password for $GLOBALS[sys_name] is": $tmp = "Ihr Benutzername und Passwort für $GLOBALS[sys_name] ist"; break;
     case "Please keep this e-mail for further reference": $tmp = "Bitte bewahren Sie diese E-Mail zur späteren Referenzierung auf"; break;
     case "You will get your Password by e-mail in a couple of minutes": $tmp = "Sie erhalten Ihr Passwort per E-Mail in wenigen Minuten"; break;

// Change User Parameters
     case "Change User Parameters": $tmp = "Änderung der Benutzerdaten"; break;
     case "Remind me": $tmp = "Erinnerung"; break;
     case "Modification": $tmp = "Modifiziert"; break;
     case "Creation": $tmp = "Erzeugt"; break;
     case "Permission": $tmp = "Rechte"; break;
     case "Change": $tmp = "Ändern"; break;
     case "Password and/or E-Mail Address of": $tmp = "Passwort und/oder E-Mail-Adresse von"; break;
     case "is changed": $tmp = "wurden geändert"; break;

// Comment
     case "Your Comment about": $tmp = "Ihr Kommentar zu"; break;
     case "Subject": $tmp = "Thema"; break;
     case "Comment": $tmp = "Kommentar"; break;
     case "Send": $tmp = "Senden"; break;

// Login
     case "$GLOBALS[sys_name] Login": $tmp = "Bei $GLOBALS[sys_name] Einloggen"; break;
     case "Welcome to $GLOBALS[sys_name]": $tmp = "Willkommen bei $GLOBALS[sys_name]"; break;
     case "You are logged in as": $tmp = "Sie sind eingeloggt als"; break;
     case "with": $tmp = "mit"; break;
     case "permission": $tmp = "Rechten"; break;
     case "Your authentication is valid until": $tmp = "Ihre Authentifizierung ist gültig bis"; break;

// Logout
     case "You have been logged in as": $tmp = "Sie waren eingeloggt als"; break;
     case "Your authentication was valid until": $tmp = "Ihre Authentifizierung war gültig bis"; break;
     case "This is all over now. You have been logged out": $tmp = "Dies ist nun vorbei. Sie haben sich ausgeloggt"; break;

// User admin
     case "User Administration": $tmp = "Administration der Benutzer"; break;
     case "Action": $tmp = "Aktion"; break;
     case "Delete": $tmp = "Löschen"; break;
     case "Create User": $tmp = "Benutzer Erzeugen"; break;
     case "User Creation": $tmp = "Benutzer einrichten"; break;
     case "created": $tmp = "eingerichtet"; break;
     case "User Change": $tmp = "Benutzer Ändern"; break;
     case "User Deletion": $tmp = "Benutzer Löschen"; break;
     case "is deleted": $tmp = "wurden gelöscht"; break;

// Branch admin
     case "Branch Administration": $tmp = "Administration der Wirtschaftszweige"; break;
     case "Add Branch": $tmp = "Erzeuge Wirtschaftszweig"; break;
     case "Change Branch": $tmp = "Ändere Wirtschaftszweig"; break;
     case "Delete Branch": $tmp = "Lösche Wirtschaftszweig"; break;

// Categorie admin
     case "Category Administration": $tmp = "Administration der Kategorien"; break;
     case "Add Category": $tmp = "Erzeuge Kategorie"; break;
     case "Change Category": $tmp = "Ändere Kategorie"; break;
     case "Delete Category": $tmp = "Lösche Kategorie"; break;

// Type of Component admin
     case "Type of Component Administration": $tmp = "Administration der Komponententypen"; break;
     case "Type of Component": $tmp = "Komponententyp"; break;
     case "Add type of component": $tmp = "Erzeuge Komponententyp"; break;
     case "Change type of component": $tmp = "Ändere Komponententyp"; break;
     case "Delete type of component": $tmp = "Lösche Komponententyp"; break;
     case "new type of component": $tmp = "neuen Komponententyp"; break;

// License admin
     case "License Administration": $tmp = "Administration der Lizenzen"; break;
     case "Add License": $tmp = "Lizenz hinzufügen"; break;
     case "Change License": $tmp = "Lizenz ändern"; break;
     case "Delete License": $tmp = "Lizenz löschen"; break;
     case "new license": $tmp = "neue Lizenz"; break;

// Language admin
     case "Language Administration": $tmp = "Administration der Sprachen"; break;
     case "Add Language": $tmp = "Sprache hinzufügen"; break;
     case "Change Language": $tmp = "Sprache ändern"; break;
     case "Delete Language": $tmp = "Sprache löschen"; break;
     case "new language": $tmp = "neue Sprache"; break;

// FAQ admin
     case "Frequently Asked Questions Administration": $tmp = "Administration der häufig gestellten Fragen"; break;
     case "Enter a New Frequently Asked Question": $tmp = "Neue häufig gestellte Frage hinzufügen"; break;
     case "Modify a Frequently Asked Question": $tmp = "Häufig gestellte Frage ändern"; break;
     case "New Frequently Asked Question": $tmp = "Neue häufig gestellte Frage"; break;
    case "Insert": $tmp = "Hinzufügen"; break;
    case "Create": $tmp = "Erzeugen"; break;
    case "Modify": $tmp = "Ändern"; break;
    case "The following FAQ has been inserted": $tmp = "Die folgende häufig gestellte Frage wurde erzeugt"; break;
    case "The following FAQ has been modified": $tmp = "Die folgende häufig gestellte Frage wurde geändert"; break;
    case "Do you really want to delete this FAQ? There is no way for undeletion.": $tmp = "Wollen Sie wirklich diese häufig gestellte Frage löschen? Es besteht keine Möglichkeit dies rückgängig zu machen."; break;
    case "Yes, Delete": $tmp = "Ja, löschen"; break;
    case "No, Just Modify": $tmp = "Nein, nur ändern"; break;
    case "The FAQ has been deleted": $tmp = "Die häufig gestellte Frage wurde gelöscht"; break;

// Users
    case "No": $tmp = "Nr"; break;
    case "All": $tmp = "Alle"; break;
    case "Sols": $tmp = "Lös."; break;

// Developers
    case "Names": $tmp = "Namen"; break;
    case "Unknown": $tmp = "Unbekannt"; break;

// Newsletter
     case "Subscribe Newsletter": $tmp = "Newsletter abonnieren"; break;
     case "Subscribe": $tmp = "Abonnieren"; break;
     case "Send newsletter": $tmp = "Sende Newsletter"; break;
     case "Newsletter was sent at ": $tmp = "Newsletter wurde gesendet am "; break;
     case "You have subscribed to $GLOBALS[sys_name] daily Newsletter": $tmp = "Sie haben den täglichen $GLOBALS[sys_name] Newsletter abonniert"; break;
     case "You have subscribed to $GLOBALS[sys_name] weekly Newsletter": $tmp = "Sie haben den wöchentlichen $GLOBALS[sys_name] Newsletter abonniert"; break;
     case "daily": $tmp = "täglich"; break;
     case "weekly": $tmp = "wöchentlich"; break;

// Messages
     case "Attention": $tmp = "Achtung"; break;
     case "No more Solutions exist": $tmp = "Es existieren keine weiteren Lösungen"; break;

// Errors
     case "Access denied": $tmp = "Zugriff verweigert"; break;
     case "Error": $tmp = "Fehler"; break;
     case "does not exist": $tmp = "existiert nicht"; break;
     case "Change User Parameters failed": $tmp = "Änderung der Benutzerdaten ist fehlgeschlagen"; break;
     case "No Solution found": $tmp = "Keine Lösung gefunden"; break;
     case "Please select": $tmp = "Bitte wählen Sie"; break;
     case "Parameter missing": $tmp = "Parameter fehlt"; break;
     case "and": $tmp = "und"; break;
     case "User": $tmp = "Benutzer"; break;
     case "already exists": $tmp = "existiert bereits"; break;
     case "Please select a different Username": $tmp = "Bitte wählen Sie einen anderen Benutzernamen"; break;
     case "Please enter": $tmp = "Bitte angeben:"; break;
     case "Either your Username or E-Mail Address is unknown": $tmp = "Entweder Ihr Benutzername oder E-Mail-Adresse ist unbekannt"; break;
     case "Please try again": $tmp = "Bitte versuchen Sie es nochmal"; break;
     case "If you are not yet a registered User, please select": $tmp = "Wenn Sie noch kein registrierter Benutzer sind, wählen Sie bitte"; break;
     case "Verification of Registration failed": $tmp = "Verifikation der Registrierung ist fehlgeschlagen"; break;
     case "User Change failed": $tmp = "Benutzer ändern ist fehlgeschlagen"; break;
     case "Registration of new User failed": $tmp = "Registrierung des neuen Benutzers ist fehlgeschlagen"; break;
     case "Database Access failed": $tmp = "Datenbankzugriff ist fehlgeschlagen"; break;
     case "User Deletion failed": $tmp = "Benutzer Löschen ist fehlgeschlagen"; break;
     case "No more Solution for this day": $tmp = "Keine weiteren Lösung für diesen Tag"; break;
     case "Either your Username or Password are invalid": $tmp = "Entweder Ihr Benutzername oder Passwort ist falsch"; break;
     case "The passwords are not identical": $tmp = "Die Passworte sind nicht identisch"; break;
     case "Please try again": $tmp = "Bitte versuchen Sie es nochmal"; break;
     case "License description is not available": $tmp = "Lizenzbeschreibung ist nicht verfügbar"; break;

// If no translation available, keep the original phrase
     default: $tmp = "$phrase"; break;
}
?>
