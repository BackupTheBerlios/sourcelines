# phpMyAdmin MySQL-Dump
# version 2.2.1
# http://phpwizard.net/phpMyAdmin/
# http://phpmyadmin.sourceforge.net/ (download page)
#
# Host: db.berlios.de
# Generation Time: Nov 22, 2001 at 09:59 AM
# Server version: 3.23.37
# PHP Version: 3.0.16
# Database : `sourcelines`
# --------------------------------------------------------

#
# Table structure for table `active_sessions`
#

DROP TABLE IF EXISTS active_sessions;
CREATE TABLE active_sessions (
  sid varchar(32) NOT NULL default '',
  name varchar(32) NOT NULL default '',
  val text,
  changed varchar(14) NOT NULL default '',
  PRIMARY KEY  (name,sid),
  KEY changed (changed)
) TYPE=MyISAM;

#
# Table structure for table `auth_user`
#

DROP TABLE IF EXISTS auth_user;
CREATE TABLE auth_user (
  user_id varchar(32) NOT NULL default '',
  username varchar(32) NOT NULL default '',
  password varchar(32) NOT NULL default '',
  realname varchar(64) NOT NULL default '',
  email_usr varchar(128) NOT NULL default '',
  modification_usr timestamp(14) NOT NULL,
  creation_usr timestamp(14) NOT NULL,
  perms varchar(255) default NULL,
  PRIMARY KEY  (user_id),
  UNIQUE KEY k_username (username)
) TYPE=MyISAM;
# --------------------------------------------------------

#
# Dumping data for table `auth_user`
#

INSERT INTO auth_user VALUES ('64981510696768c1de62cd2fa1ff2bcb','admin','admin','Administrator','nobody@nodomain.notop',20011114234530,20011114234530,'user,editor,admin');
# --------------------------------------------------------

#
# Table structure for table `faq`
#

DROP TABLE IF EXISTS faq;
CREATE TABLE faq (
  faqid int(8) unsigned NOT NULL auto_increment,
  language varchar(24) NOT NULL default '',
  question blob NOT NULL,
  answer blob NOT NULL,
  PRIMARY KEY  (faqid)
) TYPE=MyISAM;

#
# Dumping data for table `faq`
#

INSERT INTO faq VALUES (1, 'English', 'How to change my Password or E-mail address I am registered with?', 'Select "<a href="chguser.php3">Change User</a>" and enter your new parameters.');
INSERT INTO faq VALUES (4, 'English', 'Why is the system not in my language?', 'This system can be easily translated into different languages. If you see that we do not have support in your language, you\'re gladly invited to help us with the internationalization. Visit <a href="http://sourcelines.berlios.de/html/translating.php3">http://sourcelines.berlios.de/html/translating.php3</A>.');
INSERT INTO faq VALUES (5, 'German', 'Wie ändere ich mein Passwort oder E-Mail-Adresse?', 'Wählen Sie "<a href=chguser.php3>Benutzer ändern</a>" und geben Sie Ihre neuen Daten ein.');
INSERT INTO faq VALUES (9, 'German', 'Warum ist SourceLines nicht in meiner Sprache?', 'SourceLines kann in andere Sprachen sehr einfach übersetzt werden. Wenn Sie sehen, dass SourceLines ihre Sprache nicht unterstützt, dann sind Sie herzlich eingeladen, uns bei der Internationalisation zu helfen. Besuchen Sie <A HREF="http://sourcelines.berlios.de/html/translating.php3">http://sourcelines.berlios.de/html/translating.php3</A>');
# --------------------------------------------------------

#
# Table structure for table `tblbranch`
#

DROP TABLE IF EXISTS tblbranch;
CREATE TABLE tblbranch (
  branch_id bigint(20) unsigned NOT NULL auto_increment,
  branch_name varchar(255) NOT NULL default '',
  branch_parent bigint(20) unsigned NOT NULL default '0',
  branch_deny tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (branch_id)
) TYPE=MyISAM;

#
# Dumping data for table `tblbranch`
#

