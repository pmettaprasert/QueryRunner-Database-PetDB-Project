CREATE DATABASE  IF NOT EXISTS `mm_cpsc502101team04` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mm_cpsc502101team04`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mm_cpsc502101team04
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `APPT_ID` int NOT NULL,
  `APPT_DATE` text,
  `APPT_REASON` text,
  `VET_ID` int DEFAULT NULL,
  `PET_ID` int DEFAULT NULL,
  PRIMARY KEY (`APPT_ID`),
  KEY `petidappt_idx` (`PET_ID`),
  KEY `vetidappt_idx` (`VET_ID`),
  CONSTRAINT `petidappt` FOREIGN KEY (`PET_ID`) REFERENCES `pet` (`PET_ID`),
  CONSTRAINT `vetidappt` FOREIGN KEY (`VET_ID`) REFERENCES `veterinarian` (`VET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2018-07-29 8:08','neutering',1,1),(2,'2019-12-26 13:41','dental work',2,2),(3,'2018-03-22 14:20','vaccine',3,3),(4,'2018-03-19 17:59','dental work',4,4),(5,'2018-01-31 9:31','general checkup',5,5),(6,'2019-10-26 13:33','vaccine',6,6),(7,'2022-02-23 17:56','vaccine',7,7),(8,'2018-05-01 16:20','vaccine',8,8),(9,'2019-11-24 16:32','neutering',9,9),(10,'2019-09-17 17:03','vaccine',10,10),(11,'2019-03-03 15:39','general checkup',11,11),(12,'2020-03-31 11:03','leg pain',12,12),(13,'2019-08-13 9:05','vaccine',13,13),(14,'2021-06-22 15:38','vaccine',14,14),(15,'2021-01-10 9:19','spaying',15,15),(16,'2021-08-06 15:57','procedure follow-up',16,16),(17,'2022-03-12 15:03','general checkup',17,17),(18,'2021-07-13 15:15','general checkup',18,18),(19,'2020-06-06 14:34','general checkup',19,19),(20,'2020-10-07 15:06','injury',20,20),(21,'2021-10-27 8:03','general checkup',1,21),(22,'2020-01-25 8:18','vaccine',2,22),(23,'2021-12-29 8:07','diarrhea',3,23),(24,'2021-12-20 10:09','spaying',4,24),(25,'2021-09-29 8:14','diarrhea',5,25),(26,'2022-01-03 10:53','vaccine',6,26),(27,'2018-09-10 14:37','diarrhea',7,27),(28,'2020-01-01 15:49','dental work',8,28),(29,'2020-02-08 14:29','general checkup',9,29),(30,'2021-12-18 16:38','dental work',10,30),(31,'2020-02-18 11:10','general checkup',11,31),(32,'2019-08-21 15:25','leg pain',12,32),(33,'2020-04-25 8:23','vaccine',13,33),(34,'2020-03-14 9:45','neutering',14,34),(35,'2022-03-05 10:02','vaccine',15,35),(36,'2021-12-28 13:25','general checkup',16,36),(37,'2021-07-15 16:04','vaccine',17,37),(38,'2018-10-22 17:12','general checkup',18,38),(39,'2020-06-04 17:36','general checkup',19,39),(40,'2019-08-30 13:03','general checkup',20,40),(41,'2020-12-02 17:16','general checkup',1,41),(42,'2021-06-12 15:34','neutering',2,42),(43,'2019-02-27 8:26','vaccine',3,43),(44,'2022-05-11 11:33','general checkup',4,44),(45,'2022-06-16 16:56','diarrhea',5,45),(46,'2021-10-15 13:44','neutering',6,46),(47,'2020-04-02 17:18','vaccine',7,47),(48,'2022-03-19 14:24','vaccine',8,48),(49,'2020-12-03 9:48','vaccine',9,49),(50,'2020-05-10 13:39','vaccine',10,50);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic` (
  `CLINIC_ID` int NOT NULL,
  `CLINIC_NAME` varchar(50) DEFAULT NULL,
  `CLINIC_PHONE` varchar(50) DEFAULT NULL,
  `CLINIC_EMAIL` varchar(50) DEFAULT NULL,
  `CLINIC_STREET` varchar(50) DEFAULT NULL,
  `ZIPCODE_ID` int DEFAULT NULL,
  PRIMARY KEY (`CLINIC_ID`),
  KEY `ZIPCODE_ID_idx` (`ZIPCODE_ID`),
  CONSTRAINT `ZIPCODE_ID` FOREIGN KEY (`ZIPCODE_ID`) REFERENCES `zipcode` (`ZIPCODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic`
--

LOCK TABLES `clinic` WRITE;
/*!40000 ALTER TABLE `clinic` DISABLE KEYS */;
INSERT INTO `clinic` VALUES (1,'Cogidoo','103-782-8518','nuppett0@sourceforge.net','238 Pankratz Hill',98175),(2,'Zoomcast','823-752-3283','bpavyer1@constantcontact.com','2 Mccormick Terrace',94616),(3,'Voolith','838-690-9944','nlyddy2@photobucket.com','5 Elmside Point',91199),(4,'Topicstorm','226-793-8879','vsweynson3@tinyurl.com','6797 Coolidge Crossing',93709),(5,'Vipe','681-628-2923','asandiford4@diigo.com','68 Jackson Terrace',98424),(6,'Tagopia','381-796-5928','mwrankling5@fema.gov','2 Macpherson Parkway',93709),(7,'Yombu','821-511-3775','cdeeprose6@123-reg.co.uk','58 Chive Park',95128),(8,'Skalith','282-418-8685','ccoolican7@amazon.co.jp','6882 8th Park',92710),(9,'Vinte','847-409-5278','mluckcock8@ning.com','0832 Veith Terrace',99252),(10,'Blognation','505-435-9494','mgooderidge9@merriam-webster.com','27 Fair Oaks Avenue',92822);
/*!40000 ALTER TABLE `clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthrecord`
--

DROP TABLE IF EXISTS `healthrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthrecord` (
  `HEALTHRECORD_ID` int NOT NULL,
  `HEALTHRECORD_DATE` date DEFAULT NULL,
  `HEALTHRECORD_NOTE` varchar(200) DEFAULT NULL,
  `PET_ID` int DEFAULT NULL,
  PRIMARY KEY (`HEALTHRECORD_ID`),
  KEY `PET_ID_idx` (`PET_ID`),
  CONSTRAINT `PETID` FOREIGN KEY (`PET_ID`) REFERENCES `pet` (`PET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthrecord`
--

LOCK TABLES `healthrecord` WRITE;
/*!40000 ALTER TABLE `healthrecord` DISABLE KEYS */;
INSERT INTO `healthrecord` VALUES (1,'2018-03-05','Oth fx upper end of unsp ulna, subs for clos fx w nonunion',1),(2,'2019-03-09','Pathological fracture, unspecified foot, sequela',2),(3,'2016-03-02','Corrosion of third degree of unspecified lower leg, sequela',3),(4,'2020-10-29','Burn unsp deg mult left fngr (nail), not inc thumb, sequela',4),(5,'2019-02-18','Nondisp fx of med malleolus of r tibia, 7thQ',5),(6,'2017-06-02','Cocaine use, unspecified with cocaine-induced mood disorder',6),(7,'2021-03-26','Infct of amniotic sac and membrns, unsp, unsp tri, fetus 5',7),(8,'2016-01-18','Blister (nonthermal) of right front wall of thorax, init',8),(9,'2021-09-10','Poisn by oth agents prim act on the resp sys, slf-hrm, sqla',9),(10,'2016-09-23','Sprain of MCP joint of left little finger, sequela',10),(11,'2021-09-11','Unsp fx unsp low leg, 7thJ',11),(12,'2016-07-28','Rupture of synovium, left shoulder',12),(13,'2017-12-04','Nondisp fx of body of unsp talus, subs for fx w malunion',13),(14,'2020-02-28','Poisoning by opth drugs and preparations, assault, subs',14),(15,'2020-06-13','Pyoderma vegetans',15),(16,'2016-03-23','Disorders of other cranial nerves',16),(17,'2017-09-19','Unsp nonpowered-aircraft accident injuring occupant, sequela',17),(18,'2018-09-05','Enlargement of unspecified orbit',18),(19,'2016-03-04','Drown d/t being thrown ovrbrd by motion of merch ship, sqla',19),(20,'2018-08-12','Toxic effect of rodenticides, assault, sequela',20),(21,'2016-01-10','Other anterior subluxation of left hip, subsequent encounter',21),(22,'2020-03-23','Inj flexor musc/fasc/tend l rng fngr at wrs/hnd lv, sequela',22),(23,'2019-07-14','2-part nondisp fx of surgical neck of unspecified humerus',23),(24,'2020-01-27','Carcinoma in situ of stomach',24),(25,'2016-03-25','Nursemaid\'s elbow, unspecified elbow, initial encounter',25),(26,'2021-01-09','Other congenital malformation of ovary',26),(27,'2021-02-13','Lac w fb of abd wall, epigst rgn w penet perit cav, subs',27),(28,'2019-09-22','Unspecified viral hepatitis without hepatic coma',28),(29,'2021-11-22','Subluxation stenosis of neural canal of cervical region',29),(30,'2017-11-14','Thyroid hormones and substitutes',30),(31,'2020-08-01','Fx unsp prt of nk of r femr, 7thF',31),(32,'2020-09-26','Breakdown (mechanical) of breast prosthesis and implant',32),(33,'2017-08-22','Accidental handgun malfunction, sequela',33),(34,'2020-10-05','Nontraumatic subarachnoid hemorrhage from basilar artery',34),(35,'2017-05-24','Other specified injuries of thyroid gland, initial encounter',35),(36,'2020-01-01','Unsp inj musc/tend the rotator cuff of unsp shldr, sequela',36),(37,'2019-05-14','Laceration of blood vessels of thorax, right side, sequela',37),(38,'2020-10-16','Disp fx of nk of unsp rad, 7thN',38),(39,'2017-10-19','Spontaneous rupture of other tendons, unspecified upper arm',39),(40,'2021-07-08','Other fracture of right patella',40),(41,'2018-01-13','Rheu arthritis w rheumatoid factor of hip w/o org/sys involv',41),(42,'2017-05-21','Loiasis',42),(43,'2019-12-24','Open bite of left little finger w damage to nail, init',43),(44,'2016-07-08','Nondisp fx of low epiphy (separation) of l femr, 7thM',44),(45,'2017-12-19','Endometriosis of intestine',45),(46,'2018-07-06','Placentitis, unsp trimester, not applicable or unspecified',46),(47,'2020-12-05','Adverse effect of amphetamines, subsequent encounter',47),(48,'2017-10-01','Inj radial artery at wrist and hand level of right arm, init',48),(49,'2018-09-09','Nondisp spiral fracture of shaft of humerus, left arm, init',49),(50,'2021-04-25','Parent-child conflict',50),(51,'2021-05-05','Ped on sktbrd injured in clsn w 2/3-whl mv in traf, init',51),(52,'2018-11-03','Malignant neoplasm of lower lobe, left bronchus or lung',52),(53,'2019-01-31','Toxoplasma chorioretinitis',53),(54,'2021-07-04','Newborn affected by surgical procedure on mother',54),(55,'2016-07-13','Encounter for initial prescription of other contraceptives',55),(56,'2020-04-10','Other physeal fracture of right calcaneus, 7thG',56),(57,'2017-10-19','Fracture of oth parts of pelvis, subs for fx w delay heal',57),(58,'2018-05-28','Burn of first degree of unspecified wrist, sequela',58),(59,'2020-04-05','Displ seg fx shaft of unsp femr, 7thE',59),(60,'2020-08-16','Abrasion of left wrist, sequela',60),(61,'2020-07-16','Other specified congenital malformations of eye',61),(62,'2019-06-11','Oth injuries of unspecified lower leg, subs encntr',62),(63,'2018-07-04','Minor laceration of femoral vein at hip and thigh level',63),(64,'2021-06-04','Bariatric surgery status comp pregnancy, second trimester',64),(65,'2020-09-25','Pneumonic plague',65),(66,'2021-01-28','Oth osteopor w current path fracture, unsp shoulder, sequela',66),(67,'2018-08-11','Nondisp fx of olecran pro w intartic extn unsp ulna, 7thC',67),(68,'2018-12-12','Oth fracture of T9-T10 vertebra, subs for fx w routn heal',68),(69,'2019-10-29','Unspecified sprain of unspecified shoulder joint',69),(70,'2019-02-18','Lateral dislocation of left patella',70),(71,'2017-09-28','Traumatic arthropathy, unspecified hip',1),(72,'2020-05-23','Poisoning by oth laxatives, accidental (unintentional), init',2),(73,'2018-02-10','Unspecified laceration of spleen',3),(74,'2017-05-27','Poisn by centr-acting/adren-neurn-block agnt, acc, sequela',4),(75,'2017-04-11','Pathological fracture, right shoulder',5),(76,'2017-05-12','Physeal fracture of upper end of fibula',6),(77,'2016-01-05','Laceration of popliteal vein',7),(78,'2018-02-20','Injury of ulnar nerve at wrist and hand level of unsp arm',8),(79,'2021-08-16','Other chondrocalcinosis, right hip',9),(80,'2016-11-02','Polyhydramnios, unspecified trimester, fetus 1',10),(81,'2020-09-15','Thyrotoxicosis [hyperthyroidism]',11),(82,'2020-11-22','Oth fx of lower end of left radius, init for opn fx type I/2',12),(83,'2021-07-03','Type 1 diab w moderate nonprlf diab rtnop w macular edema',13),(84,'2016-12-21','Sprain of left sternoclavicular joint',14),(85,'2021-08-06','Other infectious mononucleosis with polyneuropathy',15),(86,'2018-12-08','Occup of military vehicle injured in traffic accident, subs',16),(87,'2018-10-02','Poisoning by inhaled anesthetics, undetermined, init encntr',17),(88,'2017-05-01','Strain flexor musc/fasc/tend l mid fngr at wrs/hnd lv, subs',18),(89,'2021-12-08','Laceration with foreign body, unspecified knee, init encntr',19),(90,'2019-06-06','Unspecified superficial injury of left foot, sequela',20),(91,'2018-01-30','Breakdown of esophageal anti-reflux device, subs',21),(92,'2018-02-16','Poisoning by hemostatic drug, accidental, init',22),(93,'2021-06-19','Fall into oth water striking wall causing oth injury, init',23),(94,'2018-09-11','Legal intervnt involving oth means, suspect injured, sequela',24),(95,'2020-07-02','Anterior dislocation of left ulnohumeral joint, subs encntr',25),(96,'2020-02-15','Nondisp oblique fx shaft of l ulna, 7thF',26),(97,'2021-11-15','Poisoning by oth parasympath, accidental, sequela',27),(98,'2020-10-24','Malignant neoplasm of connective and soft tissue of pelvis',28),(99,'2016-04-08','Open bite of abdominal wall, l upr q w penet perit cav, init',29),(100,'2019-09-25','Matern care for disproprtn d/t unusually large fetus, fts2',30),(101,'2019-04-14','Unspecified interstitial keratitis',31),(102,'2021-01-27','Disp fx of prox 3rd of navic bone of unsp wrs, 7thD',32),(103,'2018-12-13','Disorders of muscle in diseases classd elswhr, shoulder',33),(104,'2020-03-27','Rheu heart disease w rheumatoid arthritis of unsp wrist',34),(105,'2018-08-07','Transient ischemic deafness, left ear',35),(106,'2017-01-06','Other specified injuries of right thigh',36),(107,'2018-07-30','Arthritis due to other bacteria, right hip',37),(108,'2018-10-12','Hair causing external constriction, subsequent encounter',38),(109,'2018-10-06','Parasomnia',39),(110,'2017-08-19','Burn of third degree of lip(s)',40),(111,'2016-09-21','Nondisp commnt fx left patella, subs for clos fx w malunion',41),(112,'2019-10-10','Occup of pk-up/van injured in clsn w pedl cyc in traf, init',42),(113,'2019-12-30','Chorioamnionitis, first trimester, fetus 3',43),(114,'2016-07-15','War op w explosn of sea-based artlry shell, milt, init',44),(115,'2016-01-20','Nondisp fx of dist phalanx of r mid fngr, 7thD',45),(116,'2021-07-12','Oth traum displ spondylolysis of second cervcal vert, sqla',46),(117,'2021-10-01','Insect bite (nonvenomous) of left upper arm, init encntr',47),(118,'2017-04-26','Intraop hemor/hemtom of ear/mastd comp a proc on ear/mastd',48),(119,'2016-08-06','Legal intervention involving injury by explosive shell',49),(120,'2021-07-10','Partial traumatic MCP amputation of finger, sequela',50),(121,'2016-07-18','Strain flexor musc/fasc/tend r mid fngr at wrs/hnd lv, sqla',51),(122,'2017-02-02','Bacterial intestinal infection, unspecified',52),(123,'2021-04-05','Exostosis of left external canal',53),(124,'2020-12-21','Crushing injury of right middle finger, sequela',54),(125,'2020-05-14','Legal intervnt involving oth means, suspect injured, init',55),(126,'2017-02-11','Postprocedural  cardiogenic shock, initial encounter',56),(127,'2020-10-27','Encounter for procreative management, unspecified',57),(128,'2019-05-09','Post disp fx of sternal end r clavicle, 7thK',58),(129,'2020-02-22','Traum subrac hem w LOC w death d/t brain inj bf consc, sqla',59),(130,'2016-04-18','Retained (old) magnetic fb in vitreous body, left eye',60),(131,'2019-02-11','Toxic effect of unspecified metal, assault',61),(132,'2021-07-22','Other rheumatic heart diseases',62),(133,'2021-07-27','Gastr contents in oth prt resp tract cause oth injury, init',63),(134,'2017-09-12','Poisoning by mixed antiepileptics, accidental, sequela',64),(135,'2021-03-25','Other multiple liveborn infant, unsp as to place of birth',65),(136,'2019-10-12','Minor laceration of body of pancreas, sequela',66),(137,'2018-11-02','Injury of unsp nerve at lower leg level, unspecified leg',67),(138,'2017-12-18','Avulsion fracture of tuberosity of calcaneus',68),(139,'2021-01-18','Poisoning by tetracyclines, accidental (unintentional), subs',69),(140,'2018-01-26','Poisoning by oth hormones and synthetic sub, undet, init',70),(141,'2020-07-05','Person outside car injured in clsn w ped/anml nontraf, subs',1),(142,'2020-04-05','Unspecified dislocation of unspecified knee',2),(143,'2021-09-05','Oth stimulant depend w stim-induce psychotic disorder, unsp',3),(144,'2018-11-05','Nondisp seg fx shaft of rad, r arm, 7thE',4),(145,'2020-09-23','Asphyx due to smothr under another person\'s body, acc',5),(146,'2019-02-04','Oculomandibular dysostosis',6),(147,'2018-09-06','Chronic inflammatory demyelinating polyneuritis',7),(148,'2021-12-24','Other specified strabismus',8),(149,'2019-12-05','Unspecified juvenile rheumatoid arthritis, unspecified hip',9),(150,'2018-11-26','Triplet pregnancy with two or more monoamniotic fetuses',10),(151,'2020-11-15','Adverse effect of therapeutic gases, subsequent encounter',11),(152,'2017-12-10','Strain of adductor musc/fasc/tend unsp thigh, subs',12),(153,'2018-05-26','Drown due to fall/jump fr crushed merchant ship, subs',13),(154,'2021-03-18','Other and unspecified edema specific to newborn',14),(155,'2018-03-18','Oth physl fx lower end unsp tibia, subs for fx w delay heal',15),(156,'2021-10-07','Other specified health status',16),(157,'2018-02-05','Stress fracture, right finger(s)',17),(158,'2017-04-26','Benign neoplasm of unspecified kidney',18),(159,'2020-12-10','Otorrhagia, bilateral',19),(160,'2019-09-30','Legal intervnt w unsp explosv, bystand injured, sequela',20),(161,'2021-09-26','Poisoning by cocaine, intentional self-harm',21),(162,'2021-11-18','Other dislocation of right knee, subsequent encounter',22),(163,'2016-09-12','Late congenital syphilitic polyneuropathy',23),(164,'2017-04-15','Displ suprcndl fracture w intrcndl extn lower end of r femur',24),(165,'2019-03-22','Biliary acute pancreatitis with uninfected necrosis',25),(166,'2017-05-23','Complete traumatic amputation of unsp ear, init encntr',26),(167,'2016-12-09','Fracture of other and unspecified metacarpal bone',27),(168,'2017-05-29','Oth fx upr & low end l fibula, subs for clos fx w routn heal',28),(169,'2021-10-09','Low risk HPV DNA test positive from female genital organs',29),(170,'2018-08-28','Primary angle closure without glaucoma damage, right eye',30),(171,'2018-09-01','Villonodular synovitis (pigmented), unspecified elbow',31),(172,'2017-05-31','Superficial frostbite of left hip and thigh, sequela',32),(173,'2018-09-03','Smith\'s fracture of right radius',33),(174,'2017-12-31','I/I react d/t other nrv sys device, implnt or graft, sequela',34),(175,'2018-11-20','Coloboma of iris',35),(176,'2019-05-04','Laceration with foreign body of right upper arm, sequela',36),(177,'2020-12-16','Pasngr on bus inj in clsn w rail trn/veh nontraf, sequela',37),(178,'2016-12-23','Minor laceration of left carotid artery, sequela',38),(179,'2019-12-10','Person outside 3-whl mv inj pick-up truck, pk-up/van in traf',39),(180,'2020-06-01','Orbital myositis, bilateral',40),(181,'2020-01-11','Displ oblique fx shaft of l fibula, 7thH',41),(182,'2020-01-18','Nondisp transverse fracture of shaft of unsp fibula, init',42),(183,'2017-08-29','Unsp inj musc/tend anterior grp at low leg level, right leg',43),(184,'2019-12-23','Breakdown of implnt elec nstim of spinal cord lead, init',44),(185,'2021-02-18','Asphyxiation due to smothering under pillow, assault, init',45),(186,'2018-05-19','Pnctr w/o fb of unsp front wall of thorax w penet thor cav',46),(187,'2016-03-12','Type 1 diab with mod nonp rtnop with macular edema, unsp',47),(188,'2016-12-20','Toxic effect of other seafood',48),(189,'2019-07-21','Other specified arthritis, right hand',49),(190,'2017-05-24','Nondisp commnt fx shaft of rad, r arm, 7thN',50),(191,'2019-08-18','Other strabismus',51),(192,'2018-01-10','Corrosion of first degree of right foot, initial encounter',52),(193,'2021-05-25','Open bite of left breast, sequela',53),(194,'2016-03-22','Abnormal radiologic findings on diagnostic imaging of kidney',54),(195,'2019-04-08','Complication of the puerperium, unspecified',55),(196,'2020-01-13','Nondisp commnt fx left patella, subs for clos fx w nonunion',56),(197,'2019-05-05','Ped w convey injured in clsn w rail trn/veh in traf, init',57),(198,'2021-10-22','Other contact with dog, subsequent encounter',58),(199,'2020-12-28','Nondisp commnt fx shaft of r fibula, 7thM',59),(200,'2016-03-27','Bus occupant (driver) (passenger) injured in unsp nontraf',60);
/*!40000 ALTER TABLE `healthrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `INSURANCE_ID` int NOT NULL,
  `INSURANCE_NAME` varchar(50) DEFAULT NULL,
  `INSURANCE_POLICY_NUM` varchar(50) DEFAULT NULL,
  `INSURANCE_PRICE` decimal(5,2) DEFAULT NULL,
  `INSURANCE_START_DATE` datetime DEFAULT NULL,
  `INSURANCE_END_DATE` datetime DEFAULT NULL,
  `INVOICE_ID` int DEFAULT NULL,
  PRIMARY KEY (`INSURANCE_ID`),
  KEY `INVOICE_ID_idx` (`INVOICE_ID`),
  CONSTRAINT `INVOICEID` FOREIGN KEY (`INVOICE_ID`) REFERENCES `invoice` (`INVOICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'Pet Shield','32-640-1239',254.64,'2021-06-14 00:00:00','2022-06-14 00:00:00',1),(2,'Pet Insurance Co','33-646-1863',423.76,'2022-04-08 00:00:00','2023-04-08 00:00:00',2),(3,'Protect Pet','13-378-6952',425.08,'2021-11-10 00:00:00','2022-11-10 00:00:00',3),(4,'Pain Free Pet','17-167-2303',656.05,'2021-06-02 00:00:00','2022-06-02 00:00:00',4),(5,'Healthy Pet','94-789-0075',276.17,'2021-07-05 00:00:00','2022-07-05 00:00:00',5),(6,'Pet Shield','17-190-2845',352.32,'2022-05-08 00:00:00','2023-05-08 00:00:00',6),(7,'Pet Insurance Co','02-092-6438',685.00,'2022-01-05 00:00:00','2023-01-05 00:00:00',7),(8,'Protect Pet','02-306-2738',558.05,'2021-11-27 00:00:00','2022-11-27 00:00:00',8),(9,'Pain Free Pet','20-338-3260',405.41,'2021-10-08 00:00:00','2022-10-08 00:00:00',9),(10,'Healthy Pet','72-428-7980',396.84,'2022-01-27 00:00:00','2023-01-27 00:00:00',10),(11,'Pet Shield','47-386-6142',563.25,'2021-10-07 00:00:00','2022-10-07 00:00:00',11),(12,'Pet Insurance Co','72-187-6411',567.66,'2021-05-24 00:00:00','2022-05-24 00:00:00',12),(13,'Protect Pet','67-824-4004',457.16,'2021-11-27 00:00:00','2022-11-27 00:00:00',13),(14,'Pain Free Pet','19-109-6942',547.38,'2021-07-13 00:00:00','2022-07-13 00:00:00',14),(15,'Healthy Pet','48-439-0336',416.22,'2022-03-02 00:00:00','2023-03-02 00:00:00',15),(16,'Pet Shield','62-948-3377',329.66,'2021-11-02 00:00:00','2022-11-02 00:00:00',16),(17,'Pet Insurance Co','53-997-7469',342.51,'2021-12-25 00:00:00','2022-12-25 00:00:00',17),(18,'Protect Pet','58-850-5107',209.53,'2021-04-27 00:00:00','2022-04-27 00:00:00',18),(19,'Pain Free Pet','62-819-0636',332.79,'2022-03-01 00:00:00','2023-03-01 00:00:00',19),(20,'Healthy Pet','16-525-5239',356.89,'2021-12-06 00:00:00','2022-12-06 00:00:00',20),(21,'Pet Shield','69-939-0084',539.39,'2022-01-05 00:00:00','2023-01-05 00:00:00',21),(22,'Pet Insurance Co','21-244-8218',290.92,'2022-05-02 00:00:00','2023-05-02 00:00:00',22),(23,'Protect Pet','80-740-1099',441.52,'2021-10-04 00:00:00','2022-10-04 00:00:00',23),(24,'Pain Free Pet','13-403-4845',582.40,'2022-04-02 00:00:00','2023-04-02 00:00:00',24),(25,'Healthy Pet','96-876-3520',523.98,'2021-12-13 00:00:00','2022-12-13 00:00:00',25),(26,'Pet Shield','04-660-1171',595.33,'2022-03-03 00:00:00','2023-03-03 00:00:00',26),(27,'Pet Insurance Co','32-364-8933',590.90,'2022-01-01 00:00:00','2023-01-01 00:00:00',27),(28,'Protect Pet','04-983-0179',656.00,'2021-10-08 00:00:00','2022-10-08 00:00:00',28),(29,'Pain Free Pet','86-561-3276',489.99,'2021-08-09 00:00:00','2022-08-09 00:00:00',29),(30,'Healthy Pet','48-131-9584',266.89,'2022-02-19 00:00:00','2023-02-19 00:00:00',30),(31,'Pet Shield','14-634-4014',436.33,'2021-11-22 00:00:00','2022-11-22 00:00:00',31),(32,'Pet Insurance Co','50-609-1198',564.18,'2021-07-26 00:00:00','2022-07-26 00:00:00',32),(33,'Protect Pet','83-649-1534',448.30,'2021-05-18 00:00:00','2022-05-18 00:00:00',33),(34,'Pain Free Pet','37-570-1911',383.36,'2021-05-27 00:00:00','2022-05-27 00:00:00',34),(35,'Healthy Pet','88-192-2733',611.31,'2022-03-15 00:00:00','2023-03-15 00:00:00',35),(36,'Pet Shield','15-115-9570',208.77,'2021-09-07 00:00:00','2022-09-07 00:00:00',36),(37,'Pet Insurance Co','49-030-6321',485.20,'2022-01-23 00:00:00','2023-01-23 00:00:00',37),(38,'Protect Pet','50-859-5618',681.80,'2021-08-10 00:00:00','2022-08-10 00:00:00',38),(39,'Pain Free Pet','49-457-4183',455.33,'2021-07-18 00:00:00','2022-07-18 00:00:00',39),(40,'Healthy Pet','73-444-5290',286.62,'2022-04-21 00:00:00','2023-04-21 00:00:00',40),(41,'Pet Shield','50-743-7141',640.15,'2021-06-24 00:00:00','2022-06-24 00:00:00',41),(42,'Pet Insurance Co','05-460-0506',642.15,'2022-03-31 00:00:00','2023-03-31 00:00:00',42),(43,'Protect Pet','09-229-8349',493.24,'2021-11-25 00:00:00','2022-11-25 00:00:00',43),(44,'Pain Free Pet','67-626-0690',296.83,'2021-05-13 00:00:00','2022-05-13 00:00:00',44),(45,'Healthy Pet','15-997-0964',529.49,'2022-02-16 00:00:00','2023-02-16 00:00:00',45),(46,'Pet Shield','64-975-7452',693.28,'2021-11-24 00:00:00','2022-11-24 00:00:00',46),(47,'Pet Insurance Co','48-481-3358',358.74,'2021-07-15 00:00:00','2022-07-15 00:00:00',47),(48,'Protect Pet','27-702-2538',652.72,'2021-11-14 00:00:00','2022-11-14 00:00:00',48),(49,'Pain Free Pet','94-356-5330',691.75,'2021-12-11 00:00:00','2022-12-11 00:00:00',49),(50,'Healthy Pet','08-294-7659',645.11,'2022-02-02 00:00:00','2023-02-02 00:00:00',50),(51,'Pet Shield','85-027-2571',617.56,'2021-12-17 00:00:00','2022-12-17 00:00:00',1),(52,'Pet Insurance Co','03-875-1782',279.04,'2022-04-28 00:00:00','2023-04-28 00:00:00',2),(53,'Protect Pet','04-445-0727',498.85,'2021-05-09 00:00:00','2022-05-09 00:00:00',3),(54,'Pain Free Pet','14-972-4587',288.01,'2021-08-18 00:00:00','2022-08-18 00:00:00',4),(55,'Healthy Pet','06-503-4748',362.34,'2021-08-22 00:00:00','2022-08-22 00:00:00',5),(56,'Pet Shield','16-765-5569',654.05,'2021-11-06 00:00:00','2022-11-06 00:00:00',6),(57,'Pet Insurance Co','61-003-5356',337.55,'2021-07-20 00:00:00','2022-07-20 00:00:00',7),(58,'Protect Pet','78-112-8658',427.52,'2022-01-01 00:00:00','2023-01-01 00:00:00',8),(59,'Pain Free Pet','62-778-6944',576.51,'2021-11-06 00:00:00','2022-11-06 00:00:00',9),(60,'Healthy Pet','55-506-2952',477.31,'2022-01-28 00:00:00','2023-01-28 00:00:00',10),(61,'Pet Shield','75-638-2390',649.11,'2021-07-16 00:00:00','2022-07-16 00:00:00',11),(62,'Pet Insurance Co','56-285-7055',417.80,'2022-03-10 00:00:00','2023-03-10 00:00:00',12),(63,'Protect Pet','77-120-4576',222.16,'2022-03-21 00:00:00','2023-03-21 00:00:00',13),(64,'Pain Free Pet','24-530-7195',556.55,'2021-08-30 00:00:00','2022-08-30 00:00:00',14),(65,'Healthy Pet','60-258-7028',587.41,'2021-07-14 00:00:00','2022-07-14 00:00:00',15),(66,'Pet Shield','60-512-2973',545.19,'2021-11-18 00:00:00','2022-11-18 00:00:00',16),(67,'Pet Insurance Co','65-561-1715',624.22,'2022-01-14 00:00:00','2023-01-14 00:00:00',17),(68,'Protect Pet','99-601-2577',602.68,'2022-03-15 00:00:00','2023-03-15 00:00:00',18),(69,'Pain Free Pet','37-362-2843',548.62,'2022-04-15 00:00:00','2023-04-15 00:00:00',19),(70,'Healthy Pet','38-913-0874',667.95,'2022-03-23 00:00:00','2023-03-23 00:00:00',20),(71,'Pet Shield','80-292-7340',222.41,'2022-03-17 00:00:00','2023-03-17 00:00:00',21),(72,'Pet Insurance Co','38-640-6261',387.66,'2021-08-10 00:00:00','2022-08-10 00:00:00',22),(73,'Protect Pet','06-630-0337',291.95,'2022-02-15 00:00:00','2023-02-15 00:00:00',23),(74,'Pain Free Pet','83-929-9329',681.96,'2021-05-09 00:00:00','2022-05-09 00:00:00',24),(75,'Healthy Pet','56-484-0994',409.82,'2022-01-01 00:00:00','2023-01-01 00:00:00',25),(76,'Pet Shield','53-029-8616',424.47,'2022-01-13 00:00:00','2023-01-13 00:00:00',26),(77,'Pet Insurance Co','73-136-7118',247.45,'2021-09-30 00:00:00','2022-09-30 00:00:00',27),(78,'Protect Pet','78-499-4523',555.77,'2021-06-07 00:00:00','2022-06-07 00:00:00',28),(79,'Pain Free Pet','13-921-8705',522.76,'2021-12-05 00:00:00','2022-12-05 00:00:00',29),(80,'Healthy Pet','05-684-8774',412.74,'2021-05-11 00:00:00','2022-05-11 00:00:00',30),(81,'Pet Shield','39-116-6426',618.15,'2021-04-20 00:00:00','2022-04-20 00:00:00',31),(82,'Pet Insurance Co','83-056-9025',511.23,'2021-04-26 00:00:00','2022-04-26 00:00:00',32),(83,'Protect Pet','56-227-4916',628.95,'2021-06-03 00:00:00','2022-06-03 00:00:00',33),(84,'Pain Free Pet','63-708-5486',467.68,'2022-01-31 00:00:00','2023-01-31 00:00:00',34),(85,'Healthy Pet','34-405-4649',576.56,'2022-01-22 00:00:00','2023-01-22 00:00:00',35),(86,'Pet Shield','35-969-4908',218.84,'2022-01-15 00:00:00','2023-01-15 00:00:00',36),(87,'Pet Insurance Co','84-141-1146',593.95,'2021-06-03 00:00:00','2022-06-03 00:00:00',37),(88,'Protect Pet','00-755-0259',454.37,'2022-01-23 00:00:00','2023-01-23 00:00:00',38),(89,'Pain Free Pet','85-764-7973',454.74,'2021-09-08 00:00:00','2022-09-08 00:00:00',39),(90,'Healthy Pet','01-423-4054',552.63,'2022-04-19 00:00:00','2023-04-19 00:00:00',40),(91,'Pet Shield','48-401-5586',631.22,'2022-04-18 00:00:00','2023-04-18 00:00:00',41),(92,'Pet Insurance Co','89-052-2239',511.53,'2022-03-10 00:00:00','2023-03-10 00:00:00',42),(93,'Protect Pet','36-574-1025',345.80,'2021-12-26 00:00:00','2022-12-26 00:00:00',43),(94,'Pain Free Pet','48-174-3705',268.08,'2021-06-11 00:00:00','2022-06-11 00:00:00',44),(95,'Healthy Pet','08-779-0559',237.44,'2022-02-24 00:00:00','2023-02-24 00:00:00',45),(96,'Pet Shield','06-824-8072',428.18,'2021-12-09 00:00:00','2022-12-09 00:00:00',46),(97,'Pet Insurance Co','10-394-8480',648.15,'2022-04-19 00:00:00','2023-04-19 00:00:00',47),(98,'Protect Pet','94-372-9579',498.32,'2021-04-25 00:00:00','2022-04-25 00:00:00',48),(99,'Pain Free Pet','53-997-5385',412.03,'2022-03-14 00:00:00','2023-03-14 00:00:00',49),(100,'Healthy Pet','58-096-7218',434.56,'2021-06-07 00:00:00','2022-06-07 00:00:00',50);
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `INVOICE_ID` int NOT NULL,
  `INVOICE_DESCRIPTION` varchar(200) DEFAULT NULL,
  `INVOICE_COST` decimal(8,2) DEFAULT NULL,
  `INVOICE_DATE` date DEFAULT NULL,
  PRIMARY KEY (`INVOICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'Nondisplaced fracture of medial phalanx of right middle finger, subsequent encounter for fracture with routine healing',7064.69,'2021-07-27'),(2,'Laceration without foreign body of right little finger with damage to nail, subsequent encounter',1585.83,'2022-05-04'),(3,'Poisoning by electrolytic, caloric and water-balance agents, undetermined, subsequent encounter',132.35,'2021-04-25'),(4,'Encounter for aftercare following organ transplant',7207.10,'2020-12-23'),(5,'Puncture wound without foreign body of left hand, initial encounter',503.70,'2022-04-16'),(6,'Struck by raccoon',9773.17,'2020-03-10'),(7,'Strain of unspecified muscle(s) and tendon(s) at lower leg level, left leg, initial encounter',1603.07,'2020-06-15'),(8,'Pedestrian injured in unspecified nontraffic accident, sequela',6787.12,'2022-03-13'),(9,'Drug-induced chronic gout, hand',9248.60,'2020-10-04'),(10,'Unspecified complication of unspecified transplanted organ and tissue',7951.17,'2020-07-17'),(11,'Unspecified physeal fracture of phalanx of left toe, sequela',7891.79,'2020-03-16'),(12,'Displaced fracture of medial condyle of unspecified tibia, subsequent encounter for open fracture type I or II with delayed healing',612.06,'2020-06-04'),(13,'Foodborne Bacillus cereus intoxication',4382.02,'2021-12-05'),(14,'Toxic effect of coral snake venom, accidental (unintentional), sequela',5101.94,'2021-01-08'),(15,'Other fracture of right patella, subsequent encounter for closed fracture with routine healing',1787.60,'2022-03-20'),(16,'Postprocedural urethral stricture',4551.02,'2022-03-04'),(17,'Salter-Harris Type IV physeal fracture of phalanx of right toe, initial encounter for closed fracture',2184.16,'2021-09-17'),(18,'Paralytic calcification and ossification of muscle, left shoulder',8631.28,'2021-09-19'),(19,'Other specified inflammatory spondylopathies, cervicothoracic region',2386.90,'2021-07-07'),(20,'Other specified fracture of left acetabulum, initial encounter for closed fracture',807.08,'2021-05-25'),(21,'Age-related osteoporosis with current pathological fracture, right shoulder',7142.61,'2020-07-26'),(22,'Displaced longitudinal fracture of unspecified patella, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with nonunion',7049.73,'2020-01-03'),(23,'Anaplastic large cell lymphoma, ALK-negative, intrapelvic lymph nodes',2430.90,'2020-09-17'),(24,'Nondisplaced supracondylar fracture with intracondylar extension of lower end of unspecified femur, subsequent encounter for open fracture type IIIA, IIIB, or IIIC with malunion',4979.29,'2020-06-15'),(25,'Cercarial dermatitis',4436.04,'2020-02-01'),(26,'Fracture of angle of right mandible, subsequent encounter for fracture with nonunion',2291.38,'2020-10-08'),(27,'Pedestrian on other rolling-type pedestrian conveyance colliding with stationary object, initial encounter',8381.69,'2020-12-16'),(28,'Subluxation of right ankle joint, initial encounter',9583.80,'2022-01-24'),(29,'Displaced fracture of proximal phalanx of unspecified lesser toe(s), initial encounter for closed fracture',2201.93,'2022-01-01'),(30,'Driver of pick-up truck or van injured in collision with other nonmotor vehicle in nontraffic accident, subsequent encounter',5316.06,'2020-03-02'),(31,'Puncture wound without foreign body of left ring finger without damage to nail, sequela',6321.46,'2021-10-08'),(32,'Assault by other specified means',3619.18,'2021-04-04'),(33,'Contusion of left hip, initial encounter',2553.08,'2020-05-19'),(34,'Bitten by crocodile, sequela',6485.92,'2021-04-03'),(35,'Nondisplaced fracture of neck of left talus',1242.05,'2021-09-09'),(36,'Complete rotator cuff tear or rupture of unspecified shoulder, not specified as traumatic',921.91,'2020-09-12'),(37,'Occupant of animal-drawn vehicle injured in collision with pedal cycle, subsequent encounter',1020.09,'2020-01-11'),(38,'Anterior displaced fracture of sternal end of left clavicle, subsequent encounter for fracture with nonunion',7935.93,'2022-02-13'),(39,'Encounter for prophylactic fluoride administration',7232.13,'2020-05-07'),(40,'Alcoholic gastritis',2445.66,'2021-01-31'),(41,'Other complications of foreign body accidentally left in body following infusion or transfusion, subsequent encounter',8872.97,'2021-03-15'),(42,'Subluxation of metatarsophalangeal joint of unspecified lesser toe(s), sequela',4016.08,'2021-11-19'),(43,'Senile entropion of left lower eyelid',4715.99,'2022-02-25'),(44,'Displaced fracture of second metatarsal bone, right foot',9016.50,'2020-09-08'),(45,'Unspecified injury of lung, unspecified, subsequent encounter',6963.71,'2021-10-30'),(46,'Poisoning by antifungal antibiotics, systemically used, undetermined, subsequent encounter',6442.83,'2021-10-04'),(47,'Superficial injury of thorax',8476.77,'2020-05-16'),(48,'Malignant neoplasm of endocrine pancreas',3158.96,'2021-02-22'),(49,'Unspecified injury of flexor muscle, fascia and tendon of left index finger at forearm level',3299.19,'2021-04-15'),(50,'Diabetes mellitus due to underlying condition with diabetic polyneuropathy',8223.68,'2020-08-03');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `OWNER_ID` int NOT NULL,
  `OWNER_FNAME` varchar(50) DEFAULT NULL,
  `OWNER_LNAME` varchar(50) DEFAULT NULL,
  `OWNER_EMAIL` varchar(50) DEFAULT NULL,
  `OWNER_STREET` varchar(50) DEFAULT NULL,
  `ZIPCODE_ID` int DEFAULT NULL,
  PRIMARY KEY (`OWNER_ID`),
  KEY `ZIPCODE_ID_idx` (`ZIPCODE_ID`),
  CONSTRAINT `ZIPCODEID` FOREIGN KEY (`ZIPCODE_ID`) REFERENCES `zipcode` (`ZIPCODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'Kaylil','Gehrts','kgehrts0@shinystat.com','142 Rockefeller Hill',91199),(2,'Rand','Ogelbe','rogelbe1@bloglines.com','8241 Clemons Avenue',98424),(3,'Garvey','Maundrell','gmaundrell2@economist.com','3355 Cherokee Plaza',92145),(4,'Jennifer','Sweeny','jsweeny3@booking.com','817 Hansons Street',98175),(5,'Melessa','Galliard','mgalliard4@techcrunch.com','111 Riverside Parkway',92145),(6,'Silvio','Gerardi','sgerardi5@guardian.co.uk','47 Fuller Avenue',93709),(7,'Calvin','Prayer','cprayer6@weebly.com','80 Erie Lane',92822),(8,'Anselm','McMakin','amcmakin7@amazonaws.com','3949 Hallows Trail',95128),(9,'Rozele','Hyman','rhyman8@icq.com','0778 School Plaza',98424),(10,'Cly','Tallyn','ctallyn9@goo.gl','5 Hollow Ridge Circle',95128),(11,'Hervey','Smorfit','hsmorfita@mozilla.com','01 Hayes Drive',98424),(12,'Shermie','Cummine','scummineb@illinois.edu','72 New Castle Point',93709),(13,'Ilsa','Waterfall','iwaterfallc@wisc.edu','07 Nobel Parkway',98424),(14,'Sully','Marchment','smarchmentd@blogspot.com','614 Brown Terrace',99252),(15,'Adriana','Robers','aroberse@mapquest.com','40423 Mcguire Court',94616),(16,'Krystalle','Bartoszek','kbartoszekf@yolasite.com','0391 Loeprich Trail',98424),(17,'Jennee','Cabrara','jcabrarag@icio.us','18 Scott Plaza',93709),(18,'Angus','Trott','atrotth@prweb.com','8398 Walton Circle',92145),(19,'Valina','Brunner','vbrunneri@sourceforge.net','4151 Rusk Street',99252),(20,'Kim','Delgaty','kdelgatyj@hostgator.com','6841 Florence Alley',95128),(21,'Waverley','Hrihorovich','whrihorovichk@umn.edu','88166 Mitchell Park',98424),(22,'Jordan','Tegeller','jtegellerl@opensource.org','7 Hayes Trail',91199),(23,'Kaleena','Peach','kpeachm@netscape.com','2196 Graceland Trail',92145),(24,'Moise','Jestico','mjesticon@skyrock.com','92 Lillian Point',92710),(25,'Gabi','Zavattieri','gzavattierio@quantcast.com','2586 Walton Alley',98424),(26,'Suellen','Balffye','sbalffyep@sourceforge.net','0800 Mallard Pass',94616),(27,'Mikol','Levi','mleviq@ehow.com','4311 Stuart Court',91199),(28,'Melessa','Rousel','mrouselr@disqus.com','21 Montana Court',98424),(29,'Hastings','Troucher','htrouchers@gmpg.org','5757 Novick Park',92822),(30,'Ellene','Achromov','eachromovt@photobucket.com','4053 Caliangt Center',99252),(31,'Liam','Whitmore','lwhitmoreu@marketwatch.com','273 Jackson Court',98424),(32,'Hagan','Lowde','hlowdev@microsoft.com','68 Eliot Parkway',92710),(33,'Rosita','Hutley','rhutleyw@imgur.com','50188 Scoville Street',94616),(34,'Donn','McLoney','dmcloneyx@salon.com','03 Stuart Plaza',95128),(35,'Antony','Chaucer','achaucery@usgs.gov','7141 Florence Pass',99252),(36,'Rachel','Kenningham','rkenninghamz@ezinearticles.com','14243 Novick Avenue',93709),(37,'Cathi','McGaw','cmcgaw10@sbwire.com','5945 Boyd Pass',98175),(38,'Violet','Wace','vwace11@java.com','21131 Oriole Way',99252),(39,'Lorry','Armatidge','larmatidge12@pbs.org','03 Clemons Crossing',93709),(40,'Howard','Janaszewski','hjanaszewski13@blinklist.com','3 Randy Alley',91199),(41,'Eolande','Khan','ekhan14@yale.edu','6 Carey Drive',94616),(42,'Sheffield','Tortoise','stortoise15@squarespace.com','17 Carpenter Circle',99252),(43,'Val','Barbier','vbarbier16@example.com','3269 Main Center',98175),(44,'Prissie','Cordeau]','pcordeau17@usatoday.com','21 Miller Hill',92710),(45,'Katina','Iorizzi','kiorizzi18@squarespace.com','709 Trailsway Trail',98424),(46,'Sindee','Bayliss','sbayliss19@yolasite.com','37 Ridge Oak Avenue',92822),(47,'Bibbie','Rosewall','brosewall1a@t-online.de','48 Northview Drive',92145),(48,'Roderick','Casol','rcasol1b@zimbio.com','4 Manufacturers Pass',95128),(49,'Chris','Lindbergh','clindbergh1c@blog.com','8261 Delladonna Parkway',93709),(50,'Jefferson','Keattch','jkeattch1d@newyorker.com','468 Heffernan Street',98175);
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet` (
  `PET_ID` int NOT NULL,
  `PET_NAME` varchar(45) DEFAULT NULL,
  `PET_CATEGORY` varchar(50) DEFAULT NULL,
  `PET_BREED` varchar(50) DEFAULT NULL,
  `PET_DOB` date DEFAULT NULL,
  `PET_WEIGHT` decimal(10,2) DEFAULT NULL,
  `PET_COLOR` varchar(50) DEFAULT NULL,
  `OWNER_ID` int NOT NULL,
  PRIMARY KEY (`PET_ID`),
  KEY `OWNER_ID_idx` (`OWNER_ID`),
  CONSTRAINT `OWNERID` FOREIGN KEY (`OWNER_ID`) REFERENCES `owner` (`OWNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet`
--

LOCK TABLES `pet` WRITE;
/*!40000 ALTER TABLE `pet` DISABLE KEYS */;
INSERT INTO `pet` VALUES (1,'Frants','dog','Actophilornis africanus','2020-05-24',18.13,'brown',1),(2,'Correince','cat','Oryx gazella','2021-09-22',48.91,'white',2),(3,'Tiphani','dog','Elephas maximus bengalensis','2020-02-23',36.42,'white',3),(4,'Pavla','cat','Nyctea scandiaca','2017-01-02',22.66,'brown',4),(5,'Lidia','cat','Sauromalus obesus','2020-04-16',24.94,'white',5),(6,'Shyane','guinea pig','Macropus agilis','2016-08-14',38.03,'beige',6),(7,'Bari','cat','unavailable','2017-12-07',26.75,'mixed',7),(8,'Delphinia','cat','Acanthaster planci','2018-06-16',35.44,'beige',8),(9,'Loraine','cat','Ovis orientalis','2020-03-16',33.52,'white',9),(10,'Barney','dog','Aquila chrysaetos','2018-06-13',11.68,'white',10),(11,'Mabel','cat','Diomedea irrorata','2020-08-10',45.53,'beige',11),(12,'Rena','hamster','Chelodina longicollis','2018-11-12',39.92,'black',12),(13,'Ameline','dog','Haliaetus leucogaster','2019-08-06',45.12,'mixed',13),(14,'Arnoldo','cat','Ephipplorhynchus senegalensis','2017-09-26',31.88,'golden',14),(15,'Camille','dog','Eolophus roseicapillus','2021-08-14',21.85,'golden',15),(16,'Sapphire','cat','Paraxerus cepapi','2019-06-17',49.82,'beige',16),(17,'Donalt','dog','Rhea americana','2018-07-09',37.31,'golden',17),(18,'Theressa','dog','Hymenolaimus malacorhynchus','2019-07-24',38.23,'beige',18),(19,'Amalle','dog','Felis libyca','2020-08-23',35.65,'white',19),(20,'Lurlene','dog','Canis aureus','2019-03-04',25.86,'black',20),(21,'Bobby','cat','unavailable','2019-04-05',21.29,'black',21),(22,'Stevy','guinea pig','Coluber constrictor','2019-12-12',36.15,'brown',22),(23,'Faustine','rabbit','Dicrostonyx groenlandicus','2018-03-08',43.51,'black',23),(24,'Cy','dog','Lycosa godeffroyi','2017-08-12',33.77,'golden',24),(25,'Robby','hamster','Certotrichas paena','2017-05-11',15.73,'mixed',25),(26,'Kiersten','cat','Grus canadensis','2016-05-03',20.62,'black',26),(27,'Aland','hamster','Didelphis virginiana','2020-04-11',38.34,'golden',27),(28,'Arther','cat','Caiman crocodilus','2018-06-07',34.45,'mixed',28),(29,'Edwin','cat','Felis concolor','2020-05-30',19.06,'golden',29),(30,'Hilde','hamster','Mirounga angustirostris','2021-06-22',12.02,'golden',30),(31,'Matilda','rabbit','Tachybaptus ruficollis','2017-07-31',37.50,'white',31),(32,'Dori','dog','Lybius torquatus','2019-12-27',48.19,'brown',32),(33,'Henrieta','rabbit','Gorilla gorilla','2016-06-03',40.10,'golden',33),(34,'Dalton','rabbit','Callipepla gambelii','2019-08-14',19.91,'white',34),(35,'Jared','dog','Vulpes chama','2020-10-16',24.47,'mixed',35),(36,'Ivan','rabbit','Mustela nigripes','2016-12-03',39.08,'beige',36),(37,'Georgena','guinea pig','Crocodylus niloticus','2016-03-26',10.31,'brown',37),(38,'Putnam','hamster','Sus scrofa','2019-06-18',21.30,'golden',38),(39,'Phoebe','dog','Lorythaixoides concolor','2019-02-20',29.19,'white',39),(40,'Englebert','guinea pig','Paraxerus cepapi','2021-09-17',21.19,'black',40),(41,'Kristel','cat','Varanus sp.','2016-08-17',47.70,'black',41),(42,'Lockwood','dog','Butorides striatus','2016-10-30',33.75,'black',42),(43,'Mel','rabbit','Sagittarius serpentarius','2020-08-26',30.68,'brown',43),(44,'Corabella','dog','Laniaurius atrococcineus','2021-08-02',49.97,'black',44),(45,'Beilul','cat','Naja sp.','2019-04-10',18.52,'mixed',45),(46,'Nikki','cat','Chlamydosaurus kingii','2017-08-23',13.15,'mixed',46),(47,'Dimitri','dog','Meles meles','2016-04-21',38.44,'black',47),(48,'Trstram','cat','Sula dactylatra','2020-11-21',38.16,'black',48),(49,'Trueman','cat','Buteo jamaicensis','2021-05-18',47.33,'golden',49),(50,'Cass','guinea pig','Martes pennanti','2021-02-04',45.03,'black',50),(51,'Maurie','dog','Sula nebouxii','2019-02-01',35.79,'golden',1),(52,'Reagan','dog','Castor canadensis','2017-02-17',30.27,'brown',2),(53,'Silvana','dog','Pavo cristatus','2019-05-14',23.42,'black',3),(54,'Floris','dog','Oxybelis fulgidus','2020-11-06',36.51,'black',4),(55,'Lily','dog','Trachyphonus vaillantii','2019-11-24',32.22,'beige',5),(56,'Kincaid','cat','Castor fiber','2017-01-06',33.46,'black',6),(57,'Chantal','cat','Gazella thompsonii','2018-11-08',35.54,'brown',7),(58,'Foster','dog','Cynomys ludovicianus','2021-05-19',37.61,'black',8),(59,'Evard','cat','Varanus albigularis','2019-04-22',49.02,'mixed',9),(60,'Nadean','cat','Canis aureus','2016-12-19',13.40,'mixed',10),(61,'Papageno','hamster','Upupa epops','2017-03-03',44.24,'brown',11),(62,'Danyelle','cat','Antechinus flavipes','2021-04-18',23.83,'golden',12),(63,'Hesther','rabbit','Crotalus triseriatus','2017-08-24',35.64,'brown',13),(64,'Joleen','guinea pig','Vanessa indica','2018-06-18',48.03,'mixed',14),(65,'Dalenna','cat','Pseudalopex gymnocercus','2016-06-30',32.12,'golden',15),(66,'Myrah','guinea pig','Bubalornis niger','2017-05-20',17.76,'mixed',16),(67,'Janek','cat','Leptoptilos crumeniferus','2019-04-06',10.52,'golden',17),(68,'Daveta','cat','Neotis denhami','2019-04-18',36.54,'golden',18),(69,'Virginia','cat','Grus canadensis','2018-04-17',22.32,'black',19),(70,'Prue','dog','Sarcorhamphus papa','2021-06-30',23.65,'brown',20);
/*!40000 ALTER TABLE `pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `PRESCRIPTION_ID` int NOT NULL,
  `PRESCRIPTION_NAME` text,
  `PRESCRIPTION_DOSAGE` int DEFAULT NULL,
  `PRESCRIPTION_DESCRIPTION` text,
  `APPT_ID` int DEFAULT NULL,
  `INVOICE_ID` int DEFAULT NULL,
  PRIMARY KEY (`PRESCRIPTION_ID`),
  KEY `invoicepres_idx` (`INVOICE_ID`),
  KEY `prescriptionappt_idx` (`APPT_ID`),
  CONSTRAINT `invoicepres` FOREIGN KEY (`INVOICE_ID`) REFERENCES `invoice` (`INVOICE_ID`),
  CONSTRAINT `prescriptionappt` FOREIGN KEY (`APPT_ID`) REFERENCES `appointment` (`APPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'acetaminophen,dextromethorphan HBr, doxylamine succinate',10,'Take it a once a  day',1,1),(2,'INATAL Ultra',500,'Take it twice a day',2,2),(3,'doxazosin mesylate',100,'Take it three times a day',3,3),(4,'TITANIUM DIOXIDE',100,'Take it once in the morning',4,4),(5,'Arsenicum album, Avena sativa, Bryonia, Carbo animalis, Carduus marianus, Chelidonium majus, Hepar suis, Kali iodatum, Lapis albus, Nux vomica, Radium bromatum, Taraxacum officinale, Thuja occidentalis,',10,'Take it once in the morning',5,5),(6,'Divalproex Sodium',75,'Take it every four hours',6,6),(7,'Benzalkonium Chloride',75,'Take it twice a day',7,7),(8,'Niacin',10,'Apply to wound',8,8),(9,'methimazole',100,'Take it at night after meal',9,9),(10,'Titanium Dioxide and Zinc Oxide',500,'Take it at night after meal',10,10),(11,'Phenytoin',10,'Take it a once a  day',11,11),(12,'Triclosan',10,'Take it at night after meal',12,12),(13,'Nicardipine Hydrochloride',500,'Take it three times a day',13,13),(14,'benzonatate',100,'Take it three times a day',14,14),(15,'Panthenol',500,'Take it three times a day',15,15),(16,'Calc Fluor 30c,, Conium Mac 30c,, Carboneum Sulph 30c, Digitalis 30c, Graphites 30c, Lycopodium 30c, Pulsatilla 30c, Sepia 30c, Silicea 30c, Staphysagria 30c, Sulphur 30c',500,'Take it a once a  day',16,16),(17,'Whole Grain Oat',10,'Take it every four hours',17,17),(18,'SODIUM MONOFLUOROPHOSPHATE',10,'Take it twice a day',18,18),(19,'Orphenadrine Citrate',75,'Take it once in the morning',19,19),(20,'Octinoxate and Octisalate',500,'Take it at night after meal',20,20),(21,'Benzocaine',75,'Take it a once a  day',21,21),(22,'Niacin',100,'Take it once in the morning',22,22),(23,'TAMSULOSIN HYDROCHLORIDE',10,'Apply to wound',23,23),(24,'Azithromycin',75,'Take it at night after meal',24,24),(25,'HYDROCORTISONE',100,'Take it once in the morning',25,25),(26,'Red Mulberry',10,'Apply to wound',26,26),(27,'Isopropyl Alcohol',500,'Take it three times a day',27,27),(28,'Loperamide Hydrochloride',100,'Take it three times a day',28,28),(29,'OCTINOXATE, TITANIUM DIOXIDE, ZINC OXIDE',10,'Take it twice a day',29,29),(30,'Ranitidine',500,'Take it a once a  day',30,30),(31,'PSYLLIUM HUSK',10,'Take it twice a day',31,31),(32,'ZOLPIDEM TARTRATE, CHOLINE',500,'Take it twice a day',32,32),(33,'Oxygen',10,'Take it every four hours',33,33),(34,'cefixime',500,'Take it at night after meal',34,34),(35,'BENZALKONIUM CHLORIDE and LIDOCAINE HYDROCHLORIDE',75,'Take it once in the morning',35,35),(36,'Avobenzone, Homosalate, Octisalate, Octocrylene',10,'Take it twice a day',36,36),(37,'Atenolol',500,'Take it once in the morning',37,37),(38,'IRBESARTAN AND HYDROCHLOROTHIAZIDE',500,'Take it three times a day',38,38),(39,'ETHYL ALCOHOL',500,'Take it at night after meal',39,39),(40,'glucagon',10,'Take it twice a day',40,40),(41,'Paclitaxel',500,'Take it twice a day',41,41),(42,'Brompheniramine maleate, Dextromethorphan HBr, Phenylephrine HCl',100,'Take it every four hours',42,42),(43,'Glycerin',10,'Take it every four hours',43,43),(44,'Meloxicam',100,'Apply to wound',44,44),(45,'spironolactone',10,'Take it every four hours',45,45),(46,'Oxycodone Hydrochloride',500,'Take it once in the morning',46,46),(47,'eszopiclone',10,'Take it three times a day',47,47),(48,'VENLAFAXINE HYDROCHLORIDE',75,'Take it a once a  day',48,48),(49,'Nicotine Polacrilex',500,'Take it a once a  day',49,49),(50,'Fluocinolone Acetonide',10,'Take it every four hours',50,50),(51,'DONEPEZIL HYDROCHLORIDE',10,'Take it three times a day',1,1),(52,'Box Elder Ash Leaf Maple',100,'Take it twice a day',2,2),(53,'Aluminum Chlorohydrate',100,'Take it three times a day',3,3),(54,'Diphenhydramine citrate, Ibuprofen',500,'Take it twice a day',4,4),(55,'Amoxicillin',500,'Take it every four hours',5,5),(56,'pioglitazone',10,'Take it twice a day',6,6),(57,'Avobenzone, Octisalate and Octocrylene',75,'Take it three times a day',7,7),(58,'Levetiracetam',500,'Take it twice a day',8,8),(59,'Glyburide and Metformin Hydrochloride',500,'Take it every four hours',9,9),(60,'Acetaminophen',75,'Take it twice a day',10,10),(61,'Dimethicone',75,'Take it three times a day',11,11),(62,'Sodium Monofluorophosphate Silicon Dioxide',100,'Take it every four hours',12,12),(63,'octinoxate, octisalate, oxybenzone, titanium dioxide',75,'Take it at night after meal',13,13),(64,'clomipramine hydrochloride',500,'Take it twice a day',14,14),(65,'Diethylpropion hydrochloride',100,'Take it every four hours',15,15),(66,'Sodium Fluoride',100,'Take it once in the morning',16,16),(67,'Oxycodone and Acetaminophen',100,'Take it every four hours',17,17),(68,'amoxicillin and clavulanate potassium',500,'Take it a once a  day',18,18),(69,'Octinoxate and Oxybenzone',500,'Apply to wound',19,19),(70,'Dextromethorphan Hydrobromide, Guaifenesin, Phenylephrine Hydrochloride',10,'Take it at night after meal',20,20),(71,'benzoyl peroxide',500,'Take it every four hours',21,21),(72,'Famotidine',500,'Take it once in the morning',22,22),(73,'Raloxifene Hydrochloride',75,'Take it at night after meal',23,23),(74,'Octinoxate',10,'Take it three times a day',24,24),(75,'Morphine Sulfate',75,'Take it once in the morning',25,25),(76,'SPIRONOLACTONE',500,'Take it twice a day',26,26),(77,'Quetiapine fumarate',10,'Take it at night after meal',27,27),(78,'Temazepam',10,'Take it at night after meal',28,28),(79,'DEXTROSE and SODIUM CHLORIDE',75,'Take it at night after meal',29,29),(80,'Acetaminophen and Diphenhydramine HCl',100,'Take it once in the morning',30,30),(81,'AESCULUS GLABRA',500,'Take it once in the morning',31,31),(82,'Dobutamine Hydrochloride',75,'Take it twice a day',32,32),(83,'Metformin Hydrochloride',500,'Take it every four hours',33,33),(84,'Ammonium carbonicum, Apis mellifica, Argentum metallicum, Arsenicum album, Dulcamara, Mezereum, Ehus toxicodendron, Urtica urens,',500,'Take it three times a day',34,34),(85,'OCTINOXATE AND AVOBENZONE',75,'Take it every four hours',35,35),(86,'venlafaxine hydrochloride',100,'Take it twice a day',36,36),(87,'Oxygen',75,'Take it at night after meal',37,37),(88,'Scrub Pine',75,'Take it at night after meal',38,38),(89,'Bismuth subsalicylate',75,'Take it twice a day',39,39),(90,'Desmopressin Acetate',10,'Take it every four hours',40,40),(91,'Lidocaine Hydrochloride',100,'Take it twice a day',41,41),(92,'Aluminum Zirconium Trichlorohydrex Gly',75,'Take it at night after meal',42,42),(93,'tapentadol hydrochloride',75,'Take it a once a  day',43,43),(94,'Magnesium citrate',100,'Take it at night after meal',44,44),(95,'Benzocaine',500,'Take it once in the morning',45,45),(96,'titanium dioxide',10,'Apply to wound',46,46),(97,'Cyclobenzaprine Hydrochloride',10,'Take it once in the morning',47,47),(98,'Maximum Strength Medicated Foot Powder',10,'Take it at night after meal',48,48),(99,'FOLLITROPIN',75,'Take it twice a day',49,49),(100,'Fondaparinux Sodium',75,'Apply to wound',50,50);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `SERVICE_ID` int NOT NULL,
  `SERVICE_DESCRIPTION` text,
  `INVOICE_ID` int DEFAULT NULL,
  `APPT_ID` int DEFAULT NULL,
  PRIMARY KEY (`SERVICE_ID`),
  KEY `INVOICESERVICE_idx` (`INVOICE_ID`),
  KEY `apptservice_idx` (`APPT_ID`),
  CONSTRAINT `apptservice` FOREIGN KEY (`APPT_ID`) REFERENCES `appointment` (`APPT_ID`),
  CONSTRAINT `INVOICESERVICE` FOREIGN KEY (`INVOICE_ID`) REFERENCES `invoice` (`INVOICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'dental extraction',1,1),(2,'vaccine',2,2),(3,'lab work',3,3),(4,'procedure follow-up',4,4),(5,'wound cleaning',5,5),(6,'dental cleaning',6,6),(7,'hip surgery',7,7),(8,'neutering',8,8),(9,'wound cleaning',9,9),(10,'vaccine',10,10),(11,'lab work',11,11),(12,'vaccine',12,12),(13,'wound cleaning',13,13),(14,'hip surgery',14,14),(15,'hip surgery',15,15),(16,'hip surgery',16,16),(17,'dental cleaning',17,17),(18,'procedure follow-up',18,18),(19,'wound cleaning',19,19),(20,'wound cleaning',20,20),(21,'hip surgery',21,21),(22,'dental cleaning',22,22),(23,'allergy testing',23,23),(24,'wound cleaning',24,24),(25,'lab work',25,25),(26,'allergy testing',26,26),(27,'allergy testing',27,27),(28,'hip surgery',28,28),(29,'lab work',29,29),(30,'allergy testing',30,30),(31,'allergy testing',31,31),(32,'lab work',32,32),(33,'procedure follow-up',33,33),(34,'spaying',34,34),(35,'vaccine',35,35),(36,'lab work',36,36),(37,'dental cleaning',37,37),(38,'lab work',38,38),(39,'allergy testing',39,39),(40,'procedure follow-up',40,40),(41,'neutering',41,41),(42,'spaying',42,42),(43,'vaccine',43,43),(44,'dental extraction',44,44),(45,'spaying',45,45),(46,'lab work',46,46),(47,'general checkup',47,47),(48,'procedure follow-up',48,48),(49,'hip surgery',49,49),(50,'procedure follow-up',50,50),(51,'lab work',1,1),(52,'neutering',2,2),(53,'dental cleaning',3,3),(54,'dental cleaning',4,4),(55,'dental cleaning',5,5),(56,'spaying',6,6),(57,'dental extraction',7,7),(58,'allergy testing',8,8),(59,'dental extraction',9,9),(60,'hip surgery',10,10),(61,'allergy testing',11,11),(62,'allergy testing',12,12),(63,'spaying',13,13),(64,'spaying',14,14),(65,'dental extraction',15,15),(66,'procedure follow-up',16,16),(67,'dental extraction',17,17),(68,'general checkup',18,18),(69,'wound cleaning',19,19),(70,'neutering',20,20),(71,'lab work',21,21),(72,'spaying',22,22),(73,'allergy testing',23,23),(74,'hip surgery',24,24),(75,'general checkup',25,25),(76,'dental extraction',26,26),(77,'dental extraction',27,27),(78,'allergy testing',28,28),(79,'spaying',29,29),(80,'dental extraction',30,30),(81,'wound cleaning',31,31),(82,'vaccine',32,32),(83,'wound cleaning',33,33),(84,'vaccine',34,34),(85,'hip surgery',35,35),(86,'neutering',36,36),(87,'hip surgery',37,37),(88,'procedure follow-up',38,38),(89,'vaccine',39,39),(90,'vaccine',40,40),(91,'vaccine',41,41),(92,'neutering',42,42),(93,'hip surgery',43,43),(94,'hip surgery',44,44),(95,'dental extraction',45,45),(96,'lab work',46,46),(97,'allergy testing',47,47),(98,'general checkup',48,48),(99,'procedure follow-up',49,49),(100,'allergy testing',50,50);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarian`
--

DROP TABLE IF EXISTS `veterinarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarian` (
  `VET_ID` int NOT NULL,
  `VET_FNAME` varchar(50) DEFAULT NULL,
  `VET_LNAME` varchar(50) DEFAULT NULL,
  `VET_EDUCATION` varchar(50) DEFAULT NULL,
  `VET_SPECIALTY` varchar(50) DEFAULT NULL,
  `CLINIC_ID` int DEFAULT NULL,
  PRIMARY KEY (`VET_ID`),
  KEY `CLINIC_ID_idx` (`CLINIC_ID`),
  CONSTRAINT `CLINICVET` FOREIGN KEY (`CLINIC_ID`) REFERENCES `clinic` (`CLINIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarian`
--

LOCK TABLES `veterinarian` WRITE;
/*!40000 ALTER TABLE `veterinarian` DISABLE KEYS */;
INSERT INTO `veterinarian` VALUES (1,'Imojean','Sarle','Purdue University','General Practice',1),(2,'Riobard','Hibling','Washington State University','Pharmacology',2),(3,'Mickie','Meriton','University of Washington','Toxicology',3),(4,'Danie','Jouannot','Santa Clara University','General Practice',4),(5,'Elisha','Wessing','University of Washington','Microbiology',5),(6,'Elliot','Colchett','University of Washington','General Practice',6),(7,'Aurelia','Cumesky','Stanford University','General Practice',7),(8,'Trudey','Gotthard.sf','UC Berkeley','Orthopedic',8),(9,'Nicolle','Emmison','University of Washington','General Practice',9),(10,'Carmelia','Latan','Florida University','General Practice',10),(11,'Rip','Treend','Kansas University','Pharmacology',1),(12,'Becky','Sprowell','University of Washington','General Practice',2),(13,'Parrnell','Sizzey','Baylor University','Orthopedic',3),(14,'Manfred','Jankovic','University of Washington','Dermatology',4),(15,'Danika','Baldacchi','Florida State University','General Practice',5),(16,'Vivie','Pawelke','Boston University','General Practice',6),(17,'Timi','Airdrie','Wisconsin University','General Practice',7),(18,'Natale','Billany','Ohio State University','General Practice',8),(19,'Bunny','De Beauchamp','University of Washington','Radiology',9),(20,'Kary','Bellson','Florida University','General Practice',10);
/*!40000 ALTER TABLE `veterinarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zipcode`
--

DROP TABLE IF EXISTS `zipcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zipcode` (
  `ZIPCODE_ID` int NOT NULL,
  `ZIPCODE_CITY` varchar(50) DEFAULT NULL,
  `ZIPCODE_STATE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ZIPCODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zipcode`
--

LOCK TABLES `zipcode` WRITE;
/*!40000 ALTER TABLE `zipcode` DISABLE KEYS */;
INSERT INTO `zipcode` VALUES (91199,'Pasadena','CA'),(92145,'San Diego','CA'),(92710,'Irvine','CA'),(92822,'Brea','CA'),(93709,'Fresno','CA'),(94616,'Oakland','CA'),(95128,'San Jose','CA'),(98175,'Seattle','WA'),(98424,'Tacoma','WA'),(99252,'Spokane','WA');
/*!40000 ALTER TABLE `zipcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mm_cpsc502101team04'
--

--
-- Dumping routines for database 'mm_cpsc502101team04'
--
/*!50003 DROP PROCEDURE IF EXISTS `clinicInvoiceAgingDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clinicInvoiceAgingDetail`(
	IN the_clinic VARCHAR(50)
)
    READS SQL DATA
BEGIN
	SELECT DISTINCT
	CASE
		WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 31 THEN '0-30 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 30 AND DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 61 THEN '31-60 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 60 AND DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 91 THEN '61-90 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 90 THEN '91+ days'
        ELSE 'No aging'
	END AS AgingBucket,
    I.INVOICE_DATE AS InvoiceDate,
    I.INVOICE_ID AS InvoiceID,
    CONCAT(O.OWNER_LNAME, ', ', O.OWNER_FNAME) AS 'OwnerFullName',
    O.OWNER_EMAIL AS OwnerEmail,
    I.INVOICE_COST AS InvoiceAmount
	FROM 
		clinic C
	LEFT JOIN 
		veterinarian V ON C.CLINIC_ID = V.CLINIC_ID
	LEFT JOIN 
		appointment A ON V.VET_ID = A.VET_ID
	LEFT JOIN
		prescription RX ON A.APPT_ID = RX.APPT_ID
	LEFT JOIN
		invoice I ON RX.INVOICE_ID = I.INVOICE_ID
	LEFT JOIN 
		pet P ON A.PET_ID = P.PET_ID
	LEFT JOIN
		`owner` O ON P.OWNER_ID = O.OWNER_ID
	WHERE
		C.CLINIC_NAME = the_clinic
        -- C.CLINIC_NAME LIKE '%the_clinic%'
ORDER BY 
	AgingBucket ASC, InvoiceDate ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clinicInvoiceAgingSummary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clinicInvoiceAgingSummary`(
	IN the_clinic VARCHAR(50)
)
    READS SQL DATA
BEGIN
	SELECT DISTINCT
	CASE
		WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 31 THEN '0-30 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 30 AND DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 61 THEN '31-60 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 60 AND DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) < 91 THEN '61-90 days'
        WHEN DATEDIFF(CURRENT_DATE(), I.INVOICE_DATE) > 90 THEN '91+ days'
        ELSE 'No aging'
	END AS AgingBucket,
    SUM(I.INVOICE_COST) AS InvoiceAmount
	FROM 
		clinic C
	LEFT JOIN 
		veterinarian V ON C.CLINIC_ID = V.CLINIC_ID
	LEFT JOIN 
		appointment A ON V.VET_ID = A.VET_ID
	LEFT JOIN
		prescription RX ON A.APPT_ID = RX.APPT_ID
	LEFT JOIN
		invoice I ON RX.INVOICE_ID = I.INVOICE_ID
	WHERE
		C.CLINIC_NAME = the_clinic
	GROUP BY
		AgingBucket
	ORDER BY 
		AgingBucket ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-17 22:15:34
