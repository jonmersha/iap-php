-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2023 at 12:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oms`
--

-- --------------------------------------------------------

--
-- Table structure for table `acceptance`
--

CREATE TABLE `acceptance` (
  `id` int(30) NOT NULL,
  `accept` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acceptance`
--

INSERT INTO `acceptance` (`id`, `accept`) VALUES
(1, 'Accept'),
(2, 'Reject');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `phone`, `email`, `password`, `status`) VALUES
(1, 'Gemechu Gadisa', 'Gemechu', '+251933851065', 'gemechugadisa819@gmail.com', '123456', 1);

-- --------------------------------------------------------

--
-- Table structure for table `annual_plan`
--

CREATE TABLE `annual_plan` (
  `id` int(30) NOT NULL,
  `audit_object` varchar(255) NOT NULL,
  `auditees` varchar(255) not null,
  `audit_type` varchar(255),
  `risk_item` varchar(500) NOT NULL,
  `risk_score` varchar(255) NOT NULL,
  `risk_level` varchar(255) NOT NULL,
  `Year` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `Approval` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `annual_plan`
--

INSERT INTO `annual_plan` (`id`, `serial`, `audit_object`, `risk_item`, `risk_score`, `risk_level`, `Year`, `name`, `Approval`) VALUES
(2, '', 'Database administration TEam', '', '15', 'High/ Risky', '', 'Admin2', ''),
(3, '', 'Network Administration Team', '', '34', 'High/ Risky', '', '', ''),
(4, '', 'Datacenter Facility Team', '', '3', 'High/ Risky', '', '', ''),
(5, '', 'Datacenter facility', '', '1', 'High/ Risky', '', '', ''),
(6, '', 'Datacenter facility', '', '3', 'High/ Risky', '', '', ''),
(7, '', 'IT service Management Team', '', '2', 'High/ Risky', '', '', ''),
(8, '', 'Project Management and Innovation', '', '3', 'High/ Risky', '', '', ''),
(9, '', 'IT service Management Team', '', '3', 'High/ Risky', '', '', ''),
(10, '', 'Bole Medanialem', '', '3', 'High/ Risky', '', 'Admin2', '');

-- --------------------------------------------------------

--
-- Table structure for table `auditee`
--

CREATE TABLE `auditee` (
  `id` int(11) NOT NULL,
  `auditee` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auditee`
--

INSERT INTO `auditee` (`id`, `auditee`) VALUES
(8, 'Finfine Branch'),
(9, 'HO '),
(10, 'Adama Branch'),
(12, 'Bole Madanialem Branch'),
(13, 'Bole Madanialem Branch');

-- --------------------------------------------------------

--
-- Table structure for table `auditeeu`
--

CREATE TABLE `auditeeu` (
  `id` int(11) NOT NULL,
  `auditee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auditee_response`
--

CREATE TABLE `auditee_response` (
  `id` int(99) NOT NULL,
  `name` varchar(255) NOT NULL,
  `Acceptance_Status` varchar(255) NOT NULL,
  `action` longtext NOT NULL,
  `resp` longtext NOT NULL,
  `Location` varchar(255) NOT NULL,
  `just` longtext NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auditor_justification`
--

CREATE TABLE `auditor_justification` (
  `id` int(11) NOT NULL,
  `auditor_justification` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auditor_name`
--

CREATE TABLE `auditor_name` (
  `id` int(11) NOT NULL,
  `auditor_name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auditor_name`
--

INSERT INTO `auditor_name` (`id`, `auditor_name`) VALUES
(4, 'Mr. Addisu'),
(6, 'Zelalem'),
(7, 'Yohans'),
(8, 'Yohannes Mitike '),
(9, 'Yohannes Mitike'),
(10, 'Yohannes Mitike '),
(11, 'Kumsa BaRISO'),
(12, 'Kumsa BaRISO'),
(13, 'kamal galchu');

-- --------------------------------------------------------

--
-- Table structure for table `audit_activities`
--

CREATE TABLE `audit_activities` (
  `id` int(11) NOT NULL,
  `audit_activities` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audit_activities`
--

INSERT INTO `audit_activities` (`id`, `audit_activities`) VALUES
(0, 'Network administration audit');

-- --------------------------------------------------------

--
-- Table structure for table `audit_object`
--

CREATE TABLE `audit_object` (
  `id` int(33) NOT NULL,
  `audit_object` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audit_object`
--

INSERT INTO `audit_object` (`id`, `audit_object`) VALUES
(1, 'Finfine'),
(2, 'Database administration TEam'),
(3, 'Network Administration Team'),
(4, 'Compute and Storage infrastructure team'),
(5, 'Datacenter Facility Team'),
(6, 'System Administration and application development Team'),
(7, 'Datacenter facility'),
(8, 'Datacenter facility'),
(9, 'Bakalcha brancha'),
(10, 'IT service Management Team'),
(11, 'Project Management and Innovation'),
(12, 'Qarsa main');

-- --------------------------------------------------------

--
-- Table structure for table `audit_program`
--

CREATE TABLE `audit_program` (
  `id` int(11) NOT NULL,
  `E_id` int(30) NOT NULL,
  `name` varchar(255) NOT NULL,
  `Objective` longtext NOT NULL,
  `Scope` longtext NOT NULL,
  `Status` longtext NOT NULL,
  `total` int(30) NOT NULL,
  `Approval` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audit_program`
--

INSERT INTO `audit_program` (`id`, `E_id`, `name`, `Objective`, `Scope`, `Status`, `total`, `Approval`) VALUES
(3, 3, 'Yohannes Mitike', 'Audit', 'the scope of this Audit is limeted to xyz', '95 persent rectifications', 13, ''),
(4, 2, 'Addisu Kamsur', 'test', 'test', 'not done', 15, 'yes'),
(7, 3, 'Addisu Kamsur', 'preformin audit on', 'limited to ', '95', 15, ''),
(8, 4, 'Addisu Kamsur', 'To assure, evaluate', 'The scope is limited to ITSM ', 'Partially rectify', 15, 'Approved'),
(9, 5, 'Addisu Kamsur', 'to do som thing', 'limited to the activities of ITSM team', '50% rectification', 14, ''),
(10, 6, 'Admin5', 'objective', 'scope', 'no pervious audit status', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `audit_program_engagement`
--

CREATE TABLE `audit_program_engagement` (
  `id` int(11) NOT NULL,
  `m_id` int(30) NOT NULL,
  `Description` longtext NOT NULL,
  `Assignment_date` date NOT NULL DEFAULT current_timestamp(),
  `S_date` date NOT NULL,
  `E_date` date NOT NULL,
  `checklist_number` int(11) NOT NULL,
  `add_checklist` longtext NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audit_program_engagement`
--

INSERT INTO `audit_program_engagement` (`id`, `m_id`, `Description`, `Assignment_date`, `S_date`, `E_date`, `checklist_number`, `add_checklist`, `name`) VALUES
(2, 3, 'Databse audit xys', '2022-12-05', '2022-12-06', '2023-01-06', 1, '', ''),
(3, 6, 'Please prepare the Audit program', '2023-01-24', '2023-01-24', '2023-01-24', 1, '', ''),
(4, 7, 'ITSM Audit', '2023-02-08', '2023-02-08', '2023-02-11', 1, 'ITSM audit', ''),
(5, 10, 'please prepare the audit program considering the last audit work and the current risk score defined fotnhtbe audit ', '2023-03-03', '2023-03-08', '2023-03-15', 1, 'prepare your ', 'Yohannes Mitike'),
(6, 10, 'dsfgsfgh', '2023-03-03', '2023-03-08', '2023-03-16', 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `audit_type`
--

CREATE TABLE `audit_type` (
  `id` int(11) NOT NULL,
  `audit_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audit_type`
--

INSERT INTO `audit_type` (`id`, `audit_type`) VALUES
(0, 'Database management audit');

-- --------------------------------------------------------

--
-- Table structure for table `audit_typeq`
--

CREATE TABLE `audit_typeq` (
  `id` int(11) NOT NULL,
  `audit_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audit_typeq`
--

INSERT INTO `audit_typeq` (`id`, `audit_type`) VALUES
(1, 'Database management audit'),
(2, 'Data center design '),
(3, 'IT AUDIT'),
(4, 'Branch Audit');

-- --------------------------------------------------------

--
-- Table structure for table `cause`
--

CREATE TABLE `cause` (
  `id` int(30) NOT NULL,
  `cause` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `checklist`
--

CREATE TABLE `checklist` (
  `id` int(35) NOT NULL,
  `checklist_number` int(99) NOT NULL,
  `Operational_area` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `objective` longtext NOT NULL,
  `risk` varchar(255) NOT NULL,
  `risk_level` varchar(255) NOT NULL,
  `expected_control` varchar(255) NOT NULL,
  `audit_approach` longtext NOT NULL,
  `detail` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `update_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contac_p`
--

CREATE TABLE `contac_p` (
  `id` int(30) NOT NULL,
  `auditor_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contac_p`
--

INSERT INTO `contac_p` (`id`, `auditor_name`) VALUES
(1, 'Yohans'),
(2, 'Kumsa BaRISO'),
(3, 'ayalneh mulunueh');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` int(30) NOT NULL,
  `criteria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `effect`
--

CREATE TABLE `effect` (
  `id` int(30) NOT NULL,
  `effect` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(150) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `joining_date` date DEFAULT current_timestamp(),
  `email` varchar(150) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Active, 0 = Inactive',
  `user_role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = USER, 1 = ADMIN, 2 = AUDITOR, 3 =TEAM LEADER, 4 = TEAM MANAGER '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='phone';

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `designation`, `phone`, `joining_date`, `email`, `username`, `password`, `status`, `user_role`) VALUES
(62, 'Yohannes Mitike', 'TEAM MANAGER', '+251938948155', '2022-05-18', 'jonmersha@gmail.com', 'Yohannes Mitike', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 3),
(63, 'Yemane  Tadesse', 'AUDITOR', '+251911825478', '2022-05-18', 'yemanet16@gmail.com', 'Yemane  Tadesse', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 2),
(64, 'Negash Degefa', 'AUDITOR', '+251929175755', '2022-05-18', 'negdegefa@gmail.com', 'Negash Degefa', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 2),
(65, 'Shimelis Abeshu', 'AUDITOR', '+251919899723', '2022-05-18', 'Shimee.abbe@gmail.com', 'Shimelis Abeshu', 'ef35b8b01693d02600cb4321735ba1bf', 1, 2),
(66, 'Zelalem Tilahun ', 'AUDITOR', '+251912138687', '2022-05-18', 'zelalemtilahun.w@gmail.com', 'Zelalem Tilahun ', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 2),
(67, 'Zelalem Degefa', 'AUDITOR', '+251911949336', '2022-05-18', 'zelestmary@gmail.com', 'Zelalem Degefa', 'ceb6c970658f31504a901b89dcd3e461', 1, 2),
(68, 'Yakob Kibreselassie', 'AUDITOR', '+251913055618', '2022-05-18', 'yakobkibre@gmail.com', 'Yakob Kibreselassie', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 2),
(69, 'Abdu Gragn', 'AUDITOR', '+251935972391', '2022-05-18', 'abuyk671@gmail.com', 'Abdu Gragn', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 2),
(70, 'Addisu Kamsur', 'AUDITOR', '+251912361045', '2022-05-18', 'addikam5@gmail.com', 'Addisu Kamsur', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 2),
(71, 'Kisi  Debisa', 'AUDITOR', '+251900301396', '2022-05-18', 'kisidebisa00@gmail.com', 'Kisi  Debisa', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 2),
(72, 'Ameha Abera ', 'AUDITOR', '+251922955682', '2022-05-18', 'aberaameha@gmail.com', 'Ameha Abera ', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 2),
(73, 'Elias Solomon', 'AUDITOR', '+251913081288', '2022-05-18', 'eliasolomon2014@gmail.com', 'Elias Solomon', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 2),
(74, 'Gadise Yoseph', 'AUDITOR', '+251911345592', '2022-05-18', 'gadisey@cbo.com', 'Gadise Yoseph', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 2),
(76, 'Admin', 'ADMIN', '+251911111111', '2022-07-29', 'admin@admin.com', 'admin@admin.com', 'c33367701511b4f6020ec61ded352059', 1, 1),
(77, 'Admin2', 'TEAM MANAGER', '+251911111111', '2022-08-04', 'admin2@admin.com', 'admin2@admin.com', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 3),
(78, 'Admin3', 'AUDITOR', '+251911111111', '2022-08-04', 'admin3@admin.com', 'admin3@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 2),
(79, 'Admin4', 'USER', '+251911111111', '2022-08-04', 'admin4@admin.com', 'admin4@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 0),
(80, 'Admin5', 'AUDITOR', '+2519000000', '2022-08-29', 'admin5@admin.com', 'admin5@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 2),
(81, 'KINFE SHIBRU DEGETI ', 'ADMIN', '+251911155790', '2022-09-23', 'kinfeshibru18@gmail.com', 'kinfeshibru18@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 1),
(82, 'Chalchisa Debere', 'TEAM MANAGER', '+251933683499', '2022-09-29', 'debere07@gmail.com', 'debere07@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 3),
(83, 'ABC', 'CHIEF', '+251911111111', '2022-11-25', 'adminp@admin.com', 'adminp@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 3),
(84, 'adb', 'PRINICIPAL', '+251911111111', '2022-11-25', 'adminsample@admin.com', 'adminsample@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `finding_detail`
--

CREATE TABLE `finding_detail` (
  `id` int(11) NOT NULL,
  `E_id` int(30) NOT NULL,
  `Finding_number` int(11) NOT NULL,
  `Irregularity_description` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Loss_amount` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `update_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `finding_detail`
--

INSERT INTO `finding_detail` (`id`, `E_id`, `Finding_number`, `Irregularity_description`, `Loss_amount`, `name`, `update_date`) VALUES
(7, 1, 72, 'tgyui', 6, 'Admin5', '2022-12-04'),
(8, 4, 75, '<p>asdg</p>', 33, 'Addisu Kamsur', '2023-03-06'),
(9, 6, 75, '<p>xyps</p>', 23, 'Addisu Kamsur', '2023-03-06');

-- --------------------------------------------------------

--
-- Table structure for table `finding_registration`
--

CREATE TABLE `finding_registration` (
  `id` int(30) NOT NULL,
  `E_id` int(30) NOT NULL,
  `auditee` varchar(100) NOT NULL,
  `Operational_area` varchar(100) NOT NULL,
  `Finding_number` int(11) NOT NULL,
  `Facts` longtext NOT NULL,
  `Description` longtext NOT NULL,
  `criteria` longtext NOT NULL,
  `cause` longtext NOT NULL,
  `effect` longtext NOT NULL,
  `Internal_control` longtext NOT NULL,
  `recommendation` longtext NOT NULL,
  `Resp` longtext NOT NULL,
  `auditor_justification` varchar(255) NOT NULL,
  `Acceptance_Status` varchar(100) NOT NULL,
  `acceptance` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `Date` date DEFAULT current_timestamp(),
  `Action` longtext NOT NULL,
  `Location` varchar(99) NOT NULL,
  `Approval` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `finding_registration`
--

INSERT INTO `finding_registration` (`id`, `E_id`, `auditee`, `Operational_area`, `Finding_number`, `Facts`, `Description`, `criteria`, `cause`, `effect`, `Internal_control`, `recommendation`, `Resp`, `auditor_justification`, `Acceptance_Status`, `acceptance`, `name`, `Date`, `Action`, `Location`, `Approval`) VALUES
(74, 4, '9', 'IT service ', 2, 'dgfj', 'ertyu', 'jkl', 'uytr', 'asdf', 'xzcvb', 'wert', '', 'wert', 'Partially Rectified', '', 'Admin2', '2023-02-16', 'wertyu', '../findings16022023090026Internal audit work automations edited with geme.docx', ''),
(75, 2, 'Datacenter facility', 'Cash', 3, 'ghsj', 'rrr', 'test', 'cause', 'effect', 'inter_con', 'rec', '', 'just', 'Fully Rectified', '', 'Admin5', '2023-03-03', 'yuewe', '../findings/03032023011530Internal audit work automations edited with geme.docx', '');

-- --------------------------------------------------------

--
-- Table structure for table `forget_password`
--

CREATE TABLE `forget_password` (
  `id` int(11) NOT NULL,
  `email` varchar(200) CHARACTER SET latin1 NOT NULL,
  `temp_key` varchar(200) CHARACTER SET latin1 NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forget_password`
--

INSERT INTO `forget_password` (`id`, `email`, `temp_key`, `created`) VALUES
(1, 'gemechugadisa819@gmail.com', '0928568fdae15703525b570050d06abd', '2021-10-11 03:19:03'),
(4, 'gemechugadisa819@gmail.com', 'a5c5d18d11ecb527f0144802b4881c77', '2021-10-11 05:05:16'),
(7, 'gemechugadisa819@gmail.com', 'fcd856e998c9eac97581811fc0e8907e', '2021-12-31 14:14:16'),
(13, 'gemechugadisa819@gmail.com', 'ed26e3cc5c01b2e4efb8954bca3af223', '2022-02-12 00:09:11'),
(14, 'gemechugadisa819@gmail.com', '9440882b0ac09a3a5a841c960a5eb167', '2022-02-12 05:20:17'),
(15, 'gemechugadisa819@gmail.com', '393e65571f4f38c1031d08ff007d7785', '2022-02-25 07:24:13'),
(16, 'gadisey@cbo.com', '5d9e09788730bb07088ec476497677bb', '2022-05-19 00:22:50'),
(17, 'zelestmary@gmail.com', 'c25667fd3189ff44c8d30f76768526fd', '2022-09-02 11:54:27'),
(18, 'zelestmary@gmail.com', '3ffd1471079eb990b50f8331b76186db', '2022-09-02 11:54:37'),
(19, 'zelestmary@gmail.com', '8189669193faa633187c05bcaa30c97a', '2022-09-02 11:55:34'),
(20, 'zelestmary@gmail.com', 'd32fc1d6c95c861f3b58abad842728a8', '2022-09-02 12:32:57'),
(21, 'zelestmary@gmail.com', 'ff77f04b2b63e9764c1221281220ae9e', '2022-09-02 12:33:58');

-- --------------------------------------------------------

--
-- Table structure for table `general_observation`
--

CREATE TABLE `general_observation` (
  `id` int(30) NOT NULL,
  `observation` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `intro_letter`
--

CREATE TABLE `intro_letter` (
  `id` int(30) NOT NULL,
  `E_id` int(30) NOT NULL,
  `date` date NOT NULL,
  `reference` longtext NOT NULL,
  `gene_by_tl` int(30) NOT NULL,
  `ch_tl` int(30) NOT NULL,
  `audit_type` varchar(150) NOT NULL,
  `auditee` int(30) NOT NULL,
  `auditor_name` int(30) NOT NULL,
  `detail` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `irregularity_type`
--

CREATE TABLE `irregularity_type` (
  `id` int(11) NOT NULL,
  `Irregularity_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `irregularity_type`
--

INSERT INTO `irregularity_type` (`id`, `Irregularity_type`) VALUES
(1, 'Cash shortage'),
(2, 'Insurance Expired'),
(3, 'No contract'),
(4, 'marriage certificate'),
(5, 'tax clearance');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `id` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `ip` varchar(20) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `agent` varchar(255) NOT NULL,
  `referer` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `datetime`, `ip`, `hostname`, `uri`, `agent`, `referer`, `domain`, `filename`, `method`, `data`) VALUES
(1, '2021-10-11 07:18:57', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(46, '2021-10-22 07:49:02', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(47, '2021-10-22 08:49:47', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(48, '2021-10-22 09:54:45', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(49, '2021-10-22 10:57:07', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(50, '2021-10-22 12:32:51', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(51, '2021-10-22 12:35:23', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(52, '2021-10-22 12:35:51', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(53, '2021-10-22 12:36:24', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=1234&login=Login'),
(54, '2021-10-22 12:43:25', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(55, '2021-10-22 12:44:17', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(56, '2021-10-22 12:45:38', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(57, '2021-10-22 12:48:12', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(58, '2021-10-22 13:06:40', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(59, '2021-10-22 13:29:44', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=1234&login=Login'),
(60, '2021-10-22 13:34:55', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=1234&login=Login'),
(61, '2021-10-22 13:39:37', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=1234&login=Login'),
(62, '2021-10-22 13:45:52', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(63, '2021-10-22 14:00:46', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(64, '2021-10-22 14:07:27', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(65, '2021-10-22 14:07:58', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=1234&login=Login'),
(66, '2021-10-22 14:22:37', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(67, '2021-10-22 15:30:16', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=1234&login=Login'),
(68, '2021-10-22 15:51:44', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(69, '2021-10-23 14:02:45', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=1234&login=Login'),
(70, '2021-10-23 14:07:41', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(71, '2021-10-24 07:49:09', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=1234&login=Login'),
(72, '2021-10-24 07:52:03', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=1234&login=Login'),
(73, '2021-10-24 07:56:32', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(74, '2021-10-24 08:22:15', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(75, '2021-10-24 08:30:54', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=1234&login=Login'),
(76, '2021-10-24 08:38:01', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(77, '2021-10-24 12:22:26', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(78, '2021-10-24 13:21:59', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(79, '2021-10-24 13:39:41', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=1234&login=Login'),
(80, '2021-10-24 13:40:10', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(81, '2021-10-25 03:29:46', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(82, '2021-10-25 08:21:07', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(83, '2021-10-25 08:30:22', '::1', 'Gemechu', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://localhost/AMS/index.php', 'localhost', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(84, '2021-10-25 09:05:58', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(85, '2021-10-25 09:21:01', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(86, '2021-10-25 09:23:38', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=1234&login=Login'),
(87, '2021-10-25 09:24:07', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(88, '2021-10-25 09:33:48', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(89, '2021-10-25 09:48:12', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(90, '2021-10-25 10:22:12', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(91, '2021-10-25 10:44:26', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(92, '2021-10-25 10:45:09', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(93, '2021-10-25 10:46:53', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(94, '2021-10-25 10:57:19', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(95, '2021-10-25 13:16:43', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(96, '2021-10-25 13:17:47', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(97, '2021-10-25 13:18:19', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(98, '2021-10-25 13:19:16', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(99, '2021-10-25 13:20:45', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(100, '2021-10-26 09:36:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(101, '2021-10-26 10:18:33', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(102, '2021-10-27 10:01:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(103, '2021-10-27 11:27:30', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(104, '2021-10-27 14:53:31', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(105, '2021-10-27 14:55:24', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(106, '2021-10-28 07:50:39', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(107, '2021-10-28 07:51:40', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(108, '2021-10-28 08:44:03', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(109, '2021-10-28 09:01:31', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=sena%40gmail.com&password=123456&login=Login'),
(110, '2021-10-28 09:02:32', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(111, '2021-10-28 14:36:03', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(112, '2021-10-28 15:00:17', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(113, '2021-10-29 11:12:56', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(114, '2021-10-29 12:23:09', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(115, '2021-10-29 13:16:11', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(116, '2021-10-29 13:25:24', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(117, '2021-10-29 13:25:57', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(118, '2021-10-29 13:26:32', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(119, '2021-10-29 13:27:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(120, '2021-10-29 14:22:54', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(121, '2021-10-29 14:30:24', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(122, '2021-10-29 14:43:04', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(123, '2021-10-29 15:01:37', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(124, '2021-10-29 15:39:10', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(125, '2021-10-29 15:39:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(126, '2021-10-29 15:49:26', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(127, '2021-10-30 07:52:35', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(128, '2021-10-30 09:19:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(129, '2021-10-30 09:27:08', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(130, '2021-10-30 09:45:57', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(131, '2021-11-01 09:19:33', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(132, '2021-11-01 11:11:00', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(133, '2021-11-02 09:03:31', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(134, '2021-11-02 09:28:16', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(135, '2021-11-02 09:43:30', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(136, '2021-11-02 12:03:04', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(137, '2021-11-02 12:03:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(138, '2021-11-02 12:19:21', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(139, '2021-11-02 12:21:47', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(140, '2021-11-02 13:07:18', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(141, '2021-11-02 13:45:34', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(142, '2021-11-02 13:48:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(143, '2021-11-02 13:48:55', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(144, '2021-11-03 05:21:47', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(145, '2021-11-03 05:32:55', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(146, '2021-11-03 05:44:07', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(147, '2021-11-03 11:06:51', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(148, '2021-11-03 11:10:52', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(149, '2021-11-03 11:14:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(150, '2021-11-03 12:40:04', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(151, '2021-11-03 12:46:09', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(152, '2021-11-03 12:58:04', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(153, '2021-11-03 13:05:29', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(154, '2021-11-03 13:11:56', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(155, '2021-11-03 13:37:48', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(156, '2021-11-03 13:38:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(157, '2021-11-04 03:41:16', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(158, '2021-11-04 03:42:26', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(159, '2021-11-04 03:44:49', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(160, '2021-11-04 03:48:37', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(161, '2021-11-04 03:56:08', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(162, '2021-11-04 03:56:42', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(163, '2021-11-04 04:02:56', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(164, '2021-11-04 04:03:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(165, '2021-11-04 04:25:41', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(166, '2021-11-04 04:29:58', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(167, '2021-11-04 06:44:49', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(168, '2021-11-04 07:09:17', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(169, '2021-11-04 07:23:39', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(170, '2021-11-04 07:36:08', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(171, '2021-11-04 07:37:20', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(172, '2021-11-04 07:42:00', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(173, '2021-11-04 07:43:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(174, '2021-11-04 07:48:35', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(175, '2021-11-04 07:49:43', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(176, '2021-11-04 08:11:07', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(177, '2021-11-04 08:11:26', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(178, '2021-11-04 08:11:56', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(179, '2021-11-04 11:32:14', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(180, '2021-11-04 11:33:12', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(181, '2021-11-04 19:12:39', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(182, '2021-11-04 19:32:26', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(183, '2021-11-04 19:43:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(184, '2021-11-04 20:06:47', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(185, '2021-11-04 20:10:13', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(186, '2021-11-05 07:06:21', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(187, '2021-11-05 11:42:01', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(188, '2021-11-05 12:19:08', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(189, '2021-11-05 12:34:50', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(190, '2021-11-05 13:14:58', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(191, '2021-11-06 08:13:20', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(192, '2021-11-06 08:13:49', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(193, '2021-11-06 08:23:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(194, '2021-11-06 09:47:11', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(195, '2021-11-09 08:01:37', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login');
INSERT INTO `log` (`id`, `datetime`, `ip`, `hostname`, `uri`, `agent`, `referer`, `domain`, `filename`, `method`, `data`) VALUES
(196, '2021-11-09 08:48:19', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(197, '2021-11-10 07:01:34', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(198, '2021-11-10 07:03:53', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(199, '2021-11-11 02:18:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(200, '2021-11-11 02:39:31', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(201, '2021-11-11 02:49:34', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(202, '2021-11-11 02:54:33', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(203, '2021-11-11 03:07:11', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(204, '2021-11-11 03:07:36', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(205, '2021-11-11 03:08:51', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(206, '2021-11-11 03:10:17', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(207, '2021-11-11 07:17:05', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(208, '2021-11-11 07:17:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(209, '2021-11-11 07:22:35', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(210, '2021-11-11 08:23:40', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(211, '2021-11-11 09:17:00', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(212, '2021-11-11 09:27:17', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(213, '2021-11-11 09:28:22', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(214, '2021-11-11 09:29:38', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(215, '2021-11-11 11:51:03', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(216, '2021-11-13 11:48:51', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(217, '2021-11-13 14:02:06', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(218, '2021-11-13 14:27:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(219, '2021-11-15 10:03:06', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(220, '2021-11-16 08:52:38', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(221, '2021-11-20 08:09:42', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(222, '2021-11-20 08:14:03', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(223, '2021-11-20 08:16:57', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(224, '2021-11-23 08:32:36', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(225, '2021-11-23 09:00:08', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(226, '2021-11-23 09:38:33', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(227, '2021-11-24 07:53:00', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(228, '2021-11-24 08:12:14', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(229, '2021-11-24 08:32:09', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(230, '2021-11-24 08:35:59', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(231, '2021-11-24 08:38:18', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(232, '2021-11-24 08:38:37', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(233, '2021-11-24 12:20:06', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(234, '2021-11-24 12:35:52', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(235, '2021-11-24 12:56:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(236, '2021-11-24 12:57:17', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(237, '2021-11-24 12:58:58', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(238, '2021-11-24 13:04:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(239, '2021-11-24 13:04:58', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(240, '2021-11-24 13:21:55', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(241, '2021-11-24 13:24:10', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(242, '2021-12-03 07:26:52', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(243, '2021-12-03 07:28:04', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(244, '2021-12-03 07:37:54', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(245, '2021-12-03 07:52:32', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(246, '2021-12-10 07:04:47', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(247, '2021-12-10 07:05:39', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(248, '2021-12-10 07:06:06', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(249, '2021-12-10 07:06:49', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(250, '2021-12-10 07:07:45', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(251, '2021-12-10 07:13:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(252, '2021-12-10 07:17:35', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(253, '2021-12-10 07:19:52', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(254, '2021-12-10 11:58:10', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(255, '2021-12-10 11:59:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(256, '2021-12-10 12:15:31', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(257, '2021-12-10 12:39:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(258, '2021-12-10 13:07:24', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(259, '2021-12-10 13:13:26', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(260, '2021-12-11 06:33:56', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(261, '2021-12-11 07:38:25', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(262, '2021-12-11 07:38:57', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(263, '2021-12-11 07:41:43', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(264, '2021-12-11 08:00:52', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(265, '2021-12-11 08:02:56', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(266, '2021-12-11 15:39:47', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(267, '2021-12-11 17:30:47', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(268, '2021-12-12 07:04:35', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(269, '2021-12-13 02:35:55', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(270, '2021-12-13 02:55:08', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(271, '2021-12-13 02:55:40', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(272, '2021-12-13 03:07:39', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(273, '2021-12-13 03:21:01', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(274, '2021-12-13 03:29:18', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(275, '2021-12-13 03:45:25', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(276, '2021-12-13 03:47:22', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(277, '2021-12-13 04:06:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(278, '2021-12-13 06:32:35', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(279, '2021-12-13 06:37:18', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(280, '2021-12-13 06:38:39', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(281, '2021-12-13 06:39:12', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(282, '2021-12-13 06:40:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(283, '2021-12-13 06:40:36', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(284, '2021-12-13 06:41:21', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(285, '2021-12-13 06:50:14', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(286, '2021-12-13 07:00:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(287, '2021-12-13 08:14:35', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(288, '2021-12-13 08:17:03', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(289, '2021-12-13 08:26:57', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(290, '2021-12-13 08:57:30', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(291, '2021-12-13 09:05:26', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(292, '2021-12-13 09:16:49', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(293, '2021-12-13 09:18:55', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(294, '2021-12-13 09:20:21', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(295, '2021-12-13 09:21:22', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(296, '2021-12-13 11:46:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(297, '2021-12-13 20:42:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(298, '2021-12-13 20:54:55', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(299, '2021-12-13 20:56:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(300, '2021-12-13 21:00:20', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(301, '2021-12-13 21:01:13', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(302, '2021-12-13 21:02:22', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(303, '2021-12-14 07:13:11', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(304, '2021-12-14 08:20:08', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(305, '2021-12-14 08:27:52', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(306, '2021-12-14 08:29:16', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(307, '2021-12-14 08:45:58', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(308, '2021-12-14 08:55:19', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(309, '2021-12-14 08:55:58', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(310, '2021-12-14 09:03:23', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(311, '2021-12-15 07:51:17', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(312, '2021-12-15 13:36:20', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(313, '2021-12-16 07:35:20', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(314, '2021-12-16 08:19:14', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(315, '2021-12-16 08:19:48', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(316, '2021-12-16 09:52:59', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(317, '2021-12-17 11:43:30', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(318, '2021-12-17 12:10:16', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(319, '2021-12-17 12:20:03', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(320, '2021-12-17 12:44:26', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(321, '2021-12-17 12:53:56', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(322, '2021-12-17 12:55:55', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(323, '2021-12-17 14:10:34', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(324, '2021-12-17 14:37:58', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(325, '2021-12-17 14:38:13', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(326, '2021-12-17 14:38:22', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(327, '2021-12-17 16:05:12', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(328, '2021-12-17 19:55:50', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(329, '2021-12-17 19:57:48', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(330, '2021-12-17 20:02:01', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(331, '2021-12-17 20:14:14', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(332, '2021-12-18 07:09:23', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(333, '2021-12-18 07:10:45', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(334, '2021-12-18 07:12:17', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(335, '2021-12-18 14:04:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(336, '2021-12-18 14:04:22', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(337, '2021-12-18 14:25:39', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(338, '2021-12-19 05:50:04', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(339, '2021-12-20 06:21:17', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(340, '2021-12-20 08:01:20', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(341, '2021-12-20 08:03:49', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(342, '2021-12-20 08:04:08', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(343, '2021-12-20 08:10:43', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(344, '2021-12-20 10:24:35', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(345, '2021-12-20 10:35:04', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login');
INSERT INTO `log` (`id`, `datetime`, `ip`, `hostname`, `uri`, `agent`, `referer`, `domain`, `filename`, `method`, `data`) VALUES
(346, '2021-12-20 10:36:19', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(347, '2021-12-20 10:37:01', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(348, '2021-12-20 10:38:06', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(349, '2021-12-20 10:38:18', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(350, '2021-12-20 10:41:54', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(351, '2021-12-20 10:46:40', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(352, '2021-12-20 10:49:41', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(353, '2021-12-20 11:06:10', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(354, '2021-12-20 11:08:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(355, '2021-12-20 20:13:19', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(356, '2021-12-20 20:17:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(357, '2021-12-20 20:18:28', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(358, '2021-12-20 21:04:24', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(359, '2021-12-20 21:45:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(360, '2021-12-20 21:54:51', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(361, '2021-12-20 22:46:26', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(362, '2021-12-21 06:08:57', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(363, '2021-12-21 08:04:43', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(364, '2021-12-21 08:05:25', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(365, '2021-12-21 08:33:50', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(366, '2021-12-21 09:09:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(367, '2021-12-21 09:11:13', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(368, '2021-12-21 09:19:11', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(369, '2021-12-21 11:33:20', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(370, '2021-12-21 11:42:56', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(371, '2021-12-21 12:12:37', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(372, '2021-12-21 12:17:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(373, '2021-12-21 12:58:13', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(374, '2021-12-21 19:40:06', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(375, '2021-12-21 19:44:10', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(376, '2021-12-21 20:25:48', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(377, '2021-12-21 20:26:39', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(378, '2021-12-21 20:34:31', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(379, '2021-12-22 07:36:41', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(380, '2021-12-22 12:14:48', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(381, '2021-12-22 12:23:09', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(382, '2021-12-22 12:40:01', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(383, '2021-12-22 12:49:47', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(384, '2021-12-22 12:52:58', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(385, '2021-12-22 12:55:35', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(386, '2021-12-22 12:58:37', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(387, '2021-12-22 13:03:13', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(388, '2021-12-22 13:19:28', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(389, '2021-12-23 05:30:45', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(390, '2021-12-23 05:52:28', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(391, '2021-12-23 06:51:18', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(392, '2021-12-23 06:58:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(393, '2021-12-23 06:59:53', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(394, '2021-12-23 07:06:06', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(395, '2021-12-23 07:08:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(396, '2021-12-23 07:12:09', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(397, '2021-12-23 07:19:43', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(398, '2021-12-23 07:45:57', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(399, '2021-12-23 08:49:19', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(400, '2021-12-23 08:52:29', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(401, '2021-12-23 08:53:17', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(402, '2021-12-23 08:56:12', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(403, '2021-12-23 09:34:25', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(404, '2021-12-23 12:16:33', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(405, '2021-12-23 12:51:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(406, '2021-12-23 12:52:35', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(407, '2021-12-23 13:57:38', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(408, '2021-12-23 14:13:25', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(409, '2021-12-23 14:16:22', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(410, '2021-12-23 14:17:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(411, '2021-12-23 14:17:20', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(412, '2021-12-23 14:21:36', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(413, '2021-12-23 14:22:14', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(414, '2021-12-23 14:23:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(415, '2021-12-23 14:45:30', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(416, '2021-12-23 14:51:03', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(417, '2021-12-23 14:53:23', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(418, '2021-12-23 21:02:41', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(419, '2021-12-24 06:08:28', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(420, '2021-12-24 06:12:34', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(421, '2021-12-24 06:13:11', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(422, '2021-12-24 06:17:32', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(423, '2021-12-24 08:44:09', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(424, '2021-12-24 08:53:09', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(425, '2021-12-24 09:03:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(426, '2021-12-26 06:10:39', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(427, '2021-12-27 06:25:27', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(428, '2021-12-27 06:31:04', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(429, '2021-12-27 06:37:29', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(430, '2021-12-27 08:29:27', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(431, '2021-12-27 08:55:36', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(432, '2021-12-27 09:38:40', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(433, '2021-12-27 12:03:36', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(434, '2021-12-27 13:16:00', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(435, '2021-12-28 07:24:43', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(436, '2021-12-28 07:28:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(437, '2022-01-03 07:23:04', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(438, '2022-01-04 07:53:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(439, '2022-01-04 08:16:40', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(440, '2022-01-04 08:18:29', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(441, '2022-01-04 08:21:16', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(442, '2022-01-04 11:27:52', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(443, '2022-01-10 06:08:58', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(444, '2022-01-10 06:09:31', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(445, '2022-01-10 06:22:47', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(446, '2022-01-11 16:17:15', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(447, '2022-01-11 16:20:29', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(448, '2022-01-12 09:11:17', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(449, '2022-01-13 07:14:57', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(450, '2022-01-13 09:50:19', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(451, '2022-01-13 13:43:51', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(452, '2022-01-13 13:46:48', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(453, '2022-01-13 14:29:00', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(454, '2022-01-13 14:35:16', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(455, '2022-01-14 07:54:16', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(456, '2022-01-14 08:31:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(457, '2022-01-14 08:39:44', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(458, '2022-01-14 08:50:28', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(459, '2022-01-14 08:52:14', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(460, '2022-01-14 09:10:31', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(461, '2022-01-14 12:19:42', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(462, '2022-01-14 14:32:01', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(463, '2022-01-15 04:32:20', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(464, '2022-01-15 06:52:00', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(465, '2022-01-15 07:06:25', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(466, '2022-01-15 07:07:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(467, '2022-01-15 08:26:01', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(468, '2022-01-17 06:24:58', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(469, '2022-01-17 07:54:08', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(470, '2022-01-18 08:22:37', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(471, '2022-01-20 14:34:29', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(472, '2022-01-21 05:52:49', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(473, '2022-01-21 05:54:30', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(474, '2022-01-22 06:20:36', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(475, '2022-01-24 07:42:01', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com/', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(476, '2022-01-24 07:59:56', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com/index.php', 'ams.cbo.com', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(477, '2022-01-27 09:07:58', '::1', 'Gemechu', '/AMS/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://localhost:8686/AMS/', 'localhost:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(478, '2022-01-28 12:14:44', '::1', 'Gemechu', '/ams/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://localhost:8080/ams/', 'localhost:8080', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(479, '2022-02-01 14:30:18', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(480, '2022-02-01 14:44:13', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36 Edg/97.0.1072.76', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(481, '2022-02-01 14:47:53', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(482, '2022-02-01 15:28:30', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(483, '2022-02-02 08:18:39', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com:8680/', 'ams.cbo.com:8680', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(484, '2022-02-02 09:28:02', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com:8680/', 'ams.cbo.com:8680', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(485, '2022-02-02 09:37:34', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com:8680/index.php', 'ams.cbo.com:8680', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(486, '2022-02-02 12:39:14', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'http://ams.cbo.com:8680/index.php', 'ams.cbo.com:8680', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(487, '2022-02-03 06:44:08', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.81 Safari/537.36', 'http://ams.cbo.com:8680/', 'ams.cbo.com:8680', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(488, '2022-02-05 07:16:54', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.81 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(489, '2022-02-07 09:03:36', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.81 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(490, '2022-02-07 09:52:06', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.81 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(491, '2022-02-08 09:55:16', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.81 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(492, '2022-02-09 13:47:10', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.81 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(493, '2022-02-10 08:57:24', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(494, '2022-02-10 09:01:00', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(495, '2022-02-10 09:25:09', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(496, '2022-02-11 08:28:27', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login');
INSERT INTO `log` (`id`, `datetime`, `ip`, `hostname`, `uri`, `agent`, `referer`, `domain`, `filename`, `method`, `data`) VALUES
(497, '2022-02-11 08:29:23', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(498, '2022-02-11 08:53:09', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(499, '2022-02-11 08:53:38', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(500, '2022-02-11 11:59:51', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(501, '2022-02-11 12:00:23', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(502, '2022-02-11 12:33:00', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(503, '2022-02-12 01:05:05', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(504, '2022-02-12 01:11:29', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(505, '2022-02-14 06:52:04', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(506, '2022-02-14 09:01:44', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(507, '2022-02-14 09:02:39', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(508, '2022-02-14 09:04:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(509, '2022-02-14 09:04:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(510, '2022-02-14 09:07:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(511, '2022-02-14 09:11:37', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(512, '2022-02-14 09:22:03', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(513, '2022-02-14 09:22:21', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(514, '2022-02-14 09:44:24', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(515, '2022-02-14 09:49:39', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(516, '2022-02-14 09:53:09', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(517, '2022-02-14 09:59:15', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(518, '2022-02-14 10:05:24', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(519, '2022-02-14 11:09:05', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(520, '2022-02-14 11:10:11', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(521, '2022-02-14 11:10:30', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(522, '2022-02-14 11:10:45', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(523, '2022-02-14 11:12:37', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(524, '2022-02-14 11:41:22', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(525, '2022-02-14 11:53:34', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(526, '2022-02-14 11:57:24', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(527, '2022-02-14 12:23:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(528, '2022-02-14 12:53:22', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(529, '2022-02-14 13:14:51', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(530, '2022-02-15 06:41:20', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(531, '2022-02-15 07:14:36', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(532, '2022-02-15 14:23:42', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(533, '2022-02-16 07:38:14', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(534, '2022-02-17 09:04:22', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.82 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(535, '2022-02-19 07:22:37', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(536, '2022-02-21 07:20:09', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(537, '2022-02-22 07:26:31', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(538, '2022-02-23 07:48:46', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(539, '2022-02-23 07:49:50', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(540, '2022-02-23 17:53:17', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(541, '2022-02-23 18:19:36', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(542, '2022-02-23 19:34:00', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(543, '2022-02-24 07:20:21', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(544, '2022-02-24 09:56:06', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(545, '2022-02-24 09:58:43', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=toli%40gmail.com&password=123456&login=Login'),
(546, '2022-02-24 11:56:46', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(547, '2022-02-24 16:59:29', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(548, '2022-02-25 08:22:56', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(549, '2022-02-25 08:30:28', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(550, '2022-02-25 09:05:19', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(551, '2022-03-02 12:06:09', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(552, '2022-03-02 12:06:55', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(553, '2022-03-15 19:22:56', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(554, '2022-03-20 12:39:17', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(555, '2022-03-20 15:28:27', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(556, '2022-03-20 15:33:11', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(557, '2022-03-20 15:34:35', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(558, '2022-03-20 15:35:02', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(559, '2022-03-20 15:35:31', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(560, '2022-03-20 15:35:56', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(561, '2022-03-20 15:38:50', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(562, '2022-03-24 06:00:33', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(563, '2022-03-25 06:26:52', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(564, '2022-04-01 07:54:24', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(565, '2022-04-01 08:15:12', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(566, '2022-04-01 09:49:32', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(567, '2022-04-04 15:48:03', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(568, '2022-04-04 15:56:29', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(569, '2022-04-04 16:06:34', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(570, '2022-04-06 13:32:59', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(571, '2022-04-06 13:43:30', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=adika%40gmail.com&password=123456&login=Login'),
(572, '2022-04-06 14:19:30', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=bekelet%40gmail.com&password=123456&login=Login'),
(573, '2022-04-08 14:59:20', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(574, '2022-04-08 15:02:03', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(575, '2022-04-20 08:02:09', '127.0.0.1', 'ams.cbo.com', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(576, '2022-04-20 08:59:53', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(577, '2022-04-20 10:19:40', '127.0.0.1', 'ams.cbo.com', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xamppss/htdocs/AMS/index.php', 'POST', 'email=jhn%40gmail.com&password=123456&login=Login'),
(578, '2022-05-18 02:24:48', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=adama%40gmail.com&password=123456&login=Login'),
(579, '2022-05-18 02:27:57', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=gemechugadisa819%40gmail.com&password=123456&login=Login'),
(580, '2022-05-18 03:45:36', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(581, '2022-05-18 03:47:14', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(582, '2022-05-18 03:50:41', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test1234&login=Login'),
(583, '2022-05-18 17:32:12', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test1234&login=Login'),
(584, '2022-05-18 17:51:33', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(585, '2022-05-18 17:55:23', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(586, '2022-05-18 17:59:46', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(587, '2022-05-18 18:03:43', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(588, '2022-05-18 19:57:19', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(589, '2022-05-18 23:19:03', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test1234&login=Login'),
(590, '2022-05-19 02:18:52', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(591, '2022-05-23 19:28:03', '::1', 'WIN-6ROCS42A9DO', '/AMS/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36', 'http://localhost:8686/AMS/index.php', 'localhost:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(592, '2022-07-29 18:27:20', '127.0.0.1', 'WIN-6ROCS42A9DO', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(593, '2022-07-29 18:28:48', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(594, '2022-08-04 14:13:36', '127.0.0.1', 'WIN-6ROCS42A9DO', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(595, '2022-08-04 14:25:03', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(596, '2022-08-04 14:39:06', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(597, '2022-08-26 15:37:38', '127.0.0.1', 'WIN-6ROCS42A9DO', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(598, '2022-08-26 15:39:13', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(599, '2022-08-26 15:43:39', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(600, '2022-08-29 10:40:33', '127.0.0.1', 'WIN-6ROCS42A9DO', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(601, '2022-08-29 12:27:41', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(602, '2022-08-29 12:28:47', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(603, '2022-08-29 12:30:28', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(604, '2022-08-29 12:31:17', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(605, '2022-08-29 12:32:07', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(606, '2022-08-29 12:34:45', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(607, '2022-09-02 14:33:29', '10.1.18.140', '10.1.18.140', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:104.0) Gecko/20100101 Firefox/104.0', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=shimee.abbe%40gmail.com&password=test123&login=Login'),
(608, '2022-09-03 10:21:06', '10.1.18.26', '10.1.18.26', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:104.0) Gecko/20100101 Firefox/104.0', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(609, '2022-09-03 10:24:30', '10.1.18.26', '10.1.18.26', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(610, '2022-09-08 10:54:44', '10.1.18.140', '10.1.18.140', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:104.0) Gecko/20100101 Firefox/104.0', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=shimee.abbe%40gmail.com&password=test123&login=Login'),
(611, '2022-09-08 10:55:41', '10.1.18.140', '10.1.18.140', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:104.0) Gecko/20100101 Firefox/104.0', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=shimee.abbe%40gmail.com&password=test123&login=Login'),
(612, '2022-09-08 10:56:19', '10.1.18.140', '10.1.18.140', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:104.0) Gecko/20100101 Firefox/104.0', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=shimee.abbe%40gmail.com&password=test123&login=Login'),
(613, '2022-09-09 06:53:28', '10.1.18.150', '10.1.18.150', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=zelestmary%40gmail.com&password=test123&login=Login'),
(614, '2022-09-09 07:10:26', '10.1.18.150', '10.1.18.150', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=zelestmary%40gmail.com&password=stmary%40ams&login=Login'),
(615, '2022-09-10 09:33:51', '10.1.18.26', '10.1.18.26', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(616, '2022-09-19 12:53:31', '10.1.18.26', '10.1.18.26', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(617, '2022-09-20 09:58:55', '10.1.18.26', '10.1.18.26', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(618, '2022-09-21 12:32:41', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(619, '2022-09-21 12:33:05', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(620, '2022-09-22 10:37:07', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(621, '2022-09-22 10:42:14', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(622, '2022-09-22 10:43:42', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(623, '2022-09-23 08:46:09', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(624, '2022-09-23 08:47:05', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(625, '2022-09-23 12:29:27', '10.1.18.26', '10.1.18.26', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(626, '2022-09-23 13:50:05', '10.1.18.211', '10.1.18.211', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(627, '2022-09-23 13:51:02', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(628, '2022-09-23 13:58:54', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(629, '2022-09-23 14:23:11', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(630, '2022-09-23 14:40:03', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(631, '2022-09-23 14:45:53', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(632, '2022-09-23 14:54:56', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(633, '2022-09-23 15:02:34', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(634, '2022-09-23 15:13:30', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(635, '2022-09-23 15:32:31', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(636, '2022-09-23 15:34:32', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(637, '2022-09-23 15:36:15', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(638, '2022-09-24 08:40:57', '127.0.0.1', 'WIN-6ROCS42A9DO', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(639, '2022-09-24 09:22:25', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(640, '2022-09-24 09:22:47', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(641, '2022-09-24 09:34:20', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(642, '2022-09-24 09:49:16', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(643, '2022-09-24 10:02:57', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login');
INSERT INTO `log` (`id`, `datetime`, `ip`, `hostname`, `uri`, `agent`, `referer`, `domain`, `filename`, `method`, `data`) VALUES
(644, '2022-09-24 10:29:07', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(645, '2022-09-24 10:38:57', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(646, '2022-09-24 10:46:12', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(647, '2022-09-24 10:59:45', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(648, '2022-09-24 11:02:51', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(649, '2022-09-24 11:05:57', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(650, '2022-09-24 11:13:59', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(651, '2022-09-24 11:50:28', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(652, '2022-09-29 07:36:47', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(653, '2022-09-29 08:07:33', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(654, '2022-09-29 08:14:49', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(655, '2022-09-29 08:27:55', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(656, '2022-09-29 08:32:03', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(657, '2022-09-29 08:38:21', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(658, '2022-09-29 08:43:24', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(659, '2022-09-29 09:21:41', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(660, '2022-09-29 13:36:12', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(661, '2022-09-29 15:42:12', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(662, '2022-09-30 07:56:12', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(663, '2022-10-03 09:24:59', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(664, '2022-10-03 09:55:56', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=123456&login=Login'),
(665, '2022-10-03 10:32:23', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(666, '2022-10-03 13:02:59', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(667, '2022-10-03 13:26:59', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(668, '2022-10-03 15:08:13', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(669, '2022-10-05 07:55:23', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(670, '2022-10-05 12:45:39', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(671, '2022-10-06 12:23:36', '10.1.110.211', '10.1.110.211', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(672, '2022-10-06 12:24:32', '10.1.110.211', '10.1.110.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(673, '2022-10-06 12:27:17', '10.1.110.211', '10.1.110.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(674, '2022-10-06 12:31:19', '10.1.110.211', '10.1.110.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(675, '2022-10-06 12:31:59', '10.1.110.211', '10.1.110.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(676, '2022-10-06 12:41:56', '10.1.110.211', '10.1.110.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(677, '2022-10-12 13:56:28', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(678, '2022-11-03 09:07:14', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(679, '2022-11-07 07:17:33', '10.1.110.211', '10.1.110.211', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(680, '2022-11-07 07:19:09', '10.1.110.211', '10.1.110.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(681, '2022-11-07 07:21:55', '10.1.110.211', '10.1.110.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(682, '2022-11-10 14:04:02', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(683, '2022-11-12 09:35:53', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(684, '2022-11-14 12:19:47', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(685, '2022-11-16 13:18:27', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(686, '2022-11-16 13:20:30', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(687, '2022-11-16 13:26:22', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(688, '2022-11-16 13:32:39', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(689, '2022-11-16 13:48:42', '10.1.110.211', '10.1.110.211', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(690, '2022-11-16 13:52:09', '10.1.110.211', '10.1.110.211', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.42', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(691, '2022-11-23 06:58:13', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(692, '2022-11-23 07:18:34', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(693, '2022-11-23 09:57:24', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(694, '2022-11-23 09:57:39', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(695, '2022-11-23 11:43:38', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(696, '2022-11-23 11:44:05', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(697, '2022-11-23 12:02:15', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(698, '2022-11-23 14:04:31', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(699, '2022-11-24 05:55:48', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(700, '2022-11-24 06:06:23', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(701, '2022-11-24 06:06:42', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(702, '2022-11-24 06:08:45', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(703, '2022-11-24 06:10:17', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(704, '2022-11-24 06:10:45', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(705, '2022-11-24 06:13:35', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(706, '2022-11-24 06:13:53', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(707, '2022-11-24 06:23:10', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(708, '2022-11-24 06:23:36', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(709, '2022-11-24 07:31:02', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(710, '2022-11-24 08:55:20', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(711, '2022-11-24 09:00:50', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(712, '2022-11-24 12:34:47', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(713, '2022-11-24 12:35:31', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(714, '2022-11-24 12:36:26', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(715, '2022-11-24 12:48:45', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(716, '2022-11-24 13:12:13', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(717, '2022-11-24 13:44:32', '10.1.18.211', '10.1.18.211', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(718, '2022-11-24 14:28:00', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(719, '2022-11-24 14:30:21', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(720, '2022-11-24 14:32:34', '10.1.18.211', '10.1.18.211', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(721, '2022-11-25 08:50:04', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(722, '2022-11-25 09:07:39', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(723, '2022-11-25 14:05:38', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(724, '2022-11-26 06:42:13', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(725, '2022-11-26 06:54:33', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=adminp%40admin.com&password=123456&login=Login'),
(726, '2022-11-26 06:56:58', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(727, '2022-11-26 07:54:02', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(728, '2022-11-26 07:54:37', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=adminp%40admin.com&password=123456&login=Login'),
(729, '2022-11-26 07:57:15', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(730, '2022-11-28 06:28:24', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(731, '2022-11-28 07:56:16', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(732, '2022-11-28 07:57:17', '10.1.11.38', '10.1.11.38', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.56', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=zelestmary%40gmail.com&password=test%40123&login=Login'),
(733, '2022-11-28 08:35:40', '10.1.18.26', '10.1.18.26', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(734, '2022-11-28 08:49:04', '10.1.18.45', '10.1.18.45', '/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(735, '2022-11-28 09:49:12', '10.1.18.198', '10.1.18.198', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=shimee.abbe%40gmail.com&password=test123&login=Login'),
(736, '2022-11-28 09:51:01', '10.1.18.198', '10.1.18.198', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=shimee.abbe%40gmail.com&password=harme%401212&login=Login'),
(737, '2022-11-28 11:19:20', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(738, '2022-11-28 12:02:34', '10.1.11.114', '10.1.11.114', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(739, '2022-11-28 12:19:15', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(740, '2022-11-28 12:25:09', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(741, '2022-11-28 12:36:01', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(742, '2022-11-28 12:36:43', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(743, '2022-11-28 12:38:56', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(744, '2022-11-28 15:50:30', '10.1.18.45', '10.1.18.45', '/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(745, '2022-11-28 17:39:09', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(746, '2022-11-29 06:06:50', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(747, '2022-11-29 06:10:52', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(748, '2022-11-29 06:11:13', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(749, '2022-11-29 06:11:35', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(750, '2022-11-29 06:12:24', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=adminsample%40admin.com&password=123456&login=Login'),
(751, '2022-11-29 06:44:22', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(752, '2022-11-29 06:57:22', '10.1.18.26', '10.1.18.26', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(753, '2022-11-29 13:33:06', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(754, '2022-11-29 13:34:52', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(755, '2022-11-30 06:47:08', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(756, '2022-11-30 09:08:15', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(757, '2022-11-30 13:44:00', '10.1.18.111', '10.1.18.111', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=negdegefa%40gmail.com&password=test123&login=Login'),
(758, '2022-12-02 06:56:37', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(759, '2022-12-02 06:57:08', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(760, '2022-12-02 07:13:22', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(761, '2022-12-02 07:13:46', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(762, '2022-12-02 07:27:58', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(763, '2022-12-02 08:47:15', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(764, '2022-12-03 07:40:57', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(765, '2022-12-03 07:46:50', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(766, '2022-12-05 05:44:14', '10.1.12.64', '10.1.12.64', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=zelestmary%40gmail.com&password=test%40123&login=Login'),
(767, '2022-12-05 07:11:15', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(768, '2022-12-05 08:14:37', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(769, '2022-12-05 08:55:16', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(770, '2022-12-05 09:01:51', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(771, '2022-12-05 09:09:51', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(772, '2022-12-05 09:10:22', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(773, '2022-12-05 09:10:45', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(774, '2022-12-05 09:11:01', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(775, '2022-12-05 09:16:58', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(776, '2022-12-05 09:18:01', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=adminsample%40admin.com&password=123456&login=Login'),
(777, '2022-12-05 13:35:31', '10.1.18.45', '10.1.18.45', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(778, '2022-12-06 06:20:31', '10.1.11.211', '10.1.11.211', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(779, '2022-12-06 06:36:42', '10.1.18.45', '10.1.18.45', '/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(780, '2022-12-06 07:16:08', '10.1.12.64', '10.1.12.64', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=zelestmary%40gmail.com&password=test%40123&login=Login'),
(781, '2022-12-06 07:18:35', '10.1.12.64', '10.1.12.64', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(782, '2022-12-06 07:20:02', '10.1.12.64', '10.1.12.64', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=zelestmary%40gmail.com&password=test%40123&login=Login'),
(783, '2022-12-06 07:21:37', '10.1.12.64', '10.1.12.64', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(784, '2022-12-06 07:37:07', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(785, '2022-12-06 09:54:59', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(786, '2022-12-06 11:03:39', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(787, '2022-12-06 14:13:44', '10.1.18.20', '10.1.18.20', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.62', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=zelalemtilahun.w%40gmail.com&password=test123&login=Login'),
(788, '2022-12-07 07:02:11', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(789, '2022-12-23 14:57:06', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login');
INSERT INTO `log` (`id`, `datetime`, `ip`, `hostname`, `uri`, `agent`, `referer`, `domain`, `filename`, `method`, `data`) VALUES
(790, '2022-12-23 15:07:53', '10.1.18.45', '10.1.18.45', '/', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(791, '2023-01-24 09:11:58', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(792, '2023-01-24 09:15:40', '10.1.11.114', '10.1.11.114', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(793, '2023-01-24 09:25:22', '10.1.12.64', '10.1.12.64', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=zelestmary%40gmail.com&password=test%40123&login=Login'),
(794, '2023-01-24 11:50:13', '10.1.11.114', '10.1.11.114', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(795, '2023-01-24 11:54:10', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(796, '2023-01-24 12:27:48', '10.1.12.64', '10.1.12.64', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.61', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=zelestmary%40gmail.com&password=test%40123&login=Login'),
(797, '2023-01-24 12:43:23', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(798, '2023-01-24 13:05:49', '10.1.11.114', '10.1.11.114', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(799, '2023-01-24 13:09:15', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(800, '2023-01-24 13:58:28', '10.1.125.62', 'WIN-6ROCS42A9DO', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(801, '2023-01-24 14:22:57', '10.1.125.62', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(802, '2023-02-07 15:00:44', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(803, '2023-02-08 13:19:51', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(804, '2023-02-08 14:25:32', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(805, '2023-02-08 14:29:03', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(806, '2023-02-08 14:33:59', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(807, '2023-02-08 14:35:27', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(808, '2023-02-14 12:04:35', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(809, '2023-02-14 16:17:56', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(810, '2023-02-14 16:48:15', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(811, '2023-02-14 16:48:35', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(812, '2023-02-14 16:49:01', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin3%40admin.com&password=123456&login=Login'),
(813, '2023-02-14 16:56:03', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(814, '2023-02-14 17:04:43', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(815, '2023-02-15 14:50:37', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(816, '2023-02-15 15:09:28', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(817, '2023-02-16 08:39:05', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(818, '2023-02-16 08:50:50', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(819, '2023-02-16 15:38:06', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(820, '2023-02-17 08:39:36', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(821, '2023-02-17 09:09:09', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(822, '2023-02-17 12:07:25', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(823, '2023-02-17 12:14:31', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(824, '2023-02-23 09:24:07', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=123456&login=Login'),
(825, '2023-02-23 09:24:46', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(826, '2023-02-23 09:25:09', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(827, '2023-02-23 09:42:48', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(828, '2023-02-23 12:51:01', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(829, '2023-02-23 13:21:44', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(830, '2023-02-23 14:37:36', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(831, '2023-02-23 14:44:53', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(832, '2023-02-23 15:02:23', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(833, '2023-02-25 07:02:36', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(834, '2023-02-25 07:03:12', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(835, '2023-02-25 07:06:15', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(836, '2023-02-27 11:54:26', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(837, '2023-02-27 13:26:23', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin4%40admin.com&password=123456&login=Login'),
(838, '2023-02-28 12:22:08', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(839, '2023-03-03 12:41:09', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(840, '2023-03-03 12:45:46', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(841, '2023-03-03 13:11:42', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(842, '2023-03-03 14:22:48', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(843, '2023-03-03 14:27:18', '10.1.18.26', '10.1.18.26', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(844, '2023-03-04 06:45:55', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(845, '2023-03-04 07:42:33', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(846, '2023-03-04 08:53:52', '10.1.18.26', '10.1.18.26', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=kinfeshibru18%40gmail.com&password=test123&login=Login'),
(847, '2023-03-04 10:35:32', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(848, '2023-03-04 10:56:01', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(849, '2023-03-04 10:58:35', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(850, '2023-03-04 11:02:39', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(851, '2023-03-04 11:02:44', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(852, '2023-03-06 12:11:32', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(853, '2023-03-06 12:11:54', '10.1.18.45', '10.1.18.45', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=addikam5%40gmail.com&password=test123&login=Login'),
(854, '2023-03-09 12:20:32', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(855, '2023-03-10 08:18:34', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(856, '2023-03-10 11:50:49', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(857, '2023-03-10 13:02:35', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(858, '2023-03-10 13:11:25', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(859, '2023-03-10 13:13:33', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(860, '2023-03-13 07:19:13', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(861, '2023-03-13 09:58:06', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(862, '2023-03-13 12:19:21', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(863, '2023-03-13 12:41:52', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(864, '2023-03-13 13:04:04', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(865, '2023-03-13 13:04:47', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(866, '2023-03-13 13:05:27', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(867, '2023-03-14 08:40:09', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(868, '2023-03-14 09:38:39', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(869, '2023-03-14 09:42:00', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(870, '2023-03-14 09:43:10', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(871, '2023-03-14 12:32:36', '10.1.18.170', '10.1.18.170', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=jonmersha%40gmail.com&password=test123&login=Login'),
(872, '2023-03-14 12:35:35', '10.1.11.210', '10.1.11.210', '/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0', 'http://10.1.125.62:8686/', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(873, '2023-03-14 12:40:10', '10.1.18.170', '10.1.18.170', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin5%40admin.com&password=123456&login=Login'),
(874, '2023-03-14 12:40:59', '10.1.18.170', '10.1.18.170', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin%40admin.com&password=654321&login=Login'),
(875, '2023-03-14 12:41:41', '10.1.18.170', '10.1.18.170', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'http://10.1.125.62:8686/index.php', '10.1.125.62:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login'),
(876, '2023-03-14 14:56:23', '127.0.0.1', 'WIN-6ROCS42A9DO', '/index.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://ams.cbo.com:8686/index.php', 'ams.cbo.com:8686', 'C:/xampp/htdocs/AMS/index.php', 'POST', 'email=admin2%40admin.com&password=test123&login=Login');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_plan`
--

CREATE TABLE `monthly_plan` (
  `id` int(30) NOT NULL,
  `q_id` int(30) NOT NULL,
  `s_id` varchar(255) NOT NULL,
  `e_id` varchar(255) NOT NULL,
  `Approval` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `monthly_plan`
--

INSERT INTO `monthly_plan` (`id`, `q_id`, `s_id`, `e_id`, `Approval`) VALUES
(1, 1, '2022-11-28', '2022-11-30', ''),
(2, 2, '2022-12-06', '2022-12-08', ''),
(3, 3, '2022-12-06', '2023-01-07', ''),
(4, 3, '2022-12-23', '2023-01-23', ''),
(5, 3, '2022-12-23', '2023-01-23', ''),
(6, 5, '2023-01-24', '2023-01-24', ''),
(7, 6, '2023-02-09', '2023-03-11', ''),
(9, 9, '3', '4', ''),
(10, 9, '3', '4', '');

-- --------------------------------------------------------

--
-- Table structure for table `month_year`
--

CREATE TABLE `month_year` (
  `s_id` int(30) NOT NULL,
  `m_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `month_year`
--

INSERT INTO `month_year` (`s_id`, `m_name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `observation`
--

CREATE TABLE `observation` (
  `id` int(30) NOT NULL,
  `observation` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `operational`
--

CREATE TABLE `operational` (
  `id` int(11) NOT NULL,
  `Operational_area` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `operational`
--

INSERT INTO `operational` (`id`, `Operational_area`) VALUES
(1, 'Cash'),
(2, 'Management'),
(3, 'Loan'),
(4, 'Clerical'),
(5, 'Database and Data backup'),
(6, 'IT service ');

-- --------------------------------------------------------

--
-- Table structure for table `policyregistration`
--

CREATE TABLE `policyregistration` (
  `id` int(11) NOT NULL,
  `FileName` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `Location` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `policyregistration`
--

INSERT INTO `policyregistration` (`id`, `FileName`, `department`, `description`, `Location`) VALUES
(1, '', '', '', 'uplds/03092022102840INTERNAL IRREGULARITY REPORT FOR THE MONTH OF AUG(1).xlsx'),
(3, 'DC Guide line', 'Core System', 'Data center management and monitoring', 'uplds/16022023084029audit_program.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `policy_procedure`
--

CREATE TABLE `policy_procedure` (
  `id` int(30) NOT NULL,
  `document_name` longtext NOT NULL,
  `application_area` longtext NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quarter_number`
--

CREATE TABLE `quarter_number` (
  `id` int(11) NOT NULL,
  `Quarter_number` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quarter_number`
--

INSERT INTO `quarter_number` (`id`, `Quarter_number`) VALUES
(1, '1st quarter'),
(2, '2nd quarter'),
(3, '3rd quarter'),
(4, '4th quarter');

-- --------------------------------------------------------

--
-- Table structure for table `quarter_plan`
--

CREATE TABLE `quarter_plan` (
  `id` int(30) NOT NULL,
  `a_id` int(30) NOT NULL,
  `audit_type` varchar(255) NOT NULL,
  `auditee` varchar(255) NOT NULL,
  `Quarter_number` int(15) NOT NULL,
  `Approval` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quarter_plan`
--

INSERT INTO `quarter_plan` (`id`, `a_id`, `audit_type`, `auditee`, `Quarter_number`, `Approval`) VALUES
(1, 2, 'Database management audit', 'Core System', 2, ''),
(2, 4, 'Data center design ', 'Infrastracture team', 2, ''),
(3, 3, 'Database management audit', 'infra', 2, ''),
(4, 7, 'IT AUDIT', 'IT Service Managemet Audit', 3, ''),
(5, 8, 'IT AUDIT', 'IT Service Managemet Audit', 3, ''),
(6, 9, 'IT AUDIT', 'IT Service Managemet team', 1, ''),
(7, 10, 'IT AUDIT', 'Bole Madanialem Branch', 3, ''),
(8, 10, 'Branch Audit', 'Bole Madanialem Branch', 3, ''),
(9, 10, 'Branch Audit', 'Bole Madanialem Branch', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `quarter_summary`
--

CREATE TABLE `quarter_summary` (
  `id` int(99) NOT NULL,
  `date` date DEFAULT current_timestamp(),
  `serial` varchar(1000) NOT NULL,
  `auditee` varchar(1000) NOT NULL,
  `Irregularity_type` varchar(1000) NOT NULL,
  `amt` int(99) NOT NULL,
  `total` int(99) NOT NULL,
  `approve` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quarter_summary`
--

INSERT INTO `quarter_summary` (`id`, `date`, `serial`, `auditee`, `Irregularity_type`, `amt`, `total`, `approve`) VALUES
(1, '2023-01-24', 'atzvo2', 'Adama Branch\r\n', 'Cash shortage', 1, 0, ''),
(2, '2023-01-24', 'sgzmpf', 'Finfine Branch', 'Insurance Expired', 2, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `recommendation`
--

CREATE TABLE `recommendation` (
  `id` int(11) NOT NULL,
  `recommendation` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rectification`
--

CREATE TABLE `rectification` (
  `id` int(11) NOT NULL,
  `Rectification` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rectification`
--

INSERT INTO `rectification` (`id`, `Rectification`) VALUES
(1, 'Fully Rectified'),
(2, 'Partially Rectified'),
(3, 'Not Rectified');

-- --------------------------------------------------------

--
-- Table structure for table `report_summary`
--

CREATE TABLE `report_summary` (
  `id` int(30) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `intro` longtext NOT NULL,
  `objective` longtext NOT NULL,
  `methodology` longtext NOT NULL,
  `scope` longtext NOT NULL,
  `technique` longtext NOT NULL,
  `rating` int(30) NOT NULL,
  `summary` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `risk_control`
--

CREATE TABLE `risk_control` (
  `id` int(10) NOT NULL,
  `Risk_code` varchar(100) NOT NULL,
  `Control_name` mediumtext NOT NULL,
  `Control_description` longtext NOT NULL,
  `Control_objectives` mediumtext NOT NULL,
  `Imp_criteria` varchar(150) NOT NULL,
  `Imp_area` longtext NOT NULL,
  `Document` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `risk_level`
--

CREATE TABLE `risk_level` (
  `id` int(11) NOT NULL,
  `risk_level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `risk_level`
--

INSERT INTO `risk_level` (`id`, `risk_level`) VALUES
(1, 'High/ Risky'),
(2, 'Medium'),
(3, 'low risk');

-- --------------------------------------------------------

--
-- Table structure for table `risk_list`
--

CREATE TABLE `risk_list` (
  `id` int(11) NOT NULL,
  `Risk_list` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `risk_list`
--

INSERT INTO `risk_list` (`id`, `Risk_list`) VALUES
(1, 'power fail');

-- --------------------------------------------------------

--
-- Table structure for table `risk_registration`
--

CREATE TABLE `risk_registration` (
  `id` int(11) NOT NULL,
  `Business_objective` longtext NOT NULL,
  `Business_owner` longtext NOT NULL,
  `Risk_list` longtext NOT NULL,
  `Likely_hood` longtext NOT NULL,
  `Risk_level` int(99) NOT NULL,
  `Impact_description` longtext NOT NULL,
  `Control_list` longtext NOT NULL,
  `Rect` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supporting_doc`
--

CREATE TABLE `supporting_doc` (
  `id` int(11) NOT NULL,
  `f_id` int(99) NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `auditor_name` int(99) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `upload_time` time DEFAULT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `id` int(11) NOT NULL,
  `designation` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_designation`
--

INSERT INTO `tbl_designation` (`id`, `designation`) VALUES
(0, 'USER'),
(1, 'DIRECTOR'),
(2, 'AUDITOR'),
(3, 'MANAGER'),
(4, 'PRINICIPAL');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `Team` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `Team`) VALUES
(1, 'Branch Audit'),
(2, 'Corporate Audit'),
(3, 'HO Department Audit'),
(5, 'Fraud Investigation'),
(6, 'IT audit team');

-- --------------------------------------------------------

--
-- Table structure for table `temp_team`
--

CREATE TABLE `temp_team` (
  `id` int(30) NOT NULL,
  `E_id` int(30) NOT NULL,
  `temp_foun_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Team_member` varchar(255) NOT NULL,
  `Auditor_in_charge` varchar(255) NOT NULL,
  `audit_type` varchar(255) NOT NULL,
  `auditee` varchar(255) NOT NULL,
  `sub` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Active,0=Inactive',
  `Approval` varchar(255) NOT NULL,
  `udate` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `upld`
--

CREATE TABLE `upld` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `id` int(11) NOT NULL,
  `fname` text CHARACTER SET latin1 NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wbs`
--

CREATE TABLE `wbs` (
  `E_id` int(11) NOT NULL,
  `id` int(15) NOT NULL,
  `Task_name` varchar(200) NOT NULL,
  `str_date` date NOT NULL DEFAULT current_timestamp(),
  `en_date` date NOT NULL DEFAULT current_timestamp(),
  `S_date` time DEFAULT NULL,
  `E_date` time DEFAULT NULL,
  `Duration` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acceptance`
--
ALTER TABLE `acceptance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `annual_plan`
--
ALTER TABLE `annual_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auditee`
--
ALTER TABLE `auditee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auditeeu`
--
ALTER TABLE `auditeeu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auditee_response`
--
ALTER TABLE `auditee_response`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auditor_name`
--
ALTER TABLE `auditor_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_activities`
--
ALTER TABLE `audit_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_object`
--
ALTER TABLE `audit_object`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_program`
--
ALTER TABLE `audit_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `E_id` (`E_id`);

--
-- Indexes for table `audit_program_engagement`
--
ALTER TABLE `audit_program_engagement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_id` (`m_id`);

--
-- Indexes for table `audit_type`
--
ALTER TABLE `audit_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_typeq`
--
ALTER TABLE `audit_typeq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cause`
--
ALTER TABLE `cause`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checklist`
--
ALTER TABLE `checklist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contac_p`
--
ALTER TABLE `contac_p`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `effect`
--
ALTER TABLE `effect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finding_detail`
--
ALTER TABLE `finding_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finding_registration`
--
ALTER TABLE `finding_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forget_password`
--
ALTER TABLE `forget_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_observation`
--
ALTER TABLE `general_observation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `intro_letter`
--
ALTER TABLE `intro_letter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `irregularity_type`
--
ALTER TABLE `irregularity_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monthly_plan`
--
ALTER TABLE `monthly_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `q_id` (`q_id`);

--
-- Indexes for table `month_year`
--
ALTER TABLE `month_year`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `observation`
--
ALTER TABLE `observation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operational`
--
ALTER TABLE `operational`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policyregistration`
--
ALTER TABLE `policyregistration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_procedure`
--
ALTER TABLE `policy_procedure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quarter_number`
--
ALTER TABLE `quarter_number`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quarter_plan`
--
ALTER TABLE `quarter_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a_id` (`a_id`);

--
-- Indexes for table `quarter_summary`
--
ALTER TABLE `quarter_summary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recommendation`
--
ALTER TABLE `recommendation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rectification`
--
ALTER TABLE `rectification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_summary`
--
ALTER TABLE `report_summary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `risk_control`
--
ALTER TABLE `risk_control`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `risk_level`
--
ALTER TABLE `risk_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `risk_list`
--
ALTER TABLE `risk_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `risk_registration`
--
ALTER TABLE `risk_registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Risk_level` (`Risk_level`),
  ADD KEY `Risk_level_2` (`Risk_level`);

--
-- Indexes for table `supporting_doc`
--
ALTER TABLE `supporting_doc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auditor_name` (`auditor_name`),
  ADD KEY `auditor_name_2` (`auditor_name`),
  ADD KEY `f_id` (`f_id`);

--
-- Indexes for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_team`
--
ALTER TABLE `temp_team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `E_id` (`E_id`);

--
-- Indexes for table `upld`
--
ALTER TABLE `upld`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wbs`
--
ALTER TABLE `wbs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `E_id` (`E_id`),
  ADD KEY `E_id_2` (`E_id`),
  ADD KEY `E_id_3` (`E_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acceptance`
--
ALTER TABLE `acceptance`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `annual_plan`
--
ALTER TABLE `annual_plan`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `auditee`
--
ALTER TABLE `auditee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `auditeeu`
--
ALTER TABLE `auditeeu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auditee_response`
--
ALTER TABLE `auditee_response`
  MODIFY `id` int(99) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auditor_name`
--
ALTER TABLE `auditor_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `audit_object`
--
ALTER TABLE `audit_object`
  MODIFY `id` int(33) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `audit_program`
--
ALTER TABLE `audit_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `audit_program_engagement`
--
ALTER TABLE `audit_program_engagement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `audit_typeq`
--
ALTER TABLE `audit_typeq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cause`
--
ALTER TABLE `cause`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checklist`
--
ALTER TABLE `checklist`
  MODIFY `id` int(35) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contac_p`
--
ALTER TABLE `contac_p`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `effect`
--
ALTER TABLE `effect`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `finding_detail`
--
ALTER TABLE `finding_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `finding_registration`
--
ALTER TABLE `finding_registration`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `forget_password`
--
ALTER TABLE `forget_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `general_observation`
--
ALTER TABLE `general_observation`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `intro_letter`
--
ALTER TABLE `intro_letter`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `irregularity_type`
--
ALTER TABLE `irregularity_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leave`
--
ALTER TABLE `leave`
  MODIFY `id` int(99) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=877;

--
-- AUTO_INCREMENT for table `monthly_plan`
--
ALTER TABLE `monthly_plan`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `month_year`
--
ALTER TABLE `month_year`
  MODIFY `s_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `observation`
--
ALTER TABLE `observation`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operational`
--
ALTER TABLE `operational`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `policyregistration`
--
ALTER TABLE `policyregistration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `policy_procedure`
--
ALTER TABLE `policy_procedure`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quarter_number`
--
ALTER TABLE `quarter_number`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quarter_plan`
--
ALTER TABLE `quarter_plan`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `quarter_summary`
--
ALTER TABLE `quarter_summary`
  MODIFY `id` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `recommendation`
--
ALTER TABLE `recommendation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rectification`
--
ALTER TABLE `rectification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `report_summary`
--
ALTER TABLE `report_summary`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `risk_control`
--
ALTER TABLE `risk_control`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `risk_level`
--
ALTER TABLE `risk_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `risk_list`
--
ALTER TABLE `risk_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `risk_registration`
--
ALTER TABLE `risk_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `supporting_doc`
--
ALTER TABLE `supporting_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `temp_team`
--
ALTER TABLE `temp_team`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `upld`
--
ALTER TABLE `upld`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wbs`
--
ALTER TABLE `wbs`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_program`
--
ALTER TABLE `audit_program`
  ADD CONSTRAINT `audit_program_ibfk_1` FOREIGN KEY (`E_id`) REFERENCES `audit_program_engagement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `audit_program_engagement`
--
ALTER TABLE `audit_program_engagement`
  ADD CONSTRAINT `audit_program_engagement_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `monthly_plan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `monthly_plan`
--
ALTER TABLE `monthly_plan`
  ADD CONSTRAINT `monthly_plan_ibfk_1` FOREIGN KEY (`q_id`) REFERENCES `monthly_plan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quarter_plan`
--
ALTER TABLE `quarter_plan`
  ADD CONSTRAINT `quarter_plan_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `annual_plan` (`id`);

--
-- Constraints for table `risk_registration`
--
ALTER TABLE `risk_registration`
  ADD CONSTRAINT `risk_registration_ibfk_1` FOREIGN KEY (`Risk_level`) REFERENCES `risk_level` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supporting_doc`
--
ALTER TABLE `supporting_doc`
  ADD CONSTRAINT `supporting_doc_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `finding_registration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supporting_doc_ibfk_2` FOREIGN KEY (`auditor_name`) REFERENCES `auditor_name` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temp_team`
--
ALTER TABLE `temp_team`
  ADD CONSTRAINT `temp_team_ibfk_1` FOREIGN KEY (`E_id`) REFERENCES `audit_program_engagement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