INSERT INTO tblbranch VALUES (1, '', 0, '0');
INSERT INTO tblbranch VALUES (2, 'A Land- und Forstwirtschaft', 1, '0');
INSERT INTO tblbranch VALUES (3, 'AA Land- und Forstwirtschaft', 2, '0');
INSERT INTO tblbranch VALUES (4, '01 Landwirtschaft, gewerbliche Jagd', 3, '0');
INSERT INTO tblbranch VALUES (5, '01.1 Pflanzenbau', 4, '0');
INSERT INTO tblbranch VALUES (6, '01.11 Ackerbau', 5, '0');
INSERT INTO tblbranch VALUES (7, '01.11.1 Getreidebau', 6, '0');
INSERT INTO tblbranch VALUES (8, '01.11.2 Allgemeiner Ackerbau', 6, '0');
INSERT INTO tblbranch VALUES (9, '01.12 Gartenbau', 5, '0');
INSERT INTO tblbranch VALUES (10, '01.12.1 Gemüsebau', 9, '0');
INSERT INTO tblbranch VALUES (11, '01.12.2 Zierpflanzenbau', 9, '0');
INSERT INTO tblbranch VALUES (12, '01.12.3 Baumschulen', 9, '0');
INSERT INTO tblbranch VALUES (13, '01.12.4 Allgemeiner Gartenbau', 9, '0');
INSERT INTO tblbranch VALUES (14, '01.13 Dauerkulturbau', 5, '0');
INSERT INTO tblbranch VALUES (15, '01.13.1 Obstbau', 14, '0');
INSERT INTO tblbranch VALUES (16, '01.13.2 Weinbau', 14, '0');
INSERT INTO tblbranch VALUES (17, '01.13.3 Allgemeiner Dauerkulturbau', 14, '0');
INSERT INTO tblbranch VALUES (18, '01.2 Tierhaltung', 4, '0');
INSERT INTO tblbranch VALUES (19, '01.21 Haltung von Rindern', 18, '0');
INSERT INTO tblbranch VALUES (20, '01.21.1 Milchviehhaltung', 19, '0');
INSERT INTO tblbranch VALUES (21, '01.21.2 Gemischte Rindviehhaltung', 19, '0');
INSERT INTO tblbranch VALUES (22, '01.21.3 Gemischte Weideviehhaltung', 19, '0');
INSERT INTO tblbranch VALUES (23, '01.22 Haltung von Schafen, Ziegen, Pferden und Eseln', 18, '0');
INSERT INTO tblbranch VALUES (24, '01.22.1 Haltung von Schafen und Ziegen', 23, '0');
INSERT INTO tblbranch VALUES (25, '01.22.2 Haltung von Pferden und Eseln', 23, '0');
INSERT INTO tblbranch VALUES (26, '01.23 Haltung von Schweinen', 18, '0');
INSERT INTO tblbranch VALUES (27, '01.23.0 Haltung von Schweinen', 26, '0');
INSERT INTO tblbranch VALUES (28, '01.24 Haltung von Geflügel', 18, '0');
INSERT INTO tblbranch VALUES (29, '01.24.0 Haltung von Geflügel', 28, '0');
INSERT INTO tblbranch VALUES (30, '01.25 Sonstige Tierhaltung', 18, '0');
INSERT INTO tblbranch VALUES (31, '01.25.0 Sonstige Tierhaltung', 30, '0');
INSERT INTO tblbranch VALUES (32, '01.3 Gemischte Landwirtschaft', 4, '0');
INSERT INTO tblbranch VALUES (33, '01.30 Gemischte Landwirtschaft', 32, '0');
INSERT INTO tblbranch VALUES (34, '01.30.1 Gemischte Landwirtschaft ohne ausgeprägten Schwerpunkt', 33, '0');
INSERT INTO tblbranch VALUES (35, '01.30.2 Gemischte Landwirtschaft mit Schwerpunkt Pflanzenbau', 33, '0');
INSERT INTO tblbranch VALUES (36, '01.30.3 Gemischte Landwirtschaft mit Schwerpunkt Tierhaltung', 33, '0');
INSERT INTO tblbranch VALUES (37, '01.4 Erbringung von Dienstleistungen auf der landwirtschaftlichen Erzeugerstufe sowie von gärtnerischen Dienstleistungen', 4, '0');
INSERT INTO tblbranch VALUES (38, '01.41 Erbringung von Dienstleistungen auf der landwirtschaftlichen Erzeugerstufe im Pflanzenbau sowie von gärtnerischen Dienstleistungen', 37, '0');
INSERT INTO tblbranch VALUES (39, '01.41.1 Erbringung von Dienstleistungen auf der landwirtschaftlichen Erzeugerstufe im Pflanzenbau', 38, '0');
INSERT INTO tblbranch VALUES (40, '01.41.2 Garten- und Landschaftsbau', 38, '0');
INSERT INTO tblbranch VALUES (41, '01.41.3 Erbringung von gärtnerischen Dienstleistungen (ohne Garten- und Landschaftsbau)', 38, '0');
INSERT INTO tblbranch VALUES (42, '01.42 Erbringung von Dienstleistungen auf der landwirtschaftlichen Erzeugerstufe in der Tierhaltung', 37, '0');
INSERT INTO tblbranch VALUES (43, '01.42.0 Erbringung von Dienstleistungen auf der landwirtschaftlichen Erzeugerstufe in der Tierhaltung', 42, '0');
INSERT INTO tblbranch VALUES (44, '01.5 Gewerbliche Jagd', 4, '0');
INSERT INTO tblbranch VALUES (45, '01.50 Gewerbliche Jagd', 44, '0');
INSERT INTO tblbranch VALUES (46, '01.50.0 Gewerbliche Jagd', 45, '0');
INSERT INTO tblbranch VALUES (47, '02 Forstwirtschaft', 3, '0');
INSERT INTO tblbranch VALUES (48, '02.0 Forstwirtschaft', 47, '0');
INSERT INTO tblbranch VALUES (49, '02.01 Forstwirtschaft (ohne Erbringung von Dienstleistungen auf der forstwirtschaftlichen Erzeugerstufe)', 48, '0');
INSERT INTO tblbranch VALUES (50, '02.01.0 Forstwirtschaft (ohne Erbringung von Dienstleistungen auf der forstwirtschaftlichen Erzeugerstufe)', 49, '0');
INSERT INTO tblbranch VALUES (51, '02.02 Erbringung von Dienstleistungen auf der forstwirtschaftlichen Erzeugerstufe', 48, '0');
INSERT INTO tblbranch VALUES (52, '02.02.0 Erbringung von Dienstleistungen auf der forstwirtschaftlichen Erzeugerstufe', 51, '0');
INSERT INTO tblbranch VALUES (53, 'B Fischerei und Fischzucht', 1, '0');
INSERT INTO tblbranch VALUES (54, 'BA Fischerei und Fischzucht', 53, '0');
INSERT INTO tblbranch VALUES (55, '05 Fischerei und Fischzucht', 54, '0');
INSERT INTO tblbranch VALUES (56, '05.0 Fischerei und Fischzucht', 55, '0');
INSERT INTO tblbranch VALUES (57, '05.01 Fischerei', 56, '0');
INSERT INTO tblbranch VALUES (58, '05.01.1 Hochsee- und Küstenfischerei', 57, '0');
INSERT INTO tblbranch VALUES (59, '05.01.2 Fluss- und Seenfischerei', 57, '0');
INSERT INTO tblbranch VALUES (60, '05.02 Teichwirtschaft und Fischzucht', 56, '0');
INSERT INTO tblbranch VALUES (61, '05.02.0 Teichwirtschaft und Fischzucht', 60, '0');
INSERT INTO tblbranch VALUES (62, 'C Bergbau und Gewinnung von Steinen und Erden', 1, '0');
INSERT INTO tblbranch VALUES (63, 'CA Kohlenbergbau, Torfgewinnung, Gewinnung von Erdöl und Erdgas, Bergbau auf Uran- und Thoriumerze', 62, '0');
INSERT INTO tblbranch VALUES (64, '10 Kohlenbergbau, Torfgewinnung', 63, '0');
INSERT INTO tblbranch VALUES (65, '10.1 Steinkohlenbergbau und -brikettherstellung', 64, '0');
INSERT INTO tblbranch VALUES (66, '10.10 Steinkohlenbergbau und -brikettherstellung', 65, '0');
INSERT INTO tblbranch VALUES (67, '10.10.1 Steinkohlenbergbau', 66, '0');
INSERT INTO tblbranch VALUES (68, '10.10.2 Herstellung von Steinkohlenbriketts', 66, '0');
INSERT INTO tblbranch VALUES (69, '10.2 Braunkohlenbergbau und -brikettherstellung', 64, '0');
INSERT INTO tblbranch VALUES (70, '10.20 Braunkohlenbergbau und -brikettherstellung', 69, '0');
INSERT INTO tblbranch VALUES (71, '10.20.0 Braunkohlenbergbau und -brikettherstellung', 70, '0');
INSERT INTO tblbranch VALUES (72, '10.3 Torfgewinnung und -veredlung', 64, '0');
INSERT INTO tblbranch VALUES (73, '10.30 Torfgewinnung und -veredlung', 72, '0');
INSERT INTO tblbranch VALUES (74, '10.30.0 Torfgewinnung und -veredlung 11 Gewinnung von Erdöl und Erdgas, Erbringung damit verbundenerDienstleistungen', 73, '0');
INSERT INTO tblbranch VALUES (75, '11.1 Gewinnung von Erdöl und Erdgas', 64, '0');
INSERT INTO tblbranch VALUES (76, '11.10 Gewinnung von Erdöl und Erdgas', 75, '0');
INSERT INTO tblbranch VALUES (77, '11.10.0 Gewinnung von Erdöl und Erdgas', 76, '0');
INSERT INTO tblbranch VALUES (78, '11.2 Erbringung von Dienstleistungen bei der Gewinnung von Erdöl und Erdgas', 64, '0');
INSERT INTO tblbranch VALUES (79, '11.20 Erbringung von Dienstleistungen bei der Gewinnung von Erdöl und Erdgas', 78, '0');
INSERT INTO tblbranch VALUES (80, '11.20.0 Erbringung von Dienstleistungen bei der Gewinnung von Erdöl und Erdgas 12 Bergbau auf Uran- und Thoriumerze', 79, '0');
INSERT INTO tblbranch VALUES (81, '12.0 Bergbau auf Uran- und Thoriumerze', 64, '0');
INSERT INTO tblbranch VALUES (82, '12.00 Bergbau auf Uran- und Thoriumerze', 81, '0');
INSERT INTO tblbranch VALUES (83, '12.00.0 Bergbau auf Uran- und Thoriumerze', 82, '0');
INSERT INTO tblbranch VALUES (84, 'CB Erzbergbau, Gewinnung von Steinen und Erden, sonstiger Bergbau', 62, '0');
INSERT INTO tblbranch VALUES (85, '13 Erzbergbau', 84, '0');
INSERT INTO tblbranch VALUES (86, '13.1 Eisenerzbergbau', 85, '0');
INSERT INTO tblbranch VALUES (87, '13.10 Eisenerzbergbau', 86, '0');
INSERT INTO tblbranch VALUES (88, '13.10.0 Eisenerzbergbau', 87, '0');
INSERT INTO tblbranch VALUES (89, '13.2 NE-Metallerzbergbau (ohne Bergbau auf Uran- und Thoriumerze)', 85, '0');
INSERT INTO tblbranch VALUES (90, '13.20 NE-Metallerzbergbau (ohne Bergbau auf Uran- und Thoriumerze)', 89, '0');
INSERT INTO tblbranch VALUES (91, '13.20.0 NE-Metallerzbergbau (ohne Bergbau auf Uran- und Thoriumerze)', 90, '0');
INSERT INTO tblbranch VALUES (92, '14 Gewinnung von Steinen und Erden, sonstiger Bergbau', 84, '0');
INSERT INTO tblbranch VALUES (93, '14.1 Gewinnung von Natursteinen', 92, '0');
INSERT INTO tblbranch VALUES (94, '14.11 Gewinnung von Naturwerksteinen und Natursteinen a.n.g.', 93, '0');
INSERT INTO tblbranch VALUES (95, '14.11.1 Gewinnung von Naturwerksteinen a.n.g.', 94, '0');
INSERT INTO tblbranch VALUES (96, '14.11.2 Gewinnung von Natursteinen a.n.g.', 94, '0');
INSERT INTO tblbranch VALUES (97, '14.12 Gewinnung von Kalk-, Dolomit-, Gips- und Anhydritstein sowie Kreide', 93, '0');
INSERT INTO tblbranch VALUES (98, '14.12.1 Gewinnung von Kalkstein, Dolomitstein und Kreide', 97, '0');
INSERT INTO tblbranch VALUES (99, '14.12.2 Gewinnung von Gips- und Anhydritstein', 97, '0');
INSERT INTO tblbranch VALUES (100, '14.13 Gewinnung von Schiefer', 93, '0');
INSERT INTO tblbranch VALUES (101, '14.13.0 Gewinnung von Schiefer', 100, '0');
INSERT INTO tblbranch VALUES (102, '14.2 Gewinnung von Kies, Sand, Ton und Kaolin', 92, '0');
INSERT INTO tblbranch VALUES (103, '14.21 Gewinnung von Kies und Sand', 102, '0');
INSERT INTO tblbranch VALUES (104, '14.21.0 Gewinnung von Kies und Sand', 103, '0');
INSERT INTO tblbranch VALUES (105, '14.22 Gewinnung von Ton und Kaolin', 102, '0');
INSERT INTO tblbranch VALUES (106, '14.22.1 Gewinnung von Ton', 105, '0');
INSERT INTO tblbranch VALUES (107, '14.22.2 Gewinnung von Kaolin', 105, '0');
INSERT INTO tblbranch VALUES (108, '14.3 Bergbau auf chemische und Düngemittelminerale', 92, '0');
INSERT INTO tblbranch VALUES (109, '14.30 Bergbau auf chemische und Düngemittelminerale', 108, '0');
INSERT INTO tblbranch VALUES (110, '14.30.1 Kalibergbau', 109, '0');
INSERT INTO tblbranch VALUES (111, '14.30.2 Bergbau auf chemische und Düngemittelminerale a.n.g.', 109, '0');
INSERT INTO tblbranch VALUES (112, '14.4 Gewinnung von Salz', 92, '0');
INSERT INTO tblbranch VALUES (113, '14.40 Gewinnung von Salz', 112, '0');
INSERT INTO tblbranch VALUES (114, '14.40.0 Gewinnung von Salz', 113, '0');
INSERT INTO tblbranch VALUES (115, '14.5 Gewinnung von Steinen und Erden a.n.g., sonstiger Bergbau', 92, '0');
INSERT INTO tblbranch VALUES (116, '14.50 Gewinnung von Steinen und Erden a.n.g., sonstiger Bergbau', 115, '0');
INSERT INTO tblbranch VALUES (117, '14.50.0 Gewinnung von Steinen und Erden a.n.g., sonstiger Bergbau', 116, '0');
INSERT INTO tblbranch VALUES (118, 'D Verarbeitendes Gewerbe', 1, '0');
INSERT INTO tblbranch VALUES (119, 'DA Ernährungsgewerbe und Tabakverarbeitung', 118, '0');
INSERT INTO tblbranch VALUES (120, '15 Ernährungsgewerbe', 119, '0');
INSERT INTO tblbranch VALUES (121, '15.1 Schlachten und Fleischverarbeitung', 120, '0');
INSERT INTO tblbranch VALUES (122, '15.11 Schlachten (ohne Schlachten von Geflügel)', 121, '0');
INSERT INTO tblbranch VALUES (123, '15.11.1 Schlachten (ohne Schlachten von Geflügel, Talgschmelzen und Schmalzsiedereien)', 122, '0');
INSERT INTO tblbranch VALUES (124, '15.11.2 Talgschmelzen und Schmalzsiedereien', 122, '0');
INSERT INTO tblbranch VALUES (125, '15.12 Schlachten von Geflügel', 121, '0');
INSERT INTO tblbranch VALUES (126, '15.12.0 Schlachten von Geflügel', 125, '0');
INSERT INTO tblbranch VALUES (127, '15.13 Fleischverarbeitung', 121, '0');
INSERT INTO tblbranch VALUES (128, '15.13.0 Fleischverarbeitung', 127, '0');
INSERT INTO tblbranch VALUES (129, '15.2 Fischverarbeitung', 120, '0');
INSERT INTO tblbranch VALUES (130, '15.20 Fischverarbeitung', 129, '0');
INSERT INTO tblbranch VALUES (131, '15.20.0 Fischverarbeitung', 130, '0');
INSERT INTO tblbranch VALUES (132, '15.3 Obst- und Gemüseverarbeitung', 120, '0');
INSERT INTO tblbranch VALUES (133, '15.31 Verarbeitung von Kartoffeln', 132, '0');
INSERT INTO tblbranch VALUES (134, '15.31.0 Verarbeitung von Kartoffeln', 133, '0');
INSERT INTO tblbranch VALUES (135, '15.32 Herstellung von Frucht- und Gemüsesäften', 132, '0');
INSERT INTO tblbranch VALUES (136, '15.32.0 Herstellung von Frucht- und Gemüsesäften', 135, '0');
INSERT INTO tblbranch VALUES (137, '15.33 Verarbeitung von Obst und Gemüse a.n.g.', 132, '0');
INSERT INTO tblbranch VALUES (138, '15.33.1 Herstellung von Obst- und Gemüsekonserven', 137, '0');
INSERT INTO tblbranch VALUES (139, '15.33.2 Herstellung von Sauerkonserven', 137, '0');
INSERT INTO tblbranch VALUES (140, '15.33.3 Herstellung von Konfitüren und von Brotaufstrichen auf Fruchtbasis', 137, '0');
INSERT INTO tblbranch VALUES (141, '15.4 Herstellung von pflanzlichen und tierischen Ölen und Fetten', 120, '0');
INSERT INTO tblbranch VALUES (142, '15.41 Herstellung von rohen Ölen und Fetten', 141, '0');
INSERT INTO tblbranch VALUES (143, '15.41.0 Herstellung von rohen Ölen und Fetten', 142, '0');
INSERT INTO tblbranch VALUES (144, '15.42 Herstellung von raffinierten Ölen und Fetten', 141, '0');
INSERT INTO tblbranch VALUES (145, '15.42.0 Herstellung von raffinierten Ölen und Fetten', 144, '0');
INSERT INTO tblbranch VALUES (146, '15.43 Herstellung von Margarine u.ä. Nahrungsfetten', 141, '0');
INSERT INTO tblbranch VALUES (147, '15.43.0 Herstellung von Margarine u.ä. Nahrungsfetten', 146, '0');
INSERT INTO tblbranch VALUES (148, '15.5 Milchverarbeitung', 120, '0');
INSERT INTO tblbranch VALUES (149, '15.51 Milchverarbeitung (ohne Herstellung von Speiseeis)', 148, '0');
INSERT INTO tblbranch VALUES (150, '15.51.0 Milchverarbeitung (ohne Herstellung von Speiseeis)', 149, '0');
INSERT INTO tblbranch VALUES (151, '15.52 Herstellung von Speiseeis', 148, '0');
INSERT INTO tblbranch VALUES (152, '15.52.0 Herstellung von Speiseeis', 151, '0');
INSERT INTO tblbranch VALUES (153, '15.6 Mahl- und Schälmühlen, Herstellung von Stärke und Stärkeerzeugnissen', 120, '0');
INSERT INTO tblbranch VALUES (154, '15.61 Mahl- und Schälmühlen', 153, '0');
INSERT INTO tblbranch VALUES (155, '15.61.1 Mahlmühlen', 154, '0');
INSERT INTO tblbranch VALUES (156, '15.61.2 Schälmühlen', 154, '0');
INSERT INTO tblbranch VALUES (157, '15.62 Herstellung von Stärke und Stärkeerzeugnissen', 153, '0');
INSERT INTO tblbranch VALUES (158, '15.62.0 Herstellung von Stärke und Stärkeerzeugnissen', 157, '0');
INSERT INTO tblbranch VALUES (159, '15.7 Herstellung von Futtermitteln', 120, '0');
INSERT INTO tblbranch VALUES (160, '15.71 Herstellung von Futtermitteln für Nutztiere', 159, '0');
INSERT INTO tblbranch VALUES (161, '15.71.0 Herstellung von Futtermitteln für Nutztiere', 160, '0');
INSERT INTO tblbranch VALUES (162, '15.72 Herstellung von Futtermitteln für sonstige Tiere', 159, '0');
INSERT INTO tblbranch VALUES (163, '15.72.0 Herstellung von Futtermitteln für sonstige Tiere', 162, '0');
INSERT INTO tblbranch VALUES (164, '15.8 Sonstiges Ernährungsgewerbe (ohne Getränkeherstellung)', 120, '0');
INSERT INTO tblbranch VALUES (165, '15.81 Herstellung von Backwaren (ohne Dauerbackwaren)', 164, '0');
INSERT INTO tblbranch VALUES (166, '15.81.1 Herstellung von Backwaren (ohne Konditor- und Dauerbackwaren)', 165, '0');
INSERT INTO tblbranch VALUES (167, '15.81.2 Herstellung von Konditorwaren', 165, '0');
INSERT INTO tblbranch VALUES (168, '15.82 Herstellung von Dauerbackwaren', 164, '0');
INSERT INTO tblbranch VALUES (169, '15.82.0 Herstellung von Dauerbackwaren', 168, '0');
INSERT INTO tblbranch VALUES (170, '15.83 Zuckerindustrie', 164, '0');
INSERT INTO tblbranch VALUES (171, '15.83.0 Zuckerindustrie', 170, '0');
INSERT INTO tblbranch VALUES (172, '15.84 Herstellung von Süsswaren (ohne Dauerbackwaren)', 164, '0');
INSERT INTO tblbranch VALUES (173, '15.84.0 Herstellung von Süsswaren (ohne Dauerbackwaren)', 172, '0');
INSERT INTO tblbranch VALUES (174, '15.85 Herstellung von Teigwaren', 164, '0');
INSERT INTO tblbranch VALUES (175, '15.85.0 Herstellung von Teigwaren', 174, '0');
INSERT INTO tblbranch VALUES (176, '15.86 Verarbeitung von Kaffee und Tee, Herstellung von Kaffee-Ersatz', 164, '0');
INSERT INTO tblbranch VALUES (177, '15.86.1 Verarbeitung von Kaffee und Tee', 176, '0');
INSERT INTO tblbranch VALUES (178, '15.86.2 Herstellung von Kaffee-Ersatz', 176, '0');
INSERT INTO tblbranch VALUES (179, '15.87 Herstellung von Würzen und Sossen', 164, '0');
INSERT INTO tblbranch VALUES (180, '15.87.0 Herstellung von Würzen und Sossen', 179, '0');
INSERT INTO tblbranch VALUES (181, '15.88 Herstellung von homogenisierten und diätetischen Nahrungsmitteln', 164, '0');
INSERT INTO tblbranch VALUES (182, '15.88.0 Herstellung von homogenisierten und diätetischen Nahrungsmitteln', 181, '0');
INSERT INTO tblbranch VALUES (183, '15.89 Herstellung von sonstigen Nahrungsmitteln (ohne Getränke)', 164, '0');
INSERT INTO tblbranch VALUES (184, '15.89.1 Herstellung von Backmitteln', 183, '0');
INSERT INTO tblbranch VALUES (185, '15.89.2 Herstellung von Nahrungsmitteln a.n.g. (ohne Getränke)', 183, '0');
INSERT INTO tblbranch VALUES (186, '15.9 Getränkeherstellung', 120, '0');
INSERT INTO tblbranch VALUES (187, '15.91 Herstellung von Spirituosen', 186, '0');
INSERT INTO tblbranch VALUES (188, '15.91.0 Herstellung von Spirituosen', 187, '0');
INSERT INTO tblbranch VALUES (189, '15.92 Alkoholbrennerei', 186, '0');
INSERT INTO tblbranch VALUES (190, '15.92.0 Alkoholbrennerei', 189, '0');
INSERT INTO tblbranch VALUES (191, '15.93 Herstellung von Wein aus frischen Trauben', 186, '0');
INSERT INTO tblbranch VALUES (192, '15.93.0 Herstellung von Wein aus frischen Trauben', 191, '0');
INSERT INTO tblbranch VALUES (193, '15.94 Herstellung von Apfelwein und sonstigen Fruchtweinen', 186, '0');
INSERT INTO tblbranch VALUES (194, '15.94.0 Herstellung von Apfelwein und sonstigen Fruchtweinen', 193, '0');
INSERT INTO tblbranch VALUES (195, '15.95 Herstellung von Wermutwein und sonstigen aromatisierten Weinen', 186, '0');
INSERT INTO tblbranch VALUES (196, '15.95.0 Herstellung von Wermutwein und sonstigen aromatisierten Weinen', 195, '0');
INSERT INTO tblbranch VALUES (197, '15.96 Herstellung von Bier', 186, '0');
INSERT INTO tblbranch VALUES (198, '15.96.0 Herstellung von Bier', 197, '0');
INSERT INTO tblbranch VALUES (199, '15.97 Herstellung von Malz', 186, '0');
INSERT INTO tblbranch VALUES (200, '15.97.0 Herstellung von Malz', 199, '0');
INSERT INTO tblbranch VALUES (201, '15.98 Mineralbrunnen, Herstellung von Erfrischungsgetränken', 186, '0');
INSERT INTO tblbranch VALUES (202, '15.98.0 Mineralbrunnen, Herstellung von Erfrischungsgetränken', 201, '0');
INSERT INTO tblbranch VALUES (203, '16 Tabakverarbeitung', 119, '0');
INSERT INTO tblbranch VALUES (204, '16.0 Tabakverarbeitung', 203, '0');
INSERT INTO tblbranch VALUES (205, '16.00 Tabakverarbeitung', 204, '0');
INSERT INTO tblbranch VALUES (206, '16.00.1 Tabakverarbeitung (ohne Herstellung von Zigaretten)', 205, '0');
INSERT INTO tblbranch VALUES (207, '16.00.2 Herstellung von Zigaretten', 205, '0');
INSERT INTO tblbranch VALUES (208, 'DB Textil- und Bekleidungsgewerbe', 118, '0');
INSERT INTO tblbranch VALUES (209, '17 Textilgewerbe', 208, '0');
INSERT INTO tblbranch VALUES (210, '17.1 Spinnstoffaufbereitung und Spinnerei', 209, '0');
INSERT INTO tblbranch VALUES (211, '17.11 Baumwollaufbereitung und -spinnerei', 210, '0');
INSERT INTO tblbranch VALUES (212, '17.11.0 Baumwollaufbereitung und -spinnerei', 211, '0');
INSERT INTO tblbranch VALUES (213, '17.12 Wollaufbereitung und Streichgarnspinnerei', 210, '0');
INSERT INTO tblbranch VALUES (214, '17.12.0 Wollaufbereitung und Streichgarnspinnerei', 213, '0');
INSERT INTO tblbranch VALUES (215, '17.13 Wollaufbereitung und Kammgarnspinnerei', 210, '0');
INSERT INTO tblbranch VALUES (216, '17.13.0 Wollaufbereitung und Kammgarnspinnerei', 215, '0');
INSERT INTO tblbranch VALUES (217, '17.14 Flachsaufbereitung und -spinnerei', 210, '0');
INSERT INTO tblbranch VALUES (218, '17.14.0 Flachsaufbereitung und -spinnerei', 217, '0');
INSERT INTO tblbranch VALUES (219, '17.15 Zwirnen und Texturieren von Filamentgarnen, Seidenaufbereitung und -spinnerei', 210, '0');
INSERT INTO tblbranch VALUES (220, '17.15.0 Zwirnen und Texturieren von Filamentgarnen, Seidenaufbereitung und - spinnerei', 219, '0');
INSERT INTO tblbranch VALUES (221, '17.16 Nähgarnfertigung', 210, '0');
INSERT INTO tblbranch VALUES (222, '17.16.0 Nähgarnfertigung', 221, '0');
INSERT INTO tblbranch VALUES (223, '17.17 Sonstige Spinnstoffaufbereitung und Spinnerei', 210, '0');
INSERT INTO tblbranch VALUES (224, '17.17.0 Sonstige Spinnstoffaufbereitung und Spinnerei', 223, '0');
INSERT INTO tblbranch VALUES (225, '17.2 Weberei', 209, '0');
INSERT INTO tblbranch VALUES (226, '17.21 Baumwollweberei', 225, '0');
INSERT INTO tblbranch VALUES (227, '17.21.1 Baumwollweberei (ohne Möbel-, Dekorationsstoff- und Gardinenstoffweberei)', 226, '0');
INSERT INTO tblbranch VALUES (228, '17.21.2 Möbel- und Dekorationsstoffweberei', 226, '0');
INSERT INTO tblbranch VALUES (229, '17.21.3 Gardinenstoffweberei', 226, '0');
INSERT INTO tblbranch VALUES (230, '17.22 Streichgarnweberei', 225, '0');
INSERT INTO tblbranch VALUES (231, '17.22.0 Streichgarnweberei', 230, '0');
INSERT INTO tblbranch VALUES (232, '17.23 Kammgarnweberei', 225, '0');
INSERT INTO tblbranch VALUES (233, '17.23.0 Kammgarnweberei', 232, '0');
INSERT INTO tblbranch VALUES (234, '17.24 Seiden- und Filamentgarnweberei', 225, '0');
INSERT INTO tblbranch VALUES (235, '17.24.0 Seiden- und Filamentgarnweberei', 234, '0');
INSERT INTO tblbranch VALUES (236, '17.25 Sonstige Weberei', 225, '0');
INSERT INTO tblbranch VALUES (237, '17.25.0 Sonstige Weberei', 236, '0');
INSERT INTO tblbranch VALUES (238, '17.3 Textilveredlung', 209, '0');
INSERT INTO tblbranch VALUES (239, '17.30 Textilveredlung', 238, '0');
INSERT INTO tblbranch VALUES (240, '17.30.0 Textilveredlung', 239, '0');
INSERT INTO tblbranch VALUES (241, '17.4 Herstellung von konfektionierten Textilwaren (ohne Bekleidung)', 209, '0');
INSERT INTO tblbranch VALUES (242, '17.40 Herstellung von konfektionierten Textilwaren (ohne Bekleidung)', 241, '0');
INSERT INTO tblbranch VALUES (243, '17.40.1 Herstellung von Haus-, Bett- und Tischwäsche', 242, '0');
INSERT INTO tblbranch VALUES (244, '17.40.2 Herstellung von Bettwaren (ohne Matratzen)', 242, '0');
INSERT INTO tblbranch VALUES (245, '17.40.3 Herstellung von konfektionierten textilen Artikeln für die Innenausstattung', 242, '0');
INSERT INTO tblbranch VALUES (246, '17.40.4 Herstellung von sonstigen konfektionierten textilen Artikeln a.n.g.', 242, '0');
INSERT INTO tblbranch VALUES (247, '17.5 Sonstiges Textilgewerbe (ohne Herstellung von Maschenware)', 209, '0');
INSERT INTO tblbranch VALUES (248, '17.51 Herstellung von Teppichen', 247, '0');
INSERT INTO tblbranch VALUES (249, '17.51.0 Herstellung von Teppichen', 248, '0');
INSERT INTO tblbranch VALUES (250, '17.52 Herstellung von Seilerwaren', 247, '0');
INSERT INTO tblbranch VALUES (251, '17.52.0 Herstellung von Seilerwaren', 250, '0');
INSERT INTO tblbranch VALUES (252, '17.53 Herstellung von Vliesstoff und Erzeugnissen daraus (ohne Bekleidung)', 247, '0');
INSERT INTO tblbranch VALUES (253, '17.53.0 Herstellung von Vliesstoff und Erzeugnissen daraus (ohne Bekleidung)', 252, '0');
INSERT INTO tblbranch VALUES (254, '17.54 Textilgewerbe a.n.g.', 247, '0');
INSERT INTO tblbranch VALUES (255, '17.54.1 Bandweberei und -flechterei', 254, '0');
INSERT INTO tblbranch VALUES (256, '17.54.2 Sonstiges Textilgewerbe a.n.g.', 254, '0');
INSERT INTO tblbranch VALUES (257, '17.6 Herstellung von gewirktem und gestricktem Stoff', 209, '0');
INSERT INTO tblbranch VALUES (258, '17.60 Herstellung von gewirktem und gestricktem Stoff', 257, '0');
INSERT INTO tblbranch VALUES (259, '17.60.1 Herstellung von gewirktem und gestricktem Stoff (ohne Gardinenstoff)', 258, '0');
INSERT INTO tblbranch VALUES (260, '17.60.2 Herstellung von gewirktem Gardinenstoff', 258, '0');
INSERT INTO tblbranch VALUES (261, '17.7 Herstellung von gewirkten und gestrickten Fertigerzeugnissen', 209, '0');
INSERT INTO tblbranch VALUES (262, '17.71 Herstellung von Strumpfwaren', 261, '0');
INSERT INTO tblbranch VALUES (263, '17.71.0 Herstellung von Strumpfwaren', 262, '0');
INSERT INTO tblbranch VALUES (264, '17.72 Herstellung von Pullovern, Strickjacken u.ä.', 261, '0');
INSERT INTO tblbranch VALUES (265, '17.72.0 Herstellung von Pullovern, Strickjacken u.ä. 18 Bekleidungsgewerbe', 264, '0');
INSERT INTO tblbranch VALUES (266, '18.1 Herstellung von Lederbekleidung', 209, '0');
INSERT INTO tblbranch VALUES (267, '18.10 Herstellung von Lederbekleidung', 266, '0');
INSERT INTO tblbranch VALUES (268, '18.10.0 Herstellung von Lederbekleidung', 267, '0');
INSERT INTO tblbranch VALUES (269, '18.2 Herstellung von Bekleidung (ohne Lederbekleidung)', 209, '0');
INSERT INTO tblbranch VALUES (270, '18.21 Herstellung von Arbeits- und Berufsbekleidung', 269, '0');
INSERT INTO tblbranch VALUES (271, '18.21.0 Herstellung von Arbeits- und Berufsbekleidung', 270, '0');
INSERT INTO tblbranch VALUES (272, '18.22 Herstellung von Oberbekleidung (ohne Arbeits- und Berufsbekleidung)', 269, '0');
INSERT INTO tblbranch VALUES (273, '18.22.1 Herstellung von gewebter Oberbekleidung für Herren und Knaben', 272, '0');
INSERT INTO tblbranch VALUES (274, '18.22.2 Herstellung von gewebter Oberbekleidung für Damen und Mädchen', 272, '0');
INSERT INTO tblbranch VALUES (275, '18.22.3 Herstellung von gewirkter und gestrickter Oberbekleidung', 272, '0');
INSERT INTO tblbranch VALUES (276, '18.23 Herstellung von Wäsche', 269, '0');
INSERT INTO tblbranch VALUES (277, '18.23.1 Herstellung von gewebter Wäsche (ohne Miederwaren)', 276, '0');
INSERT INTO tblbranch VALUES (278, '18.23.2 Herstellung von gewirkter und gestrickter Wäsche (ohne Miederwaren)', 276, '0');
INSERT INTO tblbranch VALUES (279, '18.23.3 Herstellung von Miederwaren', 276, '0');
INSERT INTO tblbranch VALUES (280, '18.24 Herstellung von sonstiger Bekleidung und Bekleidungszubehör', 269, '0');
INSERT INTO tblbranch VALUES (281, '18.24.1 Herstellung von Sportbekleidung', 280, '0');
INSERT INTO tblbranch VALUES (282, '18.24.2 Herstellung von Hüten und sonstigen Kopfbedeckungen', 280, '0');
INSERT INTO tblbranch VALUES (283, '18.24.3 Herstellung von Bekleidung und Bekleidungszubehör für Kleinkinder', 280, '0');
INSERT INTO tblbranch VALUES (284, '18.24.4 Herstellung von sonstigen gewirkten und gestrickten Fertigerzeugnissen', 280, '0');
INSERT INTO tblbranch VALUES (285, '18.24.5 Herstellung von Bekleidungszubehör a.n.g.', 280, '0');
INSERT INTO tblbranch VALUES (286, '18.24.6 Mit dem Bekleidungsgewerbe verbundene Tätigkeiten', 280, '0');
INSERT INTO tblbranch VALUES (287, '18.3 Zurichtung und Färben von Fellen, Herstellung von Pelzwaren', 209, '0');
INSERT INTO tblbranch VALUES (288, '18.30 Zurichtung und Färben von Fellen, Herstellung von Pelzwaren', 287, '0');
INSERT INTO tblbranch VALUES (289, '18.30.0 Zurichtung und Färben von Fellen, Herstellung von Pelzwaren', 288, '0');
INSERT INTO tblbranch VALUES (290, 'DC Ledergewerbe', 118, '0');
INSERT INTO tblbranch VALUES (291, '19 Ledergewerbe', 290, '0');
INSERT INTO tblbranch VALUES (292, '19.1 Ledererzeugung', 291, '0');
INSERT INTO tblbranch VALUES (293, '19.10 Ledererzeugung', 292, '0');
INSERT INTO tblbranch VALUES (294, '19.10.0 Ledererzeugung', 293, '0');
INSERT INTO tblbranch VALUES (295, '19.2 Lederverarbeitung (ohne Herstellung von Lederbekleidung und Schuhen)', 291, '0');
INSERT INTO tblbranch VALUES (296, '19.20 Lederverarbeitung (ohne Herstellung von Lederbekleidung und Schuhen)', 295, '0');
INSERT INTO tblbranch VALUES (297, '19.20.0 Lederverarbeitung (ohne Herstellung von Lederbekleidung und Schuhen)', 296, '0');
INSERT INTO tblbranch VALUES (298, '19.3 Herstellung von Schuhen', 291, '0');
INSERT INTO tblbranch VALUES (299, '19.30 Herstellung von Schuhen', 298, '0');
INSERT INTO tblbranch VALUES (300, '19.30.0 Herstellung von Schuhen', 299, '0');
INSERT INTO tblbranch VALUES (301, 'DD Holzgewerbe (ohne Herstellung von Möbeln)', 118, '0');
INSERT INTO tblbranch VALUES (302, '20 Holzgewerbe (ohne Herstellung von Möbeln)', 301, '0');
INSERT INTO tblbranch VALUES (303, '20.1 Säge-, Hobel- und Holzimprägnierwerke', 302, '0');
INSERT INTO tblbranch VALUES (304, '20.10 Säge-, Hobel- und Holzimprägnierwerke', 303, '0');
INSERT INTO tblbranch VALUES (305, '20.10.0 Säge-, Hobel- und Holzimprägnierwerke', 304, '0');
INSERT INTO tblbranch VALUES (306, '20.2 Furnier-, Sperrholz-, Holzfaserplatten- und Holzspanplattenwerke', 302, '0');
INSERT INTO tblbranch VALUES (307, '20.20 Furnier-, Sperrholz-, Holzfaserplatten- und Holzspanplattenwerke', 306, '0');
INSERT INTO tblbranch VALUES (308, '20.20.1 Furnier-, Sperrholz- und Holzfaserplattenwerke', 307, '0');
INSERT INTO tblbranch VALUES (309, '20.20.2 Holzspanplattenwerke', 307, '0');
INSERT INTO tblbranch VALUES (310, '20.3 Herstellung von Konstruktionsteilen, Fertigbauteilen, Ausbauelementen und Fertigteilbauten aus Holz', 302, '0');
INSERT INTO tblbranch VALUES (311, '20.30 Herstellung von Konstruktionsteilen, Fertigbauteilen, Ausbauelementen und Fertigteilbauten aus Holz', 310, '0');
INSERT INTO tblbranch VALUES (312, '20.30.1 Herstellung von Konstruktionsteilen, Fertigbauteilen und Ausbauelementen aus Holz', 311, '0');
INSERT INTO tblbranch VALUES (313, '20.30.2 Herstellung von Bausätzen für Fertigteilbauten aus Holz im Hochbau sowie von Fertigteilbauten daraus', 311, '0');
INSERT INTO tblbranch VALUES (314, '20.4 Herstellung von Verpackungsmitteln und Lagerbehältern aus Holz', 302, '0');
INSERT INTO tblbranch VALUES (315, '20.40 Herstellung von Verpackungsmitteln und Lagerbehältern aus Holz', 314, '0');
INSERT INTO tblbranch VALUES (316, '20.40.0 Herstellung von Verpackungsmitteln und Lagerbehältern aus Holz', 315, '0');
INSERT INTO tblbranch VALUES (317, '20.5 Herstellung von Holzwaren a.n.g. sowie von Kork-, Flecht- und Korbwaren', 302, '0');
INSERT INTO tblbranch VALUES (318, '20.51 Herstellung von Holzwaren a.n.g., Veredlung von Holzwaren', 317, '0');
INSERT INTO tblbranch VALUES (319, '20.51.0 Herstellung von Holzwaren a.n.g., Veredlung von Holzwaren', 318, '0');
INSERT INTO tblbranch VALUES (320, '20.52 Herstellung von Kork-, Flecht- und Korbwaren', 317, '0');
INSERT INTO tblbranch VALUES (321, '20.52.0 Herstellung von Kork-, Flecht- und Korbwaren', 320, '0');
INSERT INTO tblbranch VALUES (322, 'DE Papier-, Verlags- und Druckgewerbe', 118, '0');
INSERT INTO tblbranch VALUES (323, '21 Papiergewerbe', 322, '0');
INSERT INTO tblbranch VALUES (324, '21.1 Herstellung von Holzstoff, Zellstoff, Papier, Karton und Pappe', 323, '0');
INSERT INTO tblbranch VALUES (325, '21.11 Herstellung von Holzstoff und Zellstoff', 324, '0');
INSERT INTO tblbranch VALUES (326, '21.11.0 Herstellung von Holzstoff und Zellstoff', 325, '0');
INSERT INTO tblbranch VALUES (327, '21.12 Herstellung von Papier, Karton und Pappe', 324, '0');
INSERT INTO tblbranch VALUES (328, '21.12.0 Herstellung von Papier, Karton und Pappe', 327, '0');
INSERT INTO tblbranch VALUES (329, '21.2 Papier-, Karton- und Pappeverarbeitung', 323, '0');
INSERT INTO tblbranch VALUES (330, '21.21 Herstellung von Wellpapier und -pappe sowie von Verpackungsmitteln aus Papier, Karton und Pappe', 329, '0');
INSERT INTO tblbranch VALUES (331, '21.21.0 Herstellung von Wellpapier und -pappe sowie von Verpackungsmitteln aus Papier, Karton und Pappe', 330, '0');
INSERT INTO tblbranch VALUES (332, '21.22 Herstellung von Haushalts-, Hygiene- und Toilettenartikeln aus Zellstoff und Papier', 329, '0');
INSERT INTO tblbranch VALUES (333, '21.22.0 Herstellung von Haushalts-, Hygiene- und Toilettenartikeln aus Zellstoff und Papier', 332, '0');
INSERT INTO tblbranch VALUES (334, '21.23 Herstellung von Schreibwaren und Bürobedarf aus Papier, Karton und Pappe', 329, '0');
INSERT INTO tblbranch VALUES (335, '21.23.0 Herstellung von Schreibwaren und Bürobedarf aus Papier, Karton und Pappe', 334, '0');
INSERT INTO tblbranch VALUES (336, '21.24 Herstellung von Tapeten', 329, '0');
INSERT INTO tblbranch VALUES (337, '21.24.0 Herstellung von Tapeten', 336, '0');
INSERT INTO tblbranch VALUES (338, '21.25 Herstellung von sonstigen Waren aus Papier, Karton und Pappe', 329, '0');
INSERT INTO tblbranch VALUES (339, '21.25.0 Herstellung von sonstigen Waren aus Papier, Karton und Pappe', 338, '0');
INSERT INTO tblbranch VALUES (340, '22 Verlagsgewerbe, Druckgewerbe, Vervielfältigung von bespielten Ton-, Bild- und Datenträgern', 322, '0');
INSERT INTO tblbranch VALUES (341, '22.1 Verlagsgewerbe', 340, '0');
INSERT INTO tblbranch VALUES (342, '22.11 Buchverlag und Musikverlag', 341, '0');
INSERT INTO tblbranch VALUES (343, '22.11.1 Buchverlag (ohne Adressbuchverlag)', 342, '0');
INSERT INTO tblbranch VALUES (344, '22.11.2 Adressbuchverlag', 342, '0');
INSERT INTO tblbranch VALUES (345, '22.11.3 Musikverlag', 342, '0');
INSERT INTO tblbranch VALUES (346, '22.12 Zeitungsverlag', 341, '0');
INSERT INTO tblbranch VALUES (347, '22.12.1 Verlag von Tageszeitungen', 346, '0');
INSERT INTO tblbranch VALUES (348, '22.12.2 Verlag von Wochen- und Sonntagszeitungen', 346, '0');
INSERT INTO tblbranch VALUES (349, '22.13 Zeitschriftenverlag', 341, '0');
INSERT INTO tblbranch VALUES (350, '22.13.1 Verlag von Fachzeitschriften', 349, '0');
INSERT INTO tblbranch VALUES (351, '22.13.2 Verlag von allgemeinen Zeitschriften', 349, '0');
INSERT INTO tblbranch VALUES (352, '22.13.3 Verlag von sonstigen Zeitschriften', 349, '0');
INSERT INTO tblbranch VALUES (353, '22.14 Verlag von bespielten Tonträgern', 341, '0');
INSERT INTO tblbranch VALUES (354, '22.14.0 Verlag von bespielten Tonträgern', 353, '0');
INSERT INTO tblbranch VALUES (355, '22.15 Sonstiges Verlagsgewerbe', 341, '0');
INSERT INTO tblbranch VALUES (356, '22.15.0 Sonstiges Verlagsgewerbe', 355, '0');
INSERT INTO tblbranch VALUES (357, '22.2 Druckgewerbe', 340, '0');
INSERT INTO tblbranch VALUES (358, '22.21 Zeitungsdruckerei', 357, '0');
INSERT INTO tblbranch VALUES (359, '22.21.0 Zeitungsdruckerei', 358, '0');
INSERT INTO tblbranch VALUES (360, '22.22 Druckerei (ohne Zeitungsdruckerei)', 357, '0');
INSERT INTO tblbranch VALUES (361, '22.22.0 Druckerei (ohne Zeitungsdruckerei)', 360, '0');
INSERT INTO tblbranch VALUES (362, '22.23 Druckweiterverarbeitung', 357, '0');
INSERT INTO tblbranch VALUES (363, '22.23.0 Druckweiterverarbeitung', 362, '0');
INSERT INTO tblbranch VALUES (364, '22.24 Satzherstellung und Reproduktion', 357, '0');
INSERT INTO tblbranch VALUES (365, '22.24.0 Satzherstellung und Reproduktion', 364, '0');
INSERT INTO tblbranch VALUES (366, '22.25 Sonstiges Druckgewerbe', 357, '0');
INSERT INTO tblbranch VALUES (367, '22.25.0 Sonstiges Druckgewerbe', 366, '0');
INSERT INTO tblbranch VALUES (368, '22.3 Vervielfältigung von bespielten Ton-, Bild- und Datenträgern', 340, '0');
INSERT INTO tblbranch VALUES (369, '22.31 Vervielfältigung von bespielten Tonträgern', 368, '0');
INSERT INTO tblbranch VALUES (370, '22.31.0 Vervielfältigung von bespielten Tonträgern', 369, '0');
INSERT INTO tblbranch VALUES (371, '22.32 Vervielfältigung von bespielten Bildträgern', 368, '0');
INSERT INTO tblbranch VALUES (372, '22.32.0 Vervielfältigung von bespielten Bildträgern', 371, '0');
INSERT INTO tblbranch VALUES (373, '22.33 Vervielfältigung von bespielten Datenträgern', 368, '0');
INSERT INTO tblbranch VALUES (374, '22.33.0 Vervielfältigung von bespielten Datenträgern', 373, '0');
INSERT INTO tblbranch VALUES (375, 'DF Kokerei, Mineralölverarbeitung, Herstellung und Verarbeitung von Spalt- und Brutstoffen', 118, '0');
INSERT INTO tblbranch VALUES (376, '23 Kokerei, Mineralölverarbeitung, Herstellung und Verarbeitung von Spalt- und Brutstoffen', 375, '0');
INSERT INTO tblbranch VALUES (377, '23.1 Kokerei', 376, '0');
INSERT INTO tblbranch VALUES (378, '23.10 Kokerei', 377, '0');
INSERT INTO tblbranch VALUES (379, '23.10.1 Herstellung von Steinkohlenkoks', 378, '0');
INSERT INTO tblbranch VALUES (380, '23.10.2 Herstellung von Braunkohlenkoks', 378, '0');
INSERT INTO tblbranch VALUES (381, '23.2 Mineralölverarbeitung', 376, '0');
INSERT INTO tblbranch VALUES (382, '23.20 Mineralölverarbeitung', 381, '0');
INSERT INTO tblbranch VALUES (383, '23.20.0 Mineralölverarbeitung', 382, '0');
INSERT INTO tblbranch VALUES (384, '23.3 Herstellung und Verarbeitung von Spalt- und Brutstoffen', 376, '0');
INSERT INTO tblbranch VALUES (385, '23.30 Herstellung und Verarbeitung von Spalt- und Brutstoffen', 384, '0');
INSERT INTO tblbranch VALUES (386, '23.30.0 Herstellung und Verarbeitung von Spalt- und Brutstoffen', 385, '0');
INSERT INTO tblbranch VALUES (387, 'DG Chemische Industrie', 118, '0');
INSERT INTO tblbranch VALUES (388, '24 Chemische Industrie', 387, '0');
INSERT INTO tblbranch VALUES (389, '24.1 Herstellung von chemischen Grundstoffen', 388, '0');
INSERT INTO tblbranch VALUES (390, '24.11 Herstellung von Industriegasen', 389, '0');
INSERT INTO tblbranch VALUES (391, '24.11.0 Herstellung von Industriegasen', 390, '0');
INSERT INTO tblbranch VALUES (392, '24.12 Herstellung von Farbstoffen und Pigmenten', 389, '0');
INSERT INTO tblbranch VALUES (393, '24.12.0 Herstellung von Farbstoffen und Pigmenten', 392, '0');
INSERT INTO tblbranch VALUES (394, '24.13 Herstellung von sonstigen anorganischen Grundstoffen und Chemikalien', 389, '0');
INSERT INTO tblbranch VALUES (395, '24.13.0 Herstellung von sonstigen anorganischen Grundstoffen und Chemikalien', 394, '0');
INSERT INTO tblbranch VALUES (396, '24.14 Herstellung von sonstigen organischen Grundstoffen und Chemikalien', 389, '0');
INSERT INTO tblbranch VALUES (397, '24.14.0 Herstellung von sonstigen organischen Grundstoffen und Chemikalien', 396, '0');
INSERT INTO tblbranch VALUES (398, '24.15 Herstellung von Düngemitteln und Stickstoffverbindungen', 389, '0');
INSERT INTO tblbranch VALUES (399, '24.15.0 Herstellung von Düngemitteln und Stickstoffverbindungen', 398, '0');
INSERT INTO tblbranch VALUES (400, '24.16 Herstellung von Kunststoff in Primärformen', 389, '0');
INSERT INTO tblbranch VALUES (401, '24.16.0 Herstellung von Kunststoff in Primärformen', 400, '0');
INSERT INTO tblbranch VALUES (402, '24.17 Herstellung von synthetischem Kautschuk in Primärformen', 389, '0');
INSERT INTO tblbranch VALUES (403, '24.17.0 Herstellung von synthetischem Kautschuk in Primärformen', 402, '0');
INSERT INTO tblbranch VALUES (404, '24.2 Herstellung von Schädlingsbekämpfungs- und Pflanzenschutzmitteln', 388, '0');
INSERT INTO tblbranch VALUES (405, '24.20 Herstellung von Schädlingsbekämpfungs- und Pflanzenschutzmitteln', 404, '0');
INSERT INTO tblbranch VALUES (406, '24.20.0 Herstellung von Schädlingsbekämpfungs- und Pflanzenschutzmitteln', 405, '0');
INSERT INTO tblbranch VALUES (407, '24.3 Herstellung von Anstrichmitteln, Druckfarben und Kitten', 388, '0');
INSERT INTO tblbranch VALUES (408, '24.30 Herstellung von Anstrichmitteln, Druckfarben und Kitten', 407, '0');
INSERT INTO tblbranch VALUES (409, '24.30.1 Herstellung von Anstrichfarben, Lacken, Emaille und Kitten', 408, '0');
INSERT INTO tblbranch VALUES (410, '24.30.2 Herstellung von Druckfarben', 408, '0');
INSERT INTO tblbranch VALUES (411, '24.4 Herstellung von pharmazeutischen Erzeugnissen', 388, '0');
INSERT INTO tblbranch VALUES (412, '24.41 Herstellung von pharmazeutischen Grundstoffen', 411, '0');
INSERT INTO tblbranch VALUES (413, '24.41.0 Herstellung von pharmazeutischen Grundstoffen', 412, '0');
INSERT INTO tblbranch VALUES (414, '24.42 Herstellung von pharmazeutischen Spezialitäten und sonstigen pharmazeutischen Erzeugnissen', 411, '0');
INSERT INTO tblbranch VALUES (415, '24.42.0 Herstellung von pharmazeutischen Spezialitäten und sonstigen pharmazeutischen Erzeugnissen', 414, '0');
INSERT INTO tblbranch VALUES (416, '24.5 Herstellung von Seifen, Wasch-, Reinigungs- und Körperpflegemitteln', 388, '0');
INSERT INTO tblbranch VALUES (417, '24.51 Herstellung von Seifen, Wasch-, Reinigungs- und Poliermitteln', 416, '0');
INSERT INTO tblbranch VALUES (418, '24.51.0 Herstellung von Seifen, Wasch-, Reinigungs- und Poliermitteln', 417, '0');
INSERT INTO tblbranch VALUES (419, '24.52 Herstellung von Duft- und Körperpflegemitteln', 416, '0');
INSERT INTO tblbranch VALUES (420, '24.52.0 Herstellung von Duft- und Körperpflegemitteln', 419, '0');
INSERT INTO tblbranch VALUES (421, '24.6 Herstellung von sonstigen chemischen Erzeugnissen', 388, '0');
INSERT INTO tblbranch VALUES (422, '24.61 Herstellung von pyrotechnischen Erzeugnissen', 421, '0');
INSERT INTO tblbranch VALUES (423, '24.61.0 Herstellung von pyrotechnischen Erzeugnissen', 422, '0');
INSERT INTO tblbranch VALUES (424, '24.62 Herstellung von Klebstoffen und Gelatine', 421, '0');
INSERT INTO tblbranch VALUES (425, '24.62.0 Herstellung von Klebstoffen und Gelatine', 424, '0');
INSERT INTO tblbranch VALUES (426, '24.63 Herstellung von etherischen Ölen', 421, '0');
INSERT INTO tblbranch VALUES (427, '24.63.0 Herstellung von etherischen Ölen', 426, '0');
INSERT INTO tblbranch VALUES (428, '24.64 Herstellung von fotochemischen Erzeugnissen', 421, '0');
INSERT INTO tblbranch VALUES (429, '24.64.0 Herstellung von fotochemischen Erzeugnissen', 428, '0');
INSERT INTO tblbranch VALUES (430, '24.65 Herstellung von unbespielten Ton-, Bild- und Datenträgern', 421, '0');
INSERT INTO tblbranch VALUES (431, '24.65.0 Herstellung von unbespielten Ton-, Bild- und Datenträgern', 430, '0');
INSERT INTO tblbranch VALUES (432, '24.66 Herstellung von chemischen Erzeugnissen a.n.g.', 421, '0');
INSERT INTO tblbranch VALUES (433, '24.66.0 Herstellung von chemischen Erzeugnissen a.n.g.', 432, '0');
INSERT INTO tblbranch VALUES (434, '24.7 Herstellung von Chemiefasern', 388, '0');
INSERT INTO tblbranch VALUES (435, '24.70 Herstellung von Chemiefasern', 434, '0');
INSERT INTO tblbranch VALUES (436, '24.70.0 Herstellung von Chemiefasern', 435, '0');
INSERT INTO tblbranch VALUES (437, 'DH Herstellung von Gummi- und Kunststoffwaren', 118, '0');
INSERT INTO tblbranch VALUES (438, '25 Herstellung von Gummi- und Kunststoffwaren', 437, '0');
INSERT INTO tblbranch VALUES (439, '25.1 Herstellung von Gummiwaren', 438, '0');
INSERT INTO tblbranch VALUES (440, '25.11 Herstellung von Bereifungen', 439, '0');
INSERT INTO tblbranch VALUES (441, '25.11.0 Herstellung von Bereifungen', 440, '0');
INSERT INTO tblbranch VALUES (442, '25.12 Runderneuerung von Bereifungen', 439, '0');
INSERT INTO tblbranch VALUES (443, '25.12.0 Runderneuerung von Bereifungen', 442, '0');
INSERT INTO tblbranch VALUES (444, '25.13 Herstellung von sonstigen Gummiwaren', 439, '0');
INSERT INTO tblbranch VALUES (445, '25.13.0 Herstellung von sonstigen Gummiwaren', 444, '0');
INSERT INTO tblbranch VALUES (446, '25.2 Herstellung von Kunststoffwaren', 438, '0');
INSERT INTO tblbranch VALUES (447, '25.21 Herstellung von Platten, Folien, Schläuchen und Profilen aus Kunststoff', 446, '0');
INSERT INTO tblbranch VALUES (448, '25.21.0 Herstellung von Platten, Folien, Schläuchen und Profilen aus Kunststoff', 447, '0');
INSERT INTO tblbranch VALUES (449, '25.22 Herstellung von Verpackungsmitteln aus Kunststoff', 446, '0');
INSERT INTO tblbranch VALUES (450, '25.22.0 Herstellung von Verpackungsmitteln aus Kunststoff', 449, '0');
INSERT INTO tblbranch VALUES (451, '25.23 Herstellung von Baubedarfsartikeln aus Kunststoff', 446, '0');
INSERT INTO tblbranch VALUES (452, '25.23.0 Herstellung von Baubedarfsartikeln aus Kunststoff', 451, '0');
INSERT INTO tblbranch VALUES (453, '25.24 Herstellung von sonstigen Kunststoffwaren', 446, '0');
INSERT INTO tblbranch VALUES (454, '25.24.1 Herstellung von technischen Kunststoffteilen', 453, '0');
INSERT INTO tblbranch VALUES (455, '25.24.2 Herstellung von Fertigerzeugnissen aus Kunststoff', 453, '0');
INSERT INTO tblbranch VALUES (456, 'DI Glasgewerbe, Keramik, Verarbeitung von Steinen und Erden', 118, '0');
INSERT INTO tblbranch VALUES (457, '26 Glasgewerbe, Keramik, Verarbeitung von Steinen und Erden', 456, '0');
INSERT INTO tblbranch VALUES (458, '26.1 Herstellung und Verarbeitung von Glas', 457, '0');
INSERT INTO tblbranch VALUES (459, '26.11 Herstellung von Flachglas', 458, '0');
INSERT INTO tblbranch VALUES (460, '26.11.0 Herstellung von Flachglas', 459, '0');
INSERT INTO tblbranch VALUES (461, '26.12 Veredlung und Verarbeitung von Flachglas', 458, '0');
INSERT INTO tblbranch VALUES (462, '26.12.0 Veredlung und Verarbeitung von Flachglas', 461, '0');
INSERT INTO tblbranch VALUES (463, '26.13 Herstellung von Hohlglas', 458, '0');
INSERT INTO tblbranch VALUES (464, '26.13.1 Herstellung von Behältnissen aus Glas', 463, '0');
INSERT INTO tblbranch VALUES (465, '26.13.2 Herstellung von Trinkgläsern und Tischzubehör aus Glas', 463, '0');
INSERT INTO tblbranch VALUES (466, '26.14 Herstellung von Glasfaser', 458, '0');
INSERT INTO tblbranch VALUES (467, '26.14.1 Herstellung von Verstärkungsglasfaser', 466, '0');
INSERT INTO tblbranch VALUES (468, '26.14.2 Herstellung von Isolierglasfaser', 466, '0');
INSERT INTO tblbranch VALUES (469, '26.14.3 Herstellung von Lichtleitfaser', 466, '0');
INSERT INTO tblbranch VALUES (470, '26.15 Herstellung, Veredlung und Verarbeitung von sonstigem Glas einschliesslichtechnischen Glaswaren', 458, '0');
INSERT INTO tblbranch VALUES (471, '26.15.0 Herstellung, Veredlung und Verarbeitung von sonstigem Glas einschliesslichtechnischen Glaswaren', 470, '0');
INSERT INTO tblbranch VALUES (472, '26.2 Keramik (ohne Ziegelei und Baukeramik)', 457, '0');
INSERT INTO tblbranch VALUES (473, '26.21 Herstellung von keramischen Haushaltswaren und Ziergegenständen', 472, '0');
INSERT INTO tblbranch VALUES (474, '26.21.1 Herstellung von Haushaltswaren und Ziergegenständen aus Porzellan', 473, '0');
INSERT INTO tblbranch VALUES (475, '26.21.2 Herstellung von Haushaltswaren und Ziergegenständen aus Steingut, Steinzeug und Feinsteinzeug', 473, '0');
INSERT INTO tblbranch VALUES (476, '26.21.3 Herstellung von Haushaltswaren und Ziergegenständen aus Ton sowie von Töpferwaren', 473, '0');
INSERT INTO tblbranch VALUES (477, '26.22 Herstellung von Sanitärkeramik', 472, '0');
INSERT INTO tblbranch VALUES (478, '26.22.0 Herstellung von Sanitärkeramik', 477, '0');
INSERT INTO tblbranch VALUES (479, '26.23 Herstellung von Isolatoren und Isolierteilen aus Keramik', 472, '0');
INSERT INTO tblbranch VALUES (480, '26.23.0 Herstellung von Isolatoren und Isolierteilen aus Keramik', 479, '0');
INSERT INTO tblbranch VALUES (481, '26.24 Herstellung von keramischen Erzeugnissen für sonstige technische Zwecke', 472, '0');
INSERT INTO tblbranch VALUES (482, '26.24.0 Herstellung von keramischen Erzeugnissen für sonstige technische Zwecke', 481, '0');
INSERT INTO tblbranch VALUES (483, '26.25 Herstellung von keramischen Erzeugnissen a.n.g.', 472, '0');
INSERT INTO tblbranch VALUES (484, '26.25.0 Herstellung von keramischen Erzeugnissen a.n.g.', 483, '0');
INSERT INTO tblbranch VALUES (485, '26.26 Herstellung von feuerfesten keramischen Werkstoffen', 472, '0');
INSERT INTO tblbranch VALUES (486, '26.26.1 Herstellung von geformten feuerfesten keramischen Werkstoffen', 485, '0');
INSERT INTO tblbranch VALUES (487, '26.26.2 Herstellung von ungeformten feuerfesten keramischen Werkstoffen', 485, '0');
INSERT INTO tblbranch VALUES (488, '26.3 Herstellung von keramischen Wand- und Bodenfliesen und -platten', 457, '0');
INSERT INTO tblbranch VALUES (489, '26.30 Herstellung von keramischen Wand- und Bodenfliesen und -platten', 488, '0');
INSERT INTO tblbranch VALUES (490, '26.30.0 Herstellung von keramischen Wand- und Bodenfliesen und -platten', 489, '0');
INSERT INTO tblbranch VALUES (491, '26.4 Ziegelei, Herstellung von sonstiger Baukeramik', 457, '0');
INSERT INTO tblbranch VALUES (492, '26.40 Ziegelei, Herstellung von sonstiger Baukeramik', 491, '0');
INSERT INTO tblbranch VALUES (493, '26.40.1 Ziegelei', 492, '0');
INSERT INTO tblbranch VALUES (494, '26.40.2 Herstellung von sonstiger Baukeramik', 492, '0');
INSERT INTO tblbranch VALUES (495, '26.5 Herstellung von Zement, Kalk und gebranntem Gips', 457, '0');
INSERT INTO tblbranch VALUES (496, '26.51 Herstellung von Zement', 495, '0');
INSERT INTO tblbranch VALUES (497, '26.51.0 Herstellung von Zement', 496, '0');
INSERT INTO tblbranch VALUES (498, '26.52 Herstellung von Kalk', 495, '0');
INSERT INTO tblbranch VALUES (499, '26.52.0 Herstellung von Kalk', 498, '0');
INSERT INTO tblbranch VALUES (500, '26.53 Herstellung von gebranntem Gips', 495, '0');
INSERT INTO tblbranch VALUES (501, '26.53.0 Herstellung von gebranntem Gips', 500, '0');
INSERT INTO tblbranch VALUES (502, '26.6 Herstellung von Erzeugnissen aus Beton, Zement und Gips', 457, '0');
INSERT INTO tblbranch VALUES (503, '26.61 Herstellung von Betonerzeugnissen für den Bau und von Kalksandsteinen', 502, '0');
INSERT INTO tblbranch VALUES (504, '26.61.1 Herstellung von Bausätzen für Fertigteilbauten aus Beton im Hochbau', 503, '0');
INSERT INTO tblbranch VALUES (505, '26.61.2 Herstellung von Konstruktionsteilen und grossformatigen Fertigbauteilen aus Beton sowie von sonstigen Betonerzeugnissen für den Bau', 503, '0');
INSERT INTO tblbranch VALUES (506, '26.61.3 Herstellung von Erzeugnissen aus Porenbeton', 503, '0');
INSERT INTO tblbranch VALUES (507, '26.61.4 Herstellung von Kalksandsteinen', 503, '0');
INSERT INTO tblbranch VALUES (508, '26.62 Herstellung von Gipserzeugnissen für den Bau', 502, '0');
INSERT INTO tblbranch VALUES (509, '26.62.0 Herstellung von Gipserzeugnissen für den Bau', 508, '0');
INSERT INTO tblbranch VALUES (510, '26.63 Herstellung von Transportbeton', 502, '0');
INSERT INTO tblbranch VALUES (511, '26.63.0 Herstellung von Transportbeton', 510, '0');
INSERT INTO tblbranch VALUES (512, '26.64 Herstellung von Mörtel', 502, '0');
INSERT INTO tblbranch VALUES (513, '26.64.0 Herstellung von Mörtel', 512, '0');
INSERT INTO tblbranch VALUES (514, '26.65 Herstellung von Faserzementwaren', 502, '0');
INSERT INTO tblbranch VALUES (515, '26.65.0 Herstellung von Faserzementwaren', 514, '0');
INSERT INTO tblbranch VALUES (516, '26.66 Herstellung von Erzeugnissen aus Beton, Zement und Gips a.n.g.', 502, '0');
INSERT INTO tblbranch VALUES (517, '26.66.0 Herstellung von Erzeugnissen aus Beton, Zement und Gips a.n.g.', 516, '0');
INSERT INTO tblbranch VALUES (518, '26.7 Be- und Verarbeitung von Natursteinen a.n.g.', 457, '0');
INSERT INTO tblbranch VALUES (519, '26.70 Be- und Verarbeitung von Natursteinen a.n.g.', 518, '0');
INSERT INTO tblbranch VALUES (520, '26.70.1 Steinbildhauerei und Steinmetzerei', 519, '0');
INSERT INTO tblbranch VALUES (521, '26.70.2 Sonstige Be- und Verarbeitung von Natursteinen a.n.g.', 519, '0');
INSERT INTO tblbranch VALUES (522, '26.8 Herstellung von sonstigen Mineralerzeugnissen', 457, '0');
INSERT INTO tblbranch VALUES (523, '26.81 Herstellung von Mühlsteinen, Steinen zum Zerfasern, Poliersteinen undSchleifwerkzeugen', 522, '0');
INSERT INTO tblbranch VALUES (524, '26.81.1 Herstellung von Mühlsteinen, Steinen zum Zerfasern und Poliersteinen', 523, '0');
INSERT INTO tblbranch VALUES (525, '26.81.2 Herstellung von Schleifkörpern (ohne Diamantschleifkörper)', 523, '0');
INSERT INTO tblbranch VALUES (526, '26.81.3 Herstellung von Diamantschleifkörpern', 523, '0');
INSERT INTO tblbranch VALUES (527, '26.81.4 Herstellung von Schleifmitteln auf Unterlage', 523, '0');
INSERT INTO tblbranch VALUES (528, '26.82 Herstellung von Mineralerzeugnissen a.n.g.', 522, '0');
INSERT INTO tblbranch VALUES (529, '26.82.0 Herstellung von Mineralerzeugnissen a.n.g.', 528, '0');
INSERT INTO tblbranch VALUES (530, 'DJ Metallerzeugung und -bearbeitung, Herstellung von Metallerzeugnissen', 118, '0');
INSERT INTO tblbranch VALUES (531, '27 Metallerzeugung und -bearbeitung', 530, '0');
INSERT INTO tblbranch VALUES (532, '27.1 Erzeugung von Roheisen, Stahl und Ferrolegierungen (EGKS)', 531, '0');
INSERT INTO tblbranch VALUES (533, '27.10 Erzeugung von Roheisen, Stahl und Ferrolegierungen (EGKS)', 532, '0');
INSERT INTO tblbranch VALUES (534, '27.10.0 Erzeugung von Roheisen, Stahl und Ferrolegierungen (EGKS)', 533, '0');
INSERT INTO tblbranch VALUES (535, '27.2 Herstellung von Rohren', 531, '0');
INSERT INTO tblbranch VALUES (536, '27.21 Herstellung von Rohren, Rohrform-, Rohrverschluss- undRohrverbindungsstücken aus Gusseisen', 535, '0');
INSERT INTO tblbranch VALUES (537, '27.21.1 Herstellung von Rohren aus Gusseisen', 536, '0');
INSERT INTO tblbranch VALUES (538, '27.21.2 Herstellung von Rohrform-, Rohrverschluss- und Rohrverbindungsstücken aus Gusseisen', 536, '0');
INSERT INTO tblbranch VALUES (539, '27.22 Herstellung von Stahlrohren, Rohrform-, Rohrverschluss- und Rohrverbindungsstücken aus Eisen und Stahl', 535, '0');
INSERT INTO tblbranch VALUES (540, '27.22.1 Herstellung von Stahlrohren (ohne Präzisionsstahlrohre)', 539, '0');
INSERT INTO tblbranch VALUES (541, '27.22.2 Herstellung von Präzisionsstahlrohren', 539, '0');
INSERT INTO tblbranch VALUES (542, '27.22.3 Herstellung von Rohrform-, Rohrverschluss- und Rohrverbindungsstücken aus Eisen und Stahl', 539, '0');
INSERT INTO tblbranch VALUES (543, '27.3 Sonstige erste Bearbeitung von Eisen und Stahl, Herstellung von Ferrolegierungen (nicht EGKS)', 531, '0');
INSERT INTO tblbranch VALUES (544, '27.31 Herstellung von Blankstahl', 543, '0');
INSERT INTO tblbranch VALUES (545, '27.31.0 Herstellung von Blankstahl', 544, '0');
INSERT INTO tblbranch VALUES (546, '27.32 Herstellung von Kaltband unter 500 mm Breite', 543, '0');
INSERT INTO tblbranch VALUES (547, '27.32.0 Herstellung von Kaltband unter 500 mm Breite', 546, '0');
INSERT INTO tblbranch VALUES (548, '27.33 Herstellung von Kaltprofilen', 543, '0');
INSERT INTO tblbranch VALUES (549, '27.33.0 Herstellung von Kaltprofilen', 548, '0');
INSERT INTO tblbranch VALUES (550, '27.34 Herstellung von gezogenem Draht', 543, '0');
INSERT INTO tblbranch VALUES (551, '27.34.0 Herstellung von gezogenem Draht', 550, '0');
INSERT INTO tblbranch VALUES (552, '27.35 Erste Bearbeitung von Eisen und Stahl a.n.g., Herstellung von Ferrolegierungen (nicht EGKS)', 543, '0');
INSERT INTO tblbranch VALUES (553, '27.35.1 Erste Bearbeitung von Eisen und Stahl a.n.g.', 552, '0');
INSERT INTO tblbranch VALUES (554, '27.35.2 Herstellung von Ferrolegierungen (nicht EGKS)', 552, '0');
INSERT INTO tblbranch VALUES (555, '27.4 Erzeugung und erste Bearbeitung von NE-Metallen', 531, '0');
INSERT INTO tblbranch VALUES (556, '27.41 Erzeugung und erste Bearbeitung von Edelmetallen', 555, '0');
INSERT INTO tblbranch VALUES (557, '27.41.0 Erzeugung und erste Bearbeitung von Edelmetallen', 556, '0');
INSERT INTO tblbranch VALUES (558, '27.42 Erzeugung und erste Bearbeitung von Aluminium', 555, '0');
INSERT INTO tblbranch VALUES (559, '27.42.1 Erzeugung von Aluminium', 558, '0');
INSERT INTO tblbranch VALUES (560, '27.42.2 Erste Bearbeitung von Aluminium', 558, '0');
INSERT INTO tblbranch VALUES (561, '27.43 Erzeugung und erste Bearbeitung von Blei, Zink und Zinn', 555, '0');
INSERT INTO tblbranch VALUES (562, '27.43.1 Erzeugung von Blei, Zink und Zinn', 561, '0');
INSERT INTO tblbranch VALUES (563, '27.43.2 Erste Bearbeitung von Blei, Zink und Zinn', 561, '0');
INSERT INTO tblbranch VALUES (564, '27.44 Erzeugung und erste Bearbeitung von Kupfer', 555, '0');
INSERT INTO tblbranch VALUES (565, '27.44.1 Erzeugung von Kupfer', 564, '0');
INSERT INTO tblbranch VALUES (566, '27.44.2 Erste Bearbeitung von Kupfer', 564, '0');
INSERT INTO tblbranch VALUES (567, '27.45 Erzeugung und erste Bearbeitung von sonstigen NE-Metallen', 555, '0');
INSERT INTO tblbranch VALUES (568, '27.45.1 Erzeugung von sonstigen NE-Metallen', 567, '0');
INSERT INTO tblbranch VALUES (569, '27.45.2 Erste Bearbeitung von sonstigen NE-Metallen', 567, '0');
INSERT INTO tblbranch VALUES (570, '27.5 Giessereiindustrie', 531, '0');
INSERT INTO tblbranch VALUES (571, '27.51 Eisengiesserei', 570, '0');
INSERT INTO tblbranch VALUES (572, '27.51.1 Eisengiesserei (ohne Herstellung von duktilem Gusseisen)', 571, '0');
INSERT INTO tblbranch VALUES (573, '27.51.2 Herstellung von duktilem Gusseisen', 571, '0');
INSERT INTO tblbranch VALUES (574, '27.52 Stahlgiesserei', 570, '0');
INSERT INTO tblbranch VALUES (575, '27.52.0 Stahlgiesserei', 574, '0');
INSERT INTO tblbranch VALUES (576, '27.53 Leichtmetallgiesserei', 570, '0');
INSERT INTO tblbranch VALUES (577, '27.53.1 Leichtmetallgiesserei für Aluminiumdruckguss', 576, '0');
INSERT INTO tblbranch VALUES (578, '27.53.2 Sonstige Leichtmetallgiesserei', 576, '0');
INSERT INTO tblbranch VALUES (579, '27.54 Buntmetallgiesserei', 570, '0');
INSERT INTO tblbranch VALUES (580, '27.54.1 Buntmetallgiesserei für Zinkdruckguss', 579, '0');
INSERT INTO tblbranch VALUES (581, '27.54.2 Sonstige Buntmetallgiesserei', 579, '0');
INSERT INTO tblbranch VALUES (582, '28 Herstellung von Metallerzeugnissen', 530, '0');
INSERT INTO tblbranch VALUES (583, '28.1 Stahl- und Leichtmetallbau', 582, '0');
INSERT INTO tblbranch VALUES (584, '28.11 Herstellung von Stahl- und Leichtmetallkonstruktionen', 583, '0');
INSERT INTO tblbranch VALUES (585, '28.11.1 Herstellung von Stahl- und Leichtmetallkonstruktionen (ohne Grubenausbaukonstruktionen)', 584, '0');
INSERT INTO tblbranch VALUES (586, '28.11.2 Herstellung von Grubenausbaukonstruktionen', 584, '0');
INSERT INTO tblbranch VALUES (587, '28.12 Herstellung von Ausbauelementen aus Stahl und Leichtmetall', 583, '0');
INSERT INTO tblbranch VALUES (588, '28.12.0 Herstellung von Ausbauelementen aus Stahl und Leichtmetall', 587, '0');
INSERT INTO tblbranch VALUES (589, '28.2 Kessel- und Behälterbau (ohne Herstellung von Dampfkesseln)', 582, '0');
INSERT INTO tblbranch VALUES (590, '28.21 Herstellung von Tanks und Sammelbehältern', 589, '0');
INSERT INTO tblbranch VALUES (591, '28.21.0 Herstellung von Tanks und Sammelbehältern', 590, '0');
INSERT INTO tblbranch VALUES (592, '28.22 Herstellung von Heizkörpern für Zentralheizungen und von Zentralheizungskesseln', 589, '0');
INSERT INTO tblbranch VALUES (593, '28.22.0 Herstellung von Heizkörpern für Zentralheizungen und von Zentralheizungskesseln', 592, '0');
INSERT INTO tblbranch VALUES (594, '28.3 Herstellung von Dampfkesseln (ohne Zentralheizungskessel)', 582, '0');
INSERT INTO tblbranch VALUES (595, '28.30 Herstellung von Dampfkesseln (ohne Zentralheizungskessel)', 594, '0');
INSERT INTO tblbranch VALUES (596, '28.30.0 Herstellung von Dampfkesseln (ohne Zentralheizungskessel)', 595, '0');
INSERT INTO tblbranch VALUES (597, '28.4 Herstellung von Schmiede-, Press-, Zieh- und Stanzteilen, gewalzten Ringenund pulvermetallurgischen Erzeugnissen', 582, '0');
INSERT INTO tblbranch VALUES (598, '28.40 Herstellung von Schmiede-, Press-, Zieh- und Stanzteilen, gewalzten Ringenund pulvermetallurgischen Erzeugnissen', 597, '0');
INSERT INTO tblbranch VALUES (599, '28.40.1 Herstellung von schweren Freiformschmiedestücken', 598, '0');
INSERT INTO tblbranch VALUES (600, '28.40.2 Herstellung von leichten Freiformschmiedestücken', 598, '0');
INSERT INTO tblbranch VALUES (601, '28.40.3 Herstellung von Gesenkschmiedeteilen', 598, '0');
INSERT INTO tblbranch VALUES (602, '28.40.4 Herstellung von Kaltfliesspressteilen', 598, '0');
INSERT INTO tblbranch VALUES (603, '28.40.5 Herstellung von schweren Press-, Zieh- und Stanzteilen', 598, '0');
INSERT INTO tblbranch VALUES (604, '28.40.6 Herstellung von leichten Press-, Zieh- und Stanzteilen', 598, '0');
INSERT INTO tblbranch VALUES (605, '28.40.7 Herstellung von pulvermetallurgischen Erzeugnissen', 598, '0');
INSERT INTO tblbranch VALUES (606, '28.5 Oberflächenveredlung, Wärmebehandlung und Mechanik a.n.g.', 582, '0');
INSERT INTO tblbranch VALUES (607, '28.51 Oberflächenveredlung und Wärmebehandlung', 606, '0');
INSERT INTO tblbranch VALUES (608, '28.51.0 Oberflächenveredlung und Wärmebehandlung', 607, '0');
INSERT INTO tblbranch VALUES (609, '28.52 Mechanik a.n.g.', 606, '0');
INSERT INTO tblbranch VALUES (610, '28.52.1 Schlosserei und Schweisserei', 609, '0');
INSERT INTO tblbranch VALUES (611, '28.52.2 Schleiferei und Dreherei', 609, '0');
INSERT INTO tblbranch VALUES (612, '28.52.3 Beschlag- und Kunstschmieden', 609, '0');
INSERT INTO tblbranch VALUES (613, '28.6 Herstellung von Schneidwaren, Werkzeugen, Schlössern und Beschlägen', 582, '0');
INSERT INTO tblbranch VALUES (614, '28.61 Herstellung von Schneidwaren und Bestecken', 613, '0');
INSERT INTO tblbranch VALUES (615, '28.61.0 Herstellung von Schneidwaren und Bestecken', 614, '0');
INSERT INTO tblbranch VALUES (616, '28.62 Herstellung von Werkzeugen', 613, '0');
INSERT INTO tblbranch VALUES (617, '28.62.1 Herstellung von Handwerkzeugen', 616, '0');
INSERT INTO tblbranch VALUES (618, '28.62.2 Herstellung von Sägen und Maschinenwerkzeugen für die Holzbearbeitung', 616, '0');
INSERT INTO tblbranch VALUES (619, '28.62.3 Herstellung von Werkzeugen für das Baugewerbe', 616, '0');
INSERT INTO tblbranch VALUES (620, '28.62.4 Herstellung von auswechselbaren Werkzeugen für die Metallbearbeitung', 616, '0');
INSERT INTO tblbranch VALUES (621, '28.62.5 Herstellung von Geräten für die Landwirtschaft', 616, '0');
INSERT INTO tblbranch VALUES (622, '28.62.6 Herstellung von sonstigen Werkzeugen', 616, '0');
INSERT INTO tblbranch VALUES (623, '28.63 Herstellung von Schlössern und Beschlägen', 613, '0');
INSERT INTO tblbranch VALUES (624, '28.63.0 Herstellung von Schlössern und Beschlägen', 623, '0');
INSERT INTO tblbranch VALUES (625, '28.7 Herstellung von sonstigen Eisen-, Blech- und Metallwaren', 582, '0');
INSERT INTO tblbranch VALUES (626, '28.71 Herstellung von Behältern aus Eisen und Stahl', 625, '0');
INSERT INTO tblbranch VALUES (627, '28.71.0 Herstellung von Behältern aus Eisen und Stahl', 626, '0');
INSERT INTO tblbranch VALUES (628, '28.72 Herstellung von Verpackungen und Verschlüssen aus Eisen, Stahl und NE-Metall', 625, '0');
INSERT INTO tblbranch VALUES (629, '28.72.0 Herstellung von Verpackungen und Verschlüssen aus Eisen, Stahl und NEMetall', 628, '0');
INSERT INTO tblbranch VALUES (630, '28.73 Herstellung von Drahtwaren', 625, '0');
INSERT INTO tblbranch VALUES (631, '28.73.0 Herstellung von Drahtwaren', 630, '0');
INSERT INTO tblbranch VALUES (632, '28.74 Herstellung von Schrauben, Nieten, Ketten und Federn', 625, '0');
INSERT INTO tblbranch VALUES (633, '28.74.1 Herstellung von Schrauben, Muttern, Bolzen und Nieten', 632, '0');
INSERT INTO tblbranch VALUES (634, '28.74.2 Herstellung von Ketten', 632, '0');
INSERT INTO tblbranch VALUES (635, '28.74.3 Herstellung von Federn', 632, '0');
INSERT INTO tblbranch VALUES (636, '28.75 Herstellung von Eisen-, Blech- und Metallwaren a.n.g.', 625, '0');
INSERT INTO tblbranch VALUES (637, '28.75.1 Herstellung von nichtelektrischen Haushaltsartikeln aus Metall', 636, '0');
INSERT INTO tblbranch VALUES (638, '28.75.2 Herstellung von Panzerschränken und Tresoranlagen', 636, '0');
INSERT INTO tblbranch VALUES (639, '28.75.3 Herstellung von sonstigen Eisen-, Blech- und Metallwaren a.n.g.', 636, '0');
INSERT INTO tblbranch VALUES (640, 'DK Maschinenbau', 118, '0');
INSERT INTO tblbranch VALUES (641, '29 Maschinenbau', 640, '0');
INSERT INTO tblbranch VALUES (642, '29.1 Herstellung von Maschinen für die Erzeugung und Nutzung von mechanischerEnergie (ohne Motoren für Luft- und Strassenfahrzeuge)', 641, '0');
INSERT INTO tblbranch VALUES (643, '29.11 Herstellung von Verbrennungsmotoren und Turbinen (ohne Motoren für Luft-und Strassenfahrzeuge)', 642, '0');
INSERT INTO tblbranch VALUES (644, '29.11.0 Herstellung von Verbrennungsmotoren und Turbinen (ohne Motoren für Luft-und Strassenfahrzeuge)', 643, '0');
INSERT INTO tblbranch VALUES (645, '29.12 Herstellung von Pumpen und Kompressoren', 642, '0');
INSERT INTO tblbranch VALUES (646, '29.12.0 Herstellung von Pumpen und Kompressoren', 645, '0');
INSERT INTO tblbranch VALUES (647, '29.13 Herstellung von Armaturen', 642, '0');
INSERT INTO tblbranch VALUES (648, '29.13.0 Herstellung von Armaturen', 647, '0');
INSERT INTO tblbranch VALUES (649, '29.14 Herstellung von Lagern, Getrieben, Zahnrädern und Antriebselementen', 642, '0');
INSERT INTO tblbranch VALUES (650, '29.14.0 Herstellung von Lagern, Getrieben, Zahnrädern und Antriebselementen', 649, '0');
INSERT INTO tblbranch VALUES (651, '29.2 Herstellung von sonstigen Maschinen für unspezifische Verwendung', 641, '0');
INSERT INTO tblbranch VALUES (652, '29.21 Herstellung von öfen und Brennern', 651, '0');
INSERT INTO tblbranch VALUES (653, '29.21.0 Herstellung von öfen und Brennern', 652, '0');
INSERT INTO tblbranch VALUES (654, '29.22 Herstellung von Hebezeugen und Fördermitteln', 651, '0');
INSERT INTO tblbranch VALUES (655, '29.22.0 Herstellung von Hebezeugen und Fördermitteln', 654, '0');
INSERT INTO tblbranch VALUES (656, '29.23 Herstellung von kälte- und lufttechnischen Erzeugnissen für gewerbliche Zwecke', 651, '0');
INSERT INTO tblbranch VALUES (657, '29.23.0 Herstellung von kälte- und lufttechnischen Erzeugnissen für gewerbliche Zwecke', 656, '0');
INSERT INTO tblbranch VALUES (658, '29.24 Herstellung von Maschinen für unspezifische Verwendung a.n.g.', 651, '0');
INSERT INTO tblbranch VALUES (659, '29.24.0 Herstellung von Maschinen für unspezifische Verwendung a.n.g.', 658, '0');
INSERT INTO tblbranch VALUES (660, '29.3 Herstellung von land- und forstwirtschaftlichen Maschinen', 641, '0');
INSERT INTO tblbranch VALUES (661, '29.31 Herstellung von Ackerschleppern', 660, '0');
INSERT INTO tblbranch VALUES (662, '29.31.1 Herstellung von Ackerschleppern (ohne Reparatur)', 661, '0');
INSERT INTO tblbranch VALUES (663, '29.31.2 Instandhaltung und Reparatur von Ackerschleppern', 661, '0');
INSERT INTO tblbranch VALUES (664, '29.32 Herstellung von sonstigen land- und forstwirtschaftlichen Maschinen', 660, '0');
INSERT INTO tblbranch VALUES (665, '29.32.1 Herstellung von sonstigen land- und forstwirtschaftlichen Maschinen (ohne Reparatur)', 664, '0');
INSERT INTO tblbranch VALUES (666, '29.32.2 Instandhaltung und Reparatur von sonstigen land- und forstwirtschaftlichen Maschinen', 664, '0');
INSERT INTO tblbranch VALUES (667, '29.4 Herstellung von Werkzeugmaschinen', 641, '0');
INSERT INTO tblbranch VALUES (668, '29.40 Herstellung von Werkzeugmaschinen', 667, '0');
INSERT INTO tblbranch VALUES (669, '29.40.1 Herstellung von Werkzeugmaschinen für die Metallbearbeitung', 668, '0');
INSERT INTO tblbranch VALUES (670, '29.40.2 Herstellung von Werkzeugmaschinen zur Bearbeitung von Steinen, Beton und sonstigen mineralischen Stoffen', 668, '0');
INSERT INTO tblbranch VALUES (671, '29.40.3 Herstellung von Werkzeugmaschinen zur Bearbeitung von sonstigen harten Stoffen', 668, '0');
INSERT INTO tblbranch VALUES (672, '29.40.4 Herstellung von Maschinenspannzeugen und sonstigem Zubehör von Werkzeugmaschinen', 668, '0');
INSERT INTO tblbranch VALUES (673, '29.40.5 Herstellung von handgeführten Elektrowerkzeugen', 668, '0');
INSERT INTO tblbranch VALUES (674, '29.40.6 Herstellung von Elektroschweiss- und -lötgeräten', 668, '0');
INSERT INTO tblbranch VALUES (675, '29.40.7 Herstellung von sonstigen Werkzeugmaschinen', 668, '0');
INSERT INTO tblbranch VALUES (676, '29.5 Herstellung von Maschinen für sonstige bestimmte Wirtschaftszweige', 641, '0');
INSERT INTO tblbranch VALUES (677, '29.51 Herstellung von Maschinen für die Metallerzeugung, von Walzwerkseinrichtungen und Giessmaschinen', 676, '0');
INSERT INTO tblbranch VALUES (678, '29.51.0 Herstellung von Maschinen für die Metallerzeugung, von Walzwerkseinrichtungen und Giessmaschinen', 677, '0');
INSERT INTO tblbranch VALUES (679, '29.52 Herstellung von Bergwerks-, Bau- und Baustoffmaschinen', 676, '0');
INSERT INTO tblbranch VALUES (680, '29.52.1 Herstellung von Bergwerksmaschinen', 679, '0');
INSERT INTO tblbranch VALUES (681, '29.52.2 Herstellung von Bau- und Baustoffmaschinen', 679, '0');
INSERT INTO tblbranch VALUES (682, '29.53 Herstellung von Maschinen für das Ernährungsgewerbe und dieTabakverarbeitung', 676, '0');
INSERT INTO tblbranch VALUES (683, '29.53.0 Herstellung von Maschinen für das Ernährungsgewerbe und dieTabakverarbeitung', 682, '0');
INSERT INTO tblbranch VALUES (684, '29.54 Herstellung von Maschinen für das Textil-, Bekleidungs- und Ledergewerbe', 676, '0');
INSERT INTO tblbranch VALUES (685, '29.54.0 Herstellung von Maschinen für das Textil-, Bekleidungs- und Ledergewerbe', 684, '0');
INSERT INTO tblbranch VALUES (686, '29.55 Herstellung von Maschinen für das Papiergewerbe', 676, '0');
INSERT INTO tblbranch VALUES (687, '29.55.0 Herstellung von Maschinen für das Papiergewerbe', 686, '0');
INSERT INTO tblbranch VALUES (688, '29.56 Herstellung von Maschinen für bestimmte Wirtschaftszweige a.n.g.', 676, '0');
INSERT INTO tblbranch VALUES (689, '29.56.1 Herstellung von Maschinen für das Druckgewerbe', 688, '0');
INSERT INTO tblbranch VALUES (690, '29.56.2 Herstellung von Maschinen für sonstige bestimmte Wirtschaftszweige a.n.g.', 688, '0');
INSERT INTO tblbranch VALUES (691, '29.6 Herstellung von Waffen und Munition', 641, '0');
INSERT INTO tblbranch VALUES (692, '29.60 Herstellung von Waffen und Munition', 691, '0');
INSERT INTO tblbranch VALUES (693, '29.60.0 Herstellung von Waffen und Munition', 692, '0');
INSERT INTO tblbranch VALUES (694, '29.7 Herstellung von Haushaltsgeräten a.n.g.', 641, '0');
INSERT INTO tblbranch VALUES (695, '29.71 Herstellung von elektrischen Haushaltsgeräten', 694, '0');
INSERT INTO tblbranch VALUES (696, '29.71.0 Herstellung von elektrischen Haushaltsgeräten', 695, '0');
INSERT INTO tblbranch VALUES (697, '29.72 Herstellung von nichtelektrischen Heiz-, Koch-, Heisswasser- und Heissluftgeräten a.n.g.', 694, '0');
INSERT INTO tblbranch VALUES (698, '29.72.0 Herstellung von nichtelektrischen Heiz-, Koch-, Heisswasser- und Heissluftgeräten a.n.g.', 697, '0');
INSERT INTO tblbranch VALUES (699, 'DL Herstellung von Büromaschinen, Datenverarbeitungsgeräten und -einrichtungen; Elektrotechnik, Feinmechanik und Optik', 118, '0');
INSERT INTO tblbranch VALUES (700, '30 Herstellung von Büromaschinen, Datenverarbeitungsgeräten und -einrichtungen', 699, '0');
INSERT INTO tblbranch VALUES (701, '30.0 Herstellung von Büromaschinen, Datenverarbeitungsgeräten und -einrichtungen', 700, '0');
INSERT INTO tblbranch VALUES (702, '30.01 Herstellung von Büromaschinen', 701, '0');
INSERT INTO tblbranch VALUES (703, '30.01.0 Herstellung von Büromaschinen', 702, '0');
INSERT INTO tblbranch VALUES (704, '30.02 Herstellung von Datenverarbeitungsgeräten und -einrichtungen', 701, '0');
INSERT INTO tblbranch VALUES (705, '30.02.0 Herstellung von Datenverarbeitungsgeräten und -einrichtungen', 704, '0');
INSERT INTO tblbranch VALUES (706, '31 Herstellung von Geräten der Elektrizitätserzeugung, -verteilung u.ä.', 699, '0');
INSERT INTO tblbranch VALUES (707, '31.1 Herstellung von Elektromotoren, Generatoren und Transformatoren', 706, '0');
INSERT INTO tblbranch VALUES (708, '31.10 Herstellung von Elektromotoren, Generatoren und Transformatoren', 707, '0');
INSERT INTO tblbranch VALUES (709, '31.10.0 Herstellung von Elektromotoren, Generatoren und Transformatoren', 708, '0');
INSERT INTO tblbranch VALUES (710, '31.2 Herstellung von Elektrizitätsverteilungs- und -schalteinrichtungen', 706, '0');
INSERT INTO tblbranch VALUES (711, '31.20 Herstellung von Elektrizitätsverteilungs- und -schalteinrichtungen', 710, '0');
INSERT INTO tblbranch VALUES (712, '31.20.0 Herstellung von Elektrizitätsverteilungs- und -schalteinrichtungen', 711, '0');
INSERT INTO tblbranch VALUES (713, '31.3 Herstellung von isolierten Elektrokabeln, -leitungen und -drähten', 706, '0');
INSERT INTO tblbranch VALUES (714, '31.30 Herstellung von isolierten Elektrokabeln, -leitungen und -drähten', 713, '0');
INSERT INTO tblbranch VALUES (715, '31.30.0 Herstellung von isolierten Elektrokabeln, -leitungen und -drähten', 714, '0');
INSERT INTO tblbranch VALUES (716, '31.4 Herstellung von Akkumulatoren und Batterien', 706, '0');
INSERT INTO tblbranch VALUES (717, '31.40 Herstellung von Akkumulatoren und Batterien', 716, '0');
INSERT INTO tblbranch VALUES (718, '31.40.0 Herstellung von Akkumulatoren und Batterien', 717, '0');
INSERT INTO tblbranch VALUES (719, '31.5 Herstellung von elektrischen Lampen und Leuchten', 706, '0');
INSERT INTO tblbranch VALUES (720, '31.50 Herstellung von elektrischen Lampen und Leuchten', 719, '0');
INSERT INTO tblbranch VALUES (721, '31.50.0 Herstellung von elektrischen Lampen und Leuchten', 720, '0');
INSERT INTO tblbranch VALUES (722, '31.6 Herstellung von elektrischen Ausrüstungen a.n.g.', 706, '0');
INSERT INTO tblbranch VALUES (723, '31.61 Herstellung von elektrischen Ausrüstungen für Motoren und Fahrzeuge a.n.g.', 722, '0');
INSERT INTO tblbranch VALUES (724, '31.61.0 Herstellung von elektrischen Ausrüstungen für Motoren und Fahrzeuge a.n.g.', 723, '0');
INSERT INTO tblbranch VALUES (725, '31.62 Herstellung von sonstigen elektrischen Ausrüstungen a.n.g.', 722, '0');
INSERT INTO tblbranch VALUES (726, '31.62.0 Herstellung von sonstigen elektrischen Ausrüstungen a.n.g.', 725, '0');
INSERT INTO tblbranch VALUES (727, '32 Rundfunk-, Fernseh- und Nachrichtentechnik', 699, '0');
INSERT INTO tblbranch VALUES (728, '32.1 Herstellung von elektronischen Bauelementen', 727, '0');
INSERT INTO tblbranch VALUES (729, '32.10 Herstellung von elektronischen Bauelementen', 728, '0');
INSERT INTO tblbranch VALUES (730, '32.10.0 Herstellung von elektronischen Bauelementen', 729, '0');
INSERT INTO tblbranch VALUES (731, '32.2 Herstellung von nachrichtentechnischen Geräten und Einrichtungen', 727, '0');
INSERT INTO tblbranch VALUES (732, '32.20 Herstellung von nachrichtentechnischen Geräten und Einrichtungen', 731, '0');
INSERT INTO tblbranch VALUES (733, '32.20.0 Herstellung von nachrichtentechnischen Geräten und Einrichtungen', 732, '0');
INSERT INTO tblbranch VALUES (734, '32.3 Herstellung von Rundfunk- und Fernsehgeräten sowie phono- undvideotechnischen Geräten', 727, '0');
INSERT INTO tblbranch VALUES (735, '32.30 Herstellung von Rundfunk- und Fernsehgeräten sowie phono- undvideotechnischen Geräten', 734, '0');
INSERT INTO tblbranch VALUES (736, '32.30.0 Herstellung von Rundfunk- und Fernsehgeräten sowie phono- undvideotechnischen Geräten', 735, '0');
INSERT INTO tblbranch VALUES (737, '33 Medizin-, Mess-, Steuer- und Regelungstechnik, Optik', 699, '0');
INSERT INTO tblbranch VALUES (738, '33.1 Herstellung von medizinischen Geräten und orthopädischen Vorrichtungen', 737, '0');
INSERT INTO tblbranch VALUES (739, '33.10 Herstellung von medizinischen Geräten und orthopädischen Vorrichtungen', 738, '0');
INSERT INTO tblbranch VALUES (740, '33.10.1 Herstellung von elektromedizinischen Geräten und Instrumenten', 739, '0');
INSERT INTO tblbranch VALUES (741, '33.10.2 Herstellung von medizintechnischen Geräten', 739, '0');
INSERT INTO tblbranch VALUES (742, '33.10.3 Herstellung von orthopädischen Vorrichtungen', 739, '0');
INSERT INTO tblbranch VALUES (743, '33.10.4 Zahntechnische Laboratorien', 739, '0');
INSERT INTO tblbranch VALUES (744, '33.2 Herstellung von Mess-, Kontroll-, Navigations- u.ä. Instrumenten und Vorrichtungen', 737, '0');
INSERT INTO tblbranch VALUES (745, '33.20 Herstellung von Mess-, Kontroll-, Navigations- u.ä. Instrumenten und Vorrichtungen', 744, '0');
INSERT INTO tblbranch VALUES (746, '33.20.1 Herstellung von elektrischen Mess-, Kontroll-, Navigations- u.ä. Instrumenten und Vorrichtungen', 745, '0');
INSERT INTO tblbranch VALUES (747, '33.20.2 Herstellung von feinmechanisch-optischen Mess-, Kontroll-, Navigations- u.ä. Instrumenten und Vorrichtungen', 745, '0');
INSERT INTO tblbranch VALUES (748, '33.20.3 Herstellung von mechanischen Prüfmaschinen', 745, '0');
INSERT INTO tblbranch VALUES (749, '33.3 Herstellung von industriellen Prozesssteuerungsanlagen', 737, '0');
INSERT INTO tblbranch VALUES (750, '33.30 Herstellung von industriellen Prozesssteuerungsanlagen', 749, '0');
INSERT INTO tblbranch VALUES (751, '33.30.0 Herstellung von industriellen Prozesssteuerungsanlagen', 750, '0');
INSERT INTO tblbranch VALUES (752, '33.4 Herstellung von optischen und fotografischen Geräten', 737, '0');
INSERT INTO tblbranch VALUES (753, '33.40 Herstellung von optischen und fotografischen Geräten', 752, '0');
INSERT INTO tblbranch VALUES (754, '33.40.1 Herstellung von augenoptischen Erzeugnissen', 753, '0');
INSERT INTO tblbranch VALUES (755, '33.40.2 Herstellung von optischen Instrumenten', 753, '0');
INSERT INTO tblbranch VALUES (756, '33.40.3 Herstellung von Foto-, Projektions- und Kinogeräten', 753, '0');
INSERT INTO tblbranch VALUES (757, '33.5 Herstellung von Uhren', 737, '0');
INSERT INTO tblbranch VALUES (758, '33.50 Herstellung von Uhren', 757, '0');
INSERT INTO tblbranch VALUES (759, '33.50.0 Herstellung von Uhren', 758, '0');
INSERT INTO tblbranch VALUES (760, 'DM Fahrzeugbau', 118, '0');
INSERT INTO tblbranch VALUES (761, '34 Herstellung von Kraftwagen und Kraftwagenteilen', 760, '0');
INSERT INTO tblbranch VALUES (762, '34.1 Herstellung von Kraftwagen und Kraftwagenmotoren', 761, '0');
INSERT INTO tblbranch VALUES (763, '34.10 Herstellung von Kraftwagen und Kraftwagenmotoren', 762, '0');
INSERT INTO tblbranch VALUES (764, '34.10.1 Herstellung von Personenkraftwagen und Personenkraftwagenmotoren', 763, '0');
INSERT INTO tblbranch VALUES (765, '34.10.2 Herstellung von Lastkraftwagen und Lastkraftwagenmotoren', 763, '0');
INSERT INTO tblbranch VALUES (766, '34.2 Herstellung von Karosserien, Aufbauten und Anhängern', 761, '0');
INSERT INTO tblbranch VALUES (767, '34.20 Herstellung von Karosserien, Aufbauten und Anhängern', 766, '0');
INSERT INTO tblbranch VALUES (768, '34.20.0 Herstellung von Karosserien, Aufbauten und Anhängern', 767, '0');
INSERT INTO tblbranch VALUES (769, '34.3 Herstellung von Teilen und Zubehör für Kraftwagen und Kraftwagenmotoren', 761, '0');
INSERT INTO tblbranch VALUES (770, '34.30 Herstellung von Teilen und Zubehör für Kraftwagen und Kraftwagenmotoren', 769, '0');
INSERT INTO tblbranch VALUES (771, '34.30.0 Herstellung von Teilen und Zubehör für Kraftwagen und Kraftwagenmotoren', 770, '0');
INSERT INTO tblbranch VALUES (772, '35 Sonstiger Fahrzeugbau', 760, '0');
INSERT INTO tblbranch VALUES (773, '35.1 Schiffbau', 772, '0');
INSERT INTO tblbranch VALUES (774, '35.11 Schiffbau (ohne Boots- und Yachtbau)', 773, '0');
INSERT INTO tblbranch VALUES (775, '35.11.1 Schiffbau (ohne Abwrackung, Boots- und Yachtbau)', 774, '0');
INSERT INTO tblbranch VALUES (776, '35.11.2 Schiffsabwrackung', 774, '0');
INSERT INTO tblbranch VALUES (777, '35.12 Boots- und Yachtbau', 773, '0');
INSERT INTO tblbranch VALUES (778, '35.12.0 Boots- und Yachtbau', 777, '0');
INSERT INTO tblbranch VALUES (779, '35.2 Schienenfahrzeugbau', 772, '0');
INSERT INTO tblbranch VALUES (780, '35.20 Schienenfahrzeugbau', 779, '0');
INSERT INTO tblbranch VALUES (781, '35.20.1 Lokomotivbau', 780, '0');
INSERT INTO tblbranch VALUES (782, '35.20.2 Bau von Waggons, Triebwagen und Schienenbussen', 780, '0');
INSERT INTO tblbranch VALUES (783, '35.20.3 Reparatur von Schienenfahrzeugen', 780, '0');
INSERT INTO tblbranch VALUES (784, '35.20.4 Herstellung von ortsfestem Gleismaterial', 780, '0');
INSERT INTO tblbranch VALUES (785, '35.20.5 Herstellung von mechanischen und elektromechanischen Signal-, Sicherungs, Überwachungs- und Steuergeräten für Verkehrseinrichtungen', 780, '0');
INSERT INTO tblbranch VALUES (786, '35.3 Luft- und Raumfahrzeugbau', 772, '0');
INSERT INTO tblbranch VALUES (787, '35.30 Luft- und Raumfahrzeugbau', 786, '0');
INSERT INTO tblbranch VALUES (788, '35.30.0 Luft- und Raumfahrzeugbau', 787, '0');
INSERT INTO tblbranch VALUES (789, '35.4 Herstellung von Krafträdern, Fahrrädern und Behindertenfahrzeugen', 772, '0');
INSERT INTO tblbranch VALUES (790, '35.41 Herstellung von Krafträdern', 789, '0');
INSERT INTO tblbranch VALUES (791, '35.41.1 Herstellung von Krafträdern und Kraftradmotoren', 790, '0');
INSERT INTO tblbranch VALUES (792, '35.41.2 Herstellung von Kraftradteilen und Zubehör', 790, '0');
INSERT INTO tblbranch VALUES (793, '35.42 Herstellung von Fahrrädern', 789, '0');
INSERT INTO tblbranch VALUES (794, '35.42.1 Herstellung von Fahrrädern (ohne Fahrradteile)', 793, '0');
INSERT INTO tblbranch VALUES (795, '35.42.2 Herstellung von Fahrradteilen und Zubehör', 793, '0');
INSERT INTO tblbranch VALUES (796, '35.43 Herstellung von Behindertenfahrzeugen', 789, '0');
INSERT INTO tblbranch VALUES (797, '35.43.0 Herstellung von Behindertenfahrzeugen', 796, '0');
INSERT INTO tblbranch VALUES (798, '35.5 Fahrzeugbau a.n.g.', 772, '0');
INSERT INTO tblbranch VALUES (799, '35.50 Fahrzeugbau a.n.g.', 798, '0');
INSERT INTO tblbranch VALUES (800, '35.50.0 Fahrzeugbau a.n.g.', 799, '0');
INSERT INTO tblbranch VALUES (801, 'DN Herstellung von Möbeln, Schmuck, Musikinstrumenten, Sportgeräten,Spielwaren und sonstigen Erzeugnissen; Recycling', 118, '0');
INSERT INTO tblbranch VALUES (802, '36 Herstellung von Möbeln, Schmuck, Musikinstrumenten, Sportgeräten,Spielwaren und sonstigen Erzeugnissen', 801, '0');
INSERT INTO tblbranch VALUES (803, '36.1 Herstellung von Möbeln', 802, '0');
INSERT INTO tblbranch VALUES (804, '36.11 Herstellung von Sitzmöbeln', 803, '0');
INSERT INTO tblbranch VALUES (805, '36.11.1 Herstellung von Polstermöbeln', 804, '0');
INSERT INTO tblbranch VALUES (806, '36.11.2 Herstellung von sonstigen Sitzmöbeln', 804, '0');
INSERT INTO tblbranch VALUES (807, '36.12 Herstellung von Büro- und Ladenmöbeln', 803, '0');
INSERT INTO tblbranch VALUES (808, '36.12.1 Herstellung von Büromöbeln', 807, '0');
INSERT INTO tblbranch VALUES (809, '36.12.2 Herstellung von Ladenmöbeln und sonstigen Objektmöbeln', 807, '0');
INSERT INTO tblbranch VALUES (810, '36.13 Herstellung von Küchenmöbeln', 803, '0');
INSERT INTO tblbranch VALUES (811, '36.13.0 Herstellung von Küchenmöbeln', 810, '0');
INSERT INTO tblbranch VALUES (812, '36.14 Herstellung von sonstigen Möbeln', 803, '0');
INSERT INTO tblbranch VALUES (813, '36.14.1 Herstellung von Esszimmer- und Wohnzimmermöbeln', 812, '0');
INSERT INTO tblbranch VALUES (814, '36.14.2 Herstellung von Schlafzimmermöbeln', 812, '0');
INSERT INTO tblbranch VALUES (815, '36.14.3 Herstellung von Möbeln a.n.g.', 812, '0');
INSERT INTO tblbranch VALUES (816, '36.15 Herstellung von Matratzen', 803, '0');
INSERT INTO tblbranch VALUES (817, '36.15.0 Herstellung von Matratzen', 816, '0');
INSERT INTO tblbranch VALUES (818, '36.2 Herstellung von Schmuck und ähnlichen Erzeugnissen', 802, '0');
INSERT INTO tblbranch VALUES (819, '36.21 Prägen von Münzen und Medaillen', 818, '0');
INSERT INTO tblbranch VALUES (820, '36.21.0 Prägen von Münzen und Medaillen', 819, '0');
INSERT INTO tblbranch VALUES (821, '36.22 Herstellung von Schmuck, Gold- und Silberschmiedewaren (ohnePhantasieschmuck)', 818, '0');
INSERT INTO tblbranch VALUES (822, '36.22.1 Bearbeitung von Edelsteinen, Schmucksteinen und Perlen', 821, '0');
INSERT INTO tblbranch VALUES (823, '36.22.2 Herstellung von Schmuck aus Edelmetallen und Edelmetallplattierungen', 821, '0');
INSERT INTO tblbranch VALUES (824, '36.22.3 Herstellung von Gold- und Silberschmiedewaren (ohne Tafelgeräte undBestecke)', 821, '0');
INSERT INTO tblbranch VALUES (825, '36.22.4 Herstellung von Tafelgeräten und Bestecken aus Edelmetallen oder mitEdelmetallen überzogen', 821, '0');
INSERT INTO tblbranch VALUES (826, '36.22.5 Herstellung von Edelmetallerzeugnissen für technische Zwecke', 821, '0');
INSERT INTO tblbranch VALUES (827, '36.3 Herstellung von Musikinstrumenten', 802, '0');
INSERT INTO tblbranch VALUES (828, '36.30 Herstellung von Musikinstrumenten', 827, '0');
INSERT INTO tblbranch VALUES (829, '36.30.0 Herstellung von Musikinstrumenten', 828, '0');
INSERT INTO tblbranch VALUES (830, '36.4 Herstellung von Sportgeräten', 802, '0');
INSERT INTO tblbranch VALUES (831, '36.40 Herstellung von Sportgeräten', 830, '0');
INSERT INTO tblbranch VALUES (832, '36.40.0 Herstellung von Sportgeräten', 831, '0');
INSERT INTO tblbranch VALUES (833, '36.5 Herstellung von Spielwaren', 802, '0');
INSERT INTO tblbranch VALUES (834, '36.50 Herstellung von Spielwaren', 833, '0');
INSERT INTO tblbranch VALUES (835, '36.50.0 Herstellung von Spielwaren', 834, '0');
INSERT INTO tblbranch VALUES (836, '36.6 Herstellung von sonstigen Erzeugnissen', 802, '0');
INSERT INTO tblbranch VALUES (837, '36.61 Herstellung von Phantasieschmuck', 836, '0');
INSERT INTO tblbranch VALUES (838, '36.61.0 Herstellung von Phantasieschmuck', 837, '0');
INSERT INTO tblbranch VALUES (839, '36.62 Herstellung von Besen und Bürsten', 836, '0');
INSERT INTO tblbranch VALUES (840, '36.62.0 Herstellung von Besen und Bürsten', 839, '0');
INSERT INTO tblbranch VALUES (841, '36.63 Herstellung von Erzeugnissen a.n.g.', 836, '0');
INSERT INTO tblbranch VALUES (842, '36.63.1 Herstellung von Bodenbelägen auf textiler Unterlage', 841, '0');
INSERT INTO tblbranch VALUES (843, '36.63.2 Herstellung von sonstigem Bekleidungszubehör a.n.g.', 841, '0');
INSERT INTO tblbranch VALUES (844, '36.63.3 Herstellung von sonstigen chemischen Erzeugnissen a.n.g.', 841, '0');
INSERT INTO tblbranch VALUES (845, '36.63.4 Herstellung von Kinderwagen', 841, '0');
INSERT INTO tblbranch VALUES (846, '36.63.5 Herstellung von Füllhaltern, Kugelschreibern, Filzstiften und Stempeln', 841, '0');
INSERT INTO tblbranch VALUES (847, '36.63.6 Verarbeitung von natürlichen Schnitz- und Formstoffen; Tierausstopferei', 841, '0');
INSERT INTO tblbranch VALUES (848, '36.63.7 Herstellung von Weihnachtsschmuck', 841, '0');
INSERT INTO tblbranch VALUES (849, '36.63.8 Herstellung von sonstigen Erzeugnissen a.n.g.', 841, '0');
INSERT INTO tblbranch VALUES (850, '37 Recycling', 801, '0');
INSERT INTO tblbranch VALUES (851, '37.1 Recycling von Schrott', 850, '0');
INSERT INTO tblbranch VALUES (852, '37.10 Recycling von Schrott', 851, '0');
INSERT INTO tblbranch VALUES (853, '37.10.1 Recycling von Eisen- und Stahlschrott', 852, '0');
INSERT INTO tblbranch VALUES (854, '37.10.2 Recycling von NE-Metallschrott', 852, '0');
INSERT INTO tblbranch VALUES (855, '37.2 Recycling von nichtmetallischen Altmaterialien und Reststoffen', 850, '0');
INSERT INTO tblbranch VALUES (856, '37.20 Recycling von nichtmetallischen Altmaterialien und Reststoffen', 855, '0');
INSERT INTO tblbranch VALUES (857, '37.20.1 Recycling von textilen Altmaterialien und Reststoffen', 856, '0');
INSERT INTO tblbranch VALUES (858, '37.20.2 Recycling von Altmaterialien und Reststoffen aus Papier, Karton und Pappe', 856, '0');
INSERT INTO tblbranch VALUES (859, '37.20.3 Recycling von Altmaterialien und Reststoffen aus Glas', 856, '0');
INSERT INTO tblbranch VALUES (860, '37.20.4 Recycling von Altmaterialien und Reststoffen aus Kunststoff', 856, '0');
INSERT INTO tblbranch VALUES (861, '37.20.5 Recycling von sonstigen Altmaterialien und Reststoffen', 856, '0');
INSERT INTO tblbranch VALUES (862, 'E Energie- und Wasserversorgung', 1, '0');
INSERT INTO tblbranch VALUES (863, 'EA Energie- und Wasserversorgung', 862, '0');
INSERT INTO tblbranch VALUES (864, '40 Energieversorgung', 863, '0');
INSERT INTO tblbranch VALUES (865, '40.1 Elektrizitätsversorgung', 864, '0');
INSERT INTO tblbranch VALUES (866, '40.10 Elektrizitätsversorgung', 865, '0');
INSERT INTO tblbranch VALUES (867, '40.10.1 Elektrizitätserzeugung aus Wärmekraft (ohne Kernenergie) mit Fremdbezug zur Verteilung', 866, '0');
INSERT INTO tblbranch VALUES (868, '40.10.2 Elektrizitätserzeugung aus Kernenergie mit Fremdbezug zur Verteilung', 866, '0');
INSERT INTO tblbranch VALUES (869, '40.10.3 Elektrizitätserzeugung aus Wasserkraft mit Fremdbezug zur Verteilung', 866, '0');
INSERT INTO tblbranch VALUES (870, '40.10.4 Elektrizitätserzeugung aus Windkraft und sonstigen Energiequellen mit Fremdbezug zur Verteilung', 866, '0');
INSERT INTO tblbranch VALUES (871, '40.10.5 Elektrizitätserzeugung aus Wärmekraft (ohne Kernenergie) ohne Fremdbezug zur Verteilung', 866, '0');
INSERT INTO tblbranch VALUES (872, '40.10.6 Elektrizitätserzeugung aus Kernenergie ohne Fremdbezug zur Verteilung', 866, '0');
INSERT INTO tblbranch VALUES (873, '40.10.7 Elektrizitätserzeugung aus Wasserkraft ohne Fremdbezug zur Verteilung', 866, '0');
INSERT INTO tblbranch VALUES (874, '40.10.8 Elektrizitätserzeugung aus Windkraft und sonstigen Energiequellen ohne Fremdbezug zur Verteilung', 866, '0');
INSERT INTO tblbranch VALUES (875, '40.10.9 Elektrizitätsverteilung ohne Erzeugung', 866, '0');
INSERT INTO tblbranch VALUES (876, '40.2 Gasversorgung', 864, '0');
INSERT INTO tblbranch VALUES (877, '40.20 Gasversorgung', 876, '0');
INSERT INTO tblbranch VALUES (878, '40.20.1 Gasgewinnung und -erzeugung mit Fremdbezug zur Verteilung', 877, '0');
INSERT INTO tblbranch VALUES (879, '40.20.2 Gasgewinnung und -erzeugung ohne Fremdbezug zur Verteilung', 877, '0');
INSERT INTO tblbranch VALUES (880, '40.20.3 Gasverteilung ohne Gewinnung und Erzeugung', 877, '0');
INSERT INTO tblbranch VALUES (881, '40.3 Fernwärmeversorgung', 864, '0');
INSERT INTO tblbranch VALUES (882, '40.30 Fernwärmeversorgung', 881, '0');
INSERT INTO tblbranch VALUES (883, '40.30.1 Fernwärmeerzeugung durch Heizkraftwerk mit Fremdbezug zur Verteilung', 882, '0');
INSERT INTO tblbranch VALUES (884, '40.30.2 Fernwärmeerzeugung durch Fernheizwerk mit Fremdbezug zur Verteilung', 882, '0');
INSERT INTO tblbranch VALUES (885, '40.30.3 Fernwärmeerzeugung durch Heizkraftwerk ohne Fremdbezug zur Verteilung', 882, '0');
INSERT INTO tblbranch VALUES (886, '40.30.4 Fernwärmeerzeugung durch Fernheizwerk ohne Fremdbezug zur Verteilung', 882, '0');
INSERT INTO tblbranch VALUES (887, '40.30.5 Fernwärmeverteilung ohne Erzeugung', 882, '0');
INSERT INTO tblbranch VALUES (888, '41 Wasserversorgung', 863, '0');
INSERT INTO tblbranch VALUES (889, '41.0 Wasserversorgung', 888, '0');
INSERT INTO tblbranch VALUES (890, '41.00 Wasserversorgung', 889, '0');
INSERT INTO tblbranch VALUES (891, '41.00.1 Wassergewinnung mit Fremdbezug zur Verteilung', 890, '0');
INSERT INTO tblbranch VALUES (892, '41.00.2 Wassergewinnung ohne Fremdbezug zur Verteilung', 890, '0');
INSERT INTO tblbranch VALUES (893, '41.00.3 Wasserverteilung ohne Gewinnung', 890, '0');
INSERT INTO tblbranch VALUES (894, 'F Baugewerbe', 1, '0');
INSERT INTO tblbranch VALUES (895, 'FA Baugewerbe', 894, '0');
INSERT INTO tblbranch VALUES (896, '45 Baugewerbe', 895, '0');
INSERT INTO tblbranch VALUES (897, '45.1 Vorbereitende Baustellenarbeiten', 896, '0');
INSERT INTO tblbranch VALUES (898, '45.11 Abbruch-, Spreng- und Enttrümmerungsgewerbe, Erdbewegungsarbeiten', 897, '0');
INSERT INTO tblbranch VALUES (899, '45.11.1 Abbruch-, Spreng- und Enttrümmerungsgewerbe', 898, '0');
INSERT INTO tblbranch VALUES (900, '45.11.2 Erdbewegungsarbeiten', 898, '0');
INSERT INTO tblbranch VALUES (901, '45.11.3 Landeskulturbau und Renaturierung von Gewässern', 898, '0');
INSERT INTO tblbranch VALUES (902, '45.11.4 Aufschliessung von Lagerstätten', 898, '0');
INSERT INTO tblbranch VALUES (903, '45.12 Test- und Suchbohrung', 897, '0');
INSERT INTO tblbranch VALUES (904, '45.12.0 Test- und Suchbohrung', 903, '0');
INSERT INTO tblbranch VALUES (905, '45.2 Hoch- und Tiefbau', 896, '0');
INSERT INTO tblbranch VALUES (906, '45.21 Hochbau, Brücken- und Tunnelbau u.ä.', 905, '0');
INSERT INTO tblbranch VALUES (907, '45.21.1 Hoch- und Tiefbau ohne ausgeprägten Schwerpunkt', 906, '0');
INSERT INTO tblbranch VALUES (908, '45.21.2 Hochbau (ohne Fertigteilbau)', 906, '0');
INSERT INTO tblbranch VALUES (909, '45.21.3 Herstellung von Fertigteilbauten aus Beton im Hochbau aus selbsthergestellten Bausätzen', 906, '0');
INSERT INTO tblbranch VALUES (910, '45.21.4 Herstellung von Fertigteilbauten aus Beton im Hochbau aus fremdbezogenen Bausätzen', 906, '0');
INSERT INTO tblbranch VALUES (911, '45.21.5 Herstellung von Fertigteilbauten aus Holz im Hochbau aus fremdbezogenen Bausätzen', 906, '0');
INSERT INTO tblbranch VALUES (912, '45.21.6 Brücken- und Tunnelbau u.ä.', 906, '0');
INSERT INTO tblbranch VALUES (913, '45.21.7 Kabelleitungstiefbau', 906, '0');
INSERT INTO tblbranch VALUES (914, '45.22 Dachdeckerei, Abdichtung und Zimmerei', 905, '0');
INSERT INTO tblbranch VALUES (915, '45.22.1 Dachdeckerei', 914, '0');
INSERT INTO tblbranch VALUES (916, '45.22.2 Abdichtung gegen Wasser und Feuchtigkeit', 914, '0');
INSERT INTO tblbranch VALUES (917, '45.22.3 Zimmerei und Ingenieurholzbau', 914, '0');
INSERT INTO tblbranch VALUES (918, '45.23 Strassenbau und Eisenbahnoberbau', 905, '0');
INSERT INTO tblbranch VALUES (919, '45.23.1 Strassenbau', 918, '0');
INSERT INTO tblbranch VALUES (920, '45.23.2 Eisenbahnoberbau', 918, '0');
INSERT INTO tblbranch VALUES (921, '45.24 Wasserbau', 905, '0');
INSERT INTO tblbranch VALUES (922, '45.24.0 Wasserbau', 921, '0');
INSERT INTO tblbranch VALUES (923, '45.25 Spezialbau und sonstiger Tiefbau', 905, '0');
INSERT INTO tblbranch VALUES (924, '45.25.1 Brunnenbau', 923, '0');
INSERT INTO tblbranch VALUES (925, '45.25.2 Schachtbau', 923, '0');
INSERT INTO tblbranch VALUES (926, '45.25.3 Schornstein-, Feuerungs- und Industrieofenbau', 923, '0');
INSERT INTO tblbranch VALUES (927, '45.25.4 Gerüstbau', 923, '0');
INSERT INTO tblbranch VALUES (928, '45.25.5 Gebäudetrocknung', 923, '0');
INSERT INTO tblbranch VALUES (929, '45.25.6 Sonstiger Tiefbau', 923, '0');
INSERT INTO tblbranch VALUES (930, '45.3 Bauinstallation', 896, '0');
INSERT INTO tblbranch VALUES (931, '45.31 Elektroinstallation', 930, '0');
INSERT INTO tblbranch VALUES (932, '45.31.0 Elektroinstallation', 931, '0');
INSERT INTO tblbranch VALUES (933, '45.32 Dämmung gegen Kälte, Wärme, Schall und Erschütterung', 930, '0');
INSERT INTO tblbranch VALUES (934, '45.32.0 Dämmung gegen Kälte, Wärme, Schall und Erschütterung', 933, '0');
INSERT INTO tblbranch VALUES (935, '45.33 Klempnerei, Gas-, Wasser-, Heizungs- und Lüftungsinstallation', 930, '0');
INSERT INTO tblbranch VALUES (936, '45.33.1 Klempnerei, Gas- und Wasserinstallation', 935, '0');
INSERT INTO tblbranch VALUES (937, '45.33.2 Installation von Heizungs-, Lüftungs-, Klima- und gesundheitstechnischenAnlagen', 935, '0');
INSERT INTO tblbranch VALUES (938, '45.34 Sonstige Bauinstallation', 930, '0');
INSERT INTO tblbranch VALUES (939, '45.34.0 Sonstige Bauinstallation', 938, '0');
INSERT INTO tblbranch VALUES (940, '45.4 Sonstiges Baugewerbe', 896, '0');
INSERT INTO tblbranch VALUES (941, '45.41 Stukkateurgewerbe, Gipserei und Verputzerei', 940, '0');
INSERT INTO tblbranch VALUES (942, '45.41.0 Stukkateurgewerbe, Gipserei und Verputzerei', 941, '0');
INSERT INTO tblbranch VALUES (943, '45.42 Bautischlerei', 940, '0');
INSERT INTO tblbranch VALUES (944, '45.42.0 Bautischlerei', 943, '0');
INSERT INTO tblbranch VALUES (945, '45.43 Fussboden-, Fliesen- und Plattenlegerei, Raumausstattung', 940, '0');
INSERT INTO tblbranch VALUES (946, '45.43.1 Parkettlegerei', 945, '0');
INSERT INTO tblbranch VALUES (947, '45.43.2 Fliesen-, Platten- und Mosaiklegerei', 945, '0');
INSERT INTO tblbranch VALUES (948, '45.43.3 Estrichlegerei', 945, '0');
INSERT INTO tblbranch VALUES (949, '45.43.4 Sonstige Fussbodenlegerei und -kleberei', 945, '0');
INSERT INTO tblbranch VALUES (950, '45.43.5 Tapetenkleberei', 945, '0');
INSERT INTO tblbranch VALUES (951, '45.43.6 Raumausstattung ohne ausgeprägten Schwerpunkt', 945, '0');
INSERT INTO tblbranch VALUES (952, '45.44 Maler- und Glasergewerbe', 940, '0');
INSERT INTO tblbranch VALUES (953, '45.44.1 Maler- und Lackierergewerbe', 952, '0');
INSERT INTO tblbranch VALUES (954, '45.44.2 Glasergewerbe', 952, '0');
INSERT INTO tblbranch VALUES (955, '45.45 Baugewerbe a.n.g.', 940, '0');
INSERT INTO tblbranch VALUES (956, '45.45.1 Fassadenreinigung', 955, '0');
INSERT INTO tblbranch VALUES (957, '45.45.2 Ofen- und Herdsetzerei', 955, '0');
INSERT INTO tblbranch VALUES (958, '45.45.3 Ausbaugewerbe a.n.g.', 955, '0');
INSERT INTO tblbranch VALUES (959, '45.5 Vermietung von Baumaschinen und -geräten mit Bedienungspersonal', 896, '0');
INSERT INTO tblbranch VALUES (960, '45.50 Vermietung von Baumaschinen und -geräten mit Bedienungspersonal', 959, '0');
INSERT INTO tblbranch VALUES (961, '45.50.0 Vermietung von Baumaschinen und -geräten mit Bedienungspersonal', 960, '0');
INSERT INTO tblbranch VALUES (962, 'G Handel; Instandhaltung und Reparatur von Kraftfahrzeugen und Gebrauchsgütern', 1, '0');
INSERT INTO tblbranch VALUES (963, 'GA Handel; Instandhaltung und Reparatur von Kraftfahrzeugen und Gebrauchsgütern', 962, '0');
INSERT INTO tblbranch VALUES (964, '50 Kraftfahrzeughandel; Instandhaltung und Reparatur von Kraftfahrzeugen; Tankstellen', 963, '0');
INSERT INTO tblbranch VALUES (965, '50.1 Handel mit Kraftwagen', 964, '0');
INSERT INTO tblbranch VALUES (966, '50.10 Handel mit Kraftwagen', 965, '0');
INSERT INTO tblbranch VALUES (967, '50.10.1 Handelsvermittlung von Kraftwagen', 966, '0');
INSERT INTO tblbranch VALUES (968, '50.10.2 Grosshandel mit Kraftwagen', 966, '0');
INSERT INTO tblbranch VALUES (969, '50.10.3 Einzelhandel mit Kraftwagen', 966, '0');
INSERT INTO tblbranch VALUES (970, '50.2 Instandhaltung und Reparatur von Kraftwagen', 964, '0');
INSERT INTO tblbranch VALUES (971, '50.20 Instandhaltung und Reparatur von Kraftwagen', 970, '0');
INSERT INTO tblbranch VALUES (972, '50.20.1 Instandhaltung und Reparatur von Kraftwagen (ohne Elektrik)', 971, '0');
INSERT INTO tblbranch VALUES (973, '50.20.2 Reparatur von Kraftwagenelektrik', 971, '0');
INSERT INTO tblbranch VALUES (974, '50.20.3 Lackierung von Kraftwagen', 971, '0');
INSERT INTO tblbranch VALUES (975, '50.20.4 Autowaschanlagen', 971, '0');
INSERT INTO tblbranch VALUES (976, '50.3 Handel mit Kraftwagenteilen und Zubehör', 964, '0');
INSERT INTO tblbranch VALUES (977, '50.30 Handel mit Kraftwagenteilen und Zubehör', 976, '0');
INSERT INTO tblbranch VALUES (978, '50.30.1 Handelsvermittlung von Kraftwagenteilen und Zubehör', 977, '0');
INSERT INTO tblbranch VALUES (979, '50.30.2 Grosshandel mit Kraftwagenteilen und Zubehör', 977, '0');
INSERT INTO tblbranch VALUES (980, '50.30.3 Einzelhandel mit Kraftwagenteilen und Zubehör', 977, '0');
INSERT INTO tblbranch VALUES (981, '50.4 Handel mit Krafträdern, Teilen und Zubehör; Instandhaltung und Reparaturvon Krafträdern', 964, '0');
INSERT INTO tblbranch VALUES (982, '50.40 Handel mit Krafträdern, Teilen und Zubehör; Instandhaltung und Reparaturvon Krafträdern', 981, '0');
INSERT INTO tblbranch VALUES (983, '50.40.1 Handelsvermittlung von Krafträdern, Teilen und Zubehör', 982, '0');
INSERT INTO tblbranch VALUES (984, '50.40.2 Grosshandel mit Krafträdern, Teilen und Zubehör', 982, '0');
INSERT INTO tblbranch VALUES (985, '50.40.3 Einzelhandel mit Krafträdern, Teilen und Zubehör', 982, '0');
INSERT INTO tblbranch VALUES (986, '50.40.4 Instandhaltung und Reparatur von Krafträdern', 982, '0');
INSERT INTO tblbranch VALUES (987, '50.5 Tankstellen', 964, '0');
INSERT INTO tblbranch VALUES (988, '50.50 Tankstellen', 987, '0');
INSERT INTO tblbranch VALUES (989, '50.50.1 Tankstellen mit Absatz in fremdem Namen (Agenturtankstellen)', 988, '0');
INSERT INTO tblbranch VALUES (990, '50.50.2 Tankstellen mit Absatz in eigenem Namen (Freie Tankstellen)', 988, '0');
INSERT INTO tblbranch VALUES (991, '51 Handelsvermittlung und Grosshandel (ohne Handel mit Kraftfahrzeugen)', 963, '0');
INSERT INTO tblbranch VALUES (992, '51.1 Handelsvermittlung', 991, '0');
INSERT INTO tblbranch VALUES (993, '51.11 Handelsvermittlung von landwirtschaftlichen Grundstoffen, lebenden Tieren,textilen Rohstoffen und Halbwaren', 992, '0');
INSERT INTO tblbranch VALUES (994, '51.11.1 Handelsvermittlung von Getreide, Saaten und Futtermitteln', 993, '0');
INSERT INTO tblbranch VALUES (995, '51.11.2 Handelsvermittlung von Blumen und Pflanzen', 993, '0');
INSERT INTO tblbranch VALUES (996, '51.11.3 Handelsvermittlung von Rohtabak', 993, '0');
INSERT INTO tblbranch VALUES (997, '51.11.4 Handelsvermittlung von lebenden Tieren', 993, '0');
INSERT INTO tblbranch VALUES (998, '51.11.5 Handelsvermittlung von textilen Rohstoffen und Halbwaren, Häuten, Fellenund Leder', 993, '0');
INSERT INTO tblbranch VALUES (999, '51.12 Handelsvermittlung von Brennstoffen, Erzen, Metallen und technischenChemikalien', 992, '0');
INSERT INTO tblbranch VALUES (1000, '51.12.1 Handelsvermittlung von festen Brennstoffen und Mineralölerzeugnissen', 999, '0');
INSERT INTO tblbranch VALUES (1001, '51.12.2 Handelsvermittlung von Erzen, Eisen, Stahl, NE-Metallen, Eisen-, Stahl- und NE-Metallhalbzeug', 999, '0');
INSERT INTO tblbranch VALUES (1002, '51.12.3 Handelsvermittlung von technischen Chemikalien, Rohdrogen, Kautschuk und Düngemitteln', 999, '0');
INSERT INTO tblbranch VALUES (1003, '51.13 Handelsvermittlung von Holz, Baustoffen und Anstrichmitteln', 992, '0');
INSERT INTO tblbranch VALUES (1004, '51.13.1 Handelsvermittlung von Rohholz, Holzhalbwaren und Bauelementen aus Holz', 1003, '0');
INSERT INTO tblbranch VALUES (1005, '51.13.2 Handelsvermittlung von Baustoffen, Bauelementen aus mineralischen Stoffen und Flachglas', 1003, '0');
INSERT INTO tblbranch VALUES (1006, '51.13.3 Handelsvermittlung von Anstrichmitteln', 1003, '0');
INSERT INTO tblbranch VALUES (1007, '51.13.4 Handelsvermittlung von chemisch-technischen Erzeugnissen', 1003, '0');
INSERT INTO tblbranch VALUES (1008, '51.14 Handelsvermittlung von Maschinen, technischem Bedarf, Wasser- und Luftfahrzeugen', 992, '0');
INSERT INTO tblbranch VALUES (1009, '51.14.1 Handelsvermittlung von Maschinen für unspezifische Verwendung', 1008, '0');
INSERT INTO tblbranch VALUES (1010, '51.14.2 Handelsvermittlung von Wasser- und Luftfahrzeugen', 1008, '0');
INSERT INTO tblbranch VALUES (1011, '51.14.3 Handelsvermittlung von Maschinen für bestimmte Wirtschaftszweige und technischem Bedarf (ohne landwirtschaftliche Maschinen)', 1008, '0');
INSERT INTO tblbranch VALUES (1012, '51.14.4 Handelsvermittlung von Rundfunk-, Fernseh- und phonotechnischen Erzeugnissen', 1008, '0');
INSERT INTO tblbranch VALUES (1013, '51.14.5 Handelsvermittlung von Werkzeugen', 1008, '0');
INSERT INTO tblbranch VALUES (1014, '51.14.6 Handelsvermittlung von Büromaschinen und Software', 1008, '0');
INSERT INTO tblbranch VALUES (1015, '51.14.7 Handelsvermittlung von landwirtschaftlichen Maschinen und Geräten', 1008, '0');
INSERT INTO tblbranch VALUES (1016, '51.14.8 Handelsvermittlung von Installationsbedarf für Gas, Wasser und Heizung', 1008, '0');
INSERT INTO tblbranch VALUES (1017, '51.15 Handelsvermittlung von Möbeln, Einrichtungs- und Haushaltsgegenständen, Eisen- und Metallwaren', 992, '0');
INSERT INTO tblbranch VALUES (1018, '51.15.1 Handelsvermittlung von Möbeln und Einrichtungsgegenständen', 1017, '0');
INSERT INTO tblbranch VALUES (1019, '51.15.2 Handelsvermittlung von keramischen Erzeugnissen, Glaswaren, Holzwarena.n.g., Kork-, Flecht- und Korbwaren', 1017, '0');
INSERT INTO tblbranch VALUES (1020, '51.15.3 Handelsvermittlung von elektrischen Haushaltsgeräten', 1017, '0');
INSERT INTO tblbranch VALUES (1021, '51.15.4 Handelsvermittlung von Eisen-, Metall- und Kunststoffwaren a.n.g.', 1017, '0');
INSERT INTO tblbranch VALUES (1022, '51.15.5 Handelsvermittlung von Putz- und Reinigungsmitteln', 1017, '0');
INSERT INTO tblbranch VALUES (1023, '51.16 Handelsvermittlung von Textilien, Bekleidung, Schuhen und Lederwaren', 992, '0');
INSERT INTO tblbranch VALUES (1024, '51.16.1 Handelsvermittlung von Meterware für Bekleidung und Wäsche', 1023, '0');
INSERT INTO tblbranch VALUES (1025, '51.16.2 Handelsvermittlung von Heim- und Haustextilien und Bodenbelägen', 1023, '0');
INSERT INTO tblbranch VALUES (1026, '51.16.3 Handelsvermittlung von Oberbekleidung', 1023, '0');
INSERT INTO tblbranch VALUES (1027, '51.16.4 Handelsvermittlung von Unterbekleidung', 1023, '0');
INSERT INTO tblbranch VALUES (1028, '51.16.5 Handelsvermittlung von Schuhen', 1023, '0');
INSERT INTO tblbranch VALUES (1029, '51.16.6 Handelsvermittlung von Leder- und Täschnerwaren', 1023, '0');
INSERT INTO tblbranch VALUES (1030, '51.17 Handelsvermittlung von Nahrungsmitteln, Getränken und Tabakwaren', 992, '0');
INSERT INTO tblbranch VALUES (1031, '51.17.1 Handelsvermittlung von Nahrungsmitteln, Getränken und Tabakwaren ohne ausgeprägten Schwerpunkt', 1030, '0');
INSERT INTO tblbranch VALUES (1032, '51.17.2 Handelsvermittlung von Obst, Gemüse und Kartoffeln', 1030, '0');
INSERT INTO tblbranch VALUES (1033, '51.17.3 Handelsvermittlung von Zucker und Süsswaren', 1030, '0');
INSERT INTO tblbranch VALUES (1034, '51.17.4 Handelsvermittlung von Milch, Milcherzeugnissen, Eiern, Speiseöl, Nahrungsfetten, Fleisch, Fleischwaren, Geflügel und Wild', 1030, '0');
INSERT INTO tblbranch VALUES (1035, '51.17.5 Handelsvermittlung von Kaffee, Tee, Kakao und Gewürzen', 1030, '0');
INSERT INTO tblbranch VALUES (1036, '51.17.6 Handelsvermittlung von Wein, Sekt und Spirituosen', 1030, '0');
INSERT INTO tblbranch VALUES (1037, '51.17.7 Handelsvermittlung von sonstigen Getränken', 1030, '0');
INSERT INTO tblbranch VALUES (1038, '51.17.8 Handelsvermittlung von tiefgefrorenen Nahrungsmitteln', 1030, '0');
INSERT INTO tblbranch VALUES (1039, '51.17.9 Handelsvermittlung von sonstigen Nahrungsmitteln sowie Tabakwaren', 1030, '0');
INSERT INTO tblbranch VALUES (1040, '51.18 Handelsvermittlung von Waren a.n.g.', 992, '0');
INSERT INTO tblbranch VALUES (1041, '51.18.1 Handelsvermittlung von feinmechanischen, Foto- und optischen Erzeugnissen', 1040, '0');
INSERT INTO tblbranch VALUES (1042, '51.18.2 Handelsvermittlung von Uhren, Edelmetallwaren und Schmuck', 1040, '0');
INSERT INTO tblbranch VALUES (1043, '51.18.3 Handelsvermittlung von Spielwaren und Musikinstrumenten', 1040, '0');
INSERT INTO tblbranch VALUES (1044, '51.18.4 Handelsvermittlung von Fahrrädern, Fahrradteilen und Zubehör, Sport- undCampingartikeln (ohne Campingmöbel)', 1040, '0');
INSERT INTO tblbranch VALUES (1045, '51.18.5 Handelsvermittlung von pharmazeutischen Erzeugnissen, medizinischen undorthopädischen Artikeln und Laborbedarf', 1040, '0');
INSERT INTO tblbranch VALUES (1046, '51.18.6 Handelsvermittlung von kosmetischen Erzeugnissen, Körperpflege- undWaschmitteln', 1040, '0');
INSERT INTO tblbranch VALUES (1047, '51.18.7 Handelsvermittlung von Papier und Pappe, Schul- und Büroartikeln,Geschenk- und Werbeartikeln, Verpackungsmitteln und Tapeten', 1040, '0');
INSERT INTO tblbranch VALUES (1048, '51.18.8 Handelsvermittlung von Büchern, Zeitschriften, Zeitungen, Musikalien undsonstigen Druckerzeugnissen', 1040, '0');
INSERT INTO tblbranch VALUES (1049, '51.18.9 Handelsvermittlung von Altmaterial und Reststoffen', 1040, '0');
INSERT INTO tblbranch VALUES (1050, '51.19 Handelsvermittlung von Waren ohne ausgeprägten Schwerpunkt', 992, '0');
INSERT INTO tblbranch VALUES (1051, '51.19.0 Handelsvermittlung von Waren ohne ausgeprägten Schwerpunkt', 1050, '0');
INSERT INTO tblbranch VALUES (1052, '51.2 Grosshandel mit landwirtschaftlichen Grundstoffen und lebenden Tieren', 991, '0');
INSERT INTO tblbranch VALUES (1053, '51.21 Grosshandel mit Getreide, Saaten und Futtermitteln', 1052, '0');
INSERT INTO tblbranch VALUES (1054, '51.21.0 Grosshandel mit Getreide, Saaten und Futtermitteln', 1053, '0');
INSERT INTO tblbranch VALUES (1055, '51.22 Grosshandel mit Blumen und Pflanzen', 1052, '0');
INSERT INTO tblbranch VALUES (1056, '51.22.0 Grosshandel mit Blumen und Pflanzen', 1055, '0');
INSERT INTO tblbranch VALUES (1057, '51.23 Grosshandel mit lebenden Tieren', 1052, '0');
INSERT INTO tblbranch VALUES (1058, '51.23.0 Grosshandel mit lebenden Tieren', 1057, '0');
INSERT INTO tblbranch VALUES (1059, '51.24 Grosshandel mit Häuten, Fellen und Leder', 1052, '0');
INSERT INTO tblbranch VALUES (1060, '51.24.0 Grosshandel mit Häuten, Fellen und Leder', 1059, '0');
INSERT INTO tblbranch VALUES (1061, '51.25 Grosshandel mit Rohtabak', 1052, '0');
INSERT INTO tblbranch VALUES (1062, '51.25.0 Grosshandel mit Rohtabak', 1061, '0');
INSERT INTO tblbranch VALUES (1063, '51.3 Grosshandel mit Nahrungsmitteln, Getränken und Tabakwaren', 991, '0');
INSERT INTO tblbranch VALUES (1064, '51.31 Grosshandel mit Obst, Gemüse und Kartoffeln', 1063, '0');
INSERT INTO tblbranch VALUES (1065, '51.31.0 Grosshandel mit Obst, Gemüse und Kartoffeln', 1064, '0');
INSERT INTO tblbranch VALUES (1066, '51.32 Grosshandel mit Fleisch, Fleischwaren, Geflügel und Wild', 1063, '0');
INSERT INTO tblbranch VALUES (1067, '51.32.0 Grosshandel mit Fleisch, Fleischwaren, Geflügel und Wild', 1066, '0');
INSERT INTO tblbranch VALUES (1068, '51.33 Grosshandel mit Milch, Milcherzeugnissen, Eiern, Speiseölen und Nahrungsfetten', 1063, '0');
INSERT INTO tblbranch VALUES (1069, '51.33.0 Grosshandel mit Milch, Milcherzeugnissen, Eiern, Speiseölen und Nahrungsfetten', 1068, '0');
INSERT INTO tblbranch VALUES (1070, '51.34 Grosshandel mit Getränken', 1063, '0');
INSERT INTO tblbranch VALUES (1071, '51.34.1 Grosshandel mit Getränken ohne ausgeprägten Schwerpunkt', 1070, '0');
INSERT INTO tblbranch VALUES (1072, '51.34.2 Grosshandel mit Wein, Sekt und Spirituosen', 1070, '0');
INSERT INTO tblbranch VALUES (1073, '51.34.3 Grosshandel mit Bier', 1070, '0');
INSERT INTO tblbranch VALUES (1074, '51.34.4 Grosshandel mit sonstigen Getränken', 1070, '0');
INSERT INTO tblbranch VALUES (1075, '51.35 Grosshandel mit Tabakwaren', 1063, '0');
INSERT INTO tblbranch VALUES (1076, '51.35.0 Grosshandel mit Tabakwaren', 1075, '0');
INSERT INTO tblbranch VALUES (1077, '51.36 Grosshandel mit Zucker, Süsswaren und Backwaren', 1063, '0');
INSERT INTO tblbranch VALUES (1078, '51.36.1 Grosshandel mit Zucker', 1077, '0');
INSERT INTO tblbranch VALUES (1079, '51.36.2 Grosshandel mit Süsswaren', 1077, '0');
INSERT INTO tblbranch VALUES (1080, '51.36.3 Grosshandel mit Backwaren', 1077, '0');
INSERT INTO tblbranch VALUES (1081, '51.37 Grosshandel mit Kaffee, Tee, Kakao und Gewürzen', 1063, '0');
INSERT INTO tblbranch VALUES (1082, '51.37.1 Grosshandel mit Kaffee, Tee und Kakao', 1081, '0');
INSERT INTO tblbranch VALUES (1083, '51.37.2 Grosshandel mit Gewürzen', 1081, '0');
INSERT INTO tblbranch VALUES (1084, '51.38 Grosshandel mit sonstigen Nahrungsmitteln', 1063, '0');
INSERT INTO tblbranch VALUES (1085, '51.38.1 Grosshandel mit Fisch und Fischerzeugnissen', 1084, '0');
INSERT INTO tblbranch VALUES (1086, '51.38.2 Grosshandel mit Mehl und Getreideprodukten', 1084, '0');
INSERT INTO tblbranch VALUES (1087, '51.38.3 Grosshandel mit Nahrungsmitteln a.n.g.', 1084, '0');
INSERT INTO tblbranch VALUES (1088, '51.39 Grosshandel mit Nahrungsmitteln, Getränken und Tabakwaren ohne ausgeprägten Schwerpunkt', 1063, '0');
INSERT INTO tblbranch VALUES (1089, '51.39.1 Grosshandel mit tiefgefrorenen Nahrungsmitteln', 1088, '0');
INSERT INTO tblbranch VALUES (1090, '51.39.2 Grosshandel mit sonstigen Nahrungsmitteln, Getränken und Tabakwaren ohneausgeprägten Schwerpunkt', 1088, '0');
INSERT INTO tblbranch VALUES (1091, '51.4 Grosshandel mit Gebrauchs- und Verbrauchsgütern', 991, '0');
INSERT INTO tblbranch VALUES (1092, '51.41 Grosshandel mit Textilien', 1091, '0');
INSERT INTO tblbranch VALUES (1093, '51.41.1 Grosshandel mit Meterware für Bekleidung und Wäsche', 1092, '0');
INSERT INTO tblbranch VALUES (1094, '51.41.2 Grosshandel mit Heim- und Haustextilien', 1092, '0');
INSERT INTO tblbranch VALUES (1095, '51.42 Grosshandel mit Bekleidung und Schuhen', 1091, '0');
INSERT INTO tblbranch VALUES (1096, '51.42.1 Grosshandel mit Oberbekleidung', 1095, '0');
INSERT INTO tblbranch VALUES (1097, '51.42.2 Grosshandel mit Unterbekleidung, Pullovern u.ä. sowie Bekleidungszubehör', 1095, '0');
INSERT INTO tblbranch VALUES (1098, '51.42.3 Grosshandel mit Schuhen', 1095, '0');
INSERT INTO tblbranch VALUES (1099, '51.43 Grosshandel mit elektrischen Haushaltsgeräten, Rundfunk- undFernsehgeräten', 1091, '0');
INSERT INTO tblbranch VALUES (1100, '51.43.1 Grosshandel mit elektrotechnischen Erzeugnissen und Zubehör ohneausgeprägten Schwerpunkt', 1099, '0');
INSERT INTO tblbranch VALUES (1101, '51.43.2 Grosshandel mit elektrischen Haushaltsgeräten', 1099, '0');
INSERT INTO tblbranch VALUES (1102, '51.43.3 Grosshandel mit Rundfunk-, Fernseh- und phonotechnischen Geräten und Zubehör', 1099, '0');
INSERT INTO tblbranch VALUES (1103, '51.43.4 Grosshandel mit elektrotechnischem Zubehör und Elektroinstallationszubehör', 1099, '0');
INSERT INTO tblbranch VALUES (1104, '51.44 Grosshandel mit Haushaltswaren aus Metall, keramischen Erzeugnissen,Glaswaren, Tapeten und Reinigungsmitteln', 1091, '0');
INSERT INTO tblbranch VALUES (1105, '51.44.1 Grosshandel mit Haushaltswaren aus Metall', 1104, '0');
INSERT INTO tblbranch VALUES (1106, '51.44.2 Grosshandel mit keramischen Erzeugnissen und Glaswaren', 1104, '0');
INSERT INTO tblbranch VALUES (1107, '51.44.3 Grosshandel mit Tapeten', 1104, '0');
INSERT INTO tblbranch VALUES (1108, '51.44.4 Grosshandel mit Wasch-, Putz- und Reinigungsmitteln', 1104, '0');
INSERT INTO tblbranch VALUES (1109, '51.45 Grosshandel mit kosmetischen Erzeugnissen und Körperpflegemitteln', 1091, '0');
INSERT INTO tblbranch VALUES (1110, '51.45.0 Grosshandel mit kosmetischen Erzeugnissen und Körperpflegemitteln', 1109, '0');
INSERT INTO tblbranch VALUES (1111, '51.46 Grosshandel mit pharmazeutischen Erzeugnissen und medizinischenHilfsmitteln', 1091, '0');
INSERT INTO tblbranch VALUES (1112, '51.46.1 Grosshandel mit pharmazeutischen Erzeugnissen', 1111, '0');
INSERT INTO tblbranch VALUES (1113, '51.46.2 Grosshandel mit medizinischen und orthopädischen Artikeln und Laborbedarf', 1111, '0');
INSERT INTO tblbranch VALUES (1114, '51.46.3 Grosshandel mit Dentalbedarf', 1111, '0');
INSERT INTO tblbranch VALUES (1115, '51.47 Grosshandel mit sonstigen Gebrauchs- und Verbrauchsgütern', 1091, '0');
INSERT INTO tblbranch VALUES (1116, '51.47.1 Grosshandel mit nichtelektrischen Haushaltsgeräten', 1115, '0');
INSERT INTO tblbranch VALUES (1117, '51.47.2 Grosshandel mit Spielwaren und Musikinstrumenten', 1115, '0');
INSERT INTO tblbranch VALUES (1118, '51.47.3 Grosshandel mit Fahrrädern, Fahrradteilen und Zubehör, Sport- undCampingartikeln (ohne Campingmöbel)', 1115, '0');
INSERT INTO tblbranch VALUES (1119, '51.47.4 Grosshandel mit Uhren, Edelmetallwaren und Schmuck', 1115, '0');
INSERT INTO tblbranch VALUES (1120, '51.47.5 Grosshandel mit Leder- und Täschnerwaren, Geschenk- und Werbeartikeln', 1115, '0');
INSERT INTO tblbranch VALUES (1121, '51.47.6 Grosshandel mit Möbeln, Einrichtungsgegenständen und Bodenbelägen', 1115, '0');
INSERT INTO tblbranch VALUES (1122, '51.47.7 Grosshandel mit feinmechanischen, Foto- und optischen Erzeugnissen', 1115, '0');
INSERT INTO tblbranch VALUES (1123, '51.47.8 Grosshandel mit Papier, Pappe, Schul- und Büroartikeln, Büchern, Zeitschriftenund Zeitungen', 1115, '0');
INSERT INTO tblbranch VALUES (1124, '51.5 Grosshandel mit Rohstoffen, Halbwaren, Altmaterial und Reststoffen', 991, '0');
INSERT INTO tblbranch VALUES (1125, '51.51 Grosshandel mit festen Brennstoffen und Mineralölerzeugnissen', 1124, '0');
INSERT INTO tblbranch VALUES (1126, '51.51.1 Grosshandel mit festen Brennstoffen und Mineralölerzeugnissen ohneausgeprägten Schwerpunkt', 1125, '0');
INSERT INTO tblbranch VALUES (1127, '51.51.2 Grosshandel mit festen Brennstoffen', 1125, '0');
INSERT INTO tblbranch VALUES (1128, '51.51.3 Grosshandel mit Mineralölerzeugnissen', 1125, '0');
INSERT INTO tblbranch VALUES (1129, '51.52 Grosshandel mit Erzen, Eisen, Stahl, NE-Metallen und Halbzeug', 1124, '0');
INSERT INTO tblbranch VALUES (1130, '51.52.1 Grosshandel mit Erzen', 1129, '0');
INSERT INTO tblbranch VALUES (1131, '51.52.2 Grosshandel mit Eisen, Stahl, Eisen- und Stahlhalbzeug', 1129, '0');
INSERT INTO tblbranch VALUES (1132, '51.52.3 Grosshandel mit NE-Metallen und NE-Metallhalbzeug', 1129, '0');
INSERT INTO tblbranch VALUES (1133, '51.53 Grosshandel mit Holz, Baustoffen, Anstrichmitteln und Sanitärkeramik', 1124, '0');
INSERT INTO tblbranch VALUES (1134, '51.53.1 Grosshandel mit Holz, Baustoffen, Anstrichmitteln und Sanitärkeramik ohne ausgeprägten Schwerpunkt', 1133, '0');
INSERT INTO tblbranch VALUES (1135, '51.53.2 Grosshandel mit Roh- und Schnittholz', 1133, '0');
INSERT INTO tblbranch VALUES (1136, '51.53.3 Grosshandel mit sonstigen Holzhalbwaren sowie Bauelementen aus Holz', 1133, '0');
INSERT INTO tblbranch VALUES (1137, '51.53.4 Grosshandel mit Baustoffen und Bauelementen aus mineralischen Stoffen', 1133, '0');
INSERT INTO tblbranch VALUES (1138, '51.53.5 Grosshandel mit Flachglas', 1133, '0');
INSERT INTO tblbranch VALUES (1139, '51.53.6 Grosshandel mit Anstrichmitteln', 1133, '0');
INSERT INTO tblbranch VALUES (1140, '51.53.7 Grosshandel mit Sanitärkeramik', 1133, '0');
INSERT INTO tblbranch VALUES (1141, '51.54 Grosshandel mit Bauelementen aus Metall sowie Installationsbedarf für Gas, Wasser und Heizung', 1124, '0');
INSERT INTO tblbranch VALUES (1142, '51.54.1 Grosshandel mit Bauelementen aus Metall', 1141, '0');
INSERT INTO tblbranch VALUES (1143, '51.54.2 Grosshandel mit Werkzeugen und Kleineisenwaren', 1141, '0');
INSERT INTO tblbranch VALUES (1144, '51.54.3 Grosshandel mit Installationsbedarf für Gas, Wasser und Heizung', 1141, '0');
INSERT INTO tblbranch VALUES (1145, '51.55 Grosshandel mit chemischen Erzeugnissen', 1124, '0');
INSERT INTO tblbranch VALUES (1146, '51.55.1 Grosshandel mit chemischen Erzeugnissen ohne ausgeprägten Schwerpunkt', 1145, '0');
INSERT INTO tblbranch VALUES (1147, '51.55.2 Grosshandel mit technischen Chemikalien und Rohdrogen', 1145, '0');
INSERT INTO tblbranch VALUES (1148, '51.55.3 Grosshandel mit rohen technischen Fetten und Ölen sowie Kautschuk', 1145, '0');
INSERT INTO tblbranch VALUES (1149, '51.55.4 Grosshandel mit chemisch-technischen Erzeugnissen', 1145, '0');
INSERT INTO tblbranch VALUES (1150, '51.55.5 Grosshandel mit Düngemitteln', 1145, '0');
INSERT INTO tblbranch VALUES (1151, '51.56 Grosshandel mit sonstigen Halbwaren', 1124, '0');
INSERT INTO tblbranch VALUES (1152, '51.56.1 Grosshandel mit Naturfasern und Garnen', 1151, '0');
INSERT INTO tblbranch VALUES (1153, '51.56.2 Grosshandel mit sonstigen textilen Halbwaren', 1151, '0');
INSERT INTO tblbranch VALUES (1154, '51.56.3 Grosshandel mit Halbwaren a.n.g.', 1151, '0');
INSERT INTO tblbranch VALUES (1155, '51.57 Grosshandel mit Altmaterial und Reststoffen', 1124, '0');
INSERT INTO tblbranch VALUES (1156, '51.57.1 Grosshandel mit Altmaterial und Reststoffen ohne ausgeprägten Schwerpunkt', 1155, '0');
INSERT INTO tblbranch VALUES (1157, '51.57.2 Grosshandel mit Schrott', 1155, '0');
INSERT INTO tblbranch VALUES (1158, '51.57.3 Grosshandel mit sonstigen Altmaterialien und Reststoffen', 1155, '0');
INSERT INTO tblbranch VALUES (1159, '51.6 Grosshandel mit Maschinen, Ausrüstungen und Zubehör', 991, '0');
INSERT INTO tblbranch VALUES (1160, '51.61 Grosshandel mit Werkzeugmaschinen', 1159, '0');
INSERT INTO tblbranch VALUES (1161, '51.61.1 Grosshandel mit Werkzeugmaschinen (ohne Holzbearbeitungsmaschinen)', 1160, '0');
INSERT INTO tblbranch VALUES (1162, '51.61.2 Grosshandel mit Holzbearbeitungsmaschinen', 1160, '0');
INSERT INTO tblbranch VALUES (1163, '51.62 Grosshandel mit Baumaschinen', 1159, '0');
INSERT INTO tblbranch VALUES (1164, '51.62.0 Grosshandel mit Baumaschinen', 1163, '0');
INSERT INTO tblbranch VALUES (1165, '51.63 Grosshandel mit Textil-, Näh- und Strickmaschinen', 1159, '0');
INSERT INTO tblbranch VALUES (1166, '51.63.0 Grosshandel mit Textil-, Näh- und Strickmaschinen', 1165, '0');
INSERT INTO tblbranch VALUES (1167, '51.64 Grosshandel mit Büromaschinen und -einrichtungen', 1159, '0');
INSERT INTO tblbranch VALUES (1168, '51.64.1 Grosshandel mit Büromaschinen und Software', 1167, '0');
INSERT INTO tblbranch VALUES (1169, '51.64.2 Grosshandel mit Büroeinrichtungen', 1167, '0');
INSERT INTO tblbranch VALUES (1170, '51.65 Grosshandel mit sonstigen Maschinen, Ausrüstungen und Zubehör (ohne landwirtschaftliche Maschinen)', 1159, '0');
INSERT INTO tblbranch VALUES (1171, '51.65.1 Grosshandel mit Flurförderzeugen und Fahrzeugen a.n.g.', 1170, '0');
INSERT INTO tblbranch VALUES (1172, '51.65.2 Grosshandel mit sonstigen Maschinen (ohne landwirtschaftliche Maschinen)', 1170, '0');
INSERT INTO tblbranch VALUES (1173, '51.65.3 Grosshandel mit sonstigen Ausrüstungen und Zubehör für Maschinen sowie technischem Bedarf a.n.g.', 1170, '0');
INSERT INTO tblbranch VALUES (1174, '51.66 Grosshandel mit landwirtschaftlichen Maschinen und Geräten', 1159, '0');
INSERT INTO tblbranch VALUES (1175, '51.66.0 Grosshandel mit landwirtschaftlichen Maschinen und Geräten', 1174, '0');
INSERT INTO tblbranch VALUES (1176, '51.7 Sonstiger Grosshandel', 991, '0');
INSERT INTO tblbranch VALUES (1177, '51.70 Sonstiger Grosshandel', 1176, '0');
INSERT INTO tblbranch VALUES (1178, '51.70.1 Grosshandel mit Rohstoffen, Halb- und Fertigwaren ohne ausgeprägten Schwerpunkt', 1177, '0');
INSERT INTO tblbranch VALUES (1179, '51.70.2 Grosshandel mit Rohstoffen und Halbwaren ohne ausgeprägten Schwerpunkt', 1177, '0');
INSERT INTO tblbranch VALUES (1180, '51.70.3 Grosshandel mit Fertigwaren ohne ausgeprägten Schwerpunkt', 1177, '0');
INSERT INTO tblbranch VALUES (1181, '52 Einzelhandel (ohne Handel mit Kraftfahrzeugen und ohne Tankstellen); Reparatur von Gebrauchsgütern', 963, '0');
INSERT INTO tblbranch VALUES (1182, '52.1 Einzelhandel mit Waren verschiedener Art (in Verkaufsräumen)', 1181, '0');
INSERT INTO tblbranch VALUES (1183, '52.11 Einzelhandel mit Waren verschiedener Art, Hauptrichtung Nahrungsmittel,Getränke und Tabakwaren', 1182, '0');
INSERT INTO tblbranch VALUES (1184, '52.11.1 Einzelhandel mit Nahrungsmitteln, Getränken und Tabakwaren ohneausgeprägten Schwerpunkt', 1183, '0');
INSERT INTO tblbranch VALUES (1185, '52.11.2 Sonstiger Einzelhandel mit Waren verschiedener Art, HauptrichtungNahrungsmittel, Getränke und Tabakwaren', 1183, '0');
INSERT INTO tblbranch VALUES (1186, '52.12 Sonstiger Einzelhandel mit Waren verschiedener Art', 1182, '0');
INSERT INTO tblbranch VALUES (1187, '52.12.1 Einzelhandel mit Waren verschiedener Art (ohne Nahrungsmittel)', 1186, '0');
INSERT INTO tblbranch VALUES (1188, '52.12.2 Einzelhandel mit Waren verschiedener Art, Hauptrichtung Nicht-Nahrungsmittel', 1186, '0');
INSERT INTO tblbranch VALUES (1189, '52.2 Facheinzelhandel mit Nahrungsmitteln, Getränken und Tabakwaren (inVerkaufsräumen)', 1181, '0');
INSERT INTO tblbranch VALUES (1190, '52.21 Einzelhandel mit Obst, Gemüse und Kartoffeln', 1189, '0');
INSERT INTO tblbranch VALUES (1191, '52.21.0 Einzelhandel mit Obst, Gemüse und Kartoffeln', 1190, '0');
INSERT INTO tblbranch VALUES (1192, '52.22 Einzelhandel mit Fleisch, Fleischwaren, Geflügel und Wild', 1189, '0');
INSERT INTO tblbranch VALUES (1193, '52.22.0 Einzelhandel mit Fleisch, Fleischwaren, Geflügel und Wild', 1192, '0');
INSERT INTO tblbranch VALUES (1194, '52.23 Einzelhandel mit Fisch und Fischerzeugnissen', 1189, '0');
INSERT INTO tblbranch VALUES (1195, '52.23.0 Einzelhandel mit Fisch und Fischerzeugnissen', 1194, '0');
INSERT INTO tblbranch VALUES (1196, '52.24 Einzelhandel mit Backwaren und Süsswaren', 1189, '0');
INSERT INTO tblbranch VALUES (1197, '52.24.1 Einzelhandel mit Brot und Konditorwaren', 1196, '0');
INSERT INTO tblbranch VALUES (1198, '52.24.2 Einzelhandel mit Süsswaren', 1196, '0');
INSERT INTO tblbranch VALUES (1199, '52.25 Einzelhandel mit Getränken', 1189, '0');
INSERT INTO tblbranch VALUES (1200, '52.25.1 Einzelhandel mit Wein, Sekt und Spirituosen', 1199, '0');
INSERT INTO tblbranch VALUES (1201, '52.25.2 Einzelhandel mit sonstigen Getränken', 1199, '0');
INSERT INTO tblbranch VALUES (1202, '52.26 Einzelhandel mit Tabakwaren', 1189, '0');
INSERT INTO tblbranch VALUES (1203, '52.26.0 Einzelhandel mit Tabakwaren', 1202, '0');
INSERT INTO tblbranch VALUES (1204, '52.27 Sonstiger Facheinzelhandel mit Nahrungsmitteln', 1189, '0');
INSERT INTO tblbranch VALUES (1205, '52.27.1 Einzelhandel mit Reformwaren', 1204, '0');
INSERT INTO tblbranch VALUES (1206, '52.27.2 Einzelhandel mit Milch, Milcherzeugnissen, Eiern, Speiseöl undNahrungsfetten', 1204, '0');
INSERT INTO tblbranch VALUES (1207, '52.27.3 Einzelhandel mit Kaffee, Tee und Kakao', 1204, '0');
INSERT INTO tblbranch VALUES (1208, '52.27.4 Facheinzelhandel mit Nahrungsmitteln a.n.g.', 1204, '0');
INSERT INTO tblbranch VALUES (1209, '52.3 Apotheken; Facheinzelhandel mit medizinischen, orthopädischen undkosmetischen Artikeln (in Verkaufsräumen)', 1181, '0');
INSERT INTO tblbranch VALUES (1210, '52.31 Apotheken', 1209, '0');
INSERT INTO tblbranch VALUES (1211, '52.31.0 Apotheken', 1210, '0');
INSERT INTO tblbranch VALUES (1212, '52.32 Einzelhandel mit medizinischen und orthopädischen Artikeln', 1209, '0');
INSERT INTO tblbranch VALUES (1213, '52.32.0 Einzelhandel mit medizinischen und orthopädischen Artikeln', 1212, '0');
INSERT INTO tblbranch VALUES (1214, '52.33 Einzelhandel mit kosmetischen Artikeln und Körperpflegemitteln', 1209, '0');
INSERT INTO tblbranch VALUES (1215, '52.33.1 Einzelhandel mit kosmetischen Erzeugnissen und Körperpflegemitteln (ohne Drogerieartikel)', 1214, '0');
INSERT INTO tblbranch VALUES (1216, '52.33.2 Einzelhandel mit Drogerieartikeln', 1214, '0');
INSERT INTO tblbranch VALUES (1217, '52.4 Sonstiger Facheinzelhandel (in Verkaufsräumen)', 1181, '0');
INSERT INTO tblbranch VALUES (1218, '52.41 Einzelhandel mit Textilien', 1217, '0');
INSERT INTO tblbranch VALUES (1219, '52.41.1 Einzelhandel mit Haustextilien', 1218, '0');
INSERT INTO tblbranch VALUES (1220, '52.41.2 Einzelhandel mit Kurzwaren, Schneidereibedarf, Handarbeiten sowie Meterware für Bekleidung und Wäsche', 1218, '0');
INSERT INTO tblbranch VALUES (1221, '52.42 Einzelhandel mit Bekleidung', 1217, '0');
INSERT INTO tblbranch VALUES (1222, '52.42.1 Einzelhandel mit Bekleidung ohne ausgeprägten Schwerpunkt', 1221, '0');
INSERT INTO tblbranch VALUES (1223, '52.42.2 Einzelhandel mit Herrenbekleidung und Bekleidungszubehör', 1221, '0');
INSERT INTO tblbranch VALUES (1224, '52.42.3 Einzelhandel mit Damenbekleidung und Bekleidungszubehör', 1221, '0');
INSERT INTO tblbranch VALUES (1225, '52.42.4 Einzelhandel mit Kinder- und Säuglingsbekleidung und Bekleidungszubehör', 1221, '0');
INSERT INTO tblbranch VALUES (1226, '52.42.5 Einzelhandel mit Kürschnerwaren', 1221, '0');
INSERT INTO tblbranch VALUES (1227, '52.43 Einzelhandel mit Schuhen und Lederwaren', 1217, '0');
INSERT INTO tblbranch VALUES (1228, '52.43.1 Einzelhandel mit Schuhen', 1227, '0');
INSERT INTO tblbranch VALUES (1229, '52.43.2 Einzelhandel mit Leder- und Täschnerwaren', 1227, '0');
INSERT INTO tblbranch VALUES (1230, '52.44 Einzelhandel mit Möbeln, Einrichtungsgegenständen und Hausrat a.n.g.', 1217, '0');
INSERT INTO tblbranch VALUES (1231, '52.44.1 Einzelhandel mit Wohnmöbeln', 1230, '0');
INSERT INTO tblbranch VALUES (1232, '52.44.2 Einzelhandel mit Beleuchtungsartikeln', 1230, '0');
INSERT INTO tblbranch VALUES (1233, '52.44.3 Einzelhandel mit Haushaltsgegenständen aus Metall und Kunststoff', 1230, '0');
INSERT INTO tblbranch VALUES (1234, '52.44.4 Einzelhandel mit keramischen Erzeugnissen und Glaswaren', 1230, '0');
INSERT INTO tblbranch VALUES (1235, '52.44.5 Einzelhandel mit Heimtextilien und Teppichen', 1230, '0');
INSERT INTO tblbranch VALUES (1236, '52.44.6 Einzelhandel mit Holz-, Kork-, Flecht- und Korbwaren', 1230, '0');
INSERT INTO tblbranch VALUES (1237, '52.45 Einzelhandel mit elektrischen Haushalts-, Rundfunk- und Fernsehgeräten sowie Musikinstrumenten', 1217, '0');
INSERT INTO tblbranch VALUES (1238, '52.45.1 Einzelhandel mit elektrischen Haushaltsgeräten und elektrotechnischen Erzeugnissen a.n.g.', 1237, '0');
INSERT INTO tblbranch VALUES (1239, '52.45.2 Einzelhandel mit Rundfunk-, Fernseh- und phonotechnischen Geräten und Zubehör', 1237, '0');
INSERT INTO tblbranch VALUES (1240, '52.45.3 Einzelhandel mit Musikinstrumenten und Musikalien', 1237, '0');
INSERT INTO tblbranch VALUES (1241, '52.46 Einzelhandel mit Metallwaren, Anstrichmitteln, Bau- und Heimwerkerbedarf', 1217, '0');
INSERT INTO tblbranch VALUES (1242, '52.46.1 Einzelhandel mit Eisen-, Metall- und Kunststoffwaren a.n.g.', 1241, '0');
INSERT INTO tblbranch VALUES (1243, '52.46.2 Einzelhandel mit Anstrichmitteln', 1241, '0');
INSERT INTO tblbranch VALUES (1244, '52.46.3 Einzelhandel mit Bau- und Heimwerkerbedarf', 1241, '0');
INSERT INTO tblbranch VALUES (1245, '52.47 Einzelhandel mit Büchern, Zeitschriften, Zeitungen, Schreibwaren und Bürobedarf', 1217, '0');
INSERT INTO tblbranch VALUES (1246, '52.47.1 Einzelhandel mit Schreib- und Papierwaren, Schul- und Büroartikeln', 1245, '0');
INSERT INTO tblbranch VALUES (1247, '52.47.2 Einzelhandel mit Büchern und Fachzeitschriften', 1245, '0');
INSERT INTO tblbranch VALUES (1248, '52.47.3 Einzelhandel mit Unterhaltungszeitschriften und Zeitungen', 1245, '0');
INSERT INTO tblbranch VALUES (1249, '52.48 Facheinzelhandel a.n.g. (in Verkaufsräumen)', 1217, '0');
INSERT INTO tblbranch VALUES (1250, '52.48.1 Einzelhandel mit Tapeten und Bodenbelägen', 1249, '0');
INSERT INTO tblbranch VALUES (1251, '52.48.2 Einzelhandel mit Kunstgegenständen, Bildern, kunstgewerblichen Erzeugnissen, Briefmarken, Münzen und Geschenkartikeln', 1249, '0');
INSERT INTO tblbranch VALUES (1252, '52.48.3 Einzelhandel mit Blumen, Pflanzen, zoologischem Bedarf, lebenden Tieren und Sämereien', 1249, '0');
INSERT INTO tblbranch VALUES (1253, '52.48.4 Einzelhandel mit feinmechanischen, Foto- und optischen Erzeugnissen, Computern und Software', 1249, '0');
INSERT INTO tblbranch VALUES (1254, '52.48.5 Einzelhandel mit Uhren, Edelmetallwaren und Schmuck', 1249, '0');
INSERT INTO tblbranch VALUES (1255, '52.48.6 Einzelhandel mit Spielwaren', 1249, '0');
INSERT INTO tblbranch VALUES (1256, '52.48.7 Einzelhandel mit Fahrrädern, Fahrradteilen und Zubehör, Sport- und Campingartikeln (ohne Campingmöbel)', 1249, '0');
INSERT INTO tblbranch VALUES (1257, '52.48.8 Einzelhandel mit Brennstoffen', 1249, '0');
INSERT INTO tblbranch VALUES (1258, '52.48.9 Sonstiger Facheinzelhandel a.n.g. (in Verkaufsräumen)', 1249, '0');
INSERT INTO tblbranch VALUES (1259, '52.5 Einzelhandel mit Antiquitäten und Gebrauchtwaren (in Verkaufsräumen)', 1181, '0');
INSERT INTO tblbranch VALUES (1260, '52.50 Einzelhandel mit Antiquitäten und Gebrauchtwaren (in Verkaufsräumen)', 1259, '0');
INSERT INTO tblbranch VALUES (1261, '52.50.1 Einzelhandel mit Antiquitäten und antiken Teppichen', 1260, '0');
INSERT INTO tblbranch VALUES (1262, '52.50.2 Antiquariate', 1260, '0');
INSERT INTO tblbranch VALUES (1263, '52.50.3 Einzelhandel mit sonstigen Gebrauchtwaren', 1260, '0');
INSERT INTO tblbranch VALUES (1264, '52.6 Einzelhandel (nicht in Verkaufsräumen)', 1181, '0');
INSERT INTO tblbranch VALUES (1265, '52.61 Versandhandel', 1264, '0');
INSERT INTO tblbranch VALUES (1266, '52.61.1 Versandhandel mit Waren ohne ausgeprägten Schwerpunkt', 1265, '0');
INSERT INTO tblbranch VALUES (1267, '52.61.2 Versandhandel mit Textilien, Bekleidung, Schuhen und Lederwaren', 1265, '0');
INSERT INTO tblbranch VALUES (1268, '52.61.3 Sonstiger Fachversandhandel', 1265, '0');
INSERT INTO tblbranch VALUES (1269, '52.62 Einzelhandel an Verkaufsständen und auf Märkten', 1264, '0');
INSERT INTO tblbranch VALUES (1270, '52.62.1 Einzelhandel mit Nahrungsmitteln und Getränken an Verkaufsständen und aufMärkten', 1269, '0');
INSERT INTO tblbranch VALUES (1271, '52.62.2 Sonstiger Einzelhandel an Verkaufsständen und auf Märkten', 1269, '0');
INSERT INTO tblbranch VALUES (1272, '52.63 Sonstiger Einzelhandel (nicht in Verkaufsräumen)', 1264, '0');
INSERT INTO tblbranch VALUES (1273, '52.63.1 Einzelhandel vom Lager mit Brennstoffen', 1272, '0');
INSERT INTO tblbranch VALUES (1274, '52.63.2 Sonstiger Einzelhandel vom Lager', 1272, '0');
INSERT INTO tblbranch VALUES (1275, '52.63.3 Einzelhandel a.n.g. (nicht in Verkaufsräumen)', 1272, '0');
INSERT INTO tblbranch VALUES (1276, '52.7 Reparatur von Gebrauchsgütern', 1181, '0');
INSERT INTO tblbranch VALUES (1277, '52.71 Reparatur von Schuhen und Lederwaren', 1276, '0');
INSERT INTO tblbranch VALUES (1278, '52.71.0 Reparatur von Schuhen und Lederwaren', 1277, '0');
INSERT INTO tblbranch VALUES (1279, '52.72 Reparatur von elektrischen Haushaltsgeräten', 1276, '0');
INSERT INTO tblbranch VALUES (1280, '52.72.1 Reparatur von elektrischen Haushaltsgeräten (ohne Rundfunk-, Fernseh- und phonotechnische Geräte)', 1279, '0');
INSERT INTO tblbranch VALUES (1281, '52.72.2 Reparatur von Rundfunk-, Fernseh- und phonotechnischen Geräten', 1279, '0');
INSERT INTO tblbranch VALUES (1282, '52.73 Reparatur von Uhren und Schmuck', 1276, '0');
INSERT INTO tblbranch VALUES (1283, '52.73.0 Reparatur von Uhren und Schmuck', 1282, '0');
INSERT INTO tblbranch VALUES (1284, '52.74 Reparatur von sonstigen Gebrauchsgütern', 1276, '0');
INSERT INTO tblbranch VALUES (1285, '52.74.1 Reparatur von Fahrrädern', 1284, '0');
INSERT INTO tblbranch VALUES (1286, '52.74.2 Reparatur von sonstigen Gebrauchsgütern a.n.g.', 1284, '0');
INSERT INTO tblbranch VALUES (1287, 'H Gastgewerbe', 1, '0');
INSERT INTO tblbranch VALUES (1288, 'HA Gastgewerbe', 1287, '0');
INSERT INTO tblbranch VALUES (1289, '55 Gastgewerbe', 1288, '0');
INSERT INTO tblbranch VALUES (1290, '55.1 Hotels, Gasthöfe, Pensionen und Hotels garnis', 1289, '0');
INSERT INTO tblbranch VALUES (1291, '55.11 Hotels, Gasthöfe und Pensionen', 1290, '0');
INSERT INTO tblbranch VALUES (1292, '55.11.1 Hotels (ohne Hotels garnis)', 1291, '0');
INSERT INTO tblbranch VALUES (1293, '55.11.2 Gasthöfe', 1291, '0');
INSERT INTO tblbranch VALUES (1294, '55.11.3 Pensionen', 1291, '0');
INSERT INTO tblbranch VALUES (1295, '55.12 Hotels garnis', 1290, '0');
INSERT INTO tblbranch VALUES (1296, '55.12.0 Hotels garnis', 1295, '0');
INSERT INTO tblbranch VALUES (1297, '55.2 Sonstiges Beherbergungsgewerbe', 1289, '0');
INSERT INTO tblbranch VALUES (1298, '55.21 Jugendherbergen und Hütten', 1297, '0');
INSERT INTO tblbranch VALUES (1299, '55.21.0 Jugendherbergen und Hütten', 1298, '0');
INSERT INTO tblbranch VALUES (1300, '55.22 Campingplätze', 1297, '0');
INSERT INTO tblbranch VALUES (1301, '55.22.0 Campingplätze', 1300, '0');
INSERT INTO tblbranch VALUES (1302, '55.23 Beherbergungsgewerbe a.n.g.', 1297, '0');
INSERT INTO tblbranch VALUES (1303, '55.23.1 Erholungs-, Ferien- und Schulungsheime', 1302, '0');
INSERT INTO tblbranch VALUES (1304, '55.23.2 Ferienzentren', 1302, '0');
INSERT INTO tblbranch VALUES (1305, '55.23.3 Ferienhäuser und Ferienwohnungen', 1302, '0');
INSERT INTO tblbranch VALUES (1306, '55.23.4 Privatquartiere', 1302, '0');
INSERT INTO tblbranch VALUES (1307, '55.23.5 Sonstiges Beherbergungsgewerbe a.n.g.', 1302, '0');
INSERT INTO tblbranch VALUES (1308, '55.3 Restaurants, Cafe\'s, Eisdielen und Imbisshallen', 1289, '0');
INSERT INTO tblbranch VALUES (1309, '55.30 Restaurants, Cafe\'s, Eisdielen und Imbisshallen', 1308, '0');
INSERT INTO tblbranch VALUES (1310, '55.30.1 Restaurants mit herkömmlicher Bedienung', 1309, '0');
INSERT INTO tblbranch VALUES (1311, '55.30.2 Restaurants mit Selbstbedienung', 1309, '0');
INSERT INTO tblbranch VALUES (1312, '55.30.3 Cafe\'s', 1309, '0');
INSERT INTO tblbranch VALUES (1313, '55.30.4 Eisdielen', 1309, '0');
INSERT INTO tblbranch VALUES (1314, '55.30.5 Imbisshallen', 1309, '0');
INSERT INTO tblbranch VALUES (1315, '55.4 Sonstiges Gaststättengewerbe', 1289, '0');
INSERT INTO tblbranch VALUES (1316, '55.40 Sonstiges Gaststättengewerbe', 1315, '0');
INSERT INTO tblbranch VALUES (1317, '55.40.1 Schankwirtschaften', 1316, '0');
INSERT INTO tblbranch VALUES (1318, '55.40.2 Bars und Vergnügungslokale', 1316, '0');
INSERT INTO tblbranch VALUES (1319, '55.40.3 Diskotheken und Tanzlokale', 1316, '0');
INSERT INTO tblbranch VALUES (1320, '55.40.4 Trinkhallen', 1316, '0');
INSERT INTO tblbranch VALUES (1321, '55.5 Kantinen und Caterer', 1289, '0');
INSERT INTO tblbranch VALUES (1322, '55.51 Kantinen', 1321, '0');
INSERT INTO tblbranch VALUES (1323, '55.51.0 Kantinen', 1322, '0');
INSERT INTO tblbranch VALUES (1324, '55.52 Caterer', 1321, '0');
INSERT INTO tblbranch VALUES (1325, '55.52.0 Caterer', 1324, '0');
INSERT INTO tblbranch VALUES (1326, 'I Verkehr und Nachrichtenübermittlung', 1, '0');
INSERT INTO tblbranch VALUES (1327, 'IA Verkehr und Nachrichtenübermittlung', 1326, '0');
INSERT INTO tblbranch VALUES (1328, '60 Landverkehr; Transport in Rohrfernleitungen', 1327, '0');
INSERT INTO tblbranch VALUES (1329, '60.1 Eisenbahnen', 1328, '0');
INSERT INTO tblbranch VALUES (1330, '60.10 Eisenbahnen', 1329, '0');
INSERT INTO tblbranch VALUES (1331, '60.10.1 Staatsbahn', 1330, '0');
INSERT INTO tblbranch VALUES (1332, '60.10.2 Privatbahnen', 1330, '0');
INSERT INTO tblbranch VALUES (1333, '60.2 Sonstiger Landverkehr', 1328, '0');
INSERT INTO tblbranch VALUES (1334, '60.21 Personenbeförderung im Linienverkehr zu Land', 1333, '0');
INSERT INTO tblbranch VALUES (1335, '60.21.1 Personenbeförderung im Omnibus-Orts- und -Nachbarortslinienverkehr', 1334, '0');
INSERT INTO tblbranch VALUES (1336, '60.21.2 Personenbeförderung im Omnibus-Überlandlinienverkehr', 1334, '0');
INSERT INTO tblbranch VALUES (1337, '60.21.3 Personenbeförderung mit Stadtschnellbahnen und Strassenbahnen', 1334, '0');
INSERT INTO tblbranch VALUES (1338, '60.21.4 Berg- und Seilbahnen', 1334, '0');
INSERT INTO tblbranch VALUES (1339, '60.22 Betrieb von Taxis und Mietwagen mit Fahrer', 1333, '0');
INSERT INTO tblbranch VALUES (1340, '60.22.0 Betrieb von Taxis und Mietwagen mit Fahrer', 1339, '0');
INSERT INTO tblbranch VALUES (1341, '60.23 Sonstige Personenbeförderung im Landverkehr', 1333, '0');
INSERT INTO tblbranch VALUES (1342, '60.23.1 Personenbeförderung im Omnibus-Gelegenheitsverkehr', 1341, '0');
INSERT INTO tblbranch VALUES (1343, '60.23.2 Personenbeförderung im Landverkehr a.n.g.', 1341, '0');
INSERT INTO tblbranch VALUES (1344, '60.24 Güterbeförderung im Strassenverkehr', 1333, '0');
INSERT INTO tblbranch VALUES (1345, '60.24.1 Erlaubnispflichtiger Strassen-Güternahverkehr (ohne Umzugsverkehr)', 1344, '0');
INSERT INTO tblbranch VALUES (1346, '60.24.2 Genehmigungspflichtiger Strassen-Güterfernverkehr (ohne Umzugsverkehr)', 1344, '0');
INSERT INTO tblbranch VALUES (1347, '60.24.3 Umzugsverkehr mit Kraftfahrzeugen', 1344, '0');
INSERT INTO tblbranch VALUES (1348, '60.24.4 Erlaubnisfreier und freigestellter Strassen-Güterverkehr', 1344, '0');
INSERT INTO tblbranch VALUES (1349, '60.3 Transport in Rohrfernleitungen', 1328, '0');
INSERT INTO tblbranch VALUES (1350, '60.30 Transport in Rohrfernleitungen', 1349, '0');
INSERT INTO tblbranch VALUES (1351, '60.30.0 Transport in Rohrfernleitungen', 1350, '0');
INSERT INTO tblbranch VALUES (1352, '61 Schiffahrt', 1327, '0');
INSERT INTO tblbranch VALUES (1353, '61.1 See- und Küstenschiffahrt', 1352, '0');
INSERT INTO tblbranch VALUES (1354, '61.10 See- und Küstenschiffahrt', 1353, '0');
INSERT INTO tblbranch VALUES (1355, '61.10.0 See- und Küstenschiffahrt', 1354, '0');
INSERT INTO tblbranch VALUES (1356, '61.2 Binnenschiffahrt', 1352, '0');
INSERT INTO tblbranch VALUES (1357, '61.20 Binnenschiffahrt', 1356, '0');
INSERT INTO tblbranch VALUES (1358, '61.20.1 Personenbeförderung in der Binnenschiffahrt', 1357, '0');
INSERT INTO tblbranch VALUES (1359, '61.20.2 Güterbeförderung in der Binnenschiffahrt durch Reedereien', 1357, '0');
INSERT INTO tblbranch VALUES (1360, '61.20.3 Güterbeförderung in der Binnenschiffahrt durch Partikuliere', 1357, '0');
INSERT INTO tblbranch VALUES (1361, '61.20.4 Fluss- und Kanalfähren, Hafenschiffahrt', 1357, '0');
INSERT INTO tblbranch VALUES (1362, '62 Luftfahrt', 1327, '0');
INSERT INTO tblbranch VALUES (1363, '62.1 Linienflugverkehr', 1362, '0');
INSERT INTO tblbranch VALUES (1364, '62.10 Linienflugverkehr', 1363, '0');
INSERT INTO tblbranch VALUES (1365, '62.10.0 Linienflugverkehr', 1364, '0');
INSERT INTO tblbranch VALUES (1366, '62.2 Gelegenheitsflugverkehr', 1362, '0');
INSERT INTO tblbranch VALUES (1367, '62.20 Gelegenheitsflugverkehr', 1366, '0');
INSERT INTO tblbranch VALUES (1368, '62.20.0 Gelegenheitsflugverkehr', 1367, '0');
INSERT INTO tblbranch VALUES (1369, '62.3 Raumtransport', 1362, '0');
INSERT INTO tblbranch VALUES (1370, '62.30 Raumtransport', 1369, '0');
INSERT INTO tblbranch VALUES (1371, '62.30.0 Raumtransport', 1370, '0');
INSERT INTO tblbranch VALUES (1372, '63 Hilfs- und Nebentätigkeiten für den Verkehr; Verkehrsvermittlung', 1327, '0');
INSERT INTO tblbranch VALUES (1373, '63.1 Frachtumschlag und Lagerei', 1372, '0');
INSERT INTO tblbranch VALUES (1374, '63.11 Frachtumschlag', 1373, '0');
INSERT INTO tblbranch VALUES (1375, '63.11.0 Frachtumschlag', 1374, '0');
INSERT INTO tblbranch VALUES (1376, '63.12 Lagerei', 1373, '0');
INSERT INTO tblbranch VALUES (1377, '63.12.1 Lagerei (ohne Kühlhäuser)', 1376, '0');
INSERT INTO tblbranch VALUES (1378, '63.12.2 Kühlhäuser', 1376, '0');
INSERT INTO tblbranch VALUES (1379, '63.2 Sonstige Hilfs- und Nebentätigkeiten für den Verkehr', 1372, '0');
INSERT INTO tblbranch VALUES (1380, '63.21 Sonstige Hilfs- und Nebentätigkeiten für den Landverkehr', 1379, '0');
INSERT INTO tblbranch VALUES (1381, '63.21.1 Parkhäuser und Parkplätze', 1380, '0');
INSERT INTO tblbranch VALUES (1382, '63.21.2 Hilfs- und Nebentätigkeiten für den Landverkehr a.n.g.', 1380, '0');
INSERT INTO tblbranch VALUES (1383, '63.22 Sonstige Hilfs- und Nebentätigkeiten für die Schiffahrt', 1379, '0');
INSERT INTO tblbranch VALUES (1384, '63.22.1 Sonstige Hilfs- und Nebentätigkeiten für die Binnenschiffahrt', 1383, '0');
INSERT INTO tblbranch VALUES (1385, '63.22.2 Seehafenbetriebe', 1383, '0');
INSERT INTO tblbranch VALUES (1386, '63.22.3 Bugsier- und Bergungsschiffahrt', 1383, '0');
INSERT INTO tblbranch VALUES (1387, '63.22.4 Lotsbetriebe', 1383, '0');
INSERT INTO tblbranch VALUES (1388, '63.23 Sonstige Hilfs- und Nebentätigkeiten für die Luftfahrt', 1379, '0');
INSERT INTO tblbranch VALUES (1389, '63.23.1 Flughafenbetriebe', 1388, '0');
INSERT INTO tblbranch VALUES (1390, '63.23.2 Landeplätze für Luftfahrzeuge', 1388, '0');
INSERT INTO tblbranch VALUES (1391, '63.23.3 Hilfs- und Nebentätigkeiten für die Luftfahrt a.n.g.', 1388, '0');
INSERT INTO tblbranch VALUES (1392, '63.3 Reisebüros und Reiseveranstalter', 1372, '0');
INSERT INTO tblbranch VALUES (1393, '63.30 Reisebüros und Reiseveranstalter', 1392, '0');
INSERT INTO tblbranch VALUES (1394, '63.30.1 Reisebüros', 1393, '0');
INSERT INTO tblbranch VALUES (1395, '63.30.2 Reiseveranstalter und Fremdenführung', 1393, '0');
INSERT INTO tblbranch VALUES (1396, '63.4 Spedition, sonstige Verkehrsvermittlung', 1372, '0');
INSERT INTO tblbranch VALUES (1397, '63.40 Spedition, sonstige Verkehrsvermittlung', 1396, '0');
INSERT INTO tblbranch VALUES (1398, '63.40.1 Spedition', 1397, '0');
INSERT INTO tblbranch VALUES (1399, '63.40.2 Schiffsmaklerbüros und -agenturen', 1397, '0');
INSERT INTO tblbranch VALUES (1400, '63.40.3 Verkehrsvermittlung a.n.g.', 1397, '0');
INSERT INTO tblbranch VALUES (1401, '64 Nachrichtenübermittlung', 1327, '0');
INSERT INTO tblbranch VALUES (1402, '64.1 Postdienste und private Kurierdienste', 1401, '0');
INSERT INTO tblbranch VALUES (1403, '64.11 Postdienste', 1402, '0');
INSERT INTO tblbranch VALUES (1404, '64.11.1 Postbriefdienste', 1403, '0');
INSERT INTO tblbranch VALUES (1405, '64.11.2 Postzeitungsdienste', 1403, '0');
INSERT INTO tblbranch VALUES (1406, '64.11.3 Postfrachtdienste', 1403, '0');
INSERT INTO tblbranch VALUES (1407, '64.11.4 Sonstige Postdienste', 1403, '0');
INSERT INTO tblbranch VALUES (1408, '64.12 Private Kurierdienste', 1402, '0');
INSERT INTO tblbranch VALUES (1409, '64.12.1 Private Briefdienste', 1408, '0');
INSERT INTO tblbranch VALUES (1410, '64.12.2 Private Zeitungsdienste', 1408, '0');
INSERT INTO tblbranch VALUES (1411, '64.12.3 Private Paketdienste', 1408, '0');
INSERT INTO tblbranch VALUES (1412, '64.12.4 Sonstige private Kurierdienste', 1408, '0');
INSERT INTO tblbranch VALUES (1413, '64.2 Fernmeldedienste', 1401, '0');
INSERT INTO tblbranch VALUES (1414, '64.20 Fernmeldedienste', 1413, '0');
INSERT INTO tblbranch VALUES (1415, '64.20.1 Betrieb von leitungsgebundenen Fernmeldenetzen', 1414, '0');
INSERT INTO tblbranch VALUES (1416, '64.20.2 Betrieb von nichtleitungsgebundenen Fernmeldenetzen', 1414, '0');
INSERT INTO tblbranch VALUES (1417, '64.20.3 Sprachdienste mittels terrestrischer und Funknetze', 1414, '0');
INSERT INTO tblbranch VALUES (1418, '64.20.4 Textdienste mittels terrestrischer und Funknetze', 1414, '0');
INSERT INTO tblbranch VALUES (1419, '64.20.5 Bilddienste mittels terrestrischer und Funknetze', 1414, '0');
INSERT INTO tblbranch VALUES (1420, '64.20.6 Datendienste mittels terrestrischer und Funknetze', 1414, '0');
INSERT INTO tblbranch VALUES (1421, '64.20.7 Sonstige Fernmeldedienstleistungen', 1414, '0');
INSERT INTO tblbranch VALUES (1422, 'J Kredit- und Versicherungsgewerbe', 1, '0');
INSERT INTO tblbranch VALUES (1423, 'JA Kredit- und Versicherungsgewerbe', 1422, '0');
INSERT INTO tblbranch VALUES (1424, '65 Kreditgewerbe', 1423, '0');
INSERT INTO tblbranch VALUES (1425, '65.1 Zentralbanken und Kreditinstitute', 1424, '0');
INSERT INTO tblbranch VALUES (1426, '65.11 Zentralbanken', 1425, '0');
INSERT INTO tblbranch VALUES (1427, '65.11.0 Zentralbanken', 1426, '0');
INSERT INTO tblbranch VALUES (1428, '65.12 Kreditinstitute (ohne Spezialkreditinstitute)', 1425, '0');
INSERT INTO tblbranch VALUES (1429, '65.12.1 Kreditbanken einschliesslich Zweigstellen ausländischer Banken', 1428, '0');
INSERT INTO tblbranch VALUES (1430, '65.12.2 Girozentralen', 1428, '0');
INSERT INTO tblbranch VALUES (1431, '65.12.3 Sparkassen', 1428, '0');
INSERT INTO tblbranch VALUES (1432, '65.12.4 Genossenschaftliche Zentralbanken', 1428, '0');
INSERT INTO tblbranch VALUES (1433, '65.12.5 Kreditgenossenschaften', 1428, '0');
INSERT INTO tblbranch VALUES (1434, '65.12.6 Realkreditinstitute', 1428, '0');
INSERT INTO tblbranch VALUES (1435, '65.12.7 Kreditinstitute mit Sonderaufgaben', 1428, '0');
INSERT INTO tblbranch VALUES (1436, '65.12.8 Postgiro- und Postsparkassenämter', 1428, '0');
INSERT INTO tblbranch VALUES (1437, '65.12.9 Bausparkassen', 1428, '0');
INSERT INTO tblbranch VALUES (1438, '65.2 Sonstige Finanzierungsinstitutionen', 1424, '0');
INSERT INTO tblbranch VALUES (1439, '65.21 Institutionen für Finanzierungsleasing', 1438, '0');
INSERT INTO tblbranch VALUES (1440, '65.21.0 Institutionen für Finanzierungsleasing', 1439, '0');
INSERT INTO tblbranch VALUES (1441, '65.22 Spezialkreditinstitute', 1438, '0');
INSERT INTO tblbranch VALUES (1442, '65.22.0 Spezialkreditinstitute', 1441, '0');
INSERT INTO tblbranch VALUES (1443, '65.23 Finanzierungsinstitutionen a.n.g.', 1438, '0');
INSERT INTO tblbranch VALUES (1444, '65.23.1 Kapitalanlagegesellschaften', 1443, '0');
INSERT INTO tblbranch VALUES (1445, '65.23.2 Leihhäuser', 1443, '0');
INSERT INTO tblbranch VALUES (1446, '65.23.3 Sonstige Finanzierungsinstitutionen a.n.g.', 1443, '0');
INSERT INTO tblbranch VALUES (1447, '66 Versicherungsgewerbe', 1423, '0');
INSERT INTO tblbranch VALUES (1448, '66.0 Versicherungsgewerbe', 1447, '0');
INSERT INTO tblbranch VALUES (1449, '66.01 Lebensversicherung', 1448, '0');
INSERT INTO tblbranch VALUES (1450, '66.01.1 Lebensversicherung (ohne Rückversicherung)', 1449, '0');
INSERT INTO tblbranch VALUES (1451, '66.01.2 Rückversicherung für die Lebensversicherung', 1449, '0');
INSERT INTO tblbranch VALUES (1452, '66.02 Pensions- und Sterbekassen', 1448, '0');
INSERT INTO tblbranch VALUES (1453, '66.02.0 Pensions- und Sterbekassen', 1452, '0');
INSERT INTO tblbranch VALUES (1454, '66.03 Sonstiges Versicherungsgewerbe', 1448, '0');
INSERT INTO tblbranch VALUES (1455, '66.03.1 Krankenversicherung', 1454, '0');
INSERT INTO tblbranch VALUES (1456, '66.03.2 Schaden- und Unfallversicherung', 1454, '0');
INSERT INTO tblbranch VALUES (1457, '66.03.3 Rückversicherung für das sonstige Versicherungsgewerbe', 1454, '0');
INSERT INTO tblbranch VALUES (1458, '67 Mit dem Kredit- und Versicherungsgewerbe verbundene Tätigkeiten', 1423, '0');
INSERT INTO tblbranch VALUES (1459, '67.1 Mit dem Kreditgewerbe verbundene Tätigkeiten', 1458, '0');
INSERT INTO tblbranch VALUES (1460, '67.11 Effekten- und Warenterminbörsen', 1459, '0');
INSERT INTO tblbranch VALUES (1461, '67.11.0 Effekten- und Warenterminbörsen', 1460, '0');
INSERT INTO tblbranch VALUES (1462, '67.12 Effektenvermittlung und -verwaltung (ohne Effektenverwahrung)', 1459, '0');
INSERT INTO tblbranch VALUES (1463, '67.12.0 Effektenvermittlung und -verwaltung (ohne Effektenverwahrung)', 1462, '0');
INSERT INTO tblbranch VALUES (1464, '67.13 Sonstige mit dem Kreditgewerbe verbundene Tätigkeiten', 1459, '0');
INSERT INTO tblbranch VALUES (1465, '67.13.0 Sonstige mit dem Kreditgewerbe verbundene Tätigkeiten', 1464, '0');
INSERT INTO tblbranch VALUES (1466, '67.2 Mit dem Versicherungsgewerbe verbundene Tätigkeiten', 1458, '0');
INSERT INTO tblbranch VALUES (1467, '67.20 Mit dem Versicherungsgewerbe verbundene Tätigkeiten', 1466, '0');
INSERT INTO tblbranch VALUES (1468, '67.20.1 Versicherungsvertreter', 1467, '0');
INSERT INTO tblbranch VALUES (1469, '67.20.2 Versicherungsmakler', 1467, '0');
INSERT INTO tblbranch VALUES (1470, '67.20.3 Sonstige mit dem Versicherungsgewerbe verbundene Tätigkeiten', 1467, '0');
INSERT INTO tblbranch VALUES (1471, 'K Grundstücks- und Wohnungswesen, Vermietung beweglicher Sachen, Erbringung von Dienstleistungen überwiegend für Unternehmen', 1, '0');
INSERT INTO tblbranch VALUES (1472, 'KA Grundstücks- und Wohnungswesen, Vermietung beweglicher Sachen, Erbringung von Dienstleistungen überwiegend für Unternehmen', 1471, '0');
INSERT INTO tblbranch VALUES (1473, '70 Grundstücks- und Wohnungswesen', 1472, '0');
INSERT INTO tblbranch VALUES (1474, '70.1 Erschliessung, Kauf und Verkauf von Grundstücken, Gebäuden und Wohnungen', 1473, '0');
INSERT INTO tblbranch VALUES (1475, '70.11 Erschliessung von Grundstücken', 1474, '0');
INSERT INTO tblbranch VALUES (1476, '70.11.1 Erschliessung von unbebauten Grundstücken', 1475, '0');
INSERT INTO tblbranch VALUES (1477, '70.11.2 Bauträger für Nichtwohngebäude', 1475, '0');
INSERT INTO tblbranch VALUES (1478, '70.11.3 Bauträger für Wohngebäude', 1475, '0');
INSERT INTO tblbranch VALUES (1479, '70.12 Kauf und Verkauf von eigenen Grundstücken, Gebäuden und Wohnungen', 1474, '0');
INSERT INTO tblbranch VALUES (1480, '70.12.1 Kauf und Verkauf von eigenen Grundstücken und Nichtwohngebäuden', 1479, '0');
INSERT INTO tblbranch VALUES (1481, '70.12.2 Kauf und Verkauf von eigenen Wohngebäuden und Wohnungen', 1479, '0');
INSERT INTO tblbranch VALUES (1482, '70.2 Vermietung und Verpachtung von eigenen Grundstücken, Gebäuden undWohnungen', 1473, '0');
INSERT INTO tblbranch VALUES (1483, '70.20 Vermietung und Verpachtung von eigenen Grundstücken, Gebäuden undWohnungen', 1482, '0');
INSERT INTO tblbranch VALUES (1484, '70.20.1 Vermietung und Verpachtung von eigenen Grundstücken undNichtwohngebäuden', 1483, '0');
INSERT INTO tblbranch VALUES (1485, '70.20.2 Vermietung und Verpachtung von eigenen Wohngebäuden und Wohnungen', 1483, '0');
INSERT INTO tblbranch VALUES (1486, '70.3 Vermittlung und Verwaltung von Grundstücken, Gebäuden und Wohnungen', 1473, '0');
INSERT INTO tblbranch VALUES (1487, '70.31 Vermittlung von Grundstücken, Gebäuden und Wohnungen', 1486, '0');
INSERT INTO tblbranch VALUES (1488, '70.31.0 Vermittlung von Grundstücken, Gebäuden und Wohnungen', 1487, '0');
INSERT INTO tblbranch VALUES (1489, '70.32 Verwaltung von Grundstücken, Gebäuden und Wohnungen', 1486, '0');
INSERT INTO tblbranch VALUES (1490, '70.32.0 Verwaltung von Grundstücken, Gebäuden und Wohnungen', 1489, '0');
INSERT INTO tblbranch VALUES (1491, '71 Vermietung beweglicher Sachen ohne Bedienungspersonal', 1472, '0');
INSERT INTO tblbranch VALUES (1492, '71.1 Vermietung von Kraftwagen bis 3,5t Gesamtgewicht', 1491, '0');
INSERT INTO tblbranch VALUES (1493, '71.10 Vermietung von Kraftwagen bis 3,5t Gesamtgewicht', 1492, '0');
INSERT INTO tblbranch VALUES (1494, '71.10.0 Vermietung von Kraftwagen bis 3,5t Gesamtgewicht', 1493, '0');
INSERT INTO tblbranch VALUES (1495, '71.2 Vermietung von sonstigen Verkehrsmitteln', 1491, '0');
INSERT INTO tblbranch VALUES (1496, '71.21 Vermietung von Landfahrzeugen (ohne Kraftwagen bis 3,5t Gesamtgewicht)', 1495, '0');
INSERT INTO tblbranch VALUES (1497, '71.21.0 Vermietung von Landfahrzeugen (ohne Kraftwagen bis 3,5t Gesamtgewicht)', 1496, '0');
INSERT INTO tblbranch VALUES (1498, '71.22 Vermietung von Wasserfahrzeugen', 1495, '0');
INSERT INTO tblbranch VALUES (1499, '71.22.0 Vermietung von Wasserfahrzeugen', 1498, '0');
INSERT INTO tblbranch VALUES (1500, '71.23 Vermietung von Luftfahrzeugen', 1495, '0');
INSERT INTO tblbranch VALUES (1501, '71.23.0 Vermietung von Luftfahrzeugen', 1500, '0');
INSERT INTO tblbranch VALUES (1502, '71.3 Vermietung von Maschinen und Geräten', 1491, '0');
INSERT INTO tblbranch VALUES (1503, '71.31 Vermietung von landwirtschaftlichen Maschinen und Geräten', 1502, '0');
INSERT INTO tblbranch VALUES (1504, '71.31.0 Vermietung von landwirtschaftlichen Maschinen und Geräten', 1503, '0');
INSERT INTO tblbranch VALUES (1505, '71.32 Vermietung von Baumaschinen und -geräten', 1502, '0');
INSERT INTO tblbranch VALUES (1506, '71.32.0 Vermietung von Baumaschinen und -geräten', 1505, '0');
INSERT INTO tblbranch VALUES (1507, '71.33 Vermietung von Büromaschinen, Datenverarbeitungsgeräten und -einrichtungen', 1502, '0');
INSERT INTO tblbranch VALUES (1508, '71.33.0 Vermietung von Büromaschinen, Datenverarbeitungsgeräten und -einrichtungen', 1507, '0');
INSERT INTO tblbranch VALUES (1509, '71.34 Vermietung von sonstigen Maschinen und Geräten', 1502, '0');
INSERT INTO tblbranch VALUES (1510, '71.34.0 Vermietung von sonstigen Maschinen und Geräten', 1509, '0');
INSERT INTO tblbranch VALUES (1511, '71.4 Vermietung von Gebrauchsgütern a.n.g.', 1491, '0');
INSERT INTO tblbranch VALUES (1512, '71.40 Vermietung von Gebrauchsgütern a.n.g.', 1511, '0');
INSERT INTO tblbranch VALUES (1513, '71.40.1 Verleih von Wäsche und Arbeitskleidung', 1512, '0');
INSERT INTO tblbranch VALUES (1514, '71.40.2 Verleih von Sportgeräten und Fahrrädern', 1512, '0');
INSERT INTO tblbranch VALUES (1515, '71.40.3 Leihbüchereien und Lesezirkel', 1512, '0');
INSERT INTO tblbranch VALUES (1516, '71.40.4 Videotheken', 1512, '0');
INSERT INTO tblbranch VALUES (1517, '71.40.5 Vermietung von sonstigen Gebrauchsgütern a.n.g.', 1512, '0');
INSERT INTO tblbranch VALUES (1518, '72 Datenverarbeitung und Datenbanken', 1472, '0');
INSERT INTO tblbranch VALUES (1519, '72.1 Hardwareberatung', 1518, '0');
INSERT INTO tblbranch VALUES (1520, '72.10 Hardwareberatung', 1519, '0');
INSERT INTO tblbranch VALUES (1521, '72.10.0 Hardwareberatung', 1520, '0');
INSERT INTO tblbranch VALUES (1522, '72.2 Softwarehäuser', 1518, '0');
INSERT INTO tblbranch VALUES (1523, '72.20 Softwarehäuser', 1522, '0');
INSERT INTO tblbranch VALUES (1524, '72.20.1 Softwareberatung', 1523, '0');
INSERT INTO tblbranch VALUES (1525, '72.20.2 Softwareentwicklung', 1523, '0');
INSERT INTO tblbranch VALUES (1526, '72.3 Datenverarbeitungsdienste', 1518, '0');
INSERT INTO tblbranch VALUES (1527, '72.30 Datenverarbeitungsdienste', 1526, '0');
INSERT INTO tblbranch VALUES (1528, '72.30.1 Datenerfassungsdienste', 1527, '0');
INSERT INTO tblbranch VALUES (1529, '72.30.2 Datenverarbeitungs- und Tabellierungsdienste', 1527, '0');
INSERT INTO tblbranch VALUES (1530, '72.30.3 Bereitstellungsdienste für Teilnehmersysteme', 1527, '0');
INSERT INTO tblbranch VALUES (1531, '72.30.4 Sonstige Datenverarbeitungsdienste', 1527, '0');
INSERT INTO tblbranch VALUES (1532, '72.4 Datenbanken', 1518, '0');
INSERT INTO tblbranch VALUES (1533, '72.40 Datenbanken', 1532, '0');
INSERT INTO tblbranch VALUES (1534, '72.40.0 Datenbanken', 1533, '0');
INSERT INTO tblbranch VALUES (1535, '72.5 Instandhaltung und Reparatur von Büromaschinen,Datenverarbeitungsgeräten und -einrichtungen', 1518, '0');
INSERT INTO tblbranch VALUES (1536, '72.50 Instandhaltung und Reparatur von Büromaschinen,Datenverarbeitungsgeräten und -einrichtungen', 1535, '0');
INSERT INTO tblbranch VALUES (1537, '72.50.0 Instandhaltung und Reparatur von Büromaschinen,Datenverarbeitungsgeräten und -einrichtungen', 1536, '0');
INSERT INTO tblbranch VALUES (1538, '72.6 Sonstige mit der Datenverarbeitung verbundene Tätigkeiten', 1518, '0');
INSERT INTO tblbranch VALUES (1539, '72.60 Sonstige mit der Datenverarbeitung verbundene Tätigkeiten', 1538, '0');
INSERT INTO tblbranch VALUES (1540, '72.60.1 Informationsvermittlung', 1539, '0');
INSERT INTO tblbranch VALUES (1541, '72.60.2 Mit der Datenverarbeitung verbundene Tätigkeiten a.n.g.', 1539, '0');
INSERT INTO tblbranch VALUES (1542, '73 Forschung und Entwicklung', 1472, '0');
INSERT INTO tblbranch VALUES (1543, '73.1 Forschung und Entwicklung im Bereich Natur-, Ingenieur-, Agrarwissenschaften und Medizin', 1542, '0');
INSERT INTO tblbranch VALUES (1544, '73.10 Forschung und Entwicklung im Bereich Natur-, Ingenieur-, Agrarwissenschaften und Medizin', 1543, '0');
INSERT INTO tblbranch VALUES (1545, '73.10.1 Forschung und Entwicklung im Bereich Naturwissenschaften und Mathematik', 1544, '0');
INSERT INTO tblbranch VALUES (1546, '73.10.2 Forschung und Entwicklung im Bereich Ingenieurwissenschaften', 1544, '0');
INSERT INTO tblbranch VALUES (1547, '73.10.3 Forschung und Entwicklung im Bereich Agrar-, Forst- und Ernährungswissenschaften', 1544, '0');
INSERT INTO tblbranch VALUES (1548, '73.10.4 Forschung und Entwicklung im Bereich Medizin', 1544, '0');
INSERT INTO tblbranch VALUES (1549, '73.10.5 Forschung und Entwicklung im Umweltbereich', 1544, '0');
INSERT INTO tblbranch VALUES (1550, '73.2 Forschung und Entwicklung im Bereich Rechts-, Wirtschafts- und Sozialwissenschaften sowie im Bereich Sprach-, Kultur und Kunstwissenschaften', 1542, '0');
INSERT INTO tblbranch VALUES (1551, '73.20 Forschung und Entwicklung im Bereich Rechts-, Wirtschafts- undSozialwissenschaften sowie im Bereich Sprach-, Kultur und Kunstwissenschaften', 1550, '0');
INSERT INTO tblbranch VALUES (1552, '73.20.1 Forschung und Entwicklung im Bereich Rechts-, Wirtschafts- und Sozialwissenschaften', 1551, '0');
INSERT INTO tblbranch VALUES (1553, '73.20.2 Forschung und Entwicklung im Bereich Sprach-, Kultur- und Kunstwissenschaften', 1551, '0');
INSERT INTO tblbranch VALUES (1554, '74 Erbringung von Dienstleistungen überwiegend für Unternehmen', 1472, '0');
INSERT INTO tblbranch VALUES (1555, '74.1 Rechts-, Steuer- und Unternehmensberatung, Markt- und Meinungsforschung,Beteiligungsgesellschaften', 1554, '0');
INSERT INTO tblbranch VALUES (1556, '74.11 Rechtsberatung', 1555, '0');
INSERT INTO tblbranch VALUES (1557, '74.11.1 Rechtsanwaltskanzleien mit Notariat', 1556, '0');
INSERT INTO tblbranch VALUES (1558, '74.11.2 Rechtsanwaltskanzleien ohne Notariat', 1556, '0');
INSERT INTO tblbranch VALUES (1559, '74.11.3 Notariat', 1556, '0');
INSERT INTO tblbranch VALUES (1560, '74.11.4 Patentanwaltskanzleien', 1556, '0');
INSERT INTO tblbranch VALUES (1561, '74.11.5 Sonstige Rechtsberatung', 1556, '0');
INSERT INTO tblbranch VALUES (1562, '74.12 Wirtschaftsprüfung und Steuerberatung', 1555, '0');
INSERT INTO tblbranch VALUES (1563, '74.12.1 Praxen von Wirtschaftsprüfern, Wirtschaftsprüfungsgesellschaften', 1562, '0');
INSERT INTO tblbranch VALUES (1564, '74.12.2 Praxen von vereidigten Buchprüfern, Buchprüfungsgesellschaften', 1562, '0');
INSERT INTO tblbranch VALUES (1565, '74.12.3 Praxen von Steuerberatern, Steuerberatungsgesellschaften', 1562, '0');
INSERT INTO tblbranch VALUES (1566, '74.12.4 Praxen von Steuerbevollmächtigten', 1562, '0');
INSERT INTO tblbranch VALUES (1567, '74.12.5 Buchführung (ohne Datenverarbeitungsdienste)', 1562, '0');
INSERT INTO tblbranch VALUES (1568, '74.13 Markt- und Meinungsforschung', 1555, '0');
INSERT INTO tblbranch VALUES (1569, '74.13.1 Marktforschung', 1568, '0');
INSERT INTO tblbranch VALUES (1570, '74.13.2 Meinungsforschung', 1568, '0');
INSERT INTO tblbranch VALUES (1571, '74.14 Unternehmens- und Public-Relations-Beratung', 1555, '0');
INSERT INTO tblbranch VALUES (1572, '74.14.1 Unternehmensberatung', 1571, '0');
INSERT INTO tblbranch VALUES (1573, '74.14.2 Public-Relations-Beratung', 1571, '0');
INSERT INTO tblbranch VALUES (1574, '74.15 Beteiligungsgesellschaften (ohne Kapitalanlagegesellschaften)', 1555, '0');
INSERT INTO tblbranch VALUES (1575, '74.15.1 Beteiligungsgesellschaften mit Schwerpunkt im Produzierenden Gewerbe', 1574, '0');
INSERT INTO tblbranch VALUES (1576, '74.15.2 Sonstige Beteiligungsgesellschaften (ohne geschlossene Immobilienfonds)', 1574, '0');
INSERT INTO tblbranch VALUES (1577, '74.15.3 Geschlossene Immobilienfonds mit Nicht-Wohngebäuden', 1574, '0');
INSERT INTO tblbranch VALUES (1578, '74.15.4 Geschlossene Immobilienfonds mit Wohngebäuden', 1574, '0');
INSERT INTO tblbranch VALUES (1579, '74.15.5 Komplementärgesellschaften', 1574, '0');
INSERT INTO tblbranch VALUES (1580, '74.15.6 Verwaltung und Führung von Unternehmen und Betrieben', 1574, '0');
INSERT INTO tblbranch VALUES (1581, '74.2 Architektur- und Ingenieurbüros', 1554, '0');
INSERT INTO tblbranch VALUES (1582, '74.20 Architektur- und Ingenieurbüros', 1581, '0');
INSERT INTO tblbranch VALUES (1583, '74.20.1 Architekturbüros für Hochbau und für Innenarchitektur', 1582, '0');
INSERT INTO tblbranch VALUES (1584, '74.20.2 Architekturbüros für Orts-, Regional- und Landesplanung', 1582, '0');
INSERT INTO tblbranch VALUES (1585, '74.20.3 Architekturbüros für Garten- und Landschaftsgestaltung', 1582, '0');
INSERT INTO tblbranch VALUES (1586, '74.20.4 Ingenieurbüros für bautechnische Gesamtplanung', 1582, '0');
INSERT INTO tblbranch VALUES (1587, '74.20.5 Ingenieurbüros für technische Fachplanung', 1582, '0');
INSERT INTO tblbranch VALUES (1588, '74.20.6 Büros für Industrie-Design', 1582, '0');
INSERT INTO tblbranch VALUES (1589, '74.20.7 Büros baufachlicher Gutachter', 1582, '0');
INSERT INTO tblbranch VALUES (1590, '74.20.8 Büros für technisch-wirtschaftliche Beratung', 1582, '0');
INSERT INTO tblbranch VALUES (1591, '74.20.9 Vermessungsbüros', 1582, '0');
INSERT INTO tblbranch VALUES (1592, '74.3 Technische, physikalische und chemische Untersuchung', 1554, '0');
INSERT INTO tblbranch VALUES (1593, '74.30 Technische, physikalische und chemische Untersuchung', 1592, '0');
INSERT INTO tblbranch VALUES (1594, '74.30.1 Technische Untersuchung und Beratung', 1593, '0');
INSERT INTO tblbranch VALUES (1595, '74.30.2 Physikalische Untersuchung und Beratung', 1593, '0');
INSERT INTO tblbranch VALUES (1596, '74.30.3 Chemische Untersuchung und Beratung', 1593, '0');
INSERT INTO tblbranch VALUES (1597, '74.30.4 Betrieb von Messnetzen und Messstationen', 1593, '0');
INSERT INTO tblbranch VALUES (1598, '74.4 Werbung', 1554, '0');
INSERT INTO tblbranch VALUES (1599, '74.40 Werbung', 1598, '0');
INSERT INTO tblbranch VALUES (1600, '74.40.1 Werbegestaltung', 1599, '0');
INSERT INTO tblbranch VALUES (1601, '74.40.2 Werbemittelverbreitung und Werbemittlung', 1599, '0');
INSERT INTO tblbranch VALUES (1602, '74.5 Gewerbsmässige Vermittlung und Überlassung von Arbeitskräften', 1554, '0');
INSERT INTO tblbranch VALUES (1603, '74.50 Gewerbsmässige Vermittlung und Überlassung von Arbeitskräften', 1602, '0');
INSERT INTO tblbranch VALUES (1604, '74.50.1 Gewerbsmässige Vermittlung von Arbeitskräften', 1603, '0');
INSERT INTO tblbranch VALUES (1605, '74.50.2 Gewerbsmässige Überlassung von Arbeitskräften', 1603, '0');
INSERT INTO tblbranch VALUES (1606, '74.6 Detekteien und Schutzdienste', 1554, '0');
INSERT INTO tblbranch VALUES (1607, '74.60 Detekteien und Schutzdienste', 1606, '0');
INSERT INTO tblbranch VALUES (1608, '74.60.1 Detekteien', 1607, '0');
INSERT INTO tblbranch VALUES (1609, '74.60.2 Personen- und Objektschutzdienste', 1607, '0');
INSERT INTO tblbranch VALUES (1610, '74.7 Reinigung von Gebäuden, Inventar und Verkehrsmitteln', 1554, '0');
INSERT INTO tblbranch VALUES (1611, '74.70 Reinigung von Gebäuden, Inventar und Verkehrsmitteln', 1610, '0');
INSERT INTO tblbranch VALUES (1612, '74.70.1 Reinigung von Gebäuden, Räumen und Inventar', 1611, '0');
INSERT INTO tblbranch VALUES (1613, '74.70.2 Schornsteinreinigung', 1611, '0');
INSERT INTO tblbranch VALUES (1614, '74.70.3 Reinigung von Verkehrsmitteln', 1611, '0');
INSERT INTO tblbranch VALUES (1615, '74.70.4 Desinfektion und Schädlingsbekämpfung', 1611, '0');
INSERT INTO tblbranch VALUES (1616, '74.8 Erbringung von sonstigen Dienstleistungen überwiegend für Unternehmen', 1554, '0');
INSERT INTO tblbranch VALUES (1617, '74.81 Fotografisches Gewerbe und fotografische Laboratorien', 1616, '0');
INSERT INTO tblbranch VALUES (1618, '74.81.1 Fotografisches Gewerbe', 1617, '0');
INSERT INTO tblbranch VALUES (1619, '74.81.2 Fotografische Laboratorien', 1617, '0');
INSERT INTO tblbranch VALUES (1620, '74.82 Abfüll- und Verpackungsgewerbe', 1616, '0');
INSERT INTO tblbranch VALUES (1621, '74.82.0 Abfüll- und Verpackungsgewerbe', 1620, '0');
INSERT INTO tblbranch VALUES (1622, '74.83 Schreib- und Übersetzungsbüros', 1616, '0');
INSERT INTO tblbranch VALUES (1623, '74.83.1 Schreibbüros', 1622, '0');
INSERT INTO tblbranch VALUES (1624, '74.83.2 Übersetzungsbüros und Dolmetscher', 1622, '0');
INSERT INTO tblbranch VALUES (1625, '74.84 Erbringung von Dienstleistungen überwiegend für Unternehmen a.n.g.', 1616, '0');
INSERT INTO tblbranch VALUES (1626, '74.84.1 Ausstellungs-, Messe- und Warenmarkteinrichtungen', 1625, '0');
INSERT INTO tblbranch VALUES (1627, '74.84.2 Sachverständige a.n.g.', 1625, '0');
INSERT INTO tblbranch VALUES (1628, '74.84.3 Versteigerungsgewerbe', 1625, '0');
INSERT INTO tblbranch VALUES (1629, '74.84.4 Ateliers für Textil-, Schmuck-, Möbel- u.ä. Design', 1625, '0');
INSERT INTO tblbranch VALUES (1630, '74.84.5 Auskunfteien', 1625, '0');
INSERT INTO tblbranch VALUES (1631, '74.84.6 Inkassobüros', 1625, '0');
INSERT INTO tblbranch VALUES (1632, '74.84.7 Sonstige Vermögensberatung und Vermögensverwaltung', 1625, '0');
INSERT INTO tblbranch VALUES (1633, '74.84.8 Erbringung von sonstigen Dienstleistungen überwiegend für Unternehmen a.n.g.', 1625, '0');
INSERT INTO tblbranch VALUES (1634, 'L Öffentliche Verwaltung, Verteidigung, Sozialversicherung', 1, '0');
INSERT INTO tblbranch VALUES (1635, 'LA Öffentliche Verwaltung, Verteidigung, Sozialversicherung', 1634, '0');
INSERT INTO tblbranch VALUES (1636, '75 Öffentliche Verwaltung, Verteidigung, Sozialversicherung', 1635, '0');
INSERT INTO tblbranch VALUES (1637, '75.1 Öffentliche Verwaltung', 1636, '0');
INSERT INTO tblbranch VALUES (1638, '75.11 Allgemeine öffentliche Verwaltung', 1637, '0');
INSERT INTO tblbranch VALUES (1639, '75.11.0 Allgemeine öffentliche Verwaltung', 1638, '0');
INSERT INTO tblbranch VALUES (1640, '75.12 öffentliche Verwaltung auf den Gebieten des Gesundheitswesens, derBildung, der Kultur und des Sozialwesens', 1637, '0');
INSERT INTO tblbranch VALUES (1641, '75.12.1 öffentliche Verwaltung auf dem Gebiet des Gesundheitswesens und Sports', 1640, '0');
INSERT INTO tblbranch VALUES (1642, '75.12.2 öffentliche Verwaltung auf dem Gebiet der Bildung und Kultur', 1640, '0');
INSERT INTO tblbranch VALUES (1643, '75.12.3 öffentliche Verwaltung auf dem Gebiet des Sozialwesens', 1640, '0');
INSERT INTO tblbranch VALUES (1644, '75.13 Wirtschaftsförderung, -ordnung und -aufsicht', 1637, '0');
INSERT INTO tblbranch VALUES (1645, '75.13.0 Wirtschaftsförderung, -ordnung und -aufsicht', 1644, '0');
INSERT INTO tblbranch VALUES (1646, '75.14 Sonstige mit der öffentlichen Verwaltung verbundene Tätigkeiten', 1637, '0');
INSERT INTO tblbranch VALUES (1647, '75.14.0 Sonstige mit der öffentlichen Verwaltung verbundene Tätigkeiten', 1646, '0');
INSERT INTO tblbranch VALUES (1648, '75.2 Auswärtige Angelegenheiten, Verteidigung, Rechtsschutz, öffentliche Sicherheit und Ordnung', 1636, '0');
INSERT INTO tblbranch VALUES (1649, '75.21 Auswärtige Angelegenheiten', 1648, '0');
INSERT INTO tblbranch VALUES (1650, '75.21.0 Auswärtige Angelegenheiten', 1649, '0');
INSERT INTO tblbranch VALUES (1651, '75.22 Verteidigung', 1648, '0');
INSERT INTO tblbranch VALUES (1652, '75.22.0 Verteidigung', 1651, '0');
INSERT INTO tblbranch VALUES (1653, '75.23 Rechtsschutz', 1648, '0');
INSERT INTO tblbranch VALUES (1654, '75.23.0 Rechtsschutz', 1653, '0');
INSERT INTO tblbranch VALUES (1655, '75.24 öffentliche Sicherheit und Ordnung', 1648, '0');
INSERT INTO tblbranch VALUES (1656, '75.24.0 öffentliche Sicherheit und Ordnung', 1655, '0');
INSERT INTO tblbranch VALUES (1657, '75.25 Feuerschutz', 1648, '0');
INSERT INTO tblbranch VALUES (1658, '75.25.0 Feuerschutz', 1657, '0');
INSERT INTO tblbranch VALUES (1659, '75.3 Sozialversicherung und Arbeitsförderung', 1636, '0');
INSERT INTO tblbranch VALUES (1660, '75.30 Sozialversicherung und Arbeitsförderung', 1659, '0');
INSERT INTO tblbranch VALUES (1661, '75.30.1 Gesetzliche Rentenversicherung (ohne knappschaftliche Rentenversicherung und Altershilfe für Landwirte)', 1660, '0');
INSERT INTO tblbranch VALUES (1662, '75.30.2 Knappschaftliche Rentenversicherung', 1660, '0');
INSERT INTO tblbranch VALUES (1663, '75.30.3 Altershilfe für Landwirte', 1660, '0');
INSERT INTO tblbranch VALUES (1664, '75.30.4 Zusatzversorgung für Angehörige des öffentlichen Dienstes', 1660, '0');
INSERT INTO tblbranch VALUES (1665, '75.30.5 Gesetzliche Krankenversicherung (ohne knappschaftlicheKrankenversicherung)', 1660, '0');
INSERT INTO tblbranch VALUES (1666, '75.30.6 Knappschaftliche Krankenversicherung', 1660, '0');
INSERT INTO tblbranch VALUES (1667, '75.30.7 Gesetzliche Unfallversicherung', 1660, '0');
INSERT INTO tblbranch VALUES (1668, '75.30.8 Arbeitsförderung', 1660, '0');
INSERT INTO tblbranch VALUES (1669, '75.30.9 Sonstige Sozialversicherung und Arbeitsförderung', 1660, '0');
INSERT INTO tblbranch VALUES (1670, 'M Erziehung und Unterricht', 1, '0');
INSERT INTO tblbranch VALUES (1671, 'MA Erziehung und Unterricht', 1670, '0');
INSERT INTO tblbranch VALUES (1672, '80 Erziehung und Unterricht', 1671, '0');
INSERT INTO tblbranch VALUES (1673, '80.1 Kindergärten, Vor- und Grundschulen', 1672, '0');
INSERT INTO tblbranch VALUES (1674, '80.10 Kindergärten, Vor- und Grundschulen', 1673, '0');
INSERT INTO tblbranch VALUES (1675, '80.10.1 Kindergärten', 1674, '0');
INSERT INTO tblbranch VALUES (1676, '80.10.2 Kinderhorte', 1674, '0');
INSERT INTO tblbranch VALUES (1677, '80.10.3 Vor- und Grundschulen', 1674, '0');
INSERT INTO tblbranch VALUES (1678, '80.2 Weiterführende Schulen', 1672, '0');
INSERT INTO tblbranch VALUES (1679, '80.21 Allgemeinbildende weiterführende Schulen', 1678, '0');
INSERT INTO tblbranch VALUES (1680, '80.21.0 Allgemeinbildende weiterführende Schulen', 1679, '0');
INSERT INTO tblbranch VALUES (1681, '80.22 Berufsbildende weiterführende Schulen', 1678, '0');
INSERT INTO tblbranch VALUES (1682, '80.22.1 Berufsbildende weiterführende Schulen im Sekundarbereich', 1681, '0');
INSERT INTO tblbranch VALUES (1683, '80.22.2 Berufs- und Fachakademien (ohne Hochschulen)', 1681, '0');
INSERT INTO tblbranch VALUES (1684, '80.3 Hochschulen', 1672, '0');
INSERT INTO tblbranch VALUES (1685, '80.30 Hochschulen', 1684, '0');
INSERT INTO tblbranch VALUES (1686, '80.30.1 Universitäten', 1685, '0');
INSERT INTO tblbranch VALUES (1687, '80.30.2 Kunsthochschulen', 1685, '0');
INSERT INTO tblbranch VALUES (1688, '80.30.3 Allgemeine Fachhochschulen', 1685, '0');
INSERT INTO tblbranch VALUES (1689, '80.30.4 Verwaltungsfachhochschulen', 1685, '0');
INSERT INTO tblbranch VALUES (1690, '80.4 Erwachsenenbildung und sonstiger Unterricht', 1672, '0');
INSERT INTO tblbranch VALUES (1691, '80.41 Fahrschulen', 1690, '0');
INSERT INTO tblbranch VALUES (1692, '80.41.1 Kraftfahrschulen', 1691, '0');
INSERT INTO tblbranch VALUES (1693, '80.41.2 Flug-, Bootsführer-, Segel- u.ä. Schulen', 1691, '0');
INSERT INTO tblbranch VALUES (1694, '80.42 Erwachsenenbildung und Unterricht a.n.g.', 1690, '0');
INSERT INTO tblbranch VALUES (1695, '80.42.1 Allgemeine und politische Erwachsenenbildung', 1694, '0');
INSERT INTO tblbranch VALUES (1696, '80.42.2 Berufliche Erwachsenenbildung', 1694, '0');
INSERT INTO tblbranch VALUES (1697, '80.42.3 Selbständige Lehrer', 1694, '0');
INSERT INTO tblbranch VALUES (1698, '80.42.4 Unterricht a.n.g.', 1694, '0');
INSERT INTO tblbranch VALUES (1699, 'N Gesundheits-, Veterinär- und Sozialwesen', 1, '0');
INSERT INTO tblbranch VALUES (1700, 'NA Gesundheits-, Veterinär- und Sozialwesen', 1699, '0');
INSERT INTO tblbranch VALUES (1701, '85 Gesundheits-, Veterinär- und Sozialwesen', 1700, '0');
INSERT INTO tblbranch VALUES (1702, '85.1 Gesundheitswesen', 1701, '0');
INSERT INTO tblbranch VALUES (1703, '85.11 Krankenhäuser', 1702, '0');
INSERT INTO tblbranch VALUES (1704, '85.11.1 Krankenhäuser (ohne Hochschulkliniken sowie Vorsorge- und Rehabilitationskliniken)', 1703, '0');
INSERT INTO tblbranch VALUES (1705, '85.11.2 Hochschulkliniken', 1703, '0');
INSERT INTO tblbranch VALUES (1706, '85.11.3 Vorsorge- und Rehabilitationskliniken', 1703, '0');
INSERT INTO tblbranch VALUES (1707, '85.12 Arztpraxen (ohne Zahnarztpraxen)', 1702, '0');
INSERT INTO tblbranch VALUES (1708, '85.12.1 Praxen von ärzten für Allgemeinmedizin und von praktischen ärzten', 1707, '0');
INSERT INTO tblbranch VALUES (1709, '85.12.2 Praxen von Fachärzten (ohne ärzte für Allgemeinmedizin)', 1707, '0');
INSERT INTO tblbranch VALUES (1710, '85.13 Zahnarztpraxen', 1702, '0');
INSERT INTO tblbranch VALUES (1711, '85.13.0 Zahnarztpraxen', 1710, '0');
INSERT INTO tblbranch VALUES (1712, '85.14 Gesundheitswesen a.n.g.', 1702, '0');
INSERT INTO tblbranch VALUES (1713, '85.14.1 Praxen von psychologischen Psychotherapeuten', 1712, '0');
INSERT INTO tblbranch VALUES (1714, '85.14.2 Praxen von Masseuren, medizinischen Bademeistern, Krankengymnasten,Hebammen und verwandten Berufen', 1712, '0');
INSERT INTO tblbranch VALUES (1715, '85.14.3 Praxen von Heilpraktikern', 1712, '0');
INSERT INTO tblbranch VALUES (1716, '85.14.4 Sonstige selbständige Tätigkeiten im Gesundheitswesen', 1712, '0');
INSERT INTO tblbranch VALUES (1717, '85.14.5 Krankentransport- und Rettungsdienste', 1712, '0');
INSERT INTO tblbranch VALUES (1718, '85.14.6 Sonstige Anstalten und Einrichtungen des Gesundheitswesens', 1712, '0');
INSERT INTO tblbranch VALUES (1719, '85.2 Veterinärwesen', 1701, '0');
INSERT INTO tblbranch VALUES (1720, '85.20 Veterinärwesen', 1719, '0');
INSERT INTO tblbranch VALUES (1721, '85.20.1 Tierarztpraxen', 1720, '0');
INSERT INTO tblbranch VALUES (1722, '85.20.2 Sonstige selbständige Tätigkeiten im Veterinärwesen', 1720, '0');
INSERT INTO tblbranch VALUES (1723, '85.20.3 Anstalten und Einrichtungen des Veterinärwesens', 1720, '0');
INSERT INTO tblbranch VALUES (1724, '85.3 Sozialwesen', 1701, '0');
INSERT INTO tblbranch VALUES (1725, '85.31 Heime (ohne Fremden-, Erholungs- und Ferienheime)', 1724, '0');
INSERT INTO tblbranch VALUES (1726, '85.31.1 Wohnheime für Jugendliche, Schüler, Auszubildende, Studenten und Berufstätige', 1725, '0');
INSERT INTO tblbranch VALUES (1727, '85.31.2 Erziehungsheime', 1725, '0');
INSERT INTO tblbranch VALUES (1728, '85.31.3 Altenwohnheime', 1725, '0');
INSERT INTO tblbranch VALUES (1729, '85.31.4 Altenheime', 1725, '0');
INSERT INTO tblbranch VALUES (1730, '85.31.5 Altenpflegeheime', 1725, '0');
INSERT INTO tblbranch VALUES (1731, '85.31.6 Heime für werdende Mütter sowie Mütter oder Väter mit Kind', 1725, '0');
INSERT INTO tblbranch VALUES (1732, '85.31.7 Einrichtungen zur Eingliederung und Pflege Behinderter', 1725, '0');
INSERT INTO tblbranch VALUES (1733, '85.31.8 Wohnheime für Behinderte', 1725, '0');
INSERT INTO tblbranch VALUES (1734, '85.31.9 Sonstige Heime (ohne Fremden-, Erholungs- und Ferienheime)', 1725, '0');
INSERT INTO tblbranch VALUES (1735, '85.32 Sozialwesen a.n.g.', 1724, '0');
INSERT INTO tblbranch VALUES (1736, '85.32.1 Tagesstätten (ohne Kinderkrippen, Kindergärten und Jugendzentren)', 1735, '0');
INSERT INTO tblbranch VALUES (1737, '85.32.2 Kinderkrippen und ausserhäusliche Kinderbetreuung a.n.g.', 1735, '0');
INSERT INTO tblbranch VALUES (1738, '85.32.3 Jugendzentren und Häuser der offenen Tür', 1735, '0');
INSERT INTO tblbranch VALUES (1739, '85.32.4 Erziehungs-, Jugend- und Familienberatungsstellen', 1735, '0');
INSERT INTO tblbranch VALUES (1740, '85.32.5 Sonstige soziale Beratungsstellen', 1735, '0');
INSERT INTO tblbranch VALUES (1741, '85.32.6 Ambulante soziale Dienste', 1735, '0');
INSERT INTO tblbranch VALUES (1742, '85.32.7 Organisationen der freien Wohlfahrtspflege und Jugendhilfe', 1735, '0');
INSERT INTO tblbranch VALUES (1743, '85.32.8 Unterstützungskassen', 1735, '0');
INSERT INTO tblbranch VALUES (1744, '85.32.9 Sonstiges Sozialwesen a.n.g.', 1735, '0');
INSERT INTO tblbranch VALUES (1745, 'O Erbringung von sonstigen öffentlichen und persönlichen Dienstleistungen', 1, '0');
INSERT INTO tblbranch VALUES (1746, 'OA Erbringung von sonstigen öffentlichen und persönlichen Dienstleistungen', 1745, '0');
INSERT INTO tblbranch VALUES (1747, '90 Abwasser- und Abfallbeseitigung und sonstige Entsorgung', 1746, '0');
INSERT INTO tblbranch VALUES (1748, '90.0 Abwasser- und Abfallbeseitigung und sonstige Entsorgung', 1747, '0');
INSERT INTO tblbranch VALUES (1749, '90.00 Abwasser- und Abfallbeseitigung und sonstige Entsorgung', 1748, '0');
INSERT INTO tblbranch VALUES (1750, '90.00.1 Kläranlagen', 1749, '0');
INSERT INTO tblbranch VALUES (1751, '90.00.2 Sammelkanalisation', 1749, '0');
INSERT INTO tblbranch VALUES (1752, '90.00.3 Sammlung, Beförderung und Zwischenlagerung von Abfällen', 1749, '0');
INSERT INTO tblbranch VALUES (1753, '90.00.4 Kompostierungsanlagen', 1749, '0');
INSERT INTO tblbranch VALUES (1754, '90.00.5 Abfallverbrennungsanlagen', 1749, '0');
INSERT INTO tblbranch VALUES (1755, '90.00.6 Sonstige Abfallbehandlungsanlagen', 1749, '0');
INSERT INTO tblbranch VALUES (1756, '90.00.7 Abfalldeponien', 1749, '0');
INSERT INTO tblbranch VALUES (1757, '90.00.8 Städtereinigung und sonstige Entsorgungseinrichtungen', 1749, '0');
INSERT INTO tblbranch VALUES (1758, '90.00.9 Bodensanierung und Rekultivierung von geschädigten Flächen', 1749, '0');
INSERT INTO tblbranch VALUES (1759, '91 Interessenvertretungen sowie kirchliche und sonstige religiöse Vereinigungen(ohne Sozialwesen und Sport)', 1746, '0');
INSERT INTO tblbranch VALUES (1760, '91.1 Wirtschafts- und Arbeitgeberverbände, Berufsorganisationen', 1759, '0');
INSERT INTO tblbranch VALUES (1761, '91.11 Wirtschafts- und Arbeitgeberverbände', 1760, '0');
INSERT INTO tblbranch VALUES (1762, '91.11.1 Wirtschaftsverbände (ohne öffentlich-rechtliche Wirtschaftsvertretungen)', 1761, '0');
INSERT INTO tblbranch VALUES (1763, '91.11.2 öffentlich-rechtliche Wirtschaftsvertretungen', 1761, '0');
INSERT INTO tblbranch VALUES (1764, '91.11.3 Arbeitgeberverbände', 1761, '0');
INSERT INTO tblbranch VALUES (1765, '91.12 Berufsorganisationen', 1760, '0');
INSERT INTO tblbranch VALUES (1766, '91.12.1 Berufsorganisationen (ohne öffentlich-rechtliche Berufsvertretungen)', 1765, '0');
INSERT INTO tblbranch VALUES (1767, '91.12.2 öffentlich-rechtliche Berufsvertretungen', 1765, '0');
INSERT INTO tblbranch VALUES (1768, '91.2 Gewerkschaften', 1759, '0');
INSERT INTO tblbranch VALUES (1769, '91.20 Gewerkschaften', 1768, '0');
INSERT INTO tblbranch VALUES (1770, '91.20.0 Gewerkschaften', 1769, '0');
INSERT INTO tblbranch VALUES (1771, '91.3 Sonstige Interessenvertretungen sowie kirchliche und sonstige religiöse Vereinigungen (ohne Sozialwesen und Sport)', 1759, '0');
INSERT INTO tblbranch VALUES (1772, '91.31 Kirchliche und sonstige religiöse Vereinigungen', 1771, '0');
INSERT INTO tblbranch VALUES (1773, '91.31.1 Kirchen und kirchlich-religiöse Vereinigungen', 1772, '0');
INSERT INTO tblbranch VALUES (1774, '91.31.2 Sonstige religiöse und weltanschauliche Vereinigungen', 1772, '0');
INSERT INTO tblbranch VALUES (1775, '91.32 Politische Parteien', 1771, '0');
INSERT INTO tblbranch VALUES (1776, '91.32.0 Politische Parteien', 1775, '0');
INSERT INTO tblbranch VALUES (1777, '91.33 Interessenvertretungen a.n.g.', 1771, '0');
INSERT INTO tblbranch VALUES (1778, '91.33.1 Organisationen der Bildung, Wissenschaft, Forschung und Kultur', 1777, '0');
INSERT INTO tblbranch VALUES (1779, '91.33.2 Organisationen des Gesundheitswesens', 1777, '0');
INSERT INTO tblbranch VALUES (1780, '91.33.3 Jugendorganisationen', 1777, '0');
INSERT INTO tblbranch VALUES (1781, '91.33.4 Verbraucherorganisationen', 1777, '0');
INSERT INTO tblbranch VALUES (1782, '91.33.5 Kommunale Spitzen- und Regionalverbände', 1777, '0');
INSERT INTO tblbranch VALUES (1783, '91.33.6 Verbände der Sozialversicherungsträger', 1777, '0');
INSERT INTO tblbranch VALUES (1784, '91.33.7 Sonstige Interessenvertretungen a.n.g.', 1777, '0');
INSERT INTO tblbranch VALUES (1785, '92 Kultur, Sport und Unterhaltung', 1746, '0');
INSERT INTO tblbranch VALUES (1786, '92.1 Film- und Videofilmherstellung, -verleih und -vertrieb, Filmtheater', 1785, '0');
INSERT INTO tblbranch VALUES (1787, '92.11 Film- und Videofilmherstellung', 1786, '0');
INSERT INTO tblbranch VALUES (1788, '92.11.1 Herstellung von Kinofilmen', 1787, '0');
INSERT INTO tblbranch VALUES (1789, '92.11.2 Herstellung von Fernsehfilmen', 1787, '0');
INSERT INTO tblbranch VALUES (1790, '92.11.3 Herstellung von Industrie-, Wirtschafts- und Werbefilmen', 1787, '0');
INSERT INTO tblbranch VALUES (1791, '92.11.4 Sonstige Filmherstellung', 1787, '0');
INSERT INTO tblbranch VALUES (1792, '92.11.5 Filmtechnik', 1787, '0');
INSERT INTO tblbranch VALUES (1793, '92.12 Filmverleih und Videoprogrammanbieter', 1786, '0');
INSERT INTO tblbranch VALUES (1794, '92.12.1 Filmverleih', 1793, '0');
INSERT INTO tblbranch VALUES (1795, '92.12.2 Videoprogrammanbieter', 1793, '0');
INSERT INTO tblbranch VALUES (1796, '92.12.3 Filmvertrieb', 1793, '0');
INSERT INTO tblbranch VALUES (1797, '92.13 Filmtheater', 1786, '0');
INSERT INTO tblbranch VALUES (1798, '92.13.0 Filmtheater', 1797, '0');
INSERT INTO tblbranch VALUES (1799, '92.2 Hörfunk- und Fernsehanstalten, Herstellung von Hörfunk- undFernsehprogrammen', 1785, '0');
INSERT INTO tblbranch VALUES (1800, '92.20 Hörfunk- und Fernsehanstalten, Herstellung von Hörfunk- undFernsehprogrammen', 1799, '0');
INSERT INTO tblbranch VALUES (1801, '92.20.1 Hörfunk- und Fernsehanstalten', 1800, '0');
INSERT INTO tblbranch VALUES (1802, '92.20.2 Herstellung von Hörfunk- und Fernsehprogrammen', 1800, '0');
INSERT INTO tblbranch VALUES (1803, '92.3 Erbringung von sonstigen kulturellen und unterhaltenden Leistungen', 1785, '0');
INSERT INTO tblbranch VALUES (1804, '92.31 Künstlerische und schriftstellerische Tätigkeiten und Darbietungen', 1803, '0');
INSERT INTO tblbranch VALUES (1805, '92.31.1 Theaterensembles', 1804, '0');
INSERT INTO tblbranch VALUES (1806, '92.31.2 Ballettgruppen, Orchester, Kapellen und Chöre', 1804, '0');
INSERT INTO tblbranch VALUES (1807, '92.31.3 Selbständige bildende Künstler', 1804, '0');
INSERT INTO tblbranch VALUES (1808, '92.31.4 Selbständige Restauratoren', 1804, '0');
INSERT INTO tblbranch VALUES (1809, '92.31.5 Selbständige Komponisten und Musikbearbeiter', 1804, '0');
INSERT INTO tblbranch VALUES (1810, '92.31.6 Selbständige Schriftsteller', 1804, '0');
INSERT INTO tblbranch VALUES (1811, '92.31.7 Selbständige Bühnen-, Film-, Hörfunk- und Fernsehkünstler', 1804, '0');
INSERT INTO tblbranch VALUES (1812, '92.31.8 Selbständige Artisten', 1804, '0');
INSERT INTO tblbranch VALUES (1813, '92.32 Betrieb und technische Hilfsdienste für kulturelle und unterhaltendeLeistungen', 1803, '0');
INSERT INTO tblbranch VALUES (1814, '92.32.1 Theater- und Konzertveranstalter', 1813, '0');
INSERT INTO tblbranch VALUES (1815, '92.32.2 Opern- und Schauspielhäuser, Konzerthallen und ähnliche Einrichtungen', 1813, '0');
INSERT INTO tblbranch VALUES (1816, '92.32.3 Variete\'s und Kleinkunstbühnen', 1813, '0');
INSERT INTO tblbranch VALUES (1817, '92.32.4 Tonstudios', 1813, '0');
INSERT INTO tblbranch VALUES (1818, '92.32.5 Technische Hilfsdienste für kulturelle und unterhaltende Leistungen', 1813, '0');
INSERT INTO tblbranch VALUES (1819, '92.33 Schaustellergewerbe und Vergnügungsparks', 1803, '0');
INSERT INTO tblbranch VALUES (1820, '92.33.0 Schaustellergewerbe und Vergnügungsparks', 1819, '0');
INSERT INTO tblbranch VALUES (1821, '92.34 Erbringung von kulturellen und unterhaltenden Leistungen a.n.g.', 1803, '0');
INSERT INTO tblbranch VALUES (1822, '92.34.1 Tanzschulen', 1821, '0');
INSERT INTO tblbranch VALUES (1823, '92.34.2 Erbringung von sonstigen kulturellen und unterhaltenden Leistungen a.n.g.', 1821, '0');
INSERT INTO tblbranch VALUES (1824, '92.4 Korrespondenz- und Nachrichtenbüros sowie selbständige Journalisten', 1785, '0');
INSERT INTO tblbranch VALUES (1825, '92.40 Korrespondenz- und Nachrichtenbüros sowie selbständige Journalisten', 1824, '0');
INSERT INTO tblbranch VALUES (1826, '92.40.1 Korrespondenz- und Nachrichtenbüros', 1825, '0');
INSERT INTO tblbranch VALUES (1827, '92.40.2 Selbständige Journalisten und Pressefotografen', 1825, '0');
INSERT INTO tblbranch VALUES (1828, '92.5 Bibliotheken, Archive, Museen, botanische und zoologische Gärten', 1785, '0');
INSERT INTO tblbranch VALUES (1829, '92.51 Bibliotheken und Archive', 1828, '0');
INSERT INTO tblbranch VALUES (1830, '92.51.0 Bibliotheken und Archive', 1829, '0');
INSERT INTO tblbranch VALUES (1831, '92.52 Museen und Denkmalschutz', 1828, '0');
INSERT INTO tblbranch VALUES (1832, '92.52.1 Museen und Kunstausstellungen', 1831, '0');
INSERT INTO tblbranch VALUES (1833, '92.52.2 Denkmalschutz', 1831, '0');
INSERT INTO tblbranch VALUES (1834, '92.53 Botanische und zoologische Gärten sowie Naturparks', 1828, '0');
INSERT INTO tblbranch VALUES (1835, '92.53.1 Botanische und zoologische Gärten', 1834, '0');
INSERT INTO tblbranch VALUES (1836, '92.53.2 Naturparks und Tiergehege', 1834, '0');
INSERT INTO tblbranch VALUES (1837, '92.53.3 Natur- und Landschaftsschutz', 1834, '0');
INSERT INTO tblbranch VALUES (1838, '92.6 Sport', 1785, '0');
INSERT INTO tblbranch VALUES (1839, '92.61 Betrieb von Sportanlagen', 1838, '0');
INSERT INTO tblbranch VALUES (1840, '92.61.0 Betrieb von Sportanlagen', 1839, '0');
INSERT INTO tblbranch VALUES (1841, '92.62 Erbringung von sonstigen Dienstleistungen des Sports', 1838, '0');
INSERT INTO tblbranch VALUES (1842, '92.62.1 Sportverbände und Sportvereine', 1841, '0');
INSERT INTO tblbranch VALUES (1843, '92.62.2 Professionelle Sportmannschaften und Rennställe', 1841, '0');
INSERT INTO tblbranch VALUES (1844, '92.62.3 Selbständige Berufssportler und -trainer', 1841, '0');
INSERT INTO tblbranch VALUES (1845, '92.62.4 Sportpromoter und sonstige professionelle Sportveranstalter', 1841, '0');
INSERT INTO tblbranch VALUES (1846, '92.62.5 Sportschulen und selbständige Sportlehrer', 1841, '0');
INSERT INTO tblbranch VALUES (1847, '92.7 Erbringung von sonstigen Dienstleistungen für Unterhaltung, Erholung und Freizeit', 1785, '0');
INSERT INTO tblbranch VALUES (1848, '92.71 Spiel-, Wett- und Lotteriewesen', 1847, '0');
INSERT INTO tblbranch VALUES (1849, '92.71.1 Spielhallen und Betrieb von Spielautomaten', 1848, '0');
INSERT INTO tblbranch VALUES (1850, '92.71.2 Spielbanken und Spielklubs', 1848, '0');
INSERT INTO tblbranch VALUES (1851, '92.71.3 Wett-, Toto- und Lotteriewesen', 1848, '0');
INSERT INTO tblbranch VALUES (1852, '92.72 Erbringung von Dienstleistungen für Unterhaltung, Erholung und Freizeit a.n.g.', 1847, '0');
INSERT INTO tblbranch VALUES (1853, '92.72.1 Garten- und Grünanlagen', 1852, '0');
INSERT INTO tblbranch VALUES (1854, '92.72.2 Erbringung von sonstigen Dienstleistungen für Unterhaltung, Erholung und Freizeit a.n.g.', 1852, '0');
INSERT INTO tblbranch VALUES (1855, '93 Erbringung von sonstigen Dienstleistungen', 1746, '0');
INSERT INTO tblbranch VALUES (1856, '93.0 Erbringung von sonstigen Dienstleistungen', 1855, '0');
INSERT INTO tblbranch VALUES (1857, '93.01 Wäscherei und chemische Reinigung', 1856, '0');
INSERT INTO tblbranch VALUES (1858, '93.01.1 Wäscherei', 1857, '0');
INSERT INTO tblbranch VALUES (1859, '93.01.2 Annahmestellen für Wäscherei', 1857, '0');
INSERT INTO tblbranch VALUES (1860, '93.01.3 Chemische Reinigung und Bekleidungsfärberei', 1857, '0');
INSERT INTO tblbranch VALUES (1861, '93.01.4 Annahmestellen für chemische Reinigung und Bekleidungsfärberei', 1857, '0');
INSERT INTO tblbranch VALUES (1862, '93.01.5 Heissmangelei und Bügelei', 1857, '0');
INSERT INTO tblbranch VALUES (1863, '93.02 Friseurgewerbe und Kosmetiksalons', 1856, '0');
INSERT INTO tblbranch VALUES (1864, '93.02.1 Damen- und Herrenfriseurgewerbe', 1863, '0');
INSERT INTO tblbranch VALUES (1865, '93.02.2 Damenfriseurgewerbe', 1863, '0');
INSERT INTO tblbranch VALUES (1866, '93.02.3 Herrenfriseurgewerbe', 1863, '0');
INSERT INTO tblbranch VALUES (1867, '93.02.4 Kosmetiksalons', 1863, '0');
INSERT INTO tblbranch VALUES (1868, '93.03 Bestattungswesen', 1856, '0');
INSERT INTO tblbranch VALUES (1869, '93.03.1 Bestattungsinstitute', 1868, '0');
INSERT INTO tblbranch VALUES (1870, '93.03.2 Friedhöfe und Krematorien', 1868, '0');
INSERT INTO tblbranch VALUES (1871, '93.04 Bäder, Saunas, Solarien u.ä.', 1856, '0');
INSERT INTO tblbranch VALUES (1872, '93.04.1 Bäder und Saunas (ohne medizinische Bäder)', 1871, '0');
INSERT INTO tblbranch VALUES (1873, '93.04.2 Solarien und Massagesalons (ohne medizinische Massagen)', 1871, '0');
INSERT INTO tblbranch VALUES (1874, '93.05 Erbringung von Dienstleistungen a.n.g.', 1856, '0');
INSERT INTO tblbranch VALUES (1875, '93.05.1 Ehevermittlungsinstitute', 1874, '0');
INSERT INTO tblbranch VALUES (1876, '93.05.2 Erbringung von sonstigen persönlichen Dienstleistungen', 1874, '0');
INSERT INTO tblbranch VALUES (1877, '93.05.3 Erbringung von sonstigen Dienstleistungen a.n.g.', 1874, '0');
INSERT INTO tblbranch VALUES (1878, 'P Private Haushalte', 1, '0');
INSERT INTO tblbranch VALUES (1879, 'PA Private Haushalte', 1878, '0');
INSERT INTO tblbranch VALUES (1880, '95 Private Haushalte', 1879, '0');
INSERT INTO tblbranch VALUES (1881, '95.0 Private Haushalte', 1880, '0');
INSERT INTO tblbranch VALUES (1882, '95.00 Private Haushalte', 1881, '0');
INSERT INTO tblbranch VALUES (1883, '95.00.1 Private Haushalte ohne Hauspersonal', 1882, '0');
INSERT INTO tblbranch VALUES (1884, '95.00.2 Private Haushalte mit Hauspersonal zur Kinderbetreuung', 1882, '0');
INSERT INTO tblbranch VALUES (1885, '95.00.3 Private Haushalte mit sonstigem Hauspersonal', 1882, '0');
INSERT INTO tblbranch VALUES (1886, 'Q Exterritoriale Organisationen und Körperschaften', 1, '0');
INSERT INTO tblbranch VALUES (1887, 'QA Exterritoriale Organisationen und Körperschaften', 1886, '0');
INSERT INTO tblbranch VALUES (1888, '99 Exterritoriale Organisationen und Körperschaften', 1887, '0');
INSERT INTO tblbranch VALUES (1889, '99.0 Exterritoriale Organisationen und Körperschaften', 1888, '0');
INSERT INTO tblbranch VALUES (1890, '99.00 Exterritoriale Organisationen und Körperschaften', 1889, '0');
INSERT INTO tblbranch VALUES (1891, '99.00.1 Vertretungen fremder Staaten', 1890, '0');
INSERT INTO tblbranch VALUES (1892, '99.00.2 Dienststellen von Stationierungsstreitkräften', 1890, '0');
INSERT INTO tblbranch VALUES (1893, '99.00.3 Internationale und supranationale Organisationen mit Behördencharakter', 1890, '0');
# --------------------------------------------------------

