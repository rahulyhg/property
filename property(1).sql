-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 07, 2014 at 03:06 PM
-- Server version: 5.5.37
-- PHP Version: 5.3.10-1ubuntu3.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `property`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`) VALUES
(2, 3, 'Udaipur');

-- --------------------------------------------------------

--
-- Table structure for table `conversiontype_documents`
--

CREATE TABLE IF NOT EXISTS `conversiontype_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversion_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `conversiontype_documents`
--

INSERT INTO `conversiontype_documents` (`id`, `conversion_type_id`, `name`, `template`) VALUES
(1, 4, 'HDO', 'Aavedak Khatedar ka nam {{hdo_name}}father name {{hdo_father_name}}address {{hdo_address}}'),
(2, 3, 'Converted', '<table style="font-family:''kruti dev 010''" cellpadding="4" cellspacing="0" width="100%">\r\n  <tbody><tr>\r\n    <td width="50%">\r\n      <p style="font-family:''kruti dev 010''" class="hindi">Party name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_party-name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Party father name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_party-father_name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Party DOB</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_party-dob}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Party Pancard no</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_party-pancard_no}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Party image \r\n      </p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_party-image_id}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agent name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_agent-name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agent Father name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_agent-father_name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agent Address</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_agent-address}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agent DOB</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_agent-dob}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agent Phone number</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_agent-ph_no}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agnet Pancard number</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_agent-pancard_no}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agnet Image</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_agent-image_id}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Property type name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_property_property_type-name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Planning state name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_property_planning_state-name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Planning city name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_property_planning_city-name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Planning Village Name \r\n      </p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_property_planning_village-name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Conversion type name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_property_conversiontype-name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Property name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_property-name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Property status \r\n      </p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_property-statue}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Property is _legal</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_property-is_legal}}</p>\r\n    </td>\r\n  </tr>\r\n</tbody></table>'),
(3, 5, 'HDO Converted', '{{name}}'),
(4, 3, 'Converted21', '{{name}}');

-- --------------------------------------------------------

--
-- Table structure for table `conversion_docs_logs`
--

CREATE TABLE IF NOT EXISTS `conversion_docs_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(255) DEFAULT NULL,
  `property_type_id` int(255) DEFAULT NULL,
  `conversion_type_id` int(255) DEFAULT NULL,
  `conversiontype_document_id` int(255) DEFAULT NULL,
  `template` text,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conversion_docs_report`
--

CREATE TABLE IF NOT EXISTS `conversion_docs_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(255) DEFAULT NULL,
  `conversiontype_document_id` int(255) DEFAULT NULL,
  `template` text,
  `created_at` date DEFAULT NULL,
  `property_logs_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `conversion_docs_report`
--

INSERT INTO `conversion_docs_report` (`id`, `property_id`, `conversiontype_document_id`, `template`, `created_at`, `property_logs_id`) VALUES
(11, NULL, 1, 'Agent Father Name {{propertylog_agent_father_name}}\r\nparty father name Bharat', '2014-08-04', 83),
(12, NULL, 1, 'Aavedak Khatedar ka nam {{hdo_name}}father name {{hdo_father_name}}address {{hdo_address}}', '2014-08-04', 83),
(20, NULL, 2, 'Party Name : Chirag Singhvi\r\nParty Father Name : Deepak ji Singhvi\r\nParty DOB : 1994-06-04\r\nParty Pancard : 456765\r\n\r\nAgent Name : Jitendra Mali \r\nAgent Father Name : Shyam Lal ji Mali\r\nAgent Address : RK Circle Pula\r\nAgent DOB : 1993-07-05\r\nAgent Phone no : 97830015650\r\nAgent Pan card no : 876787\r\n\r\n', '2014-08-05', 89),
(26, NULL, 2, '<table cellpadding="4" cellspacing="0" width="100%">\r\n  <tbody><tr>\r\n    <td width="50%">\r\n      <p>Party name</p><table rules="none" class="hindi"><tbody><tr><td>&nbsp;xcvcnvb</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr></tbody></table>\r\n    </td>\r\n    <td width="50%">\r\n      <p style="font-family:''kruti dev 010''" class="hindi">Chirag Singhvi</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Party father name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>Deepak ji Singhvi</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Party DOB</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p><span class="hindi">1994-06-04</span></p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Party Pancard no</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>456765</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Party image \r\n      </p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_party-image_id}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agent name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>Jitendra Mali </p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agent Father name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>Shyam Lal ji Mali</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agent Address</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>RK Circle Pula</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agent DOB</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>1993-07-05</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agent Phone number</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>97830015650</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agnet Pancard number</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>876787</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Agnet Image</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{_agent-image_id}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Property type name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>{{property_type-name}}</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Planning state name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>Rajasthan</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Planning city name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>Udaipur</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Planning Village Name \r\n      </p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>Gogunda</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Conversion type name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>Converted</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Property name</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>Ploat 10001</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Property status \r\n      </p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>Sold</p>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td width="50%">\r\n      <p>Property is _legal</p>\r\n    </td>\r\n    <td width="50%">\r\n      <p>0</p>\r\n    </td>\r\n  </tr>\r\n</tbody></table>', '2014-08-06', 91);

