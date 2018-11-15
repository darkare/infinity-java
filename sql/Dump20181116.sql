-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: 360coach_2.2
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `id` int(11) unsigned NOT NULL,
  `log_type` varchar(45) DEFAULT NULL COMMENT 'LOGIN\nSYS\nERR\n',
  `note` varchar(500) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_objective`
--

DROP TABLE IF EXISTS `business_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_objective` (
  `business_objective_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `business_objective_description` varchar(255) NOT NULL,
  PRIMARY KEY (`business_objective_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_objective`
--

LOCK TABLES `business_objective` WRITE;
/*!40000 ALTER TABLE `business_objective` DISABLE KEYS */;
INSERT INTO `business_objective` VALUES (1,'Operational efficiencies in payroll system'),(2,'Succession planning - talent identified and development journey mapped out'),(3,'Approved business case for new product or enhancement for existing product'),(4,'Uplift CSAT scores in my division by 20%');
/*!40000 ALTER TABLE `business_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cohort`
--

DROP TABLE IF EXISTS `cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort` (
  `cohort_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `organization_survey_id` int(10) unsigned DEFAULT NULL,
  `cohort_name` varchar(45) DEFAULT NULL,
  `cohort_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cohort_id`),
  KEY `fk_cohort_org_survey_idx` (`organization_survey_id`),
  CONSTRAINT `fk_cohort_org_survey` FOREIGN KEY (`organization_survey_id`) REFERENCES `organization_survey` (`organization_survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort`
--

LOCK TABLES `cohort` WRITE;
/*!40000 ALTER TABLE `cohort` DISABLE KEYS */;
INSERT INTO `cohort` VALUES (1,1,'Single Person Cohort','CEO. Relatively new to role. Taking on underperforming business'),(2,2,'Mid Level','Mid-level high potential leader.');
/*!40000 ALTER TABLE `cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datapoint_type`
--

DROP TABLE IF EXISTS `datapoint_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datapoint_type` (
  `datapoint_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datapoint_type_name` varchar(45) NOT NULL,
  `survey_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`datapoint_type_id`),
  KEY `FK_datapont_type_survey_idx` (`survey_id`),
  CONSTRAINT `FK_datapont_type_survey` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Holds the various available breakdown options for each survey type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datapoint_type`
--

LOCK TABLES `datapoint_type` WRITE;
/*!40000 ALTER TABLE `datapoint_type` DISABLE KEYS */;
INSERT INTO `datapoint_type` VALUES (1,'Self',1),(2,'Evaluators',2),(3,'Boss Boss',3),(4,'Boss',4),(5,'Peers',5),(6,'Direct Reports',6),(7,'Others',4);
/*!40000 ALTER TABLE `datapoint_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datapoint_type_dim_practice`
--

DROP TABLE IF EXISTS `datapoint_type_dim_practice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datapoint_type_dim_practice` (
  `datapoint_type_dim_practice_id` int(11) unsigned NOT NULL,
  `survey_result_id` int(11) unsigned NOT NULL,
  `dimension_practice_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`datapoint_type_dim_practice_id`),
  KEY `fk_dp_dim_prac` (`dimension_practice_id`),
  KEY `fk_dp_sur_result_idx` (`survey_result_id`),
  CONSTRAINT `fk_dp_dim_prac` FOREIGN KEY (`dimension_practice_id`) REFERENCES `dimension_practice` (`dimension_practice_id`),
  CONSTRAINT `fk_dp_sur_result` FOREIGN KEY (`survey_result_id`) REFERENCES `survey_result` (`survey_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datapoint_type_dim_practice`
--

LOCK TABLES `datapoint_type_dim_practice` WRITE;
/*!40000 ALTER TABLE `datapoint_type_dim_practice` DISABLE KEYS */;
/*!40000 ALTER TABLE `datapoint_type_dim_practice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datapoint_type_reflection`
--

DROP TABLE IF EXISTS `datapoint_type_reflection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datapoint_type_reflection` (
  `datapoint_type_reflection_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey_result_id` int(11) unsigned NOT NULL,
  `reflection_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`datapoint_type_reflection_id`),
  KEY `fk_suvey_result_idx` (`survey_result_id`),
  KEY `fk_datapoint_relection_idx` (`reflection_id`),
  CONSTRAINT `fk_datapoint_relection` FOREIGN KEY (`reflection_id`) REFERENCES `participant_reflection` (`reflection_id`),
  CONSTRAINT `fk_datapoint_suvey_result` FOREIGN KEY (`survey_result_id`) REFERENCES `survey_result` (`survey_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datapoint_type_reflection`
--

LOCK TABLES `datapoint_type_reflection` WRITE;
/*!40000 ALTER TABLE `datapoint_type_reflection` DISABLE KEYS */;
/*!40000 ALTER TABLE `datapoint_type_reflection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension`
--

DROP TABLE IF EXISTS `dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimension` (
  `dimension_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dimension_type_id` int(11) unsigned NOT NULL,
  `survey_id` int(11) unsigned NOT NULL COMMENT 'Identifies the survey that thsi dimension relates to',
  `dimension_name` varchar(255) NOT NULL COMMENT 'Name of the dimension',
  `dimension_summary` varchar(1000) DEFAULT NULL COMMENT 'Provides summary information about the dimension',
  `dimension_detail` varchar(3000) DEFAULT NULL COMMENT 'Provides more detail about the meaning of this dimension',
  `dimension_display_order` int(11) DEFAULT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`dimension_id`),
  KEY `parent_id_idx` (`parent_id`),
  KEY `fk_dimtype_idx` (`dimension_type_id`),
  KEY `fk_survey_id_idx` (`survey_id`),
  CONSTRAINT `fk_dimtype` FOREIGN KEY (`dimension_type_id`) REFERENCES `dimension_type` (`dimension_type_id`),
  CONSTRAINT `fk_survey_id` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`),
  CONSTRAINT `parent_id` FOREIGN KEY (`parent_id`) REFERENCES `dimension` (`dimension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The dimensions that relate to each survey';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension`
--

LOCK TABLES `dimension` WRITE;
/*!40000 ALTER TABLE `dimension` DISABLE KEYS */;
INSERT INTO `dimension` VALUES (1,2,1,'Complying','The Complying dimension measures the extent to which you get a sense of self-worth and security by complying with the expectations of others rather than acting on what you intend and want. The Complying dimension is comprised of four subscales: Conserva...','Scoring high on the Complying scale suggests that you tend to relinquish power to others and to the circumstances of life. You may even experience yourself at the mercy of circumstances over which you have little control. You tend to see the world as ful...',6,9),(2,2,1,'Controlling','some text','some text',7,9),(3,2,1,'Protecting','some text','some text',8,9),(4,1,1,'Relating','some text','some text',1,9),(5,1,1,'Self Awareness','some text','some text',2,9),(6,1,1,'Authenticity','some text','some text',3,9),(7,1,1,'Systems Awareness','some text','some text',4,9),(8,1,1,'Achievement','some text','some text',5,9),(9,3,1,'Leadership Circle','some text','some text',0,NULL),(10,1,1,'Caring Connection','some text','some text',9,4),(11,1,1,'Fosters Team Play','some text','some text',10,4),(12,1,1,'Collaborator','some text','some text',11,4),(13,1,1,'Mentoring and Developing','some text','some text',12,4),(14,1,1,'Interpersonal Intelligence','some text','some text',13,4),(15,1,1,'Selfless Leader','some text','some text',14,5),(16,1,1,'Balance','some text','some text',15,5),(17,1,1,'Composure','some text','some text',16,5),(18,1,1,'Personal Learner','some text','some text',17,5),(19,1,1,'Courageous Authenticity','some text','some text',18,6),(20,1,1,'Integrity','some text','some text',19,6),(21,1,1,'Community Concern','some text','some text',20,7),(22,1,1,'Sustainable Productivity','some text','some text',21,7),(23,1,1,'Systems Thinker','some text','some text',22,7),(24,1,1,'Strategic Focus','some text','some text',23,8),(25,1,1,'Purposeful and Visionary','some text','some text',24,8),(26,1,1,'Achieves Results','some text','some text',25,8),(27,1,1,'Decisiveness','some text','some text',26,8),(28,2,1,'Perfect','some text','some text',27,2),(29,2,1,'Driven','some text','some text',28,2),(30,2,1,'Ambition','some text','some text',29,2),(31,2,1,'Autocratic','some text','some text',30,2),(32,2,1,'Arrogance','some text','some text',31,3),(33,2,1,'Critical','some text','some text',32,3),(34,2,1,'Distance','some text','some text',33,3),(35,2,1,'Passive','Passive measures the degree to which you give away your power to others and to circumstances outside your control. It is a measure of the extent to which you believe that you are not the creator of your life experience, that your efforts do not make much...','Scoring high suggests that you build your sense of worth and security by playing small, complying with others expectations of you, and submitting your wants, needs, and goals to others or to the group. People scoring high on Passive have some of ...',34,1),(36,2,1,'Belonging','Belonging measures your need to conform, follow the rules, and meet the expectations of those in authority. This scale measures the extent to which you establish a sense of worth and security from belonging to the group and living by the norms, rules, an...','If you score high on the Belonging scale, you: Tend to be very respectful; Are steady, reliable and agreeable, but often lack spontaneity; Avoid conflict; Operate according to standard rules and procedures; May resist change and innovation; May have stro...',35,1),(37,2,1,'Pleasing','Pleasing measures your need to seek others‚ support and approval in order to feel secure and worthwhile as a person. People with strong needs for approval tend to base their degree of self-worth on their ability to gain others‚favor and co...','If you have a high score on the Pleasing scale, some of the following may apply to you. You: Focus on how people react to you; Will be quite sensitive to criticism or disapproval; May be so worried about your superiors acceptance of your ideas th...',36,1),(38,2,1,'Conservative','Conservative measures the extent to which you think and act conservatively, follow procedure, and live within the prescribed rules of the organization with which you are associated. This dimension is neutral to slightly negative in its correlation with t...','If you score high on the Conservative scale, you: Operate according to standard rules and procedures; Manage on the basis of policies, rules and regulations, and procedures; Motivate by urging conformity to procedures or standards and reward subordinates...',37,1),(39,3,6,'Leadership Capabilities','','',1,NULL),(40,3,6,'Setting direction and purpose','Setting direction and purpose is about creating clarity for self and others by answering the question - What are we trying to achieve and why?','Setting direction and purpose means: Defining personal leadership purpose and values. Understanding your leadership style, strengths and limitations. Aligning personal purpose and values with business objectives and values (customer lens on Purpose). Bui...',2,39),(41,3,6,'Making effective decisions','Making effective decisions is about being strategic in decision making.','Effective decision makers are capable in: Strategic decision making systems thinking; Prioritisation and focussing on the most important things that must be done; Empowering others to make decisions; Knowing when to consult, facilitate or deleg...',3,39),(42,3,6,'Inspiring others to act','Inspiring others to act is about fostering leadership at every level','Leaders who inspire others to act are capable in: Creating the conditions for autonomous action in line with business objectives; Coaching to empower and foster ownership; Tapping into intrinsic motivation; Effective delegation - letting go of control.',4,39),(43,3,6,'Developing people','Developing people is about elevating the skill level and engagement level of people in the team.','Capabilities include: Coaching to develop people; Modelling the way as a leader; Demonstrating care and connection',5,39),(44,3,6,'Build highly effective teams','Leaders scoring high in this area understand that their role is to achieve with and through others. They are focussed on creating the conditions for team success.','Capabilities include: Fostering an effective team culture; Feedback and accountability conversations; Challenging upwards; Effective collaboration.',6,39),(45,3,6,'Driving innovation','Leaders scoring high in this area actively promote calculated risk taking and develop a learning attitude towards failure.','Capabiliites include: Creating the right climate for innovation; Fixed vs Growth mindset; Creating the conditions for Aha! Moments; Building confidence in people to take action and learn from whatever happens.',7,39),(46,3,6,'This person clearly explains how my work fits into the big picture','','',8,40),(47,3,6,'This person leads with a clear and motivating purpose','','',9,40),(48,3,6,'This person consistently behaves in line with the values of the organisation','','',10,40),(49,3,6,'This person demonstrates courage in their convictions','','',11,40),(50,3,6,'This person leads with purpose','','',12,40),(51,3,6,'This person regularly coaches others','','',14,NULL),(52,3,6,'This person gives people opportunities to challenge themselves','','',15,NULL),(53,3,6,'This person demonstrates an interest in the professional development of others','','',16,NULL),(54,3,6,'This person talks to people about their career aspirations','','',17,NULL),(55,3,6,'This person provides regular feedback to others','','',18,NULL),(56,3,6,'This person is clear and consistent about priorities','','',19,41),(57,3,6,'This person makes decisions effectively','','',20,41),(58,3,6,'This person considers other peopleís input when making decisions','','',21,41),(59,3,6,'This person demonstrates flexibility in their approach to decision making','','',22,41),(60,3,6,'This person makes tough decisions when required','','',23,41),(61,3,6,'This person understands what motivates people','','',24,42),(62,3,6,'This person encourages me to take calculated risks','','',25,42),(63,3,6,'This person seeks to learn from their mistakes','','',26,42),(64,3,6,'This person knows when to step in and when to let people do their job','','',27,42),(65,3,6,'This person encourages people to take independent action','','',28,42),(66,3,6,'This person regularly coaches others','','',29,43),(67,3,6,'This person gives people opportunities to challenge themselves','','',30,43),(68,3,6,'This person demonstrates an interest in the professional development of others','','',31,43),(69,3,6,'This person talks to people about their career aspirations','','',32,43),(70,3,6,'This person provides regular feedback to others','','',33,43),(71,3,6,'This person holds people accountable to deliver','','',34,44),(72,3,6,'This person sets clear expectations','','',35,44),(73,3,6,'This person focuses on team rather than individual performance','','',36,44),(74,3,6,'This person is willing to have the tough conversations about performance','','',37,44),(75,3,6,'This person is trusted by others','','',38,44);
/*!40000 ALTER TABLE `dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension_guidance`
--

DROP TABLE IF EXISTS `dimension_guidance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimension_guidance` (
  `dimension_guidance_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `dimension_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`dimension_guidance_id`),
  KEY `fk_guide_dim_idx` (`dimension_id`),
  CONSTRAINT `fk_guide_dim` FOREIGN KEY (`dimension_id`) REFERENCES `dimension` (`dimension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension_guidance`
--

LOCK TABLES `dimension_guidance` WRITE;
/*!40000 ALTER TABLE `dimension_guidance` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimension_guidance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension_practice`
--

DROP TABLE IF EXISTS `dimension_practice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimension_practice` (
  `dimension_practice_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `participant_survey_id` int(11) unsigned NOT NULL,
  `dimension_id` int(11) unsigned NOT NULL,
  `practice_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dimension_practice_id`),
  KEY `pk_dim_parctive_psuvey_idx` (`participant_survey_id`),
  CONSTRAINT `pk_dim_parctive_psuvey` FOREIGN KEY (`participant_survey_id`) REFERENCES `participant_survey` (`participant_survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Links dimesiovs from a given participant result set to practices specified by the participant';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension_practice`
--

LOCK TABLES `dimension_practice` WRITE;
/*!40000 ALTER TABLE `dimension_practice` DISABLE KEYS */;
INSERT INTO `dimension_practice` VALUES (1,1,2,'When my view is challenged I will stop, breathe and ask a question to clarify my understanding of what they are saying.');
/*!40000 ALTER TABLE `dimension_practice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension_suggested_action`
--

DROP TABLE IF EXISTS `dimension_suggested_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimension_suggested_action` (
  `dimension_suggested_action_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dimension_id` int(11) unsigned NOT NULL,
  `suggested_action_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`dimension_suggested_action_id`),
  KEY `fk_dimsugact_dimid` (`dimension_id`),
  KEY `fk_saction_to_dimid` (`suggested_action_id`),
  CONSTRAINT `fk_dimsugact_dimid` FOREIGN KEY (`dimension_id`) REFERENCES `dimension` (`dimension_id`),
  CONSTRAINT `fk_saction_to_dimid` FOREIGN KEY (`suggested_action_id`) REFERENCES `suggested_action` (`suggested_action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Links suggested actions to dimensions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension_suggested_action`
--

LOCK TABLES `dimension_suggested_action` WRITE;
/*!40000 ALTER TABLE `dimension_suggested_action` DISABLE KEYS */;
INSERT INTO `dimension_suggested_action` VALUES (1,2,1),(2,2,3),(3,8,1),(4,8,3),(5,10,1),(6,10,3),(7,12,1),(8,12,3);
/*!40000 ALTER TABLE `dimension_suggested_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension_to_business_objective`
--

DROP TABLE IF EXISTS `dimension_to_business_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimension_to_business_objective` (
  `dimension_to_business_objective_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `participant_survey_id` int(11) unsigned DEFAULT NULL COMMENT 'idnetifies the survey result set we are looking at',
  `dimension_id` int(11) unsigned DEFAULT NULL COMMENT 'Defines the dimension that the participant has decided to focus on',
  `business_objective_id` int(11) unsigned DEFAULT NULL COMMENT 'Identifies the business objective that this dimension aligns with',
  PRIMARY KEY (`dimension_to_business_objective_id`),
  KEY `fk_dim_part_bus_obj_idx` (`participant_survey_id`),
  KEY `fk_dim_bus_obj_idx` (`business_objective_id`),
  CONSTRAINT `fk_dim_bus_obj` FOREIGN KEY (`business_objective_id`) REFERENCES `business_objective` (`business_objective_id`),
  CONSTRAINT `fk_dim_part_bus_obj` FOREIGN KEY (`participant_survey_id`) REFERENCES `participant_survey` (`participant_survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Links participant results with business objectives. Participants will browse thei result set and link certain dimensions in their result-set to objectives. i.e. they are defining which areas to focus on and how that area links through to business (and therfore strategic) objectives';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension_to_business_objective`
--

LOCK TABLES `dimension_to_business_objective` WRITE;
/*!40000 ALTER TABLE `dimension_to_business_objective` DISABLE KEYS */;
INSERT INTO `dimension_to_business_objective` VALUES (1,1,2,1),(2,1,2,2),(3,1,2,3);
/*!40000 ALTER TABLE `dimension_to_business_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension_type`
--

DROP TABLE IF EXISTS `dimension_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimension_type` (
  `dimension_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dimension_type_description` varchar(45) NOT NULL,
  PRIMARY KEY (`dimension_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lists terminology used to categorise some dimensions e.g. Leadership Circle classes 5 of its parent dimensions as Creative and 3 as Reactive. LSI classes groups of dimensions as Constructive, Passive defensive and Aggressive defensive. This table caters for any number of dimension categorisations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension_type`
--

LOCK TABLES `dimension_type` WRITE;
/*!40000 ALTER TABLE `dimension_type` DISABLE KEYS */;
INSERT INTO `dimension_type` VALUES (1,'Creative'),(2,'Reactive'),(3,'Root');
/*!40000 ALTER TABLE `dimension_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importance_rating`
--

DROP TABLE IF EXISTS `importance_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `importance_rating` (
  `importance_rating` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `importance_rating_value` int(11) DEFAULT NULL,
  `importance_rating_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`importance_rating`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines the available importance ratings that participants can assign to dimensions in their results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importance_rating`
--

LOCK TABLES `importance_rating` WRITE;
/*!40000 ALTER TABLE `importance_rating` DISABLE KEYS */;
INSERT INTO `importance_rating` VALUES (1,1,'Low'),(2,2,'Medium'),(3,3,'High'),(4,4,'Critical');
/*!40000 ALTER TABLE `importance_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_survey`
--

DROP TABLE IF EXISTS `organization_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_survey` (
  `organization_survey_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `survey_id` int(10) unsigned DEFAULT NULL,
  `organization_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`organization_survey_id`),
  KEY `fk_org_survey_idx` (`survey_id`),
  KEY `fk_org_idx` (`organization_id`),
  CONSTRAINT `fk_org` FOREIGN KEY (`organization_id`) REFERENCES `party` (`party_id`),
  CONSTRAINT `fk_org_survey` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_survey`
--

LOCK TABLES `organization_survey` WRITE;
/*!40000 ALTER TABLE `organization_survey` DISABLE KEYS */;
INSERT INTO `organization_survey` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `organization_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_business_objective`
--

DROP TABLE IF EXISTS `participant_business_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant_business_objective` (
  `participant_business_objective_id` int(11) unsigned NOT NULL,
  `participant_survey_id` int(11) unsigned NOT NULL,
  `business_objective_id` int(11) unsigned NOT NULL,
  `strategic_objective_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`participant_business_objective_id`),
  KEY `fk_part_bus_obj_idx` (`business_objective_id`),
  KEY `fk_part_bus_obj_part_survey_idx` (`participant_survey_id`),
  KEY `fk_part_bus_strategic_obj_idx` (`strategic_objective_id`),
  CONSTRAINT `fk_part_bus_obj` FOREIGN KEY (`business_objective_id`) REFERENCES `business_objective` (`business_objective_id`),
  CONSTRAINT `fk_part_bus_obj_part_survey` FOREIGN KEY (`participant_survey_id`) REFERENCES `participant_survey` (`participant_survey_id`),
  CONSTRAINT `fk_part_bus_strategic_obj` FOREIGN KEY (`strategic_objective_id`) REFERENCES `strategic_objective` (`strategic_objective_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Links participant surveys to business objectives to strategic objectives. A participants role may change from one survey to the next. This would mean their business objectives may change,  therefore we need to attach business objectives to participants via their surveys rather than directly.\nThe relationship between business objectives and strategic objectives is many-to-many.\nThe relationship between surveys and business objectives is 1-to-many.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_business_objective`
--

LOCK TABLES `participant_business_objective` WRITE;
/*!40000 ALTER TABLE `participant_business_objective` DISABLE KEYS */;
INSERT INTO `participant_business_objective` VALUES (1,2,2,2);
/*!40000 ALTER TABLE `participant_business_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_reflection`
--

DROP TABLE IF EXISTS `participant_reflection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant_reflection` (
  `reflection_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `participant_survey_id` int(11) unsigned NOT NULL,
  `dimension_id` int(11) unsigned DEFAULT NULL,
  `reflection_text` varchar(2000) DEFAULT NULL,
  `dimension_practice_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`reflection_id`),
  KEY `pk_reflection_psurvey_idx` (`participant_survey_id`),
  CONSTRAINT `pk_reflection_psurvey` FOREIGN KEY (`participant_survey_id`) REFERENCES `participant_survey` (`participant_survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Allows participants to record their reflections against dimensions and/or practices. A participant can record a reflection against a dimension in their surevey result without defining a practice. They may also record reflections related to specific practices.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_reflection`
--

LOCK TABLES `participant_reflection` WRITE;
/*!40000 ALTER TABLE `participant_reflection` DISABLE KEYS */;
INSERT INTO `participant_reflection` VALUES (1,1,2,'I feel the desire to control when people challenge my authority. My assumption is that I might lose credibility if I do not demonstrate my authority.',1),(2,1,2,'I listened well to Tony in our last meeting and discovered something about his motivations that surprised me. Continue listening!',1);
/*!40000 ALTER TABLE `participant_reflection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant_survey`
--

DROP TABLE IF EXISTS `participant_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant_survey` (
  `participant_survey_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Survey instance',
  `participant_id` int(11) unsigned NOT NULL COMMENT 'Participant that the survey relates to',
  `cohort_id` int(11) unsigned DEFAULT NULL,
  `coach_id` int(10) unsigned DEFAULT NULL,
  `participant_survey_date` date NOT NULL,
  `participant_survey_context` varchar(200) DEFAULT NULL COMMENT 'Space for additional context e.g. Job Title, years of service, role. Some tools capture this information and some do not. This field provides a flexible space to dopcument a range of relevant context information.',
  PRIMARY KEY (`participant_survey_id`),
  KEY `fk_participant_cohort_idx` (`cohort_id`),
  KEY `fk_participant_idx` (`participant_id`),
  KEY `fk_survey_coach_idx` (`coach_id`),
  CONSTRAINT `fk_participant` FOREIGN KEY (`participant_id`) REFERENCES `party` (`party_id`),
  CONSTRAINT `fk_participant_cohort` FOREIGN KEY (`cohort_id`) REFERENCES `cohort` (`organization_survey_id`),
  CONSTRAINT `fk_survey_coach` FOREIGN KEY (`coach_id`) REFERENCES `party` (`party_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores participant surveys that have been taken at different times';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant_survey`
--

LOCK TABLES `participant_survey` WRITE;
/*!40000 ALTER TABLE `participant_survey` DISABLE KEYS */;
INSERT INTO `participant_survey` VALUES (1,6,1,3,'2018-05-11','CEO. Relatively new to role. Taking on underperforming business'),(2,7,2,4,'2018-05-16','Mid-level high potential leader. Leads an IT function.'),(3,8,2,NULL,'2018-05-16','Mid-level high potential leader. Leads a team of Business Anlaysts. New to role');
/*!40000 ALTER TABLE `participant_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party` (
  `party_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `party_type_id` int(11) unsigned NOT NULL,
  `organization_name` varchar(45) DEFAULT NULL,
  `contact_last_name` varchar(45) DEFAULT NULL,
  `contact_first_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  PRIMARY KEY (`party_id`),
  KEY `fk_party_party_type_idx` (`party_type_id`),
  CONSTRAINT `fk_party_party_type` FOREIGN KEY (`party_type_id`) REFERENCES `party_type` (`party_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES (1,3,'Test Company Ltd',NULL,NULL,NULL,NULL,NULL),(2,3,'XYZ Pty Ltd',NULL,NULL,NULL,NULL,NULL),(3,2,'Infinity Pty Ltd','Williams','Lee','lee@infinityleadership.com.au','61424342686',NULL),(4,2,'Trans4me Pty Ltd','Faure','Francois','francois.faure@trans4me.com.au','61401628057',NULL),(5,2,'PeopleMax Pty Ltd','Leigh','Wallace','leighw@peoplemax.com.au','61421334673',NULL),(6,1,NULL,'One','Test','test.one@gmail.com',NULL,'1973-07-21 00:00:00'),(7,1,NULL,'Onemore','Test','onemore.test@gmail.com',NULL,'1969-06-23 00:00:00'),(8,1,NULL,'Test','Another','another.test@gmail.com',NULL,'1982-01-29 00:00:00');
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_type`
--

DROP TABLE IF EXISTS `party_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_type` (
  `party_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `party_type_name` varchar(45) DEFAULT NULL COMMENT 'organisation, coach, participant\n',
  PRIMARY KEY (`party_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_type`
--

LOCK TABLES `party_type` WRITE;
/*!40000 ALTER TABLE `party_type` DISABLE KEYS */;
INSERT INTO `party_type` VALUES (1,'PARTICIPANT'),(2,'COACH'),(3,'ORGANIZATION');
/*!40000 ALTER TABLE `party_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_user`
--

DROP TABLE IF EXISTS `party_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_user` (
  `party_id` int(11) unsigned NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user_permission_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`party_id`),
  KEY `fk_permission_type_idx` (`user_permission_id`),
  CONSTRAINT `fk_party_party_user` FOREIGN KEY (`party_id`) REFERENCES `party` (`party_id`),
  CONSTRAINT `fk_permission_type` FOREIGN KEY (`user_permission_id`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_user`
--

LOCK TABLES `party_user` WRITE;
/*!40000 ALTER TABLE `party_user` DISABLE KEYS */;
INSERT INTO `party_user` VALUES (6,'testone.gmail.com','password',2);
/*!40000 ALTER TABLE `party_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_category`
--

DROP TABLE IF EXISTS `practice_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practice_category` (
  `practice_category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `practice_category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`practice_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Defines the various categories of practice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_category`
--

LOCK TABLES `practice_category` WRITE;
/*!40000 ALTER TABLE `practice_category` DISABLE KEYS */;
INSERT INTO `practice_category` VALUES (1,'Coaching'),(2,'Feedback'),(3,'Prioritisation'),(4,'Results Focus'),(5,'Self-awareness'),(6,'Social awareness'),(7,'Emotional regulation'),(8,'My purpose'),(9,'Creating clarity'),(10,'Getting buy-in'),(11,'Influencing upwards'),(12,'Accountability'),(13,'Taking responsibility'),(14,'Self resilience'),(15,'Fostering collaboration');
/*!40000 ALTER TABLE `practice_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_completion_log`
--

DROP TABLE IF EXISTS `practice_completion_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practice_completion_log` (
  `practice_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `dimension_practice_id` int(11) unsigned NOT NULL,
  `log_datetime` datetime DEFAULT NULL,
  `reflection_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`practice_log_id`),
  KEY `fk_practice_completion_log_dim_idx` (`dimension_practice_id`),
  CONSTRAINT `fk_practice_completion_log_dim` FOREIGN KEY (`dimension_practice_id`) REFERENCES `dimension_practice` (`dimension_practice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Write a row to this table every time an instance of a practice is complete';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_completion_log`
--

LOCK TABLES `practice_completion_log` WRITE;
/*!40000 ALTER TABLE `practice_completion_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_completion_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_schedule`
--

DROP TABLE IF EXISTS `practice_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practice_schedule` (
  `practice_schedule_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dimension_practice_id` int(11) unsigned NOT NULL,
  `practice_datetime` datetime NOT NULL,
  `practice_remind_email` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Y = 1or N = 0',
  `practice_remind_sms` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Y = 1or N = 0',
  `reminder_status` varchar(10) DEFAULT NULL COMMENT 'COR = Complete Oustanding Result, CAR = Complete Average Result, CNR = Complete Negative Result, PEN = Pending, NON = No reminder set',
  PRIMARY KEY (`practice_schedule_id`),
  KEY `fk_practice_schedule_dim_idx` (`dimension_practice_id`),
  CONSTRAINT `fk_practice_schedule_dim` FOREIGN KEY (`dimension_practice_id`) REFERENCES `dimension_practice` (`dimension_practice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contains the schedule and reminder status for each participant practice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_schedule`
--

LOCK TABLES `practice_schedule` WRITE;
/*!40000 ALTER TABLE `practice_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_to_practice_category`
--

DROP TABLE IF EXISTS `practice_to_practice_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practice_to_practice_category` (
  `ptp_cat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dimension_practice_id` int(11) unsigned NOT NULL,
  `practice_category_id_to_practice_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ptp_cat_id`),
  KEY `fk_rel_cat_dim_practice_idx` (`dimension_practice_id`),
  KEY `fk_rel_dim_practice_cat_idx` (`practice_category_id_to_practice_id`),
  CONSTRAINT `fk_rel_cat_dim_practice` FOREIGN KEY (`dimension_practice_id`) REFERENCES `dimension_practice` (`dimension_practice_id`),
  CONSTRAINT `fk_rel_dim_practice_cat` FOREIGN KEY (`practice_category_id_to_practice_id`) REFERENCES `practice_category` (`practice_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Allows users to assign multiple categories to a single practice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_to_practice_category`
--

LOCK TABLES `practice_to_practice_category` WRITE;
/*!40000 ALTER TABLE `practice_to_practice_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_to_practice_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stg_dimension_hierarchy`
--

DROP TABLE IF EXISTS `stg_dimension_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stg_dimension_hierarchy` (
  `dimension_id` int(11) DEFAULT NULL,
  `parent_dimension_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stg_dimension_hierarchy`
--

LOCK TABLES `stg_dimension_hierarchy` WRITE;
/*!40000 ALTER TABLE `stg_dimension_hierarchy` DISABLE KEYS */;
INSERT INTO `stg_dimension_hierarchy` VALUES (35,1),(36,1),(37,1),(38,1),(28,2),(29,2),(30,2),(31,2),(32,3),(33,3),(34,3),(40,39),(41,39),(42,39),(43,39),(44,39),(45,39),(10,4),(11,4),(12,4),(13,4),(14,4),(46,40),(47,40),(48,40),(49,40),(50,40),(56,41),(57,41),(58,41),(59,41),(60,41),(61,42),(62,42),(63,42),(64,42),(65,42),(66,43),(67,43),(68,43),(69,43),(70,43),(71,44),(72,44),(73,44),(74,44),(75,44),(76,45),(77,45),(78,45),(79,45),(80,45),(15,5),(16,5),(17,5),(18,5),(19,6),(20,6),(21,7),(22,7),(23,7),(24,8),(25,8),(26,8),(27,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(9,9);
/*!40000 ALTER TABLE `stg_dimension_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategic_objective`
--

DROP TABLE IF EXISTS `strategic_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strategic_objective` (
  `strategic_objective_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `strategic_objective_description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`strategic_objective_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lists the strategic objectives that have been established by the business / organisation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategic_objective`
--

LOCK TABLES `strategic_objective` WRITE;
/*!40000 ALTER TABLE `strategic_objective` DISABLE KEYS */;
INSERT INTO `strategic_objective` VALUES (1,'Retention of key talent'),(2,'Operational efficiency'),(3,'Growth in new markets');
/*!40000 ALTER TABLE `strategic_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suggested_action`
--

DROP TABLE IF EXISTS `suggested_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suggested_action` (
  `suggested_action_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `suggested_action_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`suggested_action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Provides a list of suggested actions that can be linked to dimensions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suggested_action`
--

LOCK TABLES `suggested_action` WRITE;
/*!40000 ALTER TABLE `suggested_action` DISABLE KEYS */;
INSERT INTO `suggested_action` VALUES (1,'Journal your limiting assumptions and then counter argue against them.'),(2,'Practice letting other people speak before putting your view forward.'),(3,'Practice speaking up earlier than you would normally.'),(4,'Practice providing feedback to others'),(5,'Create a clear purpose and vision, then share it with others.');
/*!40000 ALTER TABLE `suggested_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey` (
  `survey_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey_vendor_id` int(11) unsigned NOT NULL,
  `survey_type_id` int(11) unsigned DEFAULT NULL,
  `survey_name` varchar(45) DEFAULT NULL COMMENT 'Name of the survey',
  `min_score` decimal(10,2) DEFAULT NULL,
  `max_score` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`survey_id`),
  KEY `fk_servey_vendor_idx` (`survey_vendor_id`),
  KEY `fk_survey_type_idx` (`survey_type_id`),
  CONSTRAINT `fk_survey_type` FOREIGN KEY (`survey_type_id`) REFERENCES `survey_type` (`survey_type_id`),
  CONSTRAINT `fk_survey_vendor` FOREIGN KEY (`survey_vendor_id`) REFERENCES `vendor` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lists the vendor survey tools supported';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` VALUES (1,1,1,'Leadership Circle Profile',0.00,100.00),(2,1,1,'Leadership Circle Manager Edition',0.00,100.00),(3,2,1,'Life Styles Inventory',0.00,100.00),(4,2,1,'Leadership Impact',0.00,100.00),(5,3,2,'DiSC',0.00,10.00),(6,4,1,'Leadership Capabilities',-2.00,2.00);
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_result`
--

DROP TABLE IF EXISTS `survey_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_result` (
  `survey_result_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `participant_survey_id` int(11) unsigned NOT NULL,
  `dimension_id` int(11) unsigned NOT NULL,
  `survey_result_datapoint_type_id` int(11) unsigned NOT NULL,
  `survey_result_datapoint_value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Default to 0',
  `importance_rating_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`survey_result_id`),
  UNIQUE KEY `uq_participant_survey` (`participant_survey_id`,`dimension_id`,`survey_result_datapoint_type_id`),
  KEY `fk_survey_result_datapoint_type_idx` (`survey_result_datapoint_type_id`),
  KEY `fk_importance_rating_idx` (`importance_rating_id`),
  CONSTRAINT `fk_importance_rating` FOREIGN KEY (`importance_rating_id`) REFERENCES `importance_rating` (`importance_rating`),
  CONSTRAINT `fk_survey_result_datapoint_type` FOREIGN KEY (`survey_result_datapoint_type_id`) REFERENCES `datapoint_type` (`datapoint_type_id`),
  CONSTRAINT `fk_survey_result_survey` FOREIGN KEY (`participant_survey_id`) REFERENCES `participant_survey` (`participant_survey_id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores survey scores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_result`
--

LOCK TABLES `survey_result` WRITE;
/*!40000 ALTER TABLE `survey_result` DISABLE KEYS */;
INSERT INTO `survey_result` VALUES (1,1,4,1,21.00,2),(2,1,4,2,27.00,2),(3,1,10,1,23.00,2),(4,1,10,2,27.00,2),(5,1,11,1,11.00,2),(6,1,11,2,29.00,2),(7,1,12,1,36.00,2),(8,1,12,2,26.00,2),(9,1,13,1,32.00,2),(10,1,13,2,33.00,2),(11,1,14,1,38.00,2),(12,1,14,2,33.00,2),(13,1,5,1,46.00,2),(14,1,5,2,40.00,2),(15,1,15,1,55.00,2),(16,1,15,2,34.00,2),(17,1,16,1,28.00,2),(18,1,16,2,70.00,2),(19,1,17,1,60.00,2),(20,1,17,2,42.00,2),(21,1,18,1,40.00,2),(22,1,18,2,33.00,2),(23,1,6,1,54.00,2),(24,1,6,2,39.00,2),(25,1,19,1,46.00,2),(26,1,19,2,33.00,2),(27,1,20,1,62.00,2),(28,1,20,2,58.00,2),(29,1,7,1,15.00,2),(30,1,7,2,33.00,2),(31,1,21,1,5.00,2),(32,1,21,2,33.00,2),(33,1,22,1,22.00,2),(34,1,22,2,38.00,2),(35,1,23,1,62.00,2),(36,1,23,2,37.00,2),(37,1,2,1,89.00,2),(38,1,2,2,65.00,2),(39,1,28,1,88.00,2),(40,1,28,2,42.00,2),(41,1,29,1,94.00,2),(42,1,29,2,40.00,2),(43,1,30,1,86.00,2),(44,1,30,2,58.00,2),(45,1,31,1,83.00,2),(46,1,31,2,67.00,2),(47,1,8,1,23.00,2),(48,1,8,2,25.00,2),(49,1,24,1,23.00,2),(50,1,24,2,25.00,2),(51,1,25,1,24.00,2),(52,1,25,2,25.00,2),(53,1,26,1,27.00,2),(54,1,26,2,26.00,2),(55,1,27,1,37.00,2),(56,1,27,2,42.00,2),(57,1,3,1,92.00,2),(58,1,3,2,74.00,2),(59,1,32,1,93.00,2),(60,1,32,2,76.00,2),(61,1,33,1,60.00,2),(62,1,33,2,70.00,2),(63,1,34,1,92.00,2),(64,1,34,2,72.00,2),(65,1,1,1,40.00,2),(66,1,1,2,59.00,2),(67,1,35,1,51.00,2),(68,1,35,2,64.00,2),(69,1,36,1,45.00,2),(70,1,36,2,50.00,2),(71,1,37,1,20.00,2),(72,1,37,2,45.00,2),(73,1,38,1,41.00,2),(74,1,38,2,41.00,2),(75,2,40,2,1.40,3),(76,2,41,2,1.40,3),(77,2,42,2,1.47,3),(78,2,43,2,1.07,3),(79,2,44,2,1.20,3),(80,2,45,2,1.53,3),(81,2,46,2,1.33,3),(82,2,47,2,1.67,3),(83,2,48,2,1.33,3),(84,2,49,2,1.00,3),(85,2,50,2,1.67,3),(86,2,51,2,0.33,3),(87,2,52,2,1.33,3),(88,2,53,2,1.33,3),(89,2,54,2,1.33,3),(90,2,55,2,1.00,3),(91,2,56,2,1.33,3),(92,2,57,2,1.33,3),(93,2,58,2,2.00,3),(94,2,59,2,1.00,3),(95,2,60,2,1.33,3),(96,2,61,2,1.33,3),(97,2,62,2,1.33,3),(98,2,63,2,1.67,3),(99,2,64,2,1.33,3),(100,2,65,2,1.67,3),(101,2,66,2,0.33,3),(102,2,67,2,1.33,3),(103,2,68,2,1.33,3),(104,2,69,2,1.33,3),(105,2,70,2,1.00,3),(106,2,71,2,1.67,3),(107,2,72,2,1.67,3),(108,2,73,2,1.33,3),(109,2,74,2,0.00,3),(110,2,75,2,1.33,3),(111,3,40,2,1.00,3),(112,3,41,2,1.20,3),(113,3,42,2,0.70,3),(114,3,43,2,1.07,3),(115,3,44,2,1.01,3),(116,3,45,2,-0.50,3),(117,3,46,2,1.10,3),(118,3,47,2,1.30,3),(119,3,48,2,1.30,3),(120,3,49,2,0.80,3),(121,3,50,2,0.50,3),(122,3,51,2,1.40,3),(123,3,52,2,1.20,3),(124,3,53,2,1.20,3),(125,3,54,2,1.33,3),(126,3,55,2,0.90,3),(127,3,56,2,-0.20,3),(128,3,57,2,-0.10,3),(129,3,58,2,1.38,3),(130,3,59,2,1.10,3),(131,3,60,2,1.33,3),(132,3,61,2,1.02,3),(133,3,62,2,0.75,3),(134,3,63,2,1.00,3),(135,3,64,2,0.90,3),(136,3,65,2,1.67,3),(137,3,66,2,0.23,3),(138,3,67,2,1.33,3),(139,3,68,2,1.10,3),(140,3,69,2,1.20,3),(141,3,70,2,1.20,3),(142,3,71,2,-0.90,3),(143,3,72,2,-0.75,3),(144,3,73,2,-0.80,3),(145,3,74,2,-0.02,3),(146,3,75,2,-0.01,3);
/*!40000 ALTER TABLE `survey_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_type`
--

DROP TABLE IF EXISTS `survey_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_type` (
  `survey_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey_type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`survey_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lists the survey possible types e.g. 360, Self assess only, Psychometric, Styles Index etc etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_type`
--

LOCK TABLES `survey_type` WRITE;
/*!40000 ALTER TABLE `survey_type` DISABLE KEYS */;
INSERT INTO `survey_type` VALUES (1,'360 Feedback'),(2,'Self Assessment');
/*!40000 ALTER TABLE `survey_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_role_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_type` varchar(45) NOT NULL COMMENT '[ADMIN, COACH, SPONSOR, PARTICIPANT] - hardcoded\n1.Coach (can see everything for their participants, but no one else)\n2. Participant (can see their own info, and summary reports for their cohort)\n3. Sponsor (can see summary reports for cohorts they have permissions for)\n4. Admin (everything)\n',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'ROLE_COACH'),(2,'ROLE_PARTICIPANT'),(3,'ROLE_SPONSOR'),(4,'ROLE_ADMIN');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `vendor_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(45) NOT NULL,
  `vendor_contact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='List of supported Vendors';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'The Leadership Circle','Pauline Abel'),(2,'Human Synergistics','Lorraine'),(3,'Resources Unlimited','Aleisha'),(4,'Infinity Leadership','Lee Williams');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_business_objective`
--

DROP TABLE IF EXISTS `vw_business_objective`;
/*!50001 DROP VIEW IF EXISTS `vw_business_objective`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_business_objective` AS SELECT 
 1 AS `participant_survey_id`,
 1 AS `business_objective_id`,
 1 AS `business_objective_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_participant_survey`
--

DROP TABLE IF EXISTS `vw_participant_survey`;
/*!50001 DROP VIEW IF EXISTS `vw_participant_survey`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_participant_survey` AS SELECT 
 1 AS `participant_survey_id`,
 1 AS `survey_id`,
 1 AS `survey_name`,
 1 AS `survey_type_name`,
 1 AS `participant_id`,
 1 AS `participant_survey_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_survey_result`
--

DROP TABLE IF EXISTS `vw_survey_result`;
/*!50001 DROP VIEW IF EXISTS `vw_survey_result`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_survey_result` AS SELECT 
 1 AS `survey_result_id`,
 1 AS `survey_id`,
 1 AS `dimension_id`,
 1 AS `dimension_name`,
 1 AS `parent_id`,
 1 AS `participant_survey_id`,
 1 AS `participant_id`,
 1 AS `datapoint_type_name`,
 1 AS `survey_result_datapoint_value`,
 1 AS `depth`,
 1 AS `dimension_display_order`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_business_objective`
--

/*!50001 DROP VIEW IF EXISTS `vw_business_objective`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_business_objective` AS select `pbo`.`participant_survey_id` AS `participant_survey_id`,`bo`.`business_objective_id` AS `business_objective_id`,`bo`.`business_objective_description` AS `business_objective_description` from (`business_objective` `bo` join `participant_business_objective` `pbo`) where (`pbo`.`business_objective_id` = `bo`.`business_objective_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_participant_survey`
--

/*!50001 DROP VIEW IF EXISTS `vw_participant_survey`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_participant_survey` AS select `ps`.`participant_survey_id` AS `participant_survey_id`,`s`.`survey_id` AS `survey_id`,`s`.`survey_name` AS `survey_name`,`st`.`survey_type_name` AS `survey_type_name`,`ps`.`participant_id` AS `participant_id`,`ps`.`participant_survey_date` AS `participant_survey_date` from ((((`survey` `s` join `cohort` `c`) join `organization_survey` `os`) join `participant_survey` `ps`) join `survey_type` `st`) where ((`c`.`organization_survey_id` = `os`.`organization_survey_id`) and (`os`.`survey_id` = `s`.`survey_id`) and (`ps`.`cohort_id` = `c`.`cohort_id`) and (`s`.`survey_type_id` = `st`.`survey_type_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_survey_result`
--

/*!50001 DROP VIEW IF EXISTS `vw_survey_result`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_survey_result` AS select `sr`.`survey_result_id` AS `survey_result_id`,`os`.`survey_id` AS `survey_id`,`d`.`dimension_id` AS `dimension_id`,`d`.`dimension_name` AS `dimension_name`,`d`.`parent_id` AS `parent_id`,`ps`.`participant_survey_id` AS `participant_survey_id`,`ps`.`participant_id` AS `participant_id`,`dpt`.`datapoint_type_name` AS `datapoint_type_name`,`sr`.`survey_result_datapoint_value` AS `survey_result_datapoint_value`,`fn_getDepth`(`d`.`dimension_id`) AS `depth`,`d`.`dimension_display_order` AS `dimension_display_order` from (((((`survey_result` `sr` join `participant_survey` `ps`) join `cohort` `c`) join `organization_survey` `os`) join `dimension` `d`) join `datapoint_type` `dpt`) where ((`ps`.`participant_survey_id` = `sr`.`participant_survey_id`) and (`ps`.`cohort_id` = `c`.`cohort_id`) and (`c`.`organization_survey_id` = `os`.`organization_survey_id`) and (`d`.`dimension_id` = `sr`.`dimension_id`) and (`sr`.`survey_result_datapoint_type_id` = `dpt`.`datapoint_type_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-16  0:39:31