#
# Table structure for table `tblcategory`
#

DROP TABLE IF EXISTS tblcategory;
CREATE TABLE tblcategory (
  category_id bigint(20) unsigned NOT NULL auto_increment,
  category_name varchar(255) NOT NULL default '',
  category_parent bigint(20) unsigned NOT NULL default '0',
  category_deny tinyint(2) unsigned NOT NULL default '0',
  PRIMARY KEY  (category_id),
  UNIQUE KEY category_name (category_name)
) TYPE=MyISAM;

#
# Dumping data for table `tblcategory`
#

INSERT INTO tblcategory VALUES (1, '', 0, '0');
INSERT INTO tblcategory VALUES (2, 'Communications', 1, '0');
INSERT INTO tblcategory VALUES (3, 'Databases', 1, '0');
INSERT INTO tblcategory VALUES (4, 'Desktop Environment', 1, '0');
INSERT INTO tblcategory VALUES (5, 'Games/Entertainment', 1, '0');
INSERT INTO tblcategory VALUES (6, 'Internet', 1, '0');
INSERT INTO tblcategory VALUES (7, 'Multimedia', 1, '0');
INSERT INTO tblcategory VALUES (8, 'Office/Business', 1, '0');
INSERT INTO tblcategory VALUES (9, 'Other Categories', 1, '0');
INSERT INTO tblcategory VALUES (10, 'Printing', 1, '0');
INSERT INTO tblcategory VALUES (11, 'Security', 1, '0');
INSERT INTO tblcategory VALUES (12, 'Software Development', 1, '0');
INSERT INTO tblcategory VALUES (13, 'System', 1, '0');
# --------------------------------------------------------

