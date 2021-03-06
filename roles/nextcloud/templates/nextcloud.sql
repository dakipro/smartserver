-- phpMyAdmin SQL Dump
-- version 4.2.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Okt 2018 um 17:10
-- Server Version: 10.2.15-MariaDB
-- PHP-Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `nextcloud`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_accounts`
--

DROP TABLE IF EXISTS `oc_accounts`;
CREATE TABLE IF NOT EXISTS `oc_accounts` (
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
CREATE TABLE IF NOT EXISTS `oc_activity` (
`activity_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `affecteduser` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `app` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `subjectparams` longtext COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `messageparams` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `file` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `link` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=647 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
CREATE TABLE IF NOT EXISTS `oc_activity_mq` (
`mail_id` int(11) NOT NULL,
  `amq_timestamp` int(11) NOT NULL DEFAULT 0,
  `amq_latest_send` int(11) NOT NULL DEFAULT 0,
  `amq_type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amq_affecteduser` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `amq_appid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amq_subject` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amq_subjectparams` varchar(4000) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
CREATE TABLE IF NOT EXISTS `oc_addressbookchanges` (
`id` bigint(20) unsigned NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `addressbookid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1688 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
CREATE TABLE IF NOT EXISTS `oc_addressbooks` (
`id` bigint(20) unsigned NOT NULL,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
CREATE TABLE IF NOT EXISTS `oc_appconfig` (
  `appid` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
CREATE TABLE IF NOT EXISTS `oc_authtoken` (
`id` bigint(20) unsigned NOT NULL,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `login_name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `password` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `last_activity` int(10) unsigned NOT NULL DEFAULT 0,
  `last_check` int(10) unsigned NOT NULL DEFAULT 0,
  `remember` smallint(5) unsigned NOT NULL DEFAULT 0,
  `scope` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `private_key` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `public_key` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=905 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_bookmarks`
--

DROP TABLE IF EXISTS `oc_bookmarks`;
CREATE TABLE IF NOT EXISTS `oc_bookmarks` (
`id` int(11) NOT NULL,
  `url` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `title` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `description` varchar(4096) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `public` smallint(6) DEFAULT 0,
  `added` int(10) unsigned DEFAULT 0,
  `lastmodified` int(10) unsigned DEFAULT 0,
  `clickcount` int(10) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_bookmarks_tags`
--

DROP TABLE IF EXISTS `oc_bookmarks_tags`;
CREATE TABLE IF NOT EXISTS `oc_bookmarks_tags` (
  `bookmark_id` bigint(20) DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_bruteforce_attempts`
--

DROP TABLE IF EXISTS `oc_bruteforce_attempts`;
CREATE TABLE IF NOT EXISTS `oc_bruteforce_attempts` (
`id` bigint(20) unsigned NOT NULL,
  `action` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `occurred` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `metadata` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
CREATE TABLE IF NOT EXISTS `oc_calendarchanges` (
`id` bigint(20) unsigned NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `calendarid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1420 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
CREATE TABLE IF NOT EXISTS `oc_calendarobjects` (
`id` bigint(20) unsigned NOT NULL,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarid` bigint(20) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `classification` int(11) DEFAULT 0 COMMENT '0 - public, 1 - private, 2 - confidential'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_calendarobjects_props`
--

DROP TABLE IF EXISTS `oc_calendarobjects_props`;
CREATE TABLE IF NOT EXISTS `oc_calendarobjects_props` (
`id` bigint(20) unsigned NOT NULL,
  `calendarid` bigint(20) NOT NULL DEFAULT 0,
  `objectid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `parameter` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
CREATE TABLE IF NOT EXISTS `oc_calendars` (
`id` bigint(20) unsigned NOT NULL,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `timezone` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `components` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
CREATE TABLE IF NOT EXISTS `oc_calendarsubscriptions` (
`id` bigint(20) unsigned NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `refreshrate` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_calendar_invitations`
--

DROP TABLE IF EXISTS `oc_calendar_invitations`;
CREATE TABLE IF NOT EXISTS `oc_calendar_invitations` (
`id` bigint(20) unsigned NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recurrenceid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `attendee` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `organizer` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT NULL,
  `token` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `expiration` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_calendar_resources`
--

DROP TABLE IF EXISTS `oc_calendar_resources`;
CREATE TABLE IF NOT EXISTS `oc_calendar_resources` (
`id` bigint(20) unsigned NOT NULL,
  `backend_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `resource_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `group_restrictions` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_calendar_rooms`
--

DROP TABLE IF EXISTS `oc_calendar_rooms`;
CREATE TABLE IF NOT EXISTS `oc_calendar_rooms` (
`id` bigint(20) unsigned NOT NULL,
  `backend_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `resource_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `group_restrictions` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
CREATE TABLE IF NOT EXISTS `oc_cards` (
`id` bigint(20) unsigned NOT NULL,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `carddata` longblob DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
CREATE TABLE IF NOT EXISTS `oc_cards_properties` (
`id` bigint(20) unsigned NOT NULL,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `cardid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=3467 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
CREATE TABLE IF NOT EXISTS `oc_comments` (
`id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `topmost_parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `children_count` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `actor_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `verb` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
CREATE TABLE IF NOT EXISTS `oc_comments_read_markers` (
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_credentials`
--

DROP TABLE IF EXISTS `oc_credentials`;
CREATE TABLE IF NOT EXISTS `oc_credentials` (
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `identifier` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `credentials` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
CREATE TABLE IF NOT EXISTS `oc_dav_shares` (
`id` bigint(20) unsigned NOT NULL,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` bigint(20) unsigned NOT NULL,
  `publicuri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_directlink`
--

DROP TABLE IF EXISTS `oc_directlink`;
CREATE TABLE IF NOT EXISTS `oc_directlink` (
`id` bigint(20) unsigned NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `token` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `expiration` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_documents_invite`
--

DROP TABLE IF EXISTS `oc_documents_invite`;
CREATE TABLE IF NOT EXISTS `oc_documents_invite` (
  `es_id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Related editing session id',
  `uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` smallint(6) DEFAULT 0,
  `sent_on` int(10) unsigned DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_documents_member`
--

DROP TABLE IF EXISTS `oc_documents_member`;
CREATE TABLE IF NOT EXISTS `oc_documents_member` (
  `member_id` int(10) unsigned NOT NULL COMMENT 'Unique per user and session',
  `es_id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Related editing session id',
  `uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_activity` int(10) unsigned DEFAULT NULL,
  `is_guest` smallint(5) unsigned NOT NULL DEFAULT 0,
  `token` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` smallint(5) unsigned NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_documents_op`
--

DROP TABLE IF EXISTS `oc_documents_op`;
CREATE TABLE IF NOT EXISTS `oc_documents_op` (
  `seq` int(10) unsigned NOT NULL COMMENT 'Sequence number',
  `es_id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Editing session id',
  `member` int(10) unsigned NOT NULL DEFAULT 1 COMMENT 'User and time specific',
  `opspec` longtext COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'json-string'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_documents_revisions`
--

DROP TABLE IF EXISTS `oc_documents_revisions`;
CREATE TABLE IF NOT EXISTS `oc_documents_revisions` (
  `es_id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Related editing session id',
  `seq_head` int(10) unsigned NOT NULL COMMENT 'Sequence head number',
  `member_id` int(10) unsigned NOT NULL COMMENT 'the member that saved the revision',
  `file_id` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Relative to storage e.g. /welcome.odt',
  `save_hash` varchar(128) COLLATE utf8mb4_bin NOT NULL COMMENT 'used to lookup revision in documents folder of member, eg hash.odt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_documents_session`
--

DROP TABLE IF EXISTS `oc_documents_session`;
CREATE TABLE IF NOT EXISTS `oc_documents_session` (
  `es_id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Editing session id',
  `genesis_url` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Relative to owner documents storage /welcome.odt',
  `genesis_hash` varchar(128) COLLATE utf8mb4_bin NOT NULL COMMENT 'To be sure the genesis did not change',
  `file_id` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Relative to storage e.g. /welcome.odt',
  `owner` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'oC user who created the session'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_external_applicable`
--

DROP TABLE IF EXISTS `oc_external_applicable`;
CREATE TABLE IF NOT EXISTS `oc_external_applicable` (
`applicable_id` bigint(20) NOT NULL,
  `mount_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `value` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_external_config`
--

DROP TABLE IF EXISTS `oc_external_config`;
CREATE TABLE IF NOT EXISTS `oc_external_config` (
`config_id` bigint(20) NOT NULL,
  `mount_id` bigint(20) NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(4096) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_external_mounts`
--

DROP TABLE IF EXISTS `oc_external_mounts`;
CREATE TABLE IF NOT EXISTS `oc_external_mounts` (
`mount_id` bigint(20) NOT NULL,
  `mount_point` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `storage_backend` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `auth_backend` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 100,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_external_options`
--

DROP TABLE IF EXISTS `oc_external_options`;
CREATE TABLE IF NOT EXISTS `oc_external_options` (
`option_id` bigint(20) NOT NULL,
  `mount_id` bigint(20) NOT NULL,
  `key` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(256) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
CREATE TABLE IF NOT EXISTS `oc_federated_reshares` (
  `share_id` int(11) NOT NULL,
  `remote_id` int(11) NOT NULL COMMENT 'share ID at the remote server'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
CREATE TABLE IF NOT EXISTS `oc_filecache` (
`fileid` int(11) NOT NULL,
  `storage` int(11) NOT NULL DEFAULT 0,
  `path` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `path_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT 0,
  `name` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `mimetype` int(11) NOT NULL DEFAULT 0,
  `mimepart` int(11) NOT NULL DEFAULT 0,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `mtime` int(11) NOT NULL DEFAULT 0,
  `storage_mtime` int(11) NOT NULL DEFAULT 0,
  `encrypted` int(11) NOT NULL DEFAULT 0,
  `unencrypted_size` bigint(20) NOT NULL DEFAULT 0,
  `etag` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `permissions` int(11) DEFAULT 0,
  `checksum` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=28960 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_filecache_bak`
--

DROP TABLE IF EXISTS `oc_filecache_bak`;
CREATE TABLE IF NOT EXISTS `oc_filecache_bak` (
  `fileid` int(11) NOT NULL,
  `storage` int(11) NOT NULL DEFAULT 0,
  `path` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `path_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT 0,
  `name` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `mimetype` int(11) NOT NULL DEFAULT 0,
  `mimepart` int(11) NOT NULL DEFAULT 0,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `mtime` int(11) NOT NULL DEFAULT 0,
  `storage_mtime` int(11) NOT NULL DEFAULT 0,
  `encrypted` int(11) NOT NULL DEFAULT 0,
  `unencrypted_size` bigint(20) NOT NULL DEFAULT 0,
  `etag` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `permissions` int(11) DEFAULT 0,
  `checksum` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
CREATE TABLE IF NOT EXISTS `oc_files_trash` (
  `id` varchar(250) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `timestamp` varchar(12) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `location` varchar(512) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` varchar(4) COLLATE utf8mb4_bin DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
`auto_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=48 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
CREATE TABLE IF NOT EXISTS `oc_file_locks` (
`id` bigint(20) unsigned NOT NULL,
  `lock` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT -1
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=24191 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_flow_checks`
--

DROP TABLE IF EXISTS `oc_flow_checks`;
CREATE TABLE IF NOT EXISTS `oc_flow_checks` (
`id` int(11) NOT NULL,
  `class` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `operator` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `value` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `hash` varchar(32) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_flow_operations`
--

DROP TABLE IF EXISTS `oc_flow_operations`;
CREATE TABLE IF NOT EXISTS `oc_flow_operations` (
`id` int(11) NOT NULL,
  `class` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `checks` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `operation` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
CREATE TABLE IF NOT EXISTS `oc_groups` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
CREATE TABLE IF NOT EXISTS `oc_group_admin` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
CREATE TABLE IF NOT EXISTS `oc_group_user` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
CREATE TABLE IF NOT EXISTS `oc_jobs` (
`id` bigint(20) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `argument` varchar(4000) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT 0,
  `last_checked` int(11) DEFAULT 0,
  `reserved_at` int(11) DEFAULT 0,
  `execution_duration` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=3956 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_lucene_status`
--

DROP TABLE IF EXISTS `oc_lucene_status`;
CREATE TABLE IF NOT EXISTS `oc_lucene_status` (
  `fileid` int(11) NOT NULL DEFAULT 0,
  `status` varchar(1) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
CREATE TABLE IF NOT EXISTS `oc_migrations` (
  `app` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
CREATE TABLE IF NOT EXISTS `oc_mimetypes` (
`id` int(11) NOT NULL,
  `mimetype` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=112 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_moneyforecast_accounts`
--

DROP TABLE IF EXISTS `oc_moneyforecast_accounts`;
CREATE TABLE IF NOT EXISTS `oc_moneyforecast_accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) COLLATE utf8mb4_bin NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_moneyforecast_bookings`
--

DROP TABLE IF EXISTS `oc_moneyforecast_bookings`;
CREATE TABLE IF NOT EXISTS `oc_moneyforecast_bookings` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `recurrence_type` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `recurrence_interval` smallint(6) DEFAULT NULL,
  `name` varchar(1000) COLLATE utf8mb4_bin NOT NULL,
  `info` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `category` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `account` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_moneyforecast_categories`
--

DROP TABLE IF EXISTS `oc_moneyforecast_categories`;
CREATE TABLE IF NOT EXISTS `oc_moneyforecast_categories` (
  `id` int(11) NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `name` varchar(1000) COLLATE utf8mb4_bin NOT NULL,
  `color` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
CREATE TABLE IF NOT EXISTS `oc_mounts` (
`id` bigint(20) NOT NULL,
  `storage_id` int(11) NOT NULL,
  `root_id` int(11) NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `mount_point` varchar(4000) COLLATE utf8mb4_bin NOT NULL,
  `mount_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_mozilla_sync_collections`
--

DROP TABLE IF EXISTS `oc_mozilla_sync_collections`;
CREATE TABLE IF NOT EXISTS `oc_mozilla_sync_collections` (
  `id` int(10) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_mozilla_sync_users`
--

DROP TABLE IF EXISTS `oc_mozilla_sync_users`;
CREATE TABLE IF NOT EXISTS `oc_mozilla_sync_users` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `sync_user` varchar(128) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_mozilla_sync_wbo`
--

DROP TABLE IF EXISTS `oc_mozilla_sync_wbo`;
CREATE TABLE IF NOT EXISTS `oc_mozilla_sync_wbo` (
  `id` int(10) unsigned NOT NULL,
  `collectionid` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `parentid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `predecessorid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `sortindex` int(11) DEFAULT NULL,
  `modified` decimal(12,2) NOT NULL DEFAULT 0.00,
  `payload` longtext COLLATE utf8mb4_bin NOT NULL,
  `ttl` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_news_feeds`
--

DROP TABLE IF EXISTS `oc_news_feeds`;
CREATE TABLE IF NOT EXISTS `oc_news_feeds` (
`id` bigint(20) unsigned NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `url_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `url` longtext COLLATE utf8mb4_bin NOT NULL,
  `title` longtext COLLATE utf8mb4_bin NOT NULL,
  `link` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `favicon_link` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `added` bigint(20) unsigned DEFAULT 0,
  `articles_per_update` bigint(20) NOT NULL DEFAULT 0,
  `deleted_at` bigint(20) unsigned DEFAULT 0,
  `folder_id` bigint(20) NOT NULL,
  `prevent_update` tinyint(1) NOT NULL DEFAULT 0,
  `location` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `http_last_modified` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `http_etag` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `update_error_count` bigint(20) NOT NULL DEFAULT 0,
  `last_update_error` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `basic_auth_user` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `basic_auth_password` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `full_text_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `update_mode` int(11) NOT NULL DEFAULT 0,
  `last_modified` bigint(20) unsigned DEFAULT 0
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=40 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_news_folders`
--

DROP TABLE IF EXISTS `oc_news_folders`;
CREATE TABLE IF NOT EXISTS `oc_news_folders` (
`id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `opened` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` bigint(20) unsigned DEFAULT 0,
  `last_modified` bigint(20) unsigned DEFAULT 0
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_news_items`
--

DROP TABLE IF EXISTS `oc_news_items`;
CREATE TABLE IF NOT EXISTS `oc_news_items` (
`id` bigint(20) unsigned NOT NULL,
  `guid_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `guid` longtext COLLATE utf8mb4_bin NOT NULL,
  `url` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `author` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `pub_date` bigint(20) unsigned DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `enclosure_mime` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `enclosure_link` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `feed_id` bigint(20) NOT NULL,
  `status` bigint(20) NOT NULL DEFAULT 0,
  `last_modified` bigint(20) unsigned DEFAULT 0,
  `fingerprint` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `search_index` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `content_hash` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `updated_date` bigint(20) unsigned DEFAULT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 0,
  `starred` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=332396 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_nextant_live_queue`
--

DROP TABLE IF EXISTS `oc_nextant_live_queue`;
CREATE TABLE IF NOT EXISTS `oc_nextant_live_queue` (
`id` bigint(20) unsigned NOT NULL,
  `item` varchar(512) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_notes_meta`
--

DROP TABLE IF EXISTS `oc_notes_meta`;
CREATE TABLE IF NOT EXISTS `oc_notes_meta` (
`id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `last_update` int(11) NOT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
CREATE TABLE IF NOT EXISTS `oc_notifications` (
`notification_id` int(11) NOT NULL,
  `app` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `subject` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `subject_parameters` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `message` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `message_parameters` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `link` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `actions` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `icon` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=102 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_notifications_pushtokens`
--

DROP TABLE IF EXISTS `oc_notifications_pushtokens`;
CREATE TABLE IF NOT EXISTS `oc_notifications_pushtokens` (
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `token` int(11) NOT NULL DEFAULT 0,
  `deviceidentifier` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `devicepublickey` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `devicepublickeyhash` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `pushtokenhash` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `proxyserver` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `apptype` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT 'unknown'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oc_oauth2_access_tokens`;
CREATE TABLE IF NOT EXISTS `oc_oauth2_access_tokens` (
`id` int(10) unsigned NOT NULL,
  `token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hashed_code` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `encrypted_token` varchar(786) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_oauth2_clients`
--

DROP TABLE IF EXISTS `oc_oauth2_clients`;
CREATE TABLE IF NOT EXISTS `oc_oauth2_clients` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `redirect_uri` varchar(2000) COLLATE utf8mb4_bin NOT NULL,
  `client_identifier` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `secret` varchar(64) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
CREATE TABLE IF NOT EXISTS `oc_preferences` (
  `userid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `appid` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_preview_generation`
--

DROP TABLE IF EXISTS `oc_preview_generation`;
CREATE TABLE IF NOT EXISTS `oc_preview_generation` (
`id` int(11) NOT NULL,
  `uid` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `file_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_privatedata`
--

DROP TABLE IF EXISTS `oc_privatedata`;
CREATE TABLE IF NOT EXISTS `oc_privatedata` (
`keyid` int(10) unsigned NOT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `app` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `key` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
CREATE TABLE IF NOT EXISTS `oc_properties` (
`id` bigint(20) NOT NULL,
  `userid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertypath` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertyname` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertyvalue` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_richdocuments_invite`
--

DROP TABLE IF EXISTS `oc_richdocuments_invite`;
CREATE TABLE IF NOT EXISTS `oc_richdocuments_invite` (
  `es_id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Related editing session id',
  `uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` smallint(6) DEFAULT 0,
  `sent_on` int(10) unsigned DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_richdocuments_member`
--

DROP TABLE IF EXISTS `oc_richdocuments_member`;
CREATE TABLE IF NOT EXISTS `oc_richdocuments_member` (
`member_id` int(10) unsigned NOT NULL COMMENT 'Unique per user and session',
  `uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_activity` int(10) unsigned DEFAULT NULL,
  `is_guest` smallint(5) unsigned NOT NULL DEFAULT 0,
  `token` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` smallint(5) unsigned NOT NULL DEFAULT 1
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=53 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_richdocuments_op`
--

DROP TABLE IF EXISTS `oc_richdocuments_op`;
CREATE TABLE IF NOT EXISTS `oc_richdocuments_op` (
`seq` int(10) unsigned NOT NULL COMMENT 'Sequence number',
  `es_id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Editing session id',
  `member` int(10) unsigned NOT NULL DEFAULT 1 COMMENT 'User and time specific',
  `optype` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Operation type',
  `opspec` longtext COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'json-string'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=53 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_richdocuments_revisions`
--

DROP TABLE IF EXISTS `oc_richdocuments_revisions`;
CREATE TABLE IF NOT EXISTS `oc_richdocuments_revisions` (
  `es_id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Related editing session id',
  `seq_head` int(10) unsigned NOT NULL COMMENT 'Sequence head number',
  `member_id` int(10) unsigned NOT NULL COMMENT 'the member that saved the revision',
  `file_id` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Relative to storage e.g. /welcome.odt',
  `save_hash` varchar(128) COLLATE utf8mb4_bin NOT NULL COMMENT 'used to lookup revision in documents folder of member, eg hash.odt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_richdocuments_session`
--

DROP TABLE IF EXISTS `oc_richdocuments_session`;
CREATE TABLE IF NOT EXISTS `oc_richdocuments_session` (
  `es_id` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Editing session id',
  `genesis_url` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Relative to owner documents storage /welcome.odt',
  `genesis_hash` varchar(128) COLLATE utf8mb4_bin NOT NULL COMMENT 'To be sure the genesis did not change',
  `file_id` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Relative to storage e.g. /welcome.odt',
  `owner` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'oC user who created the session'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_richdocuments_wopi`
--

DROP TABLE IF EXISTS `oc_richdocuments_wopi`;
CREATE TABLE IF NOT EXISTS `oc_richdocuments_wopi` (
`id` int(10) unsigned NOT NULL,
  `owner_uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `editor_uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `fileid` int(11) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `token` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `expiry` int(10) unsigned DEFAULT NULL,
  `canwrite` tinyint(1) NOT NULL DEFAULT 0,
  `server_host` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'localhost',
  `guest_displayname` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=77 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
CREATE TABLE IF NOT EXISTS `oc_schedulingobjects` (
`id` bigint(20) unsigned NOT NULL,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
CREATE TABLE IF NOT EXISTS `oc_share` (
`id` bigint(20) NOT NULL,
  `share_type` smallint(6) NOT NULL DEFAULT 0,
  `share_with` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uid_owner` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `parent` bigint(20) DEFAULT NULL,
  `item_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `item_source` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `item_target` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_source` bigint(20) DEFAULT NULL,
  `file_target` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT 0,
  `stime` bigint(20) NOT NULL DEFAULT 0,
  `accepted` smallint(6) NOT NULL DEFAULT 0,
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT 0,
  `uid_initiator` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `share_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password_by_talk` tinyint(1) NOT NULL DEFAULT 0,
  `note` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
CREATE TABLE IF NOT EXISTS `oc_share_external` (
`id` int(11) NOT NULL,
  `remote` varchar(512) COLLATE utf8mb4_bin NOT NULL COMMENT 'Url of the remove owncloud instance',
  `share_token` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Public share token',
  `password` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Optional password for the public share',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Original name on the remote server',
  `owner` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'User that owns the public share on the remote server',
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT 'Local user which added the external share',
  `mountpoint` varchar(4000) COLLATE utf8mb4_bin NOT NULL COMMENT 'Full path where the share is mounted',
  `mountpoint_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT 'md5 hash of the mountpoint',
  `remote_id` int(11) NOT NULL DEFAULT -1,
  `accepted` int(11) NOT NULL DEFAULT 0,
  `parent` int(11) DEFAULT -1,
  `share_type` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
CREATE TABLE IF NOT EXISTS `oc_storages` (
  `id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
`numeric_id` int(11) NOT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
CREATE TABLE IF NOT EXISTS `oc_systemtag` (
`id` bigint(20) unsigned NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT 1,
  `editable` smallint(6) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
CREATE TABLE IF NOT EXISTS `oc_systemtag_group` (
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `gid` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
CREATE TABLE IF NOT EXISTS `oc_systemtag_object_mapping` (
  `objectid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `objecttype` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_talk_guests`
--

DROP TABLE IF EXISTS `oc_talk_guests`;
CREATE TABLE IF NOT EXISTS `oc_talk_guests` (
  `session_hash` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `display_name` varchar(64) COLLATE utf8mb4_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_talk_participants`
--

DROP TABLE IF EXISTS `oc_talk_participants`;
CREATE TABLE IF NOT EXISTS `oc_talk_participants` (
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `room_id` int(10) unsigned NOT NULL DEFAULT 0,
  `last_ping` int(10) unsigned NOT NULL DEFAULT 0,
  `session_id` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `participant_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `in_call` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_talk_rooms`
--

DROP TABLE IF EXISTS `oc_talk_rooms`;
CREATE TABLE IF NOT EXISTS `oc_talk_rooms` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `token` varchar(32) COLLATE utf8mb4_bin DEFAULT '',
  `type` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `active_since` datetime DEFAULT NULL,
  `active_guests` int(10) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_talk_signaling`
--

DROP TABLE IF EXISTS `oc_talk_signaling`;
CREATE TABLE IF NOT EXISTS `oc_talk_signaling` (
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recipient` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `message` longtext COLLATE utf8mb4_bin NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
CREATE TABLE IF NOT EXISTS `oc_trusted_servers` (
`id` int(11) NOT NULL,
  `url` varchar(512) COLLATE utf8mb4_bin NOT NULL COMMENT 'Url of trusted server',
  `url_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'sha1 hash of the url without the protocol',
  `token` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'token used to exchange the shared secret',
  `shared_secret` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'shared secret used to authenticate',
  `status` int(11) NOT NULL DEFAULT 2 COMMENT 'current status of the connection',
  `sync_token` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'cardDav sync token'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_twofactor_backupcodes`
--

DROP TABLE IF EXISTS `oc_twofactor_backupcodes`;
CREATE TABLE IF NOT EXISTS `oc_twofactor_backupcodes` (
`id` bigint(20) NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `code` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_twofactor_providers`
--

DROP TABLE IF EXISTS `oc_twofactor_providers`;
CREATE TABLE IF NOT EXISTS `oc_twofactor_providers` (
  `provider_id` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `enabled` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_twofactor_totp_secrets`
--

DROP TABLE IF EXISTS `oc_twofactor_totp_secrets`;
CREATE TABLE IF NOT EXISTS `oc_twofactor_totp_secrets` (
`id` int(11) NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `secret` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
CREATE TABLE IF NOT EXISTS `oc_users` (
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `displayname` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid_lower` varchar(64) COLLATE utf8mb4_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
CREATE TABLE IF NOT EXISTS `oc_vcategory` (
`id` bigint(20) unsigned NOT NULL,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `category` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
CREATE TABLE IF NOT EXISTS `oc_vcategory_to_object` (
  `objid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `categoryid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oc_whats_new`
--

DROP TABLE IF EXISTS `oc_whats_new`;
CREATE TABLE IF NOT EXISTS `oc_whats_new` (
`id` int(10) unsigned NOT NULL,
  `version` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '11',
  `etag` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT 0,
  `data` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_accounts`
--
ALTER TABLE `oc_accounts`
 ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `oc_activity`
--
ALTER TABLE `oc_activity`
 ADD PRIMARY KEY (`activity_id`), ADD KEY `activity_user_time` (`affecteduser`,`timestamp`), ADD KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`), ADD KEY `activity_filter_app` (`affecteduser`,`app`,`timestamp`), ADD KEY `activity_time` (`timestamp`), ADD KEY `activity_object` (`object_type`(191),`object_id`);

--
-- Indexes for table `oc_activity_mq`
--
ALTER TABLE `oc_activity_mq`
 ADD PRIMARY KEY (`mail_id`), ADD KEY `amp_user` (`amq_affecteduser`), ADD KEY `amp_latest_send_time` (`amq_latest_send`), ADD KEY `amp_timestamp_time` (`amq_timestamp`);

--
-- Indexes for table `oc_addressbookchanges`
--
ALTER TABLE `oc_addressbookchanges`
 ADD PRIMARY KEY (`id`), ADD KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`);

--
-- Indexes for table `oc_addressbooks`
--
ALTER TABLE `oc_addressbooks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `addressbook_index` (`principaluri`,`uri`);

--
-- Indexes for table `oc_appconfig`
--
ALTER TABLE `oc_appconfig`
 ADD PRIMARY KEY (`appid`,`configkey`), ADD KEY `appconfig_config_key_index` (`configkey`), ADD KEY `appconfig_appid_key` (`appid`);

--
-- Indexes for table `oc_authtoken`
--
ALTER TABLE `oc_authtoken`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `authtoken_token_index` (`token`), ADD KEY `authtoken_last_activity_index` (`last_activity`), ADD KEY `authtoken_uid_index` (`uid`), ADD KEY `authtoken_version_index` (`version`);

--
-- Indexes for table `oc_bookmarks`
--
ALTER TABLE `oc_bookmarks`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oc_bookmarks_tags`
--
ALTER TABLE `oc_bookmarks_tags`
 ADD UNIQUE KEY `bookmark_tag` (`bookmark_id`,`tag`);

--
-- Indexes for table `oc_bruteforce_attempts`
--
ALTER TABLE `oc_bruteforce_attempts`
 ADD PRIMARY KEY (`id`), ADD KEY `bruteforce_attempts_ip` (`ip`), ADD KEY `bruteforce_attempts_subnet` (`subnet`);

--
-- Indexes for table `oc_calendarchanges`
--
ALTER TABLE `oc_calendarchanges`
 ADD PRIMARY KEY (`id`), ADD KEY `calendarid_synctoken` (`calendarid`,`synctoken`);

--
-- Indexes for table `oc_calendarobjects`
--
ALTER TABLE `oc_calendarobjects`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `calobjects_index` (`calendarid`,`uri`);

--
-- Indexes for table `oc_calendarobjects_props`
--
ALTER TABLE `oc_calendarobjects_props`
 ADD PRIMARY KEY (`id`), ADD KEY `calendarobject_index` (`objectid`), ADD KEY `calendarobject_name_index` (`name`), ADD KEY `calendarobject_value_index` (`value`);

--
-- Indexes for table `oc_calendars`
--
ALTER TABLE `oc_calendars`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `calendars_index` (`principaluri`,`uri`);

--
-- Indexes for table `oc_calendarsubscriptions`
--
ALTER TABLE `oc_calendarsubscriptions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `calsub_index` (`principaluri`,`uri`);

--
-- Indexes for table `oc_calendar_invitations`
--
ALTER TABLE `oc_calendar_invitations`
 ADD PRIMARY KEY (`id`), ADD KEY `calendar_invitation_tokens` (`token`);

--
-- Indexes for table `oc_calendar_resources`
--
ALTER TABLE `oc_calendar_resources`
 ADD PRIMARY KEY (`id`), ADD KEY `calendar_resources_bkdrsc` (`backend_id`,`resource_id`), ADD KEY `calendar_resources_email` (`email`), ADD KEY `calendar_resources_name` (`displayname`);

--
-- Indexes for table `oc_calendar_rooms`
--
ALTER TABLE `oc_calendar_rooms`
 ADD PRIMARY KEY (`id`), ADD KEY `calendar_rooms_bkdrsc` (`backend_id`,`resource_id`), ADD KEY `calendar_rooms_email` (`email`), ADD KEY `calendar_rooms_name` (`displayname`);

--
-- Indexes for table `oc_cards`
--
ALTER TABLE `oc_cards`
 ADD PRIMARY KEY (`id`), ADD KEY `IDX_E98F2EC48B26C2E9` (`addressbookid`);

--
-- Indexes for table `oc_cards_properties`
--
ALTER TABLE `oc_cards_properties`
 ADD PRIMARY KEY (`id`), ADD KEY `card_contactid_index` (`cardid`), ADD KEY `card_name_index` (`name`), ADD KEY `card_value_index` (`value`), ADD KEY `IDX_811F5CFA8B26C2E9` (`addressbookid`);

--
-- Indexes for table `oc_comments`
--
ALTER TABLE `oc_comments`
 ADD PRIMARY KEY (`id`), ADD KEY `comments_parent_id_index` (`parent_id`), ADD KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`), ADD KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`), ADD KEY `comments_actor_index` (`actor_type`,`actor_id`);

--
-- Indexes for table `oc_comments_read_markers`
--
ALTER TABLE `oc_comments_read_markers`
 ADD UNIQUE KEY `comments_marker_index` (`user_id`,`object_type`,`object_id`), ADD KEY `comments_marker_object_index` (`object_type`,`object_id`);

--
-- Indexes for table `oc_credentials`
--
ALTER TABLE `oc_credentials`
 ADD PRIMARY KEY (`user`,`identifier`), ADD KEY `credentials_user` (`user`);

--
-- Indexes for table `oc_dav_shares`
--
ALTER TABLE `oc_dav_shares`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`,`publicuri`);

--
-- Indexes for table `oc_directlink`
--
ALTER TABLE `oc_directlink`
 ADD PRIMARY KEY (`id`), ADD KEY `directlink_token_idx` (`token`), ADD KEY `directlink_expiration_idx` (`expiration`);

--
-- Indexes for table `oc_external_applicable`
--
ALTER TABLE `oc_external_applicable`
 ADD PRIMARY KEY (`applicable_id`), ADD UNIQUE KEY `applicable_type_value_mount` (`type`,`value`,`mount_id`), ADD KEY `applicable_mount` (`mount_id`), ADD KEY `applicable_type_value` (`type`,`value`);

--
-- Indexes for table `oc_external_config`
--
ALTER TABLE `oc_external_config`
 ADD PRIMARY KEY (`config_id`), ADD UNIQUE KEY `config_mount_key` (`mount_id`,`key`), ADD KEY `config_mount` (`mount_id`);

--
-- Indexes for table `oc_external_mounts`
--
ALTER TABLE `oc_external_mounts`
 ADD PRIMARY KEY (`mount_id`);

--
-- Indexes for table `oc_external_options`
--
ALTER TABLE `oc_external_options`
 ADD PRIMARY KEY (`option_id`), ADD UNIQUE KEY `option_mount_key` (`mount_id`,`key`), ADD KEY `option_mount` (`mount_id`);

--
-- Indexes for table `oc_federated_reshares`
--
ALTER TABLE `oc_federated_reshares`
 ADD UNIQUE KEY `share_id_index` (`share_id`);

--
-- Indexes for table `oc_filecache`
--
ALTER TABLE `oc_filecache`
 ADD PRIMARY KEY (`fileid`), ADD UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`), ADD KEY `fs_parent_name_hash` (`parent`,`name`), ADD KEY `fs_storage_mimetype` (`storage`,`mimetype`), ADD KEY `fs_storage_mimepart` (`storage`,`mimepart`), ADD KEY `fs_storage_size` (`storage`,`size`,`fileid`), ADD KEY `fs_mtime` (`mtime`);

--
-- Indexes for table `oc_filecache_bak`
--
ALTER TABLE `oc_filecache_bak`
 ADD PRIMARY KEY (`fileid`), ADD UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`), ADD KEY `fs_parent_name_hash` (`parent`,`name`), ADD KEY `fs_storage_mimetype` (`storage`,`mimetype`), ADD KEY `fs_storage_mimepart` (`storage`,`mimepart`), ADD KEY `fs_storage_size` (`storage`,`size`,`fileid`);

--
-- Indexes for table `oc_files_trash`
--
ALTER TABLE `oc_files_trash`
 ADD PRIMARY KEY (`auto_id`), ADD KEY `id_index` (`id`), ADD KEY `timestamp_index` (`timestamp`), ADD KEY `user_index` (`user`);

--
-- Indexes for table `oc_file_locks`
--
ALTER TABLE `oc_file_locks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `lock_key_index` (`key`), ADD KEY `lock_ttl_index` (`ttl`);

--
-- Indexes for table `oc_flow_checks`
--
ALTER TABLE `oc_flow_checks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `flow_unique_hash` (`hash`);

--
-- Indexes for table `oc_flow_operations`
--
ALTER TABLE `oc_flow_operations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oc_groups`
--
ALTER TABLE `oc_groups`
 ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `oc_group_admin`
--
ALTER TABLE `oc_group_admin`
 ADD PRIMARY KEY (`gid`,`uid`), ADD KEY `group_admin_uid` (`uid`);

--
-- Indexes for table `oc_group_user`
--
ALTER TABLE `oc_group_user`
 ADD PRIMARY KEY (`gid`,`uid`), ADD KEY `gu_uid_index` (`uid`);

--
-- Indexes for table `oc_jobs`
--
ALTER TABLE `oc_jobs`
 ADD PRIMARY KEY (`id`), ADD KEY `job_class_index` (`class`);

--
-- Indexes for table `oc_migrations`
--
ALTER TABLE `oc_migrations`
 ADD PRIMARY KEY (`app`,`version`);

--
-- Indexes for table `oc_mimetypes`
--
ALTER TABLE `oc_mimetypes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mimetype_id_index` (`mimetype`);

--
-- Indexes for table `oc_mounts`
--
ALTER TABLE `oc_mounts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `mounts_user_root_index` (`user_id`,`root_id`), ADD KEY `mounts_user_index` (`user_id`), ADD KEY `mounts_storage_index` (`storage_id`), ADD KEY `mounts_root_index` (`root_id`), ADD KEY `mounts_mount_id_index` (`mount_id`);

--
-- Indexes for table `oc_news_feeds`
--
ALTER TABLE `oc_news_feeds`
 ADD PRIMARY KEY (`id`), ADD KEY `news_feeds_user_id_index` (`user_id`), ADD KEY `news_feeds_folder_id_index` (`folder_id`), ADD KEY `news_feeds_url_hash_index` (`url_hash`), ADD KEY `news_feeds_last_mod_idx` (`last_modified`);

--
-- Indexes for table `oc_news_folders`
--
ALTER TABLE `oc_news_folders`
 ADD PRIMARY KEY (`id`), ADD KEY `news_folders_last_mod_idx` (`last_modified`), ADD KEY `news_folders_parent_id_idx` (`parent_id`), ADD KEY `news_folders_user_id_idx` (`user_id`);

--
-- Indexes for table `oc_news_items`
--
ALTER TABLE `oc_news_items`
 ADD PRIMARY KEY (`id`), ADD KEY `news_items_feed_id_index` (`feed_id`), ADD KEY `news_items_item_guid` (`guid_hash`,`feed_id`), ADD KEY `news_items_last_mod_idx` (`last_modified`), ADD KEY `news_items_fingerprint_idx` (`fingerprint`);

--
-- Indexes for table `oc_nextant_live_queue`
--
ALTER TABLE `oc_nextant_live_queue`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oc_notes_meta`
--
ALTER TABLE `oc_notes_meta`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `notes_meta_file_user_index` (`file_id`,`user_id`), ADD KEY `notes_meta_file_id_index` (`file_id`), ADD KEY `notes_meta_user_id_index` (`user_id`);

--
-- Indexes for table `oc_notifications`
--
ALTER TABLE `oc_notifications`
 ADD PRIMARY KEY (`notification_id`), ADD KEY `oc_notifications_app` (`app`), ADD KEY `oc_notifications_user` (`user`), ADD KEY `oc_notifications_timestamp` (`timestamp`), ADD KEY `oc_notifications_object` (`object_type`,`object_id`);

--
-- Indexes for table `oc_notifications_pushtokens`
--
ALTER TABLE `oc_notifications_pushtokens`
 ADD UNIQUE KEY `oc_notifpushtoken` (`uid`,`token`);

--
-- Indexes for table `oc_oauth2_access_tokens`
--
ALTER TABLE `oc_oauth2_access_tokens`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `oauth2_access_hash_idx` (`hashed_code`), ADD KEY `oauth2_access_client_id_idx` (`client_id`);

--
-- Indexes for table `oc_oauth2_clients`
--
ALTER TABLE `oc_oauth2_clients`
 ADD PRIMARY KEY (`id`), ADD KEY `oauth2_client_id_idx` (`client_identifier`);

--
-- Indexes for table `oc_preferences`
--
ALTER TABLE `oc_preferences`
 ADD PRIMARY KEY (`userid`,`appid`,`configkey`);

--
-- Indexes for table `oc_preview_generation`
--
ALTER TABLE `oc_preview_generation`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oc_privatedata`
--
ALTER TABLE `oc_privatedata`
 ADD PRIMARY KEY (`keyid`);

--
-- Indexes for table `oc_properties`
--
ALTER TABLE `oc_properties`
 ADD PRIMARY KEY (`id`), ADD KEY `property_index` (`userid`);

--
-- Indexes for table `oc_richdocuments_member`
--
ALTER TABLE `oc_richdocuments_member`
 ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `oc_richdocuments_op`
--
ALTER TABLE `oc_richdocuments_op`
 ADD PRIMARY KEY (`seq`), ADD UNIQUE KEY `richdocuments_op_eis_idx` (`es_id`,`seq`);

--
-- Indexes for table `oc_richdocuments_revisions`
--
ALTER TABLE `oc_richdocuments_revisions`
 ADD UNIQUE KEY `richdocuments_rev_eis_idx` (`es_id`,`seq_head`);

--
-- Indexes for table `oc_richdocuments_session`
--
ALTER TABLE `oc_richdocuments_session`
 ADD PRIMARY KEY (`es_id`);

--
-- Indexes for table `oc_richdocuments_wopi`
--
ALTER TABLE `oc_richdocuments_wopi`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `rd_wopi_token_idx` (`token`);

--
-- Indexes for table `oc_schedulingobjects`
--
ALTER TABLE `oc_schedulingobjects`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oc_share`
--
ALTER TABLE `oc_share`
 ADD PRIMARY KEY (`id`), ADD KEY `item_share_type_index` (`item_type`,`share_type`), ADD KEY `file_source_index` (`file_source`), ADD KEY `token_index` (`token`), ADD KEY `share_with_index` (`share_with`), ADD KEY `parent_index` (`parent`);

--
-- Indexes for table `oc_share_external`
--
ALTER TABLE `oc_share_external`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`), ADD KEY `sh_external_user` (`user`);

--
-- Indexes for table `oc_storages`
--
ALTER TABLE `oc_storages`
 ADD PRIMARY KEY (`numeric_id`), ADD UNIQUE KEY `storages_id_index` (`id`);

--
-- Indexes for table `oc_systemtag`
--
ALTER TABLE `oc_systemtag`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`);

--
-- Indexes for table `oc_systemtag_group`
--
ALTER TABLE `oc_systemtag_group`
 ADD PRIMARY KEY (`gid`,`systemtagid`);

--
-- Indexes for table `oc_systemtag_object_mapping`
--
ALTER TABLE `oc_systemtag_object_mapping`
 ADD UNIQUE KEY `mapping` (`objecttype`,`objectid`,`systemtagid`);

--
-- Indexes for table `oc_talk_guests`
--
ALTER TABLE `oc_talk_guests`
 ADD UNIQUE KEY `tg_session_hash` (`session_hash`);

--
-- Indexes for table `oc_talk_rooms`
--
ALTER TABLE `oc_talk_rooms`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `tr_room_token` (`token`);

--
-- Indexes for table `oc_talk_signaling`
--
ALTER TABLE `oc_talk_signaling`
 ADD KEY `ts_recipient_time` (`recipient`,`timestamp`);

--
-- Indexes for table `oc_trusted_servers`
--
ALTER TABLE `oc_trusted_servers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `url_hash` (`url_hash`);

--
-- Indexes for table `oc_twofactor_backupcodes`
--
ALTER TABLE `oc_twofactor_backupcodes`
 ADD PRIMARY KEY (`id`), ADD KEY `twofactor_backupcodes_uid` (`user_id`);

--
-- Indexes for table `oc_twofactor_providers`
--
ALTER TABLE `oc_twofactor_providers`
 ADD PRIMARY KEY (`provider_id`,`uid`);

--
-- Indexes for table `oc_twofactor_totp_secrets`
--
ALTER TABLE `oc_twofactor_totp_secrets`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `totp_secrets_user_id` (`user_id`);

--
-- Indexes for table `oc_users`
--
ALTER TABLE `oc_users`
 ADD PRIMARY KEY (`uid`), ADD KEY `user_uid_lower` (`uid_lower`);

--
-- Indexes for table `oc_vcategory`
--
ALTER TABLE `oc_vcategory`
 ADD PRIMARY KEY (`id`), ADD KEY `uid_index` (`uid`), ADD KEY `type_index` (`type`), ADD KEY `category_index` (`category`);

--
-- Indexes for table `oc_vcategory_to_object`
--
ALTER TABLE `oc_vcategory_to_object`
 ADD PRIMARY KEY (`categoryid`,`objid`,`type`), ADD KEY `vcategory_objectd_index` (`objid`,`type`);

--
-- Indexes for table `oc_whats_new`
--
ALTER TABLE `oc_whats_new`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `UNIQ_333A1DC2BF1CD3C3` (`version`), ADD KEY `version_etag_idx` (`version`,`etag`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_activity`
--
ALTER TABLE `oc_activity`
MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=647;
--
-- AUTO_INCREMENT for table `oc_activity_mq`
--
ALTER TABLE `oc_activity_mq`
MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_addressbookchanges`
--
ALTER TABLE `oc_addressbookchanges`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1688;
--
-- AUTO_INCREMENT for table `oc_addressbooks`
--
ALTER TABLE `oc_addressbooks`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_authtoken`
--
ALTER TABLE `oc_authtoken`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=905;
--
-- AUTO_INCREMENT for table `oc_bookmarks`
--
ALTER TABLE `oc_bookmarks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_bruteforce_attempts`
--
ALTER TABLE `oc_bruteforce_attempts`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_calendarchanges`
--
ALTER TABLE `oc_calendarchanges`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1420;
--
-- AUTO_INCREMENT for table `oc_calendarobjects`
--
ALTER TABLE `oc_calendarobjects`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_calendarobjects_props`
--
ALTER TABLE `oc_calendarobjects_props`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_calendars`
--
ALTER TABLE `oc_calendars`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_calendarsubscriptions`
--
ALTER TABLE `oc_calendarsubscriptions`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_calendar_invitations`
--
ALTER TABLE `oc_calendar_invitations`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_calendar_resources`
--
ALTER TABLE `oc_calendar_resources`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_calendar_rooms`
--
ALTER TABLE `oc_calendar_rooms`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_cards`
--
ALTER TABLE `oc_cards`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_cards_properties`
--
ALTER TABLE `oc_cards_properties`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3467;
--
-- AUTO_INCREMENT for table `oc_comments`
--
ALTER TABLE `oc_comments`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_dav_shares`
--
ALTER TABLE `oc_dav_shares`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_directlink`
--
ALTER TABLE `oc_directlink`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_external_applicable`
--
ALTER TABLE `oc_external_applicable`
MODIFY `applicable_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_external_config`
--
ALTER TABLE `oc_external_config`
MODIFY `config_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_external_mounts`
--
ALTER TABLE `oc_external_mounts`
MODIFY `mount_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_external_options`
--
ALTER TABLE `oc_external_options`
MODIFY `option_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_filecache`
--
ALTER TABLE `oc_filecache`
MODIFY `fileid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28960;
--
-- AUTO_INCREMENT for table `oc_files_trash`
--
ALTER TABLE `oc_files_trash`
MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `oc_file_locks`
--
ALTER TABLE `oc_file_locks`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24191;
--
-- AUTO_INCREMENT for table `oc_flow_checks`
--
ALTER TABLE `oc_flow_checks`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_flow_operations`
--
ALTER TABLE `oc_flow_operations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_jobs`
--
ALTER TABLE `oc_jobs`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3956;
--
-- AUTO_INCREMENT for table `oc_mimetypes`
--
ALTER TABLE `oc_mimetypes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `oc_mounts`
--
ALTER TABLE `oc_mounts`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `oc_news_feeds`
--
ALTER TABLE `oc_news_feeds`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `oc_news_folders`
--
ALTER TABLE `oc_news_folders`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `oc_news_items`
--
ALTER TABLE `oc_news_items`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=332396;
--
-- AUTO_INCREMENT for table `oc_nextant_live_queue`
--
ALTER TABLE `oc_nextant_live_queue`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `oc_notes_meta`
--
ALTER TABLE `oc_notes_meta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_notifications`
--
ALTER TABLE `oc_notifications`
MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `oc_oauth2_access_tokens`
--
ALTER TABLE `oc_oauth2_access_tokens`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_oauth2_clients`
--
ALTER TABLE `oc_oauth2_clients`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_preview_generation`
--
ALTER TABLE `oc_preview_generation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_privatedata`
--
ALTER TABLE `oc_privatedata`
MODIFY `keyid` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_properties`
--
ALTER TABLE `oc_properties`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_richdocuments_member`
--
ALTER TABLE `oc_richdocuments_member`
MODIFY `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique per user and session',AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `oc_richdocuments_op`
--
ALTER TABLE `oc_richdocuments_op`
MODIFY `seq` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sequence number',AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `oc_richdocuments_wopi`
--
ALTER TABLE `oc_richdocuments_wopi`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `oc_schedulingobjects`
--
ALTER TABLE `oc_schedulingobjects`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_share`
--
ALTER TABLE `oc_share`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `oc_share_external`
--
ALTER TABLE `oc_share_external`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_storages`
--
ALTER TABLE `oc_storages`
MODIFY `numeric_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `oc_systemtag`
--
ALTER TABLE `oc_systemtag`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_talk_rooms`
--
ALTER TABLE `oc_talk_rooms`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_trusted_servers`
--
ALTER TABLE `oc_trusted_servers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_twofactor_backupcodes`
--
ALTER TABLE `oc_twofactor_backupcodes`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_twofactor_totp_secrets`
--
ALTER TABLE `oc_twofactor_totp_secrets`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_vcategory`
--
ALTER TABLE `oc_vcategory`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `oc_whats_new`
--
ALTER TABLE `oc_whats_new`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