-- --------------------------------------------------------

--
-- Table structure for table `conversion_types`
--

CREATE TABLE IF NOT EXISTS `conversion_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `conversion_types`
--

INSERT INTO `conversion_types` (`id`, `name`) VALUES
(3, 'Converted'),
(4, 'HDO'),
(5, 'HDO Converted'),
(6, 'Agriculture Registry'),
(7, 'Collectrate Registrate');

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE IF NOT EXISTS `document_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `name`) VALUES
(3, 'ID PROOF'),
(4, 'REGISTERY');

-- --------------------------------------------------------

--
-- Table structure for table `filestore_file`
--

CREATE TABLE IF NOT EXISTS `filestore_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filestore_type_id` int(11) NOT NULL DEFAULT '0',
  `filestore_volume_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `original_filename` varchar(255) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `filenum` int(11) NOT NULL DEFAULT '0',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `filestore_file`
--

INSERT INTO `filestore_file` (`id`, `filestore_type_id`, `filestore_volume_id`, `filename`, `original_filename`, `filesize`, `filenum`, `deleted`) VALUES
(1, 1, 1, '0/20140730133029_1_thumb-2.png', 'thumb_2.png', 36690, 0, ''),
(2, 1, 1, '0/20140730133028__2.png', '2.png', 820258, 0, ''),
(3, 1, 1, '0/20140730133058_1_thumb-2.png', 'thumb_2.png', 36690, 0, ''),
(4, 1, 1, '0/20140730133058__2.png', '2.png', 820258, 0, ''),
(5, 1, 1, '0/20140730134123_1_thumb-1.png', 'thumb_1.png', 2938, 0, ''),
(6, 1, 1, '0/20140730134123__1.png', '1.png', 69795, 0, ''),
(7, 1, 1, '0/20140730143155_1_thumb-1.png', 'thumb_1.png', 2938, 0, ''),
(8, 1, 1, '0/20140730143155__1.png', '1.png', 69795, 0, ''),
(9, 1, 1, '0/20140730143230_1_thumb-3d.png', 'thumb_3d.png', 2117, 0, ''),
(10, 1, 1, '0/20140730143230__3d.png', '3d.png', 82621, 0, ''),
(11, 2, 1, '0/20140806103001_1_thumb-news1.jpg', 'thumb_news1.jpg', 3090, 0, ''),
(12, 2, 1, '0/20140806103001__news1.jpg', 'news1.jpg', 7698, 0, ''),
(13, 2, 1, '0/20140806103029_1_thumb-banner-980x280.jpg', 'thumb_banner-980x280.jpg', 7517, 0, ''),
(14, 2, 1, '0/20140806103029__banner-980x280.jpg', 'banner-980x280.jpg', 64421, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `filestore_image`
--

CREATE TABLE IF NOT EXISTS `filestore_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `original_file_id` int(11) NOT NULL DEFAULT '0',
  `thumb_file_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `filestore_image`
--

INSERT INTO `filestore_image` (`id`, `name`, `original_file_id`, `thumb_file_id`) VALUES
(1, NULL, 2, 1),
(2, NULL, 4, 3),
(3, NULL, 6, 5),
(4, NULL, 8, 7),
(5, NULL, 10, 9),
(6, NULL, 12, 11),
(7, NULL, 14, 13);

-- --------------------------------------------------------

--
-- Table structure for table `filestore_type`
--

CREATE TABLE IF NOT EXISTS `filestore_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(64) NOT NULL DEFAULT '',
  `extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `filestore_type`
--

INSERT INTO `filestore_type` (`id`, `name`, `mime_type`, `extension`) VALUES
(1, 'png', 'image/png', 'png'),
(2, 'jpeg', 'image/jpeg', 'jpeg'),
(3, 'gif', 'image/gif', 'gif');

-- --------------------------------------------------------

--
-- Table structure for table `filestore_volume`
--

CREATE TABLE IF NOT EXISTS `filestore_volume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `dirname` varchar(255) NOT NULL DEFAULT '',
  `total_space` bigint(20) NOT NULL DEFAULT '0',
  `used_space` bigint(20) NOT NULL DEFAULT '0',
  `stored_files_cnt` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('Y','N') DEFAULT 'Y',
  `last_filenum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `filestore_volume`
--

INSERT INTO `filestore_volume` (`id`, `name`, `dirname`, `total_space`, `used_space`, `stored_files_cnt`, `enabled`, `last_filenum`) VALUES
(1, 'upload', 'upload', 1000000000, 0, 14, 'Y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE IF NOT EXISTS `parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_agent` tinyint(1) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `address` text,
  `dob` date DEFAULT NULL,
  `ph_no` varchar(255) DEFAULT NULL,
  `pancard_no` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `agent_image_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`id`, `name`, `is_agent`, `father_name`, `address`, `dob`, `ph_no`, `pancard_no`, `image_id`, `agent_image_id`) VALUES