#
# Table structure for table `tblcomment`
#

DROP TABLE IF EXISTS tblcomment;
CREATE TABLE tblcomment (
  comment_id bigint(20) unsigned NOT NULL auto_increment,
  solutions_id bigint(20) unsigned NOT NULL default '0',
  comment_subject varchar(128) NOT NULL default '',
  comment_text blob NOT NULL,
  comment_username varchar(32) NOT NULL default '',
  comment_datetime datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (comment_id)
) TYPE=MyISAM;
# --------------------------------------------------------

#
# Table structure for table `tblcomponent`
#

DROP TABLE IF EXISTS tblcomponent;
CREATE TABLE tblcomponent (
  component_id bigint(20) unsigned NOT NULL auto_increment,
  solutions_id bigint(20) unsigned NOT NULL default '0',
  componenttype_id bigint(20) unsigned NOT NULL default '0',
  component_name varchar(255) default NULL,
  component_version varchar(64) default NULL,
  component_url varchar(255) default NULL,
  license_id bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (component_id)
) TYPE=MyISAM;
# --------------------------------------------------------

#
# Table structure for table `tblcomponenttype`
#

DROP TABLE IF EXISTS tblcomponenttype;
CREATE TABLE tblcomponenttype (
  componenttype_id bigint(20) NOT NULL auto_increment,
  componenttype_name varchar(255) NOT NULL default '',
  PRIMARY KEY  (componenttype_id),
  UNIQUE KEY componenttype_name (componenttype_name)
) TYPE=MyISAM;

