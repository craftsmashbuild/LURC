-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2017 at 12:42 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `luni`;
USE `luni`;

--
-- Database: `luni`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `rank` smallint(1) NOT NULL DEFAULT '0',
  `numChars` tinyint(4) NOT NULL,
  `frontChar` bigint(20) NOT NULL,
  `lastLog` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activeSub` smallint(1) NOT NULL DEFAULT '0',
  `subTime` int(32) NOT NULL,
  `legoClub` smallint(1) NOT NULL,
  `locked` tinyint(4) NOT NULL,
  `banned` tinyint(4) NOT NULL,
  `loginTries` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `email`, `ip`, `rank`, `numChars`, `frontChar`, `lastLog`, `activeSub`, `subTime`, `legoClub`, `locked`, `banned`, `loginTries`) VALUES
(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', '', '127.0.0.1', 0, 0, 288385290379258999, '2017-10-03 00:45:32', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `accountID` int(10) UNSIGNED NOT NULL,
  `objectID` bigint(20) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `unapprovedName` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `nameRejected` tinyint(4) NOT NULL DEFAULT '0',
  `freeToPlay` tinyint(4) NOT NULL DEFAULT '0',
  `gmlevel` mediumint(9) NOT NULL DEFAULT '0',
  `shirtColor` int(11) NOT NULL DEFAULT '0',
  `shirtStyle` int(11) NOT NULL DEFAULT '0',
  `pantsColor` int(11) NOT NULL DEFAULT '0',
  `hairStyle` int(11) NOT NULL DEFAULT '0',
  `hairColor` int(11) NOT NULL DEFAULT '0',
  `lh` int(11) NOT NULL DEFAULT '0',
  `rh` int(11) NOT NULL DEFAULT '0',
  `eyebrows` int(11) NOT NULL DEFAULT '0',
  `eyes` int(11) NOT NULL DEFAULT '0',
  `mouth` int(11) NOT NULL DEFAULT '0',
  `headID` int(11) NOT NULL DEFAULT '0',
  `neckID` int(11) NOT NULL DEFAULT '0',
  `shirtID` int(11) NOT NULL DEFAULT '0',
  `pantsID` int(11) NOT NULL DEFAULT '0',
  `leftHandID` int(11) NOT NULL DEFAULT '0',
  `rightHandID` int(11) NOT NULL DEFAULT '0',
  `faction` tinyint(1) NOT NULL DEFAULT '0',
  `worldID` int(11) NOT NULL DEFAULT '0',
  `lastZoneId` int(11) NOT NULL,
  `mapInstance` int(11) NOT NULL,
  `mapClone` int(11) NOT NULL,
  `x` double NOT NULL DEFAULT '0',
  `y` double NOT NULL DEFAULT '0',
  `z` double NOT NULL DEFAULT '0',
  `friends` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bestFriends` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` int(3) NOT NULL DEFAULT '1',
  `uScore` int(32) NOT NULL DEFAULT '0',
  `currency` bigint(20) NOT NULL DEFAULT '0',
  `isAlive` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `accountID`, `objectID`, `name`, `unapprovedName`, `nameRejected`, `freeToPlay`, `gmlevel`, `shirtColor`, `shirtStyle`, `pantsColor`, `hairStyle`, `hairColor`, `lh`, `rh`, `eyebrows`, `eyes`, `mouth`, `headID`, `neckID`, `shirtID`, `pantsID`, `leftHandID`, `rightHandID`, `faction`, `worldID`, `lastZoneId`, `mapInstance`, `mapClone`, `x`, `y`, `z`, `friends`, `bestFriends`, `level`, `uScore`, `currency`, `isAlive`) VALUES
(0, 1, 288385290379258999, 'admin', 'admin', 0, 0, 0, 9, 25, 6, 6, 96, 33532944, 33085636, 34, 5, 8, 0, 0, 0, 0, 0, 0, 1, 0, 1100, 0, 0, 522.994873, 406.040375, 129.992722, '', '', 50, 0, 100000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `owner` bigint(20) NOT NULL COMMENT 'objid of equiping player',
  `object` bigint(20) NOT NULL,
  `itemType` int(64) NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `owner`, `object`, `itemType`) VALUES
(1, 288385290379258999, 288397110999500000, 15),
(2, 288385290379258999, 288397110999500001, 7),
(6, 288385290379258999, 288397110999500002, 6);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `charida` bigint(20) NOT NULL,
  `charidb` bigint(20) NOT NULL,
  `status` enum('REQUEST','ACCEPTED','DECLINED','FRIENDS','BEST_FRIEND_REQUEST','BEST_FRIENDS') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'REQUEST'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instances`
--