(3, 'Jitendra Mali ', 1, 'Shyam Lal ji Mali', 'RK Circle Pula', '1993-07-05', '97830015650', 876787, NULL, NULL),
(4, 'Chirag Singhvi', 0, 'Deepak ji Singhvi', '428- Badgaon Udaipur', '1994-06-04', '8094777293', 456765, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `party_documents`
--

CREATE TABLE IF NOT EXISTS `party_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_id` int(255) DEFAULT NULL,
  `document_type_id` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `submitted_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `party_documents`
--

INSERT INTO `party_documents` (`id`, `party_id`, `document_type_id`, `name`, `image_id`, `submitted_on`) VALUES
(1, 3, 3, 'kjhkj', 6, '2014-07-30'),
(2, 4, 3, '', 8, '2014-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `payments_paid`
--

CREATE TABLE IF NOT EXISTS `payments_paid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_transaction_id` int(11) DEFAULT NULL,
  `amount` decimal(11,4) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `narration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transaction`
--

CREATE TABLE IF NOT EXISTS `payment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `party_id` int(11) DEFAULT NULL,
  `receipt_no` int(11) DEFAULT NULL,
  `amount` decimal(11,4) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `deal_type` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `rate` decimal(11,4) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `agent_tds_amount` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=84 ;

--
-- Dumping data for table `payment_transaction`
--

INSERT INTO `payment_transaction` (`id`, `property_id`, `agent_id`, `party_id`, `receipt_no`, `amount`, `created_at`, `deal_type`, `transaction_type`, `rate`, `unit`, `agent_tds_amount`) VALUES
(60, 41, 3, 4, 1, 1200000.0000, '2014-07-29', 'Purchase', 'ToPay', 12.0000, 'Biga', NULL),
(61, 41, 3, 4, 2, 5000.0000, '2014-07-29', 'Purchase', 'AgentCommissionPurchase', 12.0000, 'Biga', NULL),
(62, 42, 3, 4, 3, 1200000.0000, '2014-07-30', 'Purchase', 'ToPay', 12.0000, 'Biga', 240000.0000),
(63, 42, 3, 4, 4, 5000.0000, '2014-07-30', 'Purchase', 'AgentCommissionPurchase', 12.0000, 'Biga', 1000.0000),
(64, 43, 3, 4, 5, 1000000.0000, '2014-07-30', 'Purchase', 'ToPay', 12.0000, 'Biga', 100000.0000),
(65, 43, 3, 4, 6, 5000.0000, '2014-07-30', 'Purchase', 'AgentCommissionPurchase', 12.0000, 'Biga', 100000.0000),
(72, 44, 3, 4, 13, 20000.0000, '2014-08-05', 'Purchase', 'ToPay', 200000.0000, 'Biga', 2000.0000),
(73, 44, 3, 4, 14, 200.0000, '2014-08-05', 'Purchase', 'AgentCommissionPurchase', 200000.0000, 'Biga', 2000.0000),
(74, 45, 3, 4, 15, 30000.0000, '2014-08-05', 'Purchase', 'ToPay', 300000.0000, 'Sqft', 3000.0000),
(75, 45, 3, 4, 16, 3000.0000, '2014-08-05', 'Purchase', 'AgentCommissionPurchase', 300000.0000, 'Sqft', 3000.0000),
(76, 45, 3, 4, 17, 203000.0000, '2014-08-05', 'Sales', 'ToReceive', 9999999.9999, 'Sqft', 20300.0000),
(77, 45, 3, 4, 18, 2000.0000, '2014-08-05', 'Sales', 'AgentCommissionSale', 9999999.9999, 'Sqft', 20300.0000),
(78, 44, 3, 4, 19, 2999.0000, '2014-08-05', 'Sales', 'ToReceive', 567576.0000, 'Sqft', 299.9000),
(79, 44, 3, 4, 20, 2000.0000, '2014-08-05', 'Sales', 'AgentCommissionSale', 567576.0000, 'Sqft', 299.9000),
(80, 46, 3, 4, 21, 1200.0000, '2014-08-06', 'Purchase', 'ToPay', 1200.0000, 'Biga', 120.0000),
(81, 46, 3, 4, 22, 5000.0000, '2014-08-06', 'Purchase', 'AgentCommissionPurchase', 1200.0000, 'Biga', 120.0000),
(82, 46, 3, 4, 23, 13.0000, '2014-08-06', 'Sales', 'ToReceive', 0.0000, 'Sqft', 1.3000),
(83, 46, 3, 4, 24, 123.0000, '2014-08-06', 'Sales', 'AgentCommissionSale', 0.0000, 'Sqft', 1.3000);

-- --------------------------------------------------------

--
-- Table structure for table `plannings`
--

CREATE TABLE IF NOT EXISTS `plannings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tehsil_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `village_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `plannings`
--

INSERT INTO `plannings` (`id`, `tehsil_id`, `name`, `village_id`, `state_id`, `city_id`) VALUES
(3, 2, 'New Home Celebration Ploat', 2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_type_id` int(11) DEFAULT NULL,
  `planning_id` int(11) DEFAULT NULL,
  `conversion_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `is_legal` tinyint(1) DEFAULT NULL,
  `is_registered` tinyint(1) DEFAULT NULL,
  `google_map_address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `property_type_id`, `planning_id`, `conversion_type_id`, `name`, `status`, `is_legal`, `is_registered`, `google_map_address`) VALUES
(46, 2, 3, 3, 'Ploat 10001', 'Sold', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `property_documents`
--

CREATE TABLE IF NOT EXISTS `property_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) DEFAULT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `property_documents`
--

INSERT INTO `property_documents` (`id`, `property_id`, `document_type_id`, `name`, `image_id`) VALUES
(1, 41, 4, 'Re', 10);

-- --------------------------------------------------------

--
-- Table structure for table `property_logs`
--

CREATE TABLE IF NOT EXISTS `property_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `amount` decimal(11,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=92 ;

--
-- Dumping data for table `property_logs`
--

INSERT INTO `property_logs` (`id`, `party_id`, `agent_id`, `property_id`, `action`, `created_at`, `amount`) VALUES
(80, 4, 3, 41, 'Purchase', '2014-07-29', 1200000.0000),
(81, 4, 3, 42, 'Purchase', '2014-07-30', 1200000.0000),
(82, 4, 3, 43, 'Purchase', '2014-07-30', 1000000.0000),
(83, 4, 3, 42, 'Sale', '2014-08-04', 20000.0000),
(84, 4, 3, 41, 'Sale', '2014-08-04', 19999.0000),
(85, 4, 3, 43, 'Sale', '2014-08-04', 123.0000),
(86, 4, 3, 44, 'Purchase', '2014-08-05', 20000.0000),
(87, 4, 3, 45, 'Purchase', '2014-08-05', 30000.0000),
(88, 4, 3, 45, 'Sale', '2014-08-05', 203000.0000),
(89, 4, 3, 44, 'Sale', '2014-08-05', 2999.0000),
(90, 4, 3, 46, 'Purchase', '2014-08-06', 1200.0000),
(91, 4, 3, 46, 'Sale', '2014-08-06', 13.0000);

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE IF NOT EXISTS `property_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`id`, `name`) VALUES
(2, 'Plot'),
(3, 'Agriculture');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`) VALUES
(3, 'Rajasthan'),
(4, 'Gujrat');

-- --------------------------------------------------------

--
-- Table structure for table `Students`
--

CREATE TABLE IF NOT EXISTS `Students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `roll_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tehsiles`
--

CREATE TABLE IF NOT EXISTS `tehsiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tehsiles`
--

INSERT INTO `tehsiles` (`id`, `city_id`, `name`) VALUES
(2, 2, 'Girva');

-- --------------------------------------------------------

--
-- Table structure for table `villages`
--

CREATE TABLE IF NOT EXISTS `villages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tehsil_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `villages`
--

INSERT INTO `villages` (`id`, `tehsil_id`, `name`) VALUES
(2, 2, 'Gogunda');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