#
# Dumping data for table `tblcomponenttype`
#

INSERT INTO tblcomponenttype VALUES (5, 'Others');
INSERT INTO tblcomponenttype VALUES (2, 'Operating Systems');
INSERT INTO tblcomponenttype VALUES (3, 'Programming Languages');
INSERT INTO tblcomponenttype VALUES (4, 'Databases');
INSERT INTO tblcomponenttype VALUES (6, 'Applications');
# --------------------------------------------------------

#
# Table structure for table `tbldocument`
#

DROP TABLE IF EXISTS tbldocument;
CREATE TABLE tbldocument (
  document_id bigint(20) unsigned NOT NULL auto_increment,
  solutions_id bigint(20) unsigned NOT NULL default '0',
  document_title varchar(255) default NULL,
  document_filename varchar(255) default NULL,
  PRIMARY KEY  (document_id)
) TYPE=MyISAM;
# --------------------------------------------------------

#
# Table structure for table `tblkeyword`
#

DROP TABLE IF EXISTS tblkeyword;
CREATE TABLE tblkeyword (
  keyword_id bigint(20) unsigned NOT NULL auto_increment,
  solutions_id bigint(20) unsigned NOT NULL default '0',
  keyword_text varchar(128) NOT NULL default '',
  PRIMARY KEY  (keyword_id)
) TYPE=MyISAM;
# --------------------------------------------------------