CREATE TABLE `instances` (
  `instanceid` int(11) NOT NULL,
  `server_address` varchar(22) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instances`
--

INSERT INTO `instances` (`instanceid`, `server_address`) VALUES
(7, '127.0.0.1:2002'),
(8, '127.0.0.1:0');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `owner` bigint(64) NOT NULL,
  `object` bigint(64) NOT NULL,
  `qnt` smallint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'quantity',
  `slot` smallint(3) UNSIGNED NOT NULL COMMENT 'bag slot',
  `linked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `owner`, `object`, `qnt`, `slot`, `linked`) VALUES
(1, 288385290379258999, 288397110999500000, 1, 0, 1),
(2, 288385290379258999, 288397110999500001, 1, 1, 1),
(3, 288385290379258999, 288397110999500002, 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mails`
--

CREATE TABLE `mails` (
  `id` bigint(20) NOT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sender` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `recipient_id` bigint(20) NOT NULL,
  `attachment` bigint(20) NOT NULL DEFAULT '0',
  `attachment_count` int(11) NOT NULL DEFAULT '0',
  `sent_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `missions`
--

CREATE TABLE `missions` (
  `id` bigint(20) NOT NULL,
  `character` bigint(20) NOT NULL COMMENT 'Character ObjectID',
  `missionid` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `missions`
--

INSERT INTO `missions` (`id`, `character`, `missionid`, `time`, `count`) VALUES
(1, 288385290379258999, 1727, '2017-10-03 00:46:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `objects`
--

CREATE TABLE `objects` (
  `objectid` bigint(64) NOT NULL,
  `template` int(32) UNSIGNED NOT NULL COMMENT 'LOT',
  `spawnid` bigint(20) DEFAULT NULL COMMENT 'objectID of in-world object',
  `nose_cone_template` int(11) DEFAULT NULL COMMENT '(for LOT 6416)',
  `cockpit_template` int(11) DEFAULT NULL COMMENT '(for LOT 6416)',
  `engine_template` int(11) DEFAULT NULL COMMENT '(for LOT 6416)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `objects`
--

INSERT INTO `objects` (`objectid`, `template`, `spawnid`, `nose_cone_template`, `cockpit_template`, `engine_template`) VALUES
(288397110999500000, 4345, NULL, NULL, NULL, NULL),
(288397110999500001, 2524, NULL, NULL, NULL, NULL),
(288397110999500002, 12718, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sessionid` int(20) NOT NULL,
  `ipaddress` varchar(21) NOT NULL DEFAULT '',
  `phase` smallint(6) NOT NULL DEFAULT '1' COMMENT '1 = CONNECTED, 2 = AUTHENTIFIED, 3 = PLAYING, 4 = INWORLD',
  `sessionkey` varchar(33) NOT NULL DEFAULT '',
  `instanceid` int(11) DEFAULT NULL,
  `accountid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `charid` bigint(20) DEFAULT NULL,
  `zoneid` int(11) NOT NULL DEFAULT '0',
  `cloneid` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sessionid`, `ipaddress`, `phase`, `sessionkey`, `instanceid`, `accountid`, `login_time`, `charid`, `zoneid`, `cloneid`) VALUES
(18, '127.0.0.1:50141', 4, 'c50e265b3a8604196eaba50437e2023c', 7, 1, '2017-10-03 22:36:02', 288385290379258999, 1100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `min_rank` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `worlds`
--

CREATE TABLE `worlds` (
  `id` int(50) UNSIGNED NOT NULL,
  `zone` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'the zone, 0 avant gardens etc',
  `owner` int(5) NOT NULL,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `desc` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'description',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 need to be cleaned, 1: private, 2: friends, 3: public'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `world_objects`
--

CREATE TABLE `world_objects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `LOT` int(32) NOT NULL,
  `tempObjID` bigint(64) NOT NULL DEFAULT '0',
  `world` int(10) UNSIGNED NOT NULL,
  `posX` double NOT NULL,
  `posY` double NOT NULL,
  `posZ` double NOT NULL,
  `rotX` double NOT NULL,
  `rotY` double NOT NULL,
  `rotZ` double NOT NULL,
  `rotW` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`objectID`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instances`
--
ALTER TABLE `instances`
  ADD PRIMARY KEY (`instanceid`);
ALTER TABLE `instances` ADD FULLTEXT KEY `server_address` (`server_address`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `objects`
--
ALTER TABLE `objects`
  ADD PRIMARY KEY (`objectid`),
  ADD KEY `objectid` (`objectid`),
  ADD KEY `objectid_2` (`objectid`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionid`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `worlds`
--
ALTER TABLE `worlds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `world_objects`
--
ALTER TABLE `world_objects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `objectID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483647;
--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `instances`
--
ALTER TABLE `instances`
  MODIFY `instanceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mails`
--
ALTER TABLE `mails`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `missions`
--
ALTER TABLE `missions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `objects`
--
ALTER TABLE `objects`
  MODIFY `objectid` bigint(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483647;
--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessionid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `worlds`
--
ALTER TABLE `worlds`
  MODIFY `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `world_objects`
--
ALTER TABLE `world_objects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
