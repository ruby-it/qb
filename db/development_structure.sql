CREATE TABLE `authors` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `ip` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) TYPE=InnoDB;

CREATE TABLE `backlinks` (
  `page_id` int(11) NOT NULL default '0',
  `connected_page_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`page_id`,`connected_page_id`)
) TYPE=InnoDB;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) TYPE=InnoDB;

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` int(11) default NULL,
  `author_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `body` text,
  PRIMARY KEY  (`id`)
) TYPE=InnoDB;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) TYPE=MyISAM;

INSERT INTO schema_info (version) VALUES (3)