#
# Table structure for table `tbllanguage`
#

DROP TABLE IF EXISTS tbllanguage;
CREATE TABLE tbllanguage (
  language_id bigint(20) NOT NULL auto_increment,
  language_name varchar(128) NOT NULL default '',
  PRIMARY KEY  (language_id),
  UNIQUE KEY language_name (language_name)
) TYPE=MyISAM;

#
# Dumping data for table `tbllanguage`
#

INSERT INTO tbllanguage VALUES (1, 'English');
INSERT INTO tbllanguage VALUES (2, 'German');
INSERT INTO tbllanguage VALUES (3, 'French');
INSERT INTO tbllanguage VALUES (4, 'Spanish');
INSERT INTO tbllanguage VALUES (5, 'Turkish');
INSERT INTO tbllanguage VALUES (6, 'Italian');
INSERT INTO tbllanguage VALUES (7, 'Other Language');
# --------------------------------------------------------

#
# Table structure for table `tbllicense`
#

DROP TABLE IF EXISTS tbllicense;
CREATE TABLE tbllicense (
  license_id bigint(20) NOT NULL auto_increment,
  license_name varchar(255) NOT NULL default '',
  license_url varchar(255) default NULL,
  PRIMARY KEY  (license_id),
  UNIQUE KEY license_name (license_name)
) TYPE=MyISAM;

