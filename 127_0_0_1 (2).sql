-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2017 at 11:59 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moodle`
--
DROP DATABASE `moodle`;
CREATE DATABASE IF NOT EXISTS `moodle` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `moodle`;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_models`
--

DROP TABLE IF EXISTS `mdl_analytics_models`;
CREATE TABLE IF NOT EXISTS `mdl_analytics_models` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `trained` tinyint(1) NOT NULL DEFAULT '0',
  `target` varchar(255) NOT NULL DEFAULT '',
  `indicators` longtext NOT NULL,
  `timesplitting` varchar(255) DEFAULT NULL,
  `version` bigint(10) NOT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_analmode_enatra_ix` (`enabled`,`trained`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Analytic models.';

--
-- Truncate table before insert `mdl_analytics_models`
--

TRUNCATE TABLE `mdl_analytics_models`;
--
-- Dumping data for table `mdl_analytics_models`
--

INSERT DELAYED IGNORE INTO `mdl_analytics_models` (`id`, `enabled`, `trained`, `target`, `indicators`, `timesplitting`, `version`, `timecreated`, `timemodified`, `usermodified`) VALUES
(1, 0, 0, '\\core\\analytics\\target\\course_dropout', '["\\\\mod_assign\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_assign\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_book\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_book\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_chat\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_chat\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_choice\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_choice\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_data\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_data\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_feedback\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_feedback\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_folder\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_folder\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_forum\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_forum\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_glossary\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_glossary\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_imscp\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_imscp\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_label\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_label\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_lesson\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_lesson\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_lti\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_lti\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_page\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_page\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_quiz\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_quiz\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_resource\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_resource\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_scorm\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_scorm\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_survey\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_survey\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_url\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_url\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_wiki\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_wiki\\\\analytics\\\\indicator\\\\social_breadth","\\\\mod_workshop\\\\analytics\\\\indicator\\\\cognitive_depth","\\\\mod_workshop\\\\analytics\\\\indicator\\\\social_breadth"]', NULL, 1502328677, 1502328677, 1502328677, 0),
(2, 1, 1, '\\core\\analytics\\target\\no_teaching', '["\\\\core_course\\\\analytics\\\\indicator\\\\no_teacher"]', '\\core\\analytics\\time_splitting\\single_range', 1502328678, 1502328678, 1502328678, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_models_log`
--

DROP TABLE IF EXISTS `mdl_analytics_models_log`;
CREATE TABLE IF NOT EXISTS `mdl_analytics_models_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `modelid` bigint(10) NOT NULL,
  `version` bigint(10) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '',
  `indicators` longtext NOT NULL,
  `timesplitting` varchar(255) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `info` longtext,
  `dir` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_analmodelog_mod_ix` (`modelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Analytic models changes during evaluation.';

--
-- Truncate table before insert `mdl_analytics_models_log`
--

TRUNCATE TABLE `mdl_analytics_models_log`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_predict_ranges`
--

DROP TABLE IF EXISTS `mdl_analytics_predict_ranges`;
CREATE TABLE IF NOT EXISTS `mdl_analytics_predict_ranges` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `modelid` bigint(10) NOT NULL,
  `analysableid` bigint(10) NOT NULL,
  `timesplitting` varchar(255) NOT NULL DEFAULT '',
  `rangeindex` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_analpredrang_modanatim_ix` (`modelid`,`analysableid`,`timesplitting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Time ranges already used for predictions.';

--
-- Truncate table before insert `mdl_analytics_predict_ranges`
--

TRUNCATE TABLE `mdl_analytics_predict_ranges`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_predictions`
--

DROP TABLE IF EXISTS `mdl_analytics_predictions`;
CREATE TABLE IF NOT EXISTS `mdl_analytics_predictions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `modelid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sampleid` bigint(10) NOT NULL,
  `rangeindex` mediumint(5) NOT NULL,
  `prediction` tinyint(2) NOT NULL,
  `predictionscore` decimal(10,5) NOT NULL,
  `calculations` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_analpred_modcon_ix` (`modelid`,`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Predictions';

--
-- Truncate table before insert `mdl_analytics_predictions`
--

TRUNCATE TABLE `mdl_analytics_predictions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_train_samples`
--

DROP TABLE IF EXISTS `mdl_analytics_train_samples`;
CREATE TABLE IF NOT EXISTS `mdl_analytics_train_samples` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `modelid` bigint(10) NOT NULL,
  `analysableid` bigint(10) NOT NULL,
  `timesplitting` varchar(255) NOT NULL DEFAULT '',
  `fileid` bigint(10) NOT NULL,
  `sampleids` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_analtraisamp_modanatim_ix` (`modelid`,`analysableid`,`timesplitting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Samples used for training';

--
-- Truncate table before insert `mdl_analytics_train_samples`
--

TRUNCATE TABLE `mdl_analytics_train_samples`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_analytics_used_files`
--

DROP TABLE IF EXISTS `mdl_analytics_used_files`;
CREATE TABLE IF NOT EXISTS `mdl_analytics_used_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `modelid` bigint(10) NOT NULL DEFAULT '0',
  `fileid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(50) NOT NULL DEFAULT '',
  `time` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_analusedfile_modfilact_ix` (`modelid`,`fileid`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Files that have already been used for training and predictio';

--
-- Truncate table before insert `mdl_analytics_used_files`
--

TRUNCATE TABLE `mdl_analytics_used_files`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign`
--

DROP TABLE IF EXISTS `mdl_assign`;
CREATE TABLE IF NOT EXISTS `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `gradingduedate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `sendstudentnotifications` tinyint(2) NOT NULL DEFAULT '1',
  `preventsubmissionnotingroup` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table saves information about an instance of mod_assign';

--
-- Truncate table before insert `mdl_assign`
--

TRUNCATE TABLE `mdl_assign`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_grades`
--

DROP TABLE IF EXISTS `mdl_assign_grades`;
CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading information about a single assignment submission.';

--
-- Truncate table before insert `mdl_assign_grades`
--

TRUNCATE TABLE `mdl_assign_grades`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_overrides`
--

DROP TABLE IF EXISTS `mdl_assign_overrides`;
CREATE TABLE IF NOT EXISTS `mdl_assign_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `allowsubmissionsfromdate` bigint(10) DEFAULT NULL,
  `duedate` bigint(10) DEFAULT NULL,
  `cutoffdate` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_assiover_ass_ix` (`assignid`),
  KEY `mdl_assiover_gro_ix` (`groupid`),
  KEY `mdl_assiover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to assign settings.';

--
-- Truncate table before insert `mdl_assign_overrides`
--

TRUNCATE TABLE `mdl_assign_overrides`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_plugin_config`
--

DROP TABLE IF EXISTS `mdl_assign_plugin_config`;
CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) NOT NULL DEFAULT '',
  `subtype` varchar(28) NOT NULL DEFAULT '',
  `name` varchar(28) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config data for an instance of a plugin in an assignment.';

--
-- Truncate table before insert `mdl_assign_plugin_config`
--

TRUNCATE TABLE `mdl_assign_plugin_config`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_submission`
--

DROP TABLE IF EXISTS `mdl_assign_submission`;
CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  `latest` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_assusegrolat_ix` (`assignment`,`userid`,`groupid`,`latest`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about student interactions with';

--
-- Truncate table before insert `mdl_assign_submission`
--

TRUNCATE TABLE `mdl_assign_submission`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_flags`
--

DROP TABLE IF EXISTS `mdl_assign_user_flags`;
CREATE TABLE IF NOT EXISTS `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of flags that can be set for a single user in a single ';

--
-- Truncate table before insert `mdl_assign_user_flags`
--

TRUNCATE TABLE `mdl_assign_user_flags`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_mapping`
--

DROP TABLE IF EXISTS `mdl_assign_user_mapping`;
CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Map an assignment specific id number to a user';

--
-- Truncate table before insert `mdl_assign_user_mapping`
--

TRUNCATE TABLE `mdl_assign_user_mapping`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_comments`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_comments`;
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text feedback for submitted assignments';

--
-- Truncate table before insert `mdl_assignfeedback_comments`
--

TRUNCATE TABLE `mdl_assignfeedback_comments`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_annot`;
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext,
  `type` varchar(10) DEFAULT 'line',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores annotations added to pdfs submitted by students';

--
-- Truncate table before insert `mdl_assignfeedback_editpdf_annot`
--

TRUNCATE TABLE `mdl_assignfeedback_editpdf_annot`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_cmnt`;
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores comments added to pdfs';

--
-- Truncate table before insert `mdl_assignfeedback_editpdf_cmnt`
--

TRUNCATE TABLE `mdl_assignfeedback_editpdf_cmnt`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_queue`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_queue`;
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `submissionattempt` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Queue for processing.';

--
-- Truncate table before insert `mdl_assignfeedback_editpdf_queue`
--

TRUNCATE TABLE `mdl_assignfeedback_editpdf_queue`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_editpdf_quick`;
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores teacher specified quicklist comments';

--
-- Truncate table before insert `mdl_assignfeedback_editpdf_quick`
--

TRUNCATE TABLE `mdl_assignfeedback_editpdf_quick`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_file`
--

DROP TABLE IF EXISTS `mdl_assignfeedback_file`;
CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores info about the number of files submitted by a student';

--
-- Truncate table before insert `mdl_assignfeedback_file`
--

TRUNCATE TABLE `mdl_assignfeedback_file`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

DROP TABLE IF EXISTS `mdl_assignment`;
CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments';

--
-- Truncate table before insert `mdl_assignment`
--

TRUNCATE TABLE `mdl_assignment`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

DROP TABLE IF EXISTS `mdl_assignment_submissions`;
CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext,
  `data2` longtext,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments';

--
-- Truncate table before insert `mdl_assignment_submissions`
--

TRUNCATE TABLE `mdl_assignment_submissions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_upgrade`
--

DROP TABLE IF EXISTS `mdl_assignment_upgrade`;
CREATE TABLE IF NOT EXISTS `mdl_assignment_upgrade` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `oldcmid` bigint(10) NOT NULL DEFAULT '0',
  `oldinstance` bigint(10) NOT NULL DEFAULT '0',
  `newcmid` bigint(10) NOT NULL DEFAULT '0',
  `newinstance` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiupgr_old_ix` (`oldcmid`),
  KEY `mdl_assiupgr_old2_ix` (`oldinstance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about upgraded assignments';

--
-- Truncate table before insert `mdl_assignment_upgrade`
--

TRUNCATE TABLE `mdl_assignment_upgrade`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_file`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_file`;
CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about file submissions for assignments';

--
-- Truncate table before insert `mdl_assignsubmission_file`
--

TRUNCATE TABLE `mdl_assignsubmission_file`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

DROP TABLE IF EXISTS `mdl_assignsubmission_onlinetext`;
CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about onlinetext submission';

--
-- Truncate table before insert `mdl_assignsubmission_onlinetext`
--

TRUNCATE TABLE `mdl_assignsubmission_onlinetext`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_auth_oauth2_linked_login`
--

DROP TABLE IF EXISTS `mdl_auth_oauth2_linked_login`;
CREATE TABLE IF NOT EXISTS `mdl_auth_oauth2_linked_login` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` longtext NOT NULL,
  `confirmtoken` varchar(64) NOT NULL DEFAULT '',
  `confirmtokenexpires` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_authoautlinklogi_useis_uix` (`userid`,`issuerid`,`username`),
  KEY `mdl_authoautlinklogi_issuse_ix` (`issuerid`,`username`),
  KEY `mdl_authoautlinklogi_use_ix` (`usermodified`),
  KEY `mdl_authoautlinklogi_use2_ix` (`userid`),
  KEY `mdl_authoautlinklogi_iss_ix` (`issuerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Accounts linked to a users Moodle account.';

--
-- Truncate table before insert `mdl_auth_oauth2_linked_login`
--

TRUNCATE TABLE `mdl_auth_oauth2_linked_login`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

DROP TABLE IF EXISTS `mdl_backup_controllers`;
CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used';

--
-- Truncate table before insert `mdl_backup_controllers`
--

TRUNCATE TABLE `mdl_backup_controllers`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

DROP TABLE IF EXISTS `mdl_backup_courses`;
CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status';

--
-- Truncate table before insert `mdl_backup_courses`
--

TRUNCATE TABLE `mdl_backup_courses`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

DROP TABLE IF EXISTS `mdl_backup_logs`;
CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by';

--
-- Truncate table before insert `mdl_backup_logs`
--

TRUNCATE TABLE `mdl_backup_logs`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge`
--

DROP TABLE IF EXISTS `mdl_badge`;
CREATE TABLE IF NOT EXISTS `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) NOT NULL DEFAULT '',
  `issuerurl` varchar(255) NOT NULL DEFAULT '',
  `issuercontact` varchar(255) DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext NOT NULL,
  `messagesubject` longtext NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines badge';

--
-- Truncate table before insert `mdl_badge`
--

TRUNCATE TABLE `mdl_badge`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_backpack`
--

DROP TABLE IF EXISTS `mdl_badge_backpack`;
CREATE TABLE IF NOT EXISTS `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `backpackurl` varchar(255) NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines settings for connecting external backpack';

--
-- Truncate table before insert `mdl_badge_backpack`
--

TRUNCATE TABLE `mdl_badge_backpack`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria`
--

DROP TABLE IF EXISTS `mdl_badge_criteria`;
CREATE TABLE IF NOT EXISTS `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria for issuing badges';

--
-- Truncate table before insert `mdl_badge_criteria`
--

TRUNCATE TABLE `mdl_badge_criteria`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_met`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_met`;
CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines criteria that were met for an issued badge';

--
-- Truncate table before insert `mdl_badge_criteria_met`
--

TRUNCATE TABLE `mdl_badge_criteria_met`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_param`
--

DROP TABLE IF EXISTS `mdl_badge_criteria_param`;
CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines parameters for badges criteria';

--
-- Truncate table before insert `mdl_badge_criteria_param`
--

TRUNCATE TABLE `mdl_badge_criteria_param`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_external`
--

DROP TABLE IF EXISTS `mdl_badge_external`;
CREATE TABLE IF NOT EXISTS `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Setting for external badges display';

--
-- Truncate table before insert `mdl_badge_external`
--

TRUNCATE TABLE `mdl_badge_external`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_issued`
--

DROP TABLE IF EXISTS `mdl_badge_issued`;
CREATE TABLE IF NOT EXISTS `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines issued badges';

--
-- Truncate table before insert `mdl_badge_issued`
--

TRUNCATE TABLE `mdl_badge_issued`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_manual_award`
--

DROP TABLE IF EXISTS `mdl_badge_manual_award`;
CREATE TABLE IF NOT EXISTS `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track manual award criteria for badges';

--
-- Truncate table before insert `mdl_badge_manual_award`
--

TRUNCATE TABLE `mdl_badge_manual_award`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

DROP TABLE IF EXISTS `mdl_block`;
CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks';

--
-- Truncate table before insert `mdl_block`
--

TRUNCATE TABLE `mdl_block`;
--
-- Dumping data for table `mdl_block`
--

INSERT DELAYED IGNORE INTO `mdl_block` (`id`, `name`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 0, 0, 1),
(2, 'activity_results', 0, 0, 1),
(3, 'admin_bookmarks', 0, 0, 1),
(4, 'badges', 0, 0, 1),
(5, 'blog_menu', 0, 0, 1),
(6, 'blog_recent', 0, 0, 1),
(7, 'blog_tags', 0, 0, 1),
(8, 'calendar_month', 0, 0, 1),
(9, 'calendar_upcoming', 0, 0, 1),
(10, 'comments', 0, 0, 1),
(11, 'community', 0, 0, 1),
(12, 'completionstatus', 0, 0, 1),
(13, 'course_list', 0, 0, 1),
(14, 'course_summary', 0, 0, 1),
(15, 'feedback', 0, 0, 1),
(16, 'globalsearch', 0, 0, 1),
(17, 'glossary_random', 0, 0, 1),
(18, 'html', 0, 0, 1),
(19, 'login', 0, 0, 1),
(20, 'lp', 0, 0, 1),
(21, 'mentees', 0, 0, 1),
(22, 'messages', 0, 0, 1),
(23, 'mnet_hosts', 0, 0, 1),
(24, 'myoverview', 0, 0, 1),
(25, 'myprofile', 0, 0, 1),
(26, 'navigation', 0, 0, 1),
(27, 'news_items', 0, 0, 1),
(28, 'online_users', 0, 0, 1),
(29, 'participants', 0, 0, 1),
(30, 'private_files', 0, 0, 1),
(31, 'quiz_results', 0, 0, 0),
(32, 'recent_activity', 86400, 0, 1),
(33, 'rss_client', 300, 0, 1),
(34, 'search_forums', 0, 0, 1),
(35, 'section_links', 0, 0, 1),
(36, 'selfcompletion', 0, 0, 1),
(37, 'settings', 0, 0, 1),
(38, 'site_main_menu', 0, 0, 1),
(39, 'social_activities', 0, 0, 1),
(40, 'tag_flickr', 0, 0, 1),
(41, 'tag_youtube', 0, 0, 0),
(42, 'tags', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

DROP TABLE IF EXISTS `mdl_block_community`;
CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block';

--
-- Truncate table before insert `mdl_block_community`
--

TRUNCATE TABLE `mdl_block_community`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

DROP TABLE IF EXISTS `mdl_block_instances`;
CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `requiredbytheme` smallint(4) NOT NULL DEFAULT '0',
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_tim_ix` (`timemodified`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is';

--
-- Truncate table before insert `mdl_block_instances`
--

TRUNCATE TABLE `mdl_block_instances`;
--
-- Dumping data for table `mdl_block_instances`
--

INSERT DELAYED IGNORE INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `requiredbytheme`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`, `timecreated`, `timemodified`) VALUES
(1, 'admin_bookmarks', 1, 0, 0, 'admin-*', NULL, 'side-pre', 2, '', 1502328967, 1502328967),
(2, 'private_files', 1, 0, 0, 'my-index', '2', 'side-post', 0, '', 1502328967, 1502328967),
(3, 'online_users', 1, 0, 0, 'my-index', '2', 'side-post', 1, '', 1502328967, 1502328967),
(4, 'badges', 1, 0, 0, 'my-index', '2', 'side-post', 2, '', 1502328967, 1502328967),
(5, 'calendar_month', 1, 0, 0, 'my-index', '2', 'side-post', 3, '', 1502328967, 1502328967),
(6, 'calendar_upcoming', 1, 0, 0, 'my-index', '2', 'side-post', 4, '', 1502328967, 1502328967),
(7, 'lp', 1, 0, 0, 'my-index', '2', 'content', 0, '', 1502328967, 1502328967),
(8, 'myoverview', 1, 0, 0, 'my-index', '2', 'content', 1, '', 1502328967, 1502328967),
(9, 'private_files', 5, 0, 0, 'my-index', '3', 'side-post', 0, '', 1502330306, 1502330306),
(10, 'online_users', 5, 0, 0, 'my-index', '3', 'side-post', 1, '', 1502330306, 1502330306),
(11, 'badges', 5, 0, 0, 'my-index', '3', 'side-post', 2, '', 1502330306, 1502330306),
(12, 'calendar_month', 5, 0, 0, 'my-index', '3', 'side-post', 3, '', 1502330306, 1502330306),
(13, 'calendar_upcoming', 5, 0, 0, 'my-index', '3', 'side-post', 4, '', 1502330306, 1502330306),
(14, 'lp', 5, 0, 0, 'my-index', '3', 'content', 0, '', 1502330307, 1502330307),
(15, 'myoverview', 5, 0, 0, 'my-index', '3', 'content', 1, '', 1502330307, 1502330307);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

DROP TABLE IF EXISTS `mdl_block_positions`;
CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ';

--
-- Truncate table before insert `mdl_block_positions`
--

TRUNCATE TABLE `mdl_block_positions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_recent_activity`
--

DROP TABLE IF EXISTS `mdl_block_recent_activity`;
CREATE TABLE IF NOT EXISTS `mdl_block_recent_activity` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `action` tinyint(1) NOT NULL,
  `modname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blocreceacti_coutim_ix` (`courseid`,`timecreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Recent activity block';

--
-- Truncate table before insert `mdl_block_recent_activity`
--

TRUNCATE TABLE `mdl_block_recent_activity`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

DROP TABLE IF EXISTS `mdl_block_rss_client`;
CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `skiptime` bigint(10) NOT NULL DEFAULT '0',
  `skipuntil` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the';

--
-- Truncate table before insert `mdl_block_rss_client`
--

TRUNCATE TABLE `mdl_block_rss_client`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

DROP TABLE IF EXISTS `mdl_blog_association`;
CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc';

--
-- Truncate table before insert `mdl_blog_association`
--

TRUNCATE TABLE `mdl_blog_association`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

DROP TABLE IF EXISTS `mdl_blog_external`;
CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `url` longtext NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ';

--
-- Truncate table before insert `mdl_blog_external`
--

TRUNCATE TABLE `mdl_blog_external`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_book`
--

DROP TABLE IF EXISTS `mdl_book`;
CREATE TABLE IF NOT EXISTS `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `navstyle` smallint(4) NOT NULL DEFAULT '1',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book';

--
-- Truncate table before insert `mdl_book`
--

TRUNCATE TABLE `mdl_book`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_book_chapters`
--

DROP TABLE IF EXISTS `mdl_book_chapters`;
CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters';

--
-- Truncate table before insert `mdl_book_chapters`
--

TRUNCATE TABLE `mdl_book_chapters`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

DROP TABLE IF EXISTS `mdl_cache_filters`;
CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data';

--
-- Truncate table before insert `mdl_cache_filters`
--

TRUNCATE TABLE `mdl_cache_filters`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

DROP TABLE IF EXISTS `mdl_cache_flags`;
CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags';

--
-- Truncate table before insert `mdl_cache_flags`
--

TRUNCATE TABLE `mdl_cache_flags`;
--
-- Dumping data for table `mdl_cache_flags`
--

INSERT DELAYED IGNORE INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1502408124, '1', 1502415324);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

DROP TABLE IF EXISTS `mdl_capabilities`;
CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=592 DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities';

--
-- Truncate table before insert `mdl_capabilities`
--

TRUNCATE TABLE `mdl_capabilities`;
--
-- Dumping data for table `mdl_capabilities`
--

INSERT DELAYED IGNORE INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:configview', 'read', 10, 'moodle', 0),
(3, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(4, 'moodle/site:manageallmessaging', 'write', 10, 'moodle', 8),
(5, 'moodle/site:deleteanymessage', 'write', 10, 'moodle', 32),
(6, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(7, 'moodle/site:deleteownmessage', 'write', 10, 'moodle', 0),
(8, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(9, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(12, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(13, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(14, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(15, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(16, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(17, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(18, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(23, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(24, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(25, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(26, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(27, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(28, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(29, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(30, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(31, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(32, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(33, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(34, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(35, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(36, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(37, 'moodle/user:create', 'write', 10, 'moodle', 24),
(38, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(39, 'moodle/user:update', 'write', 10, 'moodle', 24),
(40, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(41, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(42, 'moodle/user:viewlastip', 'read', 30, 'moodle', 8),
(43, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(44, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(45, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(46, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(47, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(48, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(49, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(50, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(51, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(52, 'moodle/role:review', 'read', 50, 'moodle', 8),
(53, 'moodle/role:override', 'write', 50, 'moodle', 28),
(54, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(55, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(56, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(57, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(58, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(59, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(60, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(61, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(62, 'moodle/course:create', 'write', 40, 'moodle', 4),
(63, 'moodle/course:request', 'write', 10, 'moodle', 0),
(64, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(65, 'moodle/course:update', 'write', 50, 'moodle', 4),
(66, 'moodle/course:view', 'read', 50, 'moodle', 0),
(67, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(68, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(69, 'moodle/course:reviewotherusers', 'read', 50, 'moodle', 0),
(70, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(71, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(72, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(73, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(74, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(75, 'moodle/course:ignoreavailabilityrestrictions', 'read', 70, 'moodle', 0),
(76, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(77, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(78, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(79, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(80, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(81, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(82, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(83, 'moodle/course:renameroles', 'write', 50, 'moodle', 0),
(84, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(85, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(86, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(87, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(88, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(89, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(90, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(91, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(92, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(93, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(94, 'moodle/course:tag', 'write', 50, 'moodle', 16),
(95, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(96, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(97, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(98, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(99, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(100, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(101, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(102, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(103, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(104, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(105, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(106, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(107, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(108, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(109, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(110, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(111, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(112, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(113, 'moodle/question:add', 'write', 50, 'moodle', 20),
(114, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(115, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(116, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(117, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(118, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(119, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(120, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(121, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(122, 'moodle/question:config', 'write', 10, 'moodle', 2),
(123, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(124, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(125, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(126, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(127, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(128, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(129, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(130, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(131, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(132, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(133, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(134, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(135, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(136, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(137, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(138, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(139, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(140, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(141, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(142, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(143, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(144, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(145, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(146, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(147, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(148, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(149, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(150, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(151, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(152, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(153, 'moodle/block:view', 'read', 80, 'moodle', 0),
(154, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(155, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(156, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(157, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(158, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(159, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(160, 'moodle/webservice:managealltokens', 'write', 10, 'moodle', 42),
(161, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(162, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(163, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(164, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(165, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(166, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(167, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(168, 'moodle/community:add', 'write', 10, 'moodle', 0),
(169, 'moodle/community:download', 'write', 10, 'moodle', 0),
(170, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(171, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
(172, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
(173, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(174, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
(175, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
(176, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
(177, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
(178, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 4),
(179, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
(180, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
(181, 'moodle/badges:revokebadge', 'write', 50, 'moodle', 16),
(182, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
(183, 'moodle/site:forcelanguage', 'read', 10, 'moodle', 0),
(184, 'moodle/search:query', 'read', 10, 'moodle', 0),
(185, 'moodle/competency:competencymanage', 'write', 40, 'moodle', 0),
(186, 'moodle/competency:competencyview', 'read', 40, 'moodle', 0),
(187, 'moodle/competency:competencygrade', 'write', 50, 'moodle', 0),
(188, 'moodle/competency:coursecompetencymanage', 'write', 50, 'moodle', 0),
(189, 'moodle/competency:coursecompetencyconfigure', 'write', 70, 'moodle', 0),
(190, 'moodle/competency:coursecompetencygradable', 'read', 50, 'moodle', 0),
(191, 'moodle/competency:coursecompetencyview', 'read', 50, 'moodle', 0),
(192, 'moodle/competency:evidencedelete', 'write', 30, 'moodle', 0),
(193, 'moodle/competency:planmanage', 'write', 30, 'moodle', 0),
(194, 'moodle/competency:planmanagedraft', 'write', 30, 'moodle', 0),
(195, 'moodle/competency:planmanageown', 'write', 30, 'moodle', 0),
(196, 'moodle/competency:planmanageowndraft', 'write', 30, 'moodle', 0),
(197, 'moodle/competency:planview', 'read', 30, 'moodle', 0),
(198, 'moodle/competency:planviewdraft', 'read', 30, 'moodle', 0),
(199, 'moodle/competency:planviewown', 'read', 30, 'moodle', 0),
(200, 'moodle/competency:planviewowndraft', 'read', 30, 'moodle', 0),
(201, 'moodle/competency:planrequestreview', 'write', 30, 'moodle', 0),
(202, 'moodle/competency:planrequestreviewown', 'write', 30, 'moodle', 0),
(203, 'moodle/competency:planreview', 'write', 30, 'moodle', 0),
(204, 'moodle/competency:plancomment', 'write', 30, 'moodle', 0),
(205, 'moodle/competency:plancommentown', 'write', 30, 'moodle', 0),
(206, 'moodle/competency:usercompetencyview', 'read', 30, 'moodle', 0),
(207, 'moodle/competency:usercompetencyrequestreview', 'write', 30, 'moodle', 0),
(208, 'moodle/competency:usercompetencyrequestreviewown', 'write', 30, 'moodle', 0),
(209, 'moodle/competency:usercompetencyreview', 'write', 30, 'moodle', 0),
(210, 'moodle/competency:usercompetencycomment', 'write', 30, 'moodle', 0),
(211, 'moodle/competency:usercompetencycommentown', 'write', 30, 'moodle', 0),
(212, 'moodle/competency:templatemanage', 'write', 40, 'moodle', 0),
(213, 'moodle/analytics:listinsights', 'read', 50, 'moodle', 8),
(214, 'moodle/analytics:managemodels', 'write', 10, 'moodle', 2),
(215, 'moodle/competency:templateview', 'read', 40, 'moodle', 0),
(216, 'moodle/competency:userevidencemanage', 'write', 30, 'moodle', 0),
(217, 'moodle/competency:userevidencemanageown', 'write', 30, 'moodle', 0),
(218, 'moodle/competency:userevidenceview', 'read', 30, 'moodle', 0),
(219, 'moodle/site:maintenanceaccess', 'write', 10, 'moodle', 0),
(220, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(221, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(222, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(223, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(224, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(225, 'mod/assign:editothersubmission', 'write', 70, 'mod_assign', 41),
(226, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(227, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(228, 'mod/assign:reviewgrades', 'write', 70, 'mod_assign', 0),
(229, 'mod/assign:releasegrades', 'write', 70, 'mod_assign', 0),
(230, 'mod/assign:managegrades', 'write', 70, 'mod_assign', 0),
(231, 'mod/assign:manageallocations', 'write', 70, 'mod_assign', 0),
(232, 'mod/assign:viewgrades', 'read', 70, 'mod_assign', 0),
(233, 'mod/assign:viewblinddetails', 'write', 70, 'mod_assign', 8),
(234, 'mod/assign:receivegradernotifications', 'read', 70, 'mod_assign', 0),
(235, 'mod/assign:manageoverrides', 'write', 70, 'mod_assign', 0),
(236, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(237, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(238, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(239, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(240, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(241, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(242, 'mod/book:read', 'read', 70, 'mod_book', 0),
(243, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(244, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(245, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(246, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(247, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(248, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(249, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(250, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(251, 'mod/chat:view', 'read', 70, 'mod_chat', 0),
(252, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(253, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(254, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(255, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(256, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(257, 'mod/choice:view', 'read', 70, 'mod_choice', 0),
(258, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(259, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(260, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(261, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(262, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(263, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(264, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(265, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(266, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(267, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(268, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(269, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(270, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(271, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(272, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(273, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(274, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(275, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(276, 'mod/data:view', 'read', 70, 'mod_data', 0),
(277, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(278, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(279, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(280, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(281, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(282, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(283, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(284, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(285, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(286, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(287, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(288, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(289, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(290, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(291, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(292, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(293, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(294, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(295, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(296, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(297, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(298, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(299, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(300, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(301, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(302, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(303, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(304, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(305, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(306, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(307, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(308, 'mod/forum:pindiscussions', 'write', 70, 'mod_forum', 0),
(309, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(310, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(311, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(312, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(313, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(314, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(315, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(316, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(317, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(318, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(319, 'mod/forum:canposttomygroups', 'write', 70, 'mod_forum', 0),
(320, 'mod/forum:canoverridediscussionlock', 'write', 70, 'mod_forum', 0),
(321, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(322, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(323, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(324, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(325, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(326, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(327, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(328, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(329, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(330, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(331, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(332, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(333, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(334, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(335, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(336, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(337, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(338, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(339, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(340, 'mod/label:view', 'read', 70, 'mod_label', 0),
(341, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(342, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(343, 'mod/lesson:grade', 'write', 70, 'mod_lesson', 20),
(344, 'mod/lesson:viewreports', 'read', 70, 'mod_lesson', 8),
(345, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(346, 'mod/lesson:manageoverrides', 'write', 70, 'mod_lesson', 0),
(347, 'mod/lesson:view', 'read', 70, 'mod_lesson', 0),
(348, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(349, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(350, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
(351, 'mod/lti:admin', 'write', 70, 'mod_lti', 8),
(352, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(353, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(354, 'mod/page:view', 'read', 70, 'mod_page', 0),
(355, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(356, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(357, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(358, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(359, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(360, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(361, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(362, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(363, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 20),
(364, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(365, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(366, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(367, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(368, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(369, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(370, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(371, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(372, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(373, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(374, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(375, 'mod/scorm:skipview', 'read', 70, 'mod_scorm', 0),
(376, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(377, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(378, 'mod/scorm:deleteresponses', 'write', 70, 'mod_scorm', 0),
(379, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(380, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(381, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(382, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(383, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(384, 'mod/url:view', 'read', 70, 'mod_url', 0),
(385, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(386, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(387, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(388, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(389, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(390, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(391, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(392, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(393, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(394, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(395, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(396, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(397, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(398, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(399, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(400, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(401, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(402, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(403, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(404, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(405, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(406, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(407, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(408, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(409, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(410, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(411, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(412, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(413, 'mod/workshop:deletesubmissions', 'write', 70, 'mod_workshop', 0),
(414, 'mod/workshop:exportsubmissions', 'read', 70, 'mod_workshop', 0),
(415, 'auth/oauth2:managelinkedlogins', 'write', 30, 'auth_oauth2', 0),
(416, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(417, 'enrol/category:config', 'write', 50, 'enrol_category', 0),
(418, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(419, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(420, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(421, 'enrol/database:config', 'write', 50, 'enrol_database', 0),
(422, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(423, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(424, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(425, 'enrol/imsenterprise:config', 'write', 50, 'enrol_imsenterprise', 0),
(426, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(427, 'enrol/lti:config', 'write', 50, 'enrol_lti', 0),
(428, 'enrol/lti:unenrol', 'write', 50, 'enrol_lti', 0),
(429, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(430, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(431, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(432, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(433, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(434, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(435, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(436, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(437, 'enrol/mnet:config', 'write', 50, 'enrol_mnet', 0),
(438, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(439, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(440, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(441, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(442, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(443, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(444, 'enrol/self:holdkey', 'write', 50, 'enrol_self', 0),
(445, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(446, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(447, 'message/airnotifier:managedevice', 'write', 10, 'message_airnotifier', 0),
(448, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(449, 'block/activity_results:addinstance', 'write', 80, 'block_activity_results', 20),
(450, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(451, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(452, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
(453, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(454, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(455, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(456, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(457, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(458, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(459, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(460, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(461, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(462, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(463, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(464, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(465, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(466, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(467, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(468, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(469, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(470, 'block/globalsearch:myaddinstance', 'write', 10, 'block_globalsearch', 0),
(471, 'block/globalsearch:addinstance', 'write', 80, 'block_globalsearch', 0),
(472, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(473, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(474, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(475, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(476, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(477, 'block/lp:addinstance', 'write', 10, 'block_lp', 0),
(478, 'block/lp:myaddinstance', 'write', 10, 'block_lp', 0),
(479, 'block/lp:view', 'read', 10, 'block_lp', 0),
(480, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(481, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(482, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(483, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(484, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(485, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(486, 'block/myoverview:myaddinstance', 'write', 10, 'block_myoverview', 0),
(487, 'block/myoverview:addinstance', 'write', 80, 'block_myoverview', 20),
(488, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(489, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(490, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(491, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(492, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(493, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(494, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(495, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(496, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(497, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(498, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(499, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(500, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(501, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(502, 'block/recent_activity:viewaddupdatemodule', 'read', 50, 'block_recent_activity', 0),
(503, 'block/recent_activity:viewdeletemodule', 'read', 50, 'block_recent_activity', 0),
(504, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(505, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(506, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(507, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(508, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(509, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(510, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(511, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(512, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(513, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(514, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(515, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(516, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(517, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(518, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(519, 'report/completion:view', 'read', 50, 'report_completion', 8),
(520, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(521, 'report/log:view', 'read', 50, 'report_log', 8),
(522, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(523, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(524, 'report/outline:view', 'read', 50, 'report_outline', 8),
(525, 'report/participation:view', 'read', 50, 'report_participation', 8),
(526, 'report/performance:view', 'read', 10, 'report_performance', 2),
(527, 'report/progress:view', 'read', 50, 'report_progress', 8),
(528, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(529, 'report/security:view', 'read', 10, 'report_security', 2),
(530, 'report/stats:view', 'read', 50, 'report_stats', 8),
(531, 'report/usersessions:manageownsessions', 'write', 30, 'report_usersessions', 0),
(532, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(533, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(534, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(535, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(536, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(537, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(538, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(539, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(540, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(541, 'gradeimport/direct:view', 'write', 50, 'gradeimport_direct', 0),
(542, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(543, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(544, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(545, 'gradereport/history:view', 'read', 50, 'gradereport_history', 8),
(546, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(547, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(548, 'gradereport/singleview:view', 'read', 50, 'gradereport_singleview', 8),
(549, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(550, 'webservice/rest:use', 'read', 50, 'webservice_rest', 0),
(551, 'webservice/soap:use', 'read', 50, 'webservice_soap', 0),
(552, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 0),
(553, 'repository/areafiles:view', 'read', 70, 'repository_areafiles', 0),
(554, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(555, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(556, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(557, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(558, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(559, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(560, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(561, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(562, 'repository/local:view', 'read', 70, 'repository_local', 0),
(563, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(564, 'repository/onedrive:view', 'read', 70, 'repository_onedrive', 0),
(565, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(566, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(567, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(568, 'repository/skydrive:view', 'read', 70, 'repository_skydrive', 0),
(569, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(570, 'repository/url:view', 'read', 70, 'repository_url', 0),
(571, 'repository/user:view', 'read', 70, 'repository_user', 0),
(572, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(573, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(574, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(575, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(576, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(577, 'tool/lpmigrate:frameworksmigrate', 'write', 10, 'tool_lpmigrate', 0),
(578, 'tool/monitor:subscribe', 'read', 50, 'tool_monitor', 8),
(579, 'tool/monitor:managerules', 'write', 50, 'tool_monitor', 4),
(580, 'tool/monitor:managetool', 'write', 10, 'tool_monitor', 4),
(581, 'tool/recyclebin:deleteitems', 'write', 50, 'tool_recyclebin', 32),
(582, 'tool/recyclebin:restoreitems', 'write', 50, 'tool_recyclebin', 0),
(583, 'tool/recyclebin:viewitems', 'read', 50, 'tool_recyclebin', 0),
(584, 'tool/uploaduser:uploaduserpictures', 'write', 10, 'tool_uploaduser', 16),
(585, 'tool/usertours:managetours', 'write', 10, 'tool_usertours', 4),
(586, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(587, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(588, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(589, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(590, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(591, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

DROP TABLE IF EXISTS `mdl_chat`;
CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room';

--
-- Truncate table before insert `mdl_chat`
--

TRUNCATE TABLE `mdl_chat`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

DROP TABLE IF EXISTS `mdl_chat_messages`;
CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages';

--
-- Truncate table before insert `mdl_chat_messages`
--

TRUNCATE TABLE `mdl_chat_messages`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

DROP TABLE IF EXISTS `mdl_chat_messages_current`;
CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session';

--
-- Truncate table before insert `mdl_chat_messages_current`
--

TRUNCATE TABLE `mdl_chat_messages_current`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

DROP TABLE IF EXISTS `mdl_chat_users`;
CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms';

--
-- Truncate table before insert `mdl_chat_users`
--

TRUNCATE TABLE `mdl_chat_users`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

DROP TABLE IF EXISTS `mdl_choice`;
CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `allowmultiple` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `includeinactive` tinyint(2) NOT NULL DEFAULT '1',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `showpreview` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here';

--
-- Truncate table before insert `mdl_choice`
--

TRUNCATE TABLE `mdl_choice`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

DROP TABLE IF EXISTS `mdl_choice_answers`;
CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users';

--
-- Truncate table before insert `mdl_choice_answers`
--

TRUNCATE TABLE `mdl_choice_answers`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

DROP TABLE IF EXISTS `mdl_choice_options`;
CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice';

--
-- Truncate table before insert `mdl_choice_options`
--

TRUNCATE TABLE `mdl_choice_options`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

DROP TABLE IF EXISTS `mdl_cohort`;
CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).';

--
-- Truncate table before insert `mdl_cohort`
--

TRUNCATE TABLE `mdl_cohort`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

DROP TABLE IF EXISTS `mdl_cohort_members`;
CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.';

--
-- Truncate table before insert `mdl_cohort_members`
--

TRUNCATE TABLE `mdl_cohort_members`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

DROP TABLE IF EXISTS `mdl_comments`;
CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) DEFAULT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module';

--
-- Truncate table before insert `mdl_comments`
--

TRUNCATE TABLE `mdl_comments`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency`
--

DROP TABLE IF EXISTS `mdl_competency`;
CREATE TABLE IF NOT EXISTS `mdl_competency` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `competencyframeworkid` bigint(10) NOT NULL,
  `parentid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL,
  `ruletype` varchar(100) DEFAULT NULL,
  `ruleoutcome` tinyint(2) NOT NULL DEFAULT '0',
  `ruleconfig` longtext,
  `scaleid` bigint(10) DEFAULT NULL,
  `scaleconfiguration` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_comp_comidn_uix` (`competencyframeworkid`,`idnumber`),
  KEY `mdl_comp_rul_ix` (`ruleoutcome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains the master record of each competency in ';

--
-- Truncate table before insert `mdl_competency`
--

TRUNCATE TABLE `mdl_competency`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_coursecomp`
--

DROP TABLE IF EXISTS `mdl_competency_coursecomp`;
CREATE TABLE IF NOT EXISTS `mdl_competency_coursecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `ruleoutcome` tinyint(2) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compcour_coucom_uix` (`courseid`,`competencyid`),
  KEY `mdl_compcour_courul_ix` (`courseid`,`ruleoutcome`),
  KEY `mdl_compcour_cou2_ix` (`courseid`),
  KEY `mdl_compcour_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a competency to a course.';

--
-- Truncate table before insert `mdl_competency_coursecomp`
--

TRUNCATE TABLE `mdl_competency_coursecomp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_coursecompsetting`
--

DROP TABLE IF EXISTS `mdl_competency_coursecompsetting`;
CREATE TABLE IF NOT EXISTS `mdl_competency_coursecompsetting` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `pushratingstouserplans` tinyint(2) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains the course specific settings for compete';

--
-- Truncate table before insert `mdl_competency_coursecompsetting`
--

TRUNCATE TABLE `mdl_competency_coursecompsetting`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_evidence`
--

DROP TABLE IF EXISTS `mdl_competency_evidence`;
CREATE TABLE IF NOT EXISTS `mdl_competency_evidence` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `usercompetencyid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `action` tinyint(2) NOT NULL,
  `actionuserid` bigint(10) DEFAULT NULL,
  `descidentifier` varchar(255) NOT NULL DEFAULT '',
  `desccomponent` varchar(255) NOT NULL DEFAULT '',
  `desca` longtext,
  `url` varchar(255) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `note` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compevid_use_ix` (`usercompetencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The evidence linked to a user competency';

--
-- Truncate table before insert `mdl_competency_evidence`
--

TRUNCATE TABLE `mdl_competency_evidence`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_framework`
--

DROP TABLE IF EXISTS `mdl_competency_framework`;
CREATE TABLE IF NOT EXISTS `mdl_competency_framework` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `scaleid` bigint(11) DEFAULT NULL,
  `scaleconfiguration` longtext NOT NULL,
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `taxonomies` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compfram_idn_uix` (`idnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of competency frameworks.';

--
-- Truncate table before insert `mdl_competency_framework`
--

TRUNCATE TABLE `mdl_competency_framework`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_modulecomp`
--

DROP TABLE IF EXISTS `mdl_competency_modulecomp`;
CREATE TABLE IF NOT EXISTS `mdl_competency_modulecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cmid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `ruleoutcome` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compmodu_cmicom_uix` (`cmid`,`competencyid`),
  KEY `mdl_compmodu_cmirul_ix` (`cmid`,`ruleoutcome`),
  KEY `mdl_compmodu_cmi_ix` (`cmid`),
  KEY `mdl_compmodu_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a competency to a module.';

--
-- Truncate table before insert `mdl_competency_modulecomp`
--

TRUNCATE TABLE `mdl_competency_modulecomp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_plan`
--

DROP TABLE IF EXISTS `mdl_competency_plan`;
CREATE TABLE IF NOT EXISTS `mdl_competency_plan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `templateid` bigint(10) DEFAULT NULL,
  `origtemplateid` bigint(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `duedate` bigint(10) DEFAULT '0',
  `reviewerid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compplan_usesta_ix` (`userid`,`status`),
  KEY `mdl_compplan_tem_ix` (`templateid`),
  KEY `mdl_compplan_stadue_ix` (`status`,`duedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Learning plans';

--
-- Truncate table before insert `mdl_competency_plan`
--

TRUNCATE TABLE `mdl_competency_plan`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_plancomp`
--

DROP TABLE IF EXISTS `mdl_competency_plancomp`;
CREATE TABLE IF NOT EXISTS `mdl_competency_plancomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `planid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compplan_placom_uix` (`planid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Plan competencies';

--
-- Truncate table before insert `mdl_competency_plancomp`
--

TRUNCATE TABLE `mdl_competency_plancomp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_relatedcomp`
--

DROP TABLE IF EXISTS `mdl_competency_relatedcomp`;
CREATE TABLE IF NOT EXISTS `mdl_competency_relatedcomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `competencyid` bigint(10) NOT NULL,
  `relatedcompetencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Related competencies';

--
-- Truncate table before insert `mdl_competency_relatedcomp`
--

TRUNCATE TABLE `mdl_competency_relatedcomp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_template`
--

DROP TABLE IF EXISTS `mdl_competency_template`;
CREATE TABLE IF NOT EXISTS `mdl_competency_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `duedate` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Learning plan templates.';

--
-- Truncate table before insert `mdl_competency_template`
--

TRUNCATE TABLE `mdl_competency_template`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_templatecohort`
--

DROP TABLE IF EXISTS `mdl_competency_templatecohort`;
CREATE TABLE IF NOT EXISTS `mdl_competency_templatecohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `templateid` bigint(10) NOT NULL,
  `cohortid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_comptemp_temcoh_uix` (`templateid`,`cohortid`),
  KEY `mdl_comptemp_tem2_ix` (`templateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default comment for the table, please edit me';

--
-- Truncate table before insert `mdl_competency_templatecohort`
--

TRUNCATE TABLE `mdl_competency_templatecohort`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_templatecomp`
--

DROP TABLE IF EXISTS `mdl_competency_templatecomp`;
CREATE TABLE IF NOT EXISTS `mdl_competency_templatecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `templateid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_comptemp_tem_ix` (`templateid`),
  KEY `mdl_comptemp_com_ix` (`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a competency to a learning plan template.';

--
-- Truncate table before insert `mdl_competency_templatecomp`
--

TRUNCATE TABLE `mdl_competency_templatecomp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_usercomp`
--

DROP TABLE IF EXISTS `mdl_competency_usercomp`;
CREATE TABLE IF NOT EXISTS `mdl_competency_usercomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `reviewerid` bigint(10) DEFAULT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecom_uix` (`userid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User competencies';

--
-- Truncate table before insert `mdl_competency_usercomp`
--

TRUNCATE TABLE `mdl_competency_usercomp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_usercompcourse`
--

DROP TABLE IF EXISTS `mdl_competency_usercompcourse`;
CREATE TABLE IF NOT EXISTS `mdl_competency_usercompcourse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecoucom_uix` (`userid`,`courseid`,`competencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User competencies in a course';

--
-- Truncate table before insert `mdl_competency_usercompcourse`
--

TRUNCATE TABLE `mdl_competency_usercompcourse`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_usercompplan`
--

DROP TABLE IF EXISTS `mdl_competency_usercompplan`;
CREATE TABLE IF NOT EXISTS `mdl_competency_usercompplan` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `planid` bigint(10) NOT NULL,
  `proficiency` tinyint(2) DEFAULT NULL,
  `grade` bigint(10) DEFAULT NULL,
  `sortorder` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecompla_uix` (`userid`,`competencyid`,`planid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User competencies plans';

--
-- Truncate table before insert `mdl_competency_usercompplan`
--

TRUNCATE TABLE `mdl_competency_usercompplan`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_userevidence`
--

DROP TABLE IF EXISTS `mdl_competency_userevidence`;
CREATE TABLE IF NOT EXISTS `mdl_competency_userevidence` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(1) NOT NULL,
  `url` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_compuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The evidence of prior learning';

--
-- Truncate table before insert `mdl_competency_userevidence`
--

TRUNCATE TABLE `mdl_competency_userevidence`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_competency_userevidencecomp`
--

DROP TABLE IF EXISTS `mdl_competency_userevidencecomp`;
CREATE TABLE IF NOT EXISTS `mdl_competency_userevidencecomp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userevidenceid` bigint(10) NOT NULL,
  `competencyid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_compuser_usecom2_uix` (`userevidenceid`,`competencyid`),
  KEY `mdl_compuser_use2_ix` (`userevidenceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relationship between user evidence and competencies';

--
-- Truncate table before insert `mdl_competency_userevidencecomp`
--

TRUNCATE TABLE `mdl_competency_userevidencecomp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

DROP TABLE IF EXISTS `mdl_config`;
CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables';

--
-- Truncate table before insert `mdl_config`
--

TRUNCATE TABLE `mdl_config`;
--
-- Dumping data for table `mdl_config`
--

INSERT DELAYED IGNORE INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(5, 'theme', 'boost'),
(6, 'filter_multilang_converted', '1'),
(7, 'siteidentifier', 'EQxkaVYYYmnQfItM1jRG9ndGvQ5QeMiNlocalhost'),
(8, 'backup_version', '2008111700'),
(9, 'backup_release', '2.0 dev'),
(10, 'mnet_dispatcher_mode', 'off'),
(11, 'sessiontimeout', '7200'),
(12, 'stringfilters', ''),
(13, 'filterall', '0'),
(14, 'texteditors', 'atto,tinymce,textarea'),
(15, 'antiviruses', ''),
(16, 'media_plugins_sortorder', 'videojs,youtube,swf'),
(17, 'upgrade_extracreditweightsstepignored', '1'),
(18, 'upgrade_calculatedgradeitemsignored', '1'),
(19, 'upgrade_letterboundarycourses', '1'),
(20, 'mnet_localhost_id', '1'),
(21, 'mnet_all_hosts_id', '2'),
(22, 'siteguest', '1'),
(23, 'siteadmins', '2'),
(24, 'themerev', '1502329132'),
(25, 'jsrev', '1502329132'),
(26, 'gdversion', '2'),
(27, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(28, 'version', '2017080400'),
(29, 'enableoutcomes', '0'),
(30, 'usecomments', '1'),
(31, 'usetags', '1'),
(32, 'enablenotes', '1'),
(33, 'enableportfolios', '0'),
(34, 'enablewebservices', '0'),
(35, 'messaging', '1'),
(36, 'messaginghidereadnotifications', '0'),
(37, 'messagingdeletereadnotificationsdelay', '604800'),
(38, 'messagingallowemailoverride', '0'),
(39, 'enablestats', '0'),
(40, 'enablerssfeeds', '0'),
(41, 'enableblogs', '1'),
(42, 'enablecompletion', '1'),
(43, 'completiondefault', '1'),
(44, 'enableavailability', '1'),
(45, 'enableplagiarism', '0'),
(46, 'enablebadges', '1'),
(47, 'enableglobalsearch', '0'),
(48, 'allowstealth', '0'),
(49, 'defaultpreference_maildisplay', '2'),
(50, 'defaultpreference_mailformat', '1'),
(51, 'defaultpreference_maildigest', '0'),
(52, 'defaultpreference_autosubscribe', '1'),
(53, 'defaultpreference_trackforums', '0'),
(54, 'autologinguests', '0'),
(55, 'hiddenuserfields', ''),
(56, 'showuseridentity', 'email'),
(57, 'fullnamedisplay', 'language'),
(58, 'alternativefullnameformat', 'language'),
(59, 'maxusersperpage', '100'),
(60, 'enablegravatar', '0'),
(61, 'gravatardefaulturl', 'mm'),
(62, 'enablecourserequests', '0'),
(63, 'defaultrequestcategory', '1'),
(64, 'requestcategoryselection', '0'),
(65, 'courserequestnotify', ''),
(66, 'grade_profilereport', 'user'),
(67, 'grade_aggregationposition', '1'),
(68, 'grade_includescalesinaggregation', '1'),
(69, 'grade_hiddenasdate', '0'),
(70, 'gradepublishing', '0'),
(71, 'grade_export_displaytype', '1'),
(72, 'grade_export_decimalpoints', '2'),
(73, 'grade_navmethod', '1'),
(74, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(75, 'grade_export_customprofilefields', ''),
(76, 'recovergradesdefault', '0'),
(77, 'gradeexport', ''),
(78, 'unlimitedgrades', '0'),
(79, 'grade_report_showmin', '1'),
(80, 'gradepointmax', '100'),
(81, 'gradepointdefault', '100'),
(82, 'grade_minmaxtouse', '1'),
(83, 'grade_mygrades_report', 'overview'),
(84, 'gradereport_mygradeurl', ''),
(85, 'grade_hideforcedsettings', '1'),
(86, 'grade_aggregation', '13'),
(87, 'grade_aggregation_flag', '0'),
(88, 'grade_aggregations_visible', '13'),
(89, 'grade_aggregateonlygraded', '1'),
(90, 'grade_aggregateonlygraded_flag', '2'),
(91, 'grade_aggregateoutcomes', '0'),
(92, 'grade_aggregateoutcomes_flag', '2'),
(93, 'grade_keephigh', '0'),
(94, 'grade_keephigh_flag', '3'),
(95, 'grade_droplow', '0'),
(96, 'grade_droplow_flag', '2'),
(97, 'grade_overridecat', '1'),
(98, 'grade_displaytype', '1'),
(99, 'grade_decimalpoints', '2'),
(100, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(101, 'grade_report_studentsperpage', '100'),
(102, 'grade_report_showonlyactiveenrol', '1'),
(103, 'grade_report_quickgrading', '1'),
(104, 'grade_report_showquickfeedback', '0'),
(105, 'grade_report_meanselection', '1'),
(106, 'grade_report_enableajax', '0'),
(107, 'grade_report_showcalculations', '1'),
(108, 'grade_report_showeyecons', '0'),
(109, 'grade_report_showaverages', '1'),
(110, 'grade_report_showlocks', '0'),
(111, 'grade_report_showranges', '0'),
(112, 'grade_report_showanalysisicon', '1'),
(113, 'grade_report_showuserimage', '1'),
(114, 'grade_report_showactivityicons', '1'),
(115, 'grade_report_shownumberofgrades', '0'),
(116, 'grade_report_averagesdisplaytype', 'inherit'),
(117, 'grade_report_rangesdisplaytype', 'inherit'),
(118, 'grade_report_averagesdecimalpoints', 'inherit'),
(119, 'grade_report_rangesdecimalpoints', 'inherit'),
(120, 'grade_report_historyperpage', '50'),
(121, 'grade_report_overview_showrank', '0'),
(122, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(123, 'grade_report_user_showrank', '0'),
(124, 'grade_report_user_showpercentage', '1'),
(125, 'grade_report_user_showgrade', '1'),
(126, 'grade_report_user_showfeedback', '1'),
(127, 'grade_report_user_showrange', '1'),
(128, 'grade_report_user_showweight', '1'),
(129, 'grade_report_user_showaverage', '0'),
(130, 'grade_report_user_showlettergrade', '0'),
(131, 'grade_report_user_rangedecimals', '0'),
(132, 'grade_report_user_showhiddenitems', '1'),
(133, 'grade_report_user_showtotalsifcontainhidden', '0'),
(134, 'grade_report_user_showcontributiontocoursetotal', '1'),
(135, 'badges_defaultissuername', ''),
(136, 'badges_defaultissuercontact', ''),
(137, 'badges_badgesalt', 'badges1502328646'),
(138, 'badges_allowexternalbackpack', '1'),
(139, 'badges_allowcoursebadges', '1'),
(141, 'forcetimezone', '99'),
(142, 'country', '0'),
(143, 'defaultcity', ''),
(144, 'geoip2file', 'C:\\wamp64\\moodledata/geoip/GeoLite2-City.mmdb'),
(145, 'googlemapkey3', ''),
(146, 'allcountrycodes', ''),
(147, 'autolang', '1'),
(148, 'lang', 'en'),
(149, 'langmenu', '1'),
(150, 'langlist', ''),
(151, 'langrev', '1502329132'),
(152, 'langcache', '1'),
(153, 'langstringcache', '1'),
(154, 'locale', ''),
(155, 'latinexcelexport', '0'),
(156, 'requiremodintro', '0'),
(158, 'authloginviaemail', '0'),
(159, 'allowaccountssameemail', '0'),
(160, 'authpreventaccountcreation', '0'),
(161, 'loginpageautofocus', '0'),
(162, 'guestloginbutton', '1'),
(163, 'limitconcurrentlogins', '0'),
(164, 'alternateloginurl', ''),
(165, 'forgottenpasswordurl', ''),
(166, 'auth_instructions', ''),
(167, 'allowemailaddresses', ''),
(168, 'denyemailaddresses', ''),
(169, 'verifychangedemail', '1'),
(170, 'recaptchapublickey', ''),
(171, 'recaptchaprivatekey', ''),
(172, 'filteruploadedfiles', '0'),
(173, 'filtermatchoneperpage', '0'),
(174, 'filtermatchonepertext', '0'),
(175, 'sitedefaultlicense', 'allrightsreserved'),
(176, 'media_default_width', '400'),
(177, 'media_default_height', '300'),
(178, 'portfolio_moderate_filesize_threshold', '1048576'),
(179, 'portfolio_high_filesize_threshold', '5242880'),
(180, 'portfolio_moderate_db_threshold', '20'),
(181, 'portfolio_high_db_threshold', '50'),
(182, 'repositorycacheexpire', '120'),
(183, 'repositorygetfiletimeout', '30'),
(184, 'repositorysyncfiletimeout', '1'),
(185, 'repositorysyncimagetimeout', '3'),
(186, 'repositoryallowexternallinks', '1'),
(187, 'legacyfilesinnewcourses', '0'),
(188, 'legacyfilesaddallowed', '1'),
(189, 'searchengine', 'solr'),
(190, 'searchindexwhendisabled', '0'),
(191, 'searchindextime', '600'),
(192, 'enablewsdocumentation', '0'),
(193, 'allowbeforeblock', '0'),
(194, 'allowedip', ''),
(195, 'blockedip', ''),
(196, 'protectusernames', '1'),
(197, 'forcelogin', '0'),
(198, 'forceloginforprofiles', '1'),
(199, 'forceloginforprofileimage', '0'),
(200, 'opentogoogle', '0'),
(201, 'allowindexing', '0'),
(202, 'maxbytes', '0'),
(203, 'userquota', '104857600'),
(204, 'allowobjectembed', '0'),
(205, 'enabletrusttext', '0'),
(206, 'maxeditingtime', '1800'),
(207, 'extendedusernamechars', '0'),
(208, 'sitepolicy', ''),
(209, 'sitepolicyguest', ''),
(210, 'keeptagnamecase', '1'),
(211, 'profilesforenrolledusersonly', '1'),
(212, 'cronclionly', '1'),
(213, 'cronremotepassword', ''),
(214, 'lockoutthreshold', '0'),
(215, 'lockoutwindow', '1800'),
(216, 'lockoutduration', '1800'),
(217, 'passwordpolicy', '1'),
(218, 'minpasswordlength', '8'),
(219, 'minpassworddigits', '1'),
(220, 'minpasswordlower', '1'),
(221, 'minpasswordupper', '1'),
(222, 'minpasswordnonalphanum', '1'),
(223, 'maxconsecutiveidentchars', '0'),
(224, 'passwordreuselimit', '0'),
(225, 'pwresettime', '1800'),
(226, 'passwordchangelogout', '0'),
(227, 'passwordchangetokendeletion', '0'),
(228, 'tokenduration', '7257600'),
(229, 'groupenrolmentkeypolicy', '1'),
(230, 'disableuserimages', '0'),
(231, 'emailchangeconfirmation', '1'),
(232, 'rememberusername', '2'),
(233, 'strictformsrequired', '0'),
(234, 'loginhttps', '0'),
(235, 'cookiesecure', '1'),
(236, 'cookiehttponly', '0'),
(237, 'allowframembedding', '0'),
(238, 'curlsecurityblockedhosts', ''),
(239, 'curlsecurityallowedport', ''),
(240, 'displayloginfailures', '0'),
(241, 'notifyloginfailures', ''),
(242, 'notifyloginthreshold', '10'),
(243, 'themelist', ''),
(244, 'themedesignermode', '0'),
(245, 'allowuserthemes', '0'),
(246, 'allowcoursethemes', '0'),
(247, 'allowcategorythemes', '0'),
(248, 'allowthemechangeonurl', '0'),
(249, 'allowuserblockhiding', '1'),
(250, 'allowblockstodock', '1'),
(251, 'custommenuitems', ''),
(252, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\r\nmessages,message|/message/index.php|message\r\npreferences,moodle|/user/preferences.php|preferences'),
(253, 'enabledevicedetection', '1'),
(254, 'devicedetectregex', '[]'),
(255, 'calendartype', 'gregorian'),
(256, 'calendar_adminseesall', '0'),
(257, 'calendar_site_timeformat', '0'),
(258, 'calendar_startwday', '1'),
(259, 'calendar_weekend', '65'),
(260, 'calendar_lookahead', '21'),
(261, 'calendar_maxevents', '10'),
(262, 'enablecalendarexport', '1'),
(263, 'calendar_customexport', '1'),
(264, 'calendar_exportlookahead', '365'),
(265, 'calendar_exportlookback', '5'),
(266, 'calendar_exportsalt', 'eDXa2j4DaS6djgWo0UrXn4pilXGB3OaxyUfSjLGmNaRPnZPbmMzFWXGsa43I'),
(267, 'calendar_showicalsource', '1'),
(268, 'useblogassociations', '1'),
(269, 'bloglevel', '4'),
(270, 'useexternalblogs', '1'),
(271, 'externalblogcrontime', '86400'),
(272, 'maxexternalblogsperuser', '1'),
(273, 'blogusecomments', '1'),
(274, 'blogshowcommentscount', '1'),
(275, 'defaulthomepage', '1'),
(276, 'allowguestmymoodle', '1'),
(277, 'navshowfullcoursenames', '0'),
(278, 'navshowcategories', '1'),
(279, 'navshowmycoursecategories', '0'),
(280, 'navshowallcourses', '0'),
(281, 'navsortmycoursessort', 'sortorder'),
(282, 'navcourselimit', '10'),
(283, 'usesitenameforsitepages', '0'),
(284, 'linkadmincategories', '1'),
(285, 'linkcoursesections', '0'),
(286, 'navshowfrontpagemods', '1'),
(287, 'navadduserpostslinks', '1'),
(288, 'formatstringstriptags', '1'),
(289, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(290, 'docroot', 'http://docs.moodle.org'),
(291, 'doclang', ''),
(292, 'doctonewwindow', '0'),
(293, 'courselistshortnames', '0'),
(294, 'coursesperpage', '20'),
(295, 'courseswithsummarieslimit', '10'),
(296, 'courseoverviewfileslimit', '1'),
(297, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(298, 'useexternalyui', '0'),
(299, 'yuicomboloading', '1'),
(300, 'cachejs', '1'),
(301, 'modchooserdefault', '1'),
(302, 'additionalhtmlhead', ''),
(303, 'additionalhtmltopofbody', ''),
(304, 'additionalhtmlfooter', ''),
(305, 'pathtodu', ''),
(306, 'aspellpath', ''),
(307, 'pathtodot', ''),
(308, 'pathtogs', '/usr/bin/gs'),
(309, 'supportname', 'Admin User'),
(310, 'supportemail', ''),
(311, 'supportpage', ''),
(312, 'dbsessions', '0'),
(313, 'sessioncookie', ''),
(314, 'sessioncookiepath', ''),
(315, 'sessioncookiedomain', ''),
(316, 'statsfirstrun', 'none'),
(317, 'statsmaxruntime', '0'),
(318, 'statsruntimedays', '31'),
(319, 'statsuserthreshold', '0'),
(320, 'slasharguments', '1'),
(321, 'getremoteaddrconf', '0'),
(322, 'proxyhost', ''),
(323, 'proxyport', '0'),
(324, 'proxytype', 'HTTP'),
(325, 'proxyuser', ''),
(326, 'proxypassword', ''),
(327, 'proxybypass', 'localhost, 127.0.0.1'),
(328, 'maintenance_enabled', '0'),
(329, 'maintenance_message', ''),
(330, 'deleteunconfirmed', '168'),
(331, 'deleteincompleteusers', '0'),
(332, 'disablegradehistory', '0'),
(333, 'gradehistorylifetime', '0'),
(334, 'tempdatafoldercleanup', '168'),
(335, 'extramemorylimit', '512M'),
(336, 'maxtimelimit', '0'),
(337, 'curlcache', '120'),
(338, 'curltimeoutkbitrate', '56'),
(339, 'smtphosts', ''),
(340, 'smtpsecure', ''),
(341, 'smtpauthtype', 'LOGIN'),
(342, 'smtpuser', ''),
(343, 'smtppass', ''),
(344, 'smtpmaxbulk', '1'),
(345, 'allowedemaildomains', ''),
(346, 'sitemailcharset', '0'),
(347, 'allowusermailcharset', '0'),
(348, 'allowattachments', '1'),
(349, 'mailnewline', 'LF'),
(350, 'emailfromvia', '1'),
(351, 'updateautocheck', '1'),
(352, 'updateminmaturity', '200'),
(353, 'updatenotifybuilds', '0'),
(354, 'enablesafebrowserintegration', '0'),
(355, 'dndallowtextandlinks', '0'),
(356, 'debug', '0'),
(357, 'debugdisplay', '1'),
(358, 'debugsmtp', '0'),
(359, 'perfdebug', '7'),
(360, 'debugstringids', '0'),
(361, 'debugvalidators', '0'),
(362, 'debugpageinfo', '0'),
(363, 'profilingenabled', '0'),
(364, 'profilingincluded', ''),
(365, 'profilingexcluded', ''),
(366, 'profilingautofrec', '0'),
(367, 'profilingallowme', '0'),
(368, 'profilingallowall', '0'),
(369, 'profilinglifetime', '1440'),
(370, 'profilingimportprefix', '(I)'),
(371, 'release', '3.4dev (Build: 20170804)'),
(372, 'branch', '34'),
(373, 'localcachedirpurged', '1502329132'),
(374, 'scheduledtaskreset', '1502329132'),
(375, 'allversionshash', '5655bc0ac463c4cc4de34cbd50b1d115ba7164b2'),
(377, 'notloggedinroleid', '6'),
(378, 'guestroleid', '6'),
(379, 'defaultuserroleid', '7'),
(380, 'creatornewroleid', '3'),
(381, 'restorernewroleid', '3'),
(382, 'gradebookroles', '5'),
(383, 'chat_method', 'ajax'),
(384, 'chat_refresh_userlist', '10'),
(385, 'chat_old_ping', '35'),
(386, 'chat_refresh_room', '5'),
(387, 'chat_normal_updatemode', 'jsupdate'),
(388, 'chat_serverhost', 'localhost'),
(389, 'chat_serverip', '127.0.0.1'),
(390, 'chat_serverport', '9111'),
(391, 'chat_servermax', '100'),
(392, 'data_enablerssfeeds', '0'),
(393, 'feedback_allowfullanonymous', '0'),
(394, 'forum_displaymode', '3'),
(395, 'forum_shortpost', '300'),
(396, 'forum_longpost', '600'),
(397, 'forum_manydiscussions', '100'),
(398, 'forum_maxbytes', '512000'),
(399, 'forum_maxattachments', '9'),
(400, 'forum_subscription', '0'),
(401, 'forum_trackingtype', '1'),
(402, 'forum_trackreadposts', '1'),
(403, 'forum_allowforcedreadtracking', '0'),
(404, 'forum_oldpostdays', '14'),
(405, 'forum_usermarksread', '0'),
(406, 'forum_cleanreadtime', '2'),
(407, 'digestmailtime', '17'),
(408, 'forum_enablerssfeeds', '0'),
(409, 'forum_enabletimedposts', '1'),
(410, 'glossary_entbypage', '10'),
(411, 'glossary_dupentries', '0'),
(412, 'glossary_allowcomments', '0'),
(413, 'glossary_linkbydefault', '1'),
(414, 'glossary_defaultapproval', '1'),
(415, 'glossary_enablerssfeeds', '0'),
(416, 'glossary_linkentries', '0'),
(417, 'glossary_casesensitive', '0'),
(418, 'glossary_fullmatch', '0'),
(419, 'block_course_list_adminview', 'all'),
(420, 'block_course_list_hideallcourseslink', '0'),
(421, 'block_html_allowcssclasses', '0'),
(422, 'block_online_users_timetosee', '5'),
(423, 'block_rss_client_num_entries', '5'),
(424, 'block_rss_client_timeout', '30'),
(425, 'pathtounoconv', '/usr/bin/unoconv'),
(426, 'filter_multilang_force_old', '0'),
(427, 'filter_censor_badwords', ''),
(428, 'logguests', '1'),
(429, 'loglifetime', '0'),
(430, 'jabberhost', ''),
(431, 'jabberserver', ''),
(432, 'jabberusername', ''),
(433, 'jabberpassword', ''),
(434, 'jabberport', '5222'),
(435, 'airnotifierurl', 'https://messages.moodle.net'),
(436, 'airnotifierport', '443'),
(437, 'airnotifiermobileappname', 'com.moodle.moodlemobile'),
(438, 'airnotifierappname', 'commoodlemoodlemobile'),
(439, 'airnotifieraccesskey', ''),
(440, 'profileroles', '5,4,3'),
(441, 'coursecontact', '3'),
(442, 'frontpage', '6,2,4,7,0'),
(443, 'frontpageloggedin', '6,0,5,2,4,7'),
(444, 'maxcategorydepth', '2'),
(445, 'frontpagecourselimit', '200'),
(446, 'commentsperpage', '15'),
(447, 'defaultfrontpageroleid', '8'),
(448, 'messageinbound_enabled', '1'),
(449, 'messageinbound_mailbox', 'Tutors246'),
(450, 'messageinbound_domain', 'tutors246@gmail.com'),
(451, 'messageinbound_host', 'tutors246@gmail.com'),
(452, 'messageinbound_hostssl', 'ssl'),
(453, 'messageinbound_hostuser', 'Tutors246'),
(454, 'messageinbound_hostpass', 'onlygod30'),
(455, 'enablemobilewebservice', '0'),
(456, 'timezone', 'America/Grenada'),
(457, 'registerauth', ''),
(458, 'noreplyaddress', 'tutors246@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

DROP TABLE IF EXISTS `mdl_config_log`;
CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  `oldvalue` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1571 DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI';

--
-- Truncate table before insert `mdl_config_log`
--

TRUNCATE TABLE `mdl_config_log`;
--
-- Dumping data for table `mdl_config_log`
--

INSERT DELAYED IGNORE INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1502328699, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1502328699, NULL, 'usecomments', '1', NULL),
(3, 0, 1502328700, NULL, 'usetags', '1', NULL),
(4, 0, 1502328700, NULL, 'enablenotes', '1', NULL),
(5, 0, 1502328700, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1502328700, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1502328700, NULL, 'messaging', '1', NULL),
(8, 0, 1502328700, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1502328700, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1502328700, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1502328700, NULL, 'enablestats', '0', NULL),
(12, 0, 1502328700, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1502328700, NULL, 'enableblogs', '1', NULL),
(14, 0, 1502328700, NULL, 'enablecompletion', '1', NULL),
(15, 0, 1502328700, NULL, 'completiondefault', '1', NULL),
(16, 0, 1502328701, NULL, 'enableavailability', '1', NULL),
(17, 0, 1502328701, NULL, 'enableplagiarism', '0', NULL),
(18, 0, 1502328701, NULL, 'enablebadges', '1', NULL),
(19, 0, 1502328701, NULL, 'enableglobalsearch', '0', NULL),
(20, 0, 1502328701, NULL, 'allowstealth', '0', NULL),
(21, 0, 1502328701, NULL, 'defaultpreference_maildisplay', '2', NULL),
(22, 0, 1502328701, NULL, 'defaultpreference_mailformat', '1', NULL),
(23, 0, 1502328701, NULL, 'defaultpreference_maildigest', '0', NULL),
(24, 0, 1502328701, NULL, 'defaultpreference_autosubscribe', '1', NULL),
(25, 0, 1502328701, NULL, 'defaultpreference_trackforums', '0', NULL),
(26, 0, 1502328701, NULL, 'autologinguests', '0', NULL),
(27, 0, 1502328701, NULL, 'hiddenuserfields', '', NULL),
(28, 0, 1502328702, NULL, 'showuseridentity', 'email', NULL),
(29, 0, 1502328702, NULL, 'fullnamedisplay', 'language', NULL),
(30, 0, 1502328702, NULL, 'alternativefullnameformat', 'language', NULL),
(31, 0, 1502328702, NULL, 'maxusersperpage', '100', NULL),
(32, 0, 1502328702, NULL, 'enablegravatar', '0', NULL),
(33, 0, 1502328702, NULL, 'gravatardefaulturl', 'mm', NULL),
(34, 0, 1502328702, 'moodlecourse', 'visible', '1', NULL),
(35, 0, 1502328702, 'moodlecourse', 'format', 'topics', NULL),
(36, 0, 1502328702, 'moodlecourse', 'maxsections', '52', NULL),
(37, 0, 1502328702, 'moodlecourse', 'numsections', '4', NULL),
(38, 0, 1502328702, 'moodlecourse', 'hiddensections', '0', NULL),
(39, 0, 1502328703, 'moodlecourse', 'coursedisplay', '0', NULL),
(40, 0, 1502328703, 'moodlecourse', 'courseduration', '31536000', NULL),
(41, 0, 1502328703, 'moodlecourse', 'lang', '', NULL),
(42, 0, 1502328703, 'moodlecourse', 'newsitems', '5', NULL),
(43, 0, 1502328703, 'moodlecourse', 'showgrades', '1', NULL),
(44, 0, 1502328703, 'moodlecourse', 'showreports', '0', NULL),
(45, 0, 1502328703, 'moodlecourse', 'maxbytes', '0', NULL),
(46, 0, 1502328703, 'moodlecourse', 'enablecompletion', '1', NULL),
(47, 0, 1502328703, 'moodlecourse', 'groupmode', '0', NULL),
(48, 0, 1502328703, 'moodlecourse', 'groupmodeforce', '0', NULL),
(49, 0, 1502328703, NULL, 'enablecourserequests', '0', NULL),
(50, 0, 1502328703, NULL, 'defaultrequestcategory', '1', NULL),
(51, 0, 1502328703, NULL, 'requestcategoryselection', '0', NULL),
(52, 0, 1502328704, NULL, 'courserequestnotify', '', NULL),
(53, 0, 1502328704, 'backup', 'loglifetime', '30', NULL),
(54, 0, 1502328704, 'backup', 'backup_general_users', '1', NULL),
(55, 0, 1502328704, 'backup', 'backup_general_users_locked', '', NULL),
(56, 0, 1502328704, 'backup', 'backup_general_anonymize', '0', NULL),
(57, 0, 1502328704, 'backup', 'backup_general_anonymize_locked', '', NULL),
(58, 0, 1502328704, 'backup', 'backup_general_role_assignments', '1', NULL),
(59, 0, 1502328704, 'backup', 'backup_general_role_assignments_locked', '', NULL),
(60, 0, 1502328704, 'backup', 'backup_general_activities', '1', NULL),
(61, 0, 1502328704, 'backup', 'backup_general_activities_locked', '', NULL),
(62, 0, 1502328704, 'backup', 'backup_general_blocks', '1', NULL),
(63, 0, 1502328704, 'backup', 'backup_general_blocks_locked', '', NULL),
(64, 0, 1502328705, 'backup', 'backup_general_filters', '1', NULL),
(65, 0, 1502328705, 'backup', 'backup_general_filters_locked', '', NULL),
(66, 0, 1502328705, 'backup', 'backup_general_comments', '1', NULL),
(67, 0, 1502328705, 'backup', 'backup_general_comments_locked', '', NULL),
(68, 0, 1502328705, 'backup', 'backup_general_badges', '1', NULL),
(69, 0, 1502328705, 'backup', 'backup_general_badges_locked', '', NULL),
(70, 0, 1502328705, 'backup', 'backup_general_calendarevents', '1', NULL),
(71, 0, 1502328705, 'backup', 'backup_general_calendarevents_locked', '', NULL),
(72, 0, 1502328705, 'backup', 'backup_general_userscompletion', '1', NULL),
(73, 0, 1502328705, 'backup', 'backup_general_userscompletion_locked', '', NULL),
(74, 0, 1502328705, 'backup', 'backup_general_logs', '0', NULL),
(75, 0, 1502328705, 'backup', 'backup_general_logs_locked', '', NULL),
(76, 0, 1502328705, 'backup', 'backup_general_histories', '0', NULL),
(77, 0, 1502328705, 'backup', 'backup_general_histories_locked', '', NULL),
(78, 0, 1502328706, 'backup', 'backup_general_questionbank', '1', NULL),
(79, 0, 1502328706, 'backup', 'backup_general_questionbank_locked', '', NULL),
(80, 0, 1502328706, 'backup', 'backup_general_groups', '1', NULL),
(81, 0, 1502328706, 'backup', 'backup_general_groups_locked', '', NULL),
(82, 0, 1502328706, 'backup', 'backup_general_competencies', '1', NULL),
(83, 0, 1502328706, 'backup', 'backup_general_competencies_locked', '', NULL),
(84, 0, 1502328706, 'backup', 'import_general_maxresults', '10', NULL),
(85, 0, 1502328706, 'backup', 'import_general_duplicate_admin_allowed', '0', NULL),
(86, 0, 1502328706, 'backup', 'backup_import_activities', '1', NULL),
(87, 0, 1502328706, 'backup', 'backup_import_activities_locked', '', NULL),
(88, 0, 1502328706, 'backup', 'backup_import_blocks', '1', NULL),
(89, 0, 1502328706, 'backup', 'backup_import_blocks_locked', '', NULL),
(90, 0, 1502328707, 'backup', 'backup_import_filters', '1', NULL),
(91, 0, 1502328707, 'backup', 'backup_import_filters_locked', '', NULL),
(92, 0, 1502328707, 'backup', 'backup_import_calendarevents', '1', NULL),
(93, 0, 1502328707, 'backup', 'backup_import_calendarevents_locked', '', NULL),
(94, 0, 1502328707, 'backup', 'backup_import_questionbank', '1', NULL),
(95, 0, 1502328707, 'backup', 'backup_import_questionbank_locked', '', NULL),
(96, 0, 1502328707, 'backup', 'backup_import_groups', '1', NULL),
(97, 0, 1502328707, 'backup', 'backup_import_groups_locked', '', NULL),
(98, 0, 1502328707, 'backup', 'backup_import_competencies', '1', NULL),
(99, 0, 1502328707, 'backup', 'backup_import_competencies_locked', '', NULL),
(100, 0, 1502328708, 'backup', 'backup_auto_active', '0', NULL),
(101, 0, 1502328708, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(102, 0, 1502328708, 'backup', 'backup_auto_hour', '0', NULL),
(103, 0, 1502328708, 'backup', 'backup_auto_minute', '0', NULL),
(104, 0, 1502328708, 'backup', 'backup_auto_storage', '0', NULL),
(105, 0, 1502328708, 'backup', 'backup_auto_destination', '', NULL),
(106, 0, 1502328708, 'backup', 'backup_auto_max_kept', '1', NULL),
(107, 0, 1502328708, 'backup', 'backup_auto_delete_days', '0', NULL),
(108, 0, 1502328708, 'backup', 'backup_auto_min_kept', '0', NULL),
(109, 0, 1502328708, 'backup', 'backup_shortname', '0', NULL),
(110, 0, 1502328708, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(111, 0, 1502328709, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(112, 0, 1502328709, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(113, 0, 1502328709, 'backup', 'backup_auto_users', '1', NULL),
(114, 0, 1502328709, 'backup', 'backup_auto_role_assignments', '1', NULL),
(115, 0, 1502328709, 'backup', 'backup_auto_activities', '1', NULL),
(116, 0, 1502328709, 'backup', 'backup_auto_blocks', '1', NULL),
(117, 0, 1502328709, 'backup', 'backup_auto_filters', '1', NULL),
(118, 0, 1502328709, 'backup', 'backup_auto_comments', '1', NULL),
(119, 0, 1502328709, 'backup', 'backup_auto_badges', '1', NULL),
(120, 0, 1502328709, 'backup', 'backup_auto_calendarevents', '1', NULL),
(121, 0, 1502328709, 'backup', 'backup_auto_userscompletion', '1', NULL),
(122, 0, 1502328710, 'backup', 'backup_auto_logs', '0', NULL),
(123, 0, 1502328710, 'backup', 'backup_auto_histories', '0', NULL),
(124, 0, 1502328710, 'backup', 'backup_auto_questionbank', '1', NULL),
(125, 0, 1502328710, 'backup', 'backup_auto_groups', '1', NULL),
(126, 0, 1502328710, 'backup', 'backup_auto_competencies', '1', NULL),
(127, 0, 1502328710, 'restore', 'restore_general_users', '1', NULL),
(128, 0, 1502328710, 'restore', 'restore_general_users_locked', '', NULL),
(129, 0, 1502328710, 'restore', 'restore_general_enrolments', '1', NULL),
(130, 0, 1502328710, 'restore', 'restore_general_enrolments_locked', '', NULL),
(131, 0, 1502328710, 'restore', 'restore_general_role_assignments', '1', NULL),
(132, 0, 1502328710, 'restore', 'restore_general_role_assignments_locked', '', NULL),
(133, 0, 1502328710, 'restore', 'restore_general_activities', '1', NULL),
(134, 0, 1502328710, 'restore', 'restore_general_activities_locked', '', NULL),
(135, 0, 1502328711, 'restore', 'restore_general_blocks', '1', NULL),
(136, 0, 1502328711, 'restore', 'restore_general_blocks_locked', '', NULL),
(137, 0, 1502328711, 'restore', 'restore_general_filters', '1', NULL),
(138, 0, 1502328711, 'restore', 'restore_general_filters_locked', '', NULL),
(139, 0, 1502328711, 'restore', 'restore_general_comments', '1', NULL),
(140, 0, 1502328711, 'restore', 'restore_general_comments_locked', '', NULL),
(141, 0, 1502328711, 'restore', 'restore_general_badges', '1', NULL),
(142, 0, 1502328711, 'restore', 'restore_general_badges_locked', '', NULL),
(143, 0, 1502328711, 'restore', 'restore_general_calendarevents', '1', NULL),
(144, 0, 1502328711, 'restore', 'restore_general_calendarevents_locked', '', NULL),
(145, 0, 1502328711, 'restore', 'restore_general_userscompletion', '1', NULL),
(146, 0, 1502328711, 'restore', 'restore_general_userscompletion_locked', '', NULL),
(147, 0, 1502328711, 'restore', 'restore_general_logs', '1', NULL),
(148, 0, 1502328711, 'restore', 'restore_general_logs_locked', '', NULL),
(149, 0, 1502328712, 'restore', 'restore_general_histories', '1', NULL),
(150, 0, 1502328712, 'restore', 'restore_general_histories_locked', '', NULL),
(151, 0, 1502328712, 'restore', 'restore_general_groups', '1', NULL),
(152, 0, 1502328712, 'restore', 'restore_general_groups_locked', '', NULL),
(153, 0, 1502328712, 'restore', 'restore_general_competencies', '1', NULL),
(154, 0, 1502328712, 'restore', 'restore_general_competencies_locked', '', NULL),
(155, 0, 1502328712, 'restore', 'restore_merge_overwrite_conf', '0', NULL),
(156, 0, 1502328712, 'restore', 'restore_merge_overwrite_conf_locked', '', NULL),
(157, 0, 1502328712, 'restore', 'restore_merge_course_fullname', '1', NULL),
(158, 0, 1502328712, 'restore', 'restore_merge_course_fullname_locked', '', NULL),
(159, 0, 1502328712, 'restore', 'restore_merge_course_shortname', '1', NULL),
(160, 0, 1502328712, 'restore', 'restore_merge_course_shortname_locked', '', NULL),
(161, 0, 1502328712, 'restore', 'restore_merge_course_startdate', '1', NULL),
(162, 0, 1502328713, 'restore', 'restore_merge_course_startdate_locked', '', NULL),
(163, 0, 1502328713, 'restore', 'restore_replace_overwrite_conf', '0', NULL),
(164, 0, 1502328713, 'restore', 'restore_replace_overwrite_conf_locked', '', NULL),
(165, 0, 1502328713, 'restore', 'restore_replace_course_fullname', '1', NULL),
(166, 0, 1502328713, 'restore', 'restore_replace_course_fullname_locked', '', NULL),
(167, 0, 1502328713, 'restore', 'restore_replace_course_shortname', '1', NULL),
(168, 0, 1502328713, 'restore', 'restore_replace_course_shortname_locked', '', NULL),
(169, 0, 1502328713, 'restore', 'restore_replace_course_startdate', '1', NULL),
(170, 0, 1502328713, 'restore', 'restore_replace_course_startdate_locked', '', NULL),
(171, 0, 1502328713, 'restore', 'restore_replace_keep_roles_and_enrolments', '0', NULL),
(172, 0, 1502328713, 'restore', 'restore_replace_keep_roles_and_enrolments_locked', '', NULL),
(173, 0, 1502328713, 'restore', 'restore_replace_keep_groups_and_groupings', '0', NULL),
(174, 0, 1502328713, 'restore', 'restore_replace_keep_groups_and_groupings_locked', '', NULL),
(175, 0, 1502328714, NULL, 'grade_profilereport', 'user', NULL),
(176, 0, 1502328714, NULL, 'grade_aggregationposition', '1', NULL),
(177, 0, 1502328714, NULL, 'grade_includescalesinaggregation', '1', NULL),
(178, 0, 1502328714, NULL, 'grade_hiddenasdate', '0', NULL),
(179, 0, 1502328714, NULL, 'gradepublishing', '0', NULL),
(180, 0, 1502328714, NULL, 'grade_export_displaytype', '1', NULL),
(181, 0, 1502328714, NULL, 'grade_export_decimalpoints', '2', NULL),
(182, 0, 1502328714, NULL, 'grade_navmethod', '1', NULL),
(183, 0, 1502328714, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(184, 0, 1502328715, NULL, 'grade_export_customprofilefields', '', NULL),
(185, 0, 1502328715, NULL, 'recovergradesdefault', '0', NULL),
(186, 0, 1502328715, NULL, 'gradeexport', '', NULL),
(187, 0, 1502328715, NULL, 'unlimitedgrades', '0', NULL),
(188, 0, 1502328715, NULL, 'grade_report_showmin', '1', NULL),
(189, 0, 1502328715, NULL, 'gradepointmax', '100', NULL),
(190, 0, 1502328715, NULL, 'gradepointdefault', '100', NULL),
(191, 0, 1502328715, NULL, 'grade_minmaxtouse', '1', NULL),
(192, 0, 1502328715, NULL, 'grade_mygrades_report', 'overview', NULL),
(193, 0, 1502328715, NULL, 'gradereport_mygradeurl', '', NULL),
(194, 0, 1502328716, NULL, 'grade_hideforcedsettings', '1', NULL),
(195, 0, 1502328716, NULL, 'grade_aggregation', '13', NULL),
(196, 0, 1502328716, NULL, 'grade_aggregation_flag', '0', NULL),
(197, 0, 1502328716, NULL, 'grade_aggregations_visible', '13', NULL),
(198, 0, 1502328716, NULL, 'grade_aggregateonlygraded', '1', NULL),
(199, 0, 1502328716, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(200, 0, 1502328716, NULL, 'grade_aggregateoutcomes', '0', NULL),
(201, 0, 1502328716, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(202, 0, 1502328716, NULL, 'grade_keephigh', '0', NULL),
(203, 0, 1502328716, NULL, 'grade_keephigh_flag', '3', NULL),
(204, 0, 1502328716, NULL, 'grade_droplow', '0', NULL),
(205, 0, 1502328717, NULL, 'grade_droplow_flag', '2', NULL),
(206, 0, 1502328717, NULL, 'grade_overridecat', '1', NULL),
(207, 0, 1502328717, NULL, 'grade_displaytype', '1', NULL),
(208, 0, 1502328717, NULL, 'grade_decimalpoints', '2', NULL),
(209, 0, 1502328717, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(210, 0, 1502328717, NULL, 'grade_report_studentsperpage', '100', NULL),
(211, 0, 1502328717, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(212, 0, 1502328717, NULL, 'grade_report_quickgrading', '1', NULL),
(213, 0, 1502328717, NULL, 'grade_report_showquickfeedback', '0', NULL),
(214, 0, 1502328717, NULL, 'grade_report_meanselection', '1', NULL),
(215, 0, 1502328717, NULL, 'grade_report_enableajax', '0', NULL),
(216, 0, 1502328717, NULL, 'grade_report_showcalculations', '1', NULL),
(217, 0, 1502328718, NULL, 'grade_report_showeyecons', '0', NULL),
(218, 0, 1502328718, NULL, 'grade_report_showaverages', '1', NULL),
(219, 0, 1502328718, NULL, 'grade_report_showlocks', '0', NULL),
(220, 0, 1502328718, NULL, 'grade_report_showranges', '0', NULL),
(221, 0, 1502328718, NULL, 'grade_report_showanalysisicon', '1', NULL),
(222, 0, 1502328718, NULL, 'grade_report_showuserimage', '1', NULL),
(223, 0, 1502328718, NULL, 'grade_report_showactivityicons', '1', NULL),
(224, 0, 1502328718, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(225, 0, 1502328718, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(226, 0, 1502328718, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(227, 0, 1502328718, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(228, 0, 1502328719, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(229, 0, 1502328719, NULL, 'grade_report_historyperpage', '50', NULL),
(230, 0, 1502328719, NULL, 'grade_report_overview_showrank', '0', NULL),
(231, 0, 1502328719, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(232, 0, 1502328719, NULL, 'grade_report_user_showrank', '0', NULL),
(233, 0, 1502328719, NULL, 'grade_report_user_showpercentage', '1', NULL),
(234, 0, 1502328719, NULL, 'grade_report_user_showgrade', '1', NULL),
(235, 0, 1502328719, NULL, 'grade_report_user_showfeedback', '1', NULL),
(236, 0, 1502328719, NULL, 'grade_report_user_showrange', '1', NULL),
(237, 0, 1502328719, NULL, 'grade_report_user_showweight', '1', NULL),
(238, 0, 1502328720, NULL, 'grade_report_user_showaverage', '0', NULL),
(239, 0, 1502328720, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(240, 0, 1502328720, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(241, 0, 1502328720, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(242, 0, 1502328720, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(243, 0, 1502328720, NULL, 'grade_report_user_showcontributiontocoursetotal', '1', NULL),
(244, 0, 1502328720, 'core_competency', 'enabled', '1', NULL),
(245, 0, 1502328720, 'core_competency', 'pushcourseratingstouserplans', '1', NULL),
(246, 0, 1502328720, NULL, 'badges_defaultissuername', '', NULL),
(247, 0, 1502328720, NULL, 'badges_defaultissuercontact', '', NULL),
(248, 0, 1502328720, NULL, 'badges_badgesalt', 'badges1502328646', NULL),
(249, 0, 1502328721, NULL, 'badges_allowexternalbackpack', '1', NULL),
(250, 0, 1502328721, NULL, 'badges_allowcoursebadges', '1', NULL),
(251, 0, 1502328726, NULL, 'timezone', 'Europe/London', NULL),
(252, 0, 1502328730, NULL, 'forcetimezone', '99', NULL),
(253, 0, 1502328730, NULL, 'country', '0', NULL),
(254, 0, 1502328730, NULL, 'defaultcity', '', NULL),
(255, 0, 1502328730, NULL, 'geoip2file', 'C:\\wamp64\\moodledata/geoip/GeoLite2-City.mmdb', NULL),
(256, 0, 1502328730, NULL, 'googlemapkey3', '', NULL),
(257, 0, 1502328730, NULL, 'allcountrycodes', '', NULL),
(258, 0, 1502328730, NULL, 'autolang', '1', NULL),
(259, 0, 1502328731, NULL, 'lang', 'en', NULL),
(260, 0, 1502328731, NULL, 'langmenu', '1', NULL),
(261, 0, 1502328731, NULL, 'langlist', '', NULL),
(262, 0, 1502328731, NULL, 'langcache', '1', NULL),
(263, 0, 1502328731, NULL, 'langstringcache', '1', NULL),
(264, 0, 1502328731, NULL, 'locale', '', NULL),
(265, 0, 1502328731, NULL, 'latinexcelexport', '0', NULL),
(266, 0, 1502328732, NULL, 'requiremodintro', '0', NULL),
(267, 0, 1502328732, NULL, 'registerauth', '', NULL),
(268, 0, 1502328732, NULL, 'authloginviaemail', '0', NULL),
(269, 0, 1502328732, NULL, 'allowaccountssameemail', '0', NULL),
(270, 0, 1502328732, NULL, 'authpreventaccountcreation', '0', NULL),
(271, 0, 1502328732, NULL, 'loginpageautofocus', '0', NULL),
(272, 0, 1502328733, NULL, 'guestloginbutton', '1', NULL),
(273, 0, 1502328733, NULL, 'limitconcurrentlogins', '0', NULL),
(274, 0, 1502328733, NULL, 'alternateloginurl', '', NULL),
(275, 0, 1502328733, NULL, 'forgottenpasswordurl', '', NULL),
(276, 0, 1502328733, NULL, 'auth_instructions', '', NULL),
(277, 0, 1502328733, NULL, 'allowemailaddresses', '', NULL),
(278, 0, 1502328733, NULL, 'denyemailaddresses', '', NULL),
(279, 0, 1502328733, NULL, 'verifychangedemail', '1', NULL),
(280, 0, 1502328733, NULL, 'recaptchapublickey', '', NULL),
(281, 0, 1502328734, NULL, 'recaptchaprivatekey', '', NULL),
(282, 0, 1502328734, 'cachestore_apcu', 'testperformance', '0', NULL),
(283, 0, 1502328734, 'cachestore_memcache', 'testservers', '', NULL),
(284, 0, 1502328734, 'cachestore_memcached', 'testservers', '', NULL),
(285, 0, 1502328734, 'cachestore_mongodb', 'testserver', '', NULL),
(286, 0, 1502328734, 'cachestore_redis', 'test_server', '', NULL),
(287, 0, 1502328734, 'cachestore_redis', 'test_password', '', NULL),
(288, 0, 1502328734, NULL, 'filteruploadedfiles', '0', NULL),
(289, 0, 1502328734, NULL, 'filtermatchoneperpage', '0', NULL),
(290, 0, 1502328734, NULL, 'filtermatchonepertext', '0', NULL),
(291, 0, 1502328735, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(292, 0, 1502328735, NULL, 'media_default_width', '400', NULL),
(293, 0, 1502328735, NULL, 'media_default_height', '300', NULL),
(294, 0, 1502328735, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(295, 0, 1502328735, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(296, 0, 1502328735, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(297, 0, 1502328735, NULL, 'portfolio_high_db_threshold', '50', NULL),
(298, 0, 1502328736, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(299, 0, 1502328736, 'question_preview', 'correctness', '1', NULL),
(300, 0, 1502328736, 'question_preview', 'marks', '2', NULL),
(301, 0, 1502328736, 'question_preview', 'markdp', '2', NULL),
(302, 0, 1502328736, 'question_preview', 'feedback', '1', NULL),
(303, 0, 1502328737, 'question_preview', 'generalfeedback', '1', NULL),
(304, 0, 1502328737, 'question_preview', 'rightanswer', '1', NULL),
(305, 0, 1502328737, 'question_preview', 'history', '0', NULL),
(306, 0, 1502328737, NULL, 'repositorycacheexpire', '120', NULL),
(307, 0, 1502328737, NULL, 'repositorygetfiletimeout', '30', NULL),
(308, 0, 1502328737, NULL, 'repositorysyncfiletimeout', '1', NULL),
(309, 0, 1502328737, NULL, 'repositorysyncimagetimeout', '3', NULL),
(310, 0, 1502328737, NULL, 'repositoryallowexternallinks', '1', NULL),
(311, 0, 1502328737, NULL, 'legacyfilesinnewcourses', '0', NULL),
(312, 0, 1502328737, NULL, 'legacyfilesaddallowed', '1', NULL),
(313, 0, 1502328738, NULL, 'searchengine', 'solr', NULL),
(314, 0, 1502328738, NULL, 'searchindexwhendisabled', '0', NULL),
(315, 0, 1502328738, NULL, 'searchindextime', '600', NULL),
(316, 0, 1502328738, NULL, 'enablewsdocumentation', '0', NULL),
(317, 0, 1502328738, NULL, 'allowbeforeblock', '0', NULL),
(318, 0, 1502328738, NULL, 'allowedip', '', NULL),
(319, 0, 1502328738, NULL, 'blockedip', '', NULL),
(320, 0, 1502328738, NULL, 'protectusernames', '1', NULL),
(321, 0, 1502328738, NULL, 'forcelogin', '0', NULL),
(322, 0, 1502328739, NULL, 'forceloginforprofiles', '1', NULL),
(323, 0, 1502328739, NULL, 'forceloginforprofileimage', '0', NULL),
(324, 0, 1502328739, NULL, 'opentogoogle', '0', NULL),
(325, 0, 1502328739, NULL, 'allowindexing', '0', NULL),
(326, 0, 1502328739, NULL, 'maxbytes', '0', NULL),
(327, 0, 1502328739, NULL, 'userquota', '104857600', NULL),
(328, 0, 1502328739, NULL, 'allowobjectembed', '0', NULL),
(329, 0, 1502328739, NULL, 'enabletrusttext', '0', NULL),
(330, 0, 1502328739, NULL, 'maxeditingtime', '1800', NULL),
(331, 0, 1502328740, NULL, 'extendedusernamechars', '0', NULL),
(332, 0, 1502328740, NULL, 'sitepolicy', '', NULL),
(333, 0, 1502328740, NULL, 'sitepolicyguest', '', NULL),
(334, 0, 1502328740, NULL, 'keeptagnamecase', '1', NULL),
(335, 0, 1502328740, NULL, 'profilesforenrolledusersonly', '1', NULL),
(336, 0, 1502328740, NULL, 'cronclionly', '1', NULL),
(337, 0, 1502328740, NULL, 'cronremotepassword', '', NULL),
(338, 0, 1502328740, 'tool_task', 'enablerunnow', '1', NULL),
(339, 0, 1502328740, NULL, 'lockoutthreshold', '0', NULL),
(340, 0, 1502328741, NULL, 'lockoutwindow', '1800', NULL),
(341, 0, 1502328741, NULL, 'lockoutduration', '1800', NULL),
(342, 0, 1502328741, NULL, 'passwordpolicy', '1', NULL),
(343, 0, 1502328741, NULL, 'minpasswordlength', '8', NULL),
(344, 0, 1502328741, NULL, 'minpassworddigits', '1', NULL),
(345, 0, 1502328741, NULL, 'minpasswordlower', '1', NULL),
(346, 0, 1502328741, NULL, 'minpasswordupper', '1', NULL),
(347, 0, 1502328741, NULL, 'minpasswordnonalphanum', '1', NULL),
(348, 0, 1502328741, NULL, 'maxconsecutiveidentchars', '0', NULL),
(349, 0, 1502328741, NULL, 'passwordreuselimit', '0', NULL),
(350, 0, 1502328741, NULL, 'pwresettime', '1800', NULL),
(351, 0, 1502328742, NULL, 'passwordchangelogout', '0', NULL),
(352, 0, 1502328742, NULL, 'passwordchangetokendeletion', '0', NULL),
(353, 0, 1502328742, NULL, 'tokenduration', '7257600', NULL),
(354, 0, 1502328742, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(355, 0, 1502328742, NULL, 'disableuserimages', '0', NULL),
(356, 0, 1502328742, NULL, 'emailchangeconfirmation', '1', NULL),
(357, 0, 1502328742, NULL, 'rememberusername', '2', NULL),
(358, 0, 1502328742, NULL, 'strictformsrequired', '0', NULL),
(359, 0, 1502328742, NULL, 'loginhttps', '0', NULL),
(360, 0, 1502328742, NULL, 'cookiesecure', '1', NULL),
(361, 0, 1502328742, NULL, 'cookiehttponly', '0', NULL),
(362, 0, 1502328742, NULL, 'allowframembedding', '0', NULL),
(363, 0, 1502328743, NULL, 'curlsecurityblockedhosts', '', NULL),
(364, 0, 1502328743, NULL, 'curlsecurityallowedport', '', NULL),
(365, 0, 1502328743, NULL, 'displayloginfailures', '0', NULL),
(366, 0, 1502328743, NULL, 'notifyloginfailures', '', NULL),
(367, 0, 1502328743, NULL, 'notifyloginthreshold', '10', NULL),
(368, 0, 1502328743, 'analytics', 'predictionsprocessor', '\\mlbackend_php\\processor', NULL),
(369, 0, 1502328743, 'analytics', 'timesplittings', '\\core\\analytics\\time_splitting\\quarters_accum,\\core\\analytics\\time_splitting\\quarters,\\core\\analytics\\time_splitting\\no_splitting', NULL),
(370, 0, 1502328743, 'analytics', 'modeloutputdir', 'C:\\wamp64\\moodledata\\models', NULL),
(371, 0, 1502328744, NULL, 'themelist', '', NULL),
(372, 0, 1502328744, NULL, 'themedesignermode', '0', NULL),
(373, 0, 1502328744, NULL, 'allowuserthemes', '0', NULL),
(374, 0, 1502328744, NULL, 'allowcoursethemes', '0', NULL),
(375, 0, 1502328744, NULL, 'allowcategorythemes', '0', NULL),
(376, 0, 1502328744, NULL, 'allowthemechangeonurl', '0', NULL),
(377, 0, 1502328744, NULL, 'allowuserblockhiding', '1', NULL),
(378, 0, 1502328744, NULL, 'allowblockstodock', '1', NULL),
(379, 0, 1502328745, NULL, 'custommenuitems', '', NULL),
(380, 0, 1502328745, NULL, 'customusermenuitems', 'grades,grades|/grade/report/mygrades.php|grades\r\nmessages,message|/message/index.php|message\r\npreferences,moodle|/user/preferences.php|preferences', NULL),
(381, 0, 1502328745, NULL, 'enabledevicedetection', '1', NULL),
(382, 0, 1502328745, NULL, 'devicedetectregex', '[]', NULL),
(383, 0, 1502328745, 'theme_boost', 'preset', 'default.scss', NULL),
(384, 0, 1502328745, 'theme_boost', 'presetfiles', '', NULL),
(385, 0, 1502328745, 'theme_boost', 'brandcolor', '', NULL),
(386, 0, 1502328745, 'theme_boost', 'scsspre', '', NULL),
(387, 0, 1502328745, 'theme_boost', 'scss', '', NULL),
(388, 0, 1502328745, 'theme_clean', 'invert', '0', NULL),
(389, 0, 1502328746, 'theme_clean', 'logo', '', NULL),
(390, 0, 1502328746, 'theme_clean', 'smalllogo', '', NULL),
(391, 0, 1502328746, 'theme_clean', 'sitename', '1', NULL),
(392, 0, 1502328746, 'theme_clean', 'customcss', '', NULL),
(393, 0, 1502328746, 'theme_clean', 'footnote', '', NULL),
(394, 0, 1502328746, 'theme_more', 'textcolor', '#333366', NULL),
(395, 0, 1502328746, 'theme_more', 'linkcolor', '#FF6500', NULL),
(396, 0, 1502328746, 'theme_more', 'bodybackground', '', NULL),
(397, 0, 1502328746, 'theme_more', 'backgroundimage', '', NULL),
(398, 0, 1502328746, 'theme_more', 'backgroundrepeat', 'repeat', NULL),
(399, 0, 1502328746, 'theme_more', 'backgroundposition', '0', NULL),
(400, 0, 1502328746, 'theme_more', 'backgroundfixed', '0', NULL),
(401, 0, 1502328746, 'theme_more', 'contentbackground', '#FFFFFF', NULL),
(402, 0, 1502328746, 'theme_more', 'secondarybackground', '#FFFFFF', NULL),
(403, 0, 1502328746, 'theme_more', 'invert', '1', NULL),
(404, 0, 1502328746, 'theme_more', 'logo', '', NULL),
(405, 0, 1502328747, 'theme_more', 'smalllogo', '', NULL),
(406, 0, 1502328747, 'theme_more', 'sitename', '1', NULL),
(407, 0, 1502328747, 'theme_more', 'customcss', '', NULL),
(408, 0, 1502328747, 'theme_more', 'footnote', '', NULL),
(409, 0, 1502328747, 'core_admin', 'logo', '', NULL),
(410, 0, 1502328747, 'core_admin', 'logocompact', '', NULL),
(411, 0, 1502328747, NULL, 'calendartype', 'gregorian', NULL),
(412, 0, 1502328747, NULL, 'calendar_adminseesall', '0', NULL),
(413, 0, 1502328747, NULL, 'calendar_site_timeformat', '0', NULL),
(414, 0, 1502328747, NULL, 'calendar_startwday', '1', NULL),
(415, 0, 1502328748, NULL, 'calendar_weekend', '65', NULL),
(416, 0, 1502328748, NULL, 'calendar_lookahead', '21', NULL),
(417, 0, 1502328748, NULL, 'calendar_maxevents', '10', NULL),
(418, 0, 1502328748, NULL, 'enablecalendarexport', '1', NULL),
(419, 0, 1502328748, NULL, 'calendar_customexport', '1', NULL),
(420, 0, 1502328748, NULL, 'calendar_exportlookahead', '365', NULL),
(421, 0, 1502328748, NULL, 'calendar_exportlookback', '5', NULL),
(422, 0, 1502328748, NULL, 'calendar_exportsalt', 'eDXa2j4DaS6djgWo0UrXn4pilXGB3OaxyUfSjLGmNaRPnZPbmMzFWXGsa43I', NULL),
(423, 0, 1502328748, NULL, 'calendar_showicalsource', '1', NULL),
(424, 0, 1502328748, NULL, 'useblogassociations', '1', NULL),
(425, 0, 1502328749, NULL, 'bloglevel', '4', NULL),
(426, 0, 1502328749, NULL, 'useexternalblogs', '1', NULL),
(427, 0, 1502328749, NULL, 'externalblogcrontime', '86400', NULL),
(428, 0, 1502328749, NULL, 'maxexternalblogsperuser', '1', NULL),
(429, 0, 1502328749, NULL, 'blogusecomments', '1', NULL),
(430, 0, 1502328749, NULL, 'blogshowcommentscount', '1', NULL),
(431, 0, 1502328749, NULL, 'defaulthomepage', '1', NULL),
(432, 0, 1502328749, NULL, 'allowguestmymoodle', '1', NULL),
(433, 0, 1502328749, NULL, 'navshowfullcoursenames', '0', NULL),
(434, 0, 1502328749, NULL, 'navshowcategories', '1', NULL),
(435, 0, 1502328750, NULL, 'navshowmycoursecategories', '0', NULL),
(436, 0, 1502328750, NULL, 'navshowallcourses', '0', NULL),
(437, 0, 1502328750, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(438, 0, 1502328750, NULL, 'navcourselimit', '10', NULL),
(439, 0, 1502328750, NULL, 'usesitenameforsitepages', '0', NULL),
(440, 0, 1502328750, NULL, 'linkadmincategories', '1', NULL),
(441, 0, 1502328750, NULL, 'linkcoursesections', '0', NULL),
(442, 0, 1502328750, NULL, 'navshowfrontpagemods', '1', NULL),
(443, 0, 1502328750, NULL, 'navadduserpostslinks', '1', NULL),
(444, 0, 1502328750, NULL, 'formatstringstriptags', '1', NULL),
(445, 0, 1502328751, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(446, 0, 1502328751, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(447, 0, 1502328751, NULL, 'doclang', '', NULL),
(448, 0, 1502328751, NULL, 'doctonewwindow', '0', NULL),
(449, 0, 1502328751, NULL, 'courselistshortnames', '0', NULL),
(450, 0, 1502328751, NULL, 'coursesperpage', '20', NULL),
(451, 0, 1502328751, NULL, 'courseswithsummarieslimit', '10', NULL),
(452, 0, 1502328752, NULL, 'courseoverviewfileslimit', '1', NULL),
(453, 0, 1502328752, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(454, 0, 1502328752, NULL, 'useexternalyui', '0', NULL),
(455, 0, 1502328752, NULL, 'yuicomboloading', '1', NULL),
(456, 0, 1502328752, NULL, 'cachejs', '1', NULL),
(457, 0, 1502328752, NULL, 'modchooserdefault', '1', NULL),
(458, 0, 1502328752, NULL, 'additionalhtmlhead', '', NULL),
(459, 0, 1502328752, NULL, 'additionalhtmltopofbody', '', NULL),
(460, 0, 1502328753, NULL, 'additionalhtmlfooter', '', NULL),
(461, 0, 1502328753, NULL, 'pathtodu', '', NULL),
(462, 0, 1502328753, NULL, 'aspellpath', '', NULL),
(463, 0, 1502328753, NULL, 'pathtodot', '', NULL),
(464, 0, 1502328753, NULL, 'pathtogs', '/usr/bin/gs', NULL),
(465, 0, 1502328753, NULL, 'supportname', 'Admin User', NULL),
(466, 0, 1502328753, NULL, 'supportemail', '', NULL),
(467, 0, 1502328754, NULL, 'supportpage', '', NULL),
(468, 0, 1502328754, NULL, 'dbsessions', '0', NULL),
(469, 0, 1502328754, NULL, 'sessioncookie', '', NULL),
(470, 0, 1502328754, NULL, 'sessioncookiepath', '', NULL),
(471, 0, 1502328754, NULL, 'sessioncookiedomain', '', NULL),
(472, 0, 1502328754, NULL, 'statsfirstrun', 'none', NULL),
(473, 0, 1502328754, NULL, 'statsmaxruntime', '0', NULL),
(474, 0, 1502328754, NULL, 'statsruntimedays', '31', NULL),
(475, 0, 1502328755, NULL, 'statsuserthreshold', '0', NULL),
(476, 0, 1502328755, NULL, 'slasharguments', '1', NULL),
(477, 0, 1502328755, NULL, 'getremoteaddrconf', '0', NULL),
(478, 0, 1502328755, NULL, 'proxyhost', '', NULL),
(479, 0, 1502328755, NULL, 'proxyport', '0', NULL),
(480, 0, 1502328755, NULL, 'proxytype', 'HTTP', NULL),
(481, 0, 1502328755, NULL, 'proxyuser', '', NULL),
(482, 0, 1502328756, NULL, 'proxypassword', '', NULL),
(483, 0, 1502328756, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(484, 0, 1502328756, NULL, 'maintenance_enabled', '0', NULL),
(485, 0, 1502328756, NULL, 'maintenance_message', '', NULL),
(486, 0, 1502328756, NULL, 'deleteunconfirmed', '168', NULL),
(487, 0, 1502328756, NULL, 'deleteincompleteusers', '0', NULL),
(488, 0, 1502328756, NULL, 'disablegradehistory', '0', NULL),
(489, 0, 1502328756, NULL, 'gradehistorylifetime', '0', NULL),
(490, 0, 1502328757, NULL, 'tempdatafoldercleanup', '168', NULL),
(491, 0, 1502328757, NULL, 'extramemorylimit', '512M', NULL),
(492, 0, 1502328757, NULL, 'maxtimelimit', '0', NULL),
(493, 0, 1502328757, NULL, 'curlcache', '120', NULL),
(494, 0, 1502328757, NULL, 'curltimeoutkbitrate', '56', NULL),
(495, 0, 1502328757, NULL, 'smtphosts', '', NULL),
(496, 0, 1502328757, NULL, 'smtpsecure', '', NULL),
(497, 0, 1502328758, NULL, 'smtpauthtype', 'LOGIN', NULL),
(498, 0, 1502328758, NULL, 'smtpuser', '', NULL),
(499, 0, 1502328758, NULL, 'smtppass', '', NULL),
(500, 0, 1502328758, NULL, 'smtpmaxbulk', '1', NULL),
(501, 0, 1502328758, NULL, 'allowedemaildomains', '', NULL),
(502, 0, 1502328758, NULL, 'sitemailcharset', '0', NULL),
(503, 0, 1502328758, NULL, 'allowusermailcharset', '0', NULL),
(504, 0, 1502328758, NULL, 'allowattachments', '1', NULL),
(505, 0, 1502328759, NULL, 'mailnewline', 'LF', NULL),
(506, 0, 1502328759, NULL, 'emailfromvia', '1', NULL),
(507, 0, 1502328759, NULL, 'updateautocheck', '1', NULL),
(508, 0, 1502328759, NULL, 'updateminmaturity', '200', NULL),
(509, 0, 1502328759, NULL, 'updatenotifybuilds', '0', NULL),
(510, 0, 1502328759, NULL, 'enablesafebrowserintegration', '0', NULL),
(511, 0, 1502328759, NULL, 'dndallowtextandlinks', '0', NULL),
(512, 0, 1502328760, NULL, 'debug', '0', NULL),
(513, 0, 1502328760, NULL, 'debugdisplay', '1', NULL),
(514, 0, 1502328760, NULL, 'debugsmtp', '0', NULL),
(515, 0, 1502328760, NULL, 'perfdebug', '7', NULL),
(516, 0, 1502328760, NULL, 'debugstringids', '0', NULL),
(517, 0, 1502328760, NULL, 'debugvalidators', '0', NULL),
(518, 0, 1502328761, NULL, 'debugpageinfo', '0', NULL),
(519, 0, 1502328761, NULL, 'profilingenabled', '0', NULL),
(520, 0, 1502328761, NULL, 'profilingincluded', '', NULL),
(521, 0, 1502328761, NULL, 'profilingexcluded', '', NULL),
(522, 0, 1502328761, NULL, 'profilingautofrec', '0', NULL),
(523, 0, 1502328761, NULL, 'profilingallowme', '0', NULL),
(524, 0, 1502328761, NULL, 'profilingallowall', '0', NULL),
(525, 0, 1502328761, NULL, 'profilinglifetime', '1440', NULL),
(526, 0, 1502328762, NULL, 'profilingimportprefix', '(I)', NULL),
(527, 0, 1502328970, 'activitynames', 'filter_active', '1', ''),
(528, 0, 1502328973, 'mathjaxloader', 'filter_active', '1', ''),
(529, 0, 1502328974, 'mediaplugin', 'filter_active', '1', ''),
(530, 2, 1502329911, NULL, 'notloggedinroleid', '6', NULL),
(531, 2, 1502329911, NULL, 'guestroleid', '6', NULL),
(532, 2, 1502329911, NULL, 'defaultuserroleid', '7', NULL),
(533, 2, 1502329911, NULL, 'creatornewroleid', '3', NULL),
(534, 2, 1502329911, NULL, 'restorernewroleid', '3', NULL),
(535, 2, 1502329911, NULL, 'gradebookroles', '5', NULL),
(536, 2, 1502329911, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(537, 2, 1502329911, 'assign', 'showrecentsubmissions', '0', NULL),
(538, 2, 1502329911, 'assign', 'submissionreceipts', '1', NULL),
(539, 2, 1502329912, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(540, 2, 1502329912, 'assign', 'maxperpage', '-1', NULL),
(541, 2, 1502329912, 'assign', 'alwaysshowdescription', '1', NULL),
(542, 2, 1502329912, 'assign', 'alwaysshowdescription_adv', '', NULL),
(543, 2, 1502329912, 'assign', 'alwaysshowdescription_locked', '', NULL),
(544, 2, 1502329912, 'assign', 'allowsubmissionsfromdate', '0', NULL),
(545, 2, 1502329912, 'assign', 'allowsubmissionsfromdate_enabled', '1', NULL),
(546, 2, 1502329912, 'assign', 'allowsubmissionsfromdate_adv', '', NULL),
(547, 2, 1502329912, 'assign', 'duedate', '604800', NULL),
(548, 2, 1502329912, 'assign', 'duedate_enabled', '1', NULL),
(549, 2, 1502329912, 'assign', 'duedate_adv', '', NULL),
(550, 2, 1502329913, 'assign', 'cutoffdate', '1209600', NULL),
(551, 2, 1502329913, 'assign', 'cutoffdate_enabled', '', NULL),
(552, 2, 1502329913, 'assign', 'cutoffdate_adv', '', NULL),
(553, 2, 1502329913, 'assign', 'gradingduedate', '1209600', NULL),
(554, 2, 1502329913, 'assign', 'gradingduedate_enabled', '1', NULL),
(555, 2, 1502329913, 'assign', 'gradingduedate_adv', '', NULL),
(556, 2, 1502329913, 'assign', 'submissiondrafts', '0', NULL),
(557, 2, 1502329913, 'assign', 'submissiondrafts_adv', '', NULL),
(558, 2, 1502329913, 'assign', 'submissiondrafts_locked', '', NULL),
(559, 2, 1502329913, 'assign', 'requiresubmissionstatement', '0', NULL),
(560, 2, 1502329913, 'assign', 'requiresubmissionstatement_adv', '', NULL),
(561, 2, 1502329913, 'assign', 'requiresubmissionstatement_locked', '', NULL),
(562, 2, 1502329913, 'assign', 'attemptreopenmethod', 'none', NULL),
(563, 2, 1502329913, 'assign', 'attemptreopenmethod_adv', '', NULL),
(564, 2, 1502329914, 'assign', 'attemptreopenmethod_locked', '', NULL),
(565, 2, 1502329914, 'assign', 'maxattempts', '-1', NULL),
(566, 2, 1502329914, 'assign', 'maxattempts_adv', '', NULL),
(567, 2, 1502329914, 'assign', 'maxattempts_locked', '', NULL),
(568, 2, 1502329914, 'assign', 'teamsubmission', '0', NULL),
(569, 2, 1502329914, 'assign', 'teamsubmission_adv', '', NULL),
(570, 2, 1502329914, 'assign', 'teamsubmission_locked', '', NULL),
(571, 2, 1502329914, 'assign', 'preventsubmissionnotingroup', '0', NULL),
(572, 2, 1502329914, 'assign', 'preventsubmissionnotingroup_adv', '', NULL),
(573, 2, 1502329914, 'assign', 'preventsubmissionnotingroup_locked', '', NULL),
(574, 2, 1502329914, 'assign', 'requireallteammemberssubmit', '0', NULL),
(575, 2, 1502329914, 'assign', 'requireallteammemberssubmit_adv', '', NULL),
(576, 2, 1502329914, 'assign', 'requireallteammemberssubmit_locked', '', NULL),
(577, 2, 1502329915, 'assign', 'teamsubmissiongroupingid', '', NULL),
(578, 2, 1502329915, 'assign', 'teamsubmissiongroupingid_adv', '', NULL),
(579, 2, 1502329915, 'assign', 'sendnotifications', '0', NULL),
(580, 2, 1502329915, 'assign', 'sendnotifications_adv', '', NULL),
(581, 2, 1502329915, 'assign', 'sendnotifications_locked', '', NULL),
(582, 2, 1502329915, 'assign', 'sendlatenotifications', '0', NULL),
(583, 2, 1502329915, 'assign', 'sendlatenotifications_adv', '', NULL),
(584, 2, 1502329915, 'assign', 'sendlatenotifications_locked', '', NULL),
(585, 2, 1502329915, 'assign', 'sendstudentnotifications', '1', NULL),
(586, 2, 1502329915, 'assign', 'sendstudentnotifications_adv', '', NULL),
(587, 2, 1502329915, 'assign', 'sendstudentnotifications_locked', '', NULL),
(588, 2, 1502329915, 'assign', 'blindmarking', '0', NULL),
(589, 2, 1502329915, 'assign', 'blindmarking_adv', '', NULL),
(590, 2, 1502329915, 'assign', 'blindmarking_locked', '', NULL),
(591, 2, 1502329915, 'assign', 'markingworkflow', '0', NULL),
(592, 2, 1502329916, 'assign', 'markingworkflow_adv', '', NULL),
(593, 2, 1502329916, 'assign', 'markingworkflow_locked', '', NULL),
(594, 2, 1502329916, 'assign', 'markingallocation', '0', NULL),
(595, 2, 1502329916, 'assign', 'markingallocation_adv', '', NULL),
(596, 2, 1502329916, 'assign', 'markingallocation_locked', '', NULL),
(597, 2, 1502329916, 'assignsubmission_file', 'default', '1', NULL),
(598, 2, 1502329916, 'assignsubmission_file', 'maxfiles', '20', NULL),
(599, 2, 1502329916, 'assignsubmission_file', 'filetypes', '', NULL),
(600, 2, 1502329916, 'assignsubmission_file', 'maxbytes', '0', NULL),
(601, 2, 1502329916, 'assignsubmission_onlinetext', 'default', '0', NULL),
(602, 2, 1502329916, 'assignfeedback_comments', 'default', '1', NULL),
(603, 2, 1502329916, 'assignfeedback_comments', 'inline', '0', NULL),
(604, 2, 1502329916, 'assignfeedback_comments', 'inline_adv', '', NULL),
(605, 2, 1502329916, 'assignfeedback_comments', 'inline_locked', '', NULL),
(606, 2, 1502329916, 'assignfeedback_editpdf', 'stamps', '', NULL),
(607, 2, 1502329917, 'assignfeedback_file', 'default', '0', NULL),
(608, 2, 1502329917, 'assignfeedback_offline', 'default', '0', NULL),
(609, 2, 1502329917, 'book', 'numberingoptions', '0,1,2,3', NULL),
(610, 2, 1502329917, 'book', 'navoptions', '0,1,2', NULL),
(611, 2, 1502329917, 'book', 'numbering', '1', NULL),
(612, 2, 1502329917, 'book', 'navstyle', '1', NULL),
(613, 2, 1502329917, NULL, 'chat_method', 'ajax', NULL),
(614, 2, 1502329917, NULL, 'chat_refresh_userlist', '10', NULL),
(615, 2, 1502329917, NULL, 'chat_old_ping', '35', NULL),
(616, 2, 1502329917, NULL, 'chat_refresh_room', '5', NULL),
(617, 2, 1502329917, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(618, 2, 1502329917, NULL, 'chat_serverhost', 'localhost', NULL),
(619, 2, 1502329917, NULL, 'chat_serverip', '127.0.0.1', NULL),
(620, 2, 1502329918, NULL, 'chat_serverport', '9111', NULL),
(621, 2, 1502329918, NULL, 'chat_servermax', '100', NULL),
(622, 2, 1502329918, NULL, 'data_enablerssfeeds', '0', NULL),
(623, 2, 1502329918, NULL, 'feedback_allowfullanonymous', '0', NULL),
(624, 2, 1502329918, 'resource', 'framesize', '130', NULL),
(625, 2, 1502329918, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(626, 2, 1502329918, 'resource', 'printintro', '1', NULL),
(627, 2, 1502329918, 'resource', 'display', '0', NULL),
(628, 2, 1502329918, 'resource', 'showsize', '0', NULL),
(629, 2, 1502329918, 'resource', 'showtype', '0', NULL),
(630, 2, 1502329918, 'resource', 'showdate', '0', NULL),
(631, 2, 1502329918, 'resource', 'popupwidth', '620', NULL),
(632, 2, 1502329919, 'resource', 'popupheight', '450', NULL),
(633, 2, 1502329919, 'resource', 'filterfiles', '0', NULL),
(634, 2, 1502329919, 'folder', 'showexpanded', '1', NULL),
(635, 2, 1502329919, 'folder', 'maxsizetodownload', '0', NULL),
(636, 2, 1502329919, NULL, 'forum_displaymode', '3', NULL),
(637, 2, 1502329919, NULL, 'forum_shortpost', '300', NULL),
(638, 2, 1502329919, NULL, 'forum_longpost', '600', NULL),
(639, 2, 1502329919, NULL, 'forum_manydiscussions', '100', NULL),
(640, 2, 1502329919, NULL, 'forum_maxbytes', '512000', NULL),
(641, 2, 1502329919, NULL, 'forum_maxattachments', '9', NULL),
(642, 2, 1502329919, NULL, 'forum_subscription', '0', NULL),
(643, 2, 1502329919, NULL, 'forum_trackingtype', '1', NULL),
(644, 2, 1502329920, NULL, 'forum_trackreadposts', '1', NULL),
(645, 2, 1502329920, NULL, 'forum_allowforcedreadtracking', '0', NULL),
(646, 2, 1502329920, NULL, 'forum_oldpostdays', '14', NULL),
(647, 2, 1502329920, NULL, 'forum_usermarksread', '0', NULL),
(648, 2, 1502329920, NULL, 'forum_cleanreadtime', '2', NULL),
(649, 2, 1502329920, NULL, 'digestmailtime', '17', NULL),
(650, 2, 1502329920, NULL, 'forum_enablerssfeeds', '0', NULL),
(651, 2, 1502329920, NULL, 'forum_enabletimedposts', '1', NULL),
(652, 2, 1502329920, NULL, 'glossary_entbypage', '10', NULL),
(653, 2, 1502329921, NULL, 'glossary_dupentries', '0', NULL),
(654, 2, 1502329921, NULL, 'glossary_allowcomments', '0', NULL),
(655, 2, 1502329921, NULL, 'glossary_linkbydefault', '1', NULL),
(656, 2, 1502329921, NULL, 'glossary_defaultapproval', '1', NULL),
(657, 2, 1502329921, NULL, 'glossary_enablerssfeeds', '0', NULL),
(658, 2, 1502329921, NULL, 'glossary_linkentries', '0', NULL),
(659, 2, 1502329921, NULL, 'glossary_casesensitive', '0', NULL),
(660, 2, 1502329921, NULL, 'glossary_fullmatch', '0', NULL),
(661, 2, 1502329921, 'imscp', 'keepold', '1', NULL),
(662, 2, 1502329921, 'imscp', 'keepold_adv', '', NULL),
(663, 2, 1502329921, 'label', 'dndmedia', '1', NULL),
(664, 2, 1502329921, 'label', 'dndresizewidth', '400', NULL),
(665, 2, 1502329921, 'label', 'dndresizeheight', '400', NULL),
(666, 2, 1502329922, 'mod_lesson', 'mediafile', '', NULL),
(667, 2, 1502329922, 'mod_lesson', 'mediafile_adv', '1', NULL),
(668, 2, 1502329922, 'mod_lesson', 'mediawidth', '640', NULL),
(669, 2, 1502329922, 'mod_lesson', 'mediaheight', '480', NULL),
(670, 2, 1502329922, 'mod_lesson', 'mediaclose', '0', NULL),
(671, 2, 1502329922, 'mod_lesson', 'progressbar', '0', NULL),
(672, 2, 1502329922, 'mod_lesson', 'progressbar_adv', '', NULL),
(673, 2, 1502329922, 'mod_lesson', 'ongoing', '0', NULL),
(674, 2, 1502329922, 'mod_lesson', 'ongoing_adv', '1', NULL),
(675, 2, 1502329922, 'mod_lesson', 'displayleftmenu', '0', NULL),
(676, 2, 1502329922, 'mod_lesson', 'displayleftmenu_adv', '', NULL),
(677, 2, 1502329922, 'mod_lesson', 'displayleftif', '0', NULL),
(678, 2, 1502329922, 'mod_lesson', 'displayleftif_adv', '1', NULL),
(679, 2, 1502329922, 'mod_lesson', 'slideshow', '0', NULL),
(680, 2, 1502329923, 'mod_lesson', 'slideshow_adv', '1', NULL),
(681, 2, 1502329923, 'mod_lesson', 'slideshowwidth', '640', NULL),
(682, 2, 1502329923, 'mod_lesson', 'slideshowheight', '480', NULL),
(683, 2, 1502329923, 'mod_lesson', 'slideshowbgcolor', '#FFFFFF', NULL),
(684, 2, 1502329923, 'mod_lesson', 'maxanswers', '5', NULL),
(685, 2, 1502329923, 'mod_lesson', 'maxanswers_adv', '1', NULL),
(686, 2, 1502329923, 'mod_lesson', 'defaultfeedback', '0', NULL),
(687, 2, 1502329923, 'mod_lesson', 'defaultfeedback_adv', '1', NULL),
(688, 2, 1502329923, 'mod_lesson', 'activitylink', '', NULL),
(689, 2, 1502329923, 'mod_lesson', 'activitylink_adv', '1', NULL),
(690, 2, 1502329923, 'mod_lesson', 'timelimit', '0', NULL),
(691, 2, 1502329923, 'mod_lesson', 'timelimit_adv', '', NULL),
(692, 2, 1502329923, 'mod_lesson', 'password', '0', NULL),
(693, 2, 1502329923, 'mod_lesson', 'password_adv', '1', NULL),
(694, 2, 1502329924, 'mod_lesson', 'modattempts', '0', NULL),
(695, 2, 1502329924, 'mod_lesson', 'modattempts_adv', '', NULL),
(696, 2, 1502329924, 'mod_lesson', 'displayreview', '0', NULL),
(697, 2, 1502329924, 'mod_lesson', 'displayreview_adv', '', NULL),
(698, 2, 1502329924, 'mod_lesson', 'maximumnumberofattempts', '1', NULL),
(699, 2, 1502329924, 'mod_lesson', 'maximumnumberofattempts_adv', '', NULL),
(700, 2, 1502329924, 'mod_lesson', 'defaultnextpage', '0', NULL),
(701, 2, 1502329924, 'mod_lesson', 'defaultnextpage_adv', '1', NULL),
(702, 2, 1502329924, 'mod_lesson', 'numberofpagestoshow', '1', NULL),
(703, 2, 1502329924, 'mod_lesson', 'numberofpagestoshow_adv', '1', NULL),
(704, 2, 1502329924, 'mod_lesson', 'practice', '0', NULL),
(705, 2, 1502329924, 'mod_lesson', 'practice_adv', '', NULL),
(706, 2, 1502329924, 'mod_lesson', 'customscoring', '1', NULL),
(707, 2, 1502329924, 'mod_lesson', 'customscoring_adv', '1', NULL),
(708, 2, 1502329925, 'mod_lesson', 'retakesallowed', '0', NULL),
(709, 2, 1502329925, 'mod_lesson', 'retakesallowed_adv', '', NULL),
(710, 2, 1502329925, 'mod_lesson', 'handlingofretakes', '0', NULL),
(711, 2, 1502329925, 'mod_lesson', 'handlingofretakes_adv', '1', NULL),
(712, 2, 1502329925, 'mod_lesson', 'minimumnumberofquestions', '0', NULL),
(713, 2, 1502329925, 'mod_lesson', 'minimumnumberofquestions_adv', '1', NULL),
(714, 2, 1502329925, 'page', 'displayoptions', '5', NULL),
(715, 2, 1502329925, 'page', 'printheading', '1', NULL),
(716, 2, 1502329925, 'page', 'printintro', '0', NULL),
(717, 2, 1502329925, 'page', 'display', '5', NULL),
(718, 2, 1502329925, 'page', 'popupwidth', '620', NULL),
(719, 2, 1502329925, 'page', 'popupheight', '450', NULL),
(720, 2, 1502329925, 'quiz', 'timelimit', '0', NULL),
(721, 2, 1502329925, 'quiz', 'timelimit_adv', '', NULL),
(722, 2, 1502329926, 'quiz', 'overduehandling', 'autosubmit', NULL),
(723, 2, 1502329926, 'quiz', 'overduehandling_adv', '', NULL);
INSERT DELAYED IGNORE INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(724, 2, 1502329926, 'quiz', 'graceperiod', '86400', NULL),
(725, 2, 1502329926, 'quiz', 'graceperiod_adv', '', NULL),
(726, 2, 1502329926, 'quiz', 'graceperiodmin', '60', NULL),
(727, 2, 1502329926, 'quiz', 'attempts', '0', NULL),
(728, 2, 1502329926, 'quiz', 'attempts_adv', '', NULL),
(729, 2, 1502329926, 'quiz', 'grademethod', '1', NULL),
(730, 2, 1502329926, 'quiz', 'grademethod_adv', '', NULL),
(731, 2, 1502329926, 'quiz', 'maximumgrade', '10', NULL),
(732, 2, 1502329926, 'quiz', 'questionsperpage', '1', NULL),
(733, 2, 1502329926, 'quiz', 'questionsperpage_adv', '', NULL),
(734, 2, 1502329926, 'quiz', 'navmethod', 'free', NULL),
(735, 2, 1502329926, 'quiz', 'navmethod_adv', '1', NULL),
(736, 2, 1502329926, 'quiz', 'shuffleanswers', '1', NULL),
(737, 2, 1502329927, 'quiz', 'shuffleanswers_adv', '', NULL),
(738, 2, 1502329927, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(739, 2, 1502329927, 'quiz', 'canredoquestions', '0', NULL),
(740, 2, 1502329927, 'quiz', 'canredoquestions_adv', '1', NULL),
(741, 2, 1502329927, 'quiz', 'attemptonlast', '0', NULL),
(742, 2, 1502329927, 'quiz', 'attemptonlast_adv', '1', NULL),
(743, 2, 1502329927, 'quiz', 'reviewattempt', '69904', NULL),
(744, 2, 1502329927, 'quiz', 'reviewcorrectness', '69904', NULL),
(745, 2, 1502329927, 'quiz', 'reviewmarks', '69904', NULL),
(746, 2, 1502329927, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(747, 2, 1502329927, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(748, 2, 1502329927, 'quiz', 'reviewrightanswer', '69904', NULL),
(749, 2, 1502329927, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(750, 2, 1502329928, 'quiz', 'showuserpicture', '0', NULL),
(751, 2, 1502329928, 'quiz', 'showuserpicture_adv', '', NULL),
(752, 2, 1502329928, 'quiz', 'decimalpoints', '2', NULL),
(753, 2, 1502329928, 'quiz', 'decimalpoints_adv', '', NULL),
(754, 2, 1502329928, 'quiz', 'questiondecimalpoints', '-1', NULL),
(755, 2, 1502329928, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(756, 2, 1502329928, 'quiz', 'showblocks', '0', NULL),
(757, 2, 1502329928, 'quiz', 'showblocks_adv', '1', NULL),
(758, 2, 1502329928, 'quiz', 'password', '', NULL),
(759, 2, 1502329928, 'quiz', 'password_adv', '', NULL),
(760, 2, 1502329928, 'quiz', 'subnet', '', NULL),
(761, 2, 1502329928, 'quiz', 'subnet_adv', '1', NULL),
(762, 2, 1502329928, 'quiz', 'delay1', '0', NULL),
(763, 2, 1502329928, 'quiz', 'delay1_adv', '1', NULL),
(764, 2, 1502329929, 'quiz', 'delay2', '0', NULL),
(765, 2, 1502329929, 'quiz', 'delay2_adv', '1', NULL),
(766, 2, 1502329929, 'quiz', 'browsersecurity', '-', NULL),
(767, 2, 1502329929, 'quiz', 'browsersecurity_adv', '1', NULL),
(768, 2, 1502329929, 'quiz', 'initialnumfeedbacks', '2', NULL),
(769, 2, 1502329929, 'quiz', 'autosaveperiod', '60', NULL),
(770, 2, 1502329929, 'scorm', 'displaycoursestructure', '0', NULL),
(771, 2, 1502329929, 'scorm', 'displaycoursestructure_adv', '', NULL),
(772, 2, 1502329929, 'scorm', 'popup', '0', NULL),
(773, 2, 1502329929, 'scorm', 'popup_adv', '', NULL),
(774, 2, 1502329929, 'scorm', 'displayactivityname', '1', NULL),
(775, 2, 1502329929, 'scorm', 'framewidth', '100', NULL),
(776, 2, 1502329930, 'scorm', 'framewidth_adv', '1', NULL),
(777, 2, 1502329930, 'scorm', 'frameheight', '500', NULL),
(778, 2, 1502329930, 'scorm', 'frameheight_adv', '1', NULL),
(779, 2, 1502329930, 'scorm', 'winoptgrp_adv', '1', NULL),
(780, 2, 1502329930, 'scorm', 'scrollbars', '0', NULL),
(781, 2, 1502329930, 'scorm', 'directories', '0', NULL),
(782, 2, 1502329930, 'scorm', 'location', '0', NULL),
(783, 2, 1502329930, 'scorm', 'menubar', '0', NULL),
(784, 2, 1502329930, 'scorm', 'toolbar', '0', NULL),
(785, 2, 1502329930, 'scorm', 'status', '0', NULL),
(786, 2, 1502329930, 'scorm', 'skipview', '0', NULL),
(787, 2, 1502329930, 'scorm', 'skipview_adv', '1', NULL),
(788, 2, 1502329930, 'scorm', 'hidebrowse', '0', NULL),
(789, 2, 1502329930, 'scorm', 'hidebrowse_adv', '1', NULL),
(790, 2, 1502329931, 'scorm', 'hidetoc', '0', NULL),
(791, 2, 1502329931, 'scorm', 'hidetoc_adv', '1', NULL),
(792, 2, 1502329931, 'scorm', 'nav', '1', NULL),
(793, 2, 1502329931, 'scorm', 'nav_adv', '1', NULL),
(794, 2, 1502329931, 'scorm', 'navpositionleft', '-100', NULL),
(795, 2, 1502329931, 'scorm', 'navpositionleft_adv', '1', NULL),
(796, 2, 1502329931, 'scorm', 'navpositiontop', '-100', NULL),
(797, 2, 1502329931, 'scorm', 'navpositiontop_adv', '1', NULL),
(798, 2, 1502329931, 'scorm', 'collapsetocwinsize', '767', NULL),
(799, 2, 1502329931, 'scorm', 'collapsetocwinsize_adv', '1', NULL),
(800, 2, 1502329931, 'scorm', 'displayattemptstatus', '1', NULL),
(801, 2, 1502329931, 'scorm', 'displayattemptstatus_adv', '', NULL),
(802, 2, 1502329931, 'scorm', 'grademethod', '1', NULL),
(803, 2, 1502329931, 'scorm', 'maxgrade', '100', NULL),
(804, 2, 1502329931, 'scorm', 'maxattempt', '0', NULL),
(805, 2, 1502329931, 'scorm', 'whatgrade', '0', NULL),
(806, 2, 1502329931, 'scorm', 'forcecompleted', '0', NULL),
(807, 2, 1502329932, 'scorm', 'forcenewattempt', '0', NULL),
(808, 2, 1502329932, 'scorm', 'autocommit', '0', NULL),
(809, 2, 1502329932, 'scorm', 'masteryoverride', '1', NULL),
(810, 2, 1502329932, 'scorm', 'lastattemptlock', '0', NULL),
(811, 2, 1502329932, 'scorm', 'auto', '0', NULL),
(812, 2, 1502329932, 'scorm', 'updatefreq', '0', NULL),
(813, 2, 1502329932, 'scorm', 'scorm12standard', '1', NULL),
(814, 2, 1502329932, 'scorm', 'allowtypeexternal', '0', NULL),
(815, 2, 1502329932, 'scorm', 'allowtypelocalsync', '0', NULL),
(816, 2, 1502329932, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(817, 2, 1502329932, 'scorm', 'allowaicchacp', '0', NULL),
(818, 2, 1502329932, 'scorm', 'aicchacptimeout', '30', NULL),
(819, 2, 1502329932, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(820, 2, 1502329932, 'scorm', 'aiccuserid', '1', NULL),
(821, 2, 1502329932, 'scorm', 'forcejavascript', '1', NULL),
(822, 2, 1502329932, 'scorm', 'allowapidebug', '0', NULL),
(823, 2, 1502329933, 'scorm', 'apidebugmask', '.*', NULL),
(824, 2, 1502329933, 'scorm', 'protectpackagedownloads', '0', NULL),
(825, 2, 1502329933, 'url', 'framesize', '130', NULL),
(826, 2, 1502329933, 'url', 'secretphrase', '', NULL),
(827, 2, 1502329933, 'url', 'rolesinparams', '0', NULL),
(828, 2, 1502329933, 'url', 'displayoptions', '0,1,5,6', NULL),
(829, 2, 1502329933, 'url', 'printintro', '1', NULL),
(830, 2, 1502329933, 'url', 'display', '0', NULL),
(831, 2, 1502329933, 'url', 'popupwidth', '620', NULL),
(832, 2, 1502329933, 'url', 'popupheight', '450', NULL),
(833, 2, 1502329933, 'workshop', 'grade', '80', NULL),
(834, 2, 1502329933, 'workshop', 'gradinggrade', '20', NULL),
(835, 2, 1502329933, 'workshop', 'gradedecimals', '0', NULL),
(836, 2, 1502329933, 'workshop', 'maxbytes', '0', NULL),
(837, 2, 1502329933, 'workshop', 'strategy', 'accumulative', NULL),
(838, 2, 1502329934, 'workshop', 'examplesmode', '0', NULL),
(839, 2, 1502329934, 'workshopallocation_random', 'numofreviews', '5', NULL),
(840, 2, 1502329934, 'workshopform_numerrors', 'grade0', 'No', NULL),
(841, 2, 1502329934, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(842, 2, 1502329934, 'workshopeval_best', 'comparison', '5', NULL),
(843, 2, 1502329934, 'tool_recyclebin', 'coursebinenable', '1', NULL),
(844, 2, 1502329934, 'tool_recyclebin', 'coursebinexpiry', '604800', NULL),
(845, 2, 1502329934, 'tool_recyclebin', 'categorybinenable', '1', NULL),
(846, 2, 1502329934, 'tool_recyclebin', 'categorybinexpiry', '604800', NULL),
(847, 2, 1502329934, 'tool_recyclebin', 'autohide', '1', NULL),
(848, 2, 1502329934, 'antivirus_clamav', 'runningmethod', 'commandline', NULL),
(849, 2, 1502329934, 'antivirus_clamav', 'pathtoclam', '', NULL),
(850, 2, 1502329934, 'antivirus_clamav', 'pathtounixsocket', '', NULL),
(851, 2, 1502329934, 'antivirus_clamav', 'clamfailureonupload', 'donothing', NULL),
(852, 2, 1502329934, 'auth_cas', 'hostname', '', NULL),
(853, 2, 1502329935, 'auth_cas', 'baseuri', '', NULL),
(854, 2, 1502329935, 'auth_cas', 'port', '0', NULL),
(855, 2, 1502329935, 'auth_cas', 'casversion', '2.0', NULL),
(856, 2, 1502329935, 'auth_cas', 'language', 'CAS_Languages_English', NULL),
(857, 2, 1502329935, 'auth_cas', 'proxycas', '0', NULL),
(858, 2, 1502329935, 'auth_cas', 'logoutcas', '0', NULL),
(859, 2, 1502329935, 'auth_cas', 'multiauth', '0', NULL),
(860, 2, 1502329935, 'auth_cas', 'certificate_check', '0', NULL),
(861, 2, 1502329935, 'auth_cas', 'certificate_path', '', NULL),
(862, 2, 1502329935, 'auth_cas', 'curl_ssl_version', '', NULL),
(863, 2, 1502329935, 'auth_cas', 'logout_return_url', '', NULL),
(864, 2, 1502329935, 'auth_cas', 'host_url', '', NULL),
(865, 2, 1502329935, 'auth_cas', 'ldap_version', '3', NULL),
(866, 2, 1502329935, 'auth_cas', 'start_tls', '0', NULL),
(867, 2, 1502329935, 'auth_cas', 'ldapencoding', 'utf-8', NULL),
(868, 2, 1502329935, 'auth_cas', 'pagesize', '250', NULL),
(869, 2, 1502329936, 'auth_cas', 'bind_dn', '', NULL),
(870, 2, 1502329936, 'auth_cas', 'bind_pw', '', NULL),
(871, 2, 1502329936, 'auth_cas', 'user_type', 'default', NULL),
(872, 2, 1502329936, 'auth_cas', 'contexts', '', NULL),
(873, 2, 1502329936, 'auth_cas', 'search_sub', '0', NULL),
(874, 2, 1502329936, 'auth_cas', 'opt_deref', '0', NULL),
(875, 2, 1502329936, 'auth_cas', 'user_attribute', '', NULL),
(876, 2, 1502329936, 'auth_cas', 'memberattribute', '', NULL),
(877, 2, 1502329936, 'auth_cas', 'memberattribute_isdn', '', NULL),
(878, 2, 1502329936, 'auth_cas', 'objectclass', '', NULL),
(879, 2, 1502329936, 'auth_cas', 'attrcreators', '', NULL),
(880, 2, 1502329936, 'auth_cas', 'groupecreators', '', NULL),
(881, 2, 1502329936, 'auth_cas', 'removeuser', '0', NULL),
(882, 2, 1502329936, 'auth_cas', 'field_map_firstname', '', NULL),
(883, 2, 1502329936, 'auth_cas', 'field_updatelocal_firstname', 'oncreate', NULL),
(884, 2, 1502329936, 'auth_cas', 'field_updateremote_firstname', '0', NULL),
(885, 2, 1502329937, 'auth_cas', 'field_lock_firstname', 'unlocked', NULL),
(886, 2, 1502329937, 'auth_cas', 'field_map_lastname', '', NULL),
(887, 2, 1502329937, 'auth_cas', 'field_updatelocal_lastname', 'oncreate', NULL),
(888, 2, 1502329937, 'auth_cas', 'field_updateremote_lastname', '0', NULL),
(889, 2, 1502329937, 'auth_cas', 'field_lock_lastname', 'unlocked', NULL),
(890, 2, 1502329937, 'auth_cas', 'field_map_email', '', NULL),
(891, 2, 1502329937, 'auth_cas', 'field_updatelocal_email', 'oncreate', NULL),
(892, 2, 1502329937, 'auth_cas', 'field_updateremote_email', '0', NULL),
(893, 2, 1502329937, 'auth_cas', 'field_lock_email', 'unlocked', NULL),
(894, 2, 1502329937, 'auth_cas', 'field_map_city', '', NULL),
(895, 2, 1502329937, 'auth_cas', 'field_updatelocal_city', 'oncreate', NULL),
(896, 2, 1502329937, 'auth_cas', 'field_updateremote_city', '0', NULL),
(897, 2, 1502329937, 'auth_cas', 'field_lock_city', 'unlocked', NULL),
(898, 2, 1502329937, 'auth_cas', 'field_map_country', '', NULL),
(899, 2, 1502329937, 'auth_cas', 'field_updatelocal_country', 'oncreate', NULL),
(900, 2, 1502329938, 'auth_cas', 'field_updateremote_country', '0', NULL),
(901, 2, 1502329938, 'auth_cas', 'field_lock_country', 'unlocked', NULL),
(902, 2, 1502329938, 'auth_cas', 'field_map_lang', '', NULL),
(903, 2, 1502329938, 'auth_cas', 'field_updatelocal_lang', 'oncreate', NULL),
(904, 2, 1502329938, 'auth_cas', 'field_updateremote_lang', '0', NULL),
(905, 2, 1502329938, 'auth_cas', 'field_lock_lang', 'unlocked', NULL),
(906, 2, 1502329938, 'auth_cas', 'field_map_description', '', NULL),
(907, 2, 1502329938, 'auth_cas', 'field_updatelocal_description', 'oncreate', NULL),
(908, 2, 1502329938, 'auth_cas', 'field_updateremote_description', '0', NULL),
(909, 2, 1502329938, 'auth_cas', 'field_lock_description', 'unlocked', NULL),
(910, 2, 1502329938, 'auth_cas', 'field_map_url', '', NULL),
(911, 2, 1502329938, 'auth_cas', 'field_updatelocal_url', 'oncreate', NULL),
(912, 2, 1502329938, 'auth_cas', 'field_updateremote_url', '0', NULL),
(913, 2, 1502329938, 'auth_cas', 'field_lock_url', 'unlocked', NULL),
(914, 2, 1502329938, 'auth_cas', 'field_map_idnumber', '', NULL),
(915, 2, 1502329939, 'auth_cas', 'field_updatelocal_idnumber', 'oncreate', NULL),
(916, 2, 1502329939, 'auth_cas', 'field_updateremote_idnumber', '0', NULL),
(917, 2, 1502329939, 'auth_cas', 'field_lock_idnumber', 'unlocked', NULL),
(918, 2, 1502329939, 'auth_cas', 'field_map_institution', '', NULL),
(919, 2, 1502329939, 'auth_cas', 'field_updatelocal_institution', 'oncreate', NULL),
(920, 2, 1502329939, 'auth_cas', 'field_updateremote_institution', '0', NULL),
(921, 2, 1502329939, 'auth_cas', 'field_lock_institution', 'unlocked', NULL),
(922, 2, 1502329939, 'auth_cas', 'field_map_department', '', NULL),
(923, 2, 1502329939, 'auth_cas', 'field_updatelocal_department', 'oncreate', NULL),
(924, 2, 1502329939, 'auth_cas', 'field_updateremote_department', '0', NULL),
(925, 2, 1502329939, 'auth_cas', 'field_lock_department', 'unlocked', NULL),
(926, 2, 1502329939, 'auth_cas', 'field_map_phone1', '', NULL),
(927, 2, 1502329939, 'auth_cas', 'field_updatelocal_phone1', 'oncreate', NULL),
(928, 2, 1502329939, 'auth_cas', 'field_updateremote_phone1', '0', NULL),
(929, 2, 1502329940, 'auth_cas', 'field_lock_phone1', 'unlocked', NULL),
(930, 2, 1502329940, 'auth_cas', 'field_map_phone2', '', NULL),
(931, 2, 1502329940, 'auth_cas', 'field_updatelocal_phone2', 'oncreate', NULL),
(932, 2, 1502329940, 'auth_cas', 'field_updateremote_phone2', '0', NULL),
(933, 2, 1502329940, 'auth_cas', 'field_lock_phone2', 'unlocked', NULL),
(934, 2, 1502329940, 'auth_cas', 'field_map_address', '', NULL),
(935, 2, 1502329940, 'auth_cas', 'field_updatelocal_address', 'oncreate', NULL),
(936, 2, 1502329940, 'auth_cas', 'field_updateremote_address', '0', NULL),
(937, 2, 1502329940, 'auth_cas', 'field_lock_address', 'unlocked', NULL),
(938, 2, 1502329940, 'auth_cas', 'field_map_firstnamephonetic', '', NULL),
(939, 2, 1502329940, 'auth_cas', 'field_updatelocal_firstnamephonetic', 'oncreate', NULL),
(940, 2, 1502329940, 'auth_cas', 'field_updateremote_firstnamephonetic', '0', NULL),
(941, 2, 1502329940, 'auth_cas', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(942, 2, 1502329940, 'auth_cas', 'field_map_lastnamephonetic', '', NULL),
(943, 2, 1502329940, 'auth_cas', 'field_updatelocal_lastnamephonetic', 'oncreate', NULL),
(944, 2, 1502329940, 'auth_cas', 'field_updateremote_lastnamephonetic', '0', NULL),
(945, 2, 1502329941, 'auth_cas', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(946, 2, 1502329941, 'auth_cas', 'field_map_middlename', '', NULL),
(947, 2, 1502329941, 'auth_cas', 'field_updatelocal_middlename', 'oncreate', NULL),
(948, 2, 1502329941, 'auth_cas', 'field_updateremote_middlename', '0', NULL),
(949, 2, 1502329941, 'auth_cas', 'field_lock_middlename', 'unlocked', NULL),
(950, 2, 1502329941, 'auth_cas', 'field_map_alternatename', '', NULL),
(951, 2, 1502329941, 'auth_cas', 'field_updatelocal_alternatename', 'oncreate', NULL),
(952, 2, 1502329941, 'auth_cas', 'field_updateremote_alternatename', '0', NULL),
(953, 2, 1502329941, 'auth_cas', 'field_lock_alternatename', 'unlocked', NULL),
(954, 2, 1502329941, 'auth_email', 'recaptcha', '0', NULL),
(955, 2, 1502329941, 'auth_email', 'field_lock_firstname', 'unlocked', NULL),
(956, 2, 1502329941, 'auth_email', 'field_lock_lastname', 'unlocked', NULL),
(957, 2, 1502329941, 'auth_email', 'field_lock_email', 'unlocked', NULL),
(958, 2, 1502329941, 'auth_email', 'field_lock_city', 'unlocked', NULL),
(959, 2, 1502329941, 'auth_email', 'field_lock_country', 'unlocked', NULL),
(960, 2, 1502329942, 'auth_email', 'field_lock_lang', 'unlocked', NULL),
(961, 2, 1502329942, 'auth_email', 'field_lock_description', 'unlocked', NULL),
(962, 2, 1502329942, 'auth_email', 'field_lock_url', 'unlocked', NULL),
(963, 2, 1502329942, 'auth_email', 'field_lock_idnumber', 'unlocked', NULL),
(964, 2, 1502329942, 'auth_email', 'field_lock_institution', 'unlocked', NULL),
(965, 2, 1502329942, 'auth_email', 'field_lock_department', 'unlocked', NULL),
(966, 2, 1502329942, 'auth_email', 'field_lock_phone1', 'unlocked', NULL),
(967, 2, 1502329942, 'auth_email', 'field_lock_phone2', 'unlocked', NULL),
(968, 2, 1502329942, 'auth_email', 'field_lock_address', 'unlocked', NULL),
(969, 2, 1502329942, 'auth_email', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(970, 2, 1502329942, 'auth_email', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(971, 2, 1502329942, 'auth_email', 'field_lock_middlename', 'unlocked', NULL),
(972, 2, 1502329942, 'auth_email', 'field_lock_alternatename', 'unlocked', NULL),
(973, 2, 1502329942, 'auth_db', 'host', '127.0.0.1', NULL),
(974, 2, 1502329942, 'auth_db', 'type', 'mysqli', NULL),
(975, 2, 1502329942, 'auth_db', 'sybasequoting', '0', NULL),
(976, 2, 1502329943, 'auth_db', 'name', '', NULL),
(977, 2, 1502329943, 'auth_db', 'user', '', NULL),
(978, 2, 1502329943, 'auth_db', 'pass', '', NULL),
(979, 2, 1502329943, 'auth_db', 'table', '', NULL),
(980, 2, 1502329943, 'auth_db', 'fielduser', '', NULL),
(981, 2, 1502329943, 'auth_db', 'fieldpass', '', NULL),
(982, 2, 1502329943, 'auth_db', 'passtype', 'plaintext', NULL),
(983, 2, 1502329943, 'auth_db', 'extencoding', 'utf-8', NULL),
(984, 2, 1502329943, 'auth_db', 'setupsql', '', NULL),
(985, 2, 1502329943, 'auth_db', 'debugauthdb', '0', NULL),
(986, 2, 1502329943, 'auth_db', 'changepasswordurl', '', NULL),
(987, 2, 1502329943, 'auth_db', 'removeuser', '0', NULL),
(988, 2, 1502329943, 'auth_db', 'updateusers', '0', NULL),
(989, 2, 1502329943, 'auth_db', 'field_map_firstname', '', NULL),
(990, 2, 1502329944, 'auth_db', 'field_updatelocal_firstname', 'oncreate', NULL),
(991, 2, 1502329944, 'auth_db', 'field_updateremote_firstname', '0', NULL),
(992, 2, 1502329944, 'auth_db', 'field_lock_firstname', 'unlocked', NULL),
(993, 2, 1502329944, 'auth_db', 'field_map_lastname', '', NULL),
(994, 2, 1502329944, 'auth_db', 'field_updatelocal_lastname', 'oncreate', NULL),
(995, 2, 1502329944, 'auth_db', 'field_updateremote_lastname', '0', NULL),
(996, 2, 1502329944, 'auth_db', 'field_lock_lastname', 'unlocked', NULL),
(997, 2, 1502329944, 'auth_db', 'field_map_email', '', NULL),
(998, 2, 1502329944, 'auth_db', 'field_updatelocal_email', 'oncreate', NULL),
(999, 2, 1502329944, 'auth_db', 'field_updateremote_email', '0', NULL),
(1000, 2, 1502329944, 'auth_db', 'field_lock_email', 'unlocked', NULL),
(1001, 2, 1502329944, 'auth_db', 'field_map_city', '', NULL),
(1002, 2, 1502329944, 'auth_db', 'field_updatelocal_city', 'oncreate', NULL),
(1003, 2, 1502329944, 'auth_db', 'field_updateremote_city', '0', NULL),
(1004, 2, 1502329945, 'auth_db', 'field_lock_city', 'unlocked', NULL),
(1005, 2, 1502329945, 'auth_db', 'field_map_country', '', NULL),
(1006, 2, 1502329945, 'auth_db', 'field_updatelocal_country', 'oncreate', NULL),
(1007, 2, 1502329945, 'auth_db', 'field_updateremote_country', '0', NULL),
(1008, 2, 1502329945, 'auth_db', 'field_lock_country', 'unlocked', NULL),
(1009, 2, 1502329945, 'auth_db', 'field_map_lang', '', NULL),
(1010, 2, 1502329945, 'auth_db', 'field_updatelocal_lang', 'oncreate', NULL),
(1011, 2, 1502329945, 'auth_db', 'field_updateremote_lang', '0', NULL),
(1012, 2, 1502329945, 'auth_db', 'field_lock_lang', 'unlocked', NULL),
(1013, 2, 1502329945, 'auth_db', 'field_map_description', '', NULL),
(1014, 2, 1502329945, 'auth_db', 'field_updatelocal_description', 'oncreate', NULL),
(1015, 2, 1502329945, 'auth_db', 'field_updateremote_description', '0', NULL),
(1016, 2, 1502329945, 'auth_db', 'field_lock_description', 'unlocked', NULL),
(1017, 2, 1502329945, 'auth_db', 'field_map_url', '', NULL),
(1018, 2, 1502329945, 'auth_db', 'field_updatelocal_url', 'oncreate', NULL),
(1019, 2, 1502329945, 'auth_db', 'field_updateremote_url', '0', NULL),
(1020, 2, 1502329946, 'auth_db', 'field_lock_url', 'unlocked', NULL),
(1021, 2, 1502329946, 'auth_db', 'field_map_idnumber', '', NULL),
(1022, 2, 1502329946, 'auth_db', 'field_updatelocal_idnumber', 'oncreate', NULL),
(1023, 2, 1502329946, 'auth_db', 'field_updateremote_idnumber', '0', NULL),
(1024, 2, 1502329946, 'auth_db', 'field_lock_idnumber', 'unlocked', NULL),
(1025, 2, 1502329946, 'auth_db', 'field_map_institution', '', NULL),
(1026, 2, 1502329946, 'auth_db', 'field_updatelocal_institution', 'oncreate', NULL),
(1027, 2, 1502329946, 'auth_db', 'field_updateremote_institution', '0', NULL),
(1028, 2, 1502329946, 'auth_db', 'field_lock_institution', 'unlocked', NULL),
(1029, 2, 1502329946, 'auth_db', 'field_map_department', '', NULL),
(1030, 2, 1502329946, 'auth_db', 'field_updatelocal_department', 'oncreate', NULL),
(1031, 2, 1502329946, 'auth_db', 'field_updateremote_department', '0', NULL),
(1032, 2, 1502329946, 'auth_db', 'field_lock_department', 'unlocked', NULL),
(1033, 2, 1502329946, 'auth_db', 'field_map_phone1', '', NULL),
(1034, 2, 1502329946, 'auth_db', 'field_updatelocal_phone1', 'oncreate', NULL),
(1035, 2, 1502329946, 'auth_db', 'field_updateremote_phone1', '0', NULL),
(1036, 2, 1502329947, 'auth_db', 'field_lock_phone1', 'unlocked', NULL),
(1037, 2, 1502329947, 'auth_db', 'field_map_phone2', '', NULL),
(1038, 2, 1502329947, 'auth_db', 'field_updatelocal_phone2', 'oncreate', NULL),
(1039, 2, 1502329947, 'auth_db', 'field_updateremote_phone2', '0', NULL),
(1040, 2, 1502329947, 'auth_db', 'field_lock_phone2', 'unlocked', NULL),
(1041, 2, 1502329947, 'auth_db', 'field_map_address', '', NULL),
(1042, 2, 1502329947, 'auth_db', 'field_updatelocal_address', 'oncreate', NULL),
(1043, 2, 1502329947, 'auth_db', 'field_updateremote_address', '0', NULL),
(1044, 2, 1502329947, 'auth_db', 'field_lock_address', 'unlocked', NULL),
(1045, 2, 1502329947, 'auth_db', 'field_map_firstnamephonetic', '', NULL),
(1046, 2, 1502329947, 'auth_db', 'field_updatelocal_firstnamephonetic', 'oncreate', NULL),
(1047, 2, 1502329947, 'auth_db', 'field_updateremote_firstnamephonetic', '0', NULL),
(1048, 2, 1502329947, 'auth_db', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1049, 2, 1502329947, 'auth_db', 'field_map_lastnamephonetic', '', NULL),
(1050, 2, 1502329947, 'auth_db', 'field_updatelocal_lastnamephonetic', 'oncreate', NULL),
(1051, 2, 1502329947, 'auth_db', 'field_updateremote_lastnamephonetic', '0', NULL),
(1052, 2, 1502329947, 'auth_db', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1053, 2, 1502329948, 'auth_db', 'field_map_middlename', '', NULL),
(1054, 2, 1502329948, 'auth_db', 'field_updatelocal_middlename', 'oncreate', NULL),
(1055, 2, 1502329948, 'auth_db', 'field_updateremote_middlename', '0', NULL),
(1056, 2, 1502329948, 'auth_db', 'field_lock_middlename', 'unlocked', NULL),
(1057, 2, 1502329948, 'auth_db', 'field_map_alternatename', '', NULL),
(1058, 2, 1502329948, 'auth_db', 'field_updatelocal_alternatename', 'oncreate', NULL),
(1059, 2, 1502329948, 'auth_db', 'field_updateremote_alternatename', '0', NULL),
(1060, 2, 1502329948, 'auth_db', 'field_lock_alternatename', 'unlocked', NULL),
(1061, 2, 1502329948, 'auth_ldap', 'host_url', '', NULL),
(1062, 2, 1502329948, 'auth_ldap', 'ldap_version', '3', NULL),
(1063, 2, 1502329948, 'auth_ldap', 'start_tls', '0', NULL),
(1064, 2, 1502329948, 'auth_ldap', 'ldapencoding', 'utf-8', NULL),
(1065, 2, 1502329948, 'auth_ldap', 'pagesize', '250', NULL),
(1066, 2, 1502329948, 'auth_ldap', 'preventpassindb', '0', NULL),
(1067, 2, 1502329948, 'auth_ldap', 'bind_dn', '', NULL),
(1068, 2, 1502329948, 'auth_ldap', 'bind_pw', '', NULL),
(1069, 2, 1502329948, 'auth_ldap', 'user_type', 'default', NULL),
(1070, 2, 1502329949, 'auth_ldap', 'contexts', '', NULL),
(1071, 2, 1502329949, 'auth_ldap', 'search_sub', '0', NULL),
(1072, 2, 1502329949, 'auth_ldap', 'opt_deref', '0', NULL),
(1073, 2, 1502329949, 'auth_ldap', 'user_attribute', '', NULL),
(1074, 2, 1502329949, 'auth_ldap', 'suspended_attribute', '', NULL),
(1075, 2, 1502329949, 'auth_ldap', 'memberattribute', '', NULL),
(1076, 2, 1502329949, 'auth_ldap', 'memberattribute_isdn', '', NULL),
(1077, 2, 1502329949, 'auth_ldap', 'objectclass', '', NULL),
(1078, 2, 1502329949, 'auth_ldap', 'forcechangepassword', '0', NULL),
(1079, 2, 1502329949, 'auth_ldap', 'stdchangepassword', '0', NULL),
(1080, 2, 1502329949, 'auth_ldap', 'passtype', 'plaintext', NULL),
(1081, 2, 1502329949, 'auth_ldap', 'changepasswordurl', '', NULL),
(1082, 2, 1502329949, 'auth_ldap', 'expiration', '0', NULL),
(1083, 2, 1502329949, 'auth_ldap', 'expiration_warning', '', NULL),
(1084, 2, 1502329949, 'auth_ldap', 'expireattr', '', NULL),
(1085, 2, 1502329949, 'auth_ldap', 'gracelogins', '0', NULL),
(1086, 2, 1502329949, 'auth_ldap', 'graceattr', '', NULL),
(1087, 2, 1502329950, 'auth_ldap', 'auth_user_create', '0', NULL),
(1088, 2, 1502329950, 'auth_ldap', 'create_context', '', NULL),
(1089, 2, 1502329950, 'auth_ldap', 'managercontext', '', NULL),
(1090, 2, 1502329950, 'auth_ldap', 'coursecreatorcontext', '', NULL),
(1091, 2, 1502329950, 'auth_ldap', 'removeuser', '0', NULL),
(1092, 2, 1502329950, 'auth_ldap', 'sync_suspended', '0', NULL),
(1093, 2, 1502329950, 'auth_ldap', 'ntlmsso_enabled', '0', NULL),
(1094, 2, 1502329950, 'auth_ldap', 'ntlmsso_subnet', '', NULL),
(1095, 2, 1502329950, 'auth_ldap', 'ntlmsso_ie_fastpath', '0', NULL),
(1096, 2, 1502329950, 'auth_ldap', 'ntlmsso_type', 'ntlm', NULL),
(1097, 2, 1502329950, 'auth_ldap', 'ntlmsso_remoteuserformat', '', NULL),
(1098, 2, 1502329950, 'auth_ldap', 'field_map_firstname', '', NULL),
(1099, 2, 1502329950, 'auth_ldap', 'field_updatelocal_firstname', 'oncreate', NULL),
(1100, 2, 1502329950, 'auth_ldap', 'field_updateremote_firstname', '0', NULL),
(1101, 2, 1502329950, 'auth_ldap', 'field_lock_firstname', 'unlocked', NULL),
(1102, 2, 1502329950, 'auth_ldap', 'field_map_lastname', '', NULL),
(1103, 2, 1502329950, 'auth_ldap', 'field_updatelocal_lastname', 'oncreate', NULL),
(1104, 2, 1502329951, 'auth_ldap', 'field_updateremote_lastname', '0', NULL),
(1105, 2, 1502329951, 'auth_ldap', 'field_lock_lastname', 'unlocked', NULL),
(1106, 2, 1502329951, 'auth_ldap', 'field_map_email', '', NULL),
(1107, 2, 1502329951, 'auth_ldap', 'field_updatelocal_email', 'oncreate', NULL),
(1108, 2, 1502329951, 'auth_ldap', 'field_updateremote_email', '0', NULL),
(1109, 2, 1502329951, 'auth_ldap', 'field_lock_email', 'unlocked', NULL),
(1110, 2, 1502329951, 'auth_ldap', 'field_map_city', '', NULL),
(1111, 2, 1502329951, 'auth_ldap', 'field_updatelocal_city', 'oncreate', NULL),
(1112, 2, 1502329951, 'auth_ldap', 'field_updateremote_city', '0', NULL),
(1113, 2, 1502329951, 'auth_ldap', 'field_lock_city', 'unlocked', NULL),
(1114, 2, 1502329951, 'auth_ldap', 'field_map_country', '', NULL),
(1115, 2, 1502329951, 'auth_ldap', 'field_updatelocal_country', 'oncreate', NULL),
(1116, 2, 1502329951, 'auth_ldap', 'field_updateremote_country', '0', NULL),
(1117, 2, 1502329951, 'auth_ldap', 'field_lock_country', 'unlocked', NULL),
(1118, 2, 1502329951, 'auth_ldap', 'field_map_lang', '', NULL),
(1119, 2, 1502329951, 'auth_ldap', 'field_updatelocal_lang', 'oncreate', NULL),
(1120, 2, 1502329952, 'auth_ldap', 'field_updateremote_lang', '0', NULL),
(1121, 2, 1502329952, 'auth_ldap', 'field_lock_lang', 'unlocked', NULL),
(1122, 2, 1502329952, 'auth_ldap', 'field_map_description', '', NULL),
(1123, 2, 1502329952, 'auth_ldap', 'field_updatelocal_description', 'oncreate', NULL),
(1124, 2, 1502329952, 'auth_ldap', 'field_updateremote_description', '0', NULL),
(1125, 2, 1502329952, 'auth_ldap', 'field_lock_description', 'unlocked', NULL),
(1126, 2, 1502329952, 'auth_ldap', 'field_map_url', '', NULL),
(1127, 2, 1502329952, 'auth_ldap', 'field_updatelocal_url', 'oncreate', NULL),
(1128, 2, 1502329952, 'auth_ldap', 'field_updateremote_url', '0', NULL),
(1129, 2, 1502329952, 'auth_ldap', 'field_lock_url', 'unlocked', NULL),
(1130, 2, 1502329952, 'auth_ldap', 'field_map_idnumber', '', NULL),
(1131, 2, 1502329952, 'auth_ldap', 'field_updatelocal_idnumber', 'oncreate', NULL),
(1132, 2, 1502329952, 'auth_ldap', 'field_updateremote_idnumber', '0', NULL),
(1133, 2, 1502329952, 'auth_ldap', 'field_lock_idnumber', 'unlocked', NULL),
(1134, 2, 1502329953, 'auth_ldap', 'field_map_institution', '', NULL),
(1135, 2, 1502329953, 'auth_ldap', 'field_updatelocal_institution', 'oncreate', NULL),
(1136, 2, 1502329953, 'auth_ldap', 'field_updateremote_institution', '0', NULL),
(1137, 2, 1502329953, 'auth_ldap', 'field_lock_institution', 'unlocked', NULL),
(1138, 2, 1502329953, 'auth_ldap', 'field_map_department', '', NULL),
(1139, 2, 1502329953, 'auth_ldap', 'field_updatelocal_department', 'oncreate', NULL),
(1140, 2, 1502329953, 'auth_ldap', 'field_updateremote_department', '0', NULL),
(1141, 2, 1502329953, 'auth_ldap', 'field_lock_department', 'unlocked', NULL),
(1142, 2, 1502329953, 'auth_ldap', 'field_map_phone1', '', NULL),
(1143, 2, 1502329953, 'auth_ldap', 'field_updatelocal_phone1', 'oncreate', NULL),
(1144, 2, 1502329953, 'auth_ldap', 'field_updateremote_phone1', '0', NULL),
(1145, 2, 1502329953, 'auth_ldap', 'field_lock_phone1', 'unlocked', NULL),
(1146, 2, 1502329953, 'auth_ldap', 'field_map_phone2', '', NULL),
(1147, 2, 1502329953, 'auth_ldap', 'field_updatelocal_phone2', 'oncreate', NULL),
(1148, 2, 1502329953, 'auth_ldap', 'field_updateremote_phone2', '0', NULL),
(1149, 2, 1502329953, 'auth_ldap', 'field_lock_phone2', 'unlocked', NULL),
(1150, 2, 1502329954, 'auth_ldap', 'field_map_address', '', NULL),
(1151, 2, 1502329954, 'auth_ldap', 'field_updatelocal_address', 'oncreate', NULL),
(1152, 2, 1502329954, 'auth_ldap', 'field_updateremote_address', '0', NULL),
(1153, 2, 1502329954, 'auth_ldap', 'field_lock_address', 'unlocked', NULL),
(1154, 2, 1502329954, 'auth_ldap', 'field_map_firstnamephonetic', '', NULL),
(1155, 2, 1502329954, 'auth_ldap', 'field_updatelocal_firstnamephonetic', 'oncreate', NULL),
(1156, 2, 1502329954, 'auth_ldap', 'field_updateremote_firstnamephonetic', '0', NULL),
(1157, 2, 1502329954, 'auth_ldap', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1158, 2, 1502329954, 'auth_ldap', 'field_map_lastnamephonetic', '', NULL),
(1159, 2, 1502329954, 'auth_ldap', 'field_updatelocal_lastnamephonetic', 'oncreate', NULL),
(1160, 2, 1502329954, 'auth_ldap', 'field_updateremote_lastnamephonetic', '0', NULL),
(1161, 2, 1502329954, 'auth_ldap', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1162, 2, 1502329954, 'auth_ldap', 'field_map_middlename', '', NULL),
(1163, 2, 1502329954, 'auth_ldap', 'field_updatelocal_middlename', 'oncreate', NULL),
(1164, 2, 1502329954, 'auth_ldap', 'field_updateremote_middlename', '0', NULL),
(1165, 2, 1502329954, 'auth_ldap', 'field_lock_middlename', 'unlocked', NULL),
(1166, 2, 1502329955, 'auth_ldap', 'field_map_alternatename', '', NULL),
(1167, 2, 1502329955, 'auth_ldap', 'field_updatelocal_alternatename', 'oncreate', NULL),
(1168, 2, 1502329955, 'auth_ldap', 'field_updateremote_alternatename', '0', NULL),
(1169, 2, 1502329955, 'auth_ldap', 'field_lock_alternatename', 'unlocked', NULL),
(1170, 2, 1502329955, 'auth_manual', 'expiration', '0', NULL),
(1171, 2, 1502329955, 'auth_manual', 'expirationtime', '30', NULL),
(1172, 2, 1502329955, 'auth_manual', 'expiration_warning', '0', NULL),
(1173, 2, 1502329955, 'auth_manual', 'field_lock_firstname', 'unlocked', NULL),
(1174, 2, 1502329955, 'auth_manual', 'field_lock_lastname', 'unlocked', NULL),
(1175, 2, 1502329955, 'auth_manual', 'field_lock_email', 'unlocked', NULL),
(1176, 2, 1502329955, 'auth_manual', 'field_lock_city', 'unlocked', NULL),
(1177, 2, 1502329955, 'auth_manual', 'field_lock_country', 'unlocked', NULL),
(1178, 2, 1502329955, 'auth_manual', 'field_lock_lang', 'unlocked', NULL),
(1179, 2, 1502329955, 'auth_manual', 'field_lock_description', 'unlocked', NULL),
(1180, 2, 1502329955, 'auth_manual', 'field_lock_url', 'unlocked', NULL),
(1181, 2, 1502329955, 'auth_manual', 'field_lock_idnumber', 'unlocked', NULL),
(1182, 2, 1502329956, 'auth_manual', 'field_lock_institution', 'unlocked', NULL),
(1183, 2, 1502329956, 'auth_manual', 'field_lock_department', 'unlocked', NULL),
(1184, 2, 1502329956, 'auth_manual', 'field_lock_phone1', 'unlocked', NULL),
(1185, 2, 1502329956, 'auth_manual', 'field_lock_phone2', 'unlocked', NULL),
(1186, 2, 1502329956, 'auth_manual', 'field_lock_address', 'unlocked', NULL),
(1187, 2, 1502329956, 'auth_manual', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1188, 2, 1502329956, 'auth_manual', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1189, 2, 1502329956, 'auth_manual', 'field_lock_middlename', 'unlocked', NULL),
(1190, 2, 1502329956, 'auth_manual', 'field_lock_alternatename', 'unlocked', NULL),
(1191, 2, 1502329956, 'auth_mnet', 'rpc_negotiation_timeout', '30', NULL),
(1192, 2, 1502329956, 'auth_none', 'field_lock_firstname', 'unlocked', NULL),
(1193, 2, 1502329956, 'auth_none', 'field_lock_lastname', 'unlocked', NULL),
(1194, 2, 1502329956, 'auth_none', 'field_lock_email', 'unlocked', NULL),
(1195, 2, 1502329956, 'auth_none', 'field_lock_city', 'unlocked', NULL),
(1196, 2, 1502329957, 'auth_none', 'field_lock_country', 'unlocked', NULL),
(1197, 2, 1502329957, 'auth_none', 'field_lock_lang', 'unlocked', NULL),
(1198, 2, 1502329957, 'auth_none', 'field_lock_description', 'unlocked', NULL),
(1199, 2, 1502329957, 'auth_none', 'field_lock_url', 'unlocked', NULL),
(1200, 2, 1502329957, 'auth_none', 'field_lock_idnumber', 'unlocked', NULL),
(1201, 2, 1502329957, 'auth_none', 'field_lock_institution', 'unlocked', NULL),
(1202, 2, 1502329957, 'auth_none', 'field_lock_department', 'unlocked', NULL),
(1203, 2, 1502329957, 'auth_none', 'field_lock_phone1', 'unlocked', NULL),
(1204, 2, 1502329957, 'auth_none', 'field_lock_phone2', 'unlocked', NULL),
(1205, 2, 1502329957, 'auth_none', 'field_lock_address', 'unlocked', NULL),
(1206, 2, 1502329957, 'auth_none', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1207, 2, 1502329957, 'auth_none', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1208, 2, 1502329957, 'auth_none', 'field_lock_middlename', 'unlocked', NULL),
(1209, 2, 1502329957, 'auth_none', 'field_lock_alternatename', 'unlocked', NULL),
(1210, 2, 1502329957, 'auth_oauth2', 'field_lock_firstname', 'unlocked', NULL),
(1211, 2, 1502329957, 'auth_oauth2', 'field_lock_lastname', 'unlocked', NULL),
(1212, 2, 1502329958, 'auth_oauth2', 'field_lock_email', 'unlocked', NULL),
(1213, 2, 1502329958, 'auth_oauth2', 'field_lock_city', 'unlocked', NULL),
(1214, 2, 1502329958, 'auth_oauth2', 'field_lock_country', 'unlocked', NULL),
(1215, 2, 1502329958, 'auth_oauth2', 'field_lock_lang', 'unlocked', NULL),
(1216, 2, 1502329958, 'auth_oauth2', 'field_lock_description', 'unlocked', NULL),
(1217, 2, 1502329958, 'auth_oauth2', 'field_lock_url', 'unlocked', NULL),
(1218, 2, 1502329958, 'auth_oauth2', 'field_lock_idnumber', 'unlocked', NULL),
(1219, 2, 1502329958, 'auth_oauth2', 'field_lock_institution', 'unlocked', NULL),
(1220, 2, 1502329958, 'auth_oauth2', 'field_lock_department', 'unlocked', NULL),
(1221, 2, 1502329958, 'auth_oauth2', 'field_lock_phone1', 'unlocked', NULL),
(1222, 2, 1502329958, 'auth_oauth2', 'field_lock_phone2', 'unlocked', NULL),
(1223, 2, 1502329958, 'auth_oauth2', 'field_lock_address', 'unlocked', NULL),
(1224, 2, 1502329958, 'auth_oauth2', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1225, 2, 1502329958, 'auth_oauth2', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1226, 2, 1502329958, 'auth_oauth2', 'field_lock_middlename', 'unlocked', NULL),
(1227, 2, 1502329958, 'auth_oauth2', 'field_lock_alternatename', 'unlocked', NULL),
(1228, 2, 1502329959, 'auth_shibboleth', 'user_attribute', '', NULL),
(1229, 2, 1502329959, 'auth_shibboleth', 'convert_data', '', NULL),
(1230, 2, 1502329959, 'auth_shibboleth', 'alt_login', 'off', NULL),
(1231, 2, 1502329959, 'auth_shibboleth', 'organization_selection', 'urn:mace:organization1:providerID, Example Organization 1\r\n        https://another.idp-id.com/shibboleth, Other Example Organization, /Shibboleth.sso/DS/SWITCHaai\r\n        urn:mace:organization2:providerID, Example Organization 2, /Shibboleth.sso/WAYF/SWITCHaai', NULL),
(1232, 2, 1502329959, 'auth_shibboleth', 'logout_handler', '', NULL),
(1233, 2, 1502329959, 'auth_shibboleth', 'logout_return_url', '', NULL),
(1234, 2, 1502329959, 'auth_shibboleth', 'login_name', 'Shibboleth Login', NULL),
(1235, 2, 1502329959, 'auth_shibboleth', 'auth_instructions', 'Use the <a href="http://localhost/moodle/auth/shibboleth/index.php">Shibboleth login</a> to get access via Shibboleth, if your institution supports it.<br />Otherwise, use the normal login form shown here.', NULL),
(1236, 2, 1502329959, 'auth_shibboleth', 'changepasswordurl', '', NULL),
(1237, 2, 1502329959, 'auth_shibboleth', 'field_map_firstname', '', NULL),
(1238, 2, 1502329959, 'auth_shibboleth', 'field_updatelocal_firstname', 'oncreate', NULL),
(1239, 2, 1502329959, 'auth_shibboleth', 'field_lock_firstname', 'unlocked', NULL),
(1240, 2, 1502329959, 'auth_shibboleth', 'field_map_lastname', '', NULL),
(1241, 2, 1502329959, 'auth_shibboleth', 'field_updatelocal_lastname', 'oncreate', NULL),
(1242, 2, 1502329959, 'auth_shibboleth', 'field_lock_lastname', 'unlocked', NULL),
(1243, 2, 1502329959, 'auth_shibboleth', 'field_map_email', '', NULL),
(1244, 2, 1502329959, 'auth_shibboleth', 'field_updatelocal_email', 'oncreate', NULL),
(1245, 2, 1502329960, 'auth_shibboleth', 'field_lock_email', 'unlocked', NULL),
(1246, 2, 1502329960, 'auth_shibboleth', 'field_map_city', '', NULL),
(1247, 2, 1502329960, 'auth_shibboleth', 'field_updatelocal_city', 'oncreate', NULL),
(1248, 2, 1502329960, 'auth_shibboleth', 'field_lock_city', 'unlocked', NULL),
(1249, 2, 1502329960, 'auth_shibboleth', 'field_map_country', '', NULL),
(1250, 2, 1502329960, 'auth_shibboleth', 'field_updatelocal_country', 'oncreate', NULL),
(1251, 2, 1502329960, 'auth_shibboleth', 'field_lock_country', 'unlocked', NULL),
(1252, 2, 1502329960, 'auth_shibboleth', 'field_map_lang', '', NULL),
(1253, 2, 1502329960, 'auth_shibboleth', 'field_updatelocal_lang', 'oncreate', NULL),
(1254, 2, 1502329960, 'auth_shibboleth', 'field_lock_lang', 'unlocked', NULL),
(1255, 2, 1502329960, 'auth_shibboleth', 'field_map_description', '', NULL),
(1256, 2, 1502329960, 'auth_shibboleth', 'field_updatelocal_description', 'oncreate', NULL),
(1257, 2, 1502329960, 'auth_shibboleth', 'field_lock_description', 'unlocked', NULL),
(1258, 2, 1502329960, 'auth_shibboleth', 'field_map_url', '', NULL),
(1259, 2, 1502329960, 'auth_shibboleth', 'field_updatelocal_url', 'oncreate', NULL),
(1260, 2, 1502329960, 'auth_shibboleth', 'field_lock_url', 'unlocked', NULL),
(1261, 2, 1502329960, 'auth_shibboleth', 'field_map_idnumber', '', NULL),
(1262, 2, 1502329961, 'auth_shibboleth', 'field_updatelocal_idnumber', 'oncreate', NULL),
(1263, 2, 1502329961, 'auth_shibboleth', 'field_lock_idnumber', 'unlocked', NULL),
(1264, 2, 1502329961, 'auth_shibboleth', 'field_map_institution', '', NULL),
(1265, 2, 1502329961, 'auth_shibboleth', 'field_updatelocal_institution', 'oncreate', NULL),
(1266, 2, 1502329961, 'auth_shibboleth', 'field_lock_institution', 'unlocked', NULL),
(1267, 2, 1502329961, 'auth_shibboleth', 'field_map_department', '', NULL),
(1268, 2, 1502329961, 'auth_shibboleth', 'field_updatelocal_department', 'oncreate', NULL),
(1269, 2, 1502329961, 'auth_shibboleth', 'field_lock_department', 'unlocked', NULL),
(1270, 2, 1502329961, 'auth_shibboleth', 'field_map_phone1', '', NULL),
(1271, 2, 1502329961, 'auth_shibboleth', 'field_updatelocal_phone1', 'oncreate', NULL),
(1272, 2, 1502329961, 'auth_shibboleth', 'field_lock_phone1', 'unlocked', NULL),
(1273, 2, 1502329961, 'auth_shibboleth', 'field_map_phone2', '', NULL),
(1274, 2, 1502329961, 'auth_shibboleth', 'field_updatelocal_phone2', 'oncreate', NULL),
(1275, 2, 1502329961, 'auth_shibboleth', 'field_lock_phone2', 'unlocked', NULL),
(1276, 2, 1502329961, 'auth_shibboleth', 'field_map_address', '', NULL),
(1277, 2, 1502329961, 'auth_shibboleth', 'field_updatelocal_address', 'oncreate', NULL),
(1278, 2, 1502329962, 'auth_shibboleth', 'field_lock_address', 'unlocked', NULL),
(1279, 2, 1502329962, 'auth_shibboleth', 'field_map_firstnamephonetic', '', NULL),
(1280, 2, 1502329962, 'auth_shibboleth', 'field_updatelocal_firstnamephonetic', 'oncreate', NULL),
(1281, 2, 1502329962, 'auth_shibboleth', 'field_lock_firstnamephonetic', 'unlocked', NULL),
(1282, 2, 1502329962, 'auth_shibboleth', 'field_map_lastnamephonetic', '', NULL),
(1283, 2, 1502329962, 'auth_shibboleth', 'field_updatelocal_lastnamephonetic', 'oncreate', NULL),
(1284, 2, 1502329962, 'auth_shibboleth', 'field_lock_lastnamephonetic', 'unlocked', NULL),
(1285, 2, 1502329962, 'auth_shibboleth', 'field_map_middlename', '', NULL),
(1286, 2, 1502329962, 'auth_shibboleth', 'field_updatelocal_middlename', 'oncreate', NULL),
(1287, 2, 1502329962, 'auth_shibboleth', 'field_lock_middlename', 'unlocked', NULL),
(1288, 2, 1502329962, 'auth_shibboleth', 'field_map_alternatename', '', NULL),
(1289, 2, 1502329962, 'auth_shibboleth', 'field_updatelocal_alternatename', 'oncreate', NULL),
(1290, 2, 1502329962, 'auth_shibboleth', 'field_lock_alternatename', 'unlocked', NULL),
(1291, 2, 1502329962, 'block_activity_results', 'config_showbest', '3', NULL),
(1292, 2, 1502329963, 'block_activity_results', 'config_showbest_locked', '', NULL),
(1293, 2, 1502329963, 'block_activity_results', 'config_showworst', '0', NULL),
(1294, 2, 1502329963, 'block_activity_results', 'config_showworst_locked', '', NULL),
(1295, 2, 1502329963, 'block_activity_results', 'config_usegroups', '0', NULL),
(1296, 2, 1502329963, 'block_activity_results', 'config_usegroups_locked', '', NULL),
(1297, 2, 1502329963, 'block_activity_results', 'config_nameformat', '1', NULL),
(1298, 2, 1502329963, 'block_activity_results', 'config_nameformat_locked', '', NULL),
(1299, 2, 1502329963, 'block_activity_results', 'config_gradeformat', '1', NULL),
(1300, 2, 1502329963, 'block_activity_results', 'config_gradeformat_locked', '', NULL),
(1301, 2, 1502329963, 'block_activity_results', 'config_decimalpoints', '2', NULL),
(1302, 2, 1502329963, 'block_activity_results', 'config_decimalpoints_locked', '', NULL),
(1303, 2, 1502329963, 'block_myoverview', 'defaulttab', 'timeline', NULL),
(1304, 2, 1502329963, NULL, 'block_course_list_adminview', 'all', NULL),
(1305, 2, 1502329963, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(1306, 2, 1502329963, NULL, 'block_html_allowcssclasses', '0', NULL),
(1307, 2, 1502329963, NULL, 'block_online_users_timetosee', '5', NULL),
(1308, 2, 1502329964, NULL, 'block_rss_client_num_entries', '5', NULL),
(1309, 2, 1502329964, NULL, 'block_rss_client_timeout', '30', NULL),
(1310, 2, 1502329964, 'block_section_links', 'numsections1', '22', NULL),
(1311, 2, 1502329964, 'block_section_links', 'incby1', '2', NULL),
(1312, 2, 1502329964, 'block_section_links', 'numsections2', '40', NULL),
(1313, 2, 1502329964, 'block_section_links', 'incby2', '5', NULL),
(1314, 2, 1502329964, 'block_tag_youtube', 'apikey', '', NULL),
(1315, 2, 1502329964, 'format_singleactivity', 'activitytype', 'forum', NULL),
(1316, 2, 1502329964, 'fileconverter_googledrive', 'issuerid', '', NULL),
(1317, 2, 1502329965, NULL, 'pathtounoconv', '/usr/bin/unoconv', NULL),
(1318, 2, 1502329965, 'enrol_cohort', 'roleid', '5', NULL),
(1319, 2, 1502329965, 'enrol_cohort', 'unenrolaction', '0', NULL),
(1320, 2, 1502329965, 'enrol_meta', 'nosyncroleids', '', NULL),
(1321, 2, 1502329965, 'enrol_meta', 'syncall', '1', NULL),
(1322, 2, 1502329965, 'enrol_meta', 'unenrolaction', '3', NULL),
(1323, 2, 1502329965, 'enrol_meta', 'coursesort', 'sortorder', NULL),
(1324, 2, 1502329965, 'enrol_database', 'dbtype', '', NULL),
(1325, 2, 1502329965, 'enrol_database', 'dbhost', 'localhost', NULL),
(1326, 2, 1502329965, 'enrol_database', 'dbuser', '', NULL),
(1327, 2, 1502329965, 'enrol_database', 'dbpass', '', NULL),
(1328, 2, 1502329965, 'enrol_database', 'dbname', '', NULL),
(1329, 2, 1502329965, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(1330, 2, 1502329965, 'enrol_database', 'dbsetupsql', '', NULL),
(1331, 2, 1502329966, 'enrol_database', 'dbsybasequoting', '0', NULL),
(1332, 2, 1502329966, 'enrol_database', 'debugdb', '0', NULL),
(1333, 2, 1502329966, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(1334, 2, 1502329966, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(1335, 2, 1502329966, 'enrol_database', 'localrolefield', 'shortname', NULL),
(1336, 2, 1502329966, 'enrol_database', 'localcategoryfield', 'id', NULL),
(1337, 2, 1502329966, 'enrol_database', 'remoteenroltable', '', NULL),
(1338, 2, 1502329966, 'enrol_database', 'remotecoursefield', '', NULL),
(1339, 2, 1502329966, 'enrol_database', 'remoteuserfield', '', NULL),
(1340, 2, 1502329966, 'enrol_database', 'remoterolefield', '', NULL),
(1341, 2, 1502329966, 'enrol_database', 'remoteotheruserfield', '', NULL),
(1342, 2, 1502329966, 'enrol_database', 'defaultrole', '5', NULL),
(1343, 2, 1502329966, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(1344, 2, 1502329966, 'enrol_database', 'unenrolaction', '0', NULL),
(1345, 2, 1502329966, 'enrol_database', 'newcoursetable', '', NULL),
(1346, 2, 1502329967, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(1347, 2, 1502329967, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(1348, 2, 1502329967, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(1349, 2, 1502329967, 'enrol_database', 'newcoursecategory', '', NULL),
(1350, 2, 1502329967, 'enrol_database', 'defaultcategory', '1', NULL),
(1351, 2, 1502329967, 'enrol_database', 'templatecourse', '', NULL),
(1352, 2, 1502329967, 'enrol_flatfile', 'location', '', NULL),
(1353, 2, 1502329967, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(1354, 2, 1502329967, 'enrol_flatfile', 'mailstudents', '0', NULL),
(1355, 2, 1502329967, 'enrol_flatfile', 'mailteachers', '0', NULL),
(1356, 2, 1502329967, 'enrol_flatfile', 'mailadmins', '0', NULL),
(1357, 2, 1502329967, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(1358, 2, 1502329967, 'enrol_flatfile', 'expiredaction', '3', NULL),
(1359, 2, 1502329968, 'enrol_guest', 'requirepassword', '0', NULL),
(1360, 2, 1502329968, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(1361, 2, 1502329968, 'enrol_guest', 'showhint', '0', NULL),
(1362, 2, 1502329968, 'enrol_guest', 'defaultenrol', '1', NULL),
(1363, 2, 1502329968, 'enrol_guest', 'status', '1', NULL),
(1364, 2, 1502329968, 'enrol_guest', 'status_adv', '', NULL),
(1365, 2, 1502329968, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(1366, 2, 1502329968, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(1367, 2, 1502329968, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(1368, 2, 1502329968, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(1369, 2, 1502329968, 'enrol_imsenterprise', 'imsupdateusers', '0', NULL),
(1370, 2, 1502329968, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(1371, 2, 1502329968, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(1372, 2, 1502329968, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(1373, 2, 1502329968, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(1374, 2, 1502329968, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(1375, 2, 1502329968, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(1376, 2, 1502329969, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(1377, 2, 1502329969, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(1378, 2, 1502329969, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(1379, 2, 1502329969, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(1380, 2, 1502329969, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(1381, 2, 1502329969, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(1382, 2, 1502329969, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(1383, 2, 1502329969, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(1384, 2, 1502329969, 'enrol_imsenterprise', 'updatecourses', '0', NULL),
(1385, 2, 1502329969, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(1386, 2, 1502329969, 'enrol_imsenterprise', 'nestedcategories', '0', NULL),
(1387, 2, 1502329969, 'enrol_imsenterprise', 'categoryidnumber', '0', NULL),
(1388, 2, 1502329969, 'enrol_imsenterprise', 'categoryseparator', '', NULL),
(1389, 2, 1502329969, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(1390, 2, 1502329969, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(1391, 2, 1502329969, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(1392, 2, 1502329970, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(1393, 2, 1502329970, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(1394, 2, 1502329970, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(1395, 2, 1502329970, 'enrol_ldap', 'host_url', '', NULL),
(1396, 2, 1502329970, 'enrol_ldap', 'start_tls', '0', NULL),
(1397, 2, 1502329970, 'enrol_ldap', 'ldap_version', '3', NULL),
(1398, 2, 1502329970, 'enrol_ldap', 'ldapencoding', 'utf-8', NULL),
(1399, 2, 1502329970, 'enrol_ldap', 'pagesize', '250', NULL),
(1400, 2, 1502329970, 'enrol_ldap', 'bind_dn', '', NULL),
(1401, 2, 1502329970, 'enrol_ldap', 'bind_pw', '', NULL),
(1402, 2, 1502329970, 'enrol_ldap', 'course_search_sub', '0', NULL),
(1403, 2, 1502329970, 'enrol_ldap', 'memberattribute_isdn', '0', NULL),
(1404, 2, 1502329970, 'enrol_ldap', 'user_contexts', '', NULL),
(1405, 2, 1502329970, 'enrol_ldap', 'user_search_sub', '0', NULL),
(1406, 2, 1502329970, 'enrol_ldap', 'user_type', 'default', NULL),
(1407, 2, 1502329970, 'enrol_ldap', 'opt_deref', '0', NULL),
(1408, 2, 1502329971, 'enrol_ldap', 'idnumber_attribute', '', NULL),
(1409, 2, 1502329971, 'enrol_ldap', 'objectclass', '', NULL),
(1410, 2, 1502329971, 'enrol_ldap', 'course_idnumber', '', NULL),
(1411, 2, 1502329971, 'enrol_ldap', 'course_shortname', '', NULL),
(1412, 2, 1502329971, 'enrol_ldap', 'course_fullname', '', NULL),
(1413, 2, 1502329971, 'enrol_ldap', 'course_summary', '', NULL),
(1414, 2, 1502329971, 'enrol_ldap', 'ignorehiddencourses', '0', NULL),
(1415, 2, 1502329971, 'enrol_ldap', 'unenrolaction', '0', NULL),
(1416, 2, 1502329971, 'enrol_ldap', 'autocreate', '0', NULL),
(1417, 2, 1502329971, 'enrol_ldap', 'category', '1', NULL),
(1418, 2, 1502329971, 'enrol_ldap', 'template', '', NULL),
(1419, 2, 1502329971, 'enrol_ldap', 'course_shortname_updateonsync', '0', NULL),
(1420, 2, 1502329971, 'enrol_ldap', 'course_fullname_updateonsync', '0', NULL),
(1421, 2, 1502329971, 'enrol_ldap', 'course_summary_updateonsync', '0', NULL),
(1422, 2, 1502329971, 'enrol_ldap', 'nested_groups', '0', NULL),
(1423, 2, 1502329971, 'enrol_ldap', 'group_memberofattribute', '', NULL),
(1424, 2, 1502329972, 'enrol_manual', 'expiredaction', '1', NULL),
(1425, 2, 1502329972, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(1426, 2, 1502329972, 'enrol_manual', 'defaultenrol', '1', NULL),
(1427, 2, 1502329972, 'enrol_manual', 'status', '0', NULL),
(1428, 2, 1502329972, 'enrol_manual', 'roleid', '5', NULL),
(1429, 2, 1502329972, 'enrol_manual', 'enrolstart', '4', NULL),
(1430, 2, 1502329972, 'enrol_manual', 'enrolperiod', '0', NULL),
(1431, 2, 1502329972, 'enrol_manual', 'expirynotify', '0', NULL),
(1432, 2, 1502329972, 'enrol_manual', 'expirythreshold', '86400', NULL),
(1433, 2, 1502329972, 'enrol_mnet', 'roleid', '5', NULL),
(1434, 2, 1502329972, 'enrol_mnet', 'roleid_adv', '1', NULL),
(1435, 2, 1502329972, 'enrol_paypal', 'paypalbusiness', '', NULL);
INSERT DELAYED IGNORE INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1436, 2, 1502329972, 'enrol_paypal', 'mailstudents', '0', NULL),
(1437, 2, 1502329972, 'enrol_paypal', 'mailteachers', '0', NULL),
(1438, 2, 1502329972, 'enrol_paypal', 'mailadmins', '0', NULL),
(1439, 2, 1502329973, 'enrol_paypal', 'expiredaction', '3', NULL),
(1440, 2, 1502329973, 'enrol_paypal', 'status', '1', NULL),
(1441, 2, 1502329973, 'enrol_paypal', 'cost', '0', NULL),
(1442, 2, 1502329973, 'enrol_paypal', 'currency', 'USD', NULL),
(1443, 2, 1502329973, 'enrol_paypal', 'roleid', '5', NULL),
(1444, 2, 1502329973, 'enrol_paypal', 'enrolperiod', '0', NULL),
(1445, 2, 1502329973, 'enrol_lti', 'emaildisplay', '2', NULL),
(1446, 2, 1502329973, 'enrol_lti', 'city', '', NULL),
(1447, 2, 1502329973, 'enrol_lti', 'country', '', NULL),
(1448, 2, 1502329973, 'enrol_lti', 'timezone', '99', NULL),
(1449, 2, 1502329973, 'enrol_lti', 'lang', 'en', NULL),
(1450, 2, 1502329973, 'enrol_lti', 'institution', '', NULL),
(1451, 2, 1502329973, 'enrol_self', 'requirepassword', '0', NULL),
(1452, 2, 1502329973, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(1453, 2, 1502329973, 'enrol_self', 'showhint', '0', NULL),
(1454, 2, 1502329974, 'enrol_self', 'expiredaction', '1', NULL),
(1455, 2, 1502329974, 'enrol_self', 'expirynotifyhour', '6', NULL),
(1456, 2, 1502329974, 'enrol_self', 'defaultenrol', '1', NULL),
(1457, 2, 1502329974, 'enrol_self', 'status', '1', NULL),
(1458, 2, 1502329974, 'enrol_self', 'newenrols', '1', NULL),
(1459, 2, 1502329974, 'enrol_self', 'groupkey', '0', NULL),
(1460, 2, 1502329974, 'enrol_self', 'roleid', '5', NULL),
(1461, 2, 1502329974, 'enrol_self', 'enrolperiod', '0', NULL),
(1462, 2, 1502329974, 'enrol_self', 'expirynotify', '0', NULL),
(1463, 2, 1502329974, 'enrol_self', 'expirythreshold', '86400', NULL),
(1464, 2, 1502329974, 'enrol_self', 'longtimenosee', '0', NULL),
(1465, 2, 1502329974, 'enrol_self', 'maxenrolled', '0', NULL),
(1466, 2, 1502329974, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(1467, 2, 1502329974, 'filter_urltolink', 'formats', '0', NULL),
(1468, 2, 1502329974, 'filter_urltolink', 'embedimages', '1', NULL),
(1469, 2, 1502329975, 'filter_emoticon', 'formats', '1,4,0', NULL),
(1470, 2, 1502329975, 'filter_mathjaxloader', 'httpsurl', 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js', NULL),
(1471, 2, 1502329975, 'filter_mathjaxloader', 'texfiltercompatibility', '0', NULL),
(1472, 2, 1502329975, 'filter_mathjaxloader', 'mathjaxconfig', '\r\nMathJax.Hub.Config({\r\n    config: ["Accessible.js", "Safe.js"],\r\n    errorSettings: { message: ["!"] },\r\n    skipStartupTypeset: true,\r\n    messageStyle: "none"\r\n});\r\n', NULL),
(1473, 2, 1502329975, 'filter_mathjaxloader', 'additionaldelimiters', '', NULL),
(1474, 2, 1502329975, NULL, 'filter_multilang_force_old', '0', NULL),
(1475, 2, 1502329975, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(1476, 2, 1502329975, 'filter_tex', 'latexbackground', '#FFFFFF', NULL),
(1477, 2, 1502329975, 'filter_tex', 'density', '120', NULL),
(1478, 2, 1502329975, 'filter_tex', 'pathlatex', 'c:\\texmf\\miktex\\bin\\latex.exe', NULL),
(1479, 2, 1502329975, 'filter_tex', 'pathdvips', 'c:\\texmf\\miktex\\bin\\dvips.exe', NULL),
(1480, 2, 1502329975, 'filter_tex', 'pathconvert', 'c:\\imagemagick\\convert.exe', NULL),
(1481, 2, 1502329975, 'filter_tex', 'pathdvisvgm', 'c:\\texmf\\miktex\\bin\\dvisvgm.exe', NULL),
(1482, 2, 1502329975, 'filter_tex', 'pathmimetex', '', NULL),
(1483, 2, 1502329975, 'filter_tex', 'convertformat', 'gif', NULL),
(1484, 2, 1502329976, NULL, 'filter_censor_badwords', '', NULL),
(1485, 2, 1502329976, 'logstore_database', 'dbdriver', '', NULL),
(1486, 2, 1502329976, 'logstore_database', 'dbhost', '', NULL),
(1487, 2, 1502329976, 'logstore_database', 'dbuser', '', NULL),
(1488, 2, 1502329976, 'logstore_database', 'dbpass', '', NULL),
(1489, 2, 1502329976, 'logstore_database', 'dbname', '', NULL),
(1490, 2, 1502329976, 'logstore_database', 'dbtable', '', NULL),
(1491, 2, 1502329976, 'logstore_database', 'dbpersist', '0', NULL),
(1492, 2, 1502329976, 'logstore_database', 'dbsocket', '', NULL),
(1493, 2, 1502329976, 'logstore_database', 'dbport', '', NULL),
(1494, 2, 1502329976, 'logstore_database', 'dbschema', '', NULL),
(1495, 2, 1502329976, 'logstore_database', 'dbcollation', '', NULL),
(1496, 2, 1502329976, 'logstore_database', 'dbhandlesoptions', '0', NULL),
(1497, 2, 1502329977, 'logstore_database', 'buffersize', '50', NULL),
(1498, 2, 1502329977, 'logstore_database', 'logguests', '0', NULL),
(1499, 2, 1502329977, 'logstore_database', 'includelevels', '1,2,0', NULL),
(1500, 2, 1502329977, 'logstore_database', 'includeactions', 'c,r,u,d', NULL),
(1501, 2, 1502329977, 'logstore_legacy', 'loglegacy', '0', NULL),
(1502, 2, 1502329977, NULL, 'logguests', '1', NULL),
(1503, 2, 1502329977, NULL, 'loglifetime', '0', NULL),
(1504, 2, 1502329977, 'logstore_standard', 'logguests', '1', NULL),
(1505, 2, 1502329977, 'logstore_standard', 'loglifetime', '0', NULL),
(1506, 2, 1502329977, 'logstore_standard', 'buffersize', '50', NULL),
(1507, 2, 1502329977, 'media_videojs', 'videoextensions', 'html_video,.f4v,.flv', NULL),
(1508, 2, 1502329977, 'media_videojs', 'audioextensions', 'html_audio', NULL),
(1509, 2, 1502329977, 'media_videojs', 'useflash', '0', NULL),
(1510, 2, 1502329977, 'media_videojs', 'youtube', '1', NULL),
(1511, 2, 1502329977, 'media_videojs', 'videocssclass', 'video-js', NULL),
(1512, 2, 1502329978, 'media_videojs', 'audiocssclass', 'video-js', NULL),
(1513, 2, 1502329978, 'media_videojs', 'limitsize', '1', NULL),
(1514, 2, 1502329978, NULL, 'jabberhost', '', NULL),
(1515, 2, 1502329978, NULL, 'jabberserver', '', NULL),
(1516, 2, 1502329978, NULL, 'jabberusername', '', NULL),
(1517, 2, 1502329978, NULL, 'jabberpassword', '', NULL),
(1518, 2, 1502329978, NULL, 'jabberport', '5222', NULL),
(1519, 2, 1502329978, NULL, 'airnotifierurl', 'https://messages.moodle.net', NULL),
(1520, 2, 1502329978, NULL, 'airnotifierport', '443', NULL),
(1521, 2, 1502329978, NULL, 'airnotifiermobileappname', 'com.moodle.moodlemobile', NULL),
(1522, 2, 1502329978, NULL, 'airnotifierappname', 'commoodlemoodlemobile', NULL),
(1523, 2, 1502329978, NULL, 'airnotifieraccesskey', '', NULL),
(1524, 2, 1502329979, 'qtype_multichoice', 'answerhowmany', '1', NULL),
(1525, 2, 1502329979, 'qtype_multichoice', 'shuffleanswers', '1', NULL),
(1526, 2, 1502329979, 'qtype_multichoice', 'answernumbering', 'abc', NULL),
(1527, 2, 1502329979, 'editor_atto', 'toolbar', 'collapse = collapse\r\nstyle1 = title, bold, italic\r\nlist = unorderedlist, orderedlist\r\nlinks = link\r\nfiles = image, media, managefiles\r\nstyle2 = underline, strike, subscript, superscript\r\nalign = align\r\nindent = indent\r\ninsert = equation, charmap, table, clear\r\nundo = undo\r\naccessibility = accessibilitychecker, accessibilityhelper\r\nother = html', NULL),
(1528, 2, 1502329979, 'editor_atto', 'autosavefrequency', '60', NULL),
(1529, 2, 1502329979, 'atto_collapse', 'showgroups', '5', NULL),
(1530, 2, 1502329979, 'atto_equation', 'librarygroup1', '\r\n\\cdot\r\n\\times\r\n\\ast\r\n\\div\r\n\\diamond\r\n\\pm\r\n\\mp\r\n\\oplus\r\n\\ominus\r\n\\otimes\r\n\\oslash\r\n\\odot\r\n\\circ\r\n\\bullet\r\n\\asymp\r\n\\equiv\r\n\\subseteq\r\n\\supseteq\r\n\\leq\r\n\\geq\r\n\\preceq\r\n\\succeq\r\n\\sim\r\n\\simeq\r\n\\approx\r\n\\subset\r\n\\supset\r\n\\ll\r\n\\gg\r\n\\prec\r\n\\succ\r\n\\infty\r\n\\in\r\n\\ni\r\n\\forall\r\n\\exists\r\n\\neq\r\n', NULL),
(1531, 2, 1502329979, 'atto_equation', 'librarygroup2', '\r\n\\leftarrow\r\n\\rightarrow\r\n\\uparrow\r\n\\downarrow\r\n\\leftrightarrow\r\n\\nearrow\r\n\\searrow\r\n\\swarrow\r\n\\nwarrow\r\n\\Leftarrow\r\n\\Rightarrow\r\n\\Uparrow\r\n\\Downarrow\r\n\\Leftrightarrow\r\n', NULL),
(1532, 2, 1502329979, 'atto_equation', 'librarygroup3', '\r\n\\alpha\r\n\\beta\r\n\\gamma\r\n\\delta\r\n\\epsilon\r\n\\zeta\r\n\\eta\r\n\\theta\r\n\\iota\r\n\\kappa\r\n\\lambda\r\n\\mu\r\n\\nu\r\n\\xi\r\n\\pi\r\n\\rho\r\n\\sigma\r\n\\tau\r\n\\upsilon\r\n\\phi\r\n\\chi\r\n\\psi\r\n\\omega\r\n\\Gamma\r\n\\Delta\r\n\\Theta\r\n\\Lambda\r\n\\Xi\r\n\\Pi\r\n\\Sigma\r\n\\Upsilon\r\n\\Phi\r\n\\Psi\r\n\\Omega\r\n', NULL),
(1533, 2, 1502329979, 'atto_equation', 'librarygroup4', '\r\n\\sum{a,b}\r\n\\sqrt[a]{b+c}\r\n\\int_{a}^{b}{c}\r\n\\iint_{a}^{b}{c}\r\n\\iiint_{a}^{b}{c}\r\n\\oint{a}\r\n(a)\r\n[a]\r\n\\lbrace{a}\\rbrace\r\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\r\n\\frac{a}{b+c}\r\n\\vec{a}\r\n\\binom {a} {b}\r\n{a \\brack b}\r\n{a \\brace b}\r\n', NULL),
(1534, 2, 1502329979, 'atto_table', 'allowborders', '0', NULL),
(1535, 2, 1502329979, 'atto_table', 'allowbackgroundcolour', '0', NULL),
(1536, 2, 1502329979, 'atto_table', 'allowwidth', '0', NULL),
(1537, 2, 1502329979, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\r\n\r\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\r\n\r\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen', NULL),
(1538, 2, 1502329979, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(1539, 2, 1502329980, 'editor_tinymce', 'customconfig', '', NULL),
(1540, 2, 1502329980, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(1541, 2, 1502329980, 'tinymce_spellchecker', 'spellengine', '', NULL),
(1542, 2, 1502329980, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(1543, 2, 1502329980, NULL, 'profileroles', '5,4,3', NULL),
(1544, 2, 1502329980, 'analytics', 'logstore', 'logstore_standard', NULL),
(1545, 2, 1502329980, NULL, 'coursecontact', '3', NULL),
(1546, 2, 1502329980, NULL, 'frontpage', '6', NULL),
(1547, 2, 1502329981, NULL, 'frontpageloggedin', '6', NULL),
(1548, 2, 1502329981, NULL, 'maxcategorydepth', '2', NULL),
(1549, 2, 1502329981, NULL, 'frontpagecourselimit', '200', NULL),
(1550, 2, 1502329981, NULL, 'commentsperpage', '15', NULL),
(1551, 2, 1502329981, NULL, 'defaultfrontpageroleid', '8', NULL),
(1552, 2, 1502329981, NULL, 'messageinbound_enabled', '0', NULL),
(1553, 2, 1502329981, NULL, 'messageinbound_mailbox', '', NULL),
(1554, 2, 1502329981, NULL, 'messageinbound_domain', '', NULL),
(1555, 2, 1502329981, NULL, 'messageinbound_host', '', NULL),
(1556, 2, 1502329981, NULL, 'messageinbound_hostssl', 'ssl', NULL),
(1557, 2, 1502329982, NULL, 'messageinbound_hostuser', '', NULL),
(1558, 2, 1502329982, NULL, 'messageinbound_hostpass', '', NULL),
(1559, 2, 1502329982, NULL, 'enablemobilewebservice', '0', NULL),
(1560, 2, 1502330298, NULL, 'timezone', 'America/Grenada', NULL),
(1561, 2, 1502330298, NULL, 'registerauth', '', NULL),
(1562, 2, 1502330299, NULL, 'noreplyaddress', 'tutors246@gmail.com', NULL),
(1563, 2, 1502334601, NULL, 'frontpage', '6,2,4,7,0', '6'),
(1564, 2, 1502334601, NULL, 'frontpageloggedin', '6,0,5,2,4,7', '6'),
(1565, 2, 1502335581, NULL, 'messageinbound_enabled', '1', '0'),
(1566, 2, 1502335581, NULL, 'messageinbound_mailbox', 'Tutors246', ''),
(1567, 2, 1502335581, NULL, 'messageinbound_domain', 'tutors246@gmail.com', ''),
(1568, 2, 1502335581, NULL, 'messageinbound_host', 'tutors246@gmail.com', ''),
(1569, 2, 1502335581, NULL, 'messageinbound_hostuser', 'Tutors246', ''),
(1570, 2, 1502335582, NULL, 'messageinbound_hostpass', '********', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

DROP TABLE IF EXISTS `mdl_config_plugins`;
CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1856 DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables';

--
-- Truncate table before insert `mdl_config_plugins`
--

TRUNCATE TABLE `mdl_config_plugins`;
--
-- Dumping data for table `mdl_config_plugins`
--

INSERT DELAYED IGNORE INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'question', 'multichoice_sortorder', '1'),
(2, 'question', 'truefalse_sortorder', '2'),
(3, 'question', 'match_sortorder', '3'),
(4, 'question', 'shortanswer_sortorder', '4'),
(5, 'question', 'numerical_sortorder', '5'),
(6, 'question', 'essay_sortorder', '6'),
(7, 'moodlecourse', 'visible', '1'),
(8, 'moodlecourse', 'format', 'topics'),
(9, 'moodlecourse', 'maxsections', '52'),
(10, 'moodlecourse', 'numsections', '4'),
(11, 'moodlecourse', 'hiddensections', '0'),
(12, 'moodlecourse', 'coursedisplay', '0'),
(13, 'moodlecourse', 'courseduration', '31536000'),
(14, 'moodlecourse', 'lang', ''),
(15, 'moodlecourse', 'newsitems', '5'),
(16, 'moodlecourse', 'showgrades', '1'),
(17, 'moodlecourse', 'showreports', '0'),
(18, 'moodlecourse', 'maxbytes', '0'),
(19, 'moodlecourse', 'enablecompletion', '1'),
(20, 'moodlecourse', 'groupmode', '0'),
(21, 'moodlecourse', 'groupmodeforce', '0'),
(22, 'backup', 'loglifetime', '30'),
(23, 'backup', 'backup_general_users', '1'),
(24, 'backup', 'backup_general_users_locked', ''),
(25, 'backup', 'backup_general_anonymize', '0'),
(26, 'backup', 'backup_general_anonymize_locked', ''),
(27, 'backup', 'backup_general_role_assignments', '1'),
(28, 'backup', 'backup_general_role_assignments_locked', ''),
(29, 'backup', 'backup_general_activities', '1'),
(30, 'backup', 'backup_general_activities_locked', ''),
(31, 'backup', 'backup_general_blocks', '1'),
(32, 'backup', 'backup_general_blocks_locked', ''),
(33, 'backup', 'backup_general_filters', '1'),
(34, 'backup', 'backup_general_filters_locked', ''),
(35, 'backup', 'backup_general_comments', '1'),
(36, 'backup', 'backup_general_comments_locked', ''),
(37, 'backup', 'backup_general_badges', '1'),
(38, 'backup', 'backup_general_badges_locked', ''),
(39, 'backup', 'backup_general_calendarevents', '1'),
(40, 'backup', 'backup_general_calendarevents_locked', ''),
(41, 'backup', 'backup_general_userscompletion', '1'),
(42, 'backup', 'backup_general_userscompletion_locked', ''),
(43, 'backup', 'backup_general_logs', '0'),
(44, 'backup', 'backup_general_logs_locked', ''),
(45, 'backup', 'backup_general_histories', '0'),
(46, 'backup', 'backup_general_histories_locked', ''),
(47, 'backup', 'backup_general_questionbank', '1'),
(48, 'backup', 'backup_general_questionbank_locked', ''),
(49, 'backup', 'backup_general_groups', '1'),
(50, 'backup', 'backup_general_groups_locked', ''),
(51, 'backup', 'backup_general_competencies', '1'),
(52, 'backup', 'backup_general_competencies_locked', ''),
(53, 'backup', 'import_general_maxresults', '10'),
(54, 'backup', 'import_general_duplicate_admin_allowed', '0'),
(55, 'backup', 'backup_import_activities', '1'),
(56, 'backup', 'backup_import_activities_locked', ''),
(57, 'backup', 'backup_import_blocks', '1'),
(58, 'backup', 'backup_import_blocks_locked', ''),
(59, 'backup', 'backup_import_filters', '1'),
(60, 'backup', 'backup_import_filters_locked', ''),
(61, 'backup', 'backup_import_calendarevents', '1'),
(62, 'backup', 'backup_import_calendarevents_locked', ''),
(63, 'backup', 'backup_import_questionbank', '1'),
(64, 'backup', 'backup_import_questionbank_locked', ''),
(65, 'backup', 'backup_import_groups', '1'),
(66, 'backup', 'backup_import_groups_locked', ''),
(67, 'backup', 'backup_import_competencies', '1'),
(68, 'backup', 'backup_import_competencies_locked', ''),
(69, 'backup', 'backup_auto_active', '0'),
(70, 'backup', 'backup_auto_weekdays', '0000000'),
(71, 'backup', 'backup_auto_hour', '0'),
(72, 'backup', 'backup_auto_minute', '0'),
(73, 'backup', 'backup_auto_storage', '0'),
(74, 'backup', 'backup_auto_destination', ''),
(75, 'backup', 'backup_auto_max_kept', '1'),
(76, 'backup', 'backup_auto_delete_days', '0'),
(77, 'backup', 'backup_auto_min_kept', '0'),
(78, 'backup', 'backup_shortname', '0'),
(79, 'backup', 'backup_auto_skip_hidden', '1'),
(80, 'backup', 'backup_auto_skip_modif_days', '30'),
(81, 'backup', 'backup_auto_skip_modif_prev', '0'),
(82, 'backup', 'backup_auto_users', '1'),
(83, 'backup', 'backup_auto_role_assignments', '1'),
(84, 'backup', 'backup_auto_activities', '1'),
(85, 'backup', 'backup_auto_blocks', '1'),
(86, 'backup', 'backup_auto_filters', '1'),
(87, 'backup', 'backup_auto_comments', '1'),
(88, 'backup', 'backup_auto_badges', '1'),
(89, 'backup', 'backup_auto_calendarevents', '1'),
(90, 'backup', 'backup_auto_userscompletion', '1'),
(91, 'backup', 'backup_auto_logs', '0'),
(92, 'backup', 'backup_auto_histories', '0'),
(93, 'backup', 'backup_auto_questionbank', '1'),
(94, 'backup', 'backup_auto_groups', '1'),
(95, 'backup', 'backup_auto_competencies', '1'),
(96, 'restore', 'restore_general_users', '1'),
(97, 'restore', 'restore_general_users_locked', ''),
(98, 'restore', 'restore_general_enrolments', '1'),
(99, 'restore', 'restore_general_enrolments_locked', ''),
(100, 'restore', 'restore_general_role_assignments', '1'),
(101, 'restore', 'restore_general_role_assignments_locked', ''),
(102, 'restore', 'restore_general_activities', '1'),
(103, 'restore', 'restore_general_activities_locked', ''),
(104, 'restore', 'restore_general_blocks', '1'),
(105, 'restore', 'restore_general_blocks_locked', ''),
(106, 'restore', 'restore_general_filters', '1'),
(107, 'restore', 'restore_general_filters_locked', ''),
(108, 'restore', 'restore_general_comments', '1'),
(109, 'restore', 'restore_general_comments_locked', ''),
(110, 'restore', 'restore_general_badges', '1'),
(111, 'restore', 'restore_general_badges_locked', ''),
(112, 'restore', 'restore_general_calendarevents', '1'),
(113, 'restore', 'restore_general_calendarevents_locked', ''),
(114, 'restore', 'restore_general_userscompletion', '1'),
(115, 'restore', 'restore_general_userscompletion_locked', ''),
(116, 'restore', 'restore_general_logs', '1'),
(117, 'restore', 'restore_general_logs_locked', ''),
(118, 'restore', 'restore_general_histories', '1'),
(119, 'restore', 'restore_general_histories_locked', ''),
(120, 'restore', 'restore_general_groups', '1'),
(121, 'restore', 'restore_general_groups_locked', ''),
(122, 'restore', 'restore_general_competencies', '1'),
(123, 'restore', 'restore_general_competencies_locked', ''),
(124, 'restore', 'restore_merge_overwrite_conf', '0'),
(125, 'restore', 'restore_merge_overwrite_conf_locked', ''),
(126, 'restore', 'restore_merge_course_fullname', '1'),
(127, 'restore', 'restore_merge_course_fullname_locked', ''),
(128, 'restore', 'restore_merge_course_shortname', '1'),
(129, 'restore', 'restore_merge_course_shortname_locked', ''),
(130, 'restore', 'restore_merge_course_startdate', '1'),
(131, 'restore', 'restore_merge_course_startdate_locked', ''),
(132, 'restore', 'restore_replace_overwrite_conf', '0'),
(133, 'restore', 'restore_replace_overwrite_conf_locked', ''),
(134, 'restore', 'restore_replace_course_fullname', '1'),
(135, 'restore', 'restore_replace_course_fullname_locked', ''),
(136, 'restore', 'restore_replace_course_shortname', '1'),
(137, 'restore', 'restore_replace_course_shortname_locked', ''),
(138, 'restore', 'restore_replace_course_startdate', '1'),
(139, 'restore', 'restore_replace_course_startdate_locked', ''),
(140, 'restore', 'restore_replace_keep_roles_and_enrolments', '0'),
(141, 'restore', 'restore_replace_keep_roles_and_enrolments_locked', ''),
(142, 'restore', 'restore_replace_keep_groups_and_groupings', '0'),
(143, 'restore', 'restore_replace_keep_groups_and_groupings_locked', ''),
(144, 'core_competency', 'enabled', '1'),
(145, 'core_competency', 'pushcourseratingstouserplans', '1'),
(146, 'cachestore_apcu', 'testperformance', '0'),
(147, 'cachestore_memcache', 'testservers', ''),
(148, 'cachestore_memcached', 'testservers', ''),
(149, 'cachestore_mongodb', 'testserver', ''),
(150, 'cachestore_redis', 'test_server', ''),
(151, 'cachestore_redis', 'test_password', ''),
(152, 'question_preview', 'behaviour', 'deferredfeedback'),
(153, 'question_preview', 'correctness', '1'),
(154, 'question_preview', 'marks', '2'),
(155, 'question_preview', 'markdp', '2'),
(156, 'question_preview', 'feedback', '1'),
(157, 'question_preview', 'generalfeedback', '1'),
(158, 'question_preview', 'rightanswer', '1'),
(159, 'question_preview', 'history', '0'),
(160, 'tool_task', 'enablerunnow', '1'),
(161, 'analytics', 'predictionsprocessor', '\\mlbackend_php\\processor'),
(162, 'analytics', 'timesplittings', '\\core\\analytics\\time_splitting\\quarters_accum,\\core\\analytics\\time_splitting\\quarters,\\core\\analytics\\time_splitting\\no_splitting'),
(163, 'analytics', 'modeloutputdir', 'C:\\wamp64\\moodledata\\models'),
(164, 'theme_boost', 'preset', 'default.scss'),
(165, 'theme_boost', 'presetfiles', ''),
(166, 'theme_boost', 'brandcolor', ''),
(167, 'theme_boost', 'scsspre', ''),
(168, 'theme_boost', 'scss', ''),
(169, 'theme_clean', 'invert', '0'),
(170, 'theme_clean', 'logo', ''),
(171, 'theme_clean', 'smalllogo', ''),
(172, 'theme_clean', 'sitename', '1'),
(173, 'theme_clean', 'customcss', ''),
(174, 'theme_clean', 'footnote', ''),
(175, 'theme_more', 'textcolor', '#333366'),
(176, 'theme_more', 'linkcolor', '#FF6500'),
(177, 'theme_more', 'bodybackground', ''),
(178, 'theme_more', 'backgroundimage', ''),
(179, 'theme_more', 'backgroundrepeat', 'repeat'),
(180, 'theme_more', 'backgroundposition', '0'),
(181, 'theme_more', 'backgroundfixed', '0'),
(182, 'theme_more', 'contentbackground', '#FFFFFF'),
(183, 'theme_more', 'secondarybackground', '#FFFFFF'),
(184, 'theme_more', 'invert', '1'),
(185, 'theme_more', 'logo', ''),
(186, 'theme_more', 'smalllogo', ''),
(187, 'theme_more', 'sitename', '1'),
(188, 'theme_more', 'customcss', ''),
(189, 'theme_more', 'footnote', ''),
(190, 'core_admin', 'logo', ''),
(191, 'core_admin', 'logocompact', ''),
(192, 'antivirus_clamav', 'version', '2017051500'),
(193, 'availability_completion', 'version', '2017051500'),
(194, 'availability_date', 'version', '2017051500'),
(195, 'availability_grade', 'version', '2017051500'),
(196, 'availability_group', 'version', '2017051500'),
(197, 'availability_grouping', 'version', '2017051500'),
(198, 'availability_profile', 'version', '2017051500'),
(199, 'qtype_calculated', 'version', '2017051500'),
(200, 'qtype_calculatedmulti', 'version', '2017051500'),
(201, 'qtype_calculatedsimple', 'version', '2017051500'),
(202, 'qtype_ddimageortext', 'version', '2017051500'),
(203, 'qtype_ddmarker', 'version', '2017051500'),
(204, 'qtype_ddwtos', 'version', '2017051500'),
(205, 'qtype_description', 'version', '2017051500'),
(206, 'qtype_essay', 'version', '2017051500'),
(207, 'qtype_gapselect', 'version', '2017051500'),
(208, 'qtype_match', 'version', '2017051500'),
(209, 'qtype_missingtype', 'version', '2017051500'),
(210, 'qtype_multianswer', 'version', '2017051500'),
(211, 'qtype_multichoice', 'version', '2017051500'),
(212, 'qtype_numerical', 'version', '2017051500'),
(213, 'qtype_random', 'version', '2017051500'),
(214, 'qtype_randomsamatch', 'version', '2017051500'),
(215, 'qtype_shortanswer', 'version', '2017051500'),
(216, 'qtype_truefalse', 'version', '2017051500'),
(217, 'mod_assign', 'version', '2017061200'),
(218, 'mod_assignment', 'version', '2017051500'),
(220, 'mod_book', 'version', '2017051500'),
(221, 'mod_chat', 'version', '2017051500'),
(222, 'mod_choice', 'version', '2017051500'),
(223, 'mod_data', 'version', '2017051500'),
(224, 'mod_feedback', 'version', '2017051500'),
(226, 'mod_folder', 'version', '2017051500'),
(228, 'mod_forum', 'version', '2017051500'),
(229, 'mod_glossary', 'version', '2017051500'),
(230, 'mod_imscp', 'version', '2017051500'),
(232, 'mod_label', 'version', '2017062800'),
(233, 'mod_lesson', 'version', '2017051501'),
(234, 'mod_lti', 'version', '2017051600'),
(235, 'mod_page', 'version', '2017051500'),
(237, 'mod_quiz', 'version', '2017051500'),
(238, 'mod_resource', 'version', '2017051500'),
(239, 'mod_scorm', 'version', '2017051500'),
(240, 'mod_survey', 'version', '2017051500'),
(242, 'mod_url', 'version', '2017051500'),
(244, 'mod_wiki', 'version', '2017051500'),
(246, 'mod_workshop', 'version', '2017051504'),
(247, 'auth_cas', 'version', '2017051500'),
(249, 'auth_db', 'version', '2017051500'),
(251, 'auth_email', 'version', '2017051500'),
(252, 'auth_ldap', 'version', '2017080100'),
(254, 'auth_lti', 'version', '2017051500'),
(255, 'auth_manual', 'version', '2017051500'),
(256, 'auth_mnet', 'version', '2017051500'),
(258, 'auth_nologin', 'version', '2017051500'),
(259, 'auth_none', 'version', '2017051500'),
(260, 'auth_oauth2', 'version', '2017051501'),
(261, 'auth_shibboleth', 'version', '2017051500'),
(263, 'auth_webservice', 'version', '2017051500'),
(264, 'calendartype_gregorian', 'version', '2017051500'),
(265, 'enrol_category', 'version', '2017051500'),
(267, 'enrol_cohort', 'version', '2017051500'),
(268, 'enrol_database', 'version', '2017051500'),
(270, 'enrol_flatfile', 'version', '2017051500'),
(272, 'enrol_flatfile', 'map_1', 'manager'),
(273, 'enrol_flatfile', 'map_2', 'coursecreator'),
(274, 'enrol_flatfile', 'map_3', 'editingteacher'),
(275, 'enrol_flatfile', 'map_4', 'teacher'),
(276, 'enrol_flatfile', 'map_5', 'student'),
(277, 'enrol_flatfile', 'map_6', 'guest'),
(278, 'enrol_flatfile', 'map_7', 'user'),
(279, 'enrol_flatfile', 'map_8', 'frontpage'),
(280, 'enrol_guest', 'version', '2017051500'),
(281, 'enrol_imsenterprise', 'version', '2017051500'),
(283, 'enrol_ldap', 'version', '2017051500'),
(285, 'enrol_lti', 'version', '2017051500'),
(286, 'enrol_manual', 'version', '2017051500'),
(288, 'enrol_meta', 'version', '2017051500'),
(290, 'enrol_mnet', 'version', '2017051500'),
(291, 'enrol_paypal', 'version', '2017051500'),
(292, 'enrol_self', 'version', '2017051500'),
(294, 'message_airnotifier', 'version', '2017051500'),
(296, 'message', 'airnotifier_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(297, 'message', 'airnotifier_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(298, 'message', 'airnotifier_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(299, 'message', 'airnotifier_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(300, 'message', 'airnotifier_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(301, 'message', 'airnotifier_provider_mod_assign_assign_notification_permitted', 'permitted'),
(302, 'message', 'airnotifier_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(303, 'message', 'airnotifier_provider_mod_feedback_submission_permitted', 'permitted'),
(304, 'message', 'airnotifier_provider_mod_feedback_message_permitted', 'permitted'),
(305, 'message', 'airnotifier_provider_mod_forum_posts_permitted', 'permitted'),
(306, 'message', 'airnotifier_provider_mod_forum_digests_permitted', 'permitted'),
(307, 'message', 'airnotifier_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(308, 'message', 'airnotifier_provider_mod_quiz_submission_permitted', 'permitted'),
(309, 'message', 'airnotifier_provider_mod_quiz_confirmation_permitted', 'permitted'),
(310, 'message', 'airnotifier_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(311, 'message', 'airnotifier_provider_moodle_notices_permitted', 'permitted'),
(312, 'message', 'airnotifier_provider_moodle_errors_permitted', 'permitted'),
(313, 'message', 'airnotifier_provider_moodle_availableupdate_permitted', 'permitted'),
(314, 'message', 'airnotifier_provider_moodle_instantmessage_permitted', 'permitted'),
(315, 'message', 'airnotifier_provider_moodle_backup_permitted', 'permitted'),
(316, 'message', 'airnotifier_provider_moodle_courserequested_permitted', 'permitted'),
(317, 'message', 'airnotifier_provider_moodle_courserequestapproved_permitted', 'permitted'),
(318, 'message', 'airnotifier_provider_moodle_courserequestrejected_permitted', 'permitted'),
(319, 'message', 'airnotifier_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(320, 'message', 'airnotifier_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(321, 'message', 'airnotifier_provider_moodle_competencyplancomment_permitted', 'permitted'),
(322, 'message', 'airnotifier_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
(323, 'message', 'airnotifier_provider_moodle_insights_permitted', 'permitted'),
(324, 'message_email', 'version', '2017051500'),
(326, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(327, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(328, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(329, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(330, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(331, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(332, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(333, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(334, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(335, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(336, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(337, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(338, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(339, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(340, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(341, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(342, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(343, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(344, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(345, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(346, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(347, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(348, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(349, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(350, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(351, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(352, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(353, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(354, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(355, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(356, 'message', 'email_provider_mod_forum_digests_permitted', 'permitted'),
(357, 'message', 'message_provider_mod_forum_digests_loggedin', 'email'),
(358, 'message', 'message_provider_mod_forum_digests_loggedoff', 'email'),
(359, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(360, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(361, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(362, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(363, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(364, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(365, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(366, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(367, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(368, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(369, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(370, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(371, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(372, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(373, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(374, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(375, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(376, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(377, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(378, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(379, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(380, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(381, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(382, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(383, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(384, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(385, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(386, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(387, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(388, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(389, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(390, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(391, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(392, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(393, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(394, 'message', 'email_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(395, 'message', 'message_provider_moodle_badgerecipientnotice_loggedoff', 'popup,email'),
(396, 'message', 'email_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(397, 'message', 'message_provider_moodle_badgecreatornotice_loggedoff', 'email'),
(398, 'message', 'email_provider_moodle_competencyplancomment_permitted', 'permitted'),
(399, 'message', 'message_provider_moodle_competencyplancomment_loggedin', 'email'),
(400, 'message', 'message_provider_moodle_competencyplancomment_loggedoff', 'email'),
(401, 'message', 'email_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
(402, 'message', 'message_provider_moodle_competencyusercompcomment_loggedin', 'email'),
(403, 'message', 'message_provider_moodle_competencyusercompcomment_loggedoff', 'email'),
(404, 'message', 'email_provider_moodle_insights_permitted', 'permitted'),
(405, 'message', 'message_provider_moodle_insights_loggedin', 'email'),
(406, 'message', 'message_provider_moodle_insights_loggedoff', 'email'),
(407, 'message_jabber', 'version', '2017051500'),
(409, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(410, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(411, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(412, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(413, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(414, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(415, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(416, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(417, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(418, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(419, 'message', 'jabber_provider_mod_forum_digests_permitted', 'permitted'),
(420, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(421, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(422, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(423, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(424, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(425, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(426, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(427, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(428, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(429, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(430, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(431, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(432, 'message', 'jabber_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(433, 'message', 'jabber_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(434, 'message', 'jabber_provider_moodle_competencyplancomment_permitted', 'permitted'),
(435, 'message', 'jabber_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
(436, 'message', 'jabber_provider_moodle_insights_permitted', 'permitted'),
(437, 'message_popup', 'version', '2017051500'),
(439, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(440, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(441, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(442, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(443, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(444, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(445, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(446, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(447, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(448, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(449, 'message', 'popup_provider_mod_forum_digests_permitted', 'permitted'),
(450, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(451, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(452, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(453, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(454, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(455, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(456, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(457, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(458, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(459, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(460, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(461, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(462, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(463, 'message', 'popup_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(464, 'message', 'message_provider_moodle_badgerecipientnotice_loggedin', 'popup'),
(465, 'message', 'popup_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(466, 'message', 'popup_provider_moodle_competencyplancomment_permitted', 'permitted'),
(467, 'message', 'popup_provider_moodle_competencyusercompcomment_permitted', 'permitted'),
(468, 'message', 'popup_provider_moodle_insights_permitted', 'permitted'),
(469, 'block_activity_modules', 'version', '2017051500'),
(470, 'block_activity_results', 'version', '2017051500'),
(471, 'block_admin_bookmarks', 'version', '2017051500'),
(472, 'block_badges', 'version', '2017051500'),
(473, 'block_blog_menu', 'version', '2017051500'),
(474, 'block_blog_recent', 'version', '2017051500'),
(475, 'block_blog_tags', 'version', '2017051500'),
(476, 'block_calendar_month', 'version', '2017051500'),
(477, 'block_calendar_upcoming', 'version', '2017051500'),
(478, 'block_comments', 'version', '2017051500'),
(479, 'block_community', 'version', '2017051500'),
(480, 'block_completionstatus', 'version', '2017051500'),
(481, 'block_course_list', 'version', '2017051500'),
(482, 'block_course_summary', 'version', '2017051500'),
(483, 'block_feedback', 'version', '2017051500'),
(485, 'block_globalsearch', 'version', '2017051500'),
(486, 'block_glossary_random', 'version', '2017051500'),
(487, 'block_html', 'version', '2017051500'),
(488, 'block_login', 'version', '2017051500'),
(489, 'block_lp', 'version', '2017051500'),
(490, 'block_mentees', 'version', '2017051500'),
(491, 'block_messages', 'version', '2017051500'),
(492, 'block_mnet_hosts', 'version', '2017051500'),
(493, 'block_myoverview', 'version', '2017051502'),
(494, 'block_myprofile', 'version', '2017051500'),
(495, 'block_navigation', 'version', '2017051500'),
(496, 'block_news_items', 'version', '2017051500'),
(497, 'block_online_users', 'version', '2017051500'),
(498, 'block_participants', 'version', '2017051500'),
(499, 'block_private_files', 'version', '2017051500'),
(500, 'block_quiz_results', 'version', '2017051500'),
(502, 'block_recent_activity', 'version', '2017051500'),
(503, 'block_rss_client', 'version', '2017051500'),
(504, 'block_search_forums', 'version', '2017051500'),
(505, 'block_section_links', 'version', '2017051500'),
(506, 'block_selfcompletion', 'version', '2017051500'),
(507, 'block_settings', 'version', '2017051500'),
(508, 'block_site_main_menu', 'version', '2017051500'),
(509, 'block_social_activities', 'version', '2017051500'),
(510, 'block_tag_flickr', 'version', '2017051500'),
(511, 'block_tag_youtube', 'version', '2017051500'),
(513, 'block_tags', 'version', '2017051500'),
(514, 'media_html5audio', 'version', '2017051500'),
(515, 'media_html5video', 'version', '2017051500'),
(516, 'media_swf', 'version', '2017051500'),
(517, 'media_videojs', 'version', '2017051500'),
(518, 'media_vimeo', 'version', '2017051500'),
(519, 'media_youtube', 'version', '2017051500'),
(520, 'filter_activitynames', 'version', '2017051500'),
(522, 'filter_algebra', 'version', '2017051500'),
(523, 'filter_censor', 'version', '2017051500'),
(524, 'filter_data', 'version', '2017051500'),
(526, 'filter_emailprotect', 'version', '2017051500'),
(527, 'filter_emoticon', 'version', '2017051500'),
(528, 'filter_glossary', 'version', '2017051500'),
(530, 'filter_mathjaxloader', 'version', '2017051500'),
(532, 'filter_mediaplugin', 'version', '2017051500'),
(534, 'filter_multilang', 'version', '2017051500'),
(535, 'filter_tex', 'version', '2017051500'),
(537, 'filter_tidy', 'version', '2017051500'),
(538, 'filter_urltolink', 'version', '2017051500'),
(539, 'editor_atto', 'version', '2017051500'),
(541, 'editor_textarea', 'version', '2017051500'),
(542, 'editor_tinymce', 'version', '2017051500'),
(543, 'format_singleactivity', 'version', '2017051500'),
(544, 'format_social', 'version', '2017051500'),
(545, 'format_topics', 'version', '2017051500'),
(546, 'format_weeks', 'version', '2017051500'),
(547, 'dataformat_csv', 'version', '2017051500'),
(548, 'dataformat_excel', 'version', '2017051500'),
(549, 'dataformat_html', 'version', '2017051500'),
(550, 'dataformat_json', 'version', '2017051500'),
(551, 'dataformat_ods', 'version', '2017051500'),
(552, 'profilefield_checkbox', 'version', '2017051500'),
(553, 'profilefield_datetime', 'version', '2017051500'),
(554, 'profilefield_menu', 'version', '2017051500'),
(555, 'profilefield_text', 'version', '2017051500'),
(556, 'profilefield_textarea', 'version', '2017051500'),
(557, 'report_backups', 'version', '2017051500'),
(558, 'report_competency', 'version', '2017051500'),
(559, 'report_completion', 'version', '2017051500'),
(561, 'report_configlog', 'version', '2017051500'),
(562, 'report_courseoverview', 'version', '2017051500'),
(563, 'report_eventlist', 'version', '2017051500'),
(564, 'report_insights', 'version', '2017051500'),
(565, 'report_log', 'version', '2017051500'),
(567, 'report_loglive', 'version', '2017051500'),
(568, 'report_outline', 'version', '2017051500'),
(570, 'report_participation', 'version', '2017051500'),
(572, 'report_performance', 'version', '2017051500'),
(573, 'report_progress', 'version', '2017051500'),
(575, 'report_questioninstances', 'version', '2017051500'),
(576, 'report_security', 'version', '2017051500'),
(577, 'report_stats', 'version', '2017051500'),
(579, 'report_usersessions', 'version', '2017051500'),
(580, 'gradeexport_ods', 'version', '2017051500'),
(581, 'gradeexport_txt', 'version', '2017051500'),
(582, 'gradeexport_xls', 'version', '2017051500'),
(583, 'gradeexport_xml', 'version', '2017051500'),
(584, 'gradeimport_csv', 'version', '2017051500'),
(585, 'gradeimport_direct', 'version', '2017051500'),
(586, 'gradeimport_xml', 'version', '2017051500'),
(587, 'gradereport_grader', 'version', '2017051500'),
(588, 'gradereport_history', 'version', '2017051500'),
(589, 'gradereport_outcomes', 'version', '2017051500'),
(590, 'gradereport_overview', 'version', '2017051501'),
(591, 'gradereport_singleview', 'version', '2017051500'),
(592, 'gradereport_user', 'version', '2017051500'),
(593, 'gradingform_guide', 'version', '2017051500'),
(594, 'gradingform_rubric', 'version', '2017051500'),
(595, 'mlbackend_php', 'version', '2017051500'),
(596, 'mlbackend_python', 'version', '2017051500'),
(597, 'mnetservice_enrol', 'version', '2017051500'),
(598, 'webservice_rest', 'version', '2017051500'),
(599, 'webservice_soap', 'version', '2017051500'),
(600, 'webservice_xmlrpc', 'version', '2017051500'),
(601, 'repository_areafiles', 'version', '2017051500'),
(603, 'areafiles', 'enablecourseinstances', '0'),
(604, 'areafiles', 'enableuserinstances', '0'),
(605, 'repository_boxnet', 'version', '2017051500'),
(606, 'repository_coursefiles', 'version', '2017051500'),
(607, 'repository_dropbox', 'version', '2017051500'),
(608, 'repository_equella', 'version', '2017051500'),
(609, 'repository_filesystem', 'version', '2017051500'),
(610, 'repository_flickr', 'version', '2017051500'),
(611, 'repository_flickr_public', 'version', '2017051500'),
(612, 'repository_googledocs', 'version', '2017051500'),
(613, 'repository_local', 'version', '2017051500'),
(615, 'local', 'enablecourseinstances', '0'),
(616, 'local', 'enableuserinstances', '0'),
(617, 'repository_merlot', 'version', '2017051500'),
(618, 'repository_onedrive', 'version', '2017051500'),
(619, 'repository_picasa', 'version', '2017051500'),
(620, 'repository_recent', 'version', '2017051500'),
(622, 'recent', 'enablecourseinstances', '0'),
(623, 'recent', 'enableuserinstances', '0'),
(624, 'repository_s3', 'version', '2017051500'),
(625, 'repository_skydrive', 'version', '2017051500'),
(626, 'repository_upload', 'version', '2017051500'),
(628, 'upload', 'enablecourseinstances', '0'),
(629, 'upload', 'enableuserinstances', '0'),
(630, 'repository_url', 'version', '2017051500'),
(632, 'url', 'enablecourseinstances', '0'),
(633, 'url', 'enableuserinstances', '0'),
(634, 'repository_user', 'version', '2017051500'),
(636, 'user', 'enablecourseinstances', '0'),
(637, 'user', 'enableuserinstances', '0'),
(638, 'repository_webdav', 'version', '2017051500'),
(639, 'repository_wikimedia', 'version', '2017051500'),
(641, 'wikimedia', 'enablecourseinstances', '0'),
(642, 'wikimedia', 'enableuserinstances', '0'),
(643, 'repository_youtube', 'version', '2017051500'),
(645, 'portfolio_boxnet', 'version', '2017051500'),
(646, 'portfolio_download', 'version', '2017051500'),
(647, 'portfolio_flickr', 'version', '2017051500'),
(648, 'portfolio_googledocs', 'version', '2017051500'),
(649, 'portfolio_mahara', 'version', '2017051500'),
(650, 'portfolio_picasa', 'version', '2017051500'),
(651, 'search_solr', 'version', '2017051500'),
(652, 'qbehaviour_adaptive', 'version', '2017051500'),
(653, 'qbehaviour_adaptivenopenalty', 'version', '2017051500'),
(654, 'qbehaviour_deferredcbm', 'version', '2017051500'),
(655, 'qbehaviour_deferredfeedback', 'version', '2017051500'),
(656, 'qbehaviour_immediatecbm', 'version', '2017051500'),
(657, 'qbehaviour_immediatefeedback', 'version', '2017051500'),
(658, 'qbehaviour_informationitem', 'version', '2017051500'),
(659, 'qbehaviour_interactive', 'version', '2017051500'),
(660, 'qbehaviour_interactivecountback', 'version', '2017051500'),
(661, 'qbehaviour_manualgraded', 'version', '2017051500'),
(663, 'question', 'disabledbehaviours', 'manualgraded'),
(664, 'qbehaviour_missing', 'version', '2017051500'),
(665, 'qformat_aiken', 'version', '2017051500'),
(666, 'qformat_blackboard_six', 'version', '2017051500'),
(667, 'qformat_examview', 'version', '2017051500'),
(668, 'qformat_gift', 'version', '2017051500'),
(669, 'qformat_missingword', 'version', '2017051500'),
(670, 'qformat_multianswer', 'version', '2017051500'),
(671, 'qformat_webct', 'version', '2017051500'),
(672, 'qformat_xhtml', 'version', '2017051500'),
(673, 'qformat_xml', 'version', '2017051500'),
(674, 'tool_analytics', 'version', '2017051500'),
(675, 'tool_assignmentupgrade', 'version', '2017051500'),
(676, 'tool_availabilityconditions', 'version', '2017051500'),
(677, 'tool_behat', 'version', '2017051500'),
(678, 'tool_capability', 'version', '2017051500'),
(679, 'tool_cohortroles', 'version', '2017051500'),
(680, 'tool_customlang', 'version', '2017051500'),
(682, 'tool_dbtransfer', 'version', '2017051500'),
(683, 'tool_filetypes', 'version', '2017051500'),
(684, 'tool_generator', 'version', '2017051500'),
(685, 'tool_health', 'version', '2017051500'),
(686, 'tool_innodb', 'version', '2017051500'),
(687, 'tool_installaddon', 'version', '2017051500'),
(688, 'tool_langimport', 'version', '2017051500'),
(689, 'tool_log', 'version', '2017051500'),
(691, 'tool_log', 'enabled_stores', 'logstore_standard'),
(692, 'tool_lp', 'version', '2017062700'),
(693, 'tool_lpimportcsv', 'version', '2017051500'),
(694, 'tool_lpmigrate', 'version', '2017051500'),
(695, 'tool_messageinbound', 'version', '2017051500'),
(696, 'message', 'airnotifier_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(697, 'message', 'email_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(698, 'message', 'jabber_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(699, 'message', 'popup_provider_tool_messageinbound_invalidrecipienthandler_permitted', 'permitted'),
(700, 'message', 'message_provider_tool_messageinbound_invalidrecipienthandler_loggedin', 'email'),
(701, 'message', 'message_provider_tool_messageinbound_invalidrecipienthandler_loggedoff', 'email'),
(702, 'message', 'airnotifier_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(703, 'message', 'email_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(704, 'message', 'jabber_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(705, 'message', 'popup_provider_tool_messageinbound_messageprocessingerror_permitted', 'permitted'),
(706, 'message', 'message_provider_tool_messageinbound_messageprocessingerror_loggedin', 'email'),
(707, 'message', 'message_provider_tool_messageinbound_messageprocessingerror_loggedoff', 'email'),
(708, 'message', 'airnotifier_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(709, 'message', 'email_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(710, 'message', 'jabber_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(711, 'message', 'popup_provider_tool_messageinbound_messageprocessingsuccess_permitted', 'permitted'),
(712, 'message', 'message_provider_tool_messageinbound_messageprocessingsuccess_loggedin', 'email'),
(713, 'message', 'message_provider_tool_messageinbound_messageprocessingsuccess_loggedoff', 'email'),
(714, 'tool_mobile', 'version', '2017051500'),
(715, 'tool_monitor', 'version', '2017051500'),
(716, 'message', 'airnotifier_provider_tool_monitor_notification_permitted', 'permitted'),
(717, 'message', 'email_provider_tool_monitor_notification_permitted', 'permitted'),
(718, 'message', 'jabber_provider_tool_monitor_notification_permitted', 'permitted'),
(719, 'message', 'popup_provider_tool_monitor_notification_permitted', 'permitted'),
(720, 'message', 'message_provider_tool_monitor_notification_loggedin', 'email'),
(721, 'message', 'message_provider_tool_monitor_notification_loggedoff', 'email'),
(722, 'tool_multilangupgrade', 'version', '2017051500'),
(723, 'tool_oauth2', 'version', '2017051500'),
(724, 'tool_phpunit', 'version', '2017051500'),
(725, 'tool_profiling', 'version', '2017051500'),
(726, 'tool_recyclebin', 'version', '2017051500'),
(727, 'tool_replace', 'version', '2017051500'),
(728, 'tool_spamcleaner', 'version', '2017051500'),
(729, 'tool_task', 'version', '2017051500'),
(730, 'tool_templatelibrary', 'version', '2017051500'),
(731, 'tool_unsuproles', 'version', '2017051500'),
(733, 'tool_uploadcourse', 'version', '2017051500'),
(734, 'tool_uploaduser', 'version', '2017051500'),
(735, 'tool_usertours', 'version', '2017051500'),
(737, 'tool_xmldb', 'version', '2017051500'),
(738, 'cachestore_apcu', 'version', '2017051500'),
(739, 'cachestore_file', 'version', '2017051500'),
(740, 'cachestore_memcache', 'version', '2017051500'),
(741, 'cachestore_memcached', 'version', '2017051500'),
(742, 'cachestore_mongodb', 'version', '2017051500'),
(743, 'cachestore_redis', 'version', '2017051500'),
(744, 'cachestore_session', 'version', '2017051500'),
(745, 'cachestore_static', 'version', '2017051500'),
(746, 'cachelock_file', 'version', '2017051500'),
(747, 'fileconverter_googledrive', 'version', '2017051500'),
(748, 'fileconverter_unoconv', 'version', '2017051500'),
(750, 'theme_boost', 'version', '2017051500'),
(751, 'theme_bootstrapbase', 'version', '2017051500'),
(752, 'theme_clean', 'version', '2017051500'),
(753, 'theme_more', 'version', '2017051500'),
(755, 'assignsubmission_comments', 'version', '2017051500'),
(757, 'assignsubmission_file', 'sortorder', '1'),
(758, 'assignsubmission_comments', 'sortorder', '2'),
(759, 'assignsubmission_onlinetext', 'sortorder', '0'),
(760, 'assignsubmission_file', 'version', '2017051500'),
(761, 'assignsubmission_onlinetext', 'version', '2017051500'),
(763, 'assignfeedback_comments', 'version', '2017051500'),
(765, 'assignfeedback_comments', 'sortorder', '0'),
(766, 'assignfeedback_editpdf', 'sortorder', '1'),
(767, 'assignfeedback_file', 'sortorder', '3'),
(768, 'assignfeedback_offline', 'sortorder', '2'),
(769, 'assignfeedback_editpdf', 'version', '2017051500'),
(771, 'assignfeedback_file', 'version', '2017051500'),
(773, 'assignfeedback_offline', 'version', '2017051500'),
(774, 'assignment_offline', 'version', '2017051500'),
(775, 'assignment_online', 'version', '2017051500'),
(776, 'assignment_upload', 'version', '2017051500'),
(777, 'assignment_uploadsingle', 'version', '2017051500'),
(778, 'booktool_exportimscp', 'version', '2017051500'),
(779, 'booktool_importhtml', 'version', '2017051500'),
(780, 'booktool_print', 'version', '2017051500'),
(781, 'datafield_checkbox', 'version', '2017051500'),
(782, 'datafield_date', 'version', '2017051500'),
(783, 'datafield_file', 'version', '2017051500'),
(784, 'datafield_latlong', 'version', '2017051500'),
(785, 'datafield_menu', 'version', '2017051500'),
(786, 'datafield_multimenu', 'version', '2017051500'),
(787, 'datafield_number', 'version', '2017051500'),
(788, 'datafield_picture', 'version', '2017051500'),
(789, 'datafield_radiobutton', 'version', '2017051500'),
(790, 'datafield_text', 'version', '2017051500'),
(791, 'datafield_textarea', 'version', '2017051500'),
(792, 'datafield_url', 'version', '2017051500'),
(793, 'datapreset_imagegallery', 'version', '2017051500'),
(794, 'ltiservice_memberships', 'version', '2017051500'),
(795, 'ltiservice_profile', 'version', '2017051500'),
(796, 'ltiservice_toolproxy', 'version', '2017051500'),
(797, 'ltiservice_toolsettings', 'version', '2017051500'),
(798, 'quiz_grading', 'version', '2017051500'),
(800, 'quiz_overview', 'version', '2017051500'),
(802, 'quiz_responses', 'version', '2017051500'),
(804, 'quiz_statistics', 'version', '2017051500'),
(806, 'quizaccess_delaybetweenattempts', 'version', '2017051500'),
(807, 'quizaccess_ipaddress', 'version', '2017051500'),
(808, 'quizaccess_numattempts', 'version', '2017051500'),
(809, 'quizaccess_offlineattempts', 'version', '2017051500'),
(810, 'quizaccess_openclosedate', 'version', '2017051500'),
(811, 'quizaccess_password', 'version', '2017051500'),
(812, 'quizaccess_safebrowser', 'version', '2017051500'),
(813, 'quizaccess_securewindow', 'version', '2017051500'),
(814, 'quizaccess_timelimit', 'version', '2017051500'),
(815, 'scormreport_basic', 'version', '2017051500'),
(816, 'scormreport_graphs', 'version', '2017051500'),
(817, 'scormreport_interactions', 'version', '2017051500'),
(818, 'scormreport_objectives', 'version', '2017051500'),
(819, 'workshopform_accumulative', 'version', '2017051500'),
(821, 'workshopform_comments', 'version', '2017051500'),
(823, 'workshopform_numerrors', 'version', '2017051500'),
(825, 'workshopform_rubric', 'version', '2017051500'),
(827, 'workshopallocation_manual', 'version', '2017051500'),
(828, 'workshopallocation_random', 'version', '2017051500'),
(829, 'workshopallocation_scheduled', 'version', '2017051500'),
(830, 'workshopeval_best', 'version', '2017051500'),
(831, 'atto_accessibilitychecker', 'version', '2017051500'),
(832, 'atto_accessibilityhelper', 'version', '2017051500'),
(833, 'atto_align', 'version', '2017051500'),
(834, 'atto_backcolor', 'version', '2017051500'),
(835, 'atto_bold', 'version', '2017051500'),
(836, 'atto_charmap', 'version', '2017051500'),
(837, 'atto_clear', 'version', '2017051500'),
(838, 'atto_collapse', 'version', '2017051500'),
(839, 'atto_emoticon', 'version', '2017051500'),
(840, 'atto_equation', 'version', '2017051500'),
(841, 'atto_fontcolor', 'version', '2017051500'),
(842, 'atto_html', 'version', '2017051500'),
(843, 'atto_image', 'version', '2017051500'),
(844, 'atto_indent', 'version', '2017051500'),
(845, 'atto_italic', 'version', '2017051500'),
(846, 'atto_link', 'version', '2017051500'),
(847, 'atto_managefiles', 'version', '2017051500'),
(848, 'atto_media', 'version', '2017051500'),
(849, 'atto_noautolink', 'version', '2017051500'),
(850, 'atto_orderedlist', 'version', '2017051500'),
(851, 'atto_rtl', 'version', '2017051500'),
(852, 'atto_strike', 'version', '2017051500'),
(853, 'atto_subscript', 'version', '2017051500'),
(854, 'atto_superscript', 'version', '2017051500'),
(855, 'atto_table', 'version', '2017051500'),
(856, 'atto_title', 'version', '2017051500'),
(857, 'atto_underline', 'version', '2017051500'),
(858, 'atto_undo', 'version', '2017051500'),
(859, 'atto_unorderedlist', 'version', '2017051500'),
(860, 'tinymce_ctrlhelp', 'version', '2017051500'),
(861, 'tinymce_managefiles', 'version', '2017051500'),
(862, 'tinymce_moodleemoticon', 'version', '2017051500'),
(863, 'tinymce_moodleimage', 'version', '2017051500'),
(864, 'tinymce_moodlemedia', 'version', '2017051500'),
(865, 'tinymce_moodlenolink', 'version', '2017051500'),
(866, 'tinymce_pdw', 'version', '2017051500'),
(867, 'tinymce_spellchecker', 'version', '2017051500'),
(869, 'tinymce_wrap', 'version', '2017051500'),
(870, 'logstore_database', 'version', '2017062600'),
(871, 'logstore_legacy', 'version', '2017051500'),
(872, 'logstore_standard', 'version', '2017051500'),
(873, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(874, 'assign', 'showrecentsubmissions', '0'),
(875, 'assign', 'submissionreceipts', '1'),
(876, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(877, 'assign', 'maxperpage', '-1'),
(878, 'assign', 'alwaysshowdescription', '1'),
(879, 'assign', 'alwaysshowdescription_adv', ''),
(880, 'assign', 'alwaysshowdescription_locked', ''),
(881, 'assign', 'allowsubmissionsfromdate', '0'),
(882, 'assign', 'allowsubmissionsfromdate_enabled', '1'),
(883, 'assign', 'allowsubmissionsfromdate_adv', ''),
(884, 'assign', 'duedate', '604800'),
(885, 'assign', 'duedate_enabled', '1'),
(886, 'assign', 'duedate_adv', ''),
(887, 'assign', 'cutoffdate', '1209600'),
(888, 'assign', 'cutoffdate_enabled', ''),
(889, 'assign', 'cutoffdate_adv', ''),
(890, 'assign', 'gradingduedate', '1209600'),
(891, 'assign', 'gradingduedate_enabled', '1'),
(892, 'assign', 'gradingduedate_adv', ''),
(893, 'assign', 'submissiondrafts', '0'),
(894, 'assign', 'submissiondrafts_adv', ''),
(895, 'assign', 'submissiondrafts_locked', ''),
(896, 'assign', 'requiresubmissionstatement', '0'),
(897, 'assign', 'requiresubmissionstatement_adv', ''),
(898, 'assign', 'requiresubmissionstatement_locked', ''),
(899, 'assign', 'attemptreopenmethod', 'none'),
(900, 'assign', 'attemptreopenmethod_adv', ''),
(901, 'assign', 'attemptreopenmethod_locked', ''),
(902, 'assign', 'maxattempts', '-1'),
(903, 'assign', 'maxattempts_adv', ''),
(904, 'assign', 'maxattempts_locked', ''),
(905, 'assign', 'teamsubmission', '0'),
(906, 'assign', 'teamsubmission_adv', ''),
(907, 'assign', 'teamsubmission_locked', ''),
(908, 'assign', 'preventsubmissionnotingroup', '0'),
(909, 'assign', 'preventsubmissionnotingroup_adv', ''),
(910, 'assign', 'preventsubmissionnotingroup_locked', ''),
(911, 'assign', 'requireallteammemberssubmit', '0'),
(912, 'assign', 'requireallteammemberssubmit_adv', ''),
(913, 'assign', 'requireallteammemberssubmit_locked', ''),
(914, 'assign', 'teamsubmissiongroupingid', ''),
(915, 'assign', 'teamsubmissiongroupingid_adv', ''),
(916, 'assign', 'sendnotifications', '0'),
(917, 'assign', 'sendnotifications_adv', ''),
(918, 'assign', 'sendnotifications_locked', ''),
(919, 'assign', 'sendlatenotifications', '0'),
(920, 'assign', 'sendlatenotifications_adv', ''),
(921, 'assign', 'sendlatenotifications_locked', ''),
(922, 'assign', 'sendstudentnotifications', '1'),
(923, 'assign', 'sendstudentnotifications_adv', ''),
(924, 'assign', 'sendstudentnotifications_locked', ''),
(925, 'assign', 'blindmarking', '0'),
(926, 'assign', 'blindmarking_adv', ''),
(927, 'assign', 'blindmarking_locked', ''),
(928, 'assign', 'markingworkflow', '0'),
(929, 'assign', 'markingworkflow_adv', ''),
(930, 'assign', 'markingworkflow_locked', ''),
(931, 'assign', 'markingallocation', '0'),
(932, 'assign', 'markingallocation_adv', ''),
(933, 'assign', 'markingallocation_locked', ''),
(934, 'assignsubmission_file', 'default', '1'),
(935, 'assignsubmission_file', 'maxfiles', '20'),
(936, 'assignsubmission_file', 'filetypes', ''),
(937, 'assignsubmission_file', 'maxbytes', '0'),
(938, 'assignsubmission_onlinetext', 'default', '0'),
(939, 'assignfeedback_comments', 'default', '1'),
(940, 'assignfeedback_comments', 'inline', '0'),
(941, 'assignfeedback_comments', 'inline_adv', ''),
(942, 'assignfeedback_comments', 'inline_locked', ''),
(943, 'assignfeedback_editpdf', 'stamps', ''),
(944, 'assignfeedback_file', 'default', '0'),
(945, 'assignfeedback_offline', 'default', '0'),
(946, 'book', 'numberingoptions', '0,1,2,3'),
(947, 'book', 'navoptions', '0,1,2'),
(948, 'book', 'numbering', '1');
INSERT DELAYED IGNORE INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(949, 'book', 'navstyle', '1'),
(950, 'resource', 'framesize', '130'),
(951, 'resource', 'displayoptions', '0,1,4,5,6'),
(952, 'resource', 'printintro', '1'),
(953, 'resource', 'display', '0'),
(954, 'resource', 'showsize', '0'),
(955, 'resource', 'showtype', '0'),
(956, 'resource', 'showdate', '0'),
(957, 'resource', 'popupwidth', '620'),
(958, 'resource', 'popupheight', '450'),
(959, 'resource', 'filterfiles', '0'),
(960, 'folder', 'showexpanded', '1'),
(961, 'folder', 'maxsizetodownload', '0'),
(962, 'imscp', 'keepold', '1'),
(963, 'imscp', 'keepold_adv', ''),
(964, 'label', 'dndmedia', '1'),
(965, 'label', 'dndresizewidth', '400'),
(966, 'label', 'dndresizeheight', '400'),
(967, 'mod_lesson', 'mediafile', ''),
(968, 'mod_lesson', 'mediafile_adv', '1'),
(969, 'mod_lesson', 'mediawidth', '640'),
(970, 'mod_lesson', 'mediaheight', '480'),
(971, 'mod_lesson', 'mediaclose', '0'),
(972, 'mod_lesson', 'progressbar', '0'),
(973, 'mod_lesson', 'progressbar_adv', ''),
(974, 'mod_lesson', 'ongoing', '0'),
(975, 'mod_lesson', 'ongoing_adv', '1'),
(976, 'mod_lesson', 'displayleftmenu', '0'),
(977, 'mod_lesson', 'displayleftmenu_adv', ''),
(978, 'mod_lesson', 'displayleftif', '0'),
(979, 'mod_lesson', 'displayleftif_adv', '1'),
(980, 'mod_lesson', 'slideshow', '0'),
(981, 'mod_lesson', 'slideshow_adv', '1'),
(982, 'mod_lesson', 'slideshowwidth', '640'),
(983, 'mod_lesson', 'slideshowheight', '480'),
(984, 'mod_lesson', 'slideshowbgcolor', '#FFFFFF'),
(985, 'mod_lesson', 'maxanswers', '5'),
(986, 'mod_lesson', 'maxanswers_adv', '1'),
(987, 'mod_lesson', 'defaultfeedback', '0'),
(988, 'mod_lesson', 'defaultfeedback_adv', '1'),
(989, 'mod_lesson', 'activitylink', ''),
(990, 'mod_lesson', 'activitylink_adv', '1'),
(991, 'mod_lesson', 'timelimit', '0'),
(992, 'mod_lesson', 'timelimit_adv', ''),
(993, 'mod_lesson', 'password', '0'),
(994, 'mod_lesson', 'password_adv', '1'),
(995, 'mod_lesson', 'modattempts', '0'),
(996, 'mod_lesson', 'modattempts_adv', ''),
(997, 'mod_lesson', 'displayreview', '0'),
(998, 'mod_lesson', 'displayreview_adv', ''),
(999, 'mod_lesson', 'maximumnumberofattempts', '1'),
(1000, 'mod_lesson', 'maximumnumberofattempts_adv', ''),
(1001, 'mod_lesson', 'defaultnextpage', '0'),
(1002, 'mod_lesson', 'defaultnextpage_adv', '1'),
(1003, 'mod_lesson', 'numberofpagestoshow', '1'),
(1004, 'mod_lesson', 'numberofpagestoshow_adv', '1'),
(1005, 'mod_lesson', 'practice', '0'),
(1006, 'mod_lesson', 'practice_adv', ''),
(1007, 'mod_lesson', 'customscoring', '1'),
(1008, 'mod_lesson', 'customscoring_adv', '1'),
(1009, 'mod_lesson', 'retakesallowed', '0'),
(1010, 'mod_lesson', 'retakesallowed_adv', ''),
(1011, 'mod_lesson', 'handlingofretakes', '0'),
(1012, 'mod_lesson', 'handlingofretakes_adv', '1'),
(1013, 'mod_lesson', 'minimumnumberofquestions', '0'),
(1014, 'mod_lesson', 'minimumnumberofquestions_adv', '1'),
(1015, 'page', 'displayoptions', '5'),
(1016, 'page', 'printheading', '1'),
(1017, 'page', 'printintro', '0'),
(1018, 'page', 'display', '5'),
(1019, 'page', 'popupwidth', '620'),
(1020, 'page', 'popupheight', '450'),
(1021, 'quiz', 'timelimit', '0'),
(1022, 'quiz', 'timelimit_adv', ''),
(1023, 'quiz', 'overduehandling', 'autosubmit'),
(1024, 'quiz', 'overduehandling_adv', ''),
(1025, 'quiz', 'graceperiod', '86400'),
(1026, 'quiz', 'graceperiod_adv', ''),
(1027, 'quiz', 'graceperiodmin', '60'),
(1028, 'quiz', 'attempts', '0'),
(1029, 'quiz', 'attempts_adv', ''),
(1030, 'quiz', 'grademethod', '1'),
(1031, 'quiz', 'grademethod_adv', ''),
(1032, 'quiz', 'maximumgrade', '10'),
(1033, 'quiz', 'questionsperpage', '1'),
(1034, 'quiz', 'questionsperpage_adv', ''),
(1035, 'quiz', 'navmethod', 'free'),
(1036, 'quiz', 'navmethod_adv', '1'),
(1037, 'quiz', 'shuffleanswers', '1'),
(1038, 'quiz', 'shuffleanswers_adv', ''),
(1039, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(1040, 'quiz', 'canredoquestions', '0'),
(1041, 'quiz', 'canredoquestions_adv', '1'),
(1042, 'quiz', 'attemptonlast', '0'),
(1043, 'quiz', 'attemptonlast_adv', '1'),
(1044, 'quiz', 'reviewattempt', '69904'),
(1045, 'quiz', 'reviewcorrectness', '69904'),
(1046, 'quiz', 'reviewmarks', '69904'),
(1047, 'quiz', 'reviewspecificfeedback', '69904'),
(1048, 'quiz', 'reviewgeneralfeedback', '69904'),
(1049, 'quiz', 'reviewrightanswer', '69904'),
(1050, 'quiz', 'reviewoverallfeedback', '4368'),
(1051, 'quiz', 'showuserpicture', '0'),
(1052, 'quiz', 'showuserpicture_adv', ''),
(1053, 'quiz', 'decimalpoints', '2'),
(1054, 'quiz', 'decimalpoints_adv', ''),
(1055, 'quiz', 'questiondecimalpoints', '-1'),
(1056, 'quiz', 'questiondecimalpoints_adv', '1'),
(1057, 'quiz', 'showblocks', '0'),
(1058, 'quiz', 'showblocks_adv', '1'),
(1059, 'quiz', 'password', ''),
(1060, 'quiz', 'password_adv', ''),
(1061, 'quiz', 'subnet', ''),
(1062, 'quiz', 'subnet_adv', '1'),
(1063, 'quiz', 'delay1', '0'),
(1064, 'quiz', 'delay1_adv', '1'),
(1065, 'quiz', 'delay2', '0'),
(1066, 'quiz', 'delay2_adv', '1'),
(1067, 'quiz', 'browsersecurity', '-'),
(1068, 'quiz', 'browsersecurity_adv', '1'),
(1069, 'quiz', 'initialnumfeedbacks', '2'),
(1070, 'quiz', 'autosaveperiod', '60'),
(1071, 'scorm', 'displaycoursestructure', '0'),
(1072, 'scorm', 'displaycoursestructure_adv', ''),
(1073, 'scorm', 'popup', '0'),
(1074, 'scorm', 'popup_adv', ''),
(1075, 'scorm', 'displayactivityname', '1'),
(1076, 'scorm', 'framewidth', '100'),
(1077, 'scorm', 'framewidth_adv', '1'),
(1078, 'scorm', 'frameheight', '500'),
(1079, 'scorm', 'frameheight_adv', '1'),
(1080, 'scorm', 'winoptgrp_adv', '1'),
(1081, 'scorm', 'scrollbars', '0'),
(1082, 'scorm', 'directories', '0'),
(1083, 'scorm', 'location', '0'),
(1084, 'scorm', 'menubar', '0'),
(1085, 'scorm', 'toolbar', '0'),
(1086, 'scorm', 'status', '0'),
(1087, 'scorm', 'skipview', '0'),
(1088, 'scorm', 'skipview_adv', '1'),
(1089, 'scorm', 'hidebrowse', '0'),
(1090, 'scorm', 'hidebrowse_adv', '1'),
(1091, 'scorm', 'hidetoc', '0'),
(1092, 'scorm', 'hidetoc_adv', '1'),
(1093, 'scorm', 'nav', '1'),
(1094, 'scorm', 'nav_adv', '1'),
(1095, 'scorm', 'navpositionleft', '-100'),
(1096, 'scorm', 'navpositionleft_adv', '1'),
(1097, 'scorm', 'navpositiontop', '-100'),
(1098, 'scorm', 'navpositiontop_adv', '1'),
(1099, 'scorm', 'collapsetocwinsize', '767'),
(1100, 'scorm', 'collapsetocwinsize_adv', '1'),
(1101, 'scorm', 'displayattemptstatus', '1'),
(1102, 'scorm', 'displayattemptstatus_adv', ''),
(1103, 'scorm', 'grademethod', '1'),
(1104, 'scorm', 'maxgrade', '100'),
(1105, 'scorm', 'maxattempt', '0'),
(1106, 'scorm', 'whatgrade', '0'),
(1107, 'scorm', 'forcecompleted', '0'),
(1108, 'scorm', 'forcenewattempt', '0'),
(1109, 'scorm', 'autocommit', '0'),
(1110, 'scorm', 'masteryoverride', '1'),
(1111, 'scorm', 'lastattemptlock', '0'),
(1112, 'scorm', 'auto', '0'),
(1113, 'scorm', 'updatefreq', '0'),
(1114, 'scorm', 'scorm12standard', '1'),
(1115, 'scorm', 'allowtypeexternal', '0'),
(1116, 'scorm', 'allowtypelocalsync', '0'),
(1117, 'scorm', 'allowtypeexternalaicc', '0'),
(1118, 'scorm', 'allowaicchacp', '0'),
(1119, 'scorm', 'aicchacptimeout', '30'),
(1120, 'scorm', 'aicchacpkeepsessiondata', '1'),
(1121, 'scorm', 'aiccuserid', '1'),
(1122, 'scorm', 'forcejavascript', '1'),
(1123, 'scorm', 'allowapidebug', '0'),
(1124, 'scorm', 'apidebugmask', '.*'),
(1125, 'scorm', 'protectpackagedownloads', '0'),
(1126, 'url', 'framesize', '130'),
(1127, 'url', 'secretphrase', ''),
(1128, 'url', 'rolesinparams', '0'),
(1129, 'url', 'displayoptions', '0,1,5,6'),
(1130, 'url', 'printintro', '1'),
(1131, 'url', 'display', '0'),
(1132, 'url', 'popupwidth', '620'),
(1133, 'url', 'popupheight', '450'),
(1134, 'workshop', 'grade', '80'),
(1135, 'workshop', 'gradinggrade', '20'),
(1136, 'workshop', 'gradedecimals', '0'),
(1137, 'workshop', 'maxbytes', '0'),
(1138, 'workshop', 'strategy', 'accumulative'),
(1139, 'workshop', 'examplesmode', '0'),
(1140, 'workshopallocation_random', 'numofreviews', '5'),
(1141, 'workshopform_numerrors', 'grade0', 'No'),
(1142, 'workshopform_numerrors', 'grade1', 'Yes'),
(1143, 'workshopeval_best', 'comparison', '5'),
(1144, 'tool_recyclebin', 'coursebinenable', '1'),
(1145, 'tool_recyclebin', 'coursebinexpiry', '604800'),
(1146, 'tool_recyclebin', 'categorybinenable', '1'),
(1147, 'tool_recyclebin', 'categorybinexpiry', '604800'),
(1148, 'tool_recyclebin', 'autohide', '1'),
(1149, 'antivirus_clamav', 'runningmethod', 'commandline'),
(1150, 'antivirus_clamav', 'pathtoclam', ''),
(1151, 'antivirus_clamav', 'pathtounixsocket', ''),
(1152, 'antivirus_clamav', 'clamfailureonupload', 'donothing'),
(1153, 'auth_cas', 'hostname', ''),
(1154, 'auth_cas', 'baseuri', ''),
(1155, 'auth_cas', 'port', '0'),
(1156, 'auth_cas', 'casversion', '2.0'),
(1157, 'auth_cas', 'language', 'CAS_Languages_English'),
(1158, 'auth_cas', 'proxycas', '0'),
(1159, 'auth_cas', 'logoutcas', '0'),
(1160, 'auth_cas', 'multiauth', '0'),
(1161, 'auth_cas', 'certificate_check', '0'),
(1162, 'auth_cas', 'certificate_path', ''),
(1163, 'auth_cas', 'curl_ssl_version', ''),
(1164, 'auth_cas', 'logout_return_url', ''),
(1165, 'auth_cas', 'host_url', ''),
(1166, 'auth_cas', 'ldap_version', '3'),
(1167, 'auth_cas', 'start_tls', '0'),
(1168, 'auth_cas', 'ldapencoding', 'utf-8'),
(1169, 'auth_cas', 'pagesize', '250'),
(1170, 'auth_cas', 'bind_dn', ''),
(1171, 'auth_cas', 'bind_pw', ''),
(1172, 'auth_cas', 'user_type', 'default'),
(1173, 'auth_cas', 'contexts', ''),
(1174, 'auth_cas', 'search_sub', '0'),
(1175, 'auth_cas', 'opt_deref', '0'),
(1176, 'auth_cas', 'user_attribute', ''),
(1177, 'auth_cas', 'memberattribute', ''),
(1178, 'auth_cas', 'memberattribute_isdn', ''),
(1179, 'auth_cas', 'objectclass', ''),
(1180, 'auth_cas', 'attrcreators', ''),
(1181, 'auth_cas', 'groupecreators', ''),
(1182, 'auth_cas', 'removeuser', '0'),
(1183, 'auth_cas', 'field_map_firstname', ''),
(1184, 'auth_cas', 'field_updatelocal_firstname', 'oncreate'),
(1185, 'auth_cas', 'field_updateremote_firstname', '0'),
(1186, 'auth_cas', 'field_lock_firstname', 'unlocked'),
(1187, 'auth_cas', 'field_map_lastname', ''),
(1188, 'auth_cas', 'field_updatelocal_lastname', 'oncreate'),
(1189, 'auth_cas', 'field_updateremote_lastname', '0'),
(1190, 'auth_cas', 'field_lock_lastname', 'unlocked'),
(1191, 'auth_cas', 'field_map_email', ''),
(1192, 'auth_cas', 'field_updatelocal_email', 'oncreate'),
(1193, 'auth_cas', 'field_updateremote_email', '0'),
(1194, 'auth_cas', 'field_lock_email', 'unlocked'),
(1195, 'auth_cas', 'field_map_city', ''),
(1196, 'auth_cas', 'field_updatelocal_city', 'oncreate'),
(1197, 'auth_cas', 'field_updateremote_city', '0'),
(1198, 'auth_cas', 'field_lock_city', 'unlocked'),
(1199, 'auth_cas', 'field_map_country', ''),
(1200, 'auth_cas', 'field_updatelocal_country', 'oncreate'),
(1201, 'auth_cas', 'field_updateremote_country', '0'),
(1202, 'auth_cas', 'field_lock_country', 'unlocked'),
(1203, 'auth_cas', 'field_map_lang', ''),
(1204, 'auth_cas', 'field_updatelocal_lang', 'oncreate'),
(1205, 'auth_cas', 'field_updateremote_lang', '0'),
(1206, 'auth_cas', 'field_lock_lang', 'unlocked'),
(1207, 'auth_cas', 'field_map_description', ''),
(1208, 'auth_cas', 'field_updatelocal_description', 'oncreate'),
(1209, 'auth_cas', 'field_updateremote_description', '0'),
(1210, 'auth_cas', 'field_lock_description', 'unlocked'),
(1211, 'auth_cas', 'field_map_url', ''),
(1212, 'auth_cas', 'field_updatelocal_url', 'oncreate'),
(1213, 'auth_cas', 'field_updateremote_url', '0'),
(1214, 'auth_cas', 'field_lock_url', 'unlocked'),
(1215, 'auth_cas', 'field_map_idnumber', ''),
(1216, 'auth_cas', 'field_updatelocal_idnumber', 'oncreate'),
(1217, 'auth_cas', 'field_updateremote_idnumber', '0'),
(1218, 'auth_cas', 'field_lock_idnumber', 'unlocked'),
(1219, 'auth_cas', 'field_map_institution', ''),
(1220, 'auth_cas', 'field_updatelocal_institution', 'oncreate'),
(1221, 'auth_cas', 'field_updateremote_institution', '0'),
(1222, 'auth_cas', 'field_lock_institution', 'unlocked'),
(1223, 'auth_cas', 'field_map_department', ''),
(1224, 'auth_cas', 'field_updatelocal_department', 'oncreate'),
(1225, 'auth_cas', 'field_updateremote_department', '0'),
(1226, 'auth_cas', 'field_lock_department', 'unlocked'),
(1227, 'auth_cas', 'field_map_phone1', ''),
(1228, 'auth_cas', 'field_updatelocal_phone1', 'oncreate'),
(1229, 'auth_cas', 'field_updateremote_phone1', '0'),
(1230, 'auth_cas', 'field_lock_phone1', 'unlocked'),
(1231, 'auth_cas', 'field_map_phone2', ''),
(1232, 'auth_cas', 'field_updatelocal_phone2', 'oncreate'),
(1233, 'auth_cas', 'field_updateremote_phone2', '0'),
(1234, 'auth_cas', 'field_lock_phone2', 'unlocked'),
(1235, 'auth_cas', 'field_map_address', ''),
(1236, 'auth_cas', 'field_updatelocal_address', 'oncreate'),
(1237, 'auth_cas', 'field_updateremote_address', '0'),
(1238, 'auth_cas', 'field_lock_address', 'unlocked'),
(1239, 'auth_cas', 'field_map_firstnamephonetic', ''),
(1240, 'auth_cas', 'field_updatelocal_firstnamephonetic', 'oncreate'),
(1241, 'auth_cas', 'field_updateremote_firstnamephonetic', '0'),
(1242, 'auth_cas', 'field_lock_firstnamephonetic', 'unlocked'),
(1243, 'auth_cas', 'field_map_lastnamephonetic', ''),
(1244, 'auth_cas', 'field_updatelocal_lastnamephonetic', 'oncreate'),
(1245, 'auth_cas', 'field_updateremote_lastnamephonetic', '0'),
(1246, 'auth_cas', 'field_lock_lastnamephonetic', 'unlocked'),
(1247, 'auth_cas', 'field_map_middlename', ''),
(1248, 'auth_cas', 'field_updatelocal_middlename', 'oncreate'),
(1249, 'auth_cas', 'field_updateremote_middlename', '0'),
(1250, 'auth_cas', 'field_lock_middlename', 'unlocked'),
(1251, 'auth_cas', 'field_map_alternatename', ''),
(1252, 'auth_cas', 'field_updatelocal_alternatename', 'oncreate'),
(1253, 'auth_cas', 'field_updateremote_alternatename', '0'),
(1254, 'auth_cas', 'field_lock_alternatename', 'unlocked'),
(1255, 'auth_email', 'recaptcha', '0'),
(1256, 'auth_email', 'field_lock_firstname', 'unlocked'),
(1257, 'auth_email', 'field_lock_lastname', 'unlocked'),
(1258, 'auth_email', 'field_lock_email', 'unlocked'),
(1259, 'auth_email', 'field_lock_city', 'unlocked'),
(1260, 'auth_email', 'field_lock_country', 'unlocked'),
(1261, 'auth_email', 'field_lock_lang', 'unlocked'),
(1262, 'auth_email', 'field_lock_description', 'unlocked'),
(1263, 'auth_email', 'field_lock_url', 'unlocked'),
(1264, 'auth_email', 'field_lock_idnumber', 'unlocked'),
(1265, 'auth_email', 'field_lock_institution', 'unlocked'),
(1266, 'auth_email', 'field_lock_department', 'unlocked'),
(1267, 'auth_email', 'field_lock_phone1', 'unlocked'),
(1268, 'auth_email', 'field_lock_phone2', 'unlocked'),
(1269, 'auth_email', 'field_lock_address', 'unlocked'),
(1270, 'auth_email', 'field_lock_firstnamephonetic', 'unlocked'),
(1271, 'auth_email', 'field_lock_lastnamephonetic', 'unlocked'),
(1272, 'auth_email', 'field_lock_middlename', 'unlocked'),
(1273, 'auth_email', 'field_lock_alternatename', 'unlocked'),
(1274, 'auth_db', 'host', '127.0.0.1'),
(1275, 'auth_db', 'type', 'mysqli'),
(1276, 'auth_db', 'sybasequoting', '0'),
(1277, 'auth_db', 'name', ''),
(1278, 'auth_db', 'user', ''),
(1279, 'auth_db', 'pass', ''),
(1280, 'auth_db', 'table', ''),
(1281, 'auth_db', 'fielduser', ''),
(1282, 'auth_db', 'fieldpass', ''),
(1283, 'auth_db', 'passtype', 'plaintext'),
(1284, 'auth_db', 'extencoding', 'utf-8'),
(1285, 'auth_db', 'setupsql', ''),
(1286, 'auth_db', 'debugauthdb', '0'),
(1287, 'auth_db', 'changepasswordurl', ''),
(1288, 'auth_db', 'removeuser', '0'),
(1289, 'auth_db', 'updateusers', '0'),
(1290, 'auth_db', 'field_map_firstname', ''),
(1291, 'auth_db', 'field_updatelocal_firstname', 'oncreate'),
(1292, 'auth_db', 'field_updateremote_firstname', '0'),
(1293, 'auth_db', 'field_lock_firstname', 'unlocked'),
(1294, 'auth_db', 'field_map_lastname', ''),
(1295, 'auth_db', 'field_updatelocal_lastname', 'oncreate'),
(1296, 'auth_db', 'field_updateremote_lastname', '0'),
(1297, 'auth_db', 'field_lock_lastname', 'unlocked'),
(1298, 'auth_db', 'field_map_email', ''),
(1299, 'auth_db', 'field_updatelocal_email', 'oncreate'),
(1300, 'auth_db', 'field_updateremote_email', '0'),
(1301, 'auth_db', 'field_lock_email', 'unlocked'),
(1302, 'auth_db', 'field_map_city', ''),
(1303, 'auth_db', 'field_updatelocal_city', 'oncreate'),
(1304, 'auth_db', 'field_updateremote_city', '0'),
(1305, 'auth_db', 'field_lock_city', 'unlocked'),
(1306, 'auth_db', 'field_map_country', ''),
(1307, 'auth_db', 'field_updatelocal_country', 'oncreate'),
(1308, 'auth_db', 'field_updateremote_country', '0'),
(1309, 'auth_db', 'field_lock_country', 'unlocked'),
(1310, 'auth_db', 'field_map_lang', ''),
(1311, 'auth_db', 'field_updatelocal_lang', 'oncreate'),
(1312, 'auth_db', 'field_updateremote_lang', '0'),
(1313, 'auth_db', 'field_lock_lang', 'unlocked'),
(1314, 'auth_db', 'field_map_description', ''),
(1315, 'auth_db', 'field_updatelocal_description', 'oncreate'),
(1316, 'auth_db', 'field_updateremote_description', '0'),
(1317, 'auth_db', 'field_lock_description', 'unlocked'),
(1318, 'auth_db', 'field_map_url', ''),
(1319, 'auth_db', 'field_updatelocal_url', 'oncreate'),
(1320, 'auth_db', 'field_updateremote_url', '0'),
(1321, 'auth_db', 'field_lock_url', 'unlocked'),
(1322, 'auth_db', 'field_map_idnumber', ''),
(1323, 'auth_db', 'field_updatelocal_idnumber', 'oncreate'),
(1324, 'auth_db', 'field_updateremote_idnumber', '0'),
(1325, 'auth_db', 'field_lock_idnumber', 'unlocked'),
(1326, 'auth_db', 'field_map_institution', ''),
(1327, 'auth_db', 'field_updatelocal_institution', 'oncreate'),
(1328, 'auth_db', 'field_updateremote_institution', '0'),
(1329, 'auth_db', 'field_lock_institution', 'unlocked'),
(1330, 'auth_db', 'field_map_department', ''),
(1331, 'auth_db', 'field_updatelocal_department', 'oncreate'),
(1332, 'auth_db', 'field_updateremote_department', '0'),
(1333, 'auth_db', 'field_lock_department', 'unlocked'),
(1334, 'auth_db', 'field_map_phone1', ''),
(1335, 'auth_db', 'field_updatelocal_phone1', 'oncreate'),
(1336, 'auth_db', 'field_updateremote_phone1', '0'),
(1337, 'auth_db', 'field_lock_phone1', 'unlocked'),
(1338, 'auth_db', 'field_map_phone2', ''),
(1339, 'auth_db', 'field_updatelocal_phone2', 'oncreate'),
(1340, 'auth_db', 'field_updateremote_phone2', '0'),
(1341, 'auth_db', 'field_lock_phone2', 'unlocked'),
(1342, 'auth_db', 'field_map_address', ''),
(1343, 'auth_db', 'field_updatelocal_address', 'oncreate'),
(1344, 'auth_db', 'field_updateremote_address', '0'),
(1345, 'auth_db', 'field_lock_address', 'unlocked'),
(1346, 'auth_db', 'field_map_firstnamephonetic', ''),
(1347, 'auth_db', 'field_updatelocal_firstnamephonetic', 'oncreate'),
(1348, 'auth_db', 'field_updateremote_firstnamephonetic', '0'),
(1349, 'auth_db', 'field_lock_firstnamephonetic', 'unlocked'),
(1350, 'auth_db', 'field_map_lastnamephonetic', ''),
(1351, 'auth_db', 'field_updatelocal_lastnamephonetic', 'oncreate'),
(1352, 'auth_db', 'field_updateremote_lastnamephonetic', '0'),
(1353, 'auth_db', 'field_lock_lastnamephonetic', 'unlocked'),
(1354, 'auth_db', 'field_map_middlename', ''),
(1355, 'auth_db', 'field_updatelocal_middlename', 'oncreate'),
(1356, 'auth_db', 'field_updateremote_middlename', '0'),
(1357, 'auth_db', 'field_lock_middlename', 'unlocked'),
(1358, 'auth_db', 'field_map_alternatename', ''),
(1359, 'auth_db', 'field_updatelocal_alternatename', 'oncreate'),
(1360, 'auth_db', 'field_updateremote_alternatename', '0'),
(1361, 'auth_db', 'field_lock_alternatename', 'unlocked'),
(1362, 'auth_ldap', 'host_url', ''),
(1363, 'auth_ldap', 'ldap_version', '3'),
(1364, 'auth_ldap', 'start_tls', '0'),
(1365, 'auth_ldap', 'ldapencoding', 'utf-8'),
(1366, 'auth_ldap', 'pagesize', '250'),
(1367, 'auth_ldap', 'preventpassindb', '0'),
(1368, 'auth_ldap', 'bind_dn', ''),
(1369, 'auth_ldap', 'bind_pw', ''),
(1370, 'auth_ldap', 'user_type', 'default'),
(1371, 'auth_ldap', 'contexts', ''),
(1372, 'auth_ldap', 'search_sub', '0'),
(1373, 'auth_ldap', 'opt_deref', '0'),
(1374, 'auth_ldap', 'user_attribute', ''),
(1375, 'auth_ldap', 'suspended_attribute', ''),
(1376, 'auth_ldap', 'memberattribute', ''),
(1377, 'auth_ldap', 'memberattribute_isdn', ''),
(1378, 'auth_ldap', 'objectclass', ''),
(1379, 'auth_ldap', 'forcechangepassword', '0'),
(1380, 'auth_ldap', 'stdchangepassword', '0'),
(1381, 'auth_ldap', 'passtype', 'plaintext'),
(1382, 'auth_ldap', 'changepasswordurl', ''),
(1383, 'auth_ldap', 'expiration', '0'),
(1384, 'auth_ldap', 'expiration_warning', ''),
(1385, 'auth_ldap', 'expireattr', ''),
(1386, 'auth_ldap', 'gracelogins', '0'),
(1387, 'auth_ldap', 'graceattr', ''),
(1388, 'auth_ldap', 'auth_user_create', '0'),
(1389, 'auth_ldap', 'create_context', ''),
(1390, 'auth_ldap', 'managercontext', ''),
(1391, 'auth_ldap', 'coursecreatorcontext', ''),
(1392, 'auth_ldap', 'removeuser', '0'),
(1393, 'auth_ldap', 'sync_suspended', '0'),
(1394, 'auth_ldap', 'ntlmsso_enabled', '0'),
(1395, 'auth_ldap', 'ntlmsso_subnet', ''),
(1396, 'auth_ldap', 'ntlmsso_ie_fastpath', '0'),
(1397, 'auth_ldap', 'ntlmsso_type', 'ntlm'),
(1398, 'auth_ldap', 'ntlmsso_remoteuserformat', ''),
(1399, 'auth_ldap', 'field_map_firstname', ''),
(1400, 'auth_ldap', 'field_updatelocal_firstname', 'oncreate'),
(1401, 'auth_ldap', 'field_updateremote_firstname', '0'),
(1402, 'auth_ldap', 'field_lock_firstname', 'unlocked'),
(1403, 'auth_ldap', 'field_map_lastname', ''),
(1404, 'auth_ldap', 'field_updatelocal_lastname', 'oncreate'),
(1405, 'auth_ldap', 'field_updateremote_lastname', '0'),
(1406, 'auth_ldap', 'field_lock_lastname', 'unlocked'),
(1407, 'auth_ldap', 'field_map_email', ''),
(1408, 'auth_ldap', 'field_updatelocal_email', 'oncreate'),
(1409, 'auth_ldap', 'field_updateremote_email', '0'),
(1410, 'auth_ldap', 'field_lock_email', 'unlocked'),
(1411, 'auth_ldap', 'field_map_city', ''),
(1412, 'auth_ldap', 'field_updatelocal_city', 'oncreate'),
(1413, 'auth_ldap', 'field_updateremote_city', '0'),
(1414, 'auth_ldap', 'field_lock_city', 'unlocked'),
(1415, 'auth_ldap', 'field_map_country', ''),
(1416, 'auth_ldap', 'field_updatelocal_country', 'oncreate'),
(1417, 'auth_ldap', 'field_updateremote_country', '0'),
(1418, 'auth_ldap', 'field_lock_country', 'unlocked'),
(1419, 'auth_ldap', 'field_map_lang', ''),
(1420, 'auth_ldap', 'field_updatelocal_lang', 'oncreate'),
(1421, 'auth_ldap', 'field_updateremote_lang', '0'),
(1422, 'auth_ldap', 'field_lock_lang', 'unlocked'),
(1423, 'auth_ldap', 'field_map_description', ''),
(1424, 'auth_ldap', 'field_updatelocal_description', 'oncreate'),
(1425, 'auth_ldap', 'field_updateremote_description', '0'),
(1426, 'auth_ldap', 'field_lock_description', 'unlocked'),
(1427, 'auth_ldap', 'field_map_url', ''),
(1428, 'auth_ldap', 'field_updatelocal_url', 'oncreate'),
(1429, 'auth_ldap', 'field_updateremote_url', '0'),
(1430, 'auth_ldap', 'field_lock_url', 'unlocked'),
(1431, 'auth_ldap', 'field_map_idnumber', ''),
(1432, 'auth_ldap', 'field_updatelocal_idnumber', 'oncreate'),
(1433, 'auth_ldap', 'field_updateremote_idnumber', '0'),
(1434, 'auth_ldap', 'field_lock_idnumber', 'unlocked'),
(1435, 'auth_ldap', 'field_map_institution', ''),
(1436, 'auth_ldap', 'field_updatelocal_institution', 'oncreate'),
(1437, 'auth_ldap', 'field_updateremote_institution', '0'),
(1438, 'auth_ldap', 'field_lock_institution', 'unlocked'),
(1439, 'auth_ldap', 'field_map_department', ''),
(1440, 'auth_ldap', 'field_updatelocal_department', 'oncreate'),
(1441, 'auth_ldap', 'field_updateremote_department', '0'),
(1442, 'auth_ldap', 'field_lock_department', 'unlocked'),
(1443, 'auth_ldap', 'field_map_phone1', ''),
(1444, 'auth_ldap', 'field_updatelocal_phone1', 'oncreate'),
(1445, 'auth_ldap', 'field_updateremote_phone1', '0'),
(1446, 'auth_ldap', 'field_lock_phone1', 'unlocked'),
(1447, 'auth_ldap', 'field_map_phone2', ''),
(1448, 'auth_ldap', 'field_updatelocal_phone2', 'oncreate'),
(1449, 'auth_ldap', 'field_updateremote_phone2', '0'),
(1450, 'auth_ldap', 'field_lock_phone2', 'unlocked'),
(1451, 'auth_ldap', 'field_map_address', ''),
(1452, 'auth_ldap', 'field_updatelocal_address', 'oncreate'),
(1453, 'auth_ldap', 'field_updateremote_address', '0'),
(1454, 'auth_ldap', 'field_lock_address', 'unlocked'),
(1455, 'auth_ldap', 'field_map_firstnamephonetic', ''),
(1456, 'auth_ldap', 'field_updatelocal_firstnamephonetic', 'oncreate'),
(1457, 'auth_ldap', 'field_updateremote_firstnamephonetic', '0'),
(1458, 'auth_ldap', 'field_lock_firstnamephonetic', 'unlocked'),
(1459, 'auth_ldap', 'field_map_lastnamephonetic', ''),
(1460, 'auth_ldap', 'field_updatelocal_lastnamephonetic', 'oncreate'),
(1461, 'auth_ldap', 'field_updateremote_lastnamephonetic', '0'),
(1462, 'auth_ldap', 'field_lock_lastnamephonetic', 'unlocked'),
(1463, 'auth_ldap', 'field_map_middlename', ''),
(1464, 'auth_ldap', 'field_updatelocal_middlename', 'oncreate'),
(1465, 'auth_ldap', 'field_updateremote_middlename', '0'),
(1466, 'auth_ldap', 'field_lock_middlename', 'unlocked'),
(1467, 'auth_ldap', 'field_map_alternatename', ''),
(1468, 'auth_ldap', 'field_updatelocal_alternatename', 'oncreate'),
(1469, 'auth_ldap', 'field_updateremote_alternatename', '0'),
(1470, 'auth_ldap', 'field_lock_alternatename', 'unlocked'),
(1471, 'auth_manual', 'expiration', '0'),
(1472, 'auth_manual', 'expirationtime', '30'),
(1473, 'auth_manual', 'expiration_warning', '0'),
(1474, 'auth_manual', 'field_lock_firstname', 'unlocked'),
(1475, 'auth_manual', 'field_lock_lastname', 'unlocked'),
(1476, 'auth_manual', 'field_lock_email', 'unlocked'),
(1477, 'auth_manual', 'field_lock_city', 'unlocked'),
(1478, 'auth_manual', 'field_lock_country', 'unlocked'),
(1479, 'auth_manual', 'field_lock_lang', 'unlocked'),
(1480, 'auth_manual', 'field_lock_description', 'unlocked'),
(1481, 'auth_manual', 'field_lock_url', 'unlocked'),
(1482, 'auth_manual', 'field_lock_idnumber', 'unlocked'),
(1483, 'auth_manual', 'field_lock_institution', 'unlocked'),
(1484, 'auth_manual', 'field_lock_department', 'unlocked'),
(1485, 'auth_manual', 'field_lock_phone1', 'unlocked'),
(1486, 'auth_manual', 'field_lock_phone2', 'unlocked'),
(1487, 'auth_manual', 'field_lock_address', 'unlocked'),
(1488, 'auth_manual', 'field_lock_firstnamephonetic', 'unlocked'),
(1489, 'auth_manual', 'field_lock_lastnamephonetic', 'unlocked'),
(1490, 'auth_manual', 'field_lock_middlename', 'unlocked'),
(1491, 'auth_manual', 'field_lock_alternatename', 'unlocked'),
(1492, 'auth_mnet', 'rpc_negotiation_timeout', '30'),
(1493, 'auth_none', 'field_lock_firstname', 'unlocked'),
(1494, 'auth_none', 'field_lock_lastname', 'unlocked'),
(1495, 'auth_none', 'field_lock_email', 'unlocked'),
(1496, 'auth_none', 'field_lock_city', 'unlocked'),
(1497, 'auth_none', 'field_lock_country', 'unlocked'),
(1498, 'auth_none', 'field_lock_lang', 'unlocked'),
(1499, 'auth_none', 'field_lock_description', 'unlocked'),
(1500, 'auth_none', 'field_lock_url', 'unlocked'),
(1501, 'auth_none', 'field_lock_idnumber', 'unlocked'),
(1502, 'auth_none', 'field_lock_institution', 'unlocked'),
(1503, 'auth_none', 'field_lock_department', 'unlocked'),
(1504, 'auth_none', 'field_lock_phone1', 'unlocked'),
(1505, 'auth_none', 'field_lock_phone2', 'unlocked'),
(1506, 'auth_none', 'field_lock_address', 'unlocked'),
(1507, 'auth_none', 'field_lock_firstnamephonetic', 'unlocked'),
(1508, 'auth_none', 'field_lock_lastnamephonetic', 'unlocked'),
(1509, 'auth_none', 'field_lock_middlename', 'unlocked'),
(1510, 'auth_none', 'field_lock_alternatename', 'unlocked'),
(1511, 'auth_oauth2', 'field_lock_firstname', 'unlocked'),
(1512, 'auth_oauth2', 'field_lock_lastname', 'unlocked'),
(1513, 'auth_oauth2', 'field_lock_email', 'unlocked'),
(1514, 'auth_oauth2', 'field_lock_city', 'unlocked'),
(1515, 'auth_oauth2', 'field_lock_country', 'unlocked'),
(1516, 'auth_oauth2', 'field_lock_lang', 'unlocked'),
(1517, 'auth_oauth2', 'field_lock_description', 'unlocked'),
(1518, 'auth_oauth2', 'field_lock_url', 'unlocked'),
(1519, 'auth_oauth2', 'field_lock_idnumber', 'unlocked'),
(1520, 'auth_oauth2', 'field_lock_institution', 'unlocked'),
(1521, 'auth_oauth2', 'field_lock_department', 'unlocked'),
(1522, 'auth_oauth2', 'field_lock_phone1', 'unlocked'),
(1523, 'auth_oauth2', 'field_lock_phone2', 'unlocked'),
(1524, 'auth_oauth2', 'field_lock_address', 'unlocked'),
(1525, 'auth_oauth2', 'field_lock_firstnamephonetic', 'unlocked'),
(1526, 'auth_oauth2', 'field_lock_lastnamephonetic', 'unlocked'),
(1527, 'auth_oauth2', 'field_lock_middlename', 'unlocked'),
(1528, 'auth_oauth2', 'field_lock_alternatename', 'unlocked'),
(1529, 'auth_shibboleth', 'user_attribute', ''),
(1530, 'auth_shibboleth', 'convert_data', ''),
(1531, 'auth_shibboleth', 'alt_login', 'off'),
(1532, 'auth_shibboleth', 'organization_selection', 'urn:mace:organization1:providerID, Example Organization 1\r\n        https://another.idp-id.com/shibboleth, Other Example Organization, /Shibboleth.sso/DS/SWITCHaai\r\n        urn:mace:organization2:providerID, Example Organization 2, /Shibboleth.sso/WAYF/SWITCHaai'),
(1533, 'auth_shibboleth', 'logout_handler', ''),
(1534, 'auth_shibboleth', 'logout_return_url', ''),
(1535, 'auth_shibboleth', 'login_name', 'Shibboleth Login'),
(1536, 'auth_shibboleth', 'auth_instructions', 'Use the <a href="http://localhost/moodle/auth/shibboleth/index.php">Shibboleth login</a> to get access via Shibboleth, if your institution supports it.<br />Otherwise, use the normal login form shown here.'),
(1537, 'auth_shibboleth', 'changepasswordurl', ''),
(1538, 'auth_shibboleth', 'field_map_firstname', ''),
(1539, 'auth_shibboleth', 'field_updatelocal_firstname', 'oncreate'),
(1540, 'auth_shibboleth', 'field_lock_firstname', 'unlocked'),
(1541, 'auth_shibboleth', 'field_map_lastname', ''),
(1542, 'auth_shibboleth', 'field_updatelocal_lastname', 'oncreate'),
(1543, 'auth_shibboleth', 'field_lock_lastname', 'unlocked'),
(1544, 'auth_shibboleth', 'field_map_email', ''),
(1545, 'auth_shibboleth', 'field_updatelocal_email', 'oncreate'),
(1546, 'auth_shibboleth', 'field_lock_email', 'unlocked'),
(1547, 'auth_shibboleth', 'field_map_city', ''),
(1548, 'auth_shibboleth', 'field_updatelocal_city', 'oncreate'),
(1549, 'auth_shibboleth', 'field_lock_city', 'unlocked'),
(1550, 'auth_shibboleth', 'field_map_country', ''),
(1551, 'auth_shibboleth', 'field_updatelocal_country', 'oncreate'),
(1552, 'auth_shibboleth', 'field_lock_country', 'unlocked'),
(1553, 'auth_shibboleth', 'field_map_lang', ''),
(1554, 'auth_shibboleth', 'field_updatelocal_lang', 'oncreate'),
(1555, 'auth_shibboleth', 'field_lock_lang', 'unlocked'),
(1556, 'auth_shibboleth', 'field_map_description', ''),
(1557, 'auth_shibboleth', 'field_updatelocal_description', 'oncreate'),
(1558, 'auth_shibboleth', 'field_lock_description', 'unlocked'),
(1559, 'auth_shibboleth', 'field_map_url', ''),
(1560, 'auth_shibboleth', 'field_updatelocal_url', 'oncreate'),
(1561, 'auth_shibboleth', 'field_lock_url', 'unlocked'),
(1562, 'auth_shibboleth', 'field_map_idnumber', ''),
(1563, 'auth_shibboleth', 'field_updatelocal_idnumber', 'oncreate'),
(1564, 'auth_shibboleth', 'field_lock_idnumber', 'unlocked'),
(1565, 'auth_shibboleth', 'field_map_institution', ''),
(1566, 'auth_shibboleth', 'field_updatelocal_institution', 'oncreate'),
(1567, 'auth_shibboleth', 'field_lock_institution', 'unlocked'),
(1568, 'auth_shibboleth', 'field_map_department', ''),
(1569, 'auth_shibboleth', 'field_updatelocal_department', 'oncreate'),
(1570, 'auth_shibboleth', 'field_lock_department', 'unlocked'),
(1571, 'auth_shibboleth', 'field_map_phone1', ''),
(1572, 'auth_shibboleth', 'field_updatelocal_phone1', 'oncreate'),
(1573, 'auth_shibboleth', 'field_lock_phone1', 'unlocked'),
(1574, 'auth_shibboleth', 'field_map_phone2', ''),
(1575, 'auth_shibboleth', 'field_updatelocal_phone2', 'oncreate'),
(1576, 'auth_shibboleth', 'field_lock_phone2', 'unlocked'),
(1577, 'auth_shibboleth', 'field_map_address', ''),
(1578, 'auth_shibboleth', 'field_updatelocal_address', 'oncreate'),
(1579, 'auth_shibboleth', 'field_lock_address', 'unlocked'),
(1580, 'auth_shibboleth', 'field_map_firstnamephonetic', ''),
(1581, 'auth_shibboleth', 'field_updatelocal_firstnamephonetic', 'oncreate'),
(1582, 'auth_shibboleth', 'field_lock_firstnamephonetic', 'unlocked'),
(1583, 'auth_shibboleth', 'field_map_lastnamephonetic', ''),
(1584, 'auth_shibboleth', 'field_updatelocal_lastnamephonetic', 'oncreate'),
(1585, 'auth_shibboleth', 'field_lock_lastnamephonetic', 'unlocked'),
(1586, 'auth_shibboleth', 'field_map_middlename', ''),
(1587, 'auth_shibboleth', 'field_updatelocal_middlename', 'oncreate'),
(1588, 'auth_shibboleth', 'field_lock_middlename', 'unlocked'),
(1589, 'auth_shibboleth', 'field_map_alternatename', ''),
(1590, 'auth_shibboleth', 'field_updatelocal_alternatename', 'oncreate'),
(1591, 'auth_shibboleth', 'field_lock_alternatename', 'unlocked'),
(1592, 'block_activity_results', 'config_showbest', '3'),
(1593, 'block_activity_results', 'config_showbest_locked', ''),
(1594, 'block_activity_results', 'config_showworst', '0'),
(1595, 'block_activity_results', 'config_showworst_locked', ''),
(1596, 'block_activity_results', 'config_usegroups', '0'),
(1597, 'block_activity_results', 'config_usegroups_locked', ''),
(1598, 'block_activity_results', 'config_nameformat', '1'),
(1599, 'block_activity_results', 'config_nameformat_locked', ''),
(1600, 'block_activity_results', 'config_gradeformat', '1'),
(1601, 'block_activity_results', 'config_gradeformat_locked', ''),
(1602, 'block_activity_results', 'config_decimalpoints', '2'),
(1603, 'block_activity_results', 'config_decimalpoints_locked', ''),
(1604, 'block_myoverview', 'defaulttab', 'timeline'),
(1605, 'block_section_links', 'numsections1', '22'),
(1606, 'block_section_links', 'incby1', '2'),
(1607, 'block_section_links', 'numsections2', '40'),
(1608, 'block_section_links', 'incby2', '5'),
(1609, 'block_tag_youtube', 'apikey', ''),
(1610, 'format_singleactivity', 'activitytype', 'forum'),
(1611, 'fileconverter_googledrive', 'issuerid', ''),
(1612, 'enrol_cohort', 'roleid', '5'),
(1613, 'enrol_cohort', 'unenrolaction', '0'),
(1614, 'enrol_meta', 'nosyncroleids', ''),
(1615, 'enrol_meta', 'syncall', '1'),
(1616, 'enrol_meta', 'unenrolaction', '3'),
(1617, 'enrol_meta', 'coursesort', 'sortorder'),
(1618, 'enrol_database', 'dbtype', ''),
(1619, 'enrol_database', 'dbhost', 'localhost'),
(1620, 'enrol_database', 'dbuser', ''),
(1621, 'enrol_database', 'dbpass', ''),
(1622, 'enrol_database', 'dbname', ''),
(1623, 'enrol_database', 'dbencoding', 'utf-8'),
(1624, 'enrol_database', 'dbsetupsql', ''),
(1625, 'enrol_database', 'dbsybasequoting', '0'),
(1626, 'enrol_database', 'debugdb', '0'),
(1627, 'enrol_database', 'localcoursefield', 'idnumber'),
(1628, 'enrol_database', 'localuserfield', 'idnumber'),
(1629, 'enrol_database', 'localrolefield', 'shortname'),
(1630, 'enrol_database', 'localcategoryfield', 'id'),
(1631, 'enrol_database', 'remoteenroltable', ''),
(1632, 'enrol_database', 'remotecoursefield', ''),
(1633, 'enrol_database', 'remoteuserfield', ''),
(1634, 'enrol_database', 'remoterolefield', ''),
(1635, 'enrol_database', 'remoteotheruserfield', ''),
(1636, 'enrol_database', 'defaultrole', '5'),
(1637, 'enrol_database', 'ignorehiddencourses', '0'),
(1638, 'enrol_database', 'unenrolaction', '0'),
(1639, 'enrol_database', 'newcoursetable', ''),
(1640, 'enrol_database', 'newcoursefullname', 'fullname'),
(1641, 'enrol_database', 'newcourseshortname', 'shortname'),
(1642, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(1643, 'enrol_database', 'newcoursecategory', ''),
(1644, 'enrol_database', 'defaultcategory', '1'),
(1645, 'enrol_database', 'templatecourse', ''),
(1646, 'enrol_flatfile', 'location', ''),
(1647, 'enrol_flatfile', 'encoding', 'UTF-8'),
(1648, 'enrol_flatfile', 'mailstudents', '0'),
(1649, 'enrol_flatfile', 'mailteachers', '0'),
(1650, 'enrol_flatfile', 'mailadmins', '0'),
(1651, 'enrol_flatfile', 'unenrolaction', '3'),
(1652, 'enrol_flatfile', 'expiredaction', '3'),
(1653, 'enrol_guest', 'requirepassword', '0'),
(1654, 'enrol_guest', 'usepasswordpolicy', '0'),
(1655, 'enrol_guest', 'showhint', '0'),
(1656, 'enrol_guest', 'defaultenrol', '1'),
(1657, 'enrol_guest', 'status', '1'),
(1658, 'enrol_guest', 'status_adv', ''),
(1659, 'enrol_imsenterprise', 'imsfilelocation', ''),
(1660, 'enrol_imsenterprise', 'logtolocation', ''),
(1661, 'enrol_imsenterprise', 'mailadmins', '0'),
(1662, 'enrol_imsenterprise', 'createnewusers', '0'),
(1663, 'enrol_imsenterprise', 'imsupdateusers', '0'),
(1664, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(1665, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(1666, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(1667, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(1668, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(1669, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(1670, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(1671, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(1672, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(1673, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(1674, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(1675, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(1676, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(1677, 'enrol_imsenterprise', 'createnewcourses', '0'),
(1678, 'enrol_imsenterprise', 'updatecourses', '0'),
(1679, 'enrol_imsenterprise', 'createnewcategories', '0'),
(1680, 'enrol_imsenterprise', 'nestedcategories', '0'),
(1681, 'enrol_imsenterprise', 'categoryidnumber', '0'),
(1682, 'enrol_imsenterprise', 'categoryseparator', ''),
(1683, 'enrol_imsenterprise', 'imsunenrol', '0'),
(1684, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(1685, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(1686, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(1687, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(1688, 'enrol_imsenterprise', 'imscapitafix', '0'),
(1689, 'enrol_ldap', 'host_url', ''),
(1690, 'enrol_ldap', 'start_tls', '0'),
(1691, 'enrol_ldap', 'ldap_version', '3'),
(1692, 'enrol_ldap', 'ldapencoding', 'utf-8'),
(1693, 'enrol_ldap', 'pagesize', '250'),
(1694, 'enrol_ldap', 'bind_dn', ''),
(1695, 'enrol_ldap', 'bind_pw', ''),
(1696, 'enrol_ldap', 'course_search_sub', '0'),
(1697, 'enrol_ldap', 'memberattribute_isdn', '0'),
(1698, 'enrol_ldap', 'user_contexts', ''),
(1699, 'enrol_ldap', 'user_search_sub', '0'),
(1700, 'enrol_ldap', 'user_type', 'default'),
(1701, 'enrol_ldap', 'opt_deref', '0'),
(1702, 'enrol_ldap', 'idnumber_attribute', ''),
(1703, 'enrol_ldap', 'objectclass', ''),
(1704, 'enrol_ldap', 'course_idnumber', ''),
(1705, 'enrol_ldap', 'course_shortname', ''),
(1706, 'enrol_ldap', 'course_fullname', ''),
(1707, 'enrol_ldap', 'course_summary', ''),
(1708, 'enrol_ldap', 'ignorehiddencourses', '0'),
(1709, 'enrol_ldap', 'unenrolaction', '0'),
(1710, 'enrol_ldap', 'autocreate', '0'),
(1711, 'enrol_ldap', 'category', '1'),
(1712, 'enrol_ldap', 'template', ''),
(1713, 'enrol_ldap', 'course_shortname_updateonsync', '0'),
(1714, 'enrol_ldap', 'course_fullname_updateonsync', '0'),
(1715, 'enrol_ldap', 'course_summary_updateonsync', '0'),
(1716, 'enrol_ldap', 'nested_groups', '0'),
(1717, 'enrol_ldap', 'group_memberofattribute', ''),
(1718, 'enrol_manual', 'expiredaction', '1'),
(1719, 'enrol_manual', 'expirynotifyhour', '6'),
(1720, 'enrol_manual', 'defaultenrol', '1'),
(1721, 'enrol_manual', 'status', '0'),
(1722, 'enrol_manual', 'roleid', '5'),
(1723, 'enrol_manual', 'enrolstart', '4'),
(1724, 'enrol_manual', 'enrolperiod', '0'),
(1725, 'enrol_manual', 'expirynotify', '0'),
(1726, 'enrol_manual', 'expirythreshold', '86400'),
(1727, 'enrol_mnet', 'roleid', '5'),
(1728, 'enrol_mnet', 'roleid_adv', '1'),
(1729, 'enrol_paypal', 'paypalbusiness', ''),
(1730, 'enrol_paypal', 'mailstudents', '0'),
(1731, 'enrol_paypal', 'mailteachers', '0'),
(1732, 'enrol_paypal', 'mailadmins', '0'),
(1733, 'enrol_paypal', 'expiredaction', '3'),
(1734, 'enrol_paypal', 'status', '1'),
(1735, 'enrol_paypal', 'cost', '0'),
(1736, 'enrol_paypal', 'currency', 'USD'),
(1737, 'enrol_paypal', 'roleid', '5'),
(1738, 'enrol_paypal', 'enrolperiod', '0'),
(1739, 'enrol_lti', 'emaildisplay', '2'),
(1740, 'enrol_lti', 'city', ''),
(1741, 'enrol_lti', 'country', ''),
(1742, 'enrol_lti', 'timezone', '99'),
(1743, 'enrol_lti', 'lang', 'en'),
(1744, 'enrol_lti', 'institution', ''),
(1745, 'enrol_self', 'requirepassword', '0'),
(1746, 'enrol_self', 'usepasswordpolicy', '0'),
(1747, 'enrol_self', 'showhint', '0'),
(1748, 'enrol_self', 'expiredaction', '1'),
(1749, 'enrol_self', 'expirynotifyhour', '6'),
(1750, 'enrol_self', 'defaultenrol', '1'),
(1751, 'enrol_self', 'status', '1'),
(1752, 'enrol_self', 'newenrols', '1'),
(1753, 'enrol_self', 'groupkey', '0'),
(1754, 'enrol_self', 'roleid', '5'),
(1755, 'enrol_self', 'enrolperiod', '0'),
(1756, 'enrol_self', 'expirynotify', '0'),
(1757, 'enrol_self', 'expirythreshold', '86400'),
(1758, 'enrol_self', 'longtimenosee', '0'),
(1759, 'enrol_self', 'maxenrolled', '0'),
(1760, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(1761, 'filter_urltolink', 'formats', '0'),
(1762, 'filter_urltolink', 'embedimages', '1'),
(1763, 'filter_emoticon', 'formats', '1,4,0'),
(1764, 'filter_mathjaxloader', 'httpsurl', 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js'),
(1765, 'filter_mathjaxloader', 'texfiltercompatibility', '0'),
(1766, 'filter_mathjaxloader', 'mathjaxconfig', '\r\nMathJax.Hub.Config({\r\n    config: ["Accessible.js", "Safe.js"],\r\n    errorSettings: { message: ["!"] },\r\n    skipStartupTypeset: true,\r\n    messageStyle: "none"\r\n});\r\n'),
(1767, 'filter_mathjaxloader', 'additionaldelimiters', ''),
(1768, 'filter_tex', 'latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(1769, 'filter_tex', 'latexbackground', '#FFFFFF'),
(1770, 'filter_tex', 'density', '120'),
(1771, 'filter_tex', 'pathlatex', 'c:\\texmf\\miktex\\bin\\latex.exe'),
(1772, 'filter_tex', 'pathdvips', 'c:\\texmf\\miktex\\bin\\dvips.exe'),
(1773, 'filter_tex', 'pathconvert', 'c:\\imagemagick\\convert.exe'),
(1774, 'filter_tex', 'pathdvisvgm', 'c:\\texmf\\miktex\\bin\\dvisvgm.exe'),
(1775, 'filter_tex', 'pathmimetex', ''),
(1776, 'filter_tex', 'convertformat', 'gif'),
(1777, 'logstore_database', 'dbdriver', ''),
(1778, 'logstore_database', 'dbhost', ''),
(1779, 'logstore_database', 'dbuser', ''),
(1780, 'logstore_database', 'dbpass', ''),
(1781, 'logstore_database', 'dbname', ''),
(1782, 'logstore_database', 'dbtable', ''),
(1783, 'logstore_database', 'dbpersist', '0'),
(1784, 'logstore_database', 'dbsocket', ''),
(1785, 'logstore_database', 'dbport', ''),
(1786, 'logstore_database', 'dbschema', ''),
(1787, 'logstore_database', 'dbcollation', ''),
(1788, 'logstore_database', 'dbhandlesoptions', '0'),
(1789, 'logstore_database', 'buffersize', '50'),
(1790, 'logstore_database', 'logguests', '0'),
(1791, 'logstore_database', 'includelevels', '1,2,0'),
(1792, 'logstore_database', 'includeactions', 'c,r,u,d'),
(1793, 'logstore_legacy', 'loglegacy', '0'),
(1794, 'logstore_standard', 'logguests', '1'),
(1795, 'logstore_standard', 'loglifetime', '0'),
(1796, 'logstore_standard', 'buffersize', '50'),
(1797, 'media_videojs', 'videoextensions', 'html_video,.f4v,.flv'),
(1798, 'media_videojs', 'audioextensions', 'html_audio'),
(1799, 'media_videojs', 'useflash', '0'),
(1800, 'media_videojs', 'youtube', '1'),
(1801, 'media_videojs', 'videocssclass', 'video-js'),
(1802, 'media_videojs', 'audiocssclass', 'video-js'),
(1803, 'media_videojs', 'limitsize', '1'),
(1804, 'qtype_multichoice', 'answerhowmany', '1'),
(1805, 'qtype_multichoice', 'shuffleanswers', '1'),
(1806, 'qtype_multichoice', 'answernumbering', 'abc'),
(1807, 'editor_atto', 'toolbar', 'collapse = collapse\r\nstyle1 = title, bold, italic\r\nlist = unorderedlist, orderedlist\r\nlinks = link\r\nfiles = image, media, managefiles\r\nstyle2 = underline, strike, subscript, superscript\r\nalign = align\r\nindent = indent\r\ninsert = equation, charmap, table, clear\r\nundo = undo\r\naccessibility = accessibilitychecker, accessibilityhelper\r\nother = html'),
(1808, 'editor_atto', 'autosavefrequency', '60'),
(1809, 'atto_collapse', 'showgroups', '5'),
(1810, 'atto_equation', 'librarygroup1', '\r\n\\cdot\r\n\\times\r\n\\ast\r\n\\div\r\n\\diamond\r\n\\pm\r\n\\mp\r\n\\oplus\r\n\\ominus\r\n\\otimes\r\n\\oslash\r\n\\odot\r\n\\circ\r\n\\bullet\r\n\\asymp\r\n\\equiv\r\n\\subseteq\r\n\\supseteq\r\n\\leq\r\n\\geq\r\n\\preceq\r\n\\succeq\r\n\\sim\r\n\\simeq\r\n\\approx\r\n\\subset\r\n\\supset\r\n\\ll\r\n\\gg\r\n\\prec\r\n\\succ\r\n\\infty\r\n\\in\r\n\\ni\r\n\\forall\r\n\\exists\r\n\\neq\r\n'),
(1811, 'atto_equation', 'librarygroup2', '\r\n\\leftarrow\r\n\\rightarrow\r\n\\uparrow\r\n\\downarrow\r\n\\leftrightarrow\r\n\\nearrow\r\n\\searrow\r\n\\swarrow\r\n\\nwarrow\r\n\\Leftarrow\r\n\\Rightarrow\r\n\\Uparrow\r\n\\Downarrow\r\n\\Leftrightarrow\r\n'),
(1812, 'atto_equation', 'librarygroup3', '\r\n\\alpha\r\n\\beta\r\n\\gamma\r\n\\delta\r\n\\epsilon\r\n\\zeta\r\n\\eta\r\n\\theta\r\n\\iota\r\n\\kappa\r\n\\lambda\r\n\\mu\r\n\\nu\r\n\\xi\r\n\\pi\r\n\\rho\r\n\\sigma\r\n\\tau\r\n\\upsilon\r\n\\phi\r\n\\chi\r\n\\psi\r\n\\omega\r\n\\Gamma\r\n\\Delta\r\n\\Theta\r\n\\Lambda\r\n\\Xi\r\n\\Pi\r\n\\Sigma\r\n\\Upsilon\r\n\\Phi\r\n\\Psi\r\n\\Omega\r\n'),
(1813, 'atto_equation', 'librarygroup4', '\r\n\\sum{a,b}\r\n\\sqrt[a]{b+c}\r\n\\int_{a}^{b}{c}\r\n\\iint_{a}^{b}{c}\r\n\\iiint_{a}^{b}{c}\r\n\\oint{a}\r\n(a)\r\n[a]\r\n\\lbrace{a}\\rbrace\r\n\\left| \\begin{matrix} a_1 & a_2 \\ a_3 & a_4 \\end{matrix} \\right|\r\n\\frac{a}{b+c}\r\n\\vec{a}\r\n\\binom {a} {b}\r\n{a \\brack b}\r\n{a \\brace b}\r\n'),
(1814, 'atto_table', 'allowborders', '0'),
(1815, 'atto_table', 'allowbackgroundcolour', '0'),
(1816, 'atto_table', 'allowwidth', '0'),
(1817, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\r\n\r\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl\r\n\r\nfontselect,fontsizeselect,wrap,code,search,replace,wrap,nonbreaking,charmap,table,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),
(1818, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(1819, 'editor_tinymce', 'customconfig', ''),
(1820, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(1821, 'tinymce_spellchecker', 'spellengine', ''),
(1822, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(1823, 'analytics', 'logstore', 'logstore_standard'),
(1824, 'hub', 'site_name_httpsmoodlenet', 'Tutors246'),
(1825, 'hub', 'site_description_httpsmoodlenet', 'At Tutors246 we provide comprehensive coverage for a range of subjects inclusive of English A, Geography, History, Mathematics, Office Procedures, Principles of Business and Social Studies.&nbsp;We have a proven track record with 100% passing grades guaranteed. '),
(1826, 'hub', 'site_contactname_httpsmoodlenet', 'Nakeshia Lorde'),
(1827, 'hub', 'site_contactemail_httpsmoodlenet', 'tutors246@gmail.com'),
(1828, 'hub', 'site_contactphone_httpsmoodlenet', '2462363949'),
(1829, 'hub', 'site_imageurl_httpsmoodlenet', ''),
(1830, 'hub', 'site_privacy_httpsmoodlenet', 'linked'),
(1831, 'hub', 'site_address_httpsmoodlenet', '1st Avenue Clover Crescent\r\nPrior Park, St. James'),
(1832, 'hub', 'site_region_httpsmoodlenet', '-'),
(1833, 'hub', 'site_country_httpsmoodlenet', 'BB'),
(1834, 'hub', 'site_language_httpsmoodlenet', 'en'),
(1835, 'hub', 'site_geolocation_httpsmoodlenet', 'Bridgetown'),
(1836, 'hub', 'site_contactable_httpsmoodlenet', '1'),
(1837, 'hub', 'site_emailalert_httpsmoodlenet', '1'),
(1838, 'hub', 'site_coursesnumber_httpsmoodlenet', '1'),
(1839, 'hub', 'site_usersnumber_httpsmoodlenet', '1'),
(1840, 'hub', 'site_roleassignmentsnumber_httpsmoodlenet', '1'),
(1841, 'hub', 'site_postsnumber_httpsmoodlenet', '1'),
(1842, 'hub', 'site_questionsnumber_httpsmoodlenet', '1'),
(1843, 'hub', 'site_resourcesnumber_httpsmoodlenet', '1'),
(1844, 'hub', 'site_badges_httpsmoodlenet', '1'),
(1845, 'hub', 'site_issuedbadges_httpsmoodlenet', '1'),
(1846, 'hub', 'site_modulenumberaverage_httpsmoodlenet', '1'),
(1847, 'hub', 'site_participantnumberaverage_httpsmoodlenet', '1'),
(1848, 'hub', 'site_mobileservicesenabled_httpsmoodlenet', '1'),
(1849, 'hub', 'site_mobilenotificacionsenabled_httpsmoodlenet', '1'),
(1850, 'hub', 'site_registereduserdevices_httpsmoodlenet', '1'),
(1851, 'hub', 'site_registeredactiveuserdevices_httpsmoodlenet', '1'),
(1852, 'filesystem', 'enablecourseinstances', '1'),
(1853, 'filesystem', 'enableuserinstances', '1'),
(1854, 'coursefiles', 'enablecourseinstances', '0'),
(1855, 'coursefiles', 'enableuserinstances', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

DROP TABLE IF EXISTS `mdl_context`;
CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='one of these must be set';

--
-- Truncate table before insert `mdl_context`
--

TRUNCATE TABLE `mdl_context`;
--
-- Dumping data for table `mdl_context`
--

INSERT DELAYED IGNORE INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/6', 2),
(7, 80, 2, '/1/7', 2),
(8, 80, 3, '/1/8', 2),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/5/14', 3),
(15, 80, 10, '/1/5/15', 3),
(16, 80, 11, '/1/5/16', 3),
(17, 80, 12, '/1/5/17', 3),
(18, 80, 13, '/1/5/18', 3),
(19, 80, 14, '/1/5/19', 3),
(20, 80, 15, '/1/5/20', 3),
(21, 70, 1, '/1/2/21', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

DROP TABLE IF EXISTS `mdl_context_temp`;
CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';

--
-- Truncate table before insert `mdl_context_temp`
--

TRUNCATE TABLE `mdl_context_temp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

DROP TABLE IF EXISTS `mdl_course`;
CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `enddate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `calendartype` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Central course table';

--
-- Truncate table before insert `mdl_course`
--

TRUNCATE TABLE `mdl_course`;
--
-- Dumping data for table `mdl_course`
--

INSERT DELAYED IGNORE INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `newsitems`, `startdate`, `enddate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `calendartype`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`, `cacherev`) VALUES
(1, 0, 0, 'Tutors246', 'Educational Service', '', '<p>At Tutors246 we provide comprehensive coverage for a range of subjects inclusive of English A, Geography,                 History, Mathematics, Office Procedures, Principles of Business and Social Studies.&nbsp;We have a proven                 track record with 100% passing grades guaranteed. <br></p>', 0, 'site', 1, 3, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', '', 1502328646, 1502335339, 0, 0, 0, 1502335339);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

DROP TABLE IF EXISTS `mdl_course_categories`;
CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Course categories';

--
-- Truncate table before insert `mdl_course_categories`
--

TRUNCATE TABLE `mdl_course_categories`;
--
-- Dumping data for table `mdl_course_categories`
--

INSERT DELAYED IGNORE INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 10000, 0, 1, 1, 1502328647, 1, '/1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

DROP TABLE IF EXISTS `mdl_course_completion_aggr_methd`;
CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria';

--
-- Truncate table before insert `mdl_course_completion_aggr_methd`
--

TRUNCATE TABLE `mdl_course_completion_aggr_methd`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

DROP TABLE IF EXISTS `mdl_course_completion_crit_compl`;
CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records';

--
-- Truncate table before insert `mdl_course_completion_crit_compl`
--

TRUNCATE TABLE `mdl_course_completion_crit_compl`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

DROP TABLE IF EXISTS `mdl_course_completion_criteria`;
CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria';

--
-- Truncate table before insert `mdl_course_completion_criteria`
--

TRUNCATE TABLE `mdl_course_completion_criteria`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_defaults`
--

DROP TABLE IF EXISTS `mdl_course_completion_defaults`;
CREATE TABLE IF NOT EXISTS `mdl_course_completion_defaults` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `module` bigint(10) NOT NULL,
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionusegrade` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `customrules` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompdefa_coumod_uix` (`course`,`module`),
  KEY `mdl_courcompdefa_mod_ix` (`module`),
  KEY `mdl_courcompdefa_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default settings for activities completion';

--
-- Truncate table before insert `mdl_course_completion_defaults`
--

TRUNCATE TABLE `mdl_course_completion_defaults`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

DROP TABLE IF EXISTS `mdl_course_completions`;
CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records';

--
-- Truncate table before insert `mdl_course_completions`
--

TRUNCATE TABLE `mdl_course_completions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_format_options`
--

DROP TABLE IF EXISTS `mdl_course_format_options`;
CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores format-specific options for the course or course sect';

--
-- Truncate table before insert `mdl_course_format_options`
--

TRUNCATE TABLE `mdl_course_format_options`;
--
-- Dumping data for table `mdl_course_format_options`
--

INSERT DELAYED IGNORE INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

DROP TABLE IF EXISTS `mdl_course_modules`;
CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleoncoursepage` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  `availability` longtext,
  `deletioninprogress` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL';

--
-- Truncate table before insert `mdl_course_modules`
--

TRUNCATE TABLE `mdl_course_modules`;
--
-- Dumping data for table `mdl_course_modules`
--

INSERT DELAYED IGNORE INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleoncoursepage`, `visibleold`, `groupmode`, `groupingid`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `showdescription`, `availability`, `deletioninprogress`) VALUES
(1, 1, 9, 1, 2, NULL, 1502334640, 0, 0, 1, 1, 1, 0, 0, 0, NULL, 0, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

DROP TABLE IF EXISTS `mdl_course_modules_completion`;
CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc';

--
-- Truncate table before insert `mdl_course_modules_completion`
--

TRUNCATE TABLE `mdl_course_modules_completion`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

DROP TABLE IF EXISTS `mdl_course_published`;
CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish';

--
-- Truncate table before insert `mdl_course_published`
--

TRUNCATE TABLE `mdl_course_published`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

DROP TABLE IF EXISTS `mdl_course_request`;
CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests';

--
-- Truncate table before insert `mdl_course_request`
--

TRUNCATE TABLE `mdl_course_request`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

DROP TABLE IF EXISTS `mdl_course_sections`;
CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availability` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course';

--
-- Truncate table before insert `mdl_course_sections`
--

TRUNCATE TABLE `mdl_course_sections`;
--
-- Dumping data for table `mdl_course_sections`
--

INSERT DELAYED IGNORE INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availability`, `timemodified`) VALUES
(1, 1, 1, NULL, '', 1, '', 1, NULL, 1502331649),
(2, 1, 0, NULL, '', 1, '1', 1, NULL, 1502334640);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

DROP TABLE IF EXISTS `mdl_data`;
CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext,
  `listtemplate` longtext,
  `listtemplateheader` longtext,
  `listtemplatefooter` longtext,
  `addtemplate` longtext,
  `rsstemplate` longtext,
  `rsstitletemplate` longtext,
  `csstemplate` longtext,
  `jstemplate` longtext,
  `asearchtemplate` longtext,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `manageapproved` smallint(4) NOT NULL DEFAULT '1',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `config` longtext,
  `completionentries` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities' ROW_FORMAT=COMPRESSED;

--
-- Truncate table before insert `mdl_data`
--

TRUNCATE TABLE `mdl_data`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

DROP TABLE IF EXISTS `mdl_data_content`;
CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields';

--
-- Truncate table before insert `mdl_data_content`
--

TRUNCATE TABLE `mdl_data_content`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

DROP TABLE IF EXISTS `mdl_data_fields`;
CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  `param6` longtext,
  `param7` longtext,
  `param8` longtext,
  `param9` longtext,
  `param10` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available' ROW_FORMAT=COMPRESSED;

--
-- Truncate table before insert `mdl_data_fields`
--

TRUNCATE TABLE `mdl_data_fields`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

DROP TABLE IF EXISTS `mdl_data_records`;
CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced';

--
-- Truncate table before insert `mdl_data_records`
--

TRUNCATE TABLE `mdl_data_records`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_editor_atto_autosave`
--

DROP TABLE IF EXISTS `mdl_editor_atto_autosave`;
CREATE TABLE IF NOT EXISTS `mdl_editor_atto_autosave` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `elementid` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `pagehash` varchar(64) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `drafttext` longtext NOT NULL,
  `draftid` bigint(10) DEFAULT NULL,
  `pageinstance` varchar(64) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_editattoauto_eleconuse_uix` (`elementid`,`contextid`,`userid`,`pagehash`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Draft text that is auto-saved every 5 seconds while an edito';

--
-- Truncate table before insert `mdl_editor_atto_autosave`
--

TRUNCATE TABLE `mdl_editor_atto_autosave`;
--
-- Dumping data for table `mdl_editor_atto_autosave`
--

INSERT DELAYED IGNORE INTO `mdl_editor_atto_autosave` (`id`, `elementid`, `contextid`, `pagehash`, `userid`, `drafttext`, `draftid`, `pageinstance`, `timemodified`) VALUES
(2, 'id_summary_editor', 3, 'fe94f82330900b1e022c6c6526c44316e343016d', 2, '', 237579346, 'yui_3_17_2_1_1502334367711_225', 1502334378),
(5, 'id_s__summary', 1, '3c607b53d5130eaf3f9b27929cc4b9ab2f1f4f28', 2, '<p>At Tutors246 we provide comprehensive coverage for a range of subjects inclusive of English A, Geography,                 History, Mathematics, Office Procedures, Principles of Business and Social Studies.&nbsp;We have a proven                 track record with 100% passing grades guaranteed. <br></p>', -1, 'yui_3_17_2_1_1502335364554_45', 1502335428);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

DROP TABLE IF EXISTS `mdl_enrol`;
CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customchar3` varchar(1333) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `customtext3` longtext,
  `customtext4` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke';

--
-- Truncate table before insert `mdl_enrol`
--

TRUNCATE TABLE `mdl_enrol`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

DROP TABLE IF EXISTS `mdl_enrol_flatfile`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL';

--
-- Truncate table before insert `mdl_enrol_flatfile`
--

TRUNCATE TABLE `mdl_enrol_flatfile`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_consumer`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_consumer`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_lti2_consumer` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `consumerkey256` varchar(255) NOT NULL DEFAULT '',
  `consumerkey` longtext,
  `secret` varchar(1024) NOT NULL DEFAULT '',
  `ltiversion` varchar(10) DEFAULT NULL,
  `consumername` varchar(255) DEFAULT NULL,
  `consumerversion` varchar(255) DEFAULT NULL,
  `consumerguid` varchar(1024) DEFAULT NULL,
  `profile` longtext,
  `toolproxy` longtext,
  `settings` longtext,
  `protected` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `enablefrom` bigint(10) DEFAULT NULL,
  `enableuntil` bigint(10) DEFAULT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltilti2cons_con_uix` (`consumerkey256`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LTI consumers interacting with moodle' ROW_FORMAT=COMPRESSED;

--
-- Truncate table before insert `mdl_enrol_lti_lti2_consumer`
--

TRUNCATE TABLE `mdl_enrol_lti_lti2_consumer`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_context`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_context`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_lti2_context` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `consumerid` bigint(11) NOT NULL,
  `lticontextkey` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(100) DEFAULT NULL,
  `settings` longtext,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2cont_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about a specific LTI contexts from the consumers';

--
-- Truncate table before insert `mdl_enrol_lti_lti2_context`
--

TRUNCATE TABLE `mdl_enrol_lti_lti2_context`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_nonce`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_nonce`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_lti2_nonce` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `consumerid` bigint(11) NOT NULL,
  `value` varchar(64) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2nonc_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Nonce used for authentication between moodle and a consumer';

--
-- Truncate table before insert `mdl_enrol_lti_lti2_nonce`
--

TRUNCATE TABLE `mdl_enrol_lti_lti2_nonce`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_resource_link`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_resource_link`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_lti2_resource_link` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(11) DEFAULT NULL,
  `consumerid` bigint(11) DEFAULT NULL,
  `ltiresourcelinkkey` varchar(255) NOT NULL DEFAULT '',
  `settings` longtext,
  `primaryresourcelinkid` bigint(11) DEFAULT NULL,
  `shareapproved` tinyint(1) DEFAULT NULL,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2resolink_con_ix` (`contextid`),
  KEY `mdl_enroltilti2resolink_pri_ix` (`primaryresourcelinkid`),
  KEY `mdl_enroltilti2resolink_co2_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link from the consumer to the tool';

--
-- Truncate table before insert `mdl_enrol_lti_lti2_resource_link`
--

TRUNCATE TABLE `mdl_enrol_lti_lti2_resource_link`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_share_key`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_share_key`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_lti2_share_key` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `sharekey` varchar(32) NOT NULL DEFAULT '',
  `resourcelinkid` bigint(11) NOT NULL,
  `autoapprove` tinyint(1) NOT NULL,
  `expires` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltilti2sharkey_sha_uix` (`sharekey`),
  UNIQUE KEY `mdl_enroltilti2sharkey_res_uix` (`resourcelinkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource link share key';

--
-- Truncate table before insert `mdl_enrol_lti_lti2_share_key`
--

TRUNCATE TABLE `mdl_enrol_lti_lti2_share_key`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_tool_proxy`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_tool_proxy`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_lti2_tool_proxy` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `toolproxykey` varchar(32) NOT NULL DEFAULT '',
  `consumerid` bigint(11) NOT NULL,
  `toolproxy` longtext NOT NULL,
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_enroltilti2toolprox_to_uix` (`toolproxykey`),
  KEY `mdl_enroltilti2toolprox_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A tool proxy between moodle and a consumer';

--
-- Truncate table before insert `mdl_enrol_lti_lti2_tool_proxy`
--

TRUNCATE TABLE `mdl_enrol_lti_lti2_tool_proxy`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_lti2_user_result`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_lti2_user_result`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_lti2_user_result` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `resourcelinkid` bigint(11) NOT NULL,
  `ltiuserkey` varchar(255) NOT NULL DEFAULT '',
  `ltiresultsourcedid` varchar(1024) NOT NULL DEFAULT '',
  `created` bigint(10) NOT NULL,
  `updated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltilti2userresu_res_ix` (`resourcelinkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Results for each user for each resource link';

--
-- Truncate table before insert `mdl_enrol_lti_lti2_user_result`
--

TRUNCATE TABLE `mdl_enrol_lti_lti2_user_result`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_tool_consumer_map`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_tool_consumer_map`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_tool_consumer_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `toolid` bigint(11) NOT NULL,
  `consumerid` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltitoolconsmap_too_ix` (`toolid`),
  KEY `mdl_enroltitoolconsmap_con_ix` (`consumerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that maps the published tool to tool consumers.';

--
-- Truncate table before insert `mdl_enrol_lti_tool_consumer_map`
--

TRUNCATE TABLE `mdl_enrol_lti_tool_consumer_map`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_tools`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_tools`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_tools` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrolid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `institution` varchar(40) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `maxenrolled` bigint(10) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `gradesync` tinyint(1) NOT NULL DEFAULT '0',
  `gradesynccompletion` tinyint(1) NOT NULL DEFAULT '0',
  `membersync` tinyint(1) NOT NULL DEFAULT '0',
  `membersyncmode` tinyint(1) NOT NULL DEFAULT '0',
  `roleinstructor` bigint(10) NOT NULL,
  `rolelearner` bigint(10) NOT NULL,
  `secret` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltitool_enr_ix` (`enrolid`),
  KEY `mdl_enroltitool_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of tools provided to the remote system';

--
-- Truncate table before insert `mdl_enrol_lti_tools`
--

TRUNCATE TABLE `mdl_enrol_lti_tools`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_lti_users`
--

DROP TABLE IF EXISTS `mdl_enrol_lti_users`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_lti_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `toolid` bigint(10) NOT NULL,
  `serviceurl` longtext,
  `sourceid` longtext,
  `consumerkey` longtext,
  `consumersecret` longtext,
  `membershipsurl` longtext,
  `membershipsid` longtext,
  `lastgrade` decimal(10,5) DEFAULT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_enroltiuser_use_ix` (`userid`),
  KEY `mdl_enroltiuser_too_ix` (`toolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User access log and gradeback data';

--
-- Truncate table before insert `mdl_enrol_lti_users`
--

TRUNCATE TABLE `mdl_enrol_lti_users`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

DROP TABLE IF EXISTS `mdl_enrol_paypal`;
CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions' ROW_FORMAT=COMPRESSED;

--
-- Truncate table before insert `mdl_enrol_paypal`
--

TRUNCATE TABLE `mdl_enrol_paypal`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

DROP TABLE IF EXISTS `mdl_event`;
CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `type` smallint(4) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `timesort` bigint(10) DEFAULT NULL,
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  `priority` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_typtim_ix` (`type`,`timesort`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it';

--
-- Truncate table before insert `mdl_event`
--

TRUNCATE TABLE `mdl_event`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_event_subscriptions`
--

DROP TABLE IF EXISTS `mdl_event_subscriptions`;
CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks subscriptions to remote calendars.';

--
-- Truncate table before insert `mdl_event_subscriptions`
--

TRUNCATE TABLE `mdl_event_subscriptions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

DROP TABLE IF EXISTS `mdl_events_handlers`;
CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` longtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ';

--
-- Truncate table before insert `mdl_events_handlers`
--

TRUNCATE TABLE `mdl_events_handlers`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

DROP TABLE IF EXISTS `mdl_events_queue`;
CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext NOT NULL,
  `stackdump` longtext,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ';

--
-- Truncate table before insert `mdl_events_queue`
--

TRUNCATE TABLE `mdl_events_queue`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

DROP TABLE IF EXISTS `mdl_events_queue_handlers`;
CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even';

--
-- Truncate table before insert `mdl_events_queue_handlers`
--

TRUNCATE TABLE `mdl_events_queue_handlers`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

DROP TABLE IF EXISTS `mdl_external_functions`;
CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL,
  `services` varchar(1333) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=446 DEFAULT CHARSET=utf8 COMMENT='list of all external functions';

--
-- Truncate table before insert `mdl_external_functions`
--

TRUNCATE TABLE `mdl_external_functions`;
--
-- Dumping data for table `mdl_external_functions`
--

INSERT DELAYED IGNORE INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`, `services`) VALUES
(1, 'core_auth_confirm_user', 'core_auth_external', 'confirm_user', NULL, 'moodle', '', NULL),
(2, 'core_auth_request_password_reset', 'core_auth_external', 'request_password_reset', NULL, 'moodle', '', NULL),
(3, 'core_badges_get_user_badges', 'core_badges_external', 'get_user_badges', NULL, 'moodle', 'moodle/badges:viewotherbadges', 'moodle_mobile_app'),
(4, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(5, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(6, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(7, 'core_calendar_get_action_events_by_timesort', 'core_calendar_external', 'get_calendar_action_events_by_timesort', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(8, 'core_calendar_get_action_events_by_course', 'core_calendar_external', 'get_calendar_action_events_by_course', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(9, 'core_calendar_get_action_events_by_courses', 'core_calendar_external', 'get_calendar_action_events_by_courses', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(10, 'core_calendar_get_calendar_event_by_id', 'core_calendar_external', 'get_calendar_event_by_id', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', 'moodle_mobile_app'),
(11, 'core_calendar_submit_create_update_form', 'core_calendar_external', 'submit_create_update_form', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries, moodle/calendar:manageownentries, moodle/calendar:managegroupentries', NULL),
(12, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign', NULL),
(13, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage', NULL),
(14, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign', NULL),
(15, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage', NULL),
(16, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view', NULL),
(17, 'core_cohort_search_cohorts', 'core_cohort_external', 'search_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view', NULL),
(18, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view', NULL),
(19, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage', NULL),
(20, 'core_comment_get_comments', 'core_comment_external', 'get_comments', NULL, 'moodle', 'moodle/comment:view', 'moodle_mobile_app'),
(21, 'core_completion_get_activities_completion_status', 'core_completion_external', 'get_activities_completion_status', NULL, 'moodle', '', 'moodle_mobile_app'),
(22, 'core_completion_get_course_completion_status', 'core_completion_external', 'get_course_completion_status', NULL, 'moodle', 'report/completion:view', 'moodle_mobile_app'),
(23, 'core_completion_mark_course_self_completed', 'core_completion_external', 'mark_course_self_completed', NULL, 'moodle', '', 'moodle_mobile_app'),
(24, 'core_completion_update_activity_completion_status_manually', 'core_completion_external', 'update_activity_completion_status_manually', NULL, 'moodle', '', 'moodle_mobile_app'),
(25, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage', NULL),
(26, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create, moodle/course:visibility', NULL),
(27, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage', NULL),
(28, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete', NULL),
(29, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities', NULL),
(30, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse, moodle/restore:restorecourse, moodle/course:create', NULL),
(31, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories', 'moodle_mobile_app'),
(32, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update, moodle/course:viewhiddencourses', 'moodle_mobile_app'),
(33, 'core_course_get_course_module', 'core_course_external', 'get_course_module', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(34, 'core_course_get_course_module_by_instance', 'core_course_external', 'get_course_module_by_instance', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(35, 'core_course_get_module', 'core_course_external', 'get_module', 'course/externallib.php', 'moodle', '', NULL),
(36, 'core_course_edit_module', 'core_course_external', 'edit_module', 'course/externallib.php', 'moodle', '', NULL),
(37, 'core_course_edit_section', 'core_course_external', 'edit_section', 'course/externallib.php', 'moodle', '', NULL),
(38, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view, moodle/course:update, moodle/course:viewhiddencourses', 'moodle_mobile_app'),
(39, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport', NULL),
(40, 'core_course_search_courses', 'core_course_external', 'search_courses', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(41, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage', NULL),
(42, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update, moodle/course:changecategory, moodle/course:changefullname, moodle/course:changeshortname, moodle/course:changeidnumber, moodle/course:changesummary, moodle/course:visibility', NULL),
(43, 'core_course_view_course', 'core_course_external', 'view_course', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(44, 'core_course_get_activities_overview', 'core_course_external', 'get_activities_overview', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(45, 'core_course_get_user_navigation_options', 'core_course_external', 'get_user_navigation_options', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(46, 'core_course_get_user_administration_options', 'core_course_external', 'get_user_administration_options', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(47, 'core_course_get_courses_by_field', 'core_course_external', 'get_courses_by_field', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(48, 'core_course_check_updates', 'core_course_external', 'check_updates', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(49, 'core_course_get_updates_since', 'core_course_external', 'get_updates_since', 'course/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(50, 'core_enrol_get_course_enrolment_methods', 'core_enrol_external', 'get_course_enrolment_methods', 'enrol/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(51, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups', 'moodle_mobile_app'),
(52, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', '', NULL),
(53, 'core_enrol_get_potential_users', 'core_enrol_external', 'get_potential_users', 'enrol/externallib.php', 'moodle', 'moodle/course:enrolreview', NULL),
(54, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants', 'moodle_mobile_app'),
(55, 'core_enrol_edit_user_enrolment', 'core_enrol_external', 'edit_user_enrolment', 'enrol/externallib.php', 'moodle', '', NULL),
(56, 'core_fetch_notifications', 'core_external', 'fetch_notifications', 'lib/external/externallib.php', 'moodle', '', NULL),
(57, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(58, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', '', NULL),
(59, 'core_form_get_filetypes_browser_data', 'core_form\\external', 'get_filetypes_browser_data', NULL, 'moodle', '', NULL),
(60, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(61, 'core_get_fragment', 'core_external', 'get_fragment', 'lib/external/externallib.php', 'moodle', '', NULL),
(62, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', '', NULL),
(63, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', '', NULL),
(64, 'core_get_user_dates', 'core_external', 'get_user_dates', 'lib/external/externallib.php', 'moodle', '', NULL),
(65, 'core_grades_get_grades', 'core_grades_external', 'get_grades', NULL, 'moodle', 'moodle/grade:view, moodle/grade:viewall, moodle/grade:viewhidden', NULL),
(66, 'core_grades_update_grades', 'core_grades_external', 'update_grades', NULL, 'moodle', '', NULL),
(67, 'core_grading_get_definitions', 'core_grading_external', 'get_definitions', NULL, 'moodle', '', NULL),
(68, 'core_grading_get_gradingform_instances', 'core_grading_external', 'get_gradingform_instances', NULL, 'moodle', '', NULL),
(69, 'core_grading_save_definitions', 'core_grading_external', 'save_definitions', NULL, 'moodle', '', NULL),
(70, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(71, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', '', NULL),
(72, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', '', NULL),
(73, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(74, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(75, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', '', NULL),
(76, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(77, 'core_group_get_activity_allowed_groups', 'core_group_external', 'get_activity_allowed_groups', 'group/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(78, 'core_group_get_activity_groupmode', 'core_group_external', 'get_activity_groupmode', 'group/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(79, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', '', NULL),
(80, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(81, 'core_group_get_course_user_groups', 'core_group_external', 'get_course_user_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', 'moodle_mobile_app'),
(82, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(83, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', '', NULL),
(84, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups', NULL),
(85, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', '', NULL),
(86, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', '', NULL),
(87, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(88, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(89, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(90, 'core_message_delete_conversation', 'core_message_external', 'delete_conversation', 'message/externallib.php', 'moodle', 'moodle/site:deleteownmessage', 'moodle_mobile_app'),
(91, 'core_message_delete_message', 'core_message_external', 'delete_message', 'message/externallib.php', 'moodle', 'moodle/site:deleteownmessage', 'moodle_mobile_app'),
(92, 'core_message_get_blocked_users', 'core_message_external', 'get_blocked_users', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(93, 'core_message_data_for_messagearea_search_messages', 'core_message_external', 'data_for_messagearea_search_messages', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(94, 'core_message_data_for_messagearea_search_users', 'core_message_external', 'data_for_messagearea_search_users', 'message/externallib.php', 'moodle', '', NULL),
(95, 'core_message_data_for_messagearea_search_users_in_course', 'core_message_external', 'data_for_messagearea_search_users_in_course', 'message/externallib.php', 'moodle', '', NULL),
(96, 'core_message_data_for_messagearea_conversations', 'core_message_external', 'data_for_messagearea_conversations', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(97, 'core_message_data_for_messagearea_contacts', 'core_message_external', 'data_for_messagearea_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(98, 'core_message_data_for_messagearea_messages', 'core_message_external', 'data_for_messagearea_messages', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(99, 'core_message_data_for_messagearea_get_most_recent_message', 'core_message_external', 'data_for_messagearea_get_most_recent_message', 'message/externallib.php', 'moodle', '', NULL),
(100, 'core_message_data_for_messagearea_get_profile', 'core_message_external', 'data_for_messagearea_get_profile', 'message/externallib.php', 'moodle', '', NULL),
(101, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(102, 'core_message_get_messages', 'core_message_external', 'get_messages', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(103, 'core_message_get_unread_conversations_count', 'core_message_external', 'get_unread_conversations_count', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(104, 'core_message_mark_all_notifications_as_read', 'core_message_external', 'mark_all_notifications_as_read', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(105, 'core_message_mark_all_messages_as_read', 'core_message_external', 'mark_all_messages_as_read', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(106, 'core_message_mark_message_read', 'core_message_external', 'mark_message_read', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(107, 'core_message_message_processor_config_form', 'core_message_external', 'message_processor_config_form', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(108, 'core_message_get_message_processor', 'core_message_external', 'get_message_processor', 'message/externallib.php', 'moodle', '', NULL),
(109, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(110, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage', 'moodle_mobile_app'),
(111, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(112, 'core_message_get_user_notification_preferences', 'core_message_external', 'get_user_notification_preferences', 'message/externallib.php', 'moodle', 'moodle/user:editownmessageprofile', 'moodle_mobile_app'),
(113, 'core_message_get_user_message_preferences', 'core_message_external', 'get_user_message_preferences', 'message/externallib.php', 'moodle', 'moodle/user:editownmessageprofile', 'moodle_mobile_app'),
(114, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage', 'moodle_mobile_app'),
(115, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage', 'moodle_mobile_app'),
(116, 'core_notes_get_course_notes', 'core_notes_external', 'get_course_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view', 'moodle_mobile_app'),
(117, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view', NULL),
(118, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage', NULL),
(119, 'core_notes_view_notes', 'core_notes_external', 'view_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view', 'moodle_mobile_app'),
(120, 'core_output_load_template', 'core\\output\\external', 'load_template', NULL, 'moodle', '', NULL),
(121, 'core_output_load_fontawesome_icon_map', 'core\\output\\external', 'load_fontawesome_icon_map', NULL, 'moodle', '', NULL),
(122, 'core_question_update_flag', 'core_question_external', 'update_flag', NULL, 'moodle', 'moodle/question:flag', 'moodle_mobile_app'),
(123, 'core_rating_get_item_ratings', 'core_rating_external', 'get_item_ratings', NULL, 'moodle', 'moodle/rating:view', 'moodle_mobile_app'),
(124, 'core_rating_add_rating', 'core_rating_external', 'add_rating', NULL, 'moodle', 'moodle/rating:rate', 'moodle_mobile_app'),
(125, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign', NULL),
(126, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign', NULL),
(127, 'core_tag_get_tagindex', 'core_tag_external', 'get_tagindex', NULL, 'moodle', '', NULL),
(128, 'core_tag_get_tags', 'core_tag_external', 'get_tags', NULL, 'moodle', '', NULL),
(129, 'core_tag_update_tags', 'core_tag_external', 'update_tags', NULL, 'moodle', '', NULL),
(130, 'core_update_inplace_editable', 'core_external', 'update_inplace_editable', 'lib/external/externallib.php', 'moodle', '', NULL),
(131, 'core_user_add_user_device', 'core_user_external', 'add_user_device', 'user/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(132, 'core_user_add_user_private_files', 'core_user_external', 'add_user_private_files', 'user/externallib.php', 'moodle', 'moodle/user:manageownfiles', 'moodle_mobile_app'),
(133, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create', NULL),
(134, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete', NULL),
(135, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups', 'moodle_mobile_app'),
(136, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update', NULL),
(137, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update', 'moodle_mobile_app'),
(138, 'core_user_remove_user_device', 'core_user_external', 'remove_user_device', 'user/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(139, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update', NULL),
(140, 'core_user_update_user_preferences', 'core_user_external', 'update_user_preferences', 'user/externallib.php', 'moodle', 'moodle/user:editownmessageprofile, moodle/user:editmessageprofile', 'moodle_mobile_app'),
(141, 'core_user_view_user_list', 'core_user_external', 'view_user_list', 'user/externallib.php', 'moodle', 'moodle/course:viewparticipants', 'moodle_mobile_app'),
(142, 'core_user_view_user_profile', 'core_user_external', 'view_user_profile', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails', 'moodle_mobile_app'),
(143, 'core_user_get_user_preferences', 'core_user_external', 'get_user_preferences', 'user/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(144, 'core_user_update_picture', 'core_user_external', 'update_picture', 'user/externallib.php', 'moodle', 'moodle/user:editownprofile, moodle/user:editprofile', 'moodle_mobile_app'),
(145, 'core_user_set_user_preferences', 'core_user_external', 'set_user_preferences', 'user/externallib.php', 'moodle', 'moodle/site:config', NULL),
(146, 'core_user_agree_site_policy', 'core_user_external', 'agree_site_policy', 'user/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(147, 'core_user_get_private_files_info', 'core_user_external', 'get_private_files_info', 'user/externallib.php', 'moodle', 'moodle/user:manageownfiles', 'moodle_mobile_app'),
(148, 'core_competency_create_competency_framework', 'core_competency\\external', 'create_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(149, 'core_competency_read_competency_framework', 'core_competency\\external', 'read_competency_framework', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(150, 'core_competency_duplicate_competency_framework', 'core_competency\\external', 'duplicate_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(151, 'core_competency_delete_competency_framework', 'core_competency\\external', 'delete_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(152, 'core_competency_update_competency_framework', 'core_competency\\external', 'update_competency_framework', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(153, 'core_competency_list_competency_frameworks', 'core_competency\\external', 'list_competency_frameworks', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(154, 'core_competency_count_competency_frameworks', 'core_competency\\external', 'count_competency_frameworks', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(155, 'core_competency_competency_framework_viewed', 'core_competency\\external', 'competency_framework_viewed', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(156, 'core_competency_create_competency', 'core_competency\\external', 'create_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(157, 'core_competency_read_competency', 'core_competency\\external', 'read_competency', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(158, 'core_competency_competency_viewed', 'core_competency\\external', 'competency_viewed', NULL, 'moodle', 'moodle/competency:competencyview', 'moodle_mobile_app'),
(159, 'core_competency_delete_competency', 'core_competency\\external', 'delete_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(160, 'core_competency_update_competency', 'core_competency\\external', 'update_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(161, 'core_competency_list_competencies', 'core_competency\\external', 'list_competencies', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(162, 'core_competency_list_competencies_in_template', 'core_competency\\external', 'list_competencies_in_template', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(163, 'core_competency_count_competencies', 'core_competency\\external', 'count_competencies', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(164, 'core_competency_count_competencies_in_template', 'core_competency\\external', 'count_competencies_in_template', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(165, 'core_competency_search_competencies', 'core_competency\\external', 'search_competencies', NULL, 'moodle', 'moodle/competency:competencyview', NULL),
(166, 'core_competency_set_parent_competency', 'core_competency\\external', 'set_parent_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(167, 'core_competency_move_up_competency', 'core_competency\\external', 'move_up_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(168, 'core_competency_move_down_competency', 'core_competency\\external', 'move_down_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(169, 'core_competency_list_course_competencies', 'core_competency\\external', 'list_course_competencies', NULL, 'moodle', 'moodle/competency:coursecompetencyview', 'moodle_mobile_app'),
(170, 'core_competency_count_competencies_in_course', 'core_competency\\external', 'count_competencies_in_course', NULL, 'moodle', 'moodle/competency:coursecompetencyview', NULL),
(171, 'core_competency_count_courses_using_competency', 'core_competency\\external', 'count_courses_using_competency', NULL, 'moodle', 'moodle/competency:coursecompetencyview', NULL),
(172, 'core_competency_add_competency_to_course', 'core_competency\\external', 'add_competency_to_course', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
(173, 'core_competency_add_competency_to_template', 'core_competency\\external', 'add_competency_to_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(174, 'core_competency_remove_competency_from_course', 'core_competency\\external', 'remove_competency_from_course', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
(175, 'core_competency_set_course_competency_ruleoutcome', 'core_competency\\external', 'set_course_competency_ruleoutcome', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
(176, 'core_competency_remove_competency_from_template', 'core_competency\\external', 'remove_competency_from_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(177, 'core_competency_reorder_course_competency', 'core_competency\\external', 'reorder_course_competency', NULL, 'moodle', 'moodle/competency:coursecompetencymanage', NULL),
(178, 'core_competency_reorder_template_competency', 'core_competency\\external', 'reorder_template_competency', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(179, 'core_competency_create_template', 'core_competency\\external', 'create_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(180, 'core_competency_duplicate_template', 'core_competency\\external', 'duplicate_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(181, 'core_competency_read_template', 'core_competency\\external', 'read_template', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(182, 'core_competency_delete_template', 'core_competency\\external', 'delete_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(183, 'core_competency_update_template', 'core_competency\\external', 'update_template', NULL, 'moodle', 'moodle/competency:templatemanage', NULL),
(184, 'core_competency_list_templates', 'core_competency\\external', 'list_templates', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(185, 'core_competency_list_templates_using_competency', 'core_competency\\external', 'list_templates_using_competency', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(186, 'core_competency_count_templates', 'core_competency\\external', 'count_templates', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(187, 'core_competency_count_templates_using_competency', 'core_competency\\external', 'count_templates_using_competency', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(188, 'core_competency_create_plan', 'core_competency\\external', 'create_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(189, 'core_competency_update_plan', 'core_competency\\external', 'update_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(190, 'core_competency_complete_plan', 'core_competency\\external', 'complete_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(191, 'core_competency_reopen_plan', 'core_competency\\external', 'reopen_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(192, 'core_competency_read_plan', 'core_competency\\external', 'read_plan', NULL, 'moodle', 'moodle/competency:planviewown', NULL),
(193, 'core_competency_delete_plan', 'core_competency\\external', 'delete_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(194, 'core_competency_list_user_plans', 'core_competency\\external', 'list_user_plans', NULL, 'moodle', 'moodle/competency:planviewown', NULL),
(195, 'core_competency_list_plan_competencies', 'core_competency\\external', 'list_plan_competencies', NULL, 'moodle', 'moodle/competency:planviewown', NULL),
(196, 'core_competency_add_competency_to_plan', 'core_competency\\external', 'add_competency_to_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(197, 'core_competency_remove_competency_from_plan', 'core_competency\\external', 'remove_competency_from_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(198, 'core_competency_reorder_plan_competency', 'core_competency\\external', 'reorder_plan_competency', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(199, 'core_competency_plan_request_review', 'core_competency\\external', 'plan_request_review', NULL, 'moodle', 'moodle/competency:planmanagedraft', NULL),
(200, 'core_competency_plan_start_review', 'core_competency\\external', 'plan_start_review', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(201, 'core_competency_plan_stop_review', 'core_competency\\external', 'plan_stop_review', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(202, 'core_competency_plan_cancel_review_request', 'core_competency\\external', 'plan_cancel_review_request', NULL, 'moodle', 'moodle/competency:planmanagedraft', NULL),
(203, 'core_competency_approve_plan', 'core_competency\\external', 'approve_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(204, 'core_competency_unapprove_plan', 'core_competency\\external', 'unapprove_plan', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(205, 'core_competency_template_has_related_data', 'core_competency\\external', 'template_has_related_data', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(206, 'core_competency_get_scale_values', 'core_competency\\external', 'get_scale_values', NULL, 'moodle', 'moodle/competency:competencymanage', 'moodle_mobile_app'),
(207, 'core_competency_add_related_competency', 'core_competency\\external', 'add_related_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(208, 'core_competency_remove_related_competency', 'core_competency\\external', 'remove_related_competency', NULL, 'moodle', 'moodle/competency:competencymanage', NULL),
(209, 'core_competency_read_user_evidence', 'core_competency\\external', 'read_user_evidence', NULL, 'moodle', 'moodle/competency:userevidenceview', NULL),
(210, 'core_competency_delete_user_evidence', 'core_competency\\external', 'delete_user_evidence', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
(211, 'core_competency_create_user_evidence_competency', 'core_competency\\external', 'create_user_evidence_competency', NULL, 'moodle', 'moodle/competency:userevidencemanageown, moodle/competency:competencyview', NULL),
(212, 'core_competency_delete_user_evidence_competency', 'core_competency\\external', 'delete_user_evidence_competency', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
(213, 'core_competency_user_competency_cancel_review_request', 'core_competency\\external', 'user_competency_cancel_review_request', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
(214, 'core_competency_user_competency_request_review', 'core_competency\\external', 'user_competency_request_review', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
(215, 'core_competency_user_competency_start_review', 'core_competency\\external', 'user_competency_start_review', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
(216, 'core_competency_user_competency_stop_review', 'core_competency\\external', 'user_competency_stop_review', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
(217, 'core_competency_user_competency_viewed', 'core_competency\\external', 'user_competency_viewed', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
(218, 'core_competency_user_competency_viewed_in_plan', 'core_competency\\external', 'user_competency_viewed_in_plan', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
(219, 'core_competency_user_competency_viewed_in_course', 'core_competency\\external', 'user_competency_viewed_in_course', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
(220, 'core_competency_user_competency_plan_viewed', 'core_competency\\external', 'user_competency_plan_viewed', NULL, 'moodle', 'moodle/competency:usercompetencyview', 'moodle_mobile_app'),
(221, 'core_competency_grade_competency', 'core_competency\\external', 'grade_competency', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
(222, 'core_competency_grade_competency_in_plan', 'core_competency\\external', 'grade_competency_in_plan', NULL, 'moodle', 'moodle/competency:competencygrade', NULL),
(223, 'core_competency_grade_competency_in_course', 'core_competency\\external', 'grade_competency_in_course', NULL, 'moodle', 'moodle/competency:competencygrade', 'moodle_mobile_app'),
(224, 'core_competency_unlink_plan_from_template', 'core_competency\\external', 'unlink_plan_from_template', NULL, 'moodle', 'moodle/competency:planmanage', NULL),
(225, 'core_competency_template_viewed', 'core_competency\\external', 'template_viewed', NULL, 'moodle', 'moodle/competency:templateview', NULL),
(226, 'core_competency_request_review_of_user_evidence_linked_competencies', 'core_competency\\external', 'request_review_of_user_evidence_linked_competencies', NULL, 'moodle', 'moodle/competency:userevidencemanageown', NULL),
(227, 'core_competency_update_course_competency_settings', 'core_competency\\external', 'update_course_competency_settings', NULL, 'moodle', 'moodle/competency:coursecompetencyconfigure', NULL),
(228, 'core_competency_delete_evidence', 'core_competency\\external', 'delete_evidence', NULL, 'moodle', 'moodle/competency:evidencedelete', 'moodle_mobile_app'),
(229, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', '', 'moodle_mobile_app'),
(230, 'core_block_get_course_blocks', 'core_block_external', 'get_course_blocks', NULL, 'moodle', '', 'moodle_mobile_app'),
(231, 'mod_assign_copy_previous_attempt', 'mod_assign_external', 'copy_previous_attempt', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:submit', NULL),
(232, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(233, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(234, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(235, 'mod_assign_get_user_flags', 'mod_assign_external', 'get_user_flags', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(236, 'mod_assign_set_user_flags', 'mod_assign_external', 'set_user_flags', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade', 'moodle_mobile_app'),
(237, 'mod_assign_get_user_mappings', 'mod_assign_external', 'get_user_mappings', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(238, 'mod_assign_revert_submissions_to_draft', 'mod_assign_external', 'revert_submissions_to_draft', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(239, 'mod_assign_lock_submissions', 'mod_assign_external', 'lock_submissions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(240, 'mod_assign_unlock_submissions', 'mod_assign_external', 'unlock_submissions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(241, 'mod_assign_save_submission', 'mod_assign_external', 'save_submission', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(242, 'mod_assign_submit_for_grading', 'mod_assign_external', 'submit_for_grading', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(243, 'mod_assign_save_grade', 'mod_assign_external', 'save_grade', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(244, 'mod_assign_save_grades', 'mod_assign_external', 'save_grades', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(245, 'mod_assign_save_user_extensions', 'mod_assign_external', 'save_user_extensions', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(246, 'mod_assign_reveal_identities', 'mod_assign_external', 'reveal_identities', 'mod/assign/externallib.php', 'mod_assign', '', 'moodle_mobile_app'),
(247, 'mod_assign_view_grading_table', 'mod_assign_external', 'view_grading_table', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:viewgrades', 'moodle_mobile_app'),
(248, 'mod_assign_view_submission_status', 'mod_assign_external', 'view_submission_status', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view', 'moodle_mobile_app'),
(249, 'mod_assign_get_submission_status', 'mod_assign_external', 'get_submission_status', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view', 'moodle_mobile_app'),
(250, 'mod_assign_list_participants', 'mod_assign_external', 'list_participants', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:viewgrades', 'moodle_mobile_app'),
(251, 'mod_assign_submit_grading_form', 'mod_assign_external', 'submit_grading_form', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade', 'moodle_mobile_app'),
(252, 'mod_assign_get_participant', 'mod_assign_external', 'get_participant', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view, mod/assign:viewgrades', 'moodle_mobile_app'),
(253, 'mod_assign_view_assign', 'mod_assign_external', 'view_assign', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:view', 'moodle_mobile_app'),
(254, 'mod_book_view_book', 'mod_book_external', 'view_book', NULL, 'mod_book', 'mod/book:read', 'moodle_mobile_app'),
(255, 'mod_book_get_books_by_courses', 'mod_book_external', 'get_books_by_courses', NULL, 'mod_book', '', 'moodle_mobile_app'),
(256, 'mod_chat_login_user', 'mod_chat_external', 'login_user', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
(257, 'mod_chat_get_chat_users', 'mod_chat_external', 'get_chat_users', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
(258, 'mod_chat_send_chat_message', 'mod_chat_external', 'send_chat_message', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
(259, 'mod_chat_get_chat_latest_messages', 'mod_chat_external', 'get_chat_latest_messages', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
(260, 'mod_chat_view_chat', 'mod_chat_external', 'view_chat', NULL, 'mod_chat', 'mod/chat:chat', 'moodle_mobile_app'),
(261, 'mod_chat_get_chats_by_courses', 'mod_chat_external', 'get_chats_by_courses', NULL, 'mod_chat', '', 'moodle_mobile_app'),
(262, 'mod_choice_get_choice_results', 'mod_choice_external', 'get_choice_results', NULL, 'mod_choice', '', 'moodle_mobile_app'),
(263, 'mod_choice_get_choice_options', 'mod_choice_external', 'get_choice_options', NULL, 'mod_choice', 'mod/choice:choose', 'moodle_mobile_app'),
(264, 'mod_choice_submit_choice_response', 'mod_choice_external', 'submit_choice_response', NULL, 'mod_choice', 'mod/choice:choose', 'moodle_mobile_app'),
(265, 'mod_choice_view_choice', 'mod_choice_external', 'view_choice', NULL, 'mod_choice', '', 'moodle_mobile_app'),
(266, 'mod_choice_get_choices_by_courses', 'mod_choice_external', 'get_choices_by_courses', NULL, 'mod_choice', '', 'moodle_mobile_app'),
(267, 'mod_choice_delete_choice_responses', 'mod_choice_external', 'delete_choice_responses', NULL, 'mod_choice', 'mod/choice:choose', 'moodle_mobile_app'),
(268, 'mod_data_get_databases_by_courses', 'mod_data_external', 'get_databases_by_courses', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(269, 'mod_data_view_database', 'mod_data_external', 'view_database', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(270, 'mod_data_get_data_access_information', 'mod_data_external', 'get_data_access_information', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(271, 'mod_data_get_entries', 'mod_data_external', 'get_entries', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(272, 'mod_data_get_entry', 'mod_data_external', 'get_entry', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(273, 'mod_data_get_fields', 'mod_data_external', 'get_fields', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(274, 'mod_data_search_entries', 'mod_data_external', 'search_entries', NULL, 'mod_data', 'mod/data:viewentry', 'moodle_mobile_app'),
(275, 'mod_data_approve_entry', 'mod_data_external', 'approve_entry', NULL, 'mod_data', 'mod/data:approve', 'moodle_mobile_app'),
(276, 'mod_data_delete_entry', 'mod_data_external', 'delete_entry', NULL, 'mod_data', 'mod/data:manageentries', 'moodle_mobile_app'),
(277, 'mod_data_add_entry', 'mod_data_external', 'add_entry', NULL, 'mod_data', 'mod/data:writeentry', 'moodle_mobile_app'),
(278, 'mod_data_update_entry', 'mod_data_external', 'update_entry', NULL, 'mod_data', 'mod/data:writeentry', 'moodle_mobile_app'),
(279, 'mod_feedback_get_feedbacks_by_courses', 'mod_feedback_external', 'get_feedbacks_by_courses', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(280, 'mod_feedback_get_feedback_access_information', 'mod_feedback_external', 'get_feedback_access_information', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(281, 'mod_feedback_view_feedback', 'mod_feedback_external', 'view_feedback', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(282, 'mod_feedback_get_current_completed_tmp', 'mod_feedback_external', 'get_current_completed_tmp', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(283, 'mod_feedback_get_items', 'mod_feedback_external', 'get_items', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(284, 'mod_feedback_launch_feedback', 'mod_feedback_external', 'launch_feedback', NULL, 'mod_feedback', 'mod/feedback:complete', 'moodle_mobile_app'),
(285, 'mod_feedback_get_page_items', 'mod_feedback_external', 'get_page_items', NULL, 'mod_feedback', 'mod/feedback:complete', 'moodle_mobile_app'),
(286, 'mod_feedback_process_page', 'mod_feedback_external', 'process_page', NULL, 'mod_feedback', 'mod/feedback:complete', 'moodle_mobile_app'),
(287, 'mod_feedback_get_analysis', 'mod_feedback_external', 'get_analysis', NULL, 'mod_feedback', 'mod/feedback:viewanalysepage', 'moodle_mobile_app'),
(288, 'mod_feedback_get_unfinished_responses', 'mod_feedback_external', 'get_unfinished_responses', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(289, 'mod_feedback_get_finished_responses', 'mod_feedback_external', 'get_finished_responses', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(290, 'mod_feedback_get_non_respondents', 'mod_feedback_external', 'get_non_respondents', NULL, 'mod_feedback', 'mod/feedback:viewreports', 'moodle_mobile_app'),
(291, 'mod_feedback_get_responses_analysis', 'mod_feedback_external', 'get_responses_analysis', NULL, 'mod_feedback', 'mod/feedback:viewreports', 'moodle_mobile_app'),
(292, 'mod_feedback_get_last_completed', 'mod_feedback_external', 'get_last_completed', NULL, 'mod_feedback', 'mod/feedback:view', 'moodle_mobile_app'),
(293, 'mod_folder_view_folder', 'mod_folder_external', 'view_folder', NULL, 'mod_folder', 'mod/folder:view', 'moodle_mobile_app'),
(294, 'mod_folder_get_folders_by_courses', 'mod_folder_external', 'get_folders_by_courses', NULL, 'mod_folder', 'mod/folder:view', 'moodle_mobile_app'),
(295, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion', 'moodle_mobile_app'),
(296, 'mod_forum_get_forum_discussion_posts', 'mod_forum_external', 'get_forum_discussion_posts', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting', 'moodle_mobile_app'),
(297, 'mod_forum_get_forum_discussions_paginated', 'mod_forum_external', 'get_forum_discussions_paginated', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting', 'moodle_mobile_app'),
(298, 'mod_forum_view_forum', 'mod_forum_external', 'view_forum', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion', 'moodle_mobile_app'),
(299, 'mod_forum_view_forum_discussion', 'mod_forum_external', 'view_forum_discussion', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion', 'moodle_mobile_app'),
(300, 'mod_forum_add_discussion_post', 'mod_forum_external', 'add_discussion_post', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:replypost', 'moodle_mobile_app'),
(301, 'mod_forum_add_discussion', 'mod_forum_external', 'add_discussion', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:startdiscussion', 'moodle_mobile_app'),
(302, 'mod_forum_can_add_discussion', 'mod_forum_external', 'can_add_discussion', 'mod/forum/externallib.php', 'mod_forum', '', 'moodle_mobile_app'),
(303, 'mod_glossary_get_glossaries_by_courses', 'mod_glossary_external', 'get_glossaries_by_courses', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(304, 'mod_glossary_view_glossary', 'mod_glossary_external', 'view_glossary', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(305, 'mod_glossary_view_entry', 'mod_glossary_external', 'view_entry', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(306, 'mod_glossary_get_entries_by_letter', 'mod_glossary_external', 'get_entries_by_letter', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(307, 'mod_glossary_get_entries_by_date', 'mod_glossary_external', 'get_entries_by_date', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(308, 'mod_glossary_get_categories', 'mod_glossary_external', 'get_categories', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(309, 'mod_glossary_get_entries_by_category', 'mod_glossary_external', 'get_entries_by_category', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(310, 'mod_glossary_get_authors', 'mod_glossary_external', 'get_authors', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(311, 'mod_glossary_get_entries_by_author', 'mod_glossary_external', 'get_entries_by_author', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(312, 'mod_glossary_get_entries_by_author_id', 'mod_glossary_external', 'get_entries_by_author_id', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(313, 'mod_glossary_get_entries_by_search', 'mod_glossary_external', 'get_entries_by_search', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(314, 'mod_glossary_get_entries_by_term', 'mod_glossary_external', 'get_entries_by_term', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(315, 'mod_glossary_get_entries_to_approve', 'mod_glossary_external', 'get_entries_to_approve', NULL, 'mod_glossary', 'mod/glossary:approve', 'moodle_mobile_app'),
(316, 'mod_glossary_get_entry_by_id', 'mod_glossary_external', 'get_entry_by_id', NULL, 'mod_glossary', 'mod/glossary:view', 'moodle_mobile_app'),
(317, 'mod_glossary_add_entry', 'mod_glossary_external', 'add_entry', NULL, 'mod_glossary', 'mod/glossary:write', 'moodle_mobile_app'),
(318, 'mod_imscp_view_imscp', 'mod_imscp_external', 'view_imscp', NULL, 'mod_imscp', 'mod/imscp:view', 'moodle_mobile_app');
INSERT DELAYED IGNORE INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`, `services`) VALUES
(319, 'mod_imscp_get_imscps_by_courses', 'mod_imscp_external', 'get_imscps_by_courses', NULL, 'mod_imscp', 'mod/imscp:view', 'moodle_mobile_app'),
(320, 'mod_label_get_labels_by_courses', 'mod_label_external', 'get_labels_by_courses', NULL, 'mod_label', 'mod/label:view', 'moodle_mobile_app'),
(321, 'mod_lesson_get_lessons_by_courses', 'mod_lesson_external', 'get_lessons_by_courses', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(322, 'mod_lesson_get_lesson_access_information', 'mod_lesson_external', 'get_lesson_access_information', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(323, 'mod_lesson_view_lesson', 'mod_lesson_external', 'view_lesson', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(324, 'mod_lesson_get_questions_attempts', 'mod_lesson_external', 'get_questions_attempts', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(325, 'mod_lesson_get_user_grade', 'mod_lesson_external', 'get_user_grade', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(326, 'mod_lesson_get_user_attempt_grade', 'mod_lesson_external', 'get_user_attempt_grade', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(327, 'mod_lesson_get_content_pages_viewed', 'mod_lesson_external', 'get_content_pages_viewed', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(328, 'mod_lesson_get_user_timers', 'mod_lesson_external', 'get_user_timers', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(329, 'mod_lesson_get_pages', 'mod_lesson_external', 'get_pages', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(330, 'mod_lesson_launch_attempt', 'mod_lesson_external', 'launch_attempt', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(331, 'mod_lesson_get_page_data', 'mod_lesson_external', 'get_page_data', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(332, 'mod_lesson_process_page', 'mod_lesson_external', 'process_page', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(333, 'mod_lesson_finish_attempt', 'mod_lesson_external', 'finish_attempt', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(334, 'mod_lesson_get_attempts_overview', 'mod_lesson_external', 'get_attempts_overview', NULL, 'mod_lesson', 'mod/lesson:viewreports', 'moodle_mobile_app'),
(335, 'mod_lesson_get_user_attempt', 'mod_lesson_external', 'get_user_attempt', NULL, 'mod_lesson', 'mod/lesson:viewreports', 'moodle_mobile_app'),
(336, 'mod_lesson_get_pages_possible_jumps', 'mod_lesson_external', 'get_pages_possible_jumps', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(337, 'mod_lesson_get_lesson', 'mod_lesson_external', 'get_lesson', NULL, 'mod_lesson', 'mod/lesson:view', 'moodle_mobile_app'),
(338, 'mod_lti_get_tool_launch_data', 'mod_lti_external', 'get_tool_launch_data', NULL, 'mod_lti', 'mod/lti:view', 'moodle_mobile_app'),
(339, 'mod_lti_get_ltis_by_courses', 'mod_lti_external', 'get_ltis_by_courses', NULL, 'mod_lti', 'mod/lti:view', 'moodle_mobile_app'),
(340, 'mod_lti_view_lti', 'mod_lti_external', 'view_lti', NULL, 'mod_lti', 'mod/lti:view', 'moodle_mobile_app'),
(341, 'mod_lti_get_tool_proxies', 'mod_lti_external', 'get_tool_proxies', NULL, 'mod_lti', 'moodle/site:config', NULL),
(342, 'mod_lti_create_tool_proxy', 'mod_lti_external', 'create_tool_proxy', NULL, 'mod_lti', 'moodle/site:config', NULL),
(343, 'mod_lti_delete_tool_proxy', 'mod_lti_external', 'delete_tool_proxy', NULL, 'mod_lti', 'moodle/site:config', NULL),
(344, 'mod_lti_get_tool_proxy_registration_request', 'mod_lti_external', 'get_tool_proxy_registration_request', NULL, 'mod_lti', 'moodle/site:config', NULL),
(345, 'mod_lti_get_tool_types', 'mod_lti_external', 'get_tool_types', NULL, 'mod_lti', 'moodle/site:config', NULL),
(346, 'mod_lti_create_tool_type', 'mod_lti_external', 'create_tool_type', NULL, 'mod_lti', 'moodle/site:config', NULL),
(347, 'mod_lti_update_tool_type', 'mod_lti_external', 'update_tool_type', NULL, 'mod_lti', 'moodle/site:config', NULL),
(348, 'mod_lti_delete_tool_type', 'mod_lti_external', 'delete_tool_type', NULL, 'mod_lti', 'moodle/site:config', NULL),
(349, 'mod_lti_is_cartridge', 'mod_lti_external', 'is_cartridge', NULL, 'mod_lti', 'moodle/site:config', NULL),
(350, 'mod_page_view_page', 'mod_page_external', 'view_page', NULL, 'mod_page', 'mod/page:view', 'moodle_mobile_app'),
(351, 'mod_page_get_pages_by_courses', 'mod_page_external', 'get_pages_by_courses', NULL, 'mod_page', 'mod/page:view', 'moodle_mobile_app'),
(352, 'mod_quiz_get_quizzes_by_courses', 'mod_quiz_external', 'get_quizzes_by_courses', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(353, 'mod_quiz_view_quiz', 'mod_quiz_external', 'view_quiz', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(354, 'mod_quiz_get_user_attempts', 'mod_quiz_external', 'get_user_attempts', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(355, 'mod_quiz_get_user_best_grade', 'mod_quiz_external', 'get_user_best_grade', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(356, 'mod_quiz_get_combined_review_options', 'mod_quiz_external', 'get_combined_review_options', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(357, 'mod_quiz_start_attempt', 'mod_quiz_external', 'start_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(358, 'mod_quiz_get_attempt_data', 'mod_quiz_external', 'get_attempt_data', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(359, 'mod_quiz_get_attempt_summary', 'mod_quiz_external', 'get_attempt_summary', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(360, 'mod_quiz_save_attempt', 'mod_quiz_external', 'save_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(361, 'mod_quiz_process_attempt', 'mod_quiz_external', 'process_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(362, 'mod_quiz_get_attempt_review', 'mod_quiz_external', 'get_attempt_review', NULL, 'mod_quiz', 'mod/quiz:reviewmyattempts', 'moodle_mobile_app'),
(363, 'mod_quiz_view_attempt', 'mod_quiz_external', 'view_attempt', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(364, 'mod_quiz_view_attempt_summary', 'mod_quiz_external', 'view_attempt_summary', NULL, 'mod_quiz', 'mod/quiz:attempt', 'moodle_mobile_app'),
(365, 'mod_quiz_view_attempt_review', 'mod_quiz_external', 'view_attempt_review', NULL, 'mod_quiz', 'mod/quiz:reviewmyattempts', 'moodle_mobile_app'),
(366, 'mod_quiz_get_quiz_feedback_for_grade', 'mod_quiz_external', 'get_quiz_feedback_for_grade', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(367, 'mod_quiz_get_quiz_access_information', 'mod_quiz_external', 'get_quiz_access_information', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(368, 'mod_quiz_get_attempt_access_information', 'mod_quiz_external', 'get_attempt_access_information', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(369, 'mod_quiz_get_quiz_required_qtypes', 'mod_quiz_external', 'get_quiz_required_qtypes', NULL, 'mod_quiz', 'mod/quiz:view', 'moodle_mobile_app'),
(370, 'mod_resource_view_resource', 'mod_resource_external', 'view_resource', NULL, 'mod_resource', 'mod/resource:view', 'moodle_mobile_app'),
(371, 'mod_resource_get_resources_by_courses', 'mod_resource_external', 'get_resources_by_courses', NULL, 'mod_resource', 'mod/resource:view', 'moodle_mobile_app'),
(372, 'mod_scorm_view_scorm', 'mod_scorm_external', 'view_scorm', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(373, 'mod_scorm_get_scorm_attempt_count', 'mod_scorm_external', 'get_scorm_attempt_count', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(374, 'mod_scorm_get_scorm_scoes', 'mod_scorm_external', 'get_scorm_scoes', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(375, 'mod_scorm_get_scorm_user_data', 'mod_scorm_external', 'get_scorm_user_data', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(376, 'mod_scorm_insert_scorm_tracks', 'mod_scorm_external', 'insert_scorm_tracks', NULL, 'mod_scorm', 'mod/scorm:savetrack', 'moodle_mobile_app'),
(377, 'mod_scorm_get_scorm_sco_tracks', 'mod_scorm_external', 'get_scorm_sco_tracks', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(378, 'mod_scorm_get_scorms_by_courses', 'mod_scorm_external', 'get_scorms_by_courses', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(379, 'mod_scorm_launch_sco', 'mod_scorm_external', 'launch_sco', NULL, 'mod_scorm', '', 'moodle_mobile_app'),
(380, 'mod_survey_get_surveys_by_courses', 'mod_survey_external', 'get_surveys_by_courses', NULL, 'mod_survey', '', 'moodle_mobile_app'),
(381, 'mod_survey_view_survey', 'mod_survey_external', 'view_survey', NULL, 'mod_survey', 'mod/survey:participate', 'moodle_mobile_app'),
(382, 'mod_survey_get_questions', 'mod_survey_external', 'get_questions', NULL, 'mod_survey', 'mod/survey:participate', 'moodle_mobile_app'),
(383, 'mod_survey_submit_answers', 'mod_survey_external', 'submit_answers', NULL, 'mod_survey', 'mod/survey:participate', 'moodle_mobile_app'),
(384, 'mod_url_view_url', 'mod_url_external', 'view_url', NULL, 'mod_url', 'mod/url:view', 'moodle_mobile_app'),
(385, 'mod_url_get_urls_by_courses', 'mod_url_external', 'get_urls_by_courses', NULL, 'mod_url', 'mod/url:view', 'moodle_mobile_app'),
(386, 'mod_wiki_get_wikis_by_courses', 'mod_wiki_external', 'get_wikis_by_courses', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(387, 'mod_wiki_view_wiki', 'mod_wiki_external', 'view_wiki', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(388, 'mod_wiki_view_page', 'mod_wiki_external', 'view_page', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(389, 'mod_wiki_get_subwikis', 'mod_wiki_external', 'get_subwikis', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(390, 'mod_wiki_get_subwiki_pages', 'mod_wiki_external', 'get_subwiki_pages', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(391, 'mod_wiki_get_subwiki_files', 'mod_wiki_external', 'get_subwiki_files', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(392, 'mod_wiki_get_page_contents', 'mod_wiki_external', 'get_page_contents', NULL, 'mod_wiki', 'mod/wiki:viewpage', 'moodle_mobile_app'),
(393, 'mod_wiki_get_page_for_editing', 'mod_wiki_external', 'get_page_for_editing', NULL, 'mod_wiki', 'mod/wiki:editpage', 'moodle_mobile_app'),
(394, 'mod_wiki_new_page', 'mod_wiki_external', 'new_page', NULL, 'mod_wiki', 'mod/wiki:editpage', 'moodle_mobile_app'),
(395, 'mod_wiki_edit_page', 'mod_wiki_external', 'edit_page', NULL, 'mod_wiki', 'mod/wiki:editpage', 'moodle_mobile_app'),
(396, 'mod_workshop_get_workshops_by_courses', 'mod_workshop_external', 'get_workshops_by_courses', NULL, 'mod_workshop', 'mod/workshop:view', 'moodle_mobile_app'),
(397, 'mod_workshop_get_workshop_access_information', 'mod_workshop_external', 'get_workshop_access_information', NULL, 'mod_workshop', 'mod/workshop:view', 'moodle_mobile_app'),
(398, 'mod_workshop_get_user_plan', 'mod_workshop_external', 'get_user_plan', NULL, 'mod_workshop', 'mod/workshop:view', 'moodle_mobile_app'),
(399, 'mod_workshop_view_workshop', 'mod_workshop_external', 'view_workshop', NULL, 'mod_workshop', 'mod/workshop:view', 'moodle_mobile_app'),
(400, 'auth_email_get_signup_settings', 'auth_email_external', 'get_signup_settings', NULL, 'auth_email', '', NULL),
(401, 'auth_email_signup_user', 'auth_email_external', 'signup_user', NULL, 'auth_email', '', NULL),
(402, 'enrol_guest_get_instance_info', 'enrol_guest_external', 'get_instance_info', NULL, 'enrol_guest', '', 'moodle_mobile_app'),
(403, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol', NULL),
(404, 'enrol_manual_unenrol_users', 'enrol_manual_external', 'unenrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:unenrol', NULL),
(405, 'enrol_self_get_instance_info', 'enrol_self_external', 'get_instance_info', 'enrol/self/externallib.php', 'enrol_self', '', 'moodle_mobile_app'),
(406, 'enrol_self_enrol_user', 'enrol_self_external', 'enrol_user', 'enrol/self/externallib.php', 'enrol_self', '', 'moodle_mobile_app'),
(407, 'message_airnotifier_is_system_configured', 'message_airnotifier_external', 'is_system_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', '', 'moodle_mobile_app'),
(408, 'message_airnotifier_are_notification_preferences_configured', 'message_airnotifier_external', 'are_notification_preferences_configured', 'message/output/airnotifier/externallib.php', 'message_airnotifier', '', 'moodle_mobile_app'),
(409, 'message_airnotifier_get_user_devices', 'message_airnotifier_external', 'get_user_devices', 'message/output/airnotifier/externallib.php', 'message_airnotifier', '', 'moodle_mobile_app'),
(410, 'message_airnotifier_enable_device', 'message_airnotifier_external', 'enable_device', 'message/output/airnotifier/externallib.php', 'message_airnotifier', 'message/airnotifier:managedevice', 'moodle_mobile_app'),
(411, 'message_popup_get_popup_notifications', 'message_popup_external', 'get_popup_notifications', 'message/output/popup/externallib.php', 'message_popup', '', 'moodle_mobile_app'),
(412, 'message_popup_get_unread_popup_notification_count', 'message_popup_external', 'get_unread_popup_notification_count', 'message/output/popup/externallib.php', 'message_popup', '', 'moodle_mobile_app'),
(413, 'report_competency_data_for_report', 'report_competency\\external', 'data_for_report', NULL, 'report_competency', 'moodle/competency:coursecompetencyview', NULL),
(414, 'gradereport_overview_get_course_grades', 'gradereport_overview_external', 'get_course_grades', NULL, 'gradereport_overview', '', 'moodle_mobile_app'),
(415, 'gradereport_overview_view_grade_report', 'gradereport_overview_external', 'view_grade_report', NULL, 'gradereport_overview', 'gradereport/overview:view', 'moodle_mobile_app'),
(416, 'gradereport_user_get_grades_table', 'gradereport_user_external', 'get_grades_table', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view', 'moodle_mobile_app'),
(417, 'gradereport_user_view_grade_report', 'gradereport_user_external', 'view_grade_report', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view', 'moodle_mobile_app'),
(418, 'gradereport_user_get_grade_items', 'gradereport_user_external', 'get_grade_items', 'grade/report/user/externallib.php', 'gradereport_user', 'gradereport/user:view', 'moodle_mobile_app'),
(419, 'tool_lp_data_for_competency_frameworks_manage_page', 'tool_lp\\external', 'data_for_competency_frameworks_manage_page', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
(420, 'tool_lp_data_for_competency_summary', 'tool_lp\\external', 'data_for_competency_summary', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
(421, 'tool_lp_data_for_competencies_manage_page', 'tool_lp\\external', 'data_for_competencies_manage_page', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
(422, 'tool_lp_list_courses_using_competency', 'tool_lp\\external', 'list_courses_using_competency', NULL, 'tool_lp', 'moodle/competency:coursecompetencyview', NULL),
(423, 'tool_lp_data_for_course_competencies_page', 'tool_lp\\external', 'data_for_course_competencies_page', NULL, 'tool_lp', 'moodle/competency:coursecompetencyview', 'moodle_mobile_app'),
(424, 'tool_lp_data_for_template_competencies_page', 'tool_lp\\external', 'data_for_template_competencies_page', NULL, 'tool_lp', 'moodle/competency:templateview', NULL),
(425, 'tool_lp_data_for_templates_manage_page', 'tool_lp\\external', 'data_for_templates_manage_page', NULL, 'tool_lp', 'moodle/competency:templateview', NULL),
(426, 'tool_lp_data_for_plans_page', 'tool_lp\\external', 'data_for_plans_page', NULL, 'tool_lp', 'moodle/competency:planviewown', 'moodle_mobile_app'),
(427, 'tool_lp_data_for_plan_page', 'tool_lp\\external', 'data_for_plan_page', NULL, 'tool_lp', 'moodle/competency:planview', 'moodle_mobile_app'),
(428, 'tool_lp_data_for_related_competencies_section', 'tool_lp\\external', 'data_for_related_competencies_section', NULL, 'tool_lp', 'moodle/competency:competencyview', NULL),
(429, 'tool_lp_search_users', 'tool_lp\\external', 'search_users', NULL, 'tool_lp', '', NULL),
(430, 'tool_lp_search_cohorts', 'core_cohort_external', 'search_cohorts', 'cohort/externallib.php', 'tool_lp', 'moodle/cohort:view', NULL),
(431, 'tool_lp_data_for_user_evidence_list_page', 'tool_lp\\external', 'data_for_user_evidence_list_page', NULL, 'tool_lp', 'moodle/competency:userevidenceview', 'moodle_mobile_app'),
(432, 'tool_lp_data_for_user_evidence_page', 'tool_lp\\external', 'data_for_user_evidence_page', NULL, 'tool_lp', 'moodle/competency:userevidenceview', 'moodle_mobile_app'),
(433, 'tool_lp_data_for_user_competency_summary', 'tool_lp\\external', 'data_for_user_competency_summary', NULL, 'tool_lp', 'moodle/competency:planview', 'moodle_mobile_app'),
(434, 'tool_lp_data_for_user_competency_summary_in_plan', 'tool_lp\\external', 'data_for_user_competency_summary_in_plan', NULL, 'tool_lp', 'moodle/competency:planview', 'moodle_mobile_app'),
(435, 'tool_lp_data_for_user_competency_summary_in_course', 'tool_lp\\external', 'data_for_user_competency_summary_in_course', NULL, 'tool_lp', 'moodle/competency:coursecompetencyview', 'moodle_mobile_app'),
(436, 'tool_mobile_get_plugins_supporting_mobile', 'tool_mobile\\external', 'get_plugins_supporting_mobile', NULL, 'tool_mobile', '', 'moodle_mobile_app'),
(437, 'tool_mobile_get_public_config', 'tool_mobile\\external', 'get_public_config', NULL, 'tool_mobile', '', 'moodle_mobile_app'),
(438, 'tool_mobile_get_config', 'tool_mobile\\external', 'get_config', NULL, 'tool_mobile', '', 'moodle_mobile_app'),
(439, 'tool_mobile_get_autologin_key', 'tool_mobile\\external', 'get_autologin_key', NULL, 'tool_mobile', '', 'moodle_mobile_app'),
(440, 'tool_templatelibrary_list_templates', 'tool_templatelibrary\\external', 'list_templates', NULL, 'tool_templatelibrary', '', NULL),
(441, 'tool_templatelibrary_load_canonical_template', 'tool_templatelibrary\\external', 'load_canonical_template', NULL, 'tool_templatelibrary', '', NULL),
(442, 'tool_usertours_fetch_and_start_tour', 'tool_usertours\\external\\tour', 'fetch_and_start_tour', NULL, 'tool_usertours', '', NULL),
(443, 'tool_usertours_step_shown', 'tool_usertours\\external\\tour', 'step_shown', NULL, 'tool_usertours', '', NULL),
(444, 'tool_usertours_complete_tour', 'tool_usertours\\external\\tour', 'complete_tour', NULL, 'tool_usertours', '', NULL),
(445, 'tool_usertours_reset_tour', 'tool_usertours\\external\\tour', 'reset_tour', NULL, 'tool_usertours', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

DROP TABLE IF EXISTS `mdl_external_services`;
CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='built in and custom external services';

--
-- Truncate table before insert `mdl_external_services`
--

TRUNCATE TABLE `mdl_external_services`;
--
-- Dumping data for table `mdl_external_services`
--

INSERT DELAYED IGNORE INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`, `uploadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1502328685, 1502329982, 'moodle_mobile_app', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

DROP TABLE IF EXISTS `mdl_external_services_functions`;
CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group';

--
-- Truncate table before insert `mdl_external_services_functions`
--

TRUNCATE TABLE `mdl_external_services_functions`;
--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT DELAYED IGNORE INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'core_badges_get_user_badges'),
(2, 1, 'core_calendar_create_calendar_events'),
(3, 1, 'core_calendar_delete_calendar_events'),
(4, 1, 'core_calendar_get_calendar_events'),
(5, 1, 'core_calendar_get_action_events_by_timesort'),
(6, 1, 'core_calendar_get_action_events_by_course'),
(7, 1, 'core_calendar_get_action_events_by_courses'),
(8, 1, 'core_calendar_get_calendar_event_by_id'),
(9, 1, 'core_comment_get_comments'),
(10, 1, 'core_completion_get_activities_completion_status'),
(11, 1, 'core_completion_get_course_completion_status'),
(12, 1, 'core_completion_mark_course_self_completed'),
(13, 1, 'core_completion_update_activity_completion_status_manually'),
(14, 1, 'core_course_get_categories'),
(15, 1, 'core_course_get_contents'),
(16, 1, 'core_course_get_course_module'),
(17, 1, 'core_course_get_course_module_by_instance'),
(18, 1, 'core_course_get_courses'),
(19, 1, 'core_course_search_courses'),
(20, 1, 'core_course_view_course'),
(21, 1, 'core_course_get_activities_overview'),
(22, 1, 'core_course_get_user_navigation_options'),
(23, 1, 'core_course_get_user_administration_options'),
(24, 1, 'core_course_get_courses_by_field'),
(25, 1, 'core_course_check_updates'),
(26, 1, 'core_course_get_updates_since'),
(27, 1, 'core_enrol_get_course_enrolment_methods'),
(28, 1, 'core_enrol_get_enrolled_users'),
(29, 1, 'core_enrol_get_users_courses'),
(30, 1, 'core_files_get_files'),
(31, 1, 'core_get_component_strings'),
(32, 1, 'core_group_get_activity_allowed_groups'),
(33, 1, 'core_group_get_activity_groupmode'),
(34, 1, 'core_group_get_course_user_groups'),
(35, 1, 'core_message_block_contacts'),
(36, 1, 'core_message_create_contacts'),
(37, 1, 'core_message_delete_contacts'),
(38, 1, 'core_message_delete_conversation'),
(39, 1, 'core_message_delete_message'),
(40, 1, 'core_message_get_blocked_users'),
(41, 1, 'core_message_data_for_messagearea_search_messages'),
(42, 1, 'core_message_data_for_messagearea_conversations'),
(43, 1, 'core_message_data_for_messagearea_contacts'),
(44, 1, 'core_message_data_for_messagearea_messages'),
(45, 1, 'core_message_get_contacts'),
(46, 1, 'core_message_get_messages'),
(47, 1, 'core_message_get_unread_conversations_count'),
(48, 1, 'core_message_mark_all_notifications_as_read'),
(49, 1, 'core_message_mark_all_messages_as_read'),
(50, 1, 'core_message_mark_message_read'),
(51, 1, 'core_message_message_processor_config_form'),
(52, 1, 'core_message_search_contacts'),
(53, 1, 'core_message_send_instant_messages'),
(54, 1, 'core_message_unblock_contacts'),
(55, 1, 'core_message_get_user_notification_preferences'),
(56, 1, 'core_message_get_user_message_preferences'),
(57, 1, 'core_notes_create_notes'),
(58, 1, 'core_notes_delete_notes'),
(59, 1, 'core_notes_get_course_notes'),
(60, 1, 'core_notes_view_notes'),
(61, 1, 'core_question_update_flag'),
(62, 1, 'core_rating_get_item_ratings'),
(63, 1, 'core_rating_add_rating'),
(64, 1, 'core_user_add_user_device'),
(65, 1, 'core_user_add_user_private_files'),
(66, 1, 'core_user_get_course_user_profiles'),
(67, 1, 'core_user_get_users_by_field'),
(68, 1, 'core_user_remove_user_device'),
(69, 1, 'core_user_update_user_preferences'),
(70, 1, 'core_user_view_user_list'),
(71, 1, 'core_user_view_user_profile'),
(72, 1, 'core_user_get_user_preferences'),
(73, 1, 'core_user_update_picture'),
(74, 1, 'core_user_agree_site_policy'),
(75, 1, 'core_user_get_private_files_info'),
(76, 1, 'core_competency_competency_viewed'),
(77, 1, 'core_competency_list_course_competencies'),
(78, 1, 'core_competency_get_scale_values'),
(79, 1, 'core_competency_user_competency_viewed'),
(80, 1, 'core_competency_user_competency_viewed_in_plan'),
(81, 1, 'core_competency_user_competency_viewed_in_course'),
(82, 1, 'core_competency_user_competency_plan_viewed'),
(83, 1, 'core_competency_grade_competency_in_course'),
(84, 1, 'core_competency_delete_evidence'),
(85, 1, 'core_webservice_get_site_info'),
(86, 1, 'core_block_get_course_blocks'),
(87, 1, 'mod_assign_get_grades'),
(88, 1, 'mod_assign_get_assignments'),
(89, 1, 'mod_assign_get_submissions'),
(90, 1, 'mod_assign_get_user_flags'),
(91, 1, 'mod_assign_set_user_flags'),
(92, 1, 'mod_assign_get_user_mappings'),
(93, 1, 'mod_assign_revert_submissions_to_draft'),
(94, 1, 'mod_assign_lock_submissions'),
(95, 1, 'mod_assign_unlock_submissions'),
(96, 1, 'mod_assign_save_submission'),
(97, 1, 'mod_assign_submit_for_grading'),
(98, 1, 'mod_assign_save_grade'),
(99, 1, 'mod_assign_save_grades'),
(100, 1, 'mod_assign_save_user_extensions'),
(101, 1, 'mod_assign_reveal_identities'),
(102, 1, 'mod_assign_view_grading_table'),
(103, 1, 'mod_assign_view_submission_status'),
(104, 1, 'mod_assign_get_submission_status'),
(105, 1, 'mod_assign_list_participants'),
(106, 1, 'mod_assign_submit_grading_form'),
(107, 1, 'mod_assign_get_participant'),
(108, 1, 'mod_assign_view_assign'),
(109, 1, 'mod_book_view_book'),
(110, 1, 'mod_book_get_books_by_courses'),
(111, 1, 'mod_chat_login_user'),
(112, 1, 'mod_chat_get_chat_users'),
(113, 1, 'mod_chat_send_chat_message'),
(114, 1, 'mod_chat_get_chat_latest_messages'),
(115, 1, 'mod_chat_view_chat'),
(116, 1, 'mod_chat_get_chats_by_courses'),
(117, 1, 'mod_choice_get_choice_results'),
(118, 1, 'mod_choice_get_choice_options'),
(119, 1, 'mod_choice_submit_choice_response'),
(120, 1, 'mod_choice_view_choice'),
(121, 1, 'mod_choice_get_choices_by_courses'),
(122, 1, 'mod_choice_delete_choice_responses'),
(123, 1, 'mod_data_get_databases_by_courses'),
(124, 1, 'mod_data_view_database'),
(125, 1, 'mod_data_get_data_access_information'),
(126, 1, 'mod_data_get_entries'),
(127, 1, 'mod_data_get_entry'),
(128, 1, 'mod_data_get_fields'),
(129, 1, 'mod_data_search_entries'),
(130, 1, 'mod_data_approve_entry'),
(131, 1, 'mod_data_delete_entry'),
(132, 1, 'mod_data_add_entry'),
(133, 1, 'mod_data_update_entry'),
(134, 1, 'mod_feedback_get_feedbacks_by_courses'),
(135, 1, 'mod_feedback_get_feedback_access_information'),
(136, 1, 'mod_feedback_view_feedback'),
(137, 1, 'mod_feedback_get_current_completed_tmp'),
(138, 1, 'mod_feedback_get_items'),
(139, 1, 'mod_feedback_launch_feedback'),
(140, 1, 'mod_feedback_get_page_items'),
(141, 1, 'mod_feedback_process_page'),
(142, 1, 'mod_feedback_get_analysis'),
(143, 1, 'mod_feedback_get_unfinished_responses'),
(144, 1, 'mod_feedback_get_finished_responses'),
(145, 1, 'mod_feedback_get_non_respondents'),
(146, 1, 'mod_feedback_get_responses_analysis'),
(147, 1, 'mod_feedback_get_last_completed'),
(148, 1, 'mod_folder_view_folder'),
(149, 1, 'mod_folder_get_folders_by_courses'),
(150, 1, 'mod_forum_get_forums_by_courses'),
(151, 1, 'mod_forum_get_forum_discussion_posts'),
(152, 1, 'mod_forum_get_forum_discussions_paginated'),
(153, 1, 'mod_forum_view_forum'),
(154, 1, 'mod_forum_view_forum_discussion'),
(155, 1, 'mod_forum_add_discussion_post'),
(156, 1, 'mod_forum_add_discussion'),
(157, 1, 'mod_forum_can_add_discussion'),
(158, 1, 'mod_glossary_get_glossaries_by_courses'),
(159, 1, 'mod_glossary_view_glossary'),
(160, 1, 'mod_glossary_view_entry'),
(161, 1, 'mod_glossary_get_entries_by_letter'),
(162, 1, 'mod_glossary_get_entries_by_date'),
(163, 1, 'mod_glossary_get_categories'),
(164, 1, 'mod_glossary_get_entries_by_category'),
(165, 1, 'mod_glossary_get_authors'),
(166, 1, 'mod_glossary_get_entries_by_author'),
(167, 1, 'mod_glossary_get_entries_by_author_id'),
(168, 1, 'mod_glossary_get_entries_by_search'),
(169, 1, 'mod_glossary_get_entries_by_term'),
(170, 1, 'mod_glossary_get_entries_to_approve'),
(171, 1, 'mod_glossary_get_entry_by_id'),
(172, 1, 'mod_glossary_add_entry'),
(173, 1, 'mod_imscp_view_imscp'),
(174, 1, 'mod_imscp_get_imscps_by_courses'),
(175, 1, 'mod_label_get_labels_by_courses'),
(176, 1, 'mod_lesson_get_lessons_by_courses'),
(177, 1, 'mod_lesson_get_lesson_access_information'),
(178, 1, 'mod_lesson_view_lesson'),
(179, 1, 'mod_lesson_get_questions_attempts'),
(180, 1, 'mod_lesson_get_user_grade'),
(181, 1, 'mod_lesson_get_user_attempt_grade'),
(182, 1, 'mod_lesson_get_content_pages_viewed'),
(183, 1, 'mod_lesson_get_user_timers'),
(184, 1, 'mod_lesson_get_pages'),
(185, 1, 'mod_lesson_launch_attempt'),
(186, 1, 'mod_lesson_get_page_data'),
(187, 1, 'mod_lesson_process_page'),
(188, 1, 'mod_lesson_finish_attempt'),
(189, 1, 'mod_lesson_get_attempts_overview'),
(190, 1, 'mod_lesson_get_user_attempt'),
(191, 1, 'mod_lesson_get_pages_possible_jumps'),
(192, 1, 'mod_lesson_get_lesson'),
(193, 1, 'mod_lti_get_tool_launch_data'),
(194, 1, 'mod_lti_get_ltis_by_courses'),
(195, 1, 'mod_lti_view_lti'),
(196, 1, 'mod_page_view_page'),
(197, 1, 'mod_page_get_pages_by_courses'),
(198, 1, 'mod_quiz_get_quizzes_by_courses'),
(199, 1, 'mod_quiz_view_quiz'),
(200, 1, 'mod_quiz_get_user_attempts'),
(201, 1, 'mod_quiz_get_user_best_grade'),
(202, 1, 'mod_quiz_get_combined_review_options'),
(203, 1, 'mod_quiz_start_attempt'),
(204, 1, 'mod_quiz_get_attempt_data'),
(205, 1, 'mod_quiz_get_attempt_summary'),
(206, 1, 'mod_quiz_save_attempt'),
(207, 1, 'mod_quiz_process_attempt'),
(208, 1, 'mod_quiz_get_attempt_review'),
(209, 1, 'mod_quiz_view_attempt'),
(210, 1, 'mod_quiz_view_attempt_summary'),
(211, 1, 'mod_quiz_view_attempt_review'),
(212, 1, 'mod_quiz_get_quiz_feedback_for_grade'),
(213, 1, 'mod_quiz_get_quiz_access_information'),
(214, 1, 'mod_quiz_get_attempt_access_information'),
(215, 1, 'mod_quiz_get_quiz_required_qtypes'),
(216, 1, 'mod_resource_view_resource'),
(217, 1, 'mod_resource_get_resources_by_courses'),
(218, 1, 'mod_scorm_view_scorm'),
(219, 1, 'mod_scorm_get_scorm_attempt_count'),
(220, 1, 'mod_scorm_get_scorm_scoes'),
(221, 1, 'mod_scorm_get_scorm_user_data'),
(222, 1, 'mod_scorm_insert_scorm_tracks'),
(223, 1, 'mod_scorm_get_scorm_sco_tracks'),
(224, 1, 'mod_scorm_get_scorms_by_courses'),
(225, 1, 'mod_scorm_launch_sco'),
(226, 1, 'mod_survey_get_surveys_by_courses'),
(227, 1, 'mod_survey_view_survey'),
(228, 1, 'mod_survey_get_questions'),
(229, 1, 'mod_survey_submit_answers'),
(230, 1, 'mod_url_view_url'),
(231, 1, 'mod_url_get_urls_by_courses'),
(232, 1, 'mod_wiki_get_wikis_by_courses'),
(233, 1, 'mod_wiki_view_wiki'),
(234, 1, 'mod_wiki_view_page'),
(235, 1, 'mod_wiki_get_subwikis'),
(236, 1, 'mod_wiki_get_subwiki_pages'),
(237, 1, 'mod_wiki_get_subwiki_files'),
(238, 1, 'mod_wiki_get_page_contents'),
(239, 1, 'mod_wiki_get_page_for_editing'),
(240, 1, 'mod_wiki_new_page'),
(241, 1, 'mod_wiki_edit_page'),
(242, 1, 'mod_workshop_get_workshops_by_courses'),
(243, 1, 'mod_workshop_get_workshop_access_information'),
(244, 1, 'mod_workshop_get_user_plan'),
(245, 1, 'mod_workshop_view_workshop'),
(246, 1, 'enrol_guest_get_instance_info'),
(247, 1, 'enrol_self_get_instance_info'),
(248, 1, 'enrol_self_enrol_user'),
(249, 1, 'message_airnotifier_is_system_configured'),
(250, 1, 'message_airnotifier_are_notification_preferences_configured'),
(251, 1, 'message_airnotifier_get_user_devices'),
(252, 1, 'message_airnotifier_enable_device'),
(253, 1, 'message_popup_get_popup_notifications'),
(254, 1, 'message_popup_get_unread_popup_notification_count'),
(255, 1, 'gradereport_overview_get_course_grades'),
(256, 1, 'gradereport_overview_view_grade_report'),
(257, 1, 'gradereport_user_get_grades_table'),
(258, 1, 'gradereport_user_view_grade_report'),
(259, 1, 'gradereport_user_get_grade_items'),
(260, 1, 'tool_lp_data_for_course_competencies_page'),
(261, 1, 'tool_lp_data_for_plans_page'),
(262, 1, 'tool_lp_data_for_plan_page'),
(263, 1, 'tool_lp_data_for_user_evidence_list_page'),
(264, 1, 'tool_lp_data_for_user_evidence_page'),
(265, 1, 'tool_lp_data_for_user_competency_summary'),
(266, 1, 'tool_lp_data_for_user_competency_summary_in_plan'),
(267, 1, 'tool_lp_data_for_user_competency_summary_in_course'),
(268, 1, 'tool_mobile_get_plugins_supporting_mobile'),
(269, 1, 'tool_mobile_get_public_config'),
(270, 1, 'tool_mobile_get_config'),
(271, 1, 'tool_mobile_get_autologin_key');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

DROP TABLE IF EXISTS `mdl_external_services_users`;
CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag';

--
-- Truncate table before insert `mdl_external_services_users`
--

TRUNCATE TABLE `mdl_external_services_users`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

DROP TABLE IF EXISTS `mdl_external_tokens`;
CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL DEFAULT '',
  `privatetoken` varchar(64) DEFAULT NULL,
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services';

--
-- Truncate table before insert `mdl_external_tokens`
--

TRUNCATE TABLE `mdl_external_tokens`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

DROP TABLE IF EXISTS `mdl_feedback`;
CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` longtext NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks';

--
-- Truncate table before insert `mdl_feedback`
--

TRUNCATE TABLE `mdl_feedback`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

DROP TABLE IF EXISTS `mdl_feedback_completed`;
CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback';

--
-- Truncate table before insert `mdl_feedback_completed`
--

TRUNCATE TABLE `mdl_feedback_completed`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

DROP TABLE IF EXISTS `mdl_feedback_completedtmp`;
CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback';

--
-- Truncate table before insert `mdl_feedback_completedtmp`
--

TRUNCATE TABLE `mdl_feedback_completedtmp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

DROP TABLE IF EXISTS `mdl_feedback_item`;
CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items';

--
-- Truncate table before insert `mdl_feedback_item`
--

TRUNCATE TABLE `mdl_feedback_item`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

DROP TABLE IF EXISTS `mdl_feedback_sitecourse_map`;
CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map';

--
-- Truncate table before insert `mdl_feedback_sitecourse_map`
--

TRUNCATE TABLE `mdl_feedback_sitecourse_map`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

DROP TABLE IF EXISTS `mdl_feedback_template`;
CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures';

--
-- Truncate table before insert `mdl_feedback_template`
--

TRUNCATE TABLE `mdl_feedback_template`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

DROP TABLE IF EXISTS `mdl_feedback_value`;
CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_feedvalu_comitecou_uix` (`completed`,`item`,`course_id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds';

--
-- Truncate table before insert `mdl_feedback_value`
--

TRUNCATE TABLE `mdl_feedback_value`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

DROP TABLE IF EXISTS `mdl_feedback_valuetmp`;
CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_feedvalu_comitecou2_uix` (`completed`,`item`,`course_id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp';

--
-- Truncate table before insert `mdl_feedback_valuetmp`
--

TRUNCATE TABLE `mdl_feedback_valuetmp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_file_conversion`
--

DROP TABLE IF EXISTS `mdl_file_conversion`;
CREATE TABLE IF NOT EXISTS `mdl_file_conversion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `usermodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sourcefileid` bigint(10) NOT NULL,
  `targetformat` varchar(100) NOT NULL DEFAULT '',
  `status` bigint(10) DEFAULT '0',
  `statusmessage` longtext,
  `converter` varchar(255) DEFAULT NULL,
  `destfileid` bigint(10) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_fileconv_sou_ix` (`sourcefileid`),
  KEY `mdl_fileconv_des_ix` (`destfileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to track file conversions.';

--
-- Truncate table before insert `mdl_file_conversion`
--

TRUNCATE TABLE `mdl_file_conversion`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

DROP TABLE IF EXISTS `mdl_files`;
CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool';

--
-- Truncate table before insert `mdl_files`
--

TRUNCATE TABLE `mdl_files`;
--
-- Dumping data for table `mdl_files`
--

INSERT DELAYED IGNORE INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`) VALUES
(1, '41cfeee5884a43a4650a851f4f85e7b28316fcc9', 'a48e186a2cc853a9e94e9305f4e9bc086391212d', 1, 'theme_more', 'backgroundimage', 0, '/', 'background.jpg', 2, 4451, 'image/jpeg', 0, NULL, NULL, NULL, 1502329074, 1502329074, 0, NULL),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'd1da7ab1bb9c08a926037367bf8ce9a838034ead', 1, 'theme_more', 'backgroundimage', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1502329075, 1502329075, 0, NULL),
(3, '5f8e911d0da441e36f47c5c46f4393269211ca56', '508e674d49c30d4fde325fe6c7f6fd3d56b247e1', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'smile.png', 2, 1085, 'image/png', 0, NULL, NULL, NULL, 1502329080, 1502329080, 0, NULL),
(4, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1502329080, 1502329080, 0, NULL),
(5, '75c101cb8cb34ea573cd25ac38f8157b1de901b8', '68317eab56c67d32aeaee5acf509a0c4aa828b6b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'sad.png', 2, 966, 'image/png', 0, NULL, NULL, NULL, 1502329080, 1502329080, 0, NULL),
(6, '0c5190a24c3943966541401c883eacaa20ca20cb', '695a55ff780e61c9e59428aa425430b0d6bde53b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'tick.png', 2, 1039, 'image/png', 0, NULL, NULL, NULL, 1502329081, 1502329081, 0, NULL),
(7, '8c96a486d5801e0f4ab8c411f561f1c687e1f865', '373e63af262a9b8466ba8632551520be793c37ff', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'cross.png', 2, 861, 'image/png', 0, NULL, NULL, NULL, 1502329081, 1502329081, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files_reference`
--

DROP TABLE IF EXISTS `mdl_files_reference`;
CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext,
  `referencehash` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_refrep_uix` (`referencehash`,`repositoryid`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store files references';

--
-- Truncate table before insert `mdl_files_reference`
--

TRUNCATE TABLE `mdl_files_reference`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

DROP TABLE IF EXISTS `mdl_filter_active`;
CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c';

--
-- Truncate table before insert `mdl_filter_active`
--

TRUNCATE TABLE `mdl_filter_active`;
--
-- Dumping data for table `mdl_filter_active`
--

INSERT DELAYED IGNORE INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 2),
(2, 'mathjaxloader', 1, 1, 1),
(3, 'mediaplugin', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

DROP TABLE IF EXISTS `mdl_filter_config`;
CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ';

--
-- Truncate table before insert `mdl_filter_config`
--

TRUNCATE TABLE `mdl_filter_config`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

DROP TABLE IF EXISTS `mdl_folder`;
CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  `showdownloadfolder` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource';

--
-- Truncate table before insert `mdl_folder`
--

TRUNCATE TABLE `mdl_folder`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

DROP TABLE IF EXISTS `mdl_forum`;
CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  `lockdiscussionafter` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion';

--
-- Truncate table before insert `mdl_forum`
--

TRUNCATE TABLE `mdl_forum`;
--
-- Dumping data for table `mdl_forum`
--

INSERT DELAYED IGNORE INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`, `displaywordcount`, `lockdiscussionafter`) VALUES
(1, 1, 'news', 'Site announcements', 'General news and announcements', 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1502334640, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_digests`
--

DROP TABLE IF EXISTS `mdl_forum_digests`;
CREATE TABLE IF NOT EXISTS `mdl_forum_digests` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of user mail delivery preferences for each forum';

--
-- Truncate table before insert `mdl_forum_digests`
--

TRUNCATE TABLE `mdl_forum_digests`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussion_subs`
--

DROP TABLE IF EXISTS `mdl_forum_discussion_subs`;
CREATE TABLE IF NOT EXISTS `mdl_forum_discussion_subs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `forum` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `discussion` bigint(10) NOT NULL,
  `preference` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudiscsubs_usedis_uix` (`userid`,`discussion`),
  KEY `mdl_forudiscsubs_for_ix` (`forum`),
  KEY `mdl_forudiscsubs_use_ix` (`userid`),
  KEY `mdl_forudiscsubs_dis_ix` (`discussion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users may choose to subscribe and unsubscribe from specific ';

--
-- Truncate table before insert `mdl_forum_discussion_subs`
--

TRUNCATE TABLE `mdl_forum_discussion_subs`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

DROP TABLE IF EXISTS `mdl_forum_discussions`;
CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_cou_ix` (`course`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions';

--
-- Truncate table before insert `mdl_forum_discussions`
--

TRUNCATE TABLE `mdl_forum_discussions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

DROP TABLE IF EXISTS `mdl_forum_posts`;
CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table';

--
-- Truncate table before insert `mdl_forum_posts`
--

TRUNCATE TABLE `mdl_forum_posts`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

DROP TABLE IF EXISTS `mdl_forum_queue`;
CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for';

--
-- Truncate table before insert `mdl_forum_queue`
--

TRUNCATE TABLE `mdl_forum_queue`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

DROP TABLE IF EXISTS `mdl_forum_read`;
CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_posuse_ix` (`postid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts';

--
-- Truncate table before insert `mdl_forum_read`
--

TRUNCATE TABLE `mdl_forum_read`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

DROP TABLE IF EXISTS `mdl_forum_subscriptions`;
CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum';

--
-- Truncate table before insert `mdl_forum_subscriptions`
--

TRUNCATE TABLE `mdl_forum_subscriptions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

DROP TABLE IF EXISTS `mdl_forum_track_prefs`;
CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums';

--
-- Truncate table before insert `mdl_forum_track_prefs`
--

TRUNCATE TABLE `mdl_forum_track_prefs`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

DROP TABLE IF EXISTS `mdl_glossary`;
CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries';

--
-- Truncate table before insert `mdl_glossary`
--

TRUNCATE TABLE `mdl_glossary`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

DROP TABLE IF EXISTS `mdl_glossary_alias`;
CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias';

--
-- Truncate table before insert `mdl_glossary_alias`
--

TRUNCATE TABLE `mdl_glossary_alias`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_categories`;
CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries';

--
-- Truncate table before insert `mdl_glossary_categories`
--

TRUNCATE TABLE `mdl_glossary_categories`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

DROP TABLE IF EXISTS `mdl_glossary_entries`;
CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` longtext NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries';

--
-- Truncate table before insert `mdl_glossary_entries`
--

TRUNCATE TABLE `mdl_glossary_entries`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

DROP TABLE IF EXISTS `mdl_glossary_entries_categories`;
CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry';

--
-- Truncate table before insert `mdl_glossary_entries_categories`
--

TRUNCATE TABLE `mdl_glossary_entries_categories`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

DROP TABLE IF EXISTS `mdl_glossary_formats`;
CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `showtabs` varchar(100) DEFAULT NULL,
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats';

--
-- Truncate table before insert `mdl_glossary_formats`
--

TRUNCATE TABLE `mdl_glossary_formats`;
--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT DELAYED IGNORE INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `showtabs`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, 'standard,category,date', '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, 'standard', '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, 'standard,category,date,author', '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, 'standard,category,date,author', '', '', '', ''),
(5, 'faq', 'faq', 1, 1, 'standard,category,date,author', '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, 'standard,category,date,author', '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, 'standard,category,date', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

DROP TABLE IF EXISTS `mdl_grade_categories`;
CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou';

--
-- Truncate table before insert `mdl_grade_categories`
--

TRUNCATE TABLE `mdl_grade_categories`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

DROP TABLE IF EXISTS `mdl_grade_categories_history`;
CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History of grade_categories';

--
-- Truncate table before insert `mdl_grade_categories_history`
--

TRUNCATE TABLE `mdl_grade_categories_history`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

DROP TABLE IF EXISTS `mdl_grade_grades`;
CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `aggregationstatus` varchar(10) NOT NULL DEFAULT 'unknown',
  `aggregationweight` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us';

--
-- Truncate table before insert `mdl_grade_grades`
--

TRUNCATE TABLE `mdl_grade_grades`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

DROP TABLE IF EXISTS `mdl_grade_grades_history`;
CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_useitetim_ix` (`userid`,`itemid`,`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';

--
-- Truncate table before insert `mdl_grade_grades_history`
--

TRUNCATE TABLE `mdl_grade_grades_history`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

DROP TABLE IF EXISTS `mdl_grade_import_newitem`;
CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ';

--
-- Truncate table before insert `mdl_grade_import_newitem`
--

TRUNCATE TABLE `mdl_grade_import_newitem`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

DROP TABLE IF EXISTS `mdl_grade_import_values`;
CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  `importonlyfeedback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades';

--
-- Truncate table before insert `mdl_grade_import_values`
--

TRUNCATE TABLE `mdl_grade_import_values`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

DROP TABLE IF EXISTS `mdl_grade_items`;
CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum';

--
-- Truncate table before insert `mdl_grade_items`
--

TRUNCATE TABLE `mdl_grade_items`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

DROP TABLE IF EXISTS `mdl_grade_items_history`;
CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef2` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `weightoverride` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History of grade_items';

--
-- Truncate table before insert `mdl_grade_items_history`
--

TRUNCATE TABLE `mdl_grade_items_history`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

DROP TABLE IF EXISTS `mdl_grade_letters`;
CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e';

--
-- Truncate table before insert `mdl_grade_letters`
--

TRUNCATE TABLE `mdl_grade_letters`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes`;
CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out';

--
-- Truncate table before insert `mdl_grade_outcomes`
--

TRUNCATE TABLE `mdl_grade_outcomes`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_courses`;
CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.';

--
-- Truncate table before insert `mdl_grade_outcomes_courses`
--

TRUNCATE TABLE `mdl_grade_outcomes_courses`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

DROP TABLE IF EXISTS `mdl_grade_outcomes_history`;
CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';

--
-- Truncate table before insert `mdl_grade_outcomes_history`
--

TRUNCATE TABLE `mdl_grade_outcomes_history`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

DROP TABLE IF EXISTS `mdl_grade_settings`;
CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings';

--
-- Truncate table before insert `mdl_grade_settings`
--

TRUNCATE TABLE `mdl_grade_settings`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

DROP TABLE IF EXISTS `mdl_grading_areas`;
CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies gradable areas where advanced grading can happen.';

--
-- Truncate table before insert `mdl_grading_areas`
--

TRUNCATE TABLE `mdl_grading_areas`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

DROP TABLE IF EXISTS `mdl_grading_definitions`;
CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the basic information about an advanced grading for';

--
-- Truncate table before insert `mdl_grading_definitions`
--

TRUNCATE TABLE `mdl_grading_definitions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

DROP TABLE IF EXISTS `mdl_grading_instances`;
CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading form instance is an assessment record for one gradab';

--
-- Truncate table before insert `mdl_grading_instances`
--

TRUNCATE TABLE `mdl_grading_instances`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_comments`;
CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='frequently used comments used in marking guide';

--
-- Truncate table before insert `mdl_gradingform_guide_comments`
--

TRUNCATE TABLE `mdl_gradingform_guide_comments`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_criteria`;
CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the criteria grid.';

--
-- Truncate table before insert `mdl_gradingform_guide_criteria`
--

TRUNCATE TABLE `mdl_gradingform_guide_criteria`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_guide_fillings`;
CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the guide is filled by a particular r';

--
-- Truncate table before insert `mdl_gradingform_guide_fillings`
--

TRUNCATE TABLE `mdl_gradingform_guide_fillings`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_criteria`;
CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the rubric grid.';

--
-- Truncate table before insert `mdl_gradingform_rubric_criteria`
--

TRUNCATE TABLE `mdl_gradingform_rubric_criteria`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_fillings`;
CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the rubric is filled by a particular ';

--
-- Truncate table before insert `mdl_gradingform_rubric_fillings`
--

TRUNCATE TABLE `mdl_gradingform_rubric_fillings`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_gradingform_rubric_levels`;
CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the columns of the rubric grid.';

--
-- Truncate table before insert `mdl_gradingform_rubric_levels`
--

TRUNCATE TABLE `mdl_gradingform_rubric_levels`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

DROP TABLE IF EXISTS `mdl_groupings`;
CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings';

--
-- Truncate table before insert `mdl_groupings`
--

TRUNCATE TABLE `mdl_groupings`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

DROP TABLE IF EXISTS `mdl_groupings_groups`;
CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ';

--
-- Truncate table before insert `mdl_groupings_groups`
--

TRUNCATE TABLE `mdl_groupings_groups`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

DROP TABLE IF EXISTS `mdl_groups`;
CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.';

--
-- Truncate table before insert `mdl_groups`
--

TRUNCATE TABLE `mdl_groups`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

DROP TABLE IF EXISTS `mdl_groups_members`;
CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.';

--
-- Truncate table before insert `mdl_groups_members`
--

TRUNCATE TABLE `mdl_groups_members`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

DROP TABLE IF EXISTS `mdl_imscp`;
CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource';

--
-- Truncate table before insert `mdl_imscp`
--

TRUNCATE TABLE `mdl_imscp`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

DROP TABLE IF EXISTS `mdl_label`;
CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels';

--
-- Truncate table before insert `mdl_label`
--

TRUNCATE TABLE `mdl_label`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

DROP TABLE IF EXISTS `mdl_lesson`;
CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext NOT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionendreached` tinyint(1) DEFAULT '0',
  `completiontimespent` bigint(11) DEFAULT '0',
  `allowofflineattempts` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson';

--
-- Truncate table before insert `mdl_lesson`
--

TRUNCATE TABLE `mdl_lesson`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

DROP TABLE IF EXISTS `mdl_lesson_answers`;
CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers';

--
-- Truncate table before insert `mdl_lesson_answers`
--

TRUNCATE TABLE `mdl_lesson_answers`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

DROP TABLE IF EXISTS `mdl_lesson_attempts`;
CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts';

--
-- Truncate table before insert `mdl_lesson_attempts`
--

TRUNCATE TABLE `mdl_lesson_attempts`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

DROP TABLE IF EXISTS `mdl_lesson_branch`;
CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user';

--
-- Truncate table before insert `mdl_lesson_branch`
--

TRUNCATE TABLE `mdl_lesson_branch`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

DROP TABLE IF EXISTS `mdl_lesson_grades`;
CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades';

--
-- Truncate table before insert `mdl_lesson_grades`
--

TRUNCATE TABLE `mdl_lesson_grades`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_overrides`
--

DROP TABLE IF EXISTS `mdl_lesson_overrides`;
CREATE TABLE IF NOT EXISTS `mdl_lesson_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `available` bigint(10) DEFAULT NULL,
  `deadline` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `review` smallint(3) DEFAULT NULL,
  `maxattempts` smallint(3) DEFAULT NULL,
  `retake` smallint(3) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_lessover_les_ix` (`lessonid`),
  KEY `mdl_lessover_gro_ix` (`groupid`),
  KEY `mdl_lessover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to lesson settings.';

--
-- Truncate table before insert `mdl_lesson_overrides`
--

TRUNCATE TABLE `mdl_lesson_overrides`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

DROP TABLE IF EXISTS `mdl_lesson_pages`;
CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` longtext NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages';

--
-- Truncate table before insert `mdl_lesson_pages`
--

TRUNCATE TABLE `mdl_lesson_pages`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

DROP TABLE IF EXISTS `mdl_lesson_timer`;
CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `timemodifiedoffline` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson';

--
-- Truncate table before insert `mdl_lesson_timer`
--

TRUNCATE TABLE `mdl_lesson_timer`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

DROP TABLE IF EXISTS `mdl_license`;
CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` longtext,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle';

--
-- Truncate table before insert `mdl_license`
--

TRUNCATE TABLE `mdl_license`;
--
-- Dumping data for table `mdl_license`
--

INSERT DELAYED IGNORE INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lock_db`
--

DROP TABLE IF EXISTS `mdl_lock_db`;
CREATE TABLE IF NOT EXISTS `mdl_lock_db` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `resourcekey` varchar(255) NOT NULL DEFAULT '',
  `expires` bigint(10) DEFAULT NULL,
  `owner` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_lockdb_res_uix` (`resourcekey`),
  KEY `mdl_lockdb_exp_ix` (`expires`),
  KEY `mdl_lockdb_own_ix` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores active and inactive lock types for db locking method.';

--
-- Truncate table before insert `mdl_lock_db`
--

TRUNCATE TABLE `mdl_lock_db`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

DROP TABLE IF EXISTS `mdl_log`;
CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible';

--
-- Truncate table before insert `mdl_log`
--

TRUNCATE TABLE `mdl_log`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

DROP TABLE IF EXISTS `mdl_log_display`;
CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie';

--
-- Truncate table before insert `mdl_log_display`
--

TRUNCATE TABLE `mdl_log_display`;
--
-- Dumping data for table `mdl_log_display`
--

INSERT DELAYED IGNORE INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, \' \', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'set marking workflow state', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(45, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(46, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(51, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(52, 'assign', 'view batch set marking workflow state', 'assign', 'name', 'mod_assign'),
(53, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(56, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(57, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(58, 'book', 'add', 'book', 'name', 'mod_book'),
(59, 'book', 'update', 'book', 'name', 'mod_book'),
(60, 'book', 'view', 'book', 'name', 'mod_book'),
(61, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(63, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(64, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(67, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(68, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(69, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(73, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(74, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(75, 'data', 'view', 'data', 'name', 'mod_data'),
(76, 'data', 'add', 'data', 'name', 'mod_data'),
(77, 'data', 'update', 'data', 'name', 'mod_data'),
(78, 'data', 'record delete', 'data', 'name', 'mod_data'),
(79, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(80, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(81, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(82, 'data', 'templates def', 'data', 'name', 'mod_data'),
(83, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(86, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(87, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(88, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(90, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(91, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(92, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(93, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(94, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(95, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(96, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(97, 'forum', 'user report', 'user', 'CONCAT(firstname, \' \', lastname)', 'mod_forum'),
(98, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(101, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(102, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(103, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(104, 'forum', 'pin discussion', 'forum_discussions', 'name', 'mod_forum'),
(105, 'forum', 'unpin discussion', 'forum_discussions', 'name', 'mod_forum'),
(106, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(113, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(114, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(115, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(116, 'glossary', 'disapprove entry', 'glossary', 'name', 'mod_glossary'),
(117, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(118, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(119, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(120, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(121, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(122, 'label', 'add', 'label', 'name', 'mod_label'),
(123, 'label', 'update', 'label', 'name', 'mod_label'),
(124, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(125, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(126, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(127, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(128, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(129, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(130, 'page', 'view', 'page', 'name', 'mod_page'),
(131, 'page', 'view all', 'page', 'name', 'mod_page'),
(132, 'page', 'update', 'page', 'name', 'mod_page'),
(133, 'page', 'add', 'page', 'name', 'mod_page'),
(134, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(143, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(144, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(145, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(146, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(147, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(148, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
(149, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(150, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(151, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(152, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(153, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(154, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(155, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(156, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(157, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(158, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(159, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(160, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(161, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(162, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(163, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(164, 'url', 'view', 'url', 'name', 'mod_url'),
(165, 'url', 'view all', 'url', 'name', 'mod_url'),
(166, 'url', 'update', 'url', 'name', 'mod_url'),
(167, 'url', 'add', 'url', 'name', 'mod_url'),
(168, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(169, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(170, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(171, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(172, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(179, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(180, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(181, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(182, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(183, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(184, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(185, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(186, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(187, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(188, 'book', 'print', 'book', 'name', 'booktool_print'),
(189, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

DROP TABLE IF EXISTS `mdl_log_queries`;
CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext,
  `backtrace` longtext,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.';

--
-- Truncate table before insert `mdl_log_queries`
--

TRUNCATE TABLE `mdl_log_queries`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_logstore_standard_log`
--

DROP TABLE IF EXISTS `mdl_logstore_standard_log`;
CREATE TABLE IF NOT EXISTS `mdl_logstore_standard_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(255) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  `action` varchar(100) NOT NULL DEFAULT '',
  `target` varchar(100) NOT NULL DEFAULT '',
  `objecttable` varchar(50) DEFAULT NULL,
  `objectid` bigint(10) DEFAULT NULL,
  `crud` varchar(1) NOT NULL DEFAULT '',
  `edulevel` tinyint(1) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `relateduserid` bigint(10) DEFAULT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `other` longtext,
  `timecreated` bigint(10) NOT NULL,
  `origin` varchar(10) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `realuserid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_logsstanlog_tim_ix` (`timecreated`),
  KEY `mdl_logsstanlog_couanotim_ix` (`courseid`,`anonymous`,`timecreated`),
  KEY `mdl_logsstanlog_useconconcr_ix` (`userid`,`contextlevel`,`contextinstanceid`,`crud`,`edulevel`,`timecreated`),
  KEY `mdl_logsstanlog_con_ix` (`contextid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='Standard log table';

--
-- Truncate table before insert `mdl_logstore_standard_log`
--

TRUNCATE TABLE `mdl_logstore_standard_log`;
--
-- Dumping data for table `mdl_logstore_standard_log`
--

INSERT DELAYED IGNORE INTO `mdl_logstore_standard_log` (`id`, `eventname`, `component`, `action`, `target`, `objecttable`, `objectid`, `crud`, `edulevel`, `contextid`, `contextlevel`, `contextinstanceid`, `userid`, `courseid`, `relateduserid`, `anonymous`, `other`, `timecreated`, `origin`, `ip`, `realuserid`) VALUES
(1, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:5:"admin";}', 1502329159, 'web', '0:0:0:0:0:0:0:1', NULL),
(2, '\\core\\event\\user_password_updated', 'core', 'updated', 'user_password', NULL, NULL, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'a:1:{s:14:"forgottenreset";b:0;}', 1502329895, 'web', '0:0:0:0:0:0:0:1', NULL),
(3, '\\core\\event\\user_updated', 'core', 'updated', 'user', 'user', 2, 'u', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502329895, 'web', '0:0:0:0:0:0:0:1', NULL),
(4, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502330312, 'web', '0:0:0:0:0:0:0:1', NULL),
(5, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1502330333, 'web', '0:0:0:0:0:0:0:1', NULL),
(6, '\\tool_usertours\\event\\tour_started', 'tool_usertours', 'started', 'tour', 'tool_usertours_tours', 1, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'a:1:{s:7:"pageurl";s:35:"http://localhost/moodle/?redirect=0";}', 1502330340, 'web', '0:0:0:0:0:0:0:1', NULL),
(7, '\\tool_usertours\\event\\step_shown', 'tool_usertours', 'shown', 'step', 'tool_usertours_steps', 1, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'a:3:{s:7:"pageurl";s:35:"http://localhost/moodle/?redirect=0";s:6:"tourid";i:1;s:9:"stepindex";i:0;}', 1502330343, 'web', '0:0:0:0:0:0:0:1', NULL),
(8, '\\tool_usertours\\event\\tour_ended', 'tool_usertours', 'ended', 'tour', 'tool_usertours_tours', 1, 'c', 2, 2, 50, 1, 2, 1, NULL, 0, 'a:3:{s:7:"pageurl";s:35:"http://localhost/moodle/?redirect=0";s:6:"stepid";i:1;s:9:"stepindex";i:0;}', 1502330345, 'web', '0:0:0:0:0:0:0:1', NULL),
(9, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502330355, 'web', '0:0:0:0:0:0:0:1', NULL),
(10, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502330370, 'web', '0:0:0:0:0:0:0:1', NULL),
(11, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502330391, 'web', '0:0:0:0:0:0:0:1', NULL),
(12, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1502331646, 'web', '0:0:0:0:0:0:0:1', NULL),
(13, '\\core\\event\\course_section_created', 'core', 'created', 'course_section', 'course_sections', 1, 'c', 1, 2, 50, 1, 2, 1, NULL, 0, 'a:1:{s:10:"sectionnum";i:1;}', 1502331649, 'web', '0:0:0:0:0:0:0:1', NULL),
(14, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502331871, 'web', '0:0:0:0:0:0:0:1', NULL),
(15, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502331895, 'web', '0:0:0:0:0:0:0:1', NULL),
(16, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502331907, 'web', '0:0:0:0:0:0:0:1', NULL),
(17, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502334259, 'web', '0:0:0:0:0:0:0:1', NULL),
(18, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1502334349, 'web', '0:0:0:0:0:0:0:1', NULL),
(19, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502334625, 'web', '0:0:0:0:0:0:0:1', NULL),
(20, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 2, 1, NULL, 0, 'N;', 1502334636, 'web', '0:0:0:0:0:0:0:1', NULL),
(21, '\\core\\event\\course_section_created', 'core', 'created', 'course_section', 'course_sections', 2, 'c', 1, 2, 50, 1, 2, 1, NULL, 0, 'a:1:{s:10:"sectionnum";i:0;}', 1502334640, 'web', '0:0:0:0:0:0:0:1', NULL),
(22, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502335594, 'web', '0:0:0:0:0:0:0:1', NULL),
(23, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1502408038, 'web', '0:0:0:0:0:0:0:1', NULL),
(24, '\\core\\event\\course_viewed', 'core', 'viewed', 'course', NULL, NULL, 'r', 2, 2, 50, 1, 0, 1, NULL, 0, 'N;', 1502408071, 'web', '0:0:0:0:0:0:0:1', NULL),
(25, '\\core\\event\\user_login_failed', 'core', 'failed', 'user_login', NULL, NULL, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:2:{s:8:"username";s:9:"tutors246";s:6:"reason";i:3;}', 1502408103, 'web', '0:0:0:0:0:0:0:1', NULL),
(26, '\\core\\event\\user_loggedin', 'core', 'loggedin', 'user', 'user', 2, 'r', 0, 1, 10, 0, 2, 0, NULL, 0, 'a:1:{s:8:"username";s:9:"tutors246";}', 1502408124, 'web', '0:0:0:0:0:0:0:1', NULL),
(27, '\\core\\event\\dashboard_viewed', 'core', 'viewed', 'dashboard', NULL, NULL, 'r', 0, 5, 30, 2, 2, 0, 2, 0, 'N;', 1502408143, 'web', '0:0:0:0:0:0:0:1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

DROP TABLE IF EXISTS `mdl_lti`;
CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext NOT NULL,
  `securetoolurl` longtext,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` bigint(10) NOT NULL DEFAULT '100',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` longtext,
  `secureicon` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains Basic LTI activities instances' ROW_FORMAT=COMPRESSED;

--
-- Truncate table before insert `mdl_lti`
--

TRUNCATE TABLE `mdl_lti`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

DROP TABLE IF EXISTS `mdl_lti_submission`;
CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of individual submissions for LTI activities.';

--
-- Truncate table before insert `mdl_lti_submission`
--

TRUNCATE TABLE `mdl_lti_submission`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_tool_proxies`
--

DROP TABLE IF EXISTS `mdl_lti_tool_proxies`;
CREATE TABLE IF NOT EXISTS `mdl_lti_tool_proxies` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'Tool Provider',
  `regurl` longtext,
  `state` tinyint(2) NOT NULL DEFAULT '1',
  `guid` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `vendorcode` varchar(255) DEFAULT NULL,
  `capabilityoffered` longtext NOT NULL,
  `serviceoffered` longtext NOT NULL,
  `toolproxy` longtext,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_ltitoolprox_gui_uix` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LTI tool proxy registrations';

--
-- Truncate table before insert `mdl_lti_tool_proxies`
--

TRUNCATE TABLE `mdl_lti_tool_proxies`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_tool_settings`
--

DROP TABLE IF EXISTS `mdl_lti_tool_settings`;
CREATE TABLE IF NOT EXISTS `mdl_lti_tool_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `toolproxyid` bigint(10) NOT NULL,
  `course` bigint(10) DEFAULT NULL,
  `coursemoduleid` bigint(10) DEFAULT NULL,
  `settings` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitoolsett_too_ix` (`toolproxyid`),
  KEY `mdl_ltitoolsett_cou_ix` (`course`),
  KEY `mdl_ltitoolsett_cou2_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LTI tool setting values';

--
-- Truncate table before insert `mdl_lti_tool_settings`
--

TRUNCATE TABLE `mdl_lti_tool_settings`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

DROP TABLE IF EXISTS `mdl_lti_types`;
CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `toolproxyid` bigint(10) DEFAULT NULL,
  `enabledcapability` longtext,
  `parameter` longtext,
  `icon` longtext,
  `secureicon` longtext,
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI pre-configured activities';

--
-- Truncate table before insert `mdl_lti_types`
--

TRUNCATE TABLE `mdl_lti_types`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

DROP TABLE IF EXISTS `mdl_lti_types_config`;
CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI types configuration';

--
-- Truncate table before insert `mdl_lti_types_config`
--

TRUNCATE TABLE `mdl_lti_types_config`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

DROP TABLE IF EXISTS `mdl_message`;
CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) DEFAULT NULL,
  `eventtype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mess_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  KEY `mdl_mess_usetimnot_ix` (`useridfrom`,`timeuserfromdeleted`,`notification`),
  KEY `mdl_mess_usetimnot2_ix` (`useridto`,`timeusertodeleted`,`notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages';

--
-- Truncate table before insert `mdl_message`
--

TRUNCATE TABLE `mdl_message`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_airnotifier_devices`
--

DROP TABLE IF EXISTS `mdl_message_airnotifier_devices`;
CREATE TABLE IF NOT EXISTS `mdl_message_airnotifier_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userdeviceid` bigint(10) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messairndevi_use_uix` (`userdeviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store information about the devices registered in Airnotifie';

--
-- Truncate table before insert `mdl_message_airnotifier_devices`
--

TRUNCATE TABLE `mdl_message_airnotifier_devices`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

DROP TABLE IF EXISTS `mdl_message_contacts`;
CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users';

--
-- Truncate table before insert `mdl_message_contacts`
--

TRUNCATE TABLE `mdl_message_contacts`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_popup`
--

DROP TABLE IF EXISTS `mdl_message_popup`;
CREATE TABLE IF NOT EXISTS `mdl_message_popup` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `messageid` bigint(10) NOT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messpopu_mesisr_uix` (`messageid`,`isread`),
  KEY `mdl_messpopu_isr_ix` (`isread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keep state of notifications for the popup message processor';

--
-- Truncate table before insert `mdl_message_popup`
--

TRUNCATE TABLE `mdl_message_popup`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

DROP TABLE IF EXISTS `mdl_message_processors`;
CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='List of message output plugins';

--
-- Truncate table before insert `mdl_message_processors`
--

TRUNCATE TABLE `mdl_message_processors`;
--
-- Dumping data for table `mdl_message_processors`
--

INSERT DELAYED IGNORE INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'airnotifier', 0),
(2, 'email', 1),
(3, 'jabber', 1),
(4, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

DROP TABLE IF EXISTS `mdl_message_providers`;
CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy';

--
-- Truncate table before insert `mdl_message_providers`
--

TRUNCATE TABLE `mdl_message_providers`;
--
-- Dumping data for table `mdl_message_providers`
--

INSERT DELAYED IGNORE INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'badgerecipientnotice', 'moodle', 'moodle/badges:earnbadge'),
(10, 'badgecreatornotice', 'moodle', NULL),
(11, 'competencyplancomment', 'moodle', NULL),
(12, 'competencyusercompcomment', 'moodle', NULL),
(13, 'insights', 'moodle', 'moodle/analytics:listinsights'),
(14, 'assign_notification', 'mod_assign', NULL),
(15, 'assignment_updates', 'mod_assignment', NULL),
(16, 'submission', 'mod_feedback', NULL),
(17, 'message', 'mod_feedback', NULL),
(18, 'posts', 'mod_forum', NULL),
(19, 'digests', 'mod_forum', NULL),
(20, 'graded_essay', 'mod_lesson', NULL),
(21, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(22, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(23, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(24, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(25, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(26, 'expiry_notification', 'enrol_manual', NULL),
(27, 'paypal_enrolment', 'enrol_paypal', NULL),
(28, 'expiry_notification', 'enrol_self', NULL),
(29, 'invalidrecipienthandler', 'tool_messageinbound', NULL),
(30, 'messageprocessingerror', 'tool_messageinbound', NULL),
(31, 'messageprocessingsuccess', 'tool_messageinbound', NULL),
(32, 'notification', 'tool_monitor', 'tool/monitor:subscribe');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

DROP TABLE IF EXISTS `mdl_message_read`;
CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  `timeuserfromdeleted` bigint(10) NOT NULL DEFAULT '0',
  `timeusertodeleted` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) DEFAULT NULL,
  `eventtype` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messread_useusetimtim_ix` (`useridfrom`,`useridto`,`timeuserfromdeleted`,`timeusertodeleted`),
  KEY `mdl_messread_nottim_ix` (`notification`,`timeread`),
  KEY `mdl_messread_usetimnot_ix` (`useridfrom`,`timeuserfromdeleted`,`notification`),
  KEY `mdl_messread_usetimnot2_ix` (`useridto`,`timeusertodeleted`,`notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read';

--
-- Truncate table before insert `mdl_message_read`
--

TRUNCATE TABLE `mdl_message_read`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

DROP TABLE IF EXISTS `mdl_message_working`;
CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces';

--
-- Truncate table before insert `mdl_message_working`
--

TRUNCATE TABLE `mdl_message_working`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_datakeys`
--

DROP TABLE IF EXISTS `mdl_messageinbound_datakeys`;
CREATE TABLE IF NOT EXISTS `mdl_messageinbound_datakeys` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `handler` bigint(10) NOT NULL,
  `datavalue` bigint(10) NOT NULL,
  `datakey` varchar(64) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `expires` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messdata_handat_uix` (`handler`,`datavalue`),
  KEY `mdl_messdata_han_ix` (`handler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Inbound Message data item secret keys.';

--
-- Truncate table before insert `mdl_messageinbound_datakeys`
--

TRUNCATE TABLE `mdl_messageinbound_datakeys`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_handlers`
--

DROP TABLE IF EXISTS `mdl_messageinbound_handlers`;
CREATE TABLE IF NOT EXISTS `mdl_messageinbound_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `defaultexpiration` bigint(10) NOT NULL DEFAULT '86400',
  `validateaddress` tinyint(1) NOT NULL DEFAULT '1',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messhand_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Inbound Message Handler definitions.';

--
-- Truncate table before insert `mdl_messageinbound_handlers`
--

TRUNCATE TABLE `mdl_messageinbound_handlers`;
--
-- Dumping data for table `mdl_messageinbound_handlers`
--

INSERT DELAYED IGNORE INTO `mdl_messageinbound_handlers` (`id`, `component`, `classname`, `defaultexpiration`, `validateaddress`, `enabled`) VALUES
(1, 'core', '\\core\\message\\inbound\\private_files_handler', 0, 1, 0),
(2, 'mod_forum', '\\mod_forum\\message\\inbound\\reply_handler', 604800, 1, 0),
(3, 'tool_messageinbound', '\\tool_messageinbound\\message\\inbound\\invalid_recipient_handler', 604800, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_messageinbound_messagelist`
--

DROP TABLE IF EXISTS `mdl_messageinbound_messagelist`;
CREATE TABLE IF NOT EXISTS `mdl_messageinbound_messagelist` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `messageid` longtext NOT NULL,
  `userid` bigint(10) NOT NULL,
  `address` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messmess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of message IDs for existing replies';

--
-- Truncate table before insert `mdl_messageinbound_messagelist`
--

TRUNCATE TABLE `mdl_messageinbound_messagelist`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

DROP TABLE IF EXISTS `mdl_mnet_application`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts';

--
-- Truncate table before insert `mdl_mnet_application`
--

TRUNCATE TABLE `mdl_mnet_application`;
--
-- Dumping data for table `mdl_mnet_application`
--

INSERT DELAYED IGNORE INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

DROP TABLE IF EXISTS `mdl_mnet_host`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` longtext NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  `sslverification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC';

--
-- Truncate table before insert `mdl_mnet_host`
--

TRUNCATE TABLE `mdl_mnet_host`;
--
-- Dumping data for table `mdl_mnet_host`
--

INSERT DELAYED IGNORE INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`, `sslverification`) VALUES
(1, 0, 'http://localhost/moodle', '::1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

DROP TABLE IF EXISTS `mdl_mnet_host2service`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host';

--
-- Truncate table before insert `mdl_mnet_host2service`
--

TRUNCATE TABLE `mdl_mnet_host2service`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

DROP TABLE IF EXISTS `mdl_mnet_log`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';

--
-- Truncate table before insert `mdl_mnet_log`
--

TRUNCATE TABLE `mdl_mnet_log`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_rpc`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely';

--
-- Truncate table before insert `mdl_mnet_remote_rpc`
--

TRUNCATE TABLE `mdl_mnet_remote_rpc`;
--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT DELAYED IGNORE INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_remote_service2rpc`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';

--
-- Truncate table before insert `mdl_mnet_remote_service2rpc`
--

TRUNCATE TABLE `mdl_mnet_remote_service2rpc`;
--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT DELAYED IGNORE INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_rpc`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext NOT NULL,
  `profile` longtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to';

--
-- Truncate table before insert `mdl_mnet_rpc`
--

TRUNCATE TABLE `mdl_mnet_rpc`;
--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT DELAYED IGNORE INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:18:"User Agent string.";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:35:"SHA1 hash of user agent to look for";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user\'s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\nf1          - the content of the default 100x100px image\nf1_mimetype - the mimetype of the f1 file\nf2          - the content of the 35x35px variant of the image\nf2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:11:"false|array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:75:"Assoc array of courses following the structure of mnetservice_enrol_courses";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:35:"SHA1 hash of user agent to look for";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for \'All hosts\', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:43:"user details {@see mnet_fields_to_import()}";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can\'t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"of our local course";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:12:"string|array";s:11:"description";s:58:"comma separated list of role shortnames (or array of them)";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

DROP TABLE IF EXISTS `mdl_mnet_service`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions';

--
-- Truncate table before insert `mdl_mnet_service`
--

TRUNCATE TABLE `mdl_mnet_service`;
--
-- Dumping data for table `mdl_mnet_service`
--

INSERT DELAYED IGNORE INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

DROP TABLE IF EXISTS `mdl_mnet_service2rpc`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service';

--
-- Truncate table before insert `mdl_mnet_service2rpc`
--

TRUNCATE TABLE `mdl_mnet_service2rpc`;
--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT DELAYED IGNORE INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

DROP TABLE IF EXISTS `mdl_mnet_session`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites';

--
-- Truncate table before insert `mdl_mnet_session`
--

TRUNCATE TABLE `mdl_mnet_session`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

DROP TABLE IF EXISTS `mdl_mnet_sso_access_control`;
CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov';

--
-- Truncate table before insert `mdl_mnet_sso_access_control`
--

TRUNCATE TABLE `mdl_mnet_sso_access_control`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_courses`;
CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ';

--
-- Truncate table before insert `mdl_mnetservice_enrol_courses`
--

TRUNCATE TABLE `mdl_mnetservice_enrol_courses`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

DROP TABLE IF EXISTS `mdl_mnetservice_enrol_enrolments`;
CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i';

--
-- Truncate table before insert `mdl_mnetservice_enrol_enrolments`
--

TRUNCATE TABLE `mdl_mnetservice_enrol_enrolments`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

DROP TABLE IF EXISTS `mdl_modules`;
CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='modules available in the site';

--
-- Truncate table before insert `mdl_modules`
--

TRUNCATE TABLE `mdl_modules`;
--
-- Dumping data for table `mdl_modules`
--

INSERT DELAYED IGNORE INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 60, 0, '', 1),
(2, 'assignment', 60, 0, '', 0),
(3, 'book', 0, 0, '', 1),
(4, 'chat', 300, 0, '', 1),
(5, 'choice', 0, 0, '', 1),
(6, 'data', 0, 0, '', 1),
(7, 'feedback', 0, 0, '', 1),
(8, 'folder', 0, 0, '', 1),
(9, 'forum', 0, 0, '', 1),
(10, 'glossary', 0, 0, '', 1),
(11, 'imscp', 0, 0, '', 1),
(12, 'label', 0, 0, '', 1),
(13, 'lesson', 0, 0, '', 1),
(14, 'lti', 0, 0, '', 1),
(15, 'page', 0, 0, '', 1),
(16, 'quiz', 60, 0, '', 1),
(17, 'resource', 0, 0, '', 1),
(18, 'scorm', 0, 0, '', 1),
(19, 'survey', 0, 0, '', 1),
(20, 'url', 0, 0, '', 1),
(21, 'wiki', 0, 0, '', 1),
(22, 'workshop', 60, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

DROP TABLE IF EXISTS `mdl_my_pages`;
CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system';

--
-- Truncate table before insert `mdl_my_pages`
--

TRUNCATE TABLE `mdl_my_pages`;
--
-- Dumping data for table `mdl_my_pages`
--

INSERT DELAYED IGNORE INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0),
(3, 2, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_endpoint`
--

DROP TABLE IF EXISTS `mdl_oauth2_endpoint`;
CREATE TABLE IF NOT EXISTS `mdl_oauth2_endpoint` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` longtext NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_oautendp_iss_ix` (`issuerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Describes the named endpoint for an oauth2 service.';

--
-- Truncate table before insert `mdl_oauth2_endpoint`
--

TRUNCATE TABLE `mdl_oauth2_endpoint`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_issuer`
--

DROP TABLE IF EXISTS `mdl_oauth2_issuer`;
CREATE TABLE IF NOT EXISTS `mdl_oauth2_issuer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` longtext NOT NULL,
  `baseurl` longtext NOT NULL,
  `clientid` longtext NOT NULL,
  `clientsecret` longtext NOT NULL,
  `loginscopes` longtext NOT NULL,
  `loginscopesoffline` longtext NOT NULL,
  `loginparams` longtext NOT NULL,
  `loginparamsoffline` longtext NOT NULL,
  `alloweddomains` longtext NOT NULL,
  `scopessupported` longtext,
  `enabled` tinyint(2) NOT NULL DEFAULT '1',
  `showonloginpage` tinyint(2) NOT NULL DEFAULT '1',
  `sortorder` bigint(10) NOT NULL,
  `requireconfirmation` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Details for an oauth 2 connect identity issuer.' ROW_FORMAT=COMPRESSED;

--
-- Truncate table before insert `mdl_oauth2_issuer`
--

TRUNCATE TABLE `mdl_oauth2_issuer`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_system_account`
--

DROP TABLE IF EXISTS `mdl_oauth2_system_account`;
CREATE TABLE IF NOT EXISTS `mdl_oauth2_system_account` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `refreshtoken` longtext NOT NULL,
  `grantedscopes` longtext NOT NULL,
  `email` longtext,
  `username` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_oautsystacco_iss_uix` (`issuerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stored details used to get an access token as a system user ';

--
-- Truncate table before insert `mdl_oauth2_system_account`
--

TRUNCATE TABLE `mdl_oauth2_system_account`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_oauth2_user_field_mapping`
--

DROP TABLE IF EXISTS `mdl_oauth2_user_field_mapping`;
CREATE TABLE IF NOT EXISTS `mdl_oauth2_user_field_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `externalfield` varchar(64) NOT NULL DEFAULT '',
  `internalfield` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_oautuserfielmapp_issin_uix` (`issuerid`,`internalfield`),
  KEY `mdl_oautuserfielmapp_iss_ix` (`issuerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping of oauth user fields to moodle fields.';

--
-- Truncate table before insert `mdl_oauth2_user_field_mapping`
--

TRUNCATE TABLE `mdl_oauth2_user_field_mapping`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

DROP TABLE IF EXISTS `mdl_page`;
CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data';

--
-- Truncate table before insert `mdl_page`
--

TRUNCATE TABLE `mdl_page`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance`;
CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port';

--
-- Truncate table before insert `mdl_portfolio_instance`
--

TRUNCATE TABLE `mdl_portfolio_instance`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_config`;
CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances';

--
-- Truncate table before insert `mdl_portfolio_instance_config`
--

TRUNCATE TABLE `mdl_portfolio_instance_config`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

DROP TABLE IF EXISTS `mdl_portfolio_instance_user`;
CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.';

--
-- Truncate table before insert `mdl_portfolio_instance_user`
--

TRUNCATE TABLE `mdl_portfolio_instance_user`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

DROP TABLE IF EXISTS `mdl_portfolio_log`;
CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_component` varchar(255) DEFAULT NULL,
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat';

--
-- Truncate table before insert `mdl_portfolio_log`
--

TRUNCATE TABLE `mdl_portfolio_log`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

DROP TABLE IF EXISTS `mdl_portfolio_mahara_queue`;
CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids';

--
-- Truncate table before insert `mdl_portfolio_mahara_queue`
--

TRUNCATE TABLE `mdl_portfolio_mahara_queue`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

DROP TABLE IF EXISTS `mdl_portfolio_tempdata`;
CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ';

--
-- Truncate table before insert `mdl_portfolio_tempdata`
--

TRUNCATE TABLE `mdl_portfolio_tempdata`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

DROP TABLE IF EXISTS `mdl_post`;
CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen';

--
-- Truncate table before insert `mdl_post`
--

TRUNCATE TABLE `mdl_post`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

DROP TABLE IF EXISTS `mdl_profiling`;
CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the results of all the profiling runs';

--
-- Truncate table before insert `mdl_profiling`
--

TRUNCATE TABLE `mdl_profiling`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddimageortext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddim_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines drag and drop (text or images onto a background imag';

--
-- Truncate table before insert `mdl_qtype_ddimageortext`
--

TRUNCATE TABLE `mdl_qtype_ddimageortext`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext_drags`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext_drags`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddimageortext_drags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `draggroup` bigint(10) NOT NULL DEFAULT '0',
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `label` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Images to drag. Actual file names are not stored here we use';

--
-- Truncate table before insert `mdl_qtype_ddimageortext_drags`
--

TRUNCATE TABLE `mdl_qtype_ddimageortext_drags`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddimageortext_drops`
--

DROP TABLE IF EXISTS `mdl_qtype_ddimageortext_drops`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddimageortext_drops` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `xleft` bigint(10) NOT NULL DEFAULT '0',
  `ytop` bigint(10) NOT NULL DEFAULT '0',
  `choice` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddimdrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Drop boxes';

--
-- Truncate table before insert `mdl_qtype_ddimageortext_drops`
--

TRUNCATE TABLE `mdl_qtype_ddimageortext_drops`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddmarker` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  `showmisplaced` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddma_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines drag and drop (text or images onto a background imag';

--
-- Truncate table before insert `mdl_qtype_ddmarker`
--

TRUNCATE TABLE `mdl_qtype_ddmarker`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker_drags`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker_drags`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddmarker_drags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `label` longtext NOT NULL,
  `infinite` smallint(4) NOT NULL DEFAULT '0',
  `noofdrags` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrag_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Labels for markers to drag.';

--
-- Truncate table before insert `mdl_qtype_ddmarker_drags`
--

TRUNCATE TABLE `mdl_qtype_ddmarker_drags`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_ddmarker_drops`
--

DROP TABLE IF EXISTS `mdl_qtype_ddmarker_drops`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_ddmarker_drops` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `no` bigint(10) NOT NULL DEFAULT '0',
  `shape` varchar(255) DEFAULT NULL,
  `coords` longtext NOT NULL,
  `choice` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypddmadrop_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='drop regions';

--
-- Truncate table before insert `mdl_qtype_ddmarker_drops`
--

TRUNCATE TABLE `mdl_qtype_ddmarker_drops`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

DROP TABLE IF EXISTS `mdl_qtype_essay_options`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responserequired` tinyint(2) NOT NULL DEFAULT '1',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `attachmentsrequired` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra options for essay questions.';

--
-- Truncate table before insert `mdl_qtype_essay_options`
--

TRUNCATE TABLE `mdl_qtype_essay_options`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_options`
--

DROP TABLE IF EXISTS `mdl_qtype_match_options`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the question-type specific options for matching ques';

--
-- Truncate table before insert `mdl_qtype_match_options`
--

TRUNCATE TABLE `mdl_qtype_match_options`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

DROP TABLE IF EXISTS `mdl_qtype_match_subquestions`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The subquestions that make up a matching question';

--
-- Truncate table before insert `mdl_qtype_match_subquestions`
--

TRUNCATE TABLE `mdl_qtype_match_subquestions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

DROP TABLE IF EXISTS `mdl_qtype_multichoice_options`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions';

--
-- Truncate table before insert `mdl_qtype_multichoice_options`
--

TRUNCATE TABLE `mdl_qtype_multichoice_options`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_randomsamatch_options`
--

DROP TABLE IF EXISTS `mdl_qtype_randomsamatch_options`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_randomsamatch_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  `subcats` tinyint(2) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtyprandopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question';

--
-- Truncate table before insert `mdl_qtype_randomsamatch_options`
--

TRUNCATE TABLE `mdl_qtype_randomsamatch_options`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

DROP TABLE IF EXISTS `mdl_qtype_shortanswer_options`;
CREATE TABLE IF NOT EXISTS `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions';

--
-- Truncate table before insert `mdl_qtype_shortanswer_options`
--

TRUNCATE TABLE `mdl_qtype_shortanswer_options`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

DROP TABLE IF EXISTS `mdl_question`;
CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_qty_ix` (`qtype`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The questions themselves';

--
-- Truncate table before insert `mdl_question`
--

TRUNCATE TABLE `mdl_question`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

DROP TABLE IF EXISTS `mdl_question_answers`;
CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback';

--
-- Truncate table before insert `mdl_question_answers`
--

TRUNCATE TABLE `mdl_question_answers`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

DROP TABLE IF EXISTS `mdl_question_attempt_step_data`;
CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each question_attempt_step has an associative array of the d';

--
-- Truncate table before insert `mdl_question_attempt_step_data`
--

TRUNCATE TABLE `mdl_question_attempt_step_data`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

DROP TABLE IF EXISTS `mdl_question_attempt_steps`;
CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores one step in in a question attempt. As well as the dat';

--
-- Truncate table before insert `mdl_question_attempt_steps`
--

TRUNCATE TABLE `mdl_question_attempt_steps`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

DROP TABLE IF EXISTS `mdl_question_attempts`;
CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext,
  `rightanswer` longtext,
  `responsesummary` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_beh_ix` (`behaviour`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each row here corresponds to an attempt at one question, as ';

--
-- Truncate table before insert `mdl_question_attempts`
--

TRUNCATE TABLE `mdl_question_attempts`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

DROP TABLE IF EXISTS `mdl_question_calculated`;
CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';

--
-- Truncate table before insert `mdl_question_calculated`
--

TRUNCATE TABLE `mdl_question_calculated`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

DROP TABLE IF EXISTS `mdl_question_calculated_options`;
CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated';

--
-- Truncate table before insert `mdl_question_calculated_options`
--

TRUNCATE TABLE `mdl_question_calculated_options`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

DROP TABLE IF EXISTS `mdl_question_categories`;
CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quescate_consta_uix` (`contextid`,`stamp`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions';

--
-- Truncate table before insert `mdl_question_categories`
--

TRUNCATE TABLE `mdl_question_categories`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

DROP TABLE IF EXISTS `mdl_question_dataset_definitions`;
CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items';

--
-- Truncate table before insert `mdl_question_dataset_definitions`
--

TRUNCATE TABLE `mdl_question_dataset_definitions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

DROP TABLE IF EXISTS `mdl_question_dataset_items`;
CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items';

--
-- Truncate table before insert `mdl_question_dataset_items`
--

TRUNCATE TABLE `mdl_question_dataset_items`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

DROP TABLE IF EXISTS `mdl_question_datasets`;
CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions';

--
-- Truncate table before insert `mdl_question_datasets`
--

TRUNCATE TABLE `mdl_question_datasets`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_ddwtos`
--

DROP TABLE IF EXISTS `mdl_question_ddwtos`;
CREATE TABLE IF NOT EXISTS `mdl_question_ddwtos` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesddwt_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines drag and drop (words into sentences) questions';

--
-- Truncate table before insert `mdl_question_ddwtos`
--

TRUNCATE TABLE `mdl_question_ddwtos`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_gapselect`
--

DROP TABLE IF EXISTS `mdl_question_gapselect`;
CREATE TABLE IF NOT EXISTS `mdl_question_gapselect` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesgaps_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines select missing words questions';

--
-- Truncate table before insert `mdl_question_gapselect`
--

TRUNCATE TABLE `mdl_question_gapselect`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

DROP TABLE IF EXISTS `mdl_question_hints`;
CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the the part of the question definition that gives di';

--
-- Truncate table before insert `mdl_question_hints`
--

TRUNCATE TABLE `mdl_question_hints`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

DROP TABLE IF EXISTS `mdl_question_multianswer`;
CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions';

--
-- Truncate table before insert `mdl_question_multianswer`
--

TRUNCATE TABLE `mdl_question_multianswer`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

DROP TABLE IF EXISTS `mdl_question_numerical`;
CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.';

--
-- Truncate table before insert `mdl_question_numerical`
--

TRUNCATE TABLE `mdl_question_numerical`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

DROP TABLE IF EXISTS `mdl_question_numerical_options`;
CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u';

--
-- Truncate table before insert `mdl_question_numerical_options`
--

TRUNCATE TABLE `mdl_question_numerical_options`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

DROP TABLE IF EXISTS `mdl_question_numerical_units`;
CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is';

--
-- Truncate table before insert `mdl_question_numerical_units`
--

TRUNCATE TABLE `mdl_question_numerical_units`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_analysis`
--

DROP TABLE IF EXISTS `mdl_question_response_analysis`;
CREATE TABLE IF NOT EXISTS `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichtries` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `subqid` varchar(100) NOT NULL DEFAULT '',
  `aid` varchar(100) DEFAULT NULL,
  `response` longtext,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Analysis of student responses given to questions.';

--
-- Truncate table before insert `mdl_question_response_analysis`
--

TRUNCATE TABLE `mdl_question_response_analysis`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_count`
--

DROP TABLE IF EXISTS `mdl_question_response_count`;
CREATE TABLE IF NOT EXISTS `mdl_question_response_count` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `analysisid` bigint(10) NOT NULL,
  `try` bigint(10) NOT NULL,
  `rcount` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesrespcoun_ana_ix` (`analysisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count for each responses for each try at a question.';

--
-- Truncate table before insert `mdl_question_response_count`
--

TRUNCATE TABLE `mdl_question_response_count`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_statistics`
--

DROP TABLE IF EXISTS `mdl_question_statistics`;
CREATE TABLE IF NOT EXISTS `mdl_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `variant` bigint(10) DEFAULT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Statistics for individual questions used in an activity.';

--
-- Truncate table before insert `mdl_question_statistics`
--

TRUNCATE TABLE `mdl_question_statistics`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

DROP TABLE IF EXISTS `mdl_question_truefalse`;
CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions';

--
-- Truncate table before insert `mdl_question_truefalse`
--

TRUNCATE TABLE `mdl_question_truefalse`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

DROP TABLE IF EXISTS `mdl_question_usages`;
CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table''s main purpose it to assign a unique id to each a';

--
-- Truncate table before insert `mdl_question_usages`
--

TRUNCATE TABLE `mdl_question_usages`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

DROP TABLE IF EXISTS `mdl_quiz`;
CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  `canredoquestions` smallint(4) NOT NULL DEFAULT '0',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) NOT NULL DEFAULT 'free',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  `completionattemptsexhausted` tinyint(1) DEFAULT '0',
  `completionpass` tinyint(1) DEFAULT '0',
  `allowofflineattempts` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The settings for each quiz.';

--
-- Truncate table before insert `mdl_quiz`
--

TRUNCATE TABLE `mdl_quiz`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

DROP TABLE IF EXISTS `mdl_quiz_attempts`;
CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timemodifiedoffline` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores users attempts at quizzes.';

--
-- Truncate table before insert `mdl_quiz_attempts`
--

TRUNCATE TABLE `mdl_quiz_attempts`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

DROP TABLE IF EXISTS `mdl_quiz_feedback`;
CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o';

--
-- Truncate table before insert `mdl_quiz_feedback`
--

TRUNCATE TABLE `mdl_quiz_feedback`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

DROP TABLE IF EXISTS `mdl_quiz_grades`;
CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the overall grade for each user on the quiz, based on';

--
-- Truncate table before insert `mdl_quiz_grades`
--

TRUNCATE TABLE `mdl_quiz_grades`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

DROP TABLE IF EXISTS `mdl_quiz_overrides`;
CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b';

--
-- Truncate table before insert `mdl_quiz_overrides`
--

TRUNCATE TABLE `mdl_quiz_overrides`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

DROP TABLE IF EXISTS `mdl_quiz_overview_regrades`;
CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an';

--
-- Truncate table before insert `mdl_quiz_overview_regrades`
--

TRUNCATE TABLE `mdl_quiz_overview_regrades`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

DROP TABLE IF EXISTS `mdl_quiz_reports`;
CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order';

--
-- Truncate table before insert `mdl_quiz_reports`
--

TRUNCATE TABLE `mdl_quiz_reports`;
--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT DELAYED IGNORE INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'grading', 6000, 'mod/quiz:grade'),
(2, 'overview', 10000, NULL),
(3, 'responses', 9000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_sections`
--

DROP TABLE IF EXISTS `mdl_quiz_sections`;
CREATE TABLE IF NOT EXISTS `mdl_quiz_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `firstslot` bigint(10) NOT NULL,
  `heading` varchar(1333) DEFAULT NULL,
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizsect_quifir_uix` (`quizid`,`firstslot`),
  KEY `mdl_quizsect_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores sections of a quiz with section name (heading), from ';

--
-- Truncate table before insert `mdl_quiz_sections`
--

TRUNCATE TABLE `mdl_quiz_sections`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_slots`
--

DROP TABLE IF EXISTS `mdl_quiz_slots`;
CREATE TABLE IF NOT EXISTS `mdl_quiz_slots` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `slot` bigint(10) NOT NULL,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `page` bigint(10) NOT NULL,
  `requireprevious` smallint(4) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `maxmark` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizslot_quislo_uix` (`quizid`,`slot`),
  KEY `mdl_quizslot_qui_ix` (`quizid`),
  KEY `mdl_quizslot_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the question used in a quiz, with the order, and for ';

--
-- Truncate table before insert `mdl_quiz_slots`
--

TRUNCATE TABLE `mdl_quiz_slots`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

DROP TABLE IF EXISTS `mdl_quiz_statistics`;
CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table to cache results from analysis done in statistics repo';

--
-- Truncate table before insert `mdl_quiz_statistics`
--

TRUNCATE TABLE `mdl_quiz_statistics`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

DROP TABLE IF EXISTS `mdl_rating`;
CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `ratingarea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings';

--
-- Truncate table before insert `mdl_rating`
--

TRUNCATE TABLE `mdl_rating`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

DROP TABLE IF EXISTS `mdl_registration_hubs`;
CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to';

--
-- Truncate table before insert `mdl_registration_hubs`
--

TRUNCATE TABLE `mdl_registration_hubs`;
--
-- Dumping data for table `mdl_registration_hubs`
--

INSERT DELAYED IGNORE INTO `mdl_registration_hubs` (`id`, `token`, `hubname`, `huburl`, `confirmed`, `secret`, `timemodified`) VALUES
(1, 'EQxkaVYYYmnQfItM1jRG9ndGvQ5QeMiNlocalhost', 'Moodle.net', 'https://moodle.net', 0, 'EQxkaVYYYmnQfItM1jRG9ndGvQ5QeMiNlocalhost', 1502331817);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

DROP TABLE IF EXISTS `mdl_repository`;
CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ';

--
-- Truncate table before insert `mdl_repository`
--

TRUNCATE TABLE `mdl_repository`;
--
-- Dumping data for table `mdl_repository`
--

INSERT DELAYED IGNORE INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'areafiles', 1, 1),
(2, 'local', 1, 2),
(3, 'recent', 1, 3),
(4, 'upload', 1, 4),
(5, 'url', 1, 5),
(6, 'user', 1, 6),
(7, 'wikimedia', 1, 7),
(8, 'filesystem', 1, 8),
(9, 'coursefiles', 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

DROP TABLE IF EXISTS `mdl_repository_instance_config`;
CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances';

--
-- Truncate table before insert `mdl_repository_instance_config`
--

TRUNCATE TABLE `mdl_repository_instance_config`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

DROP TABLE IF EXISTS `mdl_repository_instances`;
CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ';

--
-- Truncate table before insert `mdl_repository_instances`
--

TRUNCATE TABLE `mdl_repository_instances`;
--
-- Dumping data for table `mdl_repository_instances`
--

INSERT DELAYED IGNORE INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1502329009, 1502329009, 0),
(2, '', 2, 0, 1, NULL, NULL, 1502329014, 1502329014, 0),
(3, '', 3, 0, 1, NULL, NULL, 1502329017, 1502329017, 0),
(4, '', 4, 0, 1, NULL, NULL, 1502329018, 1502329018, 0),
(5, '', 5, 0, 1, NULL, NULL, 1502329019, 1502329019, 0),
(6, '', 6, 0, 1, NULL, NULL, 1502329019, 1502329019, 0),
(7, '', 7, 0, 1, NULL, NULL, 1502329020, 1502329020, 0),
(8, '', 9, 0, 1, NULL, NULL, 1502334889, 1502334889, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_onedrive_access`
--

DROP TABLE IF EXISTS `mdl_repository_onedrive_access`;
CREATE TABLE IF NOT EXISTS `mdl_repository_onedrive_access` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `permissionid` varchar(255) NOT NULL DEFAULT '',
  `itemid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_repoonedacce_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of temporary access grants.';

--
-- Truncate table before insert `mdl_repository_onedrive_access`
--

TRUNCATE TABLE `mdl_repository_onedrive_access`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

DROP TABLE IF EXISTS `mdl_resource`;
CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data';

--
-- Truncate table before insert `mdl_resource`
--

TRUNCATE TABLE `mdl_resource`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

DROP TABLE IF EXISTS `mdl_resource_old`;
CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext NOT NULL,
  `popup` longtext NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9';

--
-- Truncate table before insert `mdl_resource_old`
--

TRUNCATE TABLE `mdl_resource_old`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

DROP TABLE IF EXISTS `mdl_role`;
CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='moodle roles';

--
-- Truncate table before insert `mdl_role`
--

TRUNCATE TABLE `mdl_role`;
--
-- Dumping data for table `mdl_role`
--

INSERT DELAYED IGNORE INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

DROP TABLE IF EXISTS `mdl_role_allow_assign`;
CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role';

--
-- Truncate table before insert `mdl_role_allow_assign`
--

TRUNCATE TABLE `mdl_role_allow_assign`;
--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT DELAYED IGNORE INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

DROP TABLE IF EXISTS `mdl_role_allow_override`;
CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role';

--
-- Truncate table before insert `mdl_role_allow_override`
--

TRUNCATE TABLE `mdl_role_allow_override`;
--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT DELAYED IGNORE INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

DROP TABLE IF EXISTS `mdl_role_allow_switch`;
CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ';

--
-- Truncate table before insert `mdl_role_allow_switch`
--

TRUNCATE TABLE `mdl_role_allow_switch`;
--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT DELAYED IGNORE INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

DROP TABLE IF EXISTS `mdl_role_assignments`;
CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context';

--
-- Truncate table before insert `mdl_role_assignments`
--

TRUNCATE TABLE `mdl_role_assignments`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

DROP TABLE IF EXISTS `mdl_role_capabilities`;
CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB AUTO_INCREMENT=1270 DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p';

--
-- Truncate table before insert `mdl_role_capabilities`
--

TRUNCATE TABLE `mdl_role_capabilities`;
--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT DELAYED IGNORE INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:configview', 1, 1502328650, 0),
(2, 1, 2, 'moodle/site:configview', 1, 1502328650, 0),
(3, 1, 1, 'moodle/site:readallmessages', 1, 1502328650, 0),
(4, 1, 3, 'moodle/site:readallmessages', 1, 1502328650, 0),
(5, 1, 1, 'moodle/site:manageallmessaging', 1, 1502328650, 0),
(6, 1, 1, 'moodle/site:deleteanymessage', 1, 1502328651, 0),
(7, 1, 1, 'moodle/site:sendmessage', 1, 1502328651, 0),
(8, 1, 7, 'moodle/site:sendmessage', 1, 1502328651, 0),
(9, 1, 7, 'moodle/site:deleteownmessage', 1, 1502328651, 0),
(10, 1, 1, 'moodle/site:approvecourse', 1, 1502328651, 0),
(11, 1, 3, 'moodle/backup:backupcourse', 1, 1502328651, 0),
(12, 1, 1, 'moodle/backup:backupcourse', 1, 1502328651, 0),
(13, 1, 3, 'moodle/backup:backupsection', 1, 1502328651, 0),
(14, 1, 1, 'moodle/backup:backupsection', 1, 1502328651, 0),
(15, 1, 3, 'moodle/backup:backupactivity', 1, 1502328651, 0),
(16, 1, 1, 'moodle/backup:backupactivity', 1, 1502328651, 0),
(17, 1, 3, 'moodle/backup:backuptargethub', 1, 1502328651, 0),
(18, 1, 1, 'moodle/backup:backuptargethub', 1, 1502328651, 0),
(19, 1, 3, 'moodle/backup:backuptargetimport', 1, 1502328651, 0),
(20, 1, 1, 'moodle/backup:backuptargetimport', 1, 1502328651, 0),
(21, 1, 3, 'moodle/backup:downloadfile', 1, 1502328651, 0),
(22, 1, 1, 'moodle/backup:downloadfile', 1, 1502328652, 0),
(23, 1, 3, 'moodle/backup:configure', 1, 1502328652, 0),
(24, 1, 1, 'moodle/backup:configure', 1, 1502328652, 0),
(25, 1, 1, 'moodle/backup:userinfo', 1, 1502328652, 0),
(26, 1, 1, 'moodle/backup:anonymise', 1, 1502328652, 0),
(27, 1, 3, 'moodle/restore:restorecourse', 1, 1502328652, 0),
(28, 1, 1, 'moodle/restore:restorecourse', 1, 1502328652, 0),
(29, 1, 3, 'moodle/restore:restoresection', 1, 1502328652, 0),
(30, 1, 1, 'moodle/restore:restoresection', 1, 1502328652, 0),
(31, 1, 3, 'moodle/restore:restoreactivity', 1, 1502328652, 0),
(32, 1, 1, 'moodle/restore:restoreactivity', 1, 1502328652, 0),
(33, 1, 3, 'moodle/restore:restoretargethub', 1, 1502328652, 0),
(34, 1, 1, 'moodle/restore:restoretargethub', 1, 1502328652, 0),
(35, 1, 3, 'moodle/restore:restoretargetimport', 1, 1502328652, 0),
(36, 1, 1, 'moodle/restore:restoretargetimport', 1, 1502328652, 0),
(37, 1, 3, 'moodle/restore:uploadfile', 1, 1502328653, 0),
(38, 1, 1, 'moodle/restore:uploadfile', 1, 1502328653, 0),
(39, 1, 3, 'moodle/restore:configure', 1, 1502328653, 0),
(40, 1, 1, 'moodle/restore:configure', 1, 1502328653, 0),
(41, 1, 2, 'moodle/restore:rolldates', 1, 1502328653, 0),
(42, 1, 1, 'moodle/restore:rolldates', 1, 1502328653, 0),
(43, 1, 1, 'moodle/restore:userinfo', 1, 1502328653, 0),
(44, 1, 1, 'moodle/restore:createuser', 1, 1502328653, 0),
(45, 1, 3, 'moodle/site:manageblocks', 1, 1502328653, 0),
(46, 1, 1, 'moodle/site:manageblocks', 1, 1502328653, 0),
(47, 1, 3, 'moodle/site:accessallgroups', 1, 1502328653, 0),
(48, 1, 1, 'moodle/site:accessallgroups', 1, 1502328653, 0),
(49, 1, 4, 'moodle/site:viewfullnames', 1, 1502328653, 0),
(50, 1, 3, 'moodle/site:viewfullnames', 1, 1502328653, 0),
(51, 1, 1, 'moodle/site:viewfullnames', 1, 1502328653, 0),
(52, 1, 4, 'moodle/site:viewuseridentity', 1, 1502328653, 0),
(53, 1, 3, 'moodle/site:viewuseridentity', 1, 1502328653, 0),
(54, 1, 1, 'moodle/site:viewuseridentity', 1, 1502328654, 0),
(55, 1, 4, 'moodle/site:viewreports', 1, 1502328654, 0),
(56, 1, 3, 'moodle/site:viewreports', 1, 1502328654, 0),
(57, 1, 1, 'moodle/site:viewreports', 1, 1502328654, 0),
(58, 1, 3, 'moodle/site:trustcontent', 1, 1502328654, 0),
(59, 1, 1, 'moodle/site:trustcontent', 1, 1502328654, 0),
(60, 1, 1, 'moodle/site:uploadusers', 1, 1502328654, 0),
(61, 1, 3, 'moodle/filter:manage', 1, 1502328654, 0),
(62, 1, 1, 'moodle/filter:manage', 1, 1502328654, 0),
(63, 1, 1, 'moodle/user:create', 1, 1502328654, 0),
(64, 1, 1, 'moodle/user:delete', 1, 1502328654, 0),
(65, 1, 1, 'moodle/user:update', 1, 1502328654, 0),
(66, 1, 6, 'moodle/user:viewdetails', 1, 1502328654, 0),
(67, 1, 5, 'moodle/user:viewdetails', 1, 1502328654, 0),
(68, 1, 4, 'moodle/user:viewdetails', 1, 1502328654, 0),
(69, 1, 3, 'moodle/user:viewdetails', 1, 1502328654, 0),
(70, 1, 1, 'moodle/user:viewdetails', 1, 1502328654, 0),
(71, 1, 1, 'moodle/user:viewalldetails', 1, 1502328655, 0),
(72, 1, 1, 'moodle/user:viewlastip', 1, 1502328655, 0),
(73, 1, 4, 'moodle/user:viewhiddendetails', 1, 1502328655, 0),
(74, 1, 3, 'moodle/user:viewhiddendetails', 1, 1502328655, 0),
(75, 1, 1, 'moodle/user:viewhiddendetails', 1, 1502328655, 0),
(76, 1, 1, 'moodle/user:loginas', 1, 1502328655, 0),
(77, 1, 1, 'moodle/user:managesyspages', 1, 1502328655, 0),
(78, 1, 7, 'moodle/user:manageownblocks', 1, 1502328655, 0),
(79, 1, 7, 'moodle/user:manageownfiles', 1, 1502328655, 0),
(80, 1, 1, 'moodle/my:configsyspages', 1, 1502328655, 0),
(81, 1, 3, 'moodle/role:assign', 1, 1502328655, 0),
(82, 1, 1, 'moodle/role:assign', 1, 1502328655, 0),
(83, 1, 4, 'moodle/role:review', 1, 1502328655, 0),
(84, 1, 3, 'moodle/role:review', 1, 1502328655, 0),
(85, 1, 1, 'moodle/role:review', 1, 1502328655, 0),
(86, 1, 1, 'moodle/role:override', 1, 1502328656, 0),
(87, 1, 3, 'moodle/role:safeoverride', 1, 1502328656, 0),
(88, 1, 1, 'moodle/role:manage', 1, 1502328656, 0),
(89, 1, 3, 'moodle/role:switchroles', 1, 1502328656, 0),
(90, 1, 1, 'moodle/role:switchroles', 1, 1502328656, 0),
(91, 1, 1, 'moodle/category:manage', 1, 1502328656, 0),
(92, 1, 2, 'moodle/category:viewhiddencategories', 1, 1502328656, 0),
(93, 1, 1, 'moodle/category:viewhiddencategories', 1, 1502328656, 0),
(94, 1, 1, 'moodle/cohort:manage', 1, 1502328656, 0),
(95, 1, 1, 'moodle/cohort:assign', 1, 1502328656, 0),
(96, 1, 3, 'moodle/cohort:view', 1, 1502328656, 0),
(97, 1, 1, 'moodle/cohort:view', 1, 1502328656, 0),
(98, 1, 2, 'moodle/course:create', 1, 1502328656, 0),
(99, 1, 1, 'moodle/course:create', 1, 1502328656, 0),
(100, 1, 7, 'moodle/course:request', 1, 1502328657, 0),
(101, 1, 1, 'moodle/course:delete', 1, 1502328657, 0),
(102, 1, 3, 'moodle/course:update', 1, 1502328657, 0),
(103, 1, 1, 'moodle/course:update', 1, 1502328657, 0),
(104, 1, 1, 'moodle/course:view', 1, 1502328657, 0),
(105, 1, 3, 'moodle/course:enrolreview', 1, 1502328657, 0),
(106, 1, 1, 'moodle/course:enrolreview', 1, 1502328657, 0),
(107, 1, 3, 'moodle/course:enrolconfig', 1, 1502328657, 0),
(108, 1, 1, 'moodle/course:enrolconfig', 1, 1502328657, 0),
(109, 1, 3, 'moodle/course:reviewotherusers', 1, 1502328657, 0),
(110, 1, 1, 'moodle/course:reviewotherusers', 1, 1502328657, 0),
(111, 1, 4, 'moodle/course:bulkmessaging', 1, 1502328657, 0),
(112, 1, 3, 'moodle/course:bulkmessaging', 1, 1502328657, 0),
(113, 1, 1, 'moodle/course:bulkmessaging', 1, 1502328657, 0),
(114, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1502328657, 0),
(115, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1502328657, 0),
(116, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1502328657, 0),
(117, 1, 2, 'moodle/course:viewhiddencourses', 1, 1502328658, 0),
(118, 1, 4, 'moodle/course:viewhiddencourses', 1, 1502328658, 0),
(119, 1, 3, 'moodle/course:viewhiddencourses', 1, 1502328658, 0),
(120, 1, 1, 'moodle/course:viewhiddencourses', 1, 1502328658, 0),
(121, 1, 3, 'moodle/course:visibility', 1, 1502328658, 0),
(122, 1, 1, 'moodle/course:visibility', 1, 1502328658, 0),
(123, 1, 3, 'moodle/course:managefiles', 1, 1502328658, 0),
(124, 1, 1, 'moodle/course:managefiles', 1, 1502328658, 0),
(125, 1, 1, 'moodle/course:ignoreavailabilityrestrictions', 1, 1502328658, 0),
(126, 1, 2, 'moodle/course:ignoreavailabilityrestrictions', 1, 1502328658, 0),
(127, 1, 3, 'moodle/course:ignoreavailabilityrestrictions', 1, 1502328658, 0),
(128, 1, 4, 'moodle/course:ignoreavailabilityrestrictions', 1, 1502328658, 0),
(129, 1, 3, 'moodle/course:manageactivities', 1, 1502328658, 0),
(130, 1, 1, 'moodle/course:manageactivities', 1, 1502328658, 0),
(131, 1, 3, 'moodle/course:activityvisibility', 1, 1502328658, 0),
(132, 1, 1, 'moodle/course:activityvisibility', 1, 1502328658, 0),
(133, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1502328659, 0),
(134, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1502328659, 0),
(135, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1502328659, 0),
(136, 1, 5, 'moodle/course:viewparticipants', 1, 1502328659, 0),
(137, 1, 4, 'moodle/course:viewparticipants', 1, 1502328659, 0),
(138, 1, 3, 'moodle/course:viewparticipants', 1, 1502328659, 0),
(139, 1, 1, 'moodle/course:viewparticipants', 1, 1502328659, 0),
(140, 1, 3, 'moodle/course:changefullname', 1, 1502328659, 0),
(141, 1, 1, 'moodle/course:changefullname', 1, 1502328659, 0),
(142, 1, 3, 'moodle/course:changeshortname', 1, 1502328659, 0),
(143, 1, 1, 'moodle/course:changeshortname', 1, 1502328659, 0),
(144, 1, 3, 'moodle/course:renameroles', 1, 1502328659, 0),
(145, 1, 1, 'moodle/course:renameroles', 1, 1502328659, 0),
(146, 1, 3, 'moodle/course:changeidnumber', 1, 1502328659, 0),
(147, 1, 1, 'moodle/course:changeidnumber', 1, 1502328659, 0),
(148, 1, 3, 'moodle/course:changecategory', 1, 1502328659, 0),
(149, 1, 1, 'moodle/course:changecategory', 1, 1502328659, 0),
(150, 1, 3, 'moodle/course:changesummary', 1, 1502328659, 0),
(151, 1, 1, 'moodle/course:changesummary', 1, 1502328659, 0),
(152, 1, 1, 'moodle/site:viewparticipants', 1, 1502328660, 0),
(153, 1, 5, 'moodle/course:isincompletionreports', 1, 1502328660, 0),
(154, 1, 5, 'moodle/course:viewscales', 1, 1502328660, 0),
(155, 1, 4, 'moodle/course:viewscales', 1, 1502328660, 0),
(156, 1, 3, 'moodle/course:viewscales', 1, 1502328660, 0),
(157, 1, 1, 'moodle/course:viewscales', 1, 1502328660, 0),
(158, 1, 3, 'moodle/course:managescales', 1, 1502328660, 0),
(159, 1, 1, 'moodle/course:managescales', 1, 1502328660, 0),
(160, 1, 3, 'moodle/course:managegroups', 1, 1502328660, 0),
(161, 1, 1, 'moodle/course:managegroups', 1, 1502328660, 0),
(162, 1, 3, 'moodle/course:reset', 1, 1502328660, 0),
(163, 1, 1, 'moodle/course:reset', 1, 1502328660, 0),
(164, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1502328660, 0),
(165, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1502328660, 0),
(166, 1, 1, 'moodle/course:tag', 1, 1502328660, 0),
(167, 1, 3, 'moodle/course:tag', 1, 1502328660, 0),
(168, 1, 6, 'moodle/blog:view', 1, 1502328661, 0),
(169, 1, 7, 'moodle/blog:view', 1, 1502328661, 0),
(170, 1, 5, 'moodle/blog:view', 1, 1502328661, 0),
(171, 1, 4, 'moodle/blog:view', 1, 1502328661, 0),
(172, 1, 3, 'moodle/blog:view', 1, 1502328661, 0),
(173, 1, 1, 'moodle/blog:view', 1, 1502328661, 0),
(174, 1, 6, 'moodle/blog:search', 1, 1502328661, 0),
(175, 1, 7, 'moodle/blog:search', 1, 1502328661, 0),
(176, 1, 5, 'moodle/blog:search', 1, 1502328661, 0),
(177, 1, 4, 'moodle/blog:search', 1, 1502328661, 0),
(178, 1, 3, 'moodle/blog:search', 1, 1502328661, 0),
(179, 1, 1, 'moodle/blog:search', 1, 1502328661, 0),
(180, 1, 1, 'moodle/blog:viewdrafts', 1, 1502328661, 0),
(181, 1, 7, 'moodle/blog:create', 1, 1502328661, 0),
(182, 1, 1, 'moodle/blog:create', 1, 1502328661, 0),
(183, 1, 4, 'moodle/blog:manageentries', 1, 1502328661, 0),
(184, 1, 3, 'moodle/blog:manageentries', 1, 1502328661, 0),
(185, 1, 1, 'moodle/blog:manageentries', 1, 1502328661, 0),
(186, 1, 5, 'moodle/blog:manageexternal', 1, 1502328661, 0),
(187, 1, 7, 'moodle/blog:manageexternal', 1, 1502328661, 0),
(188, 1, 4, 'moodle/blog:manageexternal', 1, 1502328662, 0),
(189, 1, 3, 'moodle/blog:manageexternal', 1, 1502328662, 0),
(190, 1, 1, 'moodle/blog:manageexternal', 1, 1502328662, 0),
(191, 1, 7, 'moodle/calendar:manageownentries', 1, 1502328662, 0),
(192, 1, 1, 'moodle/calendar:manageownentries', 1, 1502328662, 0),
(193, 1, 4, 'moodle/calendar:managegroupentries', 1, 1502328662, 0),
(194, 1, 3, 'moodle/calendar:managegroupentries', 1, 1502328662, 0),
(195, 1, 1, 'moodle/calendar:managegroupentries', 1, 1502328662, 0),
(196, 1, 4, 'moodle/calendar:manageentries', 1, 1502328662, 0),
(197, 1, 3, 'moodle/calendar:manageentries', 1, 1502328662, 0),
(198, 1, 1, 'moodle/calendar:manageentries', 1, 1502328662, 0),
(199, 1, 1, 'moodle/user:editprofile', 1, 1502328662, 0),
(200, 1, 6, 'moodle/user:editownprofile', -1000, 1502328662, 0),
(201, 1, 7, 'moodle/user:editownprofile', 1, 1502328662, 0),
(202, 1, 1, 'moodle/user:editownprofile', 1, 1502328662, 0),
(203, 1, 6, 'moodle/user:changeownpassword', -1000, 1502328662, 0),
(204, 1, 7, 'moodle/user:changeownpassword', 1, 1502328662, 0),
(205, 1, 1, 'moodle/user:changeownpassword', 1, 1502328662, 0),
(206, 1, 5, 'moodle/user:readuserposts', 1, 1502328662, 0),
(207, 1, 4, 'moodle/user:readuserposts', 1, 1502328663, 0),
(208, 1, 3, 'moodle/user:readuserposts', 1, 1502328663, 0),
(209, 1, 1, 'moodle/user:readuserposts', 1, 1502328663, 0),
(210, 1, 5, 'moodle/user:readuserblogs', 1, 1502328663, 0),
(211, 1, 4, 'moodle/user:readuserblogs', 1, 1502328663, 0),
(212, 1, 3, 'moodle/user:readuserblogs', 1, 1502328663, 0),
(213, 1, 1, 'moodle/user:readuserblogs', 1, 1502328663, 0),
(214, 1, 1, 'moodle/user:editmessageprofile', 1, 1502328663, 0),
(215, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1502328663, 0),
(216, 1, 7, 'moodle/user:editownmessageprofile', 1, 1502328663, 0),
(217, 1, 1, 'moodle/user:editownmessageprofile', 1, 1502328663, 0),
(218, 1, 3, 'moodle/question:managecategory', 1, 1502328663, 0),
(219, 1, 1, 'moodle/question:managecategory', 1, 1502328663, 0),
(220, 1, 3, 'moodle/question:add', 1, 1502328663, 0),
(221, 1, 1, 'moodle/question:add', 1, 1502328663, 0),
(222, 1, 3, 'moodle/question:editmine', 1, 1502328663, 0),
(223, 1, 1, 'moodle/question:editmine', 1, 1502328663, 0),
(224, 1, 3, 'moodle/question:editall', 1, 1502328663, 0),
(225, 1, 1, 'moodle/question:editall', 1, 1502328664, 0),
(226, 1, 3, 'moodle/question:viewmine', 1, 1502328664, 0),
(227, 1, 1, 'moodle/question:viewmine', 1, 1502328664, 0),
(228, 1, 3, 'moodle/question:viewall', 1, 1502328664, 0),
(229, 1, 1, 'moodle/question:viewall', 1, 1502328664, 0),
(230, 1, 3, 'moodle/question:usemine', 1, 1502328664, 0),
(231, 1, 1, 'moodle/question:usemine', 1, 1502328664, 0),
(232, 1, 3, 'moodle/question:useall', 1, 1502328664, 0),
(233, 1, 1, 'moodle/question:useall', 1, 1502328664, 0),
(234, 1, 3, 'moodle/question:movemine', 1, 1502328664, 0),
(235, 1, 1, 'moodle/question:movemine', 1, 1502328664, 0),
(236, 1, 3, 'moodle/question:moveall', 1, 1502328664, 0),
(237, 1, 1, 'moodle/question:moveall', 1, 1502328664, 0),
(238, 1, 1, 'moodle/question:config', 1, 1502328664, 0),
(239, 1, 5, 'moodle/question:flag', 1, 1502328664, 0),
(240, 1, 4, 'moodle/question:flag', 1, 1502328664, 0),
(241, 1, 3, 'moodle/question:flag', 1, 1502328664, 0),
(242, 1, 1, 'moodle/question:flag', 1, 1502328664, 0),
(243, 1, 4, 'moodle/site:doclinks', 1, 1502328664, 0),
(244, 1, 3, 'moodle/site:doclinks', 1, 1502328664, 0),
(245, 1, 1, 'moodle/site:doclinks', 1, 1502328665, 0),
(246, 1, 3, 'moodle/course:sectionvisibility', 1, 1502328665, 0),
(247, 1, 1, 'moodle/course:sectionvisibility', 1, 1502328665, 0),
(248, 1, 3, 'moodle/course:useremail', 1, 1502328665, 0),
(249, 1, 1, 'moodle/course:useremail', 1, 1502328665, 0),
(250, 1, 3, 'moodle/course:viewhiddensections', 1, 1502328665, 0),
(251, 1, 1, 'moodle/course:viewhiddensections', 1, 1502328665, 0),
(252, 1, 3, 'moodle/course:setcurrentsection', 1, 1502328665, 0),
(253, 1, 1, 'moodle/course:setcurrentsection', 1, 1502328665, 0),
(254, 1, 3, 'moodle/course:movesections', 1, 1502328665, 0),
(255, 1, 1, 'moodle/course:movesections', 1, 1502328665, 0),
(256, 1, 4, 'moodle/grade:viewall', 1, 1502328665, 0),
(257, 1, 3, 'moodle/grade:viewall', 1, 1502328665, 0),
(258, 1, 1, 'moodle/grade:viewall', 1, 1502328665, 0),
(259, 1, 5, 'moodle/grade:view', 1, 1502328665, 0),
(260, 1, 4, 'moodle/grade:viewhidden', 1, 1502328666, 0),
(261, 1, 3, 'moodle/grade:viewhidden', 1, 1502328666, 0),
(262, 1, 1, 'moodle/grade:viewhidden', 1, 1502328666, 0),
(263, 1, 3, 'moodle/grade:import', 1, 1502328666, 0),
(264, 1, 1, 'moodle/grade:import', 1, 1502328666, 0),
(265, 1, 4, 'moodle/grade:export', 1, 1502328666, 0),
(266, 1, 3, 'moodle/grade:export', 1, 1502328666, 0),
(267, 1, 1, 'moodle/grade:export', 1, 1502328666, 0),
(268, 1, 3, 'moodle/grade:manage', 1, 1502328666, 0),
(269, 1, 1, 'moodle/grade:manage', 1, 1502328666, 0),
(270, 1, 3, 'moodle/grade:edit', 1, 1502328666, 0),
(271, 1, 1, 'moodle/grade:edit', 1, 1502328666, 0),
(272, 1, 3, 'moodle/grade:managegradingforms', 1, 1502328666, 0),
(273, 1, 1, 'moodle/grade:managegradingforms', 1, 1502328666, 0),
(274, 1, 1, 'moodle/grade:sharegradingforms', 1, 1502328666, 0),
(275, 1, 1, 'moodle/grade:managesharedforms', 1, 1502328666, 0),
(276, 1, 3, 'moodle/grade:manageoutcomes', 1, 1502328666, 0),
(277, 1, 1, 'moodle/grade:manageoutcomes', 1, 1502328667, 0),
(278, 1, 3, 'moodle/grade:manageletters', 1, 1502328667, 0),
(279, 1, 1, 'moodle/grade:manageletters', 1, 1502328667, 0),
(280, 1, 3, 'moodle/grade:hide', 1, 1502328667, 0),
(281, 1, 1, 'moodle/grade:hide', 1, 1502328667, 0),
(282, 1, 3, 'moodle/grade:lock', 1, 1502328667, 0),
(283, 1, 1, 'moodle/grade:lock', 1, 1502328667, 0),
(284, 1, 3, 'moodle/grade:unlock', 1, 1502328667, 0),
(285, 1, 1, 'moodle/grade:unlock', 1, 1502328667, 0),
(286, 1, 7, 'moodle/my:manageblocks', 1, 1502328667, 0),
(287, 1, 4, 'moodle/notes:view', 1, 1502328667, 0),
(288, 1, 3, 'moodle/notes:view', 1, 1502328667, 0),
(289, 1, 1, 'moodle/notes:view', 1, 1502328667, 0),
(290, 1, 4, 'moodle/notes:manage', 1, 1502328667, 0),
(291, 1, 3, 'moodle/notes:manage', 1, 1502328667, 0),
(292, 1, 1, 'moodle/notes:manage', 1, 1502328668, 0),
(293, 1, 1, 'moodle/tag:manage', 1, 1502328668, 0),
(294, 1, 1, 'moodle/tag:edit', 1, 1502328668, 0),
(295, 1, 7, 'moodle/tag:flag', 1, 1502328668, 0),
(296, 1, 4, 'moodle/tag:editblocks', 1, 1502328668, 0),
(297, 1, 3, 'moodle/tag:editblocks', 1, 1502328668, 0),
(298, 1, 1, 'moodle/tag:editblocks', 1, 1502328668, 0),
(299, 1, 6, 'moodle/block:view', 1, 1502328668, 0),
(300, 1, 7, 'moodle/block:view', 1, 1502328668, 0),
(301, 1, 5, 'moodle/block:view', 1, 1502328668, 0),
(302, 1, 4, 'moodle/block:view', 1, 1502328668, 0),
(303, 1, 3, 'moodle/block:view', 1, 1502328668, 0),
(304, 1, 3, 'moodle/block:edit', 1, 1502328668, 0),
(305, 1, 1, 'moodle/block:edit', 1, 1502328668, 0),
(306, 1, 7, 'moodle/portfolio:export', 1, 1502328668, 0),
(307, 1, 5, 'moodle/portfolio:export', 1, 1502328668, 0),
(308, 1, 4, 'moodle/portfolio:export', 1, 1502328669, 0),
(309, 1, 3, 'moodle/portfolio:export', 1, 1502328669, 0),
(310, 1, 8, 'moodle/comment:view', 1, 1502328669, 0),
(311, 1, 6, 'moodle/comment:view', 1, 1502328669, 0),
(312, 1, 7, 'moodle/comment:view', 1, 1502328669, 0),
(313, 1, 5, 'moodle/comment:view', 1, 1502328669, 0),
(314, 1, 4, 'moodle/comment:view', 1, 1502328669, 0),
(315, 1, 3, 'moodle/comment:view', 1, 1502328669, 0),
(316, 1, 1, 'moodle/comment:view', 1, 1502328669, 0),
(317, 1, 7, 'moodle/comment:post', 1, 1502328669, 0),
(318, 1, 5, 'moodle/comment:post', 1, 1502328669, 0),
(319, 1, 4, 'moodle/comment:post', 1, 1502328669, 0),
(320, 1, 3, 'moodle/comment:post', 1, 1502328669, 0),
(321, 1, 1, 'moodle/comment:post', 1, 1502328669, 0),
(322, 1, 3, 'moodle/comment:delete', 1, 1502328669, 0),
(323, 1, 1, 'moodle/comment:delete', 1, 1502328669, 0),
(324, 1, 1, 'moodle/webservice:createtoken', 1, 1502328669, 0),
(325, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1502328669, 0),
(326, 1, 7, 'moodle/rating:view', 1, 1502328669, 0),
(327, 1, 5, 'moodle/rating:view', 1, 1502328669, 0),
(328, 1, 4, 'moodle/rating:view', 1, 1502328669, 0),
(329, 1, 3, 'moodle/rating:view', 1, 1502328669, 0),
(330, 1, 1, 'moodle/rating:view', 1, 1502328670, 0),
(331, 1, 7, 'moodle/rating:viewany', 1, 1502328670, 0),
(332, 1, 5, 'moodle/rating:viewany', 1, 1502328670, 0),
(333, 1, 4, 'moodle/rating:viewany', 1, 1502328670, 0),
(334, 1, 3, 'moodle/rating:viewany', 1, 1502328670, 0),
(335, 1, 1, 'moodle/rating:viewany', 1, 1502328670, 0),
(336, 1, 7, 'moodle/rating:viewall', 1, 1502328670, 0),
(337, 1, 5, 'moodle/rating:viewall', 1, 1502328670, 0),
(338, 1, 4, 'moodle/rating:viewall', 1, 1502328670, 0),
(339, 1, 3, 'moodle/rating:viewall', 1, 1502328670, 0),
(340, 1, 1, 'moodle/rating:viewall', 1, 1502328670, 0),
(341, 1, 7, 'moodle/rating:rate', 1, 1502328670, 0),
(342, 1, 5, 'moodle/rating:rate', 1, 1502328670, 0),
(343, 1, 4, 'moodle/rating:rate', 1, 1502328670, 0),
(344, 1, 3, 'moodle/rating:rate', 1, 1502328670, 0),
(345, 1, 1, 'moodle/rating:rate', 1, 1502328670, 0),
(346, 1, 1, 'moodle/course:publish', 1, 1502328670, 0),
(347, 1, 4, 'moodle/course:markcomplete', 1, 1502328670, 0),
(348, 1, 3, 'moodle/course:markcomplete', 1, 1502328671, 0),
(349, 1, 1, 'moodle/course:markcomplete', 1, 1502328671, 0),
(350, 1, 1, 'moodle/community:add', 1, 1502328671, 0),
(351, 1, 4, 'moodle/community:add', 1, 1502328671, 0),
(352, 1, 3, 'moodle/community:add', 1, 1502328671, 0),
(353, 1, 1, 'moodle/community:download', 1, 1502328671, 0),
(354, 1, 3, 'moodle/community:download', 1, 1502328671, 0),
(355, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1502328671, 0),
(356, 1, 7, 'moodle/badges:viewbadges', 1, 1502328671, 0),
(357, 1, 7, 'moodle/badges:manageownbadges', 1, 1502328671, 0),
(358, 1, 7, 'moodle/badges:viewotherbadges', 1, 1502328671, 0),
(359, 1, 7, 'moodle/badges:earnbadge', 1, 1502328671, 0),
(360, 1, 1, 'moodle/badges:createbadge', 1, 1502328671, 0),
(361, 1, 3, 'moodle/badges:createbadge', 1, 1502328671, 0),
(362, 1, 1, 'moodle/badges:deletebadge', 1, 1502328672, 0),
(363, 1, 3, 'moodle/badges:deletebadge', 1, 1502328672, 0),
(364, 1, 1, 'moodle/badges:configuredetails', 1, 1502328672, 0),
(365, 1, 3, 'moodle/badges:configuredetails', 1, 1502328672, 0),
(366, 1, 1, 'moodle/badges:configurecriteria', 1, 1502328672, 0),
(367, 1, 3, 'moodle/badges:configurecriteria', 1, 1502328672, 0),
(368, 1, 1, 'moodle/badges:configuremessages', 1, 1502328672, 0),
(369, 1, 3, 'moodle/badges:configuremessages', 1, 1502328672, 0),
(370, 1, 1, 'moodle/badges:awardbadge', 1, 1502328672, 0),
(371, 1, 4, 'moodle/badges:awardbadge', 1, 1502328672, 0),
(372, 1, 3, 'moodle/badges:awardbadge', 1, 1502328672, 0),
(373, 1, 1, 'moodle/badges:revokebadge', 1, 1502328672, 0),
(374, 1, 4, 'moodle/badges:revokebadge', 1, 1502328672, 0),
(375, 1, 3, 'moodle/badges:revokebadge', 1, 1502328672, 0),
(376, 1, 1, 'moodle/badges:viewawarded', 1, 1502328672, 0),
(377, 1, 4, 'moodle/badges:viewawarded', 1, 1502328672, 0),
(378, 1, 3, 'moodle/badges:viewawarded', 1, 1502328672, 0),
(379, 1, 6, 'moodle/search:query', 1, 1502328672, 0),
(380, 1, 7, 'moodle/search:query', 1, 1502328672, 0),
(381, 1, 5, 'moodle/search:query', 1, 1502328672, 0),
(382, 1, 4, 'moodle/search:query', 1, 1502328673, 0),
(383, 1, 3, 'moodle/search:query', 1, 1502328673, 0),
(384, 1, 1, 'moodle/search:query', 1, 1502328673, 0),
(385, 1, 1, 'moodle/competency:competencymanage', 1, 1502328673, 0),
(386, 1, 7, 'moodle/competency:competencyview', 1, 1502328673, 0),
(387, 1, 3, 'moodle/competency:competencygrade', 1, 1502328673, 0),
(388, 1, 4, 'moodle/competency:competencygrade', 1, 1502328673, 0),
(389, 1, 1, 'moodle/competency:competencygrade', 1, 1502328673, 0),
(390, 1, 3, 'moodle/competency:coursecompetencymanage', 1, 1502328673, 0),
(391, 1, 1, 'moodle/competency:coursecompetencymanage', 1, 1502328673, 0),
(392, 1, 1, 'moodle/competency:coursecompetencyconfigure', 1, 1502328673, 0),
(393, 1, 5, 'moodle/competency:coursecompetencygradable', 1, 1502328673, 0),
(394, 1, 7, 'moodle/competency:coursecompetencyview', 1, 1502328673, 0),
(395, 1, 1, 'moodle/competency:planmanage', 1, 1502328673, 0),
(396, 1, 1, 'moodle/competency:planmanagedraft', 1, 1502328673, 0),
(397, 1, 1, 'moodle/competency:planview', 1, 1502328673, 0),
(398, 1, 1, 'moodle/competency:planviewdraft', 1, 1502328673, 0),
(399, 1, 7, 'moodle/competency:planviewown', 1, 1502328673, 0),
(400, 1, 1, 'moodle/competency:planrequestreview', 1, 1502328673, 0),
(401, 1, 7, 'moodle/competency:planrequestreviewown', 1, 1502328673, 0),
(402, 1, 1, 'moodle/competency:planreview', 1, 1502328674, 0),
(403, 1, 1, 'moodle/competency:plancomment', 1, 1502328674, 0),
(404, 1, 7, 'moodle/competency:plancommentown', 1, 1502328674, 0),
(405, 1, 1, 'moodle/competency:usercompetencyview', 1, 1502328674, 0),
(406, 1, 3, 'moodle/competency:usercompetencyview', 1, 1502328674, 0),
(407, 1, 4, 'moodle/competency:usercompetencyview', 1, 1502328674, 0),
(408, 1, 1, 'moodle/competency:usercompetencyrequestreview', 1, 1502328674, 0),
(409, 1, 7, 'moodle/competency:usercompetencyrequestreviewown', 1, 1502328674, 0),
(410, 1, 1, 'moodle/competency:usercompetencyreview', 1, 1502328674, 0),
(411, 1, 1, 'moodle/competency:usercompetencycomment', 1, 1502328674, 0),
(412, 1, 7, 'moodle/competency:usercompetencycommentown', 1, 1502328674, 0),
(413, 1, 1, 'moodle/competency:templatemanage', 1, 1502328674, 0),
(414, 1, 4, 'moodle/analytics:listinsights', 1, 1502328674, 0),
(415, 1, 3, 'moodle/analytics:listinsights', 1, 1502328674, 0),
(416, 1, 1, 'moodle/analytics:listinsights', 1, 1502328674, 0),
(417, 1, 1, 'moodle/analytics:managemodels', 1, 1502328675, 0),
(418, 1, 1, 'moodle/competency:templateview', 1, 1502328675, 0),
(419, 1, 1, 'moodle/competency:userevidencemanage', 1, 1502328675, 0),
(420, 1, 7, 'moodle/competency:userevidencemanageown', 1, 1502328675, 0),
(421, 1, 1, 'moodle/competency:userevidenceview', 1, 1502328675, 0),
(422, 1, 6, 'mod/assign:view', 1, 1502328792, 0),
(423, 1, 5, 'mod/assign:view', 1, 1502328792, 0),
(424, 1, 4, 'mod/assign:view', 1, 1502328793, 0),
(425, 1, 3, 'mod/assign:view', 1, 1502328793, 0),
(426, 1, 1, 'mod/assign:view', 1, 1502328793, 0),
(427, 1, 5, 'mod/assign:submit', 1, 1502328793, 0),
(428, 1, 4, 'mod/assign:grade', 1, 1502328793, 0),
(429, 1, 3, 'mod/assign:grade', 1, 1502328793, 0),
(430, 1, 1, 'mod/assign:grade', 1, 1502328793, 0),
(431, 1, 4, 'mod/assign:exportownsubmission', 1, 1502328793, 0),
(432, 1, 3, 'mod/assign:exportownsubmission', 1, 1502328793, 0),
(433, 1, 1, 'mod/assign:exportownsubmission', 1, 1502328793, 0),
(434, 1, 5, 'mod/assign:exportownsubmission', 1, 1502328793, 0),
(435, 1, 3, 'mod/assign:addinstance', 1, 1502328794, 0),
(436, 1, 1, 'mod/assign:addinstance', 1, 1502328794, 0),
(437, 1, 4, 'mod/assign:grantextension', 1, 1502328794, 0),
(438, 1, 3, 'mod/assign:grantextension', 1, 1502328794, 0),
(439, 1, 1, 'mod/assign:grantextension', 1, 1502328794, 0),
(440, 1, 3, 'mod/assign:revealidentities', 1, 1502328794, 0),
(441, 1, 1, 'mod/assign:revealidentities', 1, 1502328794, 0),
(442, 1, 3, 'mod/assign:reviewgrades', 1, 1502328794, 0),
(443, 1, 1, 'mod/assign:reviewgrades', 1, 1502328794, 0),
(444, 1, 3, 'mod/assign:releasegrades', 1, 1502328794, 0),
(445, 1, 1, 'mod/assign:releasegrades', 1, 1502328794, 0),
(446, 1, 3, 'mod/assign:managegrades', 1, 1502328794, 0),
(447, 1, 1, 'mod/assign:managegrades', 1, 1502328794, 0),
(448, 1, 3, 'mod/assign:manageallocations', 1, 1502328794, 0),
(449, 1, 1, 'mod/assign:manageallocations', 1, 1502328794, 0),
(450, 1, 3, 'mod/assign:viewgrades', 1, 1502328794, 0),
(451, 1, 1, 'mod/assign:viewgrades', 1, 1502328795, 0),
(452, 1, 4, 'mod/assign:viewgrades', 1, 1502328795, 0),
(453, 1, 1, 'mod/assign:viewblinddetails', 1, 1502328795, 0),
(454, 1, 4, 'mod/assign:receivegradernotifications', 1, 1502328795, 0),
(455, 1, 3, 'mod/assign:receivegradernotifications', 1, 1502328795, 0),
(456, 1, 1, 'mod/assign:receivegradernotifications', 1, 1502328795, 0),
(457, 1, 3, 'mod/assign:manageoverrides', 1, 1502328795, 0),
(458, 1, 1, 'mod/assign:manageoverrides', 1, 1502328795, 0),
(459, 1, 6, 'mod/assignment:view', 1, 1502328800, 0),
(460, 1, 5, 'mod/assignment:view', 1, 1502328800, 0),
(461, 1, 4, 'mod/assignment:view', 1, 1502328800, 0),
(462, 1, 3, 'mod/assignment:view', 1, 1502328800, 0),
(463, 1, 1, 'mod/assignment:view', 1, 1502328800, 0),
(464, 1, 3, 'mod/assignment:addinstance', 1, 1502328800, 0),
(465, 1, 1, 'mod/assignment:addinstance', 1, 1502328800, 0),
(466, 1, 5, 'mod/assignment:submit', 1, 1502328800, 0),
(467, 1, 4, 'mod/assignment:grade', 1, 1502328800, 0),
(468, 1, 3, 'mod/assignment:grade', 1, 1502328800, 0),
(469, 1, 1, 'mod/assignment:grade', 1, 1502328800, 0),
(470, 1, 4, 'mod/assignment:exportownsubmission', 1, 1502328801, 0),
(471, 1, 3, 'mod/assignment:exportownsubmission', 1, 1502328801, 0),
(472, 1, 1, 'mod/assignment:exportownsubmission', 1, 1502328801, 0),
(473, 1, 5, 'mod/assignment:exportownsubmission', 1, 1502328801, 0),
(474, 1, 3, 'mod/book:addinstance', 1, 1502328802, 0),
(475, 1, 1, 'mod/book:addinstance', 1, 1502328802, 0),
(476, 1, 6, 'mod/book:read', 1, 1502328803, 0),
(477, 1, 8, 'mod/book:read', 1, 1502328803, 0),
(478, 1, 5, 'mod/book:read', 1, 1502328803, 0),
(479, 1, 4, 'mod/book:read', 1, 1502328803, 0),
(480, 1, 3, 'mod/book:read', 1, 1502328803, 0),
(481, 1, 1, 'mod/book:read', 1, 1502328803, 0),
(482, 1, 4, 'mod/book:viewhiddenchapters', 1, 1502328803, 0),
(483, 1, 3, 'mod/book:viewhiddenchapters', 1, 1502328803, 0),
(484, 1, 1, 'mod/book:viewhiddenchapters', 1, 1502328803, 0),
(485, 1, 3, 'mod/book:edit', 1, 1502328803, 0),
(486, 1, 1, 'mod/book:edit', 1, 1502328803, 0),
(487, 1, 3, 'mod/chat:addinstance', 1, 1502328806, 0),
(488, 1, 1, 'mod/chat:addinstance', 1, 1502328806, 0),
(489, 1, 5, 'mod/chat:chat', 1, 1502328806, 0),
(490, 1, 4, 'mod/chat:chat', 1, 1502328806, 0),
(491, 1, 3, 'mod/chat:chat', 1, 1502328806, 0),
(492, 1, 1, 'mod/chat:chat', 1, 1502328806, 0),
(493, 1, 5, 'mod/chat:readlog', 1, 1502328807, 0),
(494, 1, 4, 'mod/chat:readlog', 1, 1502328807, 0),
(495, 1, 3, 'mod/chat:readlog', 1, 1502328807, 0),
(496, 1, 1, 'mod/chat:readlog', 1, 1502328807, 0),
(497, 1, 4, 'mod/chat:deletelog', 1, 1502328807, 0),
(498, 1, 3, 'mod/chat:deletelog', 1, 1502328807, 0),
(499, 1, 1, 'mod/chat:deletelog', 1, 1502328807, 0),
(500, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1502328807, 0),
(501, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1502328807, 0),
(502, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1502328807, 0),
(503, 1, 4, 'mod/chat:exportsession', 1, 1502328807, 0),
(504, 1, 3, 'mod/chat:exportsession', 1, 1502328807, 0),
(505, 1, 1, 'mod/chat:exportsession', 1, 1502328807, 0),
(506, 1, 7, 'mod/chat:view', 1, 1502328807, 0),
(507, 1, 6, 'mod/chat:view', 1, 1502328807, 0),
(508, 1, 3, 'mod/choice:addinstance', 1, 1502328809, 0),
(509, 1, 1, 'mod/choice:addinstance', 1, 1502328809, 0),
(510, 1, 5, 'mod/choice:choose', 1, 1502328809, 0),
(511, 1, 4, 'mod/choice:choose', 1, 1502328810, 0),
(512, 1, 3, 'mod/choice:choose', 1, 1502328810, 0),
(513, 1, 4, 'mod/choice:readresponses', 1, 1502328810, 0),
(514, 1, 3, 'mod/choice:readresponses', 1, 1502328810, 0),
(515, 1, 1, 'mod/choice:readresponses', 1, 1502328810, 0),
(516, 1, 4, 'mod/choice:deleteresponses', 1, 1502328810, 0),
(517, 1, 3, 'mod/choice:deleteresponses', 1, 1502328810, 0),
(518, 1, 1, 'mod/choice:deleteresponses', 1, 1502328810, 0),
(519, 1, 4, 'mod/choice:downloadresponses', 1, 1502328810, 0),
(520, 1, 3, 'mod/choice:downloadresponses', 1, 1502328810, 0),
(521, 1, 1, 'mod/choice:downloadresponses', 1, 1502328810, 0),
(522, 1, 7, 'mod/choice:view', 1, 1502328810, 0),
(523, 1, 6, 'mod/choice:view', 1, 1502328810, 0),
(524, 1, 3, 'mod/data:addinstance', 1, 1502328813, 0),
(525, 1, 1, 'mod/data:addinstance', 1, 1502328814, 0),
(526, 1, 8, 'mod/data:viewentry', 1, 1502328814, 0),
(527, 1, 6, 'mod/data:viewentry', 1, 1502328814, 0),
(528, 1, 5, 'mod/data:viewentry', 1, 1502328814, 0),
(529, 1, 4, 'mod/data:viewentry', 1, 1502328814, 0),
(530, 1, 3, 'mod/data:viewentry', 1, 1502328814, 0),
(531, 1, 1, 'mod/data:viewentry', 1, 1502328814, 0),
(532, 1, 5, 'mod/data:writeentry', 1, 1502328814, 0),
(533, 1, 4, 'mod/data:writeentry', 1, 1502328814, 0),
(534, 1, 3, 'mod/data:writeentry', 1, 1502328814, 0),
(535, 1, 1, 'mod/data:writeentry', 1, 1502328815, 0),
(536, 1, 5, 'mod/data:comment', 1, 1502328815, 0),
(537, 1, 4, 'mod/data:comment', 1, 1502328815, 0),
(538, 1, 3, 'mod/data:comment', 1, 1502328815, 0),
(539, 1, 1, 'mod/data:comment', 1, 1502328815, 0),
(540, 1, 4, 'mod/data:rate', 1, 1502328815, 0),
(541, 1, 3, 'mod/data:rate', 1, 1502328815, 0),
(542, 1, 1, 'mod/data:rate', 1, 1502328815, 0),
(543, 1, 4, 'mod/data:viewrating', 1, 1502328815, 0),
(544, 1, 3, 'mod/data:viewrating', 1, 1502328815, 0),
(545, 1, 1, 'mod/data:viewrating', 1, 1502328815, 0),
(546, 1, 4, 'mod/data:viewanyrating', 1, 1502328815, 0),
(547, 1, 3, 'mod/data:viewanyrating', 1, 1502328815, 0),
(548, 1, 1, 'mod/data:viewanyrating', 1, 1502328815, 0),
(549, 1, 4, 'mod/data:viewallratings', 1, 1502328815, 0),
(550, 1, 3, 'mod/data:viewallratings', 1, 1502328815, 0),
(551, 1, 1, 'mod/data:viewallratings', 1, 1502328815, 0),
(552, 1, 4, 'mod/data:approve', 1, 1502328816, 0),
(553, 1, 3, 'mod/data:approve', 1, 1502328816, 0),
(554, 1, 1, 'mod/data:approve', 1, 1502328816, 0),
(555, 1, 4, 'mod/data:manageentries', 1, 1502328816, 0),
(556, 1, 3, 'mod/data:manageentries', 1, 1502328816, 0),
(557, 1, 1, 'mod/data:manageentries', 1, 1502328816, 0),
(558, 1, 4, 'mod/data:managecomments', 1, 1502328816, 0),
(559, 1, 3, 'mod/data:managecomments', 1, 1502328816, 0),
(560, 1, 1, 'mod/data:managecomments', 1, 1502328816, 0),
(561, 1, 3, 'mod/data:managetemplates', 1, 1502328816, 0),
(562, 1, 1, 'mod/data:managetemplates', 1, 1502328816, 0),
(563, 1, 4, 'mod/data:viewalluserpresets', 1, 1502328816, 0),
(564, 1, 3, 'mod/data:viewalluserpresets', 1, 1502328816, 0),
(565, 1, 1, 'mod/data:viewalluserpresets', 1, 1502328816, 0),
(566, 1, 1, 'mod/data:manageuserpresets', 1, 1502328816, 0),
(567, 1, 1, 'mod/data:exportentry', 1, 1502328816, 0),
(568, 1, 4, 'mod/data:exportentry', 1, 1502328816, 0),
(569, 1, 3, 'mod/data:exportentry', 1, 1502328816, 0),
(570, 1, 1, 'mod/data:exportownentry', 1, 1502328817, 0),
(571, 1, 4, 'mod/data:exportownentry', 1, 1502328817, 0),
(572, 1, 3, 'mod/data:exportownentry', 1, 1502328817, 0),
(573, 1, 5, 'mod/data:exportownentry', 1, 1502328817, 0),
(574, 1, 1, 'mod/data:exportallentries', 1, 1502328817, 0),
(575, 1, 4, 'mod/data:exportallentries', 1, 1502328817, 0),
(576, 1, 3, 'mod/data:exportallentries', 1, 1502328817, 0),
(577, 1, 1, 'mod/data:exportuserinfo', 1, 1502328817, 0),
(578, 1, 4, 'mod/data:exportuserinfo', 1, 1502328817, 0),
(579, 1, 3, 'mod/data:exportuserinfo', 1, 1502328817, 0),
(580, 1, 6, 'mod/data:view', 1, 1502328817, 0),
(581, 1, 5, 'mod/data:view', 1, 1502328817, 0),
(582, 1, 4, 'mod/data:view', 1, 1502328817, 0),
(583, 1, 3, 'mod/data:view', 1, 1502328817, 0),
(584, 1, 1, 'mod/data:view', 1, 1502328817, 0),
(585, 1, 3, 'mod/feedback:addinstance', 1, 1502328822, 0),
(586, 1, 1, 'mod/feedback:addinstance', 1, 1502328822, 0),
(587, 1, 6, 'mod/feedback:view', 1, 1502328822, 0),
(588, 1, 8, 'mod/feedback:view', 1, 1502328822, 0),
(589, 1, 5, 'mod/feedback:view', 1, 1502328822, 0),
(590, 1, 4, 'mod/feedback:view', 1, 1502328822, 0),
(591, 1, 3, 'mod/feedback:view', 1, 1502328822, 0),
(592, 1, 1, 'mod/feedback:view', 1, 1502328823, 0),
(593, 1, 8, 'mod/feedback:complete', 1, 1502328823, 0),
(594, 1, 5, 'mod/feedback:complete', 1, 1502328823, 0),
(595, 1, 5, 'mod/feedback:viewanalysepage', 1, 1502328823, 0),
(596, 1, 3, 'mod/feedback:viewanalysepage', 1, 1502328823, 0),
(597, 1, 1, 'mod/feedback:viewanalysepage', 1, 1502328823, 0),
(598, 1, 3, 'mod/feedback:deletesubmissions', 1, 1502328823, 0),
(599, 1, 1, 'mod/feedback:deletesubmissions', 1, 1502328823, 0),
(600, 1, 1, 'mod/feedback:mapcourse', 1, 1502328823, 0),
(601, 1, 3, 'mod/feedback:edititems', 1, 1502328823, 0),
(602, 1, 1, 'mod/feedback:edititems', 1, 1502328823, 0),
(603, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1502328823, 0),
(604, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1502328823, 0),
(605, 1, 3, 'mod/feedback:createpublictemplate', 1, 1502328823, 0),
(606, 1, 1, 'mod/feedback:createpublictemplate', 1, 1502328823, 0),
(607, 1, 3, 'mod/feedback:deletetemplate', 1, 1502328824, 0),
(608, 1, 1, 'mod/feedback:deletetemplate', 1, 1502328824, 0),
(609, 1, 4, 'mod/feedback:viewreports', 1, 1502328824, 0),
(610, 1, 3, 'mod/feedback:viewreports', 1, 1502328824, 0),
(611, 1, 1, 'mod/feedback:viewreports', 1, 1502328824, 0),
(612, 1, 4, 'mod/feedback:receivemail', 1, 1502328824, 0),
(613, 1, 3, 'mod/feedback:receivemail', 1, 1502328824, 0),
(614, 1, 3, 'mod/folder:addinstance', 1, 1502328826, 0),
(615, 1, 1, 'mod/folder:addinstance', 1, 1502328826, 0),
(616, 1, 6, 'mod/folder:view', 1, 1502328826, 0),
(617, 1, 7, 'mod/folder:view', 1, 1502328826, 0),
(618, 1, 3, 'mod/folder:managefiles', 1, 1502328826, 0),
(619, 1, 3, 'mod/forum:addinstance', 1, 1502328831, 0),
(620, 1, 1, 'mod/forum:addinstance', 1, 1502328831, 0),
(621, 1, 8, 'mod/forum:viewdiscussion', 1, 1502328831, 0),
(622, 1, 6, 'mod/forum:viewdiscussion', 1, 1502328831, 0),
(623, 1, 5, 'mod/forum:viewdiscussion', 1, 1502328831, 0),
(624, 1, 4, 'mod/forum:viewdiscussion', 1, 1502328832, 0),
(625, 1, 3, 'mod/forum:viewdiscussion', 1, 1502328832, 0),
(626, 1, 1, 'mod/forum:viewdiscussion', 1, 1502328832, 0),
(627, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1502328832, 0),
(628, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1502328832, 0),
(629, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1502328832, 0),
(630, 1, 5, 'mod/forum:startdiscussion', 1, 1502328832, 0),
(631, 1, 4, 'mod/forum:startdiscussion', 1, 1502328832, 0),
(632, 1, 3, 'mod/forum:startdiscussion', 1, 1502328832, 0),
(633, 1, 1, 'mod/forum:startdiscussion', 1, 1502328832, 0),
(634, 1, 5, 'mod/forum:replypost', 1, 1502328832, 0),
(635, 1, 4, 'mod/forum:replypost', 1, 1502328832, 0),
(636, 1, 3, 'mod/forum:replypost', 1, 1502328833, 0),
(637, 1, 1, 'mod/forum:replypost', 1, 1502328833, 0),
(638, 1, 4, 'mod/forum:addnews', 1, 1502328833, 0),
(639, 1, 3, 'mod/forum:addnews', 1, 1502328833, 0),
(640, 1, 1, 'mod/forum:addnews', 1, 1502328833, 0),
(641, 1, 4, 'mod/forum:replynews', 1, 1502328833, 0),
(642, 1, 3, 'mod/forum:replynews', 1, 1502328833, 0),
(643, 1, 1, 'mod/forum:replynews', 1, 1502328833, 0),
(644, 1, 5, 'mod/forum:viewrating', 1, 1502328833, 0),
(645, 1, 4, 'mod/forum:viewrating', 1, 1502328833, 0),
(646, 1, 3, 'mod/forum:viewrating', 1, 1502328833, 0),
(647, 1, 1, 'mod/forum:viewrating', 1, 1502328833, 0),
(648, 1, 4, 'mod/forum:viewanyrating', 1, 1502328833, 0),
(649, 1, 3, 'mod/forum:viewanyrating', 1, 1502328833, 0),
(650, 1, 1, 'mod/forum:viewanyrating', 1, 1502328833, 0),
(651, 1, 4, 'mod/forum:viewallratings', 1, 1502328833, 0),
(652, 1, 3, 'mod/forum:viewallratings', 1, 1502328834, 0),
(653, 1, 1, 'mod/forum:viewallratings', 1, 1502328834, 0),
(654, 1, 4, 'mod/forum:rate', 1, 1502328834, 0),
(655, 1, 3, 'mod/forum:rate', 1, 1502328834, 0),
(656, 1, 1, 'mod/forum:rate', 1, 1502328834, 0),
(657, 1, 5, 'mod/forum:createattachment', 1, 1502328834, 0),
(658, 1, 4, 'mod/forum:createattachment', 1, 1502328834, 0),
(659, 1, 3, 'mod/forum:createattachment', 1, 1502328834, 0),
(660, 1, 1, 'mod/forum:createattachment', 1, 1502328834, 0),
(661, 1, 5, 'mod/forum:deleteownpost', 1, 1502328834, 0),
(662, 1, 4, 'mod/forum:deleteownpost', 1, 1502328834, 0),
(663, 1, 3, 'mod/forum:deleteownpost', 1, 1502328834, 0),
(664, 1, 1, 'mod/forum:deleteownpost', 1, 1502328834, 0),
(665, 1, 4, 'mod/forum:deleteanypost', 1, 1502328834, 0),
(666, 1, 3, 'mod/forum:deleteanypost', 1, 1502328834, 0),
(667, 1, 1, 'mod/forum:deleteanypost', 1, 1502328834, 0),
(668, 1, 4, 'mod/forum:splitdiscussions', 1, 1502328834, 0),
(669, 1, 3, 'mod/forum:splitdiscussions', 1, 1502328834, 0),
(670, 1, 1, 'mod/forum:splitdiscussions', 1, 1502328834, 0),
(671, 1, 4, 'mod/forum:movediscussions', 1, 1502328835, 0),
(672, 1, 3, 'mod/forum:movediscussions', 1, 1502328835, 0),
(673, 1, 1, 'mod/forum:movediscussions', 1, 1502328835, 0),
(674, 1, 4, 'mod/forum:pindiscussions', 1, 1502328835, 0),
(675, 1, 3, 'mod/forum:pindiscussions', 1, 1502328835, 0),
(676, 1, 1, 'mod/forum:pindiscussions', 1, 1502328835, 0),
(677, 1, 4, 'mod/forum:editanypost', 1, 1502328835, 0),
(678, 1, 3, 'mod/forum:editanypost', 1, 1502328835, 0),
(679, 1, 1, 'mod/forum:editanypost', 1, 1502328835, 0),
(680, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1502328835, 0),
(681, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1502328835, 0),
(682, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1502328835, 0),
(683, 1, 4, 'mod/forum:viewsubscribers', 1, 1502328835, 0),
(684, 1, 3, 'mod/forum:viewsubscribers', 1, 1502328835, 0),
(685, 1, 1, 'mod/forum:viewsubscribers', 1, 1502328835, 0),
(686, 1, 4, 'mod/forum:managesubscriptions', 1, 1502328835, 0),
(687, 1, 3, 'mod/forum:managesubscriptions', 1, 1502328836, 0),
(688, 1, 1, 'mod/forum:managesubscriptions', 1, 1502328836, 0),
(689, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1502328836, 0),
(690, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1502328836, 0),
(691, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1502328836, 0),
(692, 1, 4, 'mod/forum:exportdiscussion', 1, 1502328836, 0),
(693, 1, 3, 'mod/forum:exportdiscussion', 1, 1502328836, 0),
(694, 1, 1, 'mod/forum:exportdiscussion', 1, 1502328836, 0),
(695, 1, 4, 'mod/forum:exportpost', 1, 1502328836, 0),
(696, 1, 3, 'mod/forum:exportpost', 1, 1502328836, 0),
(697, 1, 1, 'mod/forum:exportpost', 1, 1502328836, 0),
(698, 1, 4, 'mod/forum:exportownpost', 1, 1502328836, 0),
(699, 1, 3, 'mod/forum:exportownpost', 1, 1502328836, 0),
(700, 1, 1, 'mod/forum:exportownpost', 1, 1502328836, 0),
(701, 1, 5, 'mod/forum:exportownpost', 1, 1502328836, 0),
(702, 1, 4, 'mod/forum:addquestion', 1, 1502328836, 0),
(703, 1, 3, 'mod/forum:addquestion', 1, 1502328836, 0),
(704, 1, 1, 'mod/forum:addquestion', 1, 1502328836, 0),
(705, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1502328837, 0),
(706, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1502328837, 0),
(707, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1502328837, 0),
(708, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1502328837, 0),
(709, 1, 4, 'mod/forum:canposttomygroups', 1, 1502328837, 0),
(710, 1, 3, 'mod/forum:canposttomygroups', 1, 1502328837, 0),
(711, 1, 1, 'mod/forum:canposttomygroups', 1, 1502328837, 0),
(712, 1, 4, 'mod/forum:canoverridediscussionlock', 1, 1502328837, 0),
(713, 1, 3, 'mod/forum:canoverridediscussionlock', 1, 1502328837, 0),
(714, 1, 1, 'mod/forum:canoverridediscussionlock', 1, 1502328837, 0),
(715, 1, 3, 'mod/glossary:addinstance', 1, 1502328842, 0),
(716, 1, 1, 'mod/glossary:addinstance', 1, 1502328842, 0),
(717, 1, 8, 'mod/glossary:view', 1, 1502328842, 0),
(718, 1, 6, 'mod/glossary:view', 1, 1502328842, 0),
(719, 1, 5, 'mod/glossary:view', 1, 1502328842, 0),
(720, 1, 4, 'mod/glossary:view', 1, 1502328843, 0),
(721, 1, 3, 'mod/glossary:view', 1, 1502328843, 0),
(722, 1, 1, 'mod/glossary:view', 1, 1502328843, 0),
(723, 1, 5, 'mod/glossary:write', 1, 1502328843, 0),
(724, 1, 4, 'mod/glossary:write', 1, 1502328843, 0),
(725, 1, 3, 'mod/glossary:write', 1, 1502328843, 0),
(726, 1, 1, 'mod/glossary:write', 1, 1502328843, 0),
(727, 1, 4, 'mod/glossary:manageentries', 1, 1502328843, 0),
(728, 1, 3, 'mod/glossary:manageentries', 1, 1502328843, 0),
(729, 1, 1, 'mod/glossary:manageentries', 1, 1502328843, 0),
(730, 1, 4, 'mod/glossary:managecategories', 1, 1502328843, 0),
(731, 1, 3, 'mod/glossary:managecategories', 1, 1502328843, 0),
(732, 1, 1, 'mod/glossary:managecategories', 1, 1502328843, 0),
(733, 1, 5, 'mod/glossary:comment', 1, 1502328843, 0),
(734, 1, 4, 'mod/glossary:comment', 1, 1502328843, 0),
(735, 1, 3, 'mod/glossary:comment', 1, 1502328843, 0),
(736, 1, 1, 'mod/glossary:comment', 1, 1502328843, 0),
(737, 1, 4, 'mod/glossary:managecomments', 1, 1502328843, 0),
(738, 1, 3, 'mod/glossary:managecomments', 1, 1502328843, 0),
(739, 1, 1, 'mod/glossary:managecomments', 1, 1502328843, 0),
(740, 1, 4, 'mod/glossary:import', 1, 1502328844, 0),
(741, 1, 3, 'mod/glossary:import', 1, 1502328844, 0),
(742, 1, 1, 'mod/glossary:import', 1, 1502328844, 0),
(743, 1, 4, 'mod/glossary:export', 1, 1502328844, 0),
(744, 1, 3, 'mod/glossary:export', 1, 1502328844, 0),
(745, 1, 1, 'mod/glossary:export', 1, 1502328844, 0),
(746, 1, 4, 'mod/glossary:approve', 1, 1502328844, 0),
(747, 1, 3, 'mod/glossary:approve', 1, 1502328844, 0),
(748, 1, 1, 'mod/glossary:approve', 1, 1502328844, 0),
(749, 1, 4, 'mod/glossary:rate', 1, 1502328844, 0),
(750, 1, 3, 'mod/glossary:rate', 1, 1502328844, 0),
(751, 1, 1, 'mod/glossary:rate', 1, 1502328844, 0),
(752, 1, 4, 'mod/glossary:viewrating', 1, 1502328844, 0),
(753, 1, 3, 'mod/glossary:viewrating', 1, 1502328844, 0),
(754, 1, 1, 'mod/glossary:viewrating', 1, 1502328844, 0),
(755, 1, 4, 'mod/glossary:viewanyrating', 1, 1502328844, 0),
(756, 1, 3, 'mod/glossary:viewanyrating', 1, 1502328844, 0),
(757, 1, 1, 'mod/glossary:viewanyrating', 1, 1502328844, 0),
(758, 1, 4, 'mod/glossary:viewallratings', 1, 1502328845, 0),
(759, 1, 3, 'mod/glossary:viewallratings', 1, 1502328845, 0),
(760, 1, 1, 'mod/glossary:viewallratings', 1, 1502328845, 0),
(761, 1, 4, 'mod/glossary:exportentry', 1, 1502328845, 0),
(762, 1, 3, 'mod/glossary:exportentry', 1, 1502328845, 0),
(763, 1, 1, 'mod/glossary:exportentry', 1, 1502328845, 0),
(764, 1, 4, 'mod/glossary:exportownentry', 1, 1502328845, 0),
(765, 1, 3, 'mod/glossary:exportownentry', 1, 1502328845, 0),
(766, 1, 1, 'mod/glossary:exportownentry', 1, 1502328845, 0),
(767, 1, 5, 'mod/glossary:exportownentry', 1, 1502328845, 0),
(768, 1, 6, 'mod/imscp:view', 1, 1502328847, 0),
(769, 1, 7, 'mod/imscp:view', 1, 1502328847, 0),
(770, 1, 3, 'mod/imscp:addinstance', 1, 1502328848, 0),
(771, 1, 1, 'mod/imscp:addinstance', 1, 1502328848, 0),
(772, 1, 3, 'mod/label:addinstance', 1, 1502328849, 0),
(773, 1, 1, 'mod/label:addinstance', 1, 1502328849, 0),
(774, 1, 7, 'mod/label:view', 1, 1502328849, 0),
(775, 1, 6, 'mod/label:view', 1, 1502328849, 0),
(776, 1, 3, 'mod/lesson:addinstance', 1, 1502328854, 0),
(777, 1, 1, 'mod/lesson:addinstance', 1, 1502328854, 0),
(778, 1, 3, 'mod/lesson:edit', 1, 1502328855, 0),
(779, 1, 1, 'mod/lesson:edit', 1, 1502328855, 0),
(780, 1, 4, 'mod/lesson:grade', 1, 1502328855, 0),
(781, 1, 3, 'mod/lesson:grade', 1, 1502328855, 0),
(782, 1, 1, 'mod/lesson:grade', 1, 1502328855, 0),
(783, 1, 4, 'mod/lesson:viewreports', 1, 1502328855, 0),
(784, 1, 3, 'mod/lesson:viewreports', 1, 1502328855, 0),
(785, 1, 1, 'mod/lesson:viewreports', 1, 1502328855, 0),
(786, 1, 4, 'mod/lesson:manage', 1, 1502328855, 0),
(787, 1, 3, 'mod/lesson:manage', 1, 1502328855, 0),
(788, 1, 1, 'mod/lesson:manage', 1, 1502328855, 0),
(789, 1, 3, 'mod/lesson:manageoverrides', 1, 1502328856, 0),
(790, 1, 1, 'mod/lesson:manageoverrides', 1, 1502328856, 0),
(791, 1, 7, 'mod/lesson:view', 1, 1502328856, 0),
(792, 1, 6, 'mod/lesson:view', 1, 1502328856, 0),
(793, 1, 5, 'mod/lti:view', 1, 1502328861, 0),
(794, 1, 4, 'mod/lti:view', 1, 1502328861, 0),
(795, 1, 3, 'mod/lti:view', 1, 1502328861, 0),
(796, 1, 1, 'mod/lti:view', 1, 1502328861, 0),
(797, 1, 3, 'mod/lti:addinstance', 1, 1502328861, 0),
(798, 1, 1, 'mod/lti:addinstance', 1, 1502328862, 0),
(799, 1, 4, 'mod/lti:manage', 1, 1502328862, 0),
(800, 1, 3, 'mod/lti:manage', 1, 1502328862, 0),
(801, 1, 1, 'mod/lti:manage', 1, 1502328862, 0),
(802, 1, 3, 'mod/lti:addcoursetool', 1, 1502328862, 0),
(803, 1, 1, 'mod/lti:addcoursetool', 1, 1502328862, 0),
(804, 1, 3, 'mod/lti:requesttooladd', 1, 1502328862, 0),
(805, 1, 1, 'mod/lti:requesttooladd', 1, 1502328862, 0),
(806, 1, 6, 'mod/page:view', 1, 1502328864, 0),
(807, 1, 7, 'mod/page:view', 1, 1502328864, 0),
(808, 1, 3, 'mod/page:addinstance', 1, 1502328864, 0),
(809, 1, 1, 'mod/page:addinstance', 1, 1502328864, 0),
(810, 1, 6, 'mod/quiz:view', 1, 1502328870, 0),
(811, 1, 5, 'mod/quiz:view', 1, 1502328870, 0),
(812, 1, 4, 'mod/quiz:view', 1, 1502328870, 0),
(813, 1, 3, 'mod/quiz:view', 1, 1502328870, 0),
(814, 1, 1, 'mod/quiz:view', 1, 1502328871, 0),
(815, 1, 3, 'mod/quiz:addinstance', 1, 1502328871, 0),
(816, 1, 1, 'mod/quiz:addinstance', 1, 1502328871, 0),
(817, 1, 5, 'mod/quiz:attempt', 1, 1502328871, 0),
(818, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1502328871, 0),
(819, 1, 3, 'mod/quiz:manage', 1, 1502328871, 0),
(820, 1, 1, 'mod/quiz:manage', 1, 1502328871, 0),
(821, 1, 3, 'mod/quiz:manageoverrides', 1, 1502328871, 0),
(822, 1, 1, 'mod/quiz:manageoverrides', 1, 1502328871, 0),
(823, 1, 4, 'mod/quiz:preview', 1, 1502328871, 0),
(824, 1, 3, 'mod/quiz:preview', 1, 1502328871, 0),
(825, 1, 1, 'mod/quiz:preview', 1, 1502328871, 0),
(826, 1, 4, 'mod/quiz:grade', 1, 1502328872, 0),
(827, 1, 3, 'mod/quiz:grade', 1, 1502328872, 0),
(828, 1, 1, 'mod/quiz:grade', 1, 1502328872, 0),
(829, 1, 4, 'mod/quiz:regrade', 1, 1502328872, 0),
(830, 1, 3, 'mod/quiz:regrade', 1, 1502328872, 0),
(831, 1, 1, 'mod/quiz:regrade', 1, 1502328872, 0),
(832, 1, 4, 'mod/quiz:viewreports', 1, 1502328872, 0),
(833, 1, 3, 'mod/quiz:viewreports', 1, 1502328872, 0),
(834, 1, 1, 'mod/quiz:viewreports', 1, 1502328872, 0),
(835, 1, 3, 'mod/quiz:deleteattempts', 1, 1502328872, 0),
(836, 1, 1, 'mod/quiz:deleteattempts', 1, 1502328872, 0),
(837, 1, 6, 'mod/resource:view', 1, 1502328877, 0),
(838, 1, 7, 'mod/resource:view', 1, 1502328877, 0),
(839, 1, 3, 'mod/resource:addinstance', 1, 1502328877, 0),
(840, 1, 1, 'mod/resource:addinstance', 1, 1502328877, 0),
(841, 1, 3, 'mod/scorm:addinstance', 1, 1502328882, 0),
(842, 1, 1, 'mod/scorm:addinstance', 1, 1502328883, 0),
(843, 1, 4, 'mod/scorm:viewreport', 1, 1502328883, 0),
(844, 1, 3, 'mod/scorm:viewreport', 1, 1502328883, 0),
(845, 1, 1, 'mod/scorm:viewreport', 1, 1502328883, 0),
(846, 1, 5, 'mod/scorm:skipview', 1, 1502328883, 0),
(847, 1, 5, 'mod/scorm:savetrack', 1, 1502328883, 0),
(848, 1, 4, 'mod/scorm:savetrack', 1, 1502328883, 0),
(849, 1, 3, 'mod/scorm:savetrack', 1, 1502328883, 0),
(850, 1, 1, 'mod/scorm:savetrack', 1, 1502328883, 0),
(851, 1, 5, 'mod/scorm:viewscores', 1, 1502328883, 0),
(852, 1, 4, 'mod/scorm:viewscores', 1, 1502328883, 0),
(853, 1, 3, 'mod/scorm:viewscores', 1, 1502328883, 0),
(854, 1, 1, 'mod/scorm:viewscores', 1, 1502328883, 0),
(855, 1, 4, 'mod/scorm:deleteresponses', 1, 1502328883, 0),
(856, 1, 3, 'mod/scorm:deleteresponses', 1, 1502328883, 0),
(857, 1, 1, 'mod/scorm:deleteresponses', 1, 1502328883, 0),
(858, 1, 3, 'mod/survey:addinstance', 1, 1502328890, 0),
(859, 1, 1, 'mod/survey:addinstance', 1, 1502328890, 0),
(860, 1, 5, 'mod/survey:participate', 1, 1502328890, 0),
(861, 1, 4, 'mod/survey:participate', 1, 1502328890, 0),
(862, 1, 3, 'mod/survey:participate', 1, 1502328890, 0),
(863, 1, 1, 'mod/survey:participate', 1, 1502328890, 0),
(864, 1, 4, 'mod/survey:readresponses', 1, 1502328890, 0),
(865, 1, 3, 'mod/survey:readresponses', 1, 1502328890, 0),
(866, 1, 1, 'mod/survey:readresponses', 1, 1502328890, 0),
(867, 1, 4, 'mod/survey:download', 1, 1502328890, 0),
(868, 1, 3, 'mod/survey:download', 1, 1502328890, 0),
(869, 1, 1, 'mod/survey:download', 1, 1502328890, 0),
(870, 1, 6, 'mod/url:view', 1, 1502328892, 0),
(871, 1, 7, 'mod/url:view', 1, 1502328892, 0),
(872, 1, 3, 'mod/url:addinstance', 1, 1502328892, 0),
(873, 1, 1, 'mod/url:addinstance', 1, 1502328892, 0),
(874, 1, 3, 'mod/wiki:addinstance', 1, 1502328896, 0),
(875, 1, 1, 'mod/wiki:addinstance', 1, 1502328896, 0),
(876, 1, 6, 'mod/wiki:viewpage', 1, 1502328896, 0),
(877, 1, 5, 'mod/wiki:viewpage', 1, 1502328896, 0),
(878, 1, 4, 'mod/wiki:viewpage', 1, 1502328896, 0),
(879, 1, 3, 'mod/wiki:viewpage', 1, 1502328896, 0),
(880, 1, 1, 'mod/wiki:viewpage', 1, 1502328896, 0),
(881, 1, 5, 'mod/wiki:editpage', 1, 1502328896, 0),
(882, 1, 4, 'mod/wiki:editpage', 1, 1502328896, 0),
(883, 1, 3, 'mod/wiki:editpage', 1, 1502328896, 0),
(884, 1, 1, 'mod/wiki:editpage', 1, 1502328896, 0),
(885, 1, 5, 'mod/wiki:createpage', 1, 1502328896, 0),
(886, 1, 4, 'mod/wiki:createpage', 1, 1502328896, 0),
(887, 1, 3, 'mod/wiki:createpage', 1, 1502328896, 0),
(888, 1, 1, 'mod/wiki:createpage', 1, 1502328896, 0);
INSERT DELAYED IGNORE INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(889, 1, 5, 'mod/wiki:viewcomment', 1, 1502328897, 0),
(890, 1, 4, 'mod/wiki:viewcomment', 1, 1502328897, 0),
(891, 1, 3, 'mod/wiki:viewcomment', 1, 1502328897, 0),
(892, 1, 1, 'mod/wiki:viewcomment', 1, 1502328897, 0),
(893, 1, 5, 'mod/wiki:editcomment', 1, 1502328897, 0),
(894, 1, 4, 'mod/wiki:editcomment', 1, 1502328897, 0),
(895, 1, 3, 'mod/wiki:editcomment', 1, 1502328897, 0),
(896, 1, 1, 'mod/wiki:editcomment', 1, 1502328897, 0),
(897, 1, 4, 'mod/wiki:managecomment', 1, 1502328897, 0),
(898, 1, 3, 'mod/wiki:managecomment', 1, 1502328897, 0),
(899, 1, 1, 'mod/wiki:managecomment', 1, 1502328897, 0),
(900, 1, 4, 'mod/wiki:managefiles', 1, 1502328897, 0),
(901, 1, 3, 'mod/wiki:managefiles', 1, 1502328897, 0),
(902, 1, 1, 'mod/wiki:managefiles', 1, 1502328897, 0),
(903, 1, 4, 'mod/wiki:overridelock', 1, 1502328897, 0),
(904, 1, 3, 'mod/wiki:overridelock', 1, 1502328897, 0),
(905, 1, 1, 'mod/wiki:overridelock', 1, 1502328897, 0),
(906, 1, 4, 'mod/wiki:managewiki', 1, 1502328897, 0),
(907, 1, 3, 'mod/wiki:managewiki', 1, 1502328897, 0),
(908, 1, 1, 'mod/wiki:managewiki', 1, 1502328898, 0),
(909, 1, 6, 'mod/workshop:view', 1, 1502328904, 0),
(910, 1, 5, 'mod/workshop:view', 1, 1502328904, 0),
(911, 1, 4, 'mod/workshop:view', 1, 1502328904, 0),
(912, 1, 3, 'mod/workshop:view', 1, 1502328904, 0),
(913, 1, 1, 'mod/workshop:view', 1, 1502328904, 0),
(914, 1, 3, 'mod/workshop:addinstance', 1, 1502328904, 0),
(915, 1, 1, 'mod/workshop:addinstance', 1, 1502328904, 0),
(916, 1, 4, 'mod/workshop:switchphase', 1, 1502328904, 0),
(917, 1, 3, 'mod/workshop:switchphase', 1, 1502328904, 0),
(918, 1, 1, 'mod/workshop:switchphase', 1, 1502328904, 0),
(919, 1, 3, 'mod/workshop:editdimensions', 1, 1502328905, 0),
(920, 1, 1, 'mod/workshop:editdimensions', 1, 1502328905, 0),
(921, 1, 5, 'mod/workshop:submit', 1, 1502328905, 0),
(922, 1, 5, 'mod/workshop:peerassess', 1, 1502328905, 0),
(923, 1, 4, 'mod/workshop:manageexamples', 1, 1502328905, 0),
(924, 1, 3, 'mod/workshop:manageexamples', 1, 1502328905, 0),
(925, 1, 1, 'mod/workshop:manageexamples', 1, 1502328905, 0),
(926, 1, 4, 'mod/workshop:allocate', 1, 1502328906, 0),
(927, 1, 3, 'mod/workshop:allocate', 1, 1502328906, 0),
(928, 1, 1, 'mod/workshop:allocate', 1, 1502328906, 0),
(929, 1, 4, 'mod/workshop:publishsubmissions', 1, 1502328906, 0),
(930, 1, 3, 'mod/workshop:publishsubmissions', 1, 1502328906, 0),
(931, 1, 1, 'mod/workshop:publishsubmissions', 1, 1502328906, 0),
(932, 1, 5, 'mod/workshop:viewauthornames', 1, 1502328906, 0),
(933, 1, 4, 'mod/workshop:viewauthornames', 1, 1502328906, 0),
(934, 1, 3, 'mod/workshop:viewauthornames', 1, 1502328906, 0),
(935, 1, 1, 'mod/workshop:viewauthornames', 1, 1502328906, 0),
(936, 1, 4, 'mod/workshop:viewreviewernames', 1, 1502328906, 0),
(937, 1, 3, 'mod/workshop:viewreviewernames', 1, 1502328906, 0),
(938, 1, 1, 'mod/workshop:viewreviewernames', 1, 1502328906, 0),
(939, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1502328906, 0),
(940, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1502328906, 0),
(941, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1502328906, 0),
(942, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1502328906, 0),
(943, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1502328906, 0),
(944, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1502328906, 0),
(945, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1502328906, 0),
(946, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1502328907, 0),
(947, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1502328907, 0),
(948, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1502328907, 0),
(949, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1502328907, 0),
(950, 1, 4, 'mod/workshop:viewallassessments', 1, 1502328907, 0),
(951, 1, 3, 'mod/workshop:viewallassessments', 1, 1502328907, 0),
(952, 1, 1, 'mod/workshop:viewallassessments', 1, 1502328907, 0),
(953, 1, 4, 'mod/workshop:overridegrades', 1, 1502328907, 0),
(954, 1, 3, 'mod/workshop:overridegrades', 1, 1502328907, 0),
(955, 1, 1, 'mod/workshop:overridegrades', 1, 1502328907, 0),
(956, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1502328907, 0),
(957, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1502328907, 0),
(958, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1502328907, 0),
(959, 1, 4, 'mod/workshop:deletesubmissions', 1, 1502328907, 0),
(960, 1, 3, 'mod/workshop:deletesubmissions', 1, 1502328907, 0),
(961, 1, 1, 'mod/workshop:deletesubmissions', 1, 1502328907, 0),
(962, 1, 1, 'mod/workshop:exportsubmissions', 1, 1502328907, 0),
(963, 1, 4, 'mod/workshop:exportsubmissions', 1, 1502328908, 0),
(964, 1, 3, 'mod/workshop:exportsubmissions', 1, 1502328908, 0),
(965, 1, 5, 'mod/workshop:exportsubmissions', 1, 1502328908, 0),
(966, 1, 7, 'auth/oauth2:managelinkedlogins', 1, 1502328916, 0),
(967, 1, 1, 'enrol/category:config', 1, 1502328918, 0),
(968, 1, 3, 'enrol/category:config', 1, 1502328918, 0),
(969, 1, 3, 'enrol/cohort:config', 1, 1502328918, 0),
(970, 1, 1, 'enrol/cohort:config', 1, 1502328918, 0),
(971, 1, 1, 'enrol/cohort:unenrol', 1, 1502328918, 0),
(972, 1, 1, 'enrol/database:unenrol', 1, 1502328919, 0),
(973, 1, 1, 'enrol/database:config', 1, 1502328919, 0),
(974, 1, 3, 'enrol/database:config', 1, 1502328919, 0),
(975, 1, 1, 'enrol/guest:config', 1, 1502328922, 0),
(976, 1, 3, 'enrol/guest:config', 1, 1502328922, 0),
(977, 1, 1, 'enrol/imsenterprise:config', 1, 1502328922, 0),
(978, 1, 3, 'enrol/imsenterprise:config', 1, 1502328922, 0),
(979, 1, 1, 'enrol/ldap:manage', 1, 1502328923, 0),
(980, 1, 1, 'enrol/lti:config', 1, 1502328927, 0),
(981, 1, 3, 'enrol/lti:config', 1, 1502328927, 0),
(982, 1, 1, 'enrol/lti:unenrol', 1, 1502328927, 0),
(983, 1, 3, 'enrol/lti:unenrol', 1, 1502328927, 0),
(984, 1, 1, 'enrol/manual:config', 1, 1502328928, 0),
(985, 1, 1, 'enrol/manual:enrol', 1, 1502328928, 0),
(986, 1, 3, 'enrol/manual:enrol', 1, 1502328928, 0),
(987, 1, 1, 'enrol/manual:manage', 1, 1502328928, 0),
(988, 1, 3, 'enrol/manual:manage', 1, 1502328928, 0),
(989, 1, 1, 'enrol/manual:unenrol', 1, 1502328928, 0),
(990, 1, 3, 'enrol/manual:unenrol', 1, 1502328928, 0),
(991, 1, 1, 'enrol/meta:config', 1, 1502328929, 0),
(992, 1, 3, 'enrol/meta:config', 1, 1502328929, 0),
(993, 1, 1, 'enrol/meta:selectaslinked', 1, 1502328929, 0),
(994, 1, 1, 'enrol/meta:unenrol', 1, 1502328929, 0),
(995, 1, 1, 'enrol/mnet:config', 1, 1502328929, 0),
(996, 1, 3, 'enrol/mnet:config', 1, 1502328929, 0),
(997, 1, 1, 'enrol/paypal:config', 1, 1502328931, 0),
(998, 1, 1, 'enrol/paypal:manage', 1, 1502328931, 0),
(999, 1, 3, 'enrol/paypal:manage', 1, 1502328931, 0),
(1000, 1, 1, 'enrol/paypal:unenrol', 1, 1502328931, 0),
(1001, 1, 3, 'enrol/self:config', 1, 1502328932, 0),
(1002, 1, 1, 'enrol/self:config', 1, 1502328932, 0),
(1003, 1, 3, 'enrol/self:manage', 1, 1502328932, 0),
(1004, 1, 1, 'enrol/self:manage', 1, 1502328932, 0),
(1005, 1, 5, 'enrol/self:unenrolself', 1, 1502328932, 0),
(1006, 1, 3, 'enrol/self:unenrol', 1, 1502328932, 0),
(1007, 1, 1, 'enrol/self:unenrol', 1, 1502328932, 0),
(1008, 1, 7, 'message/airnotifier:managedevice', 1, 1502328933, 0),
(1009, 1, 3, 'block/activity_modules:addinstance', 1, 1502328939, 0),
(1010, 1, 1, 'block/activity_modules:addinstance', 1, 1502328939, 0),
(1011, 1, 3, 'block/activity_results:addinstance', 1, 1502328940, 0),
(1012, 1, 1, 'block/activity_results:addinstance', 1, 1502328940, 0),
(1013, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1502328940, 0),
(1014, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1502328940, 0),
(1015, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1502328940, 0),
(1016, 1, 3, 'block/badges:addinstance', 1, 1502328941, 0),
(1017, 1, 1, 'block/badges:addinstance', 1, 1502328941, 0),
(1018, 1, 7, 'block/badges:myaddinstance', 1, 1502328941, 0),
(1019, 1, 3, 'block/blog_menu:addinstance', 1, 1502328941, 0),
(1020, 1, 1, 'block/blog_menu:addinstance', 1, 1502328941, 0),
(1021, 1, 3, 'block/blog_recent:addinstance', 1, 1502328941, 0),
(1022, 1, 1, 'block/blog_recent:addinstance', 1, 1502328942, 0),
(1023, 1, 3, 'block/blog_tags:addinstance', 1, 1502328942, 0),
(1024, 1, 1, 'block/blog_tags:addinstance', 1, 1502328942, 0),
(1025, 1, 7, 'block/calendar_month:myaddinstance', 1, 1502328943, 0),
(1026, 1, 3, 'block/calendar_month:addinstance', 1, 1502328943, 0),
(1027, 1, 1, 'block/calendar_month:addinstance', 1, 1502328943, 0),
(1028, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1502328943, 0),
(1029, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1502328943, 0),
(1030, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1502328944, 0),
(1031, 1, 7, 'block/comments:myaddinstance', 1, 1502328944, 0),
(1032, 1, 3, 'block/comments:addinstance', 1, 1502328944, 0),
(1033, 1, 1, 'block/comments:addinstance', 1, 1502328944, 0),
(1034, 1, 7, 'block/community:myaddinstance', 1, 1502328945, 0),
(1035, 1, 3, 'block/community:addinstance', 1, 1502328945, 0),
(1036, 1, 1, 'block/community:addinstance', 1, 1502328945, 0),
(1037, 1, 3, 'block/completionstatus:addinstance', 1, 1502328945, 0),
(1038, 1, 1, 'block/completionstatus:addinstance', 1, 1502328945, 0),
(1039, 1, 7, 'block/course_list:myaddinstance', 1, 1502328946, 0),
(1040, 1, 3, 'block/course_list:addinstance', 1, 1502328946, 0),
(1041, 1, 1, 'block/course_list:addinstance', 1, 1502328946, 0),
(1042, 1, 3, 'block/course_summary:addinstance', 1, 1502328947, 0),
(1043, 1, 1, 'block/course_summary:addinstance', 1, 1502328947, 0),
(1044, 1, 3, 'block/feedback:addinstance', 1, 1502328947, 0),
(1045, 1, 1, 'block/feedback:addinstance', 1, 1502328947, 0),
(1046, 1, 7, 'block/globalsearch:myaddinstance', 1, 1502328948, 0),
(1047, 1, 3, 'block/globalsearch:addinstance', 1, 1502328948, 0),
(1048, 1, 1, 'block/globalsearch:addinstance', 1, 1502328949, 0),
(1049, 1, 7, 'block/glossary_random:myaddinstance', 1, 1502328949, 0),
(1050, 1, 3, 'block/glossary_random:addinstance', 1, 1502328949, 0),
(1051, 1, 1, 'block/glossary_random:addinstance', 1, 1502328949, 0),
(1052, 1, 7, 'block/html:myaddinstance', 1, 1502328950, 0),
(1053, 1, 3, 'block/html:addinstance', 1, 1502328950, 0),
(1054, 1, 1, 'block/html:addinstance', 1, 1502328950, 0),
(1055, 1, 3, 'block/login:addinstance', 1, 1502328951, 0),
(1056, 1, 1, 'block/login:addinstance', 1, 1502328951, 0),
(1057, 1, 3, 'block/lp:addinstance', 1, 1502328952, 0),
(1058, 1, 1, 'block/lp:addinstance', 1, 1502328952, 0),
(1059, 1, 7, 'block/lp:myaddinstance', 1, 1502328952, 0),
(1060, 1, 7, 'block/lp:view', 1, 1502328952, 0),
(1061, 1, 7, 'block/mentees:myaddinstance', 1, 1502328953, 0),
(1062, 1, 3, 'block/mentees:addinstance', 1, 1502328953, 0),
(1063, 1, 1, 'block/mentees:addinstance', 1, 1502328953, 0),
(1064, 1, 7, 'block/messages:myaddinstance', 1, 1502328953, 0),
(1065, 1, 3, 'block/messages:addinstance', 1, 1502328953, 0),
(1066, 1, 1, 'block/messages:addinstance', 1, 1502328954, 0),
(1067, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1502328954, 0),
(1068, 1, 3, 'block/mnet_hosts:addinstance', 1, 1502328954, 0),
(1069, 1, 1, 'block/mnet_hosts:addinstance', 1, 1502328954, 0),
(1070, 1, 7, 'block/myoverview:myaddinstance', 1, 1502328955, 0),
(1071, 1, 3, 'block/myoverview:addinstance', 1, 1502328955, 0),
(1072, 1, 1, 'block/myoverview:addinstance', 1, 1502328955, 0),
(1073, 1, 7, 'block/myprofile:myaddinstance', 1, 1502328955, 0),
(1074, 1, 3, 'block/myprofile:addinstance', 1, 1502328955, 0),
(1075, 1, 1, 'block/myprofile:addinstance', 1, 1502328955, 0),
(1076, 1, 7, 'block/navigation:myaddinstance', 1, 1502328956, 0),
(1077, 1, 3, 'block/navigation:addinstance', 1, 1502328956, 0),
(1078, 1, 1, 'block/navigation:addinstance', 1, 1502328956, 0),
(1079, 1, 7, 'block/news_items:myaddinstance', 1, 1502328956, 0),
(1080, 1, 3, 'block/news_items:addinstance', 1, 1502328956, 0),
(1081, 1, 1, 'block/news_items:addinstance', 1, 1502328956, 0),
(1082, 1, 7, 'block/online_users:myaddinstance', 1, 1502328957, 0),
(1083, 1, 3, 'block/online_users:addinstance', 1, 1502328957, 0),
(1084, 1, 1, 'block/online_users:addinstance', 1, 1502328957, 0),
(1085, 1, 7, 'block/online_users:viewlist', 1, 1502328957, 0),
(1086, 1, 6, 'block/online_users:viewlist', 1, 1502328957, 0),
(1087, 1, 5, 'block/online_users:viewlist', 1, 1502328957, 0),
(1088, 1, 4, 'block/online_users:viewlist', 1, 1502328957, 0),
(1089, 1, 3, 'block/online_users:viewlist', 1, 1502328957, 0),
(1090, 1, 1, 'block/online_users:viewlist', 1, 1502328957, 0),
(1091, 1, 3, 'block/participants:addinstance', 1, 1502328958, 0),
(1092, 1, 1, 'block/participants:addinstance', 1, 1502328958, 0),
(1093, 1, 7, 'block/private_files:myaddinstance', 1, 1502328958, 0),
(1094, 1, 3, 'block/private_files:addinstance', 1, 1502328958, 0),
(1095, 1, 1, 'block/private_files:addinstance', 1, 1502328958, 0),
(1096, 1, 3, 'block/quiz_results:addinstance', 1, 1502328959, 0),
(1097, 1, 1, 'block/quiz_results:addinstance', 1, 1502328959, 0),
(1098, 1, 3, 'block/recent_activity:addinstance', 1, 1502328959, 0),
(1099, 1, 1, 'block/recent_activity:addinstance', 1, 1502328959, 0),
(1100, 1, 7, 'block/recent_activity:viewaddupdatemodule', 1, 1502328960, 0),
(1101, 1, 7, 'block/recent_activity:viewdeletemodule', 1, 1502328960, 0),
(1102, 1, 7, 'block/rss_client:myaddinstance', 1, 1502328961, 0),
(1103, 1, 3, 'block/rss_client:addinstance', 1, 1502328961, 0),
(1104, 1, 1, 'block/rss_client:addinstance', 1, 1502328961, 0),
(1105, 1, 4, 'block/rss_client:manageownfeeds', 1, 1502328961, 0),
(1106, 1, 3, 'block/rss_client:manageownfeeds', 1, 1502328961, 0),
(1107, 1, 1, 'block/rss_client:manageownfeeds', 1, 1502328961, 0),
(1108, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1502328961, 0),
(1109, 1, 3, 'block/search_forums:addinstance', 1, 1502328961, 0),
(1110, 1, 1, 'block/search_forums:addinstance', 1, 1502328961, 0),
(1111, 1, 3, 'block/section_links:addinstance', 1, 1502328962, 0),
(1112, 1, 1, 'block/section_links:addinstance', 1, 1502328962, 0),
(1113, 1, 3, 'block/selfcompletion:addinstance', 1, 1502328963, 0),
(1114, 1, 1, 'block/selfcompletion:addinstance', 1, 1502328963, 0),
(1115, 1, 7, 'block/settings:myaddinstance', 1, 1502328963, 0),
(1116, 1, 3, 'block/settings:addinstance', 1, 1502328964, 0),
(1117, 1, 1, 'block/settings:addinstance', 1, 1502328964, 0),
(1118, 1, 3, 'block/site_main_menu:addinstance', 1, 1502328964, 0),
(1119, 1, 1, 'block/site_main_menu:addinstance', 1, 1502328964, 0),
(1120, 1, 3, 'block/social_activities:addinstance', 1, 1502328965, 0),
(1121, 1, 1, 'block/social_activities:addinstance', 1, 1502328965, 0),
(1122, 1, 3, 'block/tag_flickr:addinstance', 1, 1502328965, 0),
(1123, 1, 1, 'block/tag_flickr:addinstance', 1, 1502328965, 0),
(1124, 1, 3, 'block/tag_youtube:addinstance', 1, 1502328966, 0),
(1125, 1, 1, 'block/tag_youtube:addinstance', 1, 1502328966, 0),
(1126, 1, 7, 'block/tags:myaddinstance', 1, 1502328966, 0),
(1127, 1, 3, 'block/tags:addinstance', 1, 1502328966, 0),
(1128, 1, 1, 'block/tags:addinstance', 1, 1502328966, 0),
(1129, 1, 4, 'report/completion:view', 1, 1502328983, 0),
(1130, 1, 3, 'report/completion:view', 1, 1502328983, 0),
(1131, 1, 1, 'report/completion:view', 1, 1502328983, 0),
(1132, 1, 4, 'report/courseoverview:view', 1, 1502328984, 0),
(1133, 1, 3, 'report/courseoverview:view', 1, 1502328984, 0),
(1134, 1, 1, 'report/courseoverview:view', 1, 1502328984, 0),
(1135, 1, 4, 'report/log:view', 1, 1502328986, 0),
(1136, 1, 3, 'report/log:view', 1, 1502328986, 0),
(1137, 1, 1, 'report/log:view', 1, 1502328986, 0),
(1138, 1, 4, 'report/log:viewtoday', 1, 1502328986, 0),
(1139, 1, 3, 'report/log:viewtoday', 1, 1502328986, 0),
(1140, 1, 1, 'report/log:viewtoday', 1, 1502328986, 0),
(1141, 1, 4, 'report/loglive:view', 1, 1502328987, 0),
(1142, 1, 3, 'report/loglive:view', 1, 1502328987, 0),
(1143, 1, 1, 'report/loglive:view', 1, 1502328987, 0),
(1144, 1, 4, 'report/outline:view', 1, 1502328988, 0),
(1145, 1, 3, 'report/outline:view', 1, 1502328988, 0),
(1146, 1, 1, 'report/outline:view', 1, 1502328988, 0),
(1147, 1, 4, 'report/participation:view', 1, 1502328988, 0),
(1148, 1, 3, 'report/participation:view', 1, 1502328988, 0),
(1149, 1, 1, 'report/participation:view', 1, 1502328988, 0),
(1150, 1, 1, 'report/performance:view', 1, 1502328989, 0),
(1151, 1, 4, 'report/progress:view', 1, 1502328989, 0),
(1152, 1, 3, 'report/progress:view', 1, 1502328989, 0),
(1153, 1, 1, 'report/progress:view', 1, 1502328989, 0),
(1154, 1, 1, 'report/security:view', 1, 1502328990, 0),
(1155, 1, 4, 'report/stats:view', 1, 1502328991, 0),
(1156, 1, 3, 'report/stats:view', 1, 1502328991, 0),
(1157, 1, 1, 'report/stats:view', 1, 1502328991, 0),
(1158, 1, 6, 'report/usersessions:manageownsessions', -1000, 1502328991, 0),
(1159, 1, 7, 'report/usersessions:manageownsessions', 1, 1502328991, 0),
(1160, 1, 1, 'report/usersessions:manageownsessions', 1, 1502328991, 0),
(1161, 1, 4, 'gradeexport/ods:view', 1, 1502328992, 0),
(1162, 1, 3, 'gradeexport/ods:view', 1, 1502328992, 0),
(1163, 1, 1, 'gradeexport/ods:view', 1, 1502328992, 0),
(1164, 1, 1, 'gradeexport/ods:publish', 1, 1502328992, 0),
(1165, 1, 4, 'gradeexport/txt:view', 1, 1502328992, 0),
(1166, 1, 3, 'gradeexport/txt:view', 1, 1502328992, 0),
(1167, 1, 1, 'gradeexport/txt:view', 1, 1502328992, 0),
(1168, 1, 1, 'gradeexport/txt:publish', 1, 1502328992, 0),
(1169, 1, 4, 'gradeexport/xls:view', 1, 1502328993, 0),
(1170, 1, 3, 'gradeexport/xls:view', 1, 1502328993, 0),
(1171, 1, 1, 'gradeexport/xls:view', 1, 1502328993, 0),
(1172, 1, 1, 'gradeexport/xls:publish', 1, 1502328993, 0),
(1173, 1, 4, 'gradeexport/xml:view', 1, 1502328993, 0),
(1174, 1, 3, 'gradeexport/xml:view', 1, 1502328993, 0),
(1175, 1, 1, 'gradeexport/xml:view', 1, 1502328993, 0),
(1176, 1, 1, 'gradeexport/xml:publish', 1, 1502328993, 0),
(1177, 1, 3, 'gradeimport/csv:view', 1, 1502328994, 0),
(1178, 1, 1, 'gradeimport/csv:view', 1, 1502328994, 0),
(1179, 1, 3, 'gradeimport/direct:view', 1, 1502328994, 0),
(1180, 1, 1, 'gradeimport/direct:view', 1, 1502328994, 0),
(1181, 1, 3, 'gradeimport/xml:view', 1, 1502328995, 0),
(1182, 1, 1, 'gradeimport/xml:view', 1, 1502328995, 0),
(1183, 1, 1, 'gradeimport/xml:publish', 1, 1502328995, 0),
(1184, 1, 4, 'gradereport/grader:view', 1, 1502328995, 0),
(1185, 1, 3, 'gradereport/grader:view', 1, 1502328995, 0),
(1186, 1, 1, 'gradereport/grader:view', 1, 1502328995, 0),
(1187, 1, 4, 'gradereport/history:view', 1, 1502328996, 0),
(1188, 1, 3, 'gradereport/history:view', 1, 1502328996, 0),
(1189, 1, 1, 'gradereport/history:view', 1, 1502328997, 0),
(1190, 1, 4, 'gradereport/outcomes:view', 1, 1502328997, 0),
(1191, 1, 3, 'gradereport/outcomes:view', 1, 1502328997, 0),
(1192, 1, 1, 'gradereport/outcomes:view', 1, 1502328997, 0),
(1193, 1, 7, 'gradereport/overview:view', 1, 1502328999, 0),
(1194, 1, 3, 'gradereport/singleview:view', 1, 1502329000, 0),
(1195, 1, 1, 'gradereport/singleview:view', 1, 1502329000, 0),
(1196, 1, 5, 'gradereport/user:view', 1, 1502329001, 0),
(1197, 1, 4, 'gradereport/user:view', 1, 1502329001, 0),
(1198, 1, 3, 'gradereport/user:view', 1, 1502329001, 0),
(1199, 1, 1, 'gradereport/user:view', 1, 1502329001, 0),
(1200, 1, 7, 'repository/areafiles:view', 1, 1502329009, 0),
(1201, 1, 7, 'repository/boxnet:view', 1, 1502329009, 0),
(1202, 1, 2, 'repository/coursefiles:view', 1, 1502329010, 0),
(1203, 1, 4, 'repository/coursefiles:view', 1, 1502329010, 0),
(1204, 1, 3, 'repository/coursefiles:view', 1, 1502329010, 0),
(1205, 1, 1, 'repository/coursefiles:view', 1, 1502329010, 0),
(1206, 1, 7, 'repository/dropbox:view', 1, 1502329010, 0),
(1207, 1, 7, 'repository/equella:view', 1, 1502329012, 0),
(1208, 1, 2, 'repository/filesystem:view', 1, 1502329012, 0),
(1209, 1, 4, 'repository/filesystem:view', 1, 1502329012, 0),
(1210, 1, 3, 'repository/filesystem:view', 1, 1502329012, 0),
(1211, 1, 1, 'repository/filesystem:view', 1, 1502329012, 0),
(1212, 1, 7, 'repository/flickr:view', 1, 1502329012, 0),
(1213, 1, 7, 'repository/flickr_public:view', 1, 1502329013, 0),
(1214, 1, 7, 'repository/googledocs:view', 1, 1502329013, 0),
(1215, 1, 2, 'repository/local:view', 1, 1502329014, 0),
(1216, 1, 4, 'repository/local:view', 1, 1502329014, 0),
(1217, 1, 3, 'repository/local:view', 1, 1502329014, 0),
(1218, 1, 1, 'repository/local:view', 1, 1502329014, 0),
(1219, 1, 7, 'repository/merlot:view', 1, 1502329015, 0),
(1220, 1, 7, 'repository/onedrive:view', 1, 1502329016, 0),
(1221, 1, 7, 'repository/picasa:view', 1, 1502329016, 0),
(1222, 1, 7, 'repository/recent:view', 1, 1502329017, 0),
(1223, 1, 7, 'repository/s3:view', 1, 1502329017, 0),
(1224, 1, 7, 'repository/skydrive:view', 1, 1502329018, 0),
(1225, 1, 7, 'repository/upload:view', 1, 1502329018, 0),
(1226, 1, 7, 'repository/url:view', 1, 1502329019, 0),
(1227, 1, 7, 'repository/user:view', 1, 1502329019, 0),
(1228, 1, 2, 'repository/webdav:view', 1, 1502329020, 0),
(1229, 1, 4, 'repository/webdav:view', 1, 1502329020, 0),
(1230, 1, 3, 'repository/webdav:view', 1, 1502329020, 0),
(1231, 1, 1, 'repository/webdav:view', 1, 1502329020, 0),
(1232, 1, 7, 'repository/wikimedia:view', 1, 1502329020, 0),
(1233, 1, 7, 'repository/youtube:view', 1, 1502329021, 0),
(1234, 1, 1, 'tool/customlang:view', 1, 1502329041, 0),
(1235, 1, 1, 'tool/customlang:edit', 1, 1502329041, 0),
(1236, 1, 1, 'tool/lpmigrate:frameworksmigrate', 1, 1502329048, 0),
(1237, 1, 4, 'tool/monitor:subscribe', 1, 1502329053, 0),
(1238, 1, 3, 'tool/monitor:subscribe', 1, 1502329053, 0),
(1239, 1, 1, 'tool/monitor:subscribe', 1, 1502329053, 0),
(1240, 1, 4, 'tool/monitor:managerules', 1, 1502329053, 0),
(1241, 1, 3, 'tool/monitor:managerules', 1, 1502329053, 0),
(1242, 1, 1, 'tool/monitor:managerules', 1, 1502329053, 0),
(1243, 1, 1, 'tool/monitor:managetool', 1, 1502329053, 0),
(1244, 1, 3, 'tool/recyclebin:deleteitems', 1, 1502329057, 0),
(1245, 1, 1, 'tool/recyclebin:deleteitems', 1, 1502329057, 0),
(1246, 1, 3, 'tool/recyclebin:restoreitems', 1, 1502329057, 0),
(1247, 1, 1, 'tool/recyclebin:restoreitems', 1, 1502329057, 0),
(1248, 1, 4, 'tool/recyclebin:viewitems', 1, 1502329058, 0),
(1249, 1, 3, 'tool/recyclebin:viewitems', 1, 1502329058, 0),
(1250, 1, 1, 'tool/recyclebin:viewitems', 1, 1502329058, 0),
(1251, 1, 1, 'tool/uploaduser:uploaduserpictures', 1, 1502329062, 0),
(1252, 1, 1, 'tool/usertours:managetours', 1, 1502329067, 0),
(1253, 1, 3, 'booktool/importhtml:import', 1, 1502329085, 0),
(1254, 1, 1, 'booktool/importhtml:import', 1, 1502329085, 0),
(1255, 1, 6, 'booktool/print:print', 1, 1502329086, 0),
(1256, 1, 8, 'booktool/print:print', 1, 1502329086, 0),
(1257, 1, 5, 'booktool/print:print', 1, 1502329086, 0),
(1258, 1, 4, 'booktool/print:print', 1, 1502329086, 0),
(1259, 1, 3, 'booktool/print:print', 1, 1502329086, 0),
(1260, 1, 1, 'booktool/print:print', 1, 1502329086, 0),
(1261, 1, 4, 'quiz/grading:viewstudentnames', 1, 1502329093, 0),
(1262, 1, 3, 'quiz/grading:viewstudentnames', 1, 1502329093, 0),
(1263, 1, 1, 'quiz/grading:viewstudentnames', 1, 1502329093, 0),
(1264, 1, 4, 'quiz/grading:viewidnumber', 1, 1502329093, 0),
(1265, 1, 3, 'quiz/grading:viewidnumber', 1, 1502329093, 0),
(1266, 1, 1, 'quiz/grading:viewidnumber', 1, 1502329093, 0),
(1267, 1, 4, 'quiz/statistics:view', 1, 1502329095, 0),
(1268, 1, 3, 'quiz/statistics:view', 1, 1502329095, 0),
(1269, 1, 1, 'quiz/statistics:view', 1, 1502329096, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

DROP TABLE IF EXISTS `mdl_role_context_levels`;
CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T';

--
-- Truncate table before insert `mdl_role_context_levels`
--

TRUNCATE TABLE `mdl_role_context_levels`;
--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT DELAYED IGNORE INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

DROP TABLE IF EXISTS `mdl_role_names`;
CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings';

--
-- Truncate table before insert `mdl_role_names`
--

TRUNCATE TABLE `mdl_role_names`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_sortorder`
--

DROP TABLE IF EXISTS `mdl_role_sortorder`;
CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course';

--
-- Truncate table before insert `mdl_role_sortorder`
--

TRUNCATE TABLE `mdl_role_sortorder`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

DROP TABLE IF EXISTS `mdl_scale`;
CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Defines grading scales';

--
-- Truncate table before insert `mdl_scale`
--

TRUNCATE TABLE `mdl_scale`;
--
-- Dumping data for table `mdl_scale`
--

INSERT DELAYED IGNORE INTO `mdl_scale` (`id`, `courseid`, `userid`, `name`, `scale`, `description`, `descriptionformat`, `timemodified`) VALUES
(1, 0, 0, 'Separate and Connected ways of knowing', 'Mostly separate knowing,Separate and connected,Mostly connected knowing', 'The scale based on the theory of separate and connected knowing. This theory describes two different ways that we can evaluate and learn about the things we see and hear.<ul><li><strong>Separate knowers</strong> remain as objective as possible without including feelings and emotions. In a discussion with other people, they like to defend their own ideas, using logic to find holes in opponent\'s ideas.</li><li><strong>Connected knowers</strong> are more sensitive to other people. They are skilled at empathy and tends to listen and ask questions until they feel they can connect and "understand things from their point of view". They learn by trying to share the experiences that led to the knowledge they find in other people.</li></ul>', 0, 1502328677),
(2, 0, 0, 'Default competence scale', 'Not yet competent,Competent', 'A binary rating scale that provides no further information beyond whether someone has demonstrated proficiency or not.', 0, 1502328677);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

DROP TABLE IF EXISTS `mdl_scale_history`;
CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table';

--
-- Truncate table before insert `mdl_scale_history`
--

TRUNCATE TABLE `mdl_scale_history`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

DROP TABLE IF EXISTS `mdl_scorm`;
CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '0',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `masteryoverride` tinyint(1) NOT NULL DEFAULT '1',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '0',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  `completionstatusallscos` tinyint(1) DEFAULT NULL,
  `displayactivityname` smallint(4) NOT NULL DEFAULT '1',
  `autocommit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration';

--
-- Truncate table before insert `mdl_scorm`
--

TRUNCATE TABLE `mdl_scorm`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

DROP TABLE IF EXISTS `mdl_scorm_aicc_session`;
CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) DEFAULT NULL,
  `scormstatus` varchar(255) DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) DEFAULT NULL,
  `sessiontime` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by AICC HACP to store session information';

--
-- Truncate table before insert `mdl_scorm_aicc_session`
--

TRUNCATE TABLE `mdl_scorm_aicc_session`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes`;
CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` longtext NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module';

--
-- Truncate table before insert `mdl_scorm_scoes`
--

TRUNCATE TABLE `mdl_scorm_scoes`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_data`;
CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages';

--
-- Truncate table before insert `mdl_scorm_scoes_data`
--

TRUNCATE TABLE `mdl_scorm_scoes_data`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

DROP TABLE IF EXISTS `mdl_scorm_scoes_track`;
CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes';

--
-- Truncate table before insert `mdl_scorm_scoes_track`
--

TRUNCATE TABLE `mdl_scorm_scoes_track`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_mapinfo`;
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description';

--
-- Truncate table before insert `mdl_scorm_seq_mapinfo`
--

TRUNCATE TABLE `mdl_scorm_seq_mapinfo`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_objective`;
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description';

--
-- Truncate table before insert `mdl_scorm_seq_objective`
--

TRUNCATE TABLE `mdl_scorm_seq_objective`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprule`;
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';

--
-- Truncate table before insert `mdl_scorm_seq_rolluprule`
--

TRUNCATE TABLE `mdl_scorm_seq_rolluprule`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rolluprulecond`;
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule';

--
-- Truncate table before insert `mdl_scorm_seq_rolluprulecond`
--

TRUNCATE TABLE `mdl_scorm_seq_rolluprulecond`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_rulecond`;
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition';

--
-- Truncate table before insert `mdl_scorm_seq_rulecond`
--

TRUNCATE TABLE `mdl_scorm_seq_rulecond`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

DROP TABLE IF EXISTS `mdl_scorm_seq_ruleconds`;
CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions';

--
-- Truncate table before insert `mdl_scorm_seq_ruleconds`
--

TRUNCATE TABLE `mdl_scorm_seq_ruleconds`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

DROP TABLE IF EXISTS `mdl_sessions`;
CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended';

--
-- Truncate table before insert `mdl_sessions`
--

TRUNCATE TABLE `mdl_sessions`;
--
-- Dumping data for table `mdl_sessions`
--

INSERT DELAYED IGNORE INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(2, 0, 'bnav8f1791da8mds026jfpd882', 2, NULL, 1502329159, 1502335660, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1'),
(4, 0, '9j3kkjurdnk7bttjip6fa6nbf7', 2, NULL, 1502408124, 1502408223, '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

DROP TABLE IF EXISTS `mdl_stats_daily`;
CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats';

--
-- Truncate table before insert `mdl_stats_daily`
--

TRUNCATE TABLE `mdl_stats_daily`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_monthly`;
CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats';

--
-- Truncate table before insert `mdl_stats_monthly`
--

TRUNCATE TABLE `mdl_stats_monthly`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

DROP TABLE IF EXISTS `mdl_stats_user_daily`;
CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user';

--
-- Truncate table before insert `mdl_stats_user_daily`
--

TRUNCATE TABLE `mdl_stats_user_daily`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

DROP TABLE IF EXISTS `mdl_stats_user_monthly`;
CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user';

--
-- Truncate table before insert `mdl_stats_user_monthly`
--

TRUNCATE TABLE `mdl_stats_user_monthly`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_user_weekly`;
CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user';

--
-- Truncate table before insert `mdl_stats_user_weekly`
--

TRUNCATE TABLE `mdl_stats_user_weekly`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

DROP TABLE IF EXISTS `mdl_stats_weekly`;
CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats';

--
-- Truncate table before insert `mdl_stats_weekly`
--

TRUNCATE TABLE `mdl_stats_weekly`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

DROP TABLE IF EXISTS `mdl_survey`;
CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT '',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration';

--
-- Truncate table before insert `mdl_survey`
--

TRUNCATE TABLE `mdl_survey`;
--
-- Dumping data for table `mdl_survey`
--

INSERT DELAYED IGNORE INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`, `completionsubmit`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44', 0),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44', 0),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44', 0),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68', 0),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

DROP TABLE IF EXISTS `mdl_survey_analysis`;
CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission';

--
-- Truncate table before insert `mdl_survey_analysis`
--

TRUNCATE TABLE `mdl_survey_analysis`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

DROP TABLE IF EXISTS `mdl_survey_answers`;
CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext NOT NULL,
  `answer2` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users';

--
-- Truncate table before insert `mdl_survey_answers`
--

TRUNCATE TABLE `mdl_survey_answers`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

DROP TABLE IF EXISTS `mdl_survey_questions`;
CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey';

--
-- Truncate table before insert `mdl_survey_questions`
--

TRUNCATE TABLE `mdl_survey_questions`;
--
-- Dumping data for table `mdl_survey_questions`
--

INSERT DELAYED IGNORE INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

DROP TABLE IF EXISTS `mdl_tag`;
CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `tagcollid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `isstandard` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_tagnam_uix` (`tagcollid`,`name`),
  KEY `mdl_tag_tagiss_ix` (`tagcollid`,`isstandard`),
  KEY `mdl_tag_use_ix` (`userid`),
  KEY `mdl_tag_tag_ix` (`tagcollid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t';

--
-- Truncate table before insert `mdl_tag`
--

TRUNCATE TABLE `mdl_tag`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_area`
--

DROP TABLE IF EXISTS `mdl_tag_area`;
CREATE TABLE IF NOT EXISTS `mdl_tag_area` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `tagcollid` bigint(10) NOT NULL,
  `callback` varchar(100) DEFAULT NULL,
  `callbackfile` varchar(100) DEFAULT NULL,
  `showstandard` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tagarea_comite_uix` (`component`,`itemtype`),
  KEY `mdl_tagarea_tag_ix` (`tagcollid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Defines various tag areas, one area is identified by compone';

--
-- Truncate table before insert `mdl_tag_area`
--

TRUNCATE TABLE `mdl_tag_area`;
--
-- Dumping data for table `mdl_tag_area`
--

INSERT DELAYED IGNORE INTO `mdl_tag_area` (`id`, `component`, `itemtype`, `enabled`, `tagcollid`, `callback`, `callbackfile`, `showstandard`) VALUES
(1, 'core', 'user', 1, 1, 'user_get_tagged_users', '/user/lib.php', 2),
(2, 'core', 'course', 1, 1, 'course_get_tagged_courses', '/course/lib.php', 0),
(3, 'core_question', 'question', 1, 1, NULL, NULL, 0),
(4, 'core', 'post', 1, 1, 'blog_get_tagged_posts', '/blog/lib.php', 0),
(5, 'core', 'blog_external', 1, 1, NULL, NULL, 0),
(6, 'core', 'course_modules', 1, 1, 'course_get_tagged_course_modules', '/course/lib.php', 0),
(7, 'mod_book', 'book_chapters', 1, 1, 'mod_book_get_tagged_chapters', '/mod/book/locallib.php', 0),
(8, 'mod_forum', 'forum_posts', 1, 1, 'mod_forum_get_tagged_posts', '/mod/forum/locallib.php', 0),
(9, 'mod_glossary', 'glossary_entries', 1, 1, 'mod_glossary_get_tagged_entries', '/mod/glossary/locallib.php', 0),
(10, 'mod_wiki', 'wiki_pages', 1, 1, 'mod_wiki_get_tagged_pages', '/mod/wiki/locallib.php', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_coll`
--

DROP TABLE IF EXISTS `mdl_tag_coll`;
CREATE TABLE IF NOT EXISTS `mdl_tag_coll` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `isdefault` tinyint(2) NOT NULL DEFAULT '0',
  `component` varchar(100) DEFAULT NULL,
  `sortorder` mediumint(5) NOT NULL DEFAULT '0',
  `searchable` tinyint(2) NOT NULL DEFAULT '1',
  `customurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Defines different set of tags';

--
-- Truncate table before insert `mdl_tag_coll`
--

TRUNCATE TABLE `mdl_tag_coll`;
--
-- Dumping data for table `mdl_tag_coll`
--

INSERT DELAYED IGNORE INTO `mdl_tag_coll` (`id`, `name`, `isdefault`, `component`, `sortorder`, `searchable`, `customurl`) VALUES
(1, NULL, 1, NULL, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

DROP TABLE IF EXISTS `mdl_tag_correlation`;
CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance';

--
-- Truncate table before insert `mdl_tag_correlation`
--

TRUNCATE TABLE `mdl_tag_correlation`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

DROP TABLE IF EXISTS `mdl_tag_instance`;
CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `contextid` bigint(10) DEFAULT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_comiteitetiuta_uix` (`component`,`itemtype`,`itemid`,`tiuserid`,`tagid`),
  KEY `mdl_taginst_itecomtagcon_ix` (`itemtype`,`component`,`tagid`,`contextid`),
  KEY `mdl_taginst_tag_ix` (`tagid`),
  KEY `mdl_taginst_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet';

--
-- Truncate table before insert `mdl_tag_instance`
--

TRUNCATE TABLE `mdl_tag_instance`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_adhoc`
--

DROP TABLE IF EXISTS `mdl_task_adhoc`;
CREATE TABLE IF NOT EXISTS `mdl_task_adhoc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `nextruntime` bigint(10) NOT NULL,
  `faildelay` bigint(10) DEFAULT NULL,
  `customdata` longtext,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_taskadho_nex_ix` (`nextruntime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='List of adhoc tasks waiting to run.';

--
-- Truncate table before insert `mdl_task_adhoc`
--

TRUNCATE TABLE `mdl_task_adhoc`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_task_scheduled`
--

DROP TABLE IF EXISTS `mdl_task_scheduled`;
CREATE TABLE IF NOT EXISTS `mdl_task_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) NOT NULL DEFAULT '',
  `classname` varchar(255) NOT NULL DEFAULT '',
  `lastruntime` bigint(10) DEFAULT NULL,
  `nextruntime` bigint(10) DEFAULT NULL,
  `blocking` tinyint(2) NOT NULL DEFAULT '0',
  `minute` varchar(25) NOT NULL DEFAULT '',
  `hour` varchar(25) NOT NULL DEFAULT '',
  `day` varchar(25) NOT NULL DEFAULT '',
  `month` varchar(25) NOT NULL DEFAULT '',
  `dayofweek` varchar(25) NOT NULL DEFAULT '',
  `faildelay` bigint(10) DEFAULT NULL,
  `customised` tinyint(2) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tasksche_cla_uix` (`classname`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='List of scheduled tasks to be run by cron.';

--
-- Truncate table before insert `mdl_task_scheduled`
--

TRUNCATE TABLE `mdl_task_scheduled`;
--
-- Dumping data for table `mdl_task_scheduled`
--

INSERT DELAYED IGNORE INTO `mdl_task_scheduled` (`id`, `component`, `classname`, `lastruntime`, `nextruntime`, `blocking`, `minute`, `hour`, `day`, `month`, `dayofweek`, `faildelay`, `customised`, `disabled`) VALUES
(1, 'moodle', '\\core\\task\\session_cleanup_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(2, 'moodle', '\\core\\task\\delete_unconfirmed_users_task', 0, 1502330400, 0, '0', '*', '*', '*', '*', 0, 0, 0),
(3, 'moodle', '\\core\\task\\delete_incomplete_users_task', 0, 1502330700, 0, '5', '*', '*', '*', '*', 0, 0, 0),
(4, 'moodle', '\\core\\task\\backup_cleanup_task', 0, 1502331000, 0, '10', '*', '*', '*', '*', 0, 0, 0),
(5, 'moodle', '\\core\\task\\tag_cron_task', 0, 1502334900, 0, '15', '3', '*', '*', '*', 0, 0, 0),
(6, 'moodle', '\\core\\task\\context_cleanup_task', 0, 1502331900, 0, '25', '*', '*', '*', '*', 0, 0, 0),
(7, 'moodle', '\\core\\task\\cache_cleanup_task', 0, 1502332200, 0, '30', '*', '*', '*', '*', 0, 0, 0),
(8, 'moodle', '\\core\\task\\messaging_cleanup_task', 0, 1502328900, 0, '35', '*', '*', '*', '*', 0, 0, 0),
(9, 'moodle', '\\core\\task\\send_new_user_passwords_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(10, 'moodle', '\\core\\task\\send_failed_login_notifications_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(11, 'moodle', '\\core\\task\\create_contexts_task', 0, 1502409600, 1, '0', '0', '*', '*', '*', 0, 0, 0),
(12, 'moodle', '\\core\\task\\legacy_plugin_cron_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(13, 'moodle', '\\core\\task\\grade_cron_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(14, 'moodle', '\\core\\task\\events_cron_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(15, 'moodle', '\\core\\task\\completion_regular_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(16, 'moodle', '\\core\\task\\completion_daily_task', 0, 1502360340, 0, '19', '10', '*', '*', '*', 0, 0, 0),
(17, 'moodle', '\\core\\task\\portfolio_cron_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(18, 'moodle', '\\core\\task\\plagiarism_cron_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(19, 'moodle', '\\core\\task\\calendar_cron_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(20, 'moodle', '\\core\\task\\blog_cron_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(21, 'moodle', '\\core\\task\\question_cron_task', 0, 1502328720, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(22, 'moodle', '\\core\\task\\registration_cron_task', 0, 1502395980, 0, '13', '20', '*', '*', '0', 0, 0, 0),
(23, 'moodle', '\\core\\task\\check_for_updates_task', 0, 1502330400, 0, '0', '*/2', '*', '*', '*', 0, 0, 0),
(24, 'moodle', '\\core\\task\\cache_cron_task', 0, 1502329800, 0, '50', '*', '*', '*', '*', 0, 0, 0),
(25, 'moodle', '\\core\\task\\automated_backup_task', 0, 1502329800, 0, '50', '*', '*', '*', '*', 0, 0, 0),
(26, 'moodle', '\\core\\task\\badges_cron_task', 0, 1502328900, 0, '*/5', '*', '*', '*', '*', 0, 0, 0),
(27, 'moodle', '\\core\\task\\file_temp_cleanup_task', 0, 1502348100, 0, '55', '*/6', '*', '*', '*', 0, 0, 0),
(28, 'moodle', '\\core\\task\\file_trash_cleanup_task', 0, 1502348100, 0, '55', '*/6', '*', '*', '*', 0, 0, 0),
(29, 'moodle', '\\core\\task\\search_index_task', 0, 1502330400, 0, '*/30', '*', '*', '*', '*', 0, 0, 0),
(30, 'moodle', '\\core\\task\\search_optimize_task', 0, 1502367300, 0, '15', '*/12', '*', '*', '*', 0, 0, 0),
(31, 'moodle', '\\core\\task\\stats_cron_task', 0, 1502409600, 0, '0', '0', '*', '*', '*', 0, 0, 0),
(32, 'moodle', '\\core\\task\\password_reset_cleanup_task', 0, 1502344800, 0, '0', '*/6', '*', '*', '*', 0, 0, 0),
(33, 'moodle', '\\core\\task\\complete_plans_task', 0, 1502331600, 0, '20', '*', '*', '*', '*', 0, 0, 0),
(34, 'moodle', '\\core\\task\\sync_plans_from_template_cohorts_task', 0, 1502331420, 0, '17', '*', '*', '*', '*', 0, 0, 0),
(35, 'moodle', '\\core_files\\task\\conversion_cleanup_task', 0, 1502331060, 0, '11', '2', '*', '*', '*', 0, 0, 0),
(36, 'moodle', '\\core\\oauth2\\refresh_system_tokens_task', 0, 1502332200, 0, '30', '*', '*', '*', '*', 0, 0, 0),
(37, 'mod_forum', '\\mod_forum\\task\\cron_task', 0, 1502328840, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(38, 'mod_scorm', '\\mod_scorm\\task\\cron_task', 0, 1502328900, 0, '*/5', '*', '*', '*', '*', 0, 0, 0),
(39, 'auth_cas', '\\auth_cas\\task\\sync_task', 0, 1502406000, 0, '0', '0', '*', '*', '*', 0, 0, 1),
(40, 'auth_db', '\\auth_db\\task\\sync_users', 0, 1502345400, 0, '10', '7', '*', '*', '*', 0, 0, 1),
(41, 'auth_ldap', '\\auth_ldap\\task\\sync_roles', 0, 1502406000, 0, '0', '0', '*', '*', '*', 0, 0, 1),
(42, 'auth_ldap', '\\auth_ldap\\task\\sync_task', 0, 1502406000, 0, '0', '0', '*', '*', '*', 0, 0, 1),
(43, 'enrol_flatfile', '\\enrol_flatfile\\task\\flatfile_sync_task', 0, 1502331300, 0, '15', '*', '*', '*', '*', 0, 0, 0),
(44, 'enrol_imsenterprise', '\\enrol_imsenterprise\\task\\cron_task', 0, 1502331000, 0, '10', '*', '*', '*', '*', 0, 0, 0),
(45, 'enrol_ldap', '\\enrol_ldap\\task\\sync_enrolments', 0, 1502367180, 0, '13', '13', '*', '*', '*', 0, 0, 1),
(46, 'enrol_lti', '\\enrol_lti\\task\\sync_grades', 0, 1502330400, 0, '*/30', '*', '*', '*', '*', 0, 0, 0),
(47, 'enrol_lti', '\\enrol_lti\\task\\sync_members', 0, 1502330400, 0, '*/30', '*', '*', '*', '*', 0, 0, 0),
(48, 'editor_atto', '\\editor_atto\\task\\autosave_cleanup_task', 0, 1502403660, 0, '21', '23', '*', '*', '0', 0, 0, 0),
(49, 'repository_onedrive', '\\repository_onedrive\\remove_temp_access_task', 0, 1502806200, 0, '10', '15', '*', '*', '2', 0, 0, 0),
(50, 'tool_analytics', '\\tool_analytics\\task\\train_models', 0, 1502373600, 0, '0', '15', '*', '*', '*', 0, 0, 0),
(51, 'tool_analytics', '\\tool_analytics\\task\\predict_models', 0, 1502406000, 0, '0', '0', '*', '*', '*', 0, 0, 0),
(52, 'tool_cohortroles', '\\tool_cohortroles\\task\\cohort_role_sync', 0, 1502331240, 0, '14', '*', '*', '*', '*', 0, 0, 0),
(53, 'tool_langimport', '\\tool_langimport\\task\\update_langpacks_task', 0, 1502334960, 0, '16', '4', '*', '*', '*', 0, 0, 0),
(54, 'tool_messageinbound', '\\tool_messageinbound\\task\\pickup_task', 0, 1502329080, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(55, 'tool_messageinbound', '\\tool_messageinbound\\task\\cleanup_task', 0, 1502412900, 0, '55', '1', '*', '*', '*', 0, 0, 0),
(56, 'tool_monitor', '\\tool_monitor\\task\\clean_events', 0, 1502329080, 0, '*', '*', '*', '*', '*', 0, 0, 0),
(57, 'tool_monitor', '\\tool_monitor\\task\\check_subscriptions', 0, 1502352000, 0, '0', '9', '*', '*', '*', 0, 0, 0),
(58, 'tool_recyclebin', '\\tool_recyclebin\\task\\cleanup_course_bin', 0, 1502330400, 0, '*/30', '*', '*', '*', '*', 0, 0, 0),
(59, 'tool_recyclebin', '\\tool_recyclebin\\task\\cleanup_category_bin', 0, 1502330400, 0, '*/30', '*', '*', '*', '*', 0, 0, 0),
(60, 'assignfeedback_editpdf', '\\assignfeedback_editpdf\\task\\convert_submissions', 0, 1502329500, 0, '*/15', '*', '*', '*', '*', 0, 0, 0),
(61, 'logstore_legacy', '\\logstore_legacy\\task\\cleanup_task', 0, 1502338260, 0, '11', '5', '*', '*', '*', 0, 0, 0),
(62, 'logstore_standard', '\\logstore_standard\\task\\cleanup_task', 0, 1502335380, 0, '23', '4', '*', '*', '*', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_cohortroles`
--

DROP TABLE IF EXISTS `mdl_tool_cohortroles`;
CREATE TABLE IF NOT EXISTS `mdl_tool_cohortroles` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcoho_cohroluse_uix` (`cohortid`,`roleid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mapping of users to cohort role assignments.';

--
-- Truncate table before insert `mdl_tool_cohortroles`
--

TRUNCATE TABLE `mdl_tool_cohortroles`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

DROP TABLE IF EXISTS `mdl_tool_customlang`;
CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo';

--
-- Truncate table before insert `mdl_tool_customlang`
--

TRUNCATE TABLE `mdl_tool_customlang`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

DROP TABLE IF EXISTS `mdl_tool_customlang_components`;
CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei';

--
-- Truncate table before insert `mdl_tool_customlang_components`
--

TRUNCATE TABLE `mdl_tool_customlang_components`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_events`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_events`;
CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_events` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(254) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  `contextinstanceid` bigint(10) NOT NULL,
  `link` varchar(254) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A table that keeps a log of events related to subscriptions';

--
-- Truncate table before insert `mdl_tool_monitor_events`
--

TRUNCATE TABLE `mdl_tool_monitor_events`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_history`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_history`;
CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `sid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timesent` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolmonihist_sidusetim_uix` (`sid`,`userid`,`timesent`),
  KEY `mdl_toolmonihist_sid_ix` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store history of message notifications sent';

--
-- Truncate table before insert `mdl_tool_monitor_history`
--

TRUNCATE TABLE `mdl_tool_monitor_history`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_rules`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_rules`;
CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_rules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  `descriptionformat` tinyint(1) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `plugin` varchar(254) NOT NULL DEFAULT '',
  `eventname` varchar(254) NOT NULL DEFAULT '',
  `template` longtext NOT NULL,
  `templateformat` tinyint(1) NOT NULL,
  `frequency` smallint(4) NOT NULL,
  `timewindow` mediumint(5) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonirule_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonirule_eve_ix` (`eventname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store rules';

--
-- Truncate table before insert `mdl_tool_monitor_rules`
--

TRUNCATE TABLE `mdl_tool_monitor_rules`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_monitor_subscriptions`
--

DROP TABLE IF EXISTS `mdl_tool_monitor_subscriptions`;
CREATE TABLE IF NOT EXISTS `mdl_tool_monitor_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `ruleid` bigint(10) NOT NULL,
  `cmid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastnotificationsent` bigint(10) NOT NULL DEFAULT '0',
  `inactivedate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolmonisubs_couuse_ix` (`courseid`,`userid`),
  KEY `mdl_toolmonisubs_rul_ix` (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store user subscriptions to various rules';

--
-- Truncate table before insert `mdl_tool_monitor_subscriptions`
--

TRUNCATE TABLE `mdl_tool_monitor_subscriptions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_recyclebin_category`
--

DROP TABLE IF EXISTS `mdl_tool_recyclebin_category`;
CREATE TABLE IF NOT EXISTS `mdl_tool_recyclebin_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_toolrecycate_tim_ix` (`timecreated`),
  KEY `mdl_toolrecycate_cat_ix` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of items in the category recycle bin';

--
-- Truncate table before insert `mdl_tool_recyclebin_category`
--

TRUNCATE TABLE `mdl_tool_recyclebin_category`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_recyclebin_course`
--

DROP TABLE IF EXISTS `mdl_tool_recyclebin_course`;
CREATE TABLE IF NOT EXISTS `mdl_tool_recyclebin_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `section` bigint(10) NOT NULL,
  `module` bigint(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_toolrecycour_tim_ix` (`timecreated`),
  KEY `mdl_toolrecycour_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of items in the course recycle bin';

--
-- Truncate table before insert `mdl_tool_recyclebin_course`
--

TRUNCATE TABLE `mdl_tool_recyclebin_course`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_usertours_steps`
--

DROP TABLE IF EXISTS `mdl_tool_usertours_steps`;
CREATE TABLE IF NOT EXISTS `mdl_tool_usertours_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tourid` bigint(10) NOT NULL,
  `title` longtext,
  `content` longtext,
  `targettype` tinyint(2) NOT NULL,
  `targetvalue` longtext NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `configdata` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tooluserstep_tousor_ix` (`tourid`,`sortorder`),
  KEY `mdl_tooluserstep_tou_ix` (`tourid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Steps in an tour';

--
-- Truncate table before insert `mdl_tool_usertours_steps`
--

TRUNCATE TABLE `mdl_tool_usertours_steps`;
--
-- Dumping data for table `mdl_tool_usertours_steps`
--

INSERT DELAYED IGNORE INTO `mdl_tool_usertours_steps` (`id`, `tourid`, `title`, `content`, `targettype`, `targetvalue`, `sortorder`, `configdata`) VALUES
(1, 1, 'tour1_title_welcome,tool_usertours', 'tour1_content_welcome,tool_usertours', 2, '', 0, '{}'),
(2, 1, 'tour1_title_navigation,tool_usertours', 'tour1_content_navigation,tool_usertours', 0, '[data-region="drawer-toggle"] button[data-action="toggle-drawer"]', 1, '{}'),
(3, 1, 'tour1_title_customisation,tool_usertours', 'tour1_content_customisation,tool_usertours', 0, 'body:not(.editing) #page-header .card-block', 2, '{"placement":"bottom"}'),
(4, 1, 'tour1_title_blockregion,tool_usertours', 'tour1_content_blockregion,tool_usertours', 0, 'body.editing [data-region="blocks-column"]', 3, '{}'),
(5, 1, 'tour1_title_addingblocks,tool_usertours', 'tour1_content_addingblocks,tool_usertours', 0, 'body.editing [data-region="blocks-column"]', 4, '{"placement":"bottom"}'),
(6, 1, 'tour1_title_end,tool_usertours', 'tour1_content_end,tool_usertours', 2, '', 5, '{}'),
(7, 2, 'tour2_title_welcome,tool_usertours', 'tour2_content_welcome,tool_usertours', 2, '', 0, '{}'),
(8, 2, 'tour2_title_customisation,tool_usertours', 'tour2_content_customisation,tool_usertours', 0, 'body:not(.editing) #page-header .card-block', 1, '{}'),
(9, 2, 'tour2_title_navigation,tool_usertours', 'tour2_content_navigation,tool_usertours', 0, '[data-region="drawer-toggle"] button[data-action="toggle-drawer"]', 2, '{}'),
(10, 2, 'tour2_title_opendrawer,tool_usertours', 'tour2_content_opendrawer,tool_usertours', 0, 'body:not(.drawer-open-left) [data-region="drawer-toggle"] button[data-action="toggle-drawer"]', 3, '{}'),
(11, 2, 'tour2_title_participants,tool_usertours', 'tour2_content_participants,tool_usertours', 0, 'body.drawer-open-left [data-region="drawer"] [data-key="participants"]', 4, '{"placement":"bottom","backdrop":"0"}'),
(12, 2, 'tour2_title_addblock,tool_usertours', 'tour2_content_addblock,tool_usertours', 0, 'body.drawer-open-left:not(.editing) [data-region="drawer"]', 5, '{"placement":"right","orphan":"0","backdrop":"0","reflex":"0"}'),
(13, 2, 'tour2_title_addingblocks,tool_usertours', 'tour2_content_addingblocks,tool_usertours', 0, 'body.drawer-open-left.editing [data-region="drawer"] [data-key="addblock"]', 6, '{"backdrop":"0","placement":"top"}'),
(14, 2, 'tour2_title_end,tool_usertours', 'tour2_content_end,tool_usertours', 2, '', 7, '{}');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_usertours_tours`
--

DROP TABLE IF EXISTS `mdl_tool_usertours_tours`;
CREATE TABLE IF NOT EXISTS `mdl_tool_usertours_tours` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `pathmatch` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `configdata` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='List of tours';

--
-- Truncate table before insert `mdl_tool_usertours_tours`
--

TRUNCATE TABLE `mdl_tool_usertours_tours`;
--
-- Dumping data for table `mdl_tool_usertours_tours`
--

INSERT DELAYED IGNORE INTO `mdl_tool_usertours_tours` (`id`, `name`, `description`, `pathmatch`, `enabled`, `sortorder`, `configdata`) VALUES
(1, 'Boost - administrator', 'A tour of some new features in the Boost theme, for administrators', 'FRONTPAGE', 1, 0, '{"placement":"bottom","orphan":"0","backdrop":"1","reflex":"0","filtervalues":{"role":["-1"],"theme":["boost"]},"majorupdatetime":1479366244,"default_tour":true,"filename":"boost_administrator.json","version":1,"shipped_tour":true,"shipped_filename":"boost_administrator.json","shipped_version":1}'),
(2, 'Boost - course view', 'A tour for introducing administrators and teachers to courses in the Boost theme', '/course/view.php%', 1, 1, '{"placement":"bottom","orphan":"0","backdrop":"1","reflex":"0","filtervalues":{"role":["-1","editingteacher"],"theme":["boost"]},"majorupdatetime":1480050104,"shipped_tour":true,"shipped_filename":"boost_course_view.json","shipped_version":1}');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

DROP TABLE IF EXISTS `mdl_upgrade_log`;
CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `targetversion` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` longtext,
  `backtrace` longtext,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=1170 DEFAULT CHARSET=utf8 COMMENT='Upgrade logging';

--
-- Truncate table before insert `mdl_upgrade_log`
--

TRUNCATE TABLE `mdl_upgrade_log`;
--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT DELAYED IGNORE INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2017080400', '2017080400', 'Upgrade savepoint reached', NULL, '', 0, 1502328678),
(2, 0, 'core', '2017080400', '2017080400', 'Core installed', NULL, '', 0, 1502328762),
(3, 0, 'antivirus_clamav', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328764),
(4, 0, 'antivirus_clamav', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328764),
(5, 0, 'antivirus_clamav', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328764),
(6, 0, 'availability_completion', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328765),
(7, 0, 'availability_completion', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328765),
(8, 0, 'availability_completion', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328765),
(9, 0, 'availability_date', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328765),
(10, 0, 'availability_date', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328765),
(11, 0, 'availability_date', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328765),
(12, 0, 'availability_grade', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328766),
(13, 0, 'availability_grade', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328766),
(14, 0, 'availability_grade', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328766),
(15, 0, 'availability_group', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328766),
(16, 0, 'availability_group', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328766),
(17, 0, 'availability_group', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328766),
(18, 0, 'availability_grouping', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328767),
(19, 0, 'availability_grouping', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328767),
(20, 0, 'availability_grouping', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328767),
(21, 0, 'availability_profile', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328767),
(22, 0, 'availability_profile', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328767),
(23, 0, 'availability_profile', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328768),
(24, 0, 'qtype_calculated', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328768),
(25, 0, 'qtype_calculated', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328770),
(26, 0, 'qtype_calculated', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328771),
(27, 0, 'qtype_calculatedmulti', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328771),
(28, 0, 'qtype_calculatedmulti', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328771),
(29, 0, 'qtype_calculatedmulti', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328771),
(30, 0, 'qtype_calculatedsimple', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328771),
(31, 0, 'qtype_calculatedsimple', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328771),
(32, 0, 'qtype_calculatedsimple', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328772),
(33, 0, 'qtype_ddimageortext', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328772),
(34, 0, 'qtype_ddimageortext', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328773),
(35, 0, 'qtype_ddimageortext', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328773),
(36, 0, 'qtype_ddmarker', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328773),
(37, 0, 'qtype_ddmarker', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328775),
(38, 0, 'qtype_ddmarker', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328775),
(39, 0, 'qtype_ddwtos', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328775),
(40, 0, 'qtype_ddwtos', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328776),
(41, 0, 'qtype_ddwtos', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328776),
(42, 0, 'qtype_description', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328776),
(43, 0, 'qtype_description', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328776),
(44, 0, 'qtype_description', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328776),
(45, 0, 'qtype_essay', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328777),
(46, 0, 'qtype_essay', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328777),
(47, 0, 'qtype_essay', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328777),
(48, 0, 'qtype_gapselect', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328777),
(49, 0, 'qtype_gapselect', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328778),
(50, 0, 'qtype_gapselect', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328778),
(51, 0, 'qtype_match', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328778),
(52, 0, 'qtype_match', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328780),
(53, 0, 'qtype_match', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328780),
(54, 0, 'qtype_missingtype', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328781),
(55, 0, 'qtype_missingtype', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328781),
(56, 0, 'qtype_missingtype', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328781),
(57, 0, 'qtype_multianswer', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328781),
(58, 0, 'qtype_multianswer', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328782),
(59, 0, 'qtype_multianswer', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328782),
(60, 0, 'qtype_multichoice', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328782),
(61, 0, 'qtype_multichoice', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328783),
(62, 0, 'qtype_multichoice', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328783),
(63, 0, 'qtype_numerical', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328783),
(64, 0, 'qtype_numerical', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328784),
(65, 0, 'qtype_numerical', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328785),
(66, 0, 'qtype_random', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328785),
(67, 0, 'qtype_random', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328785),
(68, 0, 'qtype_random', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328785),
(69, 0, 'qtype_randomsamatch', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328785),
(70, 0, 'qtype_randomsamatch', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328786),
(71, 0, 'qtype_randomsamatch', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328786),
(72, 0, 'qtype_shortanswer', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328786),
(73, 0, 'qtype_shortanswer', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328787),
(74, 0, 'qtype_shortanswer', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328787),
(75, 0, 'qtype_truefalse', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328787),
(76, 0, 'qtype_truefalse', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328787),
(77, 0, 'qtype_truefalse', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328788),
(78, 0, 'mod_assign', NULL, '2017061200', 'Starting plugin installation', NULL, '', 0, 1502328788),
(79, 0, 'mod_assign', '2017061200', '2017061200', 'Upgrade savepoint reached', NULL, '', 0, 1502328792),
(80, 0, 'mod_assign', '2017061200', '2017061200', 'Plugin installed', NULL, '', 0, 1502328797),
(81, 0, 'mod_assignment', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328797),
(82, 0, 'mod_assignment', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328799),
(83, 0, 'mod_assignment', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328801),
(84, 0, 'mod_book', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328801),
(85, 0, 'mod_book', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328802),
(86, 0, 'mod_book', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328804),
(87, 0, 'mod_chat', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328804),
(88, 0, 'mod_chat', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328806),
(89, 0, 'mod_chat', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328808),
(90, 0, 'mod_choice', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328808),
(91, 0, 'mod_choice', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328809),
(92, 0, 'mod_choice', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328811),
(93, 0, 'mod_data', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328811),
(94, 0, 'mod_data', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328813),
(95, 0, 'mod_data', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328818),
(96, 0, 'mod_feedback', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328818),
(97, 0, 'mod_feedback', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328822),
(98, 0, 'mod_feedback', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328825),
(99, 0, 'mod_folder', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328825),
(100, 0, 'mod_folder', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328826),
(101, 0, 'mod_folder', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328827),
(102, 0, 'mod_forum', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328827),
(103, 0, 'mod_forum', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328831),
(104, 0, 'mod_forum', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328839),
(105, 0, 'mod_glossary', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328839),
(106, 0, 'mod_glossary', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328842),
(107, 0, 'mod_glossary', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328847),
(108, 0, 'mod_imscp', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328847),
(109, 0, 'mod_imscp', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328847),
(110, 0, 'mod_imscp', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328848),
(111, 0, 'mod_label', NULL, '2017062800', 'Starting plugin installation', NULL, '', 0, 1502328848),
(112, 0, 'mod_label', '2017062800', '2017062800', 'Upgrade savepoint reached', NULL, '', 0, 1502328849),
(113, 0, 'mod_label', '2017062800', '2017062800', 'Plugin installed', NULL, '', 0, 1502328850),
(114, 0, 'mod_lesson', NULL, '2017051501', 'Starting plugin installation', NULL, '', 0, 1502328850),
(115, 0, 'mod_lesson', '2017051501', '2017051501', 'Upgrade savepoint reached', NULL, '', 0, 1502328854),
(116, 0, 'mod_lesson', '2017051501', '2017051501', 'Plugin installed', NULL, '', 0, 1502328858),
(117, 0, 'mod_lti', NULL, '2017051600', 'Starting plugin installation', NULL, '', 0, 1502328858),
(118, 0, 'mod_lti', '2017051600', '2017051600', 'Upgrade savepoint reached', NULL, '', 0, 1502328861),
(119, 0, 'mod_lti', '2017051600', '2017051600', 'Plugin installed', NULL, '', 0, 1502328863),
(120, 0, 'mod_page', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328863),
(121, 0, 'mod_page', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328864),
(122, 0, 'mod_page', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328865),
(123, 0, 'mod_quiz', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328865),
(124, 0, 'mod_quiz', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328870),
(125, 0, 'mod_quiz', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328875),
(126, 0, 'mod_resource', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328875),
(127, 0, 'mod_resource', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328876),
(128, 0, 'mod_resource', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328877),
(129, 0, 'mod_scorm', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328877),
(130, 0, 'mod_scorm', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328882),
(131, 0, 'mod_scorm', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328884),
(132, 0, 'mod_survey', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328884),
(133, 0, 'mod_survey', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328886),
(134, 0, 'mod_survey', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328891),
(135, 0, 'mod_url', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328891),
(136, 0, 'mod_url', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328892),
(137, 0, 'mod_url', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328892),
(138, 0, 'mod_wiki', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328892),
(139, 0, 'mod_wiki', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328896),
(140, 0, 'mod_wiki', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328898),
(141, 0, 'mod_workshop', NULL, '2017051504', 'Starting plugin installation', NULL, '', 0, 1502328898),
(142, 0, 'mod_workshop', '2017051504', '2017051504', 'Upgrade savepoint reached', NULL, '', 0, 1502328904),
(143, 0, 'mod_workshop', '2017051504', '2017051504', 'Plugin installed', NULL, '', 0, 1502328909),
(144, 0, 'auth_cas', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328909),
(145, 0, 'auth_cas', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328909),
(146, 0, 'auth_cas', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328909),
(147, 0, 'auth_db', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328909),
(148, 0, 'auth_db', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328910),
(149, 0, 'auth_db', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328910),
(150, 0, 'auth_email', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328910),
(151, 0, 'auth_email', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328910),
(152, 0, 'auth_email', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328911),
(153, 0, 'auth_ldap', NULL, '2017080100', 'Starting plugin installation', NULL, '', 0, 1502328911),
(154, 0, 'auth_ldap', '2017080100', '2017080100', 'Upgrade savepoint reached', NULL, '', 0, 1502328911),
(155, 0, 'auth_ldap', '2017080100', '2017080100', 'Plugin installed', NULL, '', 0, 1502328911),
(156, 0, 'auth_lti', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328911),
(157, 0, 'auth_lti', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328911),
(158, 0, 'auth_lti', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328912),
(159, 0, 'auth_manual', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328912),
(160, 0, 'auth_manual', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328912),
(161, 0, 'auth_manual', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328912),
(162, 0, 'auth_mnet', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328912),
(163, 0, 'auth_mnet', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328913),
(164, 0, 'auth_mnet', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328915),
(165, 0, 'auth_nologin', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328915),
(166, 0, 'auth_nologin', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328915),
(167, 0, 'auth_nologin', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328915),
(168, 0, 'auth_none', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328915),
(169, 0, 'auth_none', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328916),
(170, 0, 'auth_none', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328916),
(171, 0, 'auth_oauth2', NULL, '2017051501', 'Starting plugin installation', NULL, '', 0, 1502328916),
(172, 0, 'auth_oauth2', '2017051501', '2017051501', 'Upgrade savepoint reached', NULL, '', 0, 1502328916),
(173, 0, 'auth_oauth2', '2017051501', '2017051501', 'Plugin installed', NULL, '', 0, 1502328917),
(174, 0, 'auth_shibboleth', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328917),
(175, 0, 'auth_shibboleth', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328917),
(176, 0, 'auth_shibboleth', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328917),
(177, 0, 'auth_webservice', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328917),
(178, 0, 'auth_webservice', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328917),
(179, 0, 'auth_webservice', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328917),
(180, 0, 'calendartype_gregorian', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328917),
(181, 0, 'calendartype_gregorian', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328917),
(182, 0, 'calendartype_gregorian', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328918),
(183, 0, 'enrol_category', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328918),
(184, 0, 'enrol_category', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328918),
(185, 0, 'enrol_category', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328918),
(186, 0, 'enrol_cohort', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328918),
(187, 0, 'enrol_cohort', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328918),
(188, 0, 'enrol_cohort', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328919),
(189, 0, 'enrol_database', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328919),
(190, 0, 'enrol_database', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328919),
(191, 0, 'enrol_database', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328919),
(192, 0, 'enrol_flatfile', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328919),
(193, 0, 'enrol_flatfile', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328921),
(194, 0, 'enrol_flatfile', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328921),
(195, 0, 'enrol_guest', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328922),
(196, 0, 'enrol_guest', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328922),
(197, 0, 'enrol_guest', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328922),
(198, 0, 'enrol_imsenterprise', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328922),
(199, 0, 'enrol_imsenterprise', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328922),
(200, 0, 'enrol_imsenterprise', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328922),
(201, 0, 'enrol_ldap', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328922),
(202, 0, 'enrol_ldap', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328922),
(203, 0, 'enrol_ldap', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328923),
(204, 0, 'enrol_lti', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328923),
(205, 0, 'enrol_lti', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328927),
(206, 0, 'enrol_lti', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328928),
(207, 0, 'enrol_manual', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328928),
(208, 0, 'enrol_manual', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328928),
(209, 0, 'enrol_manual', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328928),
(210, 0, 'enrol_meta', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328929),
(211, 0, 'enrol_meta', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328929),
(212, 0, 'enrol_meta', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328929),
(213, 0, 'enrol_mnet', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328929),
(214, 0, 'enrol_mnet', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328929),
(215, 0, 'enrol_mnet', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328931),
(216, 0, 'enrol_paypal', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328931),
(217, 0, 'enrol_paypal', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328931),
(218, 0, 'enrol_paypal', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328932),
(219, 0, 'enrol_self', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328932),
(220, 0, 'enrol_self', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328932),
(221, 0, 'enrol_self', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328932),
(222, 0, 'message_airnotifier', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328933),
(223, 0, 'message_airnotifier', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328933),
(224, 0, 'message_airnotifier', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328934),
(225, 0, 'message_email', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328934),
(226, 0, 'message_email', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328934),
(227, 0, 'message_email', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328936),
(228, 0, 'message_jabber', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328936),
(229, 0, 'message_jabber', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328937),
(230, 0, 'message_jabber', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328937),
(231, 0, 'message_popup', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328937),
(232, 0, 'message_popup', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328938),
(233, 0, 'message_popup', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328939),
(234, 0, 'block_activity_modules', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328939),
(235, 0, 'block_activity_modules', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328939),
(236, 0, 'block_activity_modules', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328939),
(237, 0, 'block_activity_results', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328939),
(238, 0, 'block_activity_results', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328939),
(239, 0, 'block_activity_results', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328940),
(240, 0, 'block_admin_bookmarks', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328940),
(241, 0, 'block_admin_bookmarks', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328940),
(242, 0, 'block_admin_bookmarks', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328940),
(243, 0, 'block_badges', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328940),
(244, 0, 'block_badges', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328940),
(245, 0, 'block_badges', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328941),
(246, 0, 'block_blog_menu', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328941),
(247, 0, 'block_blog_menu', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328941),
(248, 0, 'block_blog_menu', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328941),
(249, 0, 'block_blog_recent', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328941),
(250, 0, 'block_blog_recent', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328941),
(251, 0, 'block_blog_recent', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328942),
(252, 0, 'block_blog_tags', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328942),
(253, 0, 'block_blog_tags', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328942),
(254, 0, 'block_blog_tags', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328942),
(255, 0, 'block_calendar_month', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328942),
(256, 0, 'block_calendar_month', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328943),
(257, 0, 'block_calendar_month', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328943),
(258, 0, 'block_calendar_upcoming', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328943),
(259, 0, 'block_calendar_upcoming', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328943),
(260, 0, 'block_calendar_upcoming', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328944),
(261, 0, 'block_comments', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328944),
(262, 0, 'block_comments', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328944),
(263, 0, 'block_comments', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328944),
(264, 0, 'block_community', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328944),
(265, 0, 'block_community', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328945),
(266, 0, 'block_community', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328945),
(267, 0, 'block_completionstatus', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328945),
(268, 0, 'block_completionstatus', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328945),
(269, 0, 'block_completionstatus', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328946),
(270, 0, 'block_course_list', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328946),
(271, 0, 'block_course_list', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328946),
(272, 0, 'block_course_list', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328946),
(273, 0, 'block_course_summary', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328946),
(274, 0, 'block_course_summary', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328947),
(275, 0, 'block_course_summary', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328947),
(276, 0, 'block_feedback', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328947),
(277, 0, 'block_feedback', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328947),
(278, 0, 'block_feedback', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328948),
(279, 0, 'block_globalsearch', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328948),
(280, 0, 'block_globalsearch', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328948),
(281, 0, 'block_globalsearch', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328949),
(282, 0, 'block_glossary_random', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328949),
(283, 0, 'block_glossary_random', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328949),
(284, 0, 'block_glossary_random', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328950),
(285, 0, 'block_html', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328950),
(286, 0, 'block_html', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328950),
(287, 0, 'block_html', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328950),
(288, 0, 'block_login', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328951),
(289, 0, 'block_login', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328951),
(290, 0, 'block_login', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328951),
(291, 0, 'block_lp', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328951),
(292, 0, 'block_lp', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328951),
(293, 0, 'block_lp', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328952),
(294, 0, 'block_mentees', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328952),
(295, 0, 'block_mentees', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328952),
(296, 0, 'block_mentees', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328953),
(297, 0, 'block_messages', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328953),
(298, 0, 'block_messages', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328953),
(299, 0, 'block_messages', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328954),
(300, 0, 'block_mnet_hosts', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328954),
(301, 0, 'block_mnet_hosts', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328954),
(302, 0, 'block_mnet_hosts', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328954),
(303, 0, 'block_myoverview', NULL, '2017051502', 'Starting plugin installation', NULL, '', 0, 1502328954),
(304, 0, 'block_myoverview', '2017051502', '2017051502', 'Upgrade savepoint reached', NULL, '', 0, 1502328954),
(305, 0, 'block_myoverview', '2017051502', '2017051502', 'Plugin installed', NULL, '', 0, 1502328955),
(306, 0, 'block_myprofile', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328955),
(307, 0, 'block_myprofile', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328955),
(308, 0, 'block_myprofile', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328955),
(309, 0, 'block_navigation', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328956),
(310, 0, 'block_navigation', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328956),
(311, 0, 'block_navigation', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328956),
(312, 0, 'block_news_items', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328956),
(313, 0, 'block_news_items', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328956),
(314, 0, 'block_news_items', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328956),
(315, 0, 'block_online_users', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328956),
(316, 0, 'block_online_users', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328957),
(317, 0, 'block_online_users', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328957),
(318, 0, 'block_participants', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328957),
(319, 0, 'block_participants', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328957),
(320, 0, 'block_participants', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328958),
(321, 0, 'block_private_files', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328958),
(322, 0, 'block_private_files', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328958),
(323, 0, 'block_private_files', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328958),
(324, 0, 'block_quiz_results', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328958),
(325, 0, 'block_quiz_results', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328958),
(326, 0, 'block_quiz_results', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328959),
(327, 0, 'block_recent_activity', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328959),
(328, 0, 'block_recent_activity', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328959),
(329, 0, 'block_recent_activity', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328960),
(330, 0, 'block_rss_client', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328960),
(331, 0, 'block_rss_client', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328960),
(332, 0, 'block_rss_client', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328961),
(333, 0, 'block_search_forums', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328961),
(334, 0, 'block_search_forums', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328961),
(335, 0, 'block_search_forums', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328962),
(336, 0, 'block_section_links', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328962),
(337, 0, 'block_section_links', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328962),
(338, 0, 'block_section_links', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328962),
(339, 0, 'block_selfcompletion', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328963),
(340, 0, 'block_selfcompletion', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328963),
(341, 0, 'block_selfcompletion', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328963),
(342, 0, 'block_settings', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328963),
(343, 0, 'block_settings', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328963),
(344, 0, 'block_settings', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328964),
(345, 0, 'block_site_main_menu', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328964),
(346, 0, 'block_site_main_menu', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328964),
(347, 0, 'block_site_main_menu', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328964),
(348, 0, 'block_social_activities', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328964),
(349, 0, 'block_social_activities', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328964),
(350, 0, 'block_social_activities', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328965),
(351, 0, 'block_tag_flickr', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328965),
(352, 0, 'block_tag_flickr', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328965),
(353, 0, 'block_tag_flickr', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328965),
(354, 0, 'block_tag_youtube', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328965),
(355, 0, 'block_tag_youtube', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328966),
(356, 0, 'block_tag_youtube', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328966),
(357, 0, 'block_tags', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328966),
(358, 0, 'block_tags', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328966),
(359, 0, 'block_tags', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328967),
(360, 0, 'media_html5audio', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328968),
(361, 0, 'media_html5audio', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328968),
(362, 0, 'media_html5audio', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328968),
(363, 0, 'media_html5video', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328968),
(364, 0, 'media_html5video', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328968),
(365, 0, 'media_html5video', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328968),
(366, 0, 'media_swf', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328968),
(367, 0, 'media_swf', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328968),
(368, 0, 'media_swf', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328968),
(369, 0, 'media_videojs', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328969),
(370, 0, 'media_videojs', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328969),
(371, 0, 'media_videojs', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328969),
(372, 0, 'media_vimeo', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328969),
(373, 0, 'media_vimeo', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328969),
(374, 0, 'media_vimeo', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328969),
(375, 0, 'media_youtube', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328969),
(376, 0, 'media_youtube', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328969),
(377, 0, 'media_youtube', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328970),
(378, 0, 'filter_activitynames', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328970),
(379, 0, 'filter_activitynames', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328970),
(380, 0, 'filter_activitynames', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328970),
(381, 0, 'filter_algebra', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328970),
(382, 0, 'filter_algebra', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328970),
(383, 0, 'filter_algebra', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328971),
(384, 0, 'filter_censor', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328971),
(385, 0, 'filter_censor', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328971),
(386, 0, 'filter_censor', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328971),
(387, 0, 'filter_data', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328972),
(388, 0, 'filter_data', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328972),
(389, 0, 'filter_data', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328972),
(390, 0, 'filter_emailprotect', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328972),
(391, 0, 'filter_emailprotect', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328972),
(392, 0, 'filter_emailprotect', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328972),
(393, 0, 'filter_emoticon', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328972),
(394, 0, 'filter_emoticon', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328972),
(395, 0, 'filter_emoticon', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328973),
(396, 0, 'filter_glossary', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328973),
(397, 0, 'filter_glossary', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328973),
(398, 0, 'filter_glossary', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328973),
(399, 0, 'filter_mathjaxloader', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328973),
(400, 0, 'filter_mathjaxloader', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328973),
(401, 0, 'filter_mathjaxloader', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328973),
(402, 0, 'filter_mediaplugin', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328974),
(403, 0, 'filter_mediaplugin', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328974),
(404, 0, 'filter_mediaplugin', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328974),
(405, 0, 'filter_multilang', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328974),
(406, 0, 'filter_multilang', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328974),
(407, 0, 'filter_multilang', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328974),
(408, 0, 'filter_tex', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328974),
(409, 0, 'filter_tex', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328974),
(410, 0, 'filter_tex', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328975),
(411, 0, 'filter_tidy', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328975),
(412, 0, 'filter_tidy', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328975),
(413, 0, 'filter_tidy', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328975),
(414, 0, 'filter_urltolink', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328975),
(415, 0, 'filter_urltolink', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328975),
(416, 0, 'filter_urltolink', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328975),
(417, 0, 'editor_atto', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328975),
(418, 0, 'editor_atto', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328976),
(419, 0, 'editor_atto', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328976),
(420, 0, 'editor_textarea', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328977),
(421, 0, 'editor_textarea', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328977),
(422, 0, 'editor_textarea', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328977),
(423, 0, 'editor_tinymce', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328977),
(424, 0, 'editor_tinymce', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328977),
(425, 0, 'editor_tinymce', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328977),
(426, 0, 'format_singleactivity', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328977),
(427, 0, 'format_singleactivity', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328978),
(428, 0, 'format_singleactivity', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328978),
(429, 0, 'format_social', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328978),
(430, 0, 'format_social', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328978),
(431, 0, 'format_social', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328978),
(432, 0, 'format_topics', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328978),
(433, 0, 'format_topics', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328978),
(434, 0, 'format_topics', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328978),
(435, 0, 'format_weeks', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328978),
(436, 0, 'format_weeks', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328978),
(437, 0, 'format_weeks', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328979),
(438, 0, 'dataformat_csv', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328979),
(439, 0, 'dataformat_csv', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328979),
(440, 0, 'dataformat_csv', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328979),
(441, 0, 'dataformat_excel', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328979),
(442, 0, 'dataformat_excel', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328979),
(443, 0, 'dataformat_excel', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328979),
(444, 0, 'dataformat_html', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328979),
(445, 0, 'dataformat_html', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328979),
(446, 0, 'dataformat_html', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328979),
(447, 0, 'dataformat_json', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328980),
(448, 0, 'dataformat_json', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328980),
(449, 0, 'dataformat_json', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328980),
(450, 0, 'dataformat_ods', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328980),
(451, 0, 'dataformat_ods', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328980),
(452, 0, 'dataformat_ods', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328980),
(453, 0, 'profilefield_checkbox', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328980),
(454, 0, 'profilefield_checkbox', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328980),
(455, 0, 'profilefield_checkbox', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328981),
(456, 0, 'profilefield_datetime', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328981),
(457, 0, 'profilefield_datetime', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328981),
(458, 0, 'profilefield_datetime', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328981),
(459, 0, 'profilefield_menu', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328981),
(460, 0, 'profilefield_menu', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328981),
(461, 0, 'profilefield_menu', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328981),
(462, 0, 'profilefield_text', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328981),
(463, 0, 'profilefield_text', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328981),
(464, 0, 'profilefield_text', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328982),
(465, 0, 'profilefield_textarea', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328982),
(466, 0, 'profilefield_textarea', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328982),
(467, 0, 'profilefield_textarea', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328982),
(468, 0, 'report_backups', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328982),
(469, 0, 'report_backups', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328982),
(470, 0, 'report_backups', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328982),
(471, 0, 'report_competency', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328982),
(472, 0, 'report_competency', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328982),
(473, 0, 'report_competency', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328983),
(474, 0, 'report_completion', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328983),
(475, 0, 'report_completion', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328983),
(476, 0, 'report_completion', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328983),
(477, 0, 'report_configlog', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328983),
(478, 0, 'report_configlog', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328983),
(479, 0, 'report_configlog', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328984),
(480, 0, 'report_courseoverview', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328984);
INSERT DELAYED IGNORE INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(481, 0, 'report_courseoverview', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328984),
(482, 0, 'report_courseoverview', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328984),
(483, 0, 'report_eventlist', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328984),
(484, 0, 'report_eventlist', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328985),
(485, 0, 'report_eventlist', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328985),
(486, 0, 'report_insights', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328985),
(487, 0, 'report_insights', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328985),
(488, 0, 'report_insights', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328985),
(489, 0, 'report_log', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328986),
(490, 0, 'report_log', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328986),
(491, 0, 'report_log', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328986),
(492, 0, 'report_loglive', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328986),
(493, 0, 'report_loglive', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328986),
(494, 0, 'report_loglive', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328987),
(495, 0, 'report_outline', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328988),
(496, 0, 'report_outline', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328988),
(497, 0, 'report_outline', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328988),
(498, 0, 'report_participation', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328988),
(499, 0, 'report_participation', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328988),
(500, 0, 'report_participation', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328989),
(501, 0, 'report_performance', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328989),
(502, 0, 'report_performance', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328989),
(503, 0, 'report_performance', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328989),
(504, 0, 'report_progress', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328989),
(505, 0, 'report_progress', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328989),
(506, 0, 'report_progress', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328990),
(507, 0, 'report_questioninstances', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328990),
(508, 0, 'report_questioninstances', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328990),
(509, 0, 'report_questioninstances', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328990),
(510, 0, 'report_security', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328990),
(511, 0, 'report_security', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328990),
(512, 0, 'report_security', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328990),
(513, 0, 'report_stats', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328990),
(514, 0, 'report_stats', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328990),
(515, 0, 'report_stats', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328991),
(516, 0, 'report_usersessions', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328991),
(517, 0, 'report_usersessions', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328991),
(518, 0, 'report_usersessions', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328991),
(519, 0, 'gradeexport_ods', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328991),
(520, 0, 'gradeexport_ods', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328991),
(521, 0, 'gradeexport_ods', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328992),
(522, 0, 'gradeexport_txt', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328992),
(523, 0, 'gradeexport_txt', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328992),
(524, 0, 'gradeexport_txt', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328993),
(525, 0, 'gradeexport_xls', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328993),
(526, 0, 'gradeexport_xls', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328993),
(527, 0, 'gradeexport_xls', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328993),
(528, 0, 'gradeexport_xml', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328993),
(529, 0, 'gradeexport_xml', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328993),
(530, 0, 'gradeexport_xml', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328994),
(531, 0, 'gradeimport_csv', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328994),
(532, 0, 'gradeimport_csv', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328994),
(533, 0, 'gradeimport_csv', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328994),
(534, 0, 'gradeimport_direct', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328994),
(535, 0, 'gradeimport_direct', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328994),
(536, 0, 'gradeimport_direct', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328994),
(537, 0, 'gradeimport_xml', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328995),
(538, 0, 'gradeimport_xml', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328995),
(539, 0, 'gradeimport_xml', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328995),
(540, 0, 'gradereport_grader', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328995),
(541, 0, 'gradereport_grader', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328995),
(542, 0, 'gradereport_grader', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328995),
(543, 0, 'gradereport_history', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328996),
(544, 0, 'gradereport_history', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328996),
(545, 0, 'gradereport_history', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328997),
(546, 0, 'gradereport_outcomes', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502328997),
(547, 0, 'gradereport_outcomes', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502328997),
(548, 0, 'gradereport_outcomes', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502328998),
(549, 0, 'gradereport_overview', NULL, '2017051501', 'Starting plugin installation', NULL, '', 0, 1502328998),
(550, 0, 'gradereport_overview', '2017051501', '2017051501', 'Upgrade savepoint reached', NULL, '', 0, 1502328998),
(551, 0, 'gradereport_overview', '2017051501', '2017051501', 'Plugin installed', NULL, '', 0, 1502328999),
(552, 0, 'gradereport_singleview', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329000),
(553, 0, 'gradereport_singleview', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329000),
(554, 0, 'gradereport_singleview', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329000),
(555, 0, 'gradereport_user', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329000),
(556, 0, 'gradereport_user', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329001),
(557, 0, 'gradereport_user', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329002),
(558, 0, 'gradingform_guide', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329002),
(559, 0, 'gradingform_guide', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329004),
(560, 0, 'gradingform_guide', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329004),
(561, 0, 'gradingform_rubric', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329004),
(562, 0, 'gradingform_rubric', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329005),
(563, 0, 'gradingform_rubric', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329006),
(564, 0, 'mlbackend_php', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329006),
(565, 0, 'mlbackend_php', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329006),
(566, 0, 'mlbackend_php', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329006),
(567, 0, 'mlbackend_python', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329006),
(568, 0, 'mlbackend_python', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329006),
(569, 0, 'mlbackend_python', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329006),
(570, 0, 'mnetservice_enrol', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329006),
(571, 0, 'mnetservice_enrol', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329007),
(572, 0, 'mnetservice_enrol', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329007),
(573, 0, 'webservice_rest', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329007),
(574, 0, 'webservice_rest', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329008),
(575, 0, 'webservice_rest', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329008),
(576, 0, 'webservice_soap', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329008),
(577, 0, 'webservice_soap', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329008),
(578, 0, 'webservice_soap', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329008),
(579, 0, 'webservice_xmlrpc', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329008),
(580, 0, 'webservice_xmlrpc', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329008),
(581, 0, 'webservice_xmlrpc', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329008),
(582, 0, 'repository_areafiles', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329009),
(583, 0, 'repository_areafiles', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329009),
(584, 0, 'repository_areafiles', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329009),
(585, 0, 'repository_boxnet', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329009),
(586, 0, 'repository_boxnet', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329009),
(587, 0, 'repository_boxnet', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329009),
(588, 0, 'repository_coursefiles', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329010),
(589, 0, 'repository_coursefiles', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329010),
(590, 0, 'repository_coursefiles', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329010),
(591, 0, 'repository_dropbox', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329010),
(592, 0, 'repository_dropbox', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329010),
(593, 0, 'repository_dropbox', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329011),
(594, 0, 'repository_equella', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329011),
(595, 0, 'repository_equella', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329011),
(596, 0, 'repository_equella', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329012),
(597, 0, 'repository_filesystem', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329012),
(598, 0, 'repository_filesystem', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329012),
(599, 0, 'repository_filesystem', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329012),
(600, 0, 'repository_flickr', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329012),
(601, 0, 'repository_flickr', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329012),
(602, 0, 'repository_flickr', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329012),
(603, 0, 'repository_flickr_public', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329012),
(604, 0, 'repository_flickr_public', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329013),
(605, 0, 'repository_flickr_public', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329013),
(606, 0, 'repository_googledocs', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329013),
(607, 0, 'repository_googledocs', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329013),
(608, 0, 'repository_googledocs', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329013),
(609, 0, 'repository_local', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329013),
(610, 0, 'repository_local', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329013),
(611, 0, 'repository_local', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329014),
(612, 0, 'repository_merlot', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329015),
(613, 0, 'repository_merlot', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329015),
(614, 0, 'repository_merlot', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329015),
(615, 0, 'repository_onedrive', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329015),
(616, 0, 'repository_onedrive', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329015),
(617, 0, 'repository_onedrive', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329016),
(618, 0, 'repository_picasa', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329016),
(619, 0, 'repository_picasa', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329016),
(620, 0, 'repository_picasa', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329016),
(621, 0, 'repository_recent', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329016),
(622, 0, 'repository_recent', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329016),
(623, 0, 'repository_recent', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329017),
(624, 0, 'repository_s3', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329017),
(625, 0, 'repository_s3', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329017),
(626, 0, 'repository_s3', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329017),
(627, 0, 'repository_skydrive', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329017),
(628, 0, 'repository_skydrive', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329017),
(629, 0, 'repository_skydrive', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329018),
(630, 0, 'repository_upload', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329018),
(631, 0, 'repository_upload', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329018),
(632, 0, 'repository_upload', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329018),
(633, 0, 'repository_url', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329018),
(634, 0, 'repository_url', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329019),
(635, 0, 'repository_url', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329019),
(636, 0, 'repository_user', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329019),
(637, 0, 'repository_user', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329019),
(638, 0, 'repository_user', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329020),
(639, 0, 'repository_webdav', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329020),
(640, 0, 'repository_webdav', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329020),
(641, 0, 'repository_webdav', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329020),
(642, 0, 'repository_wikimedia', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329020),
(643, 0, 'repository_wikimedia', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329020),
(644, 0, 'repository_wikimedia', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329021),
(645, 0, 'repository_youtube', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329021),
(646, 0, 'repository_youtube', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329021),
(647, 0, 'repository_youtube', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329021),
(648, 0, 'portfolio_boxnet', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329021),
(649, 0, 'portfolio_boxnet', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329021),
(650, 0, 'portfolio_boxnet', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329022),
(651, 0, 'portfolio_download', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329022),
(652, 0, 'portfolio_download', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329022),
(653, 0, 'portfolio_download', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329022),
(654, 0, 'portfolio_flickr', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329022),
(655, 0, 'portfolio_flickr', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329023),
(656, 0, 'portfolio_flickr', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329023),
(657, 0, 'portfolio_googledocs', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329023),
(658, 0, 'portfolio_googledocs', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329023),
(659, 0, 'portfolio_googledocs', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329023),
(660, 0, 'portfolio_mahara', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329023),
(661, 0, 'portfolio_mahara', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329024),
(662, 0, 'portfolio_mahara', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329025),
(663, 0, 'portfolio_picasa', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329025),
(664, 0, 'portfolio_picasa', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329026),
(665, 0, 'portfolio_picasa', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329026),
(666, 0, 'search_solr', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329026),
(667, 0, 'search_solr', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329027),
(668, 0, 'search_solr', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329027),
(669, 0, 'qbehaviour_adaptive', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329027),
(670, 0, 'qbehaviour_adaptive', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329027),
(671, 0, 'qbehaviour_adaptive', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329027),
(672, 0, 'qbehaviour_adaptivenopenalty', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329028),
(673, 0, 'qbehaviour_adaptivenopenalty', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329028),
(674, 0, 'qbehaviour_adaptivenopenalty', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329028),
(675, 0, 'qbehaviour_deferredcbm', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329028),
(676, 0, 'qbehaviour_deferredcbm', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329028),
(677, 0, 'qbehaviour_deferredcbm', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329028),
(678, 0, 'qbehaviour_deferredfeedback', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329028),
(679, 0, 'qbehaviour_deferredfeedback', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329028),
(680, 0, 'qbehaviour_deferredfeedback', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329029),
(681, 0, 'qbehaviour_immediatecbm', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329029),
(682, 0, 'qbehaviour_immediatecbm', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329029),
(683, 0, 'qbehaviour_immediatecbm', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329029),
(684, 0, 'qbehaviour_immediatefeedback', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329029),
(685, 0, 'qbehaviour_immediatefeedback', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329029),
(686, 0, 'qbehaviour_immediatefeedback', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329029),
(687, 0, 'qbehaviour_informationitem', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329029),
(688, 0, 'qbehaviour_informationitem', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329029),
(689, 0, 'qbehaviour_informationitem', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329030),
(690, 0, 'qbehaviour_interactive', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329030),
(691, 0, 'qbehaviour_interactive', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329030),
(692, 0, 'qbehaviour_interactive', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329030),
(693, 0, 'qbehaviour_interactivecountback', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329030),
(694, 0, 'qbehaviour_interactivecountback', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329030),
(695, 0, 'qbehaviour_interactivecountback', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329030),
(696, 0, 'qbehaviour_manualgraded', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329031),
(697, 0, 'qbehaviour_manualgraded', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329031),
(698, 0, 'qbehaviour_manualgraded', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329031),
(699, 0, 'qbehaviour_missing', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329031),
(700, 0, 'qbehaviour_missing', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329031),
(701, 0, 'qbehaviour_missing', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329031),
(702, 0, 'qformat_aiken', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329031),
(703, 0, 'qformat_aiken', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329032),
(704, 0, 'qformat_aiken', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329032),
(705, 0, 'qformat_blackboard_six', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329032),
(706, 0, 'qformat_blackboard_six', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329032),
(707, 0, 'qformat_blackboard_six', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329032),
(708, 0, 'qformat_examview', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329032),
(709, 0, 'qformat_examview', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329032),
(710, 0, 'qformat_examview', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329033),
(711, 0, 'qformat_gift', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329033),
(712, 0, 'qformat_gift', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329033),
(713, 0, 'qformat_gift', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329033),
(714, 0, 'qformat_missingword', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329033),
(715, 0, 'qformat_missingword', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329033),
(716, 0, 'qformat_missingword', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329033),
(717, 0, 'qformat_multianswer', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329033),
(718, 0, 'qformat_multianswer', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329033),
(719, 0, 'qformat_multianswer', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329034),
(720, 0, 'qformat_webct', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329034),
(721, 0, 'qformat_webct', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329034),
(722, 0, 'qformat_webct', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329034),
(723, 0, 'qformat_xhtml', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329034),
(724, 0, 'qformat_xhtml', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329034),
(725, 0, 'qformat_xhtml', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329034),
(726, 0, 'qformat_xml', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329034),
(727, 0, 'qformat_xml', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329034),
(728, 0, 'qformat_xml', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329035),
(729, 0, 'tool_analytics', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329035),
(730, 0, 'tool_analytics', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329035),
(731, 0, 'tool_analytics', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329035),
(732, 0, 'tool_assignmentupgrade', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329035),
(733, 0, 'tool_assignmentupgrade', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329035),
(734, 0, 'tool_assignmentupgrade', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329035),
(735, 0, 'tool_availabilityconditions', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329035),
(736, 0, 'tool_availabilityconditions', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329036),
(737, 0, 'tool_availabilityconditions', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329036),
(738, 0, 'tool_behat', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329036),
(739, 0, 'tool_behat', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329036),
(740, 0, 'tool_behat', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329036),
(741, 0, 'tool_capability', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329036),
(742, 0, 'tool_capability', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329036),
(743, 0, 'tool_capability', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329036),
(744, 0, 'tool_cohortroles', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329036),
(745, 0, 'tool_cohortroles', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329037),
(746, 0, 'tool_cohortroles', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329038),
(747, 0, 'tool_customlang', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329038),
(748, 0, 'tool_customlang', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329040),
(749, 0, 'tool_customlang', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329041),
(750, 0, 'tool_dbtransfer', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329041),
(751, 0, 'tool_dbtransfer', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329041),
(752, 0, 'tool_dbtransfer', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329042),
(753, 0, 'tool_filetypes', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329042),
(754, 0, 'tool_filetypes', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329042),
(755, 0, 'tool_filetypes', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329042),
(756, 0, 'tool_generator', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329042),
(757, 0, 'tool_generator', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329042),
(758, 0, 'tool_generator', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329043),
(759, 0, 'tool_health', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329043),
(760, 0, 'tool_health', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329044),
(761, 0, 'tool_health', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329044),
(762, 0, 'tool_innodb', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329045),
(763, 0, 'tool_innodb', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329045),
(764, 0, 'tool_innodb', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329045),
(765, 0, 'tool_installaddon', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329045),
(766, 0, 'tool_installaddon', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329045),
(767, 0, 'tool_installaddon', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329045),
(768, 0, 'tool_langimport', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329045),
(769, 0, 'tool_langimport', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329045),
(770, 0, 'tool_langimport', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329046),
(771, 0, 'tool_log', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329046),
(772, 0, 'tool_log', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329046),
(773, 0, 'tool_log', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329047),
(774, 0, 'tool_lp', NULL, '2017062700', 'Starting plugin installation', NULL, '', 0, 1502329047),
(775, 0, 'tool_lp', '2017062700', '2017062700', 'Upgrade savepoint reached', NULL, '', 0, 1502329047),
(776, 0, 'tool_lp', '2017062700', '2017062700', 'Plugin installed', NULL, '', 0, 1502329047),
(777, 0, 'tool_lpimportcsv', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329048),
(778, 0, 'tool_lpimportcsv', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329048),
(779, 0, 'tool_lpimportcsv', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329048),
(780, 0, 'tool_lpmigrate', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329048),
(781, 0, 'tool_lpmigrate', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329048),
(782, 0, 'tool_lpmigrate', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329049),
(783, 0, 'tool_messageinbound', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329049),
(784, 0, 'tool_messageinbound', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329049),
(785, 0, 'tool_messageinbound', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329050),
(786, 0, 'tool_mobile', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329050),
(787, 0, 'tool_mobile', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329050),
(788, 0, 'tool_mobile', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329050),
(789, 0, 'tool_monitor', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329050),
(790, 0, 'tool_monitor', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329053),
(791, 0, 'tool_monitor', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329054),
(792, 0, 'tool_multilangupgrade', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329054),
(793, 0, 'tool_multilangupgrade', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329054),
(794, 0, 'tool_multilangupgrade', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329054),
(795, 0, 'tool_oauth2', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329054),
(796, 0, 'tool_oauth2', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329055),
(797, 0, 'tool_oauth2', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329055),
(798, 0, 'tool_phpunit', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329055),
(799, 0, 'tool_phpunit', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329055),
(800, 0, 'tool_phpunit', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329055),
(801, 0, 'tool_profiling', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329055),
(802, 0, 'tool_profiling', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329056),
(803, 0, 'tool_profiling', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329056),
(804, 0, 'tool_recyclebin', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329056),
(805, 0, 'tool_recyclebin', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329057),
(806, 0, 'tool_recyclebin', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329058),
(807, 0, 'tool_replace', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329058),
(808, 0, 'tool_replace', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329058),
(809, 0, 'tool_replace', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329058),
(810, 0, 'tool_spamcleaner', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329058),
(811, 0, 'tool_spamcleaner', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329058),
(812, 0, 'tool_spamcleaner', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329059),
(813, 0, 'tool_task', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329059),
(814, 0, 'tool_task', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329059),
(815, 0, 'tool_task', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329059),
(816, 0, 'tool_templatelibrary', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329059),
(817, 0, 'tool_templatelibrary', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329059),
(818, 0, 'tool_templatelibrary', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329061),
(819, 0, 'tool_unsuproles', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329061),
(820, 0, 'tool_unsuproles', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329061),
(821, 0, 'tool_unsuproles', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329061),
(822, 0, 'tool_uploadcourse', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329061),
(823, 0, 'tool_uploadcourse', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329061),
(824, 0, 'tool_uploadcourse', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329061),
(825, 0, 'tool_uploaduser', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329061),
(826, 0, 'tool_uploaduser', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329062),
(827, 0, 'tool_uploaduser', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329062),
(828, 0, 'tool_usertours', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329062),
(829, 0, 'tool_usertours', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329063),
(830, 0, 'tool_usertours', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329067),
(831, 0, 'tool_xmldb', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329068),
(832, 0, 'tool_xmldb', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329068),
(833, 0, 'tool_xmldb', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329068),
(834, 0, 'cachestore_apcu', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329068),
(835, 0, 'cachestore_apcu', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329068),
(836, 0, 'cachestore_apcu', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329068),
(837, 0, 'cachestore_file', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329068),
(838, 0, 'cachestore_file', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329068),
(839, 0, 'cachestore_file', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329069),
(840, 0, 'cachestore_memcache', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329069),
(841, 0, 'cachestore_memcache', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329069),
(842, 0, 'cachestore_memcache', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329069),
(843, 0, 'cachestore_memcached', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329069),
(844, 0, 'cachestore_memcached', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329069),
(845, 0, 'cachestore_memcached', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329069),
(846, 0, 'cachestore_mongodb', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329070),
(847, 0, 'cachestore_mongodb', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329070),
(848, 0, 'cachestore_mongodb', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329070),
(849, 0, 'cachestore_redis', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329070),
(850, 0, 'cachestore_redis', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329070),
(851, 0, 'cachestore_redis', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329070),
(852, 0, 'cachestore_session', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329070),
(853, 0, 'cachestore_session', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329071),
(854, 0, 'cachestore_session', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329071),
(855, 0, 'cachestore_static', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329071),
(856, 0, 'cachestore_static', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329071),
(857, 0, 'cachestore_static', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329072),
(858, 0, 'cachelock_file', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329072),
(859, 0, 'cachelock_file', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329072),
(860, 0, 'cachelock_file', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329072),
(861, 0, 'fileconverter_googledrive', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329072),
(862, 0, 'fileconverter_googledrive', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329072),
(863, 0, 'fileconverter_googledrive', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329072),
(864, 0, 'fileconverter_unoconv', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329072),
(865, 0, 'fileconverter_unoconv', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329073),
(866, 0, 'fileconverter_unoconv', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329073),
(867, 0, 'theme_boost', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329073),
(868, 0, 'theme_boost', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329073),
(869, 0, 'theme_boost', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329073),
(870, 0, 'theme_bootstrapbase', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329073),
(871, 0, 'theme_bootstrapbase', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329073),
(872, 0, 'theme_bootstrapbase', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329074),
(873, 0, 'theme_clean', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329074),
(874, 0, 'theme_clean', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329074),
(875, 0, 'theme_clean', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329074),
(876, 0, 'theme_more', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329074),
(877, 0, 'theme_more', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329074),
(878, 0, 'theme_more', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329075),
(879, 0, 'assignsubmission_comments', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329075),
(880, 0, 'assignsubmission_comments', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329075),
(881, 0, 'assignsubmission_comments', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329075),
(882, 0, 'assignsubmission_file', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329076),
(883, 0, 'assignsubmission_file', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329076),
(884, 0, 'assignsubmission_file', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329076),
(885, 0, 'assignsubmission_onlinetext', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329076),
(886, 0, 'assignsubmission_onlinetext', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329077),
(887, 0, 'assignsubmission_onlinetext', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329077),
(888, 0, 'assignfeedback_comments', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329078),
(889, 0, 'assignfeedback_comments', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329078),
(890, 0, 'assignfeedback_comments', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329078),
(891, 0, 'assignfeedback_editpdf', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329078),
(892, 0, 'assignfeedback_editpdf', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329080),
(893, 0, 'assignfeedback_editpdf', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329081),
(894, 0, 'assignfeedback_file', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329081),
(895, 0, 'assignfeedback_file', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329082),
(896, 0, 'assignfeedback_file', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329082),
(897, 0, 'assignfeedback_offline', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329082),
(898, 0, 'assignfeedback_offline', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329083),
(899, 0, 'assignfeedback_offline', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329083),
(900, 0, 'assignment_offline', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329083),
(901, 0, 'assignment_offline', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329083),
(902, 0, 'assignment_offline', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329083),
(903, 0, 'assignment_online', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329083),
(904, 0, 'assignment_online', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329083),
(905, 0, 'assignment_online', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329084),
(906, 0, 'assignment_upload', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329084),
(907, 0, 'assignment_upload', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329084),
(908, 0, 'assignment_upload', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329084),
(909, 0, 'assignment_uploadsingle', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329084),
(910, 0, 'assignment_uploadsingle', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329084),
(911, 0, 'assignment_uploadsingle', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329084),
(912, 0, 'booktool_exportimscp', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329084),
(913, 0, 'booktool_exportimscp', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329084),
(914, 0, 'booktool_exportimscp', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329085),
(915, 0, 'booktool_importhtml', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329085),
(916, 0, 'booktool_importhtml', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329085),
(917, 0, 'booktool_importhtml', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329085),
(918, 0, 'booktool_print', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329085),
(919, 0, 'booktool_print', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329085),
(920, 0, 'booktool_print', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329086),
(921, 0, 'datafield_checkbox', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329086),
(922, 0, 'datafield_checkbox', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329086),
(923, 0, 'datafield_checkbox', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329086),
(924, 0, 'datafield_date', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329086),
(925, 0, 'datafield_date', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329087),
(926, 0, 'datafield_date', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329087),
(927, 0, 'datafield_file', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329087),
(928, 0, 'datafield_file', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329087),
(929, 0, 'datafield_file', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329087),
(930, 0, 'datafield_latlong', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329087),
(931, 0, 'datafield_latlong', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329087),
(932, 0, 'datafield_latlong', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329088),
(933, 0, 'datafield_menu', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329088),
(934, 0, 'datafield_menu', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329088),
(935, 0, 'datafield_menu', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329088),
(936, 0, 'datafield_multimenu', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329088),
(937, 0, 'datafield_multimenu', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329088),
(938, 0, 'datafield_multimenu', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329088),
(939, 0, 'datafield_number', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329088),
(940, 0, 'datafield_number', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329088),
(941, 0, 'datafield_number', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329089),
(942, 0, 'datafield_picture', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329089),
(943, 0, 'datafield_picture', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329089),
(944, 0, 'datafield_picture', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329089),
(945, 0, 'datafield_radiobutton', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329089),
(946, 0, 'datafield_radiobutton', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329089),
(947, 0, 'datafield_radiobutton', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329089),
(948, 0, 'datafield_text', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329090);
INSERT DELAYED IGNORE INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(949, 0, 'datafield_text', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329090),
(950, 0, 'datafield_text', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329090),
(951, 0, 'datafield_textarea', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329090),
(952, 0, 'datafield_textarea', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329090),
(953, 0, 'datafield_textarea', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329091),
(954, 0, 'datafield_url', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329091),
(955, 0, 'datafield_url', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329091),
(956, 0, 'datafield_url', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329091),
(957, 0, 'datapreset_imagegallery', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329091),
(958, 0, 'datapreset_imagegallery', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329091),
(959, 0, 'datapreset_imagegallery', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329091),
(960, 0, 'ltiservice_memberships', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329091),
(961, 0, 'ltiservice_memberships', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329091),
(962, 0, 'ltiservice_memberships', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329092),
(963, 0, 'ltiservice_profile', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329092),
(964, 0, 'ltiservice_profile', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329092),
(965, 0, 'ltiservice_profile', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329092),
(966, 0, 'ltiservice_toolproxy', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329092),
(967, 0, 'ltiservice_toolproxy', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329092),
(968, 0, 'ltiservice_toolproxy', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329093),
(969, 0, 'ltiservice_toolsettings', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329093),
(970, 0, 'ltiservice_toolsettings', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329093),
(971, 0, 'ltiservice_toolsettings', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329093),
(972, 0, 'quiz_grading', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329093),
(973, 0, 'quiz_grading', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329093),
(974, 0, 'quiz_grading', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329094),
(975, 0, 'quiz_overview', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329094),
(976, 0, 'quiz_overview', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329094),
(977, 0, 'quiz_overview', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329094),
(978, 0, 'quiz_responses', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329094),
(979, 0, 'quiz_responses', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329095),
(980, 0, 'quiz_responses', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329095),
(981, 0, 'quiz_statistics', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329095),
(982, 0, 'quiz_statistics', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329095),
(983, 0, 'quiz_statistics', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329096),
(984, 0, 'quizaccess_delaybetweenattempts', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329096),
(985, 0, 'quizaccess_delaybetweenattempts', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329096),
(986, 0, 'quizaccess_delaybetweenattempts', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329096),
(987, 0, 'quizaccess_ipaddress', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329096),
(988, 0, 'quizaccess_ipaddress', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329096),
(989, 0, 'quizaccess_ipaddress', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329096),
(990, 0, 'quizaccess_numattempts', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329096),
(991, 0, 'quizaccess_numattempts', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329096),
(992, 0, 'quizaccess_numattempts', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329097),
(993, 0, 'quizaccess_offlineattempts', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329097),
(994, 0, 'quizaccess_offlineattempts', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329097),
(995, 0, 'quizaccess_offlineattempts', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329097),
(996, 0, 'quizaccess_openclosedate', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329097),
(997, 0, 'quizaccess_openclosedate', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329097),
(998, 0, 'quizaccess_openclosedate', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329097),
(999, 0, 'quizaccess_password', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329097),
(1000, 0, 'quizaccess_password', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329098),
(1001, 0, 'quizaccess_password', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329098),
(1002, 0, 'quizaccess_safebrowser', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329098),
(1003, 0, 'quizaccess_safebrowser', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329098),
(1004, 0, 'quizaccess_safebrowser', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329098),
(1005, 0, 'quizaccess_securewindow', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329098),
(1006, 0, 'quizaccess_securewindow', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329098),
(1007, 0, 'quizaccess_securewindow', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329099),
(1008, 0, 'quizaccess_timelimit', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329099),
(1009, 0, 'quizaccess_timelimit', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329099),
(1010, 0, 'quizaccess_timelimit', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329099),
(1011, 0, 'scormreport_basic', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329099),
(1012, 0, 'scormreport_basic', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329100),
(1013, 0, 'scormreport_basic', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329100),
(1014, 0, 'scormreport_graphs', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329100),
(1015, 0, 'scormreport_graphs', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329100),
(1016, 0, 'scormreport_graphs', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329100),
(1017, 0, 'scormreport_interactions', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329100),
(1018, 0, 'scormreport_interactions', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329100),
(1019, 0, 'scormreport_interactions', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329100),
(1020, 0, 'scormreport_objectives', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329101),
(1021, 0, 'scormreport_objectives', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329101),
(1022, 0, 'scormreport_objectives', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329101),
(1023, 0, 'workshopform_accumulative', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329101),
(1024, 0, 'workshopform_accumulative', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329101),
(1025, 0, 'workshopform_accumulative', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329102),
(1026, 0, 'workshopform_comments', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329102),
(1027, 0, 'workshopform_comments', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329102),
(1028, 0, 'workshopform_comments', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329102),
(1029, 0, 'workshopform_numerrors', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329102),
(1030, 0, 'workshopform_numerrors', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329103),
(1031, 0, 'workshopform_numerrors', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329103),
(1032, 0, 'workshopform_rubric', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329104),
(1033, 0, 'workshopform_rubric', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329104),
(1034, 0, 'workshopform_rubric', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329105),
(1035, 0, 'workshopallocation_manual', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329105),
(1036, 0, 'workshopallocation_manual', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329105),
(1037, 0, 'workshopallocation_manual', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329105),
(1038, 0, 'workshopallocation_random', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329105),
(1039, 0, 'workshopallocation_random', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329105),
(1040, 0, 'workshopallocation_random', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329105),
(1041, 0, 'workshopallocation_scheduled', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329105),
(1042, 0, 'workshopallocation_scheduled', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329106),
(1043, 0, 'workshopallocation_scheduled', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329106),
(1044, 0, 'workshopeval_best', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329106),
(1045, 0, 'workshopeval_best', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329106),
(1046, 0, 'workshopeval_best', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329107),
(1047, 0, 'atto_accessibilitychecker', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329107),
(1048, 0, 'atto_accessibilitychecker', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329107),
(1049, 0, 'atto_accessibilitychecker', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329107),
(1050, 0, 'atto_accessibilityhelper', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329107),
(1051, 0, 'atto_accessibilityhelper', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329107),
(1052, 0, 'atto_accessibilityhelper', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329107),
(1053, 0, 'atto_align', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329108),
(1054, 0, 'atto_align', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329108),
(1055, 0, 'atto_align', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329108),
(1056, 0, 'atto_backcolor', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329108),
(1057, 0, 'atto_backcolor', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329108),
(1058, 0, 'atto_backcolor', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329108),
(1059, 0, 'atto_bold', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329108),
(1060, 0, 'atto_bold', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329108),
(1061, 0, 'atto_bold', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329109),
(1062, 0, 'atto_charmap', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329109),
(1063, 0, 'atto_charmap', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329109),
(1064, 0, 'atto_charmap', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329109),
(1065, 0, 'atto_clear', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329109),
(1066, 0, 'atto_clear', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329109),
(1067, 0, 'atto_clear', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329110),
(1068, 0, 'atto_collapse', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329110),
(1069, 0, 'atto_collapse', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329110),
(1070, 0, 'atto_collapse', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329110),
(1071, 0, 'atto_emoticon', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329110),
(1072, 0, 'atto_emoticon', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329110),
(1073, 0, 'atto_emoticon', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329110),
(1074, 0, 'atto_equation', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329110),
(1075, 0, 'atto_equation', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329110),
(1076, 0, 'atto_equation', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329111),
(1077, 0, 'atto_fontcolor', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329111),
(1078, 0, 'atto_fontcolor', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329111),
(1079, 0, 'atto_fontcolor', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329111),
(1080, 0, 'atto_html', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329111),
(1081, 0, 'atto_html', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329111),
(1082, 0, 'atto_html', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329111),
(1083, 0, 'atto_image', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329111),
(1084, 0, 'atto_image', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329112),
(1085, 0, 'atto_image', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329112),
(1086, 0, 'atto_indent', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329112),
(1087, 0, 'atto_indent', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329112),
(1088, 0, 'atto_indent', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329112),
(1089, 0, 'atto_italic', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329112),
(1090, 0, 'atto_italic', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329112),
(1091, 0, 'atto_italic', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329112),
(1092, 0, 'atto_link', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329113),
(1093, 0, 'atto_link', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329113),
(1094, 0, 'atto_link', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329113),
(1095, 0, 'atto_managefiles', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329113),
(1096, 0, 'atto_managefiles', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329113),
(1097, 0, 'atto_managefiles', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329113),
(1098, 0, 'atto_media', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329113),
(1099, 0, 'atto_media', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329113),
(1100, 0, 'atto_media', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329113),
(1101, 0, 'atto_noautolink', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329113),
(1102, 0, 'atto_noautolink', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329114),
(1103, 0, 'atto_noautolink', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329114),
(1104, 0, 'atto_orderedlist', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329114),
(1105, 0, 'atto_orderedlist', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329114),
(1106, 0, 'atto_orderedlist', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329114),
(1107, 0, 'atto_rtl', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329114),
(1108, 0, 'atto_rtl', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329114),
(1109, 0, 'atto_rtl', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329114),
(1110, 0, 'atto_strike', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329114),
(1111, 0, 'atto_strike', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329114),
(1112, 0, 'atto_strike', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329115),
(1113, 0, 'atto_subscript', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329115),
(1114, 0, 'atto_subscript', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329115),
(1115, 0, 'atto_subscript', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329115),
(1116, 0, 'atto_superscript', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329115),
(1117, 0, 'atto_superscript', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329115),
(1118, 0, 'atto_superscript', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329115),
(1119, 0, 'atto_table', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329116),
(1120, 0, 'atto_table', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329116),
(1121, 0, 'atto_table', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329116),
(1122, 0, 'atto_title', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329116),
(1123, 0, 'atto_title', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329116),
(1124, 0, 'atto_title', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329116),
(1125, 0, 'atto_underline', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329117),
(1126, 0, 'atto_underline', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329117),
(1127, 0, 'atto_underline', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329117),
(1128, 0, 'atto_undo', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329117),
(1129, 0, 'atto_undo', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329117),
(1130, 0, 'atto_undo', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329117),
(1131, 0, 'atto_unorderedlist', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329117),
(1132, 0, 'atto_unorderedlist', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329117),
(1133, 0, 'atto_unorderedlist', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329117),
(1134, 0, 'tinymce_ctrlhelp', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329118),
(1135, 0, 'tinymce_ctrlhelp', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329118),
(1136, 0, 'tinymce_ctrlhelp', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329118),
(1137, 0, 'tinymce_managefiles', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329118),
(1138, 0, 'tinymce_managefiles', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329118),
(1139, 0, 'tinymce_managefiles', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329118),
(1140, 0, 'tinymce_moodleemoticon', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329118),
(1141, 0, 'tinymce_moodleemoticon', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329118),
(1142, 0, 'tinymce_moodleemoticon', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329119),
(1143, 0, 'tinymce_moodleimage', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329119),
(1144, 0, 'tinymce_moodleimage', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329119),
(1145, 0, 'tinymce_moodleimage', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329119),
(1146, 0, 'tinymce_moodlemedia', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329119),
(1147, 0, 'tinymce_moodlemedia', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329119),
(1148, 0, 'tinymce_moodlemedia', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329119),
(1149, 0, 'tinymce_moodlenolink', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329119),
(1150, 0, 'tinymce_moodlenolink', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329119),
(1151, 0, 'tinymce_moodlenolink', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329120),
(1152, 0, 'tinymce_pdw', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329120),
(1153, 0, 'tinymce_pdw', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329120),
(1154, 0, 'tinymce_pdw', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329120),
(1155, 0, 'tinymce_spellchecker', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329120),
(1156, 0, 'tinymce_spellchecker', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329120),
(1157, 0, 'tinymce_spellchecker', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329120),
(1158, 0, 'tinymce_wrap', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329120),
(1159, 0, 'tinymce_wrap', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329120),
(1160, 0, 'tinymce_wrap', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329121),
(1161, 0, 'logstore_database', NULL, '2017062600', 'Starting plugin installation', NULL, '', 0, 1502329121),
(1162, 0, 'logstore_database', '2017062600', '2017062600', 'Upgrade savepoint reached', NULL, '', 0, 1502329121),
(1163, 0, 'logstore_database', '2017062600', '2017062600', 'Plugin installed', NULL, '', 0, 1502329121),
(1164, 0, 'logstore_legacy', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329121),
(1165, 0, 'logstore_legacy', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329121),
(1166, 0, 'logstore_legacy', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329121),
(1167, 0, 'logstore_standard', NULL, '2017051500', 'Starting plugin installation', NULL, '', 0, 1502329121),
(1168, 0, 'logstore_standard', '2017051500', '2017051500', 'Upgrade savepoint reached', NULL, '', 0, 1502329122),
(1169, 0, 'logstore_standard', '2017051500', '2017051500', 'Plugin installed', NULL, '', 0, 1502329122);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

DROP TABLE IF EXISTS `mdl_url`;
CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `parameters` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one url resource';

--
-- Truncate table before insert `mdl_url`
--

TRUNCATE TABLE `mdl_url`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

DROP TABLE IF EXISTS `mdl_user`;
CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(255) NOT NULL DEFAULT '',
  `department` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `calendartype` varchar(30) NOT NULL DEFAULT 'gregorian',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  `lastnamephonetic` varchar(255) DEFAULT NULL,
  `firstnamephonetic` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `alternatename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='One record for each person' ROW_FORMAT=COMPRESSED;

--
-- Truncate table before insert `mdl_user`
--

TRUNCATE TABLE `mdl_user`;
--
-- Dumping data for table `mdl_user`
--

INSERT DELAYED IGNORE INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `calendartype`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `lastnamephonetic`, `firstnamephonetic`, `middlename`, `alternatename`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', '$2y$10$3/qti.n8pN34hgz0Y8ATA.MiniVsaMywJ8vvUAZbWVgs8GgOpQQeq', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', 'gregorian', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 1, 1, 0, 2, 1, 0, 0, 1502328649, 0, NULL, NULL, NULL, NULL, NULL),
(2, 'manual', 1, 0, 0, 0, 1, 'tutors246', '$2y$10$C2cpZdyUj3DccxILSBvlF.HJuBW2vKB8qNJlW.UAzTvS7L4BjSsFC', '', 'Nakeshia', 'Lorde', 'tutors246@gmail.com', 0, '', 'nakeshia.lorde', '', '', '', '2462363949', '2462363949', 'Tutors246', 'Administration', '', 'Bridgetown', 'BB', 'en', 'gregorian', '', 'UTC', 1502329159, 1502408190, 1502329159, 1502408124, '0:0:0:0:0:0:0:1', '', 0, '', 'At Tutors246 we provide comprehensive coverage for a range of subjects inclusive of English A, Geography, History, Mathematics, Office Procedures, Principles of Business and Social Studies. We have a proven track record with 100% passing grades guaranteed.', 1, 1, 0, 1, 1, 0, 0, 1502329894, 0, NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_devices`
--

DROP TABLE IF EXISTS `mdl_user_devices`;
CREATE TABLE IF NOT EXISTS `mdl_user_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `model` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `pushid` varchar(255) NOT NULL DEFAULT '',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  KEY `mdl_userdevi_uuiuse_ix` (`uuid`,`userid`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table stores user''s mobile devices information in order';

--
-- Truncate table before insert `mdl_user_devices`
--

TRUNCATE TABLE `mdl_user_devices`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

DROP TABLE IF EXISTS `mdl_user_enrolments`;
CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb';

--
-- Truncate table before insert `mdl_user_enrolments`
--

TRUNCATE TABLE `mdl_user_enrolments`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

DROP TABLE IF EXISTS `mdl_user_info_category`;
CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories';

--
-- Truncate table before insert `mdl_user_info_category`
--

TRUNCATE TABLE `mdl_user_info_category`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

DROP TABLE IF EXISTS `mdl_user_info_data`;
CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userinfodata_usefie_uix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields';

--
-- Truncate table before insert `mdl_user_info_data`
--

TRUNCATE TABLE `mdl_user_info_data`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

DROP TABLE IF EXISTS `mdl_user_info_field`;
CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields' ROW_FORMAT=COMPRESSED;

--
-- Truncate table before insert `mdl_user_info_field`
--

TRUNCATE TABLE `mdl_user_info_field`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

DROP TABLE IF EXISTS `mdl_user_lastaccess`;
CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa';

--
-- Truncate table before insert `mdl_user_lastaccess`
--

TRUNCATE TABLE `mdl_user_lastaccess`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_history`
--

DROP TABLE IF EXISTS `mdl_user_password_history`;
CREATE TABLE IF NOT EXISTS `mdl_user_password_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `hash` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userpasshist_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A rotating log of hashes of previously used passwords for ea';

--
-- Truncate table before insert `mdl_user_password_history`
--

TRUNCATE TABLE `mdl_user_password_history`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_resets`
--

DROP TABLE IF EXISTS `mdl_user_password_resets`;
CREATE TABLE IF NOT EXISTS `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table tracking password reset confirmation tokens';

--
-- Truncate table before insert `mdl_user_password_resets`
--

TRUNCATE TABLE `mdl_user_password_resets`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

DROP TABLE IF EXISTS `mdl_user_preferences`;
CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(1333) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences';

--
-- Truncate table before insert `mdl_user_preferences`
--

TRUNCATE TABLE `mdl_user_preferences`;
--
-- Dumping data for table `mdl_user_preferences`
--

INSERT DELAYED IGNORE INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'auth_manual_passwordupdatetime', '1502329894'),
(2, 2, 'email_bounce_count', '1'),
(3, 2, 'email_send_count', '1'),
(4, 2, 'tool_usertours_tour_completion_time_1', '1502330345'),
(5, 2, 'drawer-open-nav', 'true'),
(6, 2, 'block_myoverview_last_tab', 'courses'),
(7, 2, 'login_failed_count_since_success', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

DROP TABLE IF EXISTS `mdl_user_private_key`;
CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.';

--
-- Truncate table before insert `mdl_user_private_key`
--

TRUNCATE TABLE `mdl_user_private_key`;
--
-- Dumping data for table `mdl_user_private_key`
--

INSERT DELAYED IGNORE INTO `mdl_user_private_key` (`id`, `script`, `value`, `userid`, `instance`, `iprestriction`, `validuntil`, `timecreated`) VALUES
(1, 'messageinbound_handler', '93216ae9d9539f5f52e31c1cbec97719', 2, NULL, NULL, NULL, 1502335602);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

DROP TABLE IF EXISTS `mdl_wiki`;
CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration';

--
-- Truncate table before insert `mdl_wiki`
--

TRUNCATE TABLE `mdl_wiki`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

DROP TABLE IF EXISTS `mdl_wiki_links`;
CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links';

--
-- Truncate table before insert `mdl_wiki_links`
--

TRUNCATE TABLE `mdl_wiki_links`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

DROP TABLE IF EXISTS `mdl_wiki_locks`;
CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks';

--
-- Truncate table before insert `mdl_wiki_locks`
--

TRUNCATE TABLE `mdl_wiki_locks`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

DROP TABLE IF EXISTS `mdl_wiki_pages`;
CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages';

--
-- Truncate table before insert `mdl_wiki_pages`
--

TRUNCATE TABLE `mdl_wiki_pages`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

DROP TABLE IF EXISTS `mdl_wiki_subwikis`;
CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances';

--
-- Truncate table before insert `mdl_wiki_subwikis`
--

TRUNCATE TABLE `mdl_wiki_subwikis`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

DROP TABLE IF EXISTS `mdl_wiki_synonyms`;
CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms';

--
-- Truncate table before insert `mdl_wiki_synonyms`
--

TRUNCATE TABLE `mdl_wiki_synonyms`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

DROP TABLE IF EXISTS `mdl_wiki_versions`;
CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history';

--
-- Truncate table before insert `mdl_wiki_versions`
--

TRUNCATE TABLE `mdl_wiki_versions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

DROP TABLE IF EXISTS `mdl_workshop`;
CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `submissionfiletypes` varchar(255) DEFAULT NULL,
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackfiletypes` varchar(255) DEFAULT NULL,
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ';

--
-- Truncate table before insert `mdl_workshop`
--

TRUNCATE TABLE `mdl_workshop`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

DROP TABLE IF EXISTS `mdl_workshop_aggregations`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg';

--
-- Truncate table before insert `mdl_workshop_aggregations`
--

TRUNCATE TABLE `mdl_workshop_aggregations`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ';

--
-- Truncate table before insert `mdl_workshop_assessments`
--

TRUNCATE TABLE `mdl_workshop_assessments`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_assessments_old`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext,
  `teachercomment` longtext,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo';

--
-- Truncate table before insert `mdl_workshop_assessments_old`
--

TRUNCATE TABLE `mdl_workshop_assessments_old`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_comments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_comments_old`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle';

--
-- Truncate table before insert `mdl_workshop_comments_old`
--

TRUNCATE TABLE `mdl_workshop_comments_old`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_elements_old`
--

DROP TABLE IF EXISTS `mdl_workshop_elements_old`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle';

--
-- Truncate table before insert `mdl_workshop_elements_old`
--

TRUNCATE TABLE `mdl_workshop_elements_old`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

DROP TABLE IF EXISTS `mdl_workshop_grades`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ';

--
-- Truncate table before insert `mdl_workshop_grades`
--

TRUNCATE TABLE `mdl_workshop_grades`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades_old`
--

DROP TABLE IF EXISTS `mdl_workshop_grades_old`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2';

--
-- Truncate table before insert `mdl_workshop_grades_old`
--

TRUNCATE TABLE `mdl_workshop_grades_old`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_old`
--

DROP TABLE IF EXISTS `mdl_workshop_old`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x';

--
-- Truncate table before insert `mdl_workshop_old`
--

TRUNCATE TABLE `mdl_workshop_old`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

DROP TABLE IF EXISTS `mdl_workshop_rubrics_old`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ';

--
-- Truncate table before insert `mdl_workshop_rubrics_old`
--

TRUNCATE TABLE `mdl_workshop_rubrics_old`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

DROP TABLE IF EXISTS `mdl_workshop_stockcomments_old`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M';

--
-- Truncate table before insert `mdl_workshop_stockcomments_old`
--

TRUNCATE TABLE `mdl_workshop_stockcomments_old`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f';

--
-- Truncate table before insert `mdl_workshop_submissions`
--

TRUNCATE TABLE `mdl_workshop_submissions`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions_old`
--

DROP TABLE IF EXISTS `mdl_workshop_submissions_old`;
CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo';

--
-- Truncate table before insert `mdl_workshop_submissions_old`
--

TRUNCATE TABLE `mdl_workshop_submissions_old`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

DROP TABLE IF EXISTS `mdl_workshopallocation_scheduled`;
CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) DEFAULT NULL,
  `resultlog` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the allocation settings for the scheduled allocator';

--
-- Truncate table before insert `mdl_workshopallocation_scheduled`
--

TRUNCATE TABLE `mdl_workshopallocation_scheduled`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

DROP TABLE IF EXISTS `mdl_workshopeval_best_settings`;
CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit';

--
-- Truncate table before insert `mdl_workshopeval_best_settings`
--

TRUNCATE TABLE `mdl_workshopeval_best_settings`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

DROP TABLE IF EXISTS `mdl_workshopform_accumulative`;
CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin';

--
-- Truncate table before insert `mdl_workshopform_accumulative`
--

TRUNCATE TABLE `mdl_workshopform_accumulative`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

DROP TABLE IF EXISTS `mdl_workshopform_comments`;
CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f';

--
-- Truncate table before insert `mdl_workshopform_comments`
--

TRUNCATE TABLE `mdl_workshopform_comments`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors`;
CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr';

--
-- Truncate table before insert `mdl_workshopform_numerrors`
--

TRUNCATE TABLE `mdl_workshopform_numerrors`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

DROP TABLE IF EXISTS `mdl_workshopform_numerrors_map`;
CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub';

--
-- Truncate table before insert `mdl_workshopform_numerrors_map`
--

TRUNCATE TABLE `mdl_workshopform_numerrors_map`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric`;
CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra';

--
-- Truncate table before insert `mdl_workshopform_rubric`
--

TRUNCATE TABLE `mdl_workshopform_rubric`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_config`;
CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy';

--
-- Truncate table before insert `mdl_workshopform_rubric_config`
--

TRUNCATE TABLE `mdl_workshopform_rubric_config`;
-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

DROP TABLE IF EXISTS `mdl_workshopform_rubric_levels`;
CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales';

--
-- Truncate table before insert `mdl_workshopform_rubric_levels`
--

TRUNCATE TABLE `mdl_workshopform_rubric_levels`;SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