#
# Dumping data for table `tbllicense`
#

INSERT INTO tbllicense VALUES (1, 'Artifex Public License (AFPL)', 'http://web.mit.edu/ghostscript/www/Public.htm');
INSERT INTO tbllicense VALUES (2, 'Apache style', 'http://www.apache.org/docs-2.0/LICENSE');
INSERT INTO tbllicense VALUES (3, 'Artistic & GPL', 'http://www.perl.com/language/misc/Artistic.html');
INSERT INTO tbllicense VALUES (4, 'BSD type', 'http://www.freebsd.org/copyright/license.html');
INSERT INTO tbllicense VALUES (5, 'commercial', 'licnotavailable.php3');
INSERT INTO tbllicense VALUES (6, 'Eiffel Forum Freeware License', 'http://www.eiffel-forum.org/license/index.htm#efl');
INSERT INTO tbllicense VALUES (7, 'free for non-commercial use', 'licnotavailable.php3');
INSERT INTO tbllicense VALUES (8, 'Free Trail', 'licnotavailable.php3');
INSERT INTO tbllicense VALUES (9, 'freely distributable', 'licnotavailable.php3');
INSERT INTO tbllicense VALUES (10, 'Freeware', 'http://sourcewell.berlios.de/licnotavailable.php3');
INSERT INTO tbllicense VALUES (11, 'GPL', 'http://www.gnu.org/copyleft/gpl.html');
INSERT INTO tbllicense VALUES (12, 'LGPL', 'http://www.gnu.org/copyleft/lesser.html');
INSERT INTO tbllicense VALUES (13, 'MIT', 'licnotavailable.php3');
INSERT INTO tbllicense VALUES (14, 'Mozilla Public License (MPL)', 'http://www.mozilla.org/MPL/');
INSERT INTO tbllicense VALUES (15, 'Open Source', 'http://www.opensource.org/osd.html');
INSERT INTO tbllicense VALUES (16, 'Public Domain', 'http://www.eiffel-forum.org/license/index.htm#pd');
INSERT INTO tbllicense VALUES (17, 'Q Public License (QPL)', 'http://www.trolltech.com/products/download/freelicense/license.html');
INSERT INTO tbllicense VALUES (18, 'Shareware', 'licnotavailable.php3');
INSERT INTO tbllicense VALUES (19, 'source-available commercial', 'licnotavailable.php3');
INSERT INTO tbllicense VALUES (20, 'FreeBSD', 'http://www.freebsd.org/copyright/freebsd-license.html');
INSERT INTO tbllicense VALUES (21, 'OpenBSD', 'http://www.openbsd.org/policy.html');
INSERT INTO tbllicense VALUES (22, 'UCL/LBL', 'licnotavailable.php3');
INSERT INTO tbllicense VALUES (23, 'Other', 'licnotavailable.php3');
INSERT INTO tbllicense VALUES (24, 'Artistic License', 'http://www.perl.com/language/misc/Artistic.html');
INSERT INTO tbllicense VALUES (25, 'PHP License', 'http://www.php.net/license.html');
INSERT INTO tbllicense VALUES (26, 'free to use but restricted', 'licnotavailable.php3');
INSERT INTO tbllicense VALUES (27, 'X11 License', 'http://www.x.org/terms.htm');
INSERT INTO tbllicense VALUES (28, 'Cryptix General License', 'http://www.cryptix.org/docs/license.html');
INSERT INTO tbllicense VALUES (29, 'Zlib License', 'ftp://ftp.freesoftware.com/pub/infozip/zlib/zlib_license.html');
INSERT INTO tbllicense VALUES (30, 'W3C Software', 'http://www.w3.org/Consortium/Legal/copyright-software-19980720');
INSERT INTO tbllicense VALUES (31, 'Berkeley Database License', 'http://www.sleepycat.com/license.net');
INSERT INTO tbllicense VALUES (32, 'Clarified Artistic License', 'http://www.appwatch.com/license/ncftp-3.0.2.txt');
INSERT INTO tbllicense VALUES (33, 'Netscape Public License (NPL)', 'http://www.mozilla.org/MPL/NPL-1.0.html');
INSERT INTO tbllicense VALUES (34, 'Arphic Public License', 'ftp://ftp.gnu.org/non-gnu/chinese-fonts-truetype/LICENSE');
INSERT INTO tbllicense VALUES (35, 'Zope Public License (ZPL)', 'http://www.zope.com/Resources/ZPL');
INSERT INTO tbllicense VALUES (36, 'IBM Public License', 'http://oss.software.ibm.com/developerworks/opensource/license10.html');
INSERT INTO tbllicense VALUES (37, 'Phorum', 'http://phorum.org/license.txt');
INSERT INTO tbllicense VALUES (38, 'Interbase Public License', 'http://www.borland.com/interbase/IPL.html');
INSERT INTO tbllicense VALUES (39, 'Sun Public License', 'http://www.netbeans.org/spl.html');
INSERT INTO tbllicense VALUES (40, 'Jabber Open Source License', 'http://www.jabber.com/license/index.shtml');
INSERT INTO tbllicense VALUES (41, 'Open Compability License', 'http://www.gizmodrome.com/opencompatibilitylicense.htm');
INSERT INTO tbllicense VALUES (42, 'Plan 9 Open Source License', 'http://plan9.bell-labs.com/plan9dist/license.html');
INSERT INTO tbllicense VALUES (43, 'Sun Community Source License', 'http://www.sun.com/981208/scsl/principles.html;$sessionid$RNI1GOQAAB3PHAMTA1LU5YQ');
INSERT INTO tbllicense VALUES (44, 'FreeType License', 'http://v.hbi-stuttgart.de/doku/packages/freetype/license.txt');
INSERT INTO tbllicense VALUES (45, 'LaTeXProject Public License', 'http://www.latex-project.org/lppl.html');
INSERT INTO tbllicense VALUES (46, 'Apple Public Source License', 'http://www.publicsource.apple.com/apsl/');
INSERT INTO tbllicense VALUES (47, 'Common Public License (CPL)', 'http://oss.software.ibm.com/developerworks/opensource/license-cpl.html');
# --------------------------------------------------------

#
# Table structure for table `tblsolutions`
#

DROP TABLE IF EXISTS tblsolutions;
CREATE TABLE tblsolutions (
  solutions_id bigint(20) unsigned NOT NULL auto_increment,
  solutions_name varchar(255) NOT NULL default '',
  solutions_version varchar(64) NOT NULL default '',
  solutions_logo varchar(255) default NULL,
  solutions_summary blob NOT NULL,
  solutions_url varchar(255) default NULL,
  branch_id bigint(20) unsigned default '0',
  category_id bigint(20) unsigned default '0',
  solutions_create_date datetime NOT NULL default '0000-00-00 00:00:00',
  solutions_modify_date datetime NOT NULL default '0000-00-00 00:00:00',
  username varchar(32) NOT NULL default '',
  solutions_contact_name varchar(255) NOT NULL default '',
  solutions_contact_email varchar(128) NOT NULL default '',
  solutions_contact_url varchar(255) default NULL,
  solutions_contact_logo varchar(255) default NULL,
  solutions_supplier_name varchar(255) NOT NULL default '',
  solutions_supplier_email varchar(128) NOT NULL default '',
  solutions_supplier_url varchar(255) default NULL,
  solutions_supplier_logo varchar(255) default NULL,
  PRIMARY KEY  (solutions_id)
) TYPE=MyISAM;
# --------------------------------------------------------

#
# Table structure for table `tblsolutionslanguage`
#

DROP TABLE IF EXISTS tblsolutionslanguage;
CREATE TABLE tblsolutionslanguage (
  solutionslanguage_id bigint(20) unsigned NOT NULL auto_increment,
  solutions_id bigint(20) unsigned NOT NULL default '0',
  language_id bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (solutionslanguage_id)
) TYPE=MyISAM;

#
# Dumping data for table `tblsolutionslanguage`
#


