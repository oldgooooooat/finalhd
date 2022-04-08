-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: final
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
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `exam_id` varchar(32) NOT NULL,
  `exam_name` varchar(128) NOT NULL,
  `exam_description` varchar(256) DEFAULT NULL,
  `question_creator_id` varchar(32) NOT NULL,
  `exam_score` int DEFAULT '0',
  `exam_time_limit` int NOT NULL DEFAULT '0',
  `exam_switch` int NOT NULL DEFAULT '1',
  `exam_type` int NOT NULL DEFAULT '0',
  `exam_start_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `exam_end_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES ('2979d0d494eb49e1b06734c263e19ec8','随机考试','随机考试','bc58cbc441d84ce7ab835e54f9d5303b',20,120,2,1,'2022-04-08 05:24:21','2025-01-01 05:24:21','2022-04-08 05:24:21','2022-04-08 05:24:21'),('485682a457e44170b039769505c58389','语文期末考试','语文期末考试','288dbb53b93a4e7d892df8d88e5bdca8',25,60,1,0,'2022-04-08 16:00:00','2022-05-30 16:00:00','2022-04-08 01:46:20','2022-04-08 01:46:20'),('9a3a1408c0f3428f8a5ead3344b79a2d','语文测试','语文测试','288dbb53b93a4e7d892df8d88e5bdca8',20,15,2,0,'2022-04-07 16:00:00','2022-05-17 16:00:00','2022-04-08 06:06:51','2022-04-08 06:06:52'),('cd52356d70fc4f998f4b5d5ab86c6b7a','语文期中考试','语文期中考试','288dbb53b93a4e7d892df8d88e5bdca8',20,60,3,0,'2022-03-31 16:00:00','2022-05-30 16:00:00','2022-04-08 01:46:55','2022-04-08 01:47:27'),('d7373acae6f24d94a148a9c75d249a42','语文期初考试','语文期初考试','288dbb53b93a4e7d892df8d88e5bdca8',25,60,2,0,'2022-03-31 16:00:00','2022-05-30 16:00:00','2022-04-08 01:47:22','2022-04-08 01:47:23'),('dfc7e6e052ba48df9e392a534117792f','语文单元测试','语文单元测试','288dbb53b93a4e7d892df8d88e5bdca8',20,120,2,0,'2022-04-06 16:00:00','2022-05-30 16:00:00','2022-04-08 02:39:38','2022-04-08 02:39:39');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question` (
  `id` varchar(32) NOT NULL,
  `exam_id` varchar(32) DEFAULT NULL,
  `question_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES ('01a6406a8eeb47a1ae3a621f339ad457','cd52356d70fc4f998f4b5d5ab86c6b7a','4fd938bf1b1240cf9109c9083441c5e8'),('02ce59445ab04cb4b374c69d17bcc33b','485682a457e44170b039769505c58389','88367e8fbee14c0793cd2af46eb05a27'),('0524f131dce54a548e536b08b9d48b7e','485682a457e44170b039769505c58389','5dce9aa6bfb44c4fa4b0908c8034abe8'),('0ba1ec8a2eef49edbbcab186f4b3adc6','2979d0d494eb49e1b06734c263e19ec8','337f9e7b0c3f4d76b3c4390d13a91e81'),('11def17e8f70441b89b33505077d3cf8','d7373acae6f24d94a148a9c75d249a42','5dce9aa6bfb44c4fa4b0908c8034abe8'),('25aaea6f46f3406c982d55796ac833f8','dfc7e6e052ba48df9e392a534117792f','5dce9aa6bfb44c4fa4b0908c8034abe8'),('33a2e215dd8a4ec48cfcbdc7a86cd0f3','cd52356d70fc4f998f4b5d5ab86c6b7a','337f9e7b0c3f4d76b3c4390d13a91e81'),('3416ab119f89422c8408737b56d0b1af','9a3a1408c0f3428f8a5ead3344b79a2d','337f9e7b0c3f4d76b3c4390d13a91e81'),('3e988e9a3d95444dac6bc9b7becec870','9a3a1408c0f3428f8a5ead3344b79a2d','4e87c67b881e49c980cea6fb6ab5923f'),('3f5feed8cd06494a900372c283876d02','dfc7e6e052ba48df9e392a534117792f','4fd938bf1b1240cf9109c9083441c5e8'),('3f66870807824283807b8e02c6431f3e','2979d0d494eb49e1b06734c263e19ec8','b9b7e710f19749c88616bf6b7c225e3b'),('497fcb0b006a4214b188b519a5023726','485682a457e44170b039769505c58389','337f9e7b0c3f4d76b3c4390d13a91e81'),('4b872e0ad8234f8c89c0851df63475bb','dfc7e6e052ba48df9e392a534117792f','4e87c67b881e49c980cea6fb6ab5923f'),('582254ea930e428388dbdfef1801553b','cd52356d70fc4f998f4b5d5ab86c6b7a','4e87c67b881e49c980cea6fb6ab5923f'),('7270d5da90124e2aa06e2410483ccc7a','2979d0d494eb49e1b06734c263e19ec8','4e87c67b881e49c980cea6fb6ab5923f'),('8b4e9bfda3404b22888011604c12f7fc','d7373acae6f24d94a148a9c75d249a42','88367e8fbee14c0793cd2af46eb05a27'),('a6f8ad6552ab44619dcbc7ae69e5f2a1','485682a457e44170b039769505c58389','4e87c67b881e49c980cea6fb6ab5923f'),('ba45bf849bff476e9387e98ca97b4560','2979d0d494eb49e1b06734c263e19ec8','c0feb20f875341d18671b7834a9fb4bd'),('c242e95fb0e84b589a49d57128e07c6c','485682a457e44170b039769505c58389','4fd938bf1b1240cf9109c9083441c5e8'),('ddab0b931ca540c6b464d22ea27770aa','9a3a1408c0f3428f8a5ead3344b79a2d','4fd938bf1b1240cf9109c9083441c5e8'),('de31c029b1df497e976b0058c86e51cb','cd52356d70fc4f998f4b5d5ab86c6b7a','5dce9aa6bfb44c4fa4b0908c8034abe8'),('e0d3b717ad5847f28f8de89afaf42ab0','dfc7e6e052ba48df9e392a534117792f','337f9e7b0c3f4d76b3c4390d13a91e81'),('e4c4ae3c320647bd8b55e14f345fe00c','9a3a1408c0f3428f8a5ead3344b79a2d','5dce9aa6bfb44c4fa4b0908c8034abe8'),('e5700e8870f644d79488e5f1e003f858','d7373acae6f24d94a148a9c75d249a42','4fd938bf1b1240cf9109c9083441c5e8'),('e9a6ad7308924c1bb1a446b3fafd83ee','d7373acae6f24d94a148a9c75d249a42','4e87c67b881e49c980cea6fb6ab5923f'),('f38653bfda334dc7838701f0eeb1de4f','d7373acae6f24d94a148a9c75d249a42','337f9e7b0c3f4d76b3c4390d13a91e81');
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question_record`
--

DROP TABLE IF EXISTS `exam_question_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question_record` (
  `question_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的主键',
  `exam_id` varchar(32) NOT NULL,
  `record_id` varchar(32) NOT NULL,
  `question_option_id` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '题目选项表的主键',
  `correct` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question_record`
--

LOCK TABLES `exam_question_record` WRITE;
/*!40000 ALTER TABLE `exam_question_record` DISABLE KEYS */;
INSERT INTO `exam_question_record` VALUES ('5dce9aa6bfb44c4fa4b0908c8034abe8','d7373acae6f24d94a148a9c75d249a42','7ef4131296d544a7b943747e385e8012','0f71a95f68df4b418739e65bcbade872',3),('88367e8fbee14c0793cd2af46eb05a27','d7373acae6f24d94a148a9c75d249a42','7ef4131296d544a7b943747e385e8012','f0e014857a934e0f9cb3442ab89905b8-826c7178ea9d4ca5bbc33392c0743622-a630734899ca434fafe2cdfcfbaaa985',2),('4fd938bf1b1240cf9109c9083441c5e8','d7373acae6f24d94a148a9c75d249a42','7ef4131296d544a7b943747e385e8012','9408f286554e40ef8669921bf90f71aa-b7f687e493844031800f5406f8b59b87-5ee0491a481743818aa25bfcb18bf2ad',3),('4e87c67b881e49c980cea6fb6ab5923f','d7373acae6f24d94a148a9c75d249a42','7ef4131296d544a7b943747e385e8012','969af3f9c7404d15ae6c3e4d6ee0c332',3),('337f9e7b0c3f4d76b3c4390d13a91e81','d7373acae6f24d94a148a9c75d249a42','7ef4131296d544a7b943747e385e8012','d08b2d40d802411a9a88b481b469b8ae',3),('5dce9aa6bfb44c4fa4b0908c8034abe8','dfc7e6e052ba48df9e392a534117792f','471c3b3cc69444aaa3d34034bd527dbf','0f71a95f68df4b418739e65bcbade872',3),('4fd938bf1b1240cf9109c9083441c5e8','dfc7e6e052ba48df9e392a534117792f','471c3b3cc69444aaa3d34034bd527dbf','97821b50275c4834ba5d209a283a283f-b7f687e493844031800f5406f8b59b87',2),('4e87c67b881e49c980cea6fb6ab5923f','dfc7e6e052ba48df9e392a534117792f','471c3b3cc69444aaa3d34034bd527dbf','faa53f54d4e84d9fbe9c876b68956d71',3),('337f9e7b0c3f4d76b3c4390d13a91e81','dfc7e6e052ba48df9e392a534117792f','471c3b3cc69444aaa3d34034bd527dbf','4d5561493b1745ffa1d4b386f2370728',1),('337f9e7b0c3f4d76b3c4390d13a91e81','2979d0d494eb49e1b06734c263e19ec8','a675056497ea43749ddbb9a4164ae430','d08b2d40d802411a9a88b481b469b8ae',3),('b9b7e710f19749c88616bf6b7c225e3b','2979d0d494eb49e1b06734c263e19ec8','a675056497ea43749ddbb9a4164ae430','74bc5a4c598b439eaa7e732672531633',1),('4e87c67b881e49c980cea6fb6ab5923f','2979d0d494eb49e1b06734c263e19ec8','a675056497ea43749ddbb9a4164ae430','faa53f54d4e84d9fbe9c876b68956d71',3),('c0feb20f875341d18671b7834a9fb4bd','2979d0d494eb49e1b06734c263e19ec8','a675056497ea43749ddbb9a4164ae430','7da6fe7462b14a87a5063387686a2ebf',3);
/*!40000 ALTER TABLE `exam_question_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_record`
--

DROP TABLE IF EXISTS `exam_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_record` (
  `record_id` varchar(32) NOT NULL,
  `exam_id` varchar(32) NOT NULL,
  `answer_score` float NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_record`
--

LOCK TABLES `exam_record` WRITE;
/*!40000 ALTER TABLE `exam_record` DISABLE KEYS */;
INSERT INTO `exam_record` VALUES ('471c3b3cc69444aaa3d34034bd527dbf','dfc7e6e052ba48df9e392a534117792f',7.5,'2022-04-08 02:40:08','bc58cbc441d84ce7ab835e54f9d5303b'),('7ef4131296d544a7b943747e385e8012','d7373acae6f24d94a148a9c75d249a42',2.5,'2022-04-08 02:23:13','bc58cbc441d84ce7ab835e54f9d5303b'),('a675056497ea43749ddbb9a4164ae430','2979d0d494eb49e1b06734c263e19ec8',5,'2022-04-08 05:33:38','bc58cbc441d84ce7ab835e54f9d5303b');
/*!40000 ALTER TABLE `exam_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_user`
--

DROP TABLE IF EXISTS `exam_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_user` (
  `exam_id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_user`
--

LOCK TABLES `exam_user` WRITE;
/*!40000 ALTER TABLE `exam_user` DISABLE KEYS */;
INSERT INTO `exam_user` VALUES ('485682a457e44170b039769505c58389','bc58cbc441d84ce7ab835e54f9d5303b'),('cd52356d70fc4f998f4b5d5ab86c6b7a','bc58cbc441d84ce7ab835e54f9d5303b'),('d7373acae6f24d94a148a9c75d249a42','bc58cbc441d84ce7ab835e54f9d5303b'),('dfc7e6e052ba48df9e392a534117792f','184513686d4841348fe324de13f6099c'),('dfc7e6e052ba48df9e392a534117792f','bc58cbc441d84ce7ab835e54f9d5303b'),('2979d0d494eb49e1b06734c263e19ec8','bc58cbc441d84ce7ab835e54f9d5303b'),('9a3a1408c0f3428f8a5ead3344b79a2d','bc58cbc441d84ce7ab835e54f9d5303b');
/*!40000 ALTER TABLE `exam_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的主键',
  `question_name` longtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '题目的名字',
  `question_creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目创建者的用户id',
  `question_level_id` int NOT NULL DEFAULT '0' COMMENT '题目难易度级别',
  `question_type_id` int NOT NULL DEFAULT '0' COMMENT '题目的类型，比如单选、多选、判断等',
  `question_score` int DEFAULT '0',
  `question_category` int DEFAULT NULL,
  `question_description` longtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '题目额外的描述',
  `question_option_ids` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的选项，用选项的id用-连在一起表示答案',
  `question_answer_option_ids` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的答案，用选项的id用-连在一起表示答案',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `question_photos` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='考试题目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81','“近朱者赤，近墨者黑”所蕴含的道理和下列哪句话最相似？','288dbb53b93a4e7d892df8d88e5bdca8',2,1,5,4,'“近朱者赤，近墨者黑”所蕴含的道理和下列哪句话最相似？','4d5561493b1745ffa1d4b386f2370728-d08b2d40d802411a9a88b481b469b8ae-bf3a465212e04fe8a74621eacdf589ef-2718940e7f704ccc92e8d9e3da8d2471','4d5561493b1745ffa1d4b386f2370728','2022-04-08 01:35:07','2022-04-08 01:35:06',''),('4e87c67b881e49c980cea6fb6ab5923f','比喻句','288dbb53b93a4e7d892df8d88e5bdca8',1,1,5,4,'下面不属于比喻句的一项是','1399e830a54c49a496dccb2b9b1bee80-969af3f9c7404d15ae6c3e4d6ee0c332-faa53f54d4e84d9fbe9c876b68956d71-2d59f10baedd4a64a87f4222839fb71d','1399e830a54c49a496dccb2b9b1bee80','2022-04-08 00:53:06','2022-04-08 00:53:05',''),('4fd938bf1b1240cf9109c9083441c5e8','下列作品出自李贽的是：','288dbb53b93a4e7d892df8d88e5bdca8',3,2,5,4,'下列作品出自李贽的是：','9408f286554e40ef8669921bf90f71aa-97821b50275c4834ba5d209a283a283f-b7f687e493844031800f5406f8b59b87-6b9117631cac4b7f936c4e3c35202516-5ee0491a481743818aa25bfcb18bf2ad','9408f286554e40ef8669921bf90f71aa-97821b50275c4834ba5d209a283a283f','2022-04-08 01:00:07','2022-04-08 01:00:07',''),('5dce9aa6bfb44c4fa4b0908c8034abe8','用部首查字法，“车”可查整个字；“币”可查起笔。','288dbb53b93a4e7d892df8d88e5bdca8',2,3,5,4,'用部首查字法，“车”可查整个字；“币”可查起笔。','e4064a9f5447406b98ce371715e41a4c-0f71a95f68df4b418739e65bcbade872','e4064a9f5447406b98ce371715e41a4c','2022-04-08 00:58:38','2022-04-08 00:58:38',''),('88367e8fbee14c0793cd2af46eb05a27','陆游现存诗歌有九千三百余首，是南宋诗坛第一大家。下列保存陆游诗歌的文集有','288dbb53b93a4e7d892df8d88e5bdca8',3,2,5,4,'陆游现存诗歌有九千三百余首，是南宋诗坛第一大家。下列保存陆游诗歌的文集有','ab0565329a1b49a8ab8c5027c1061bdf-b4b8d3dea8584271997f7938e68365fb-f0e014857a934e0f9cb3442ab89905b8-a630734899ca434fafe2cdfcfbaaa985-826c7178ea9d4ca5bbc33392c0743622','ab0565329a1b49a8ab8c5027c1061bdf-b4b8d3dea8584271997f7938e68365fb-f0e014857a934e0f9cb3442ab89905b8','2022-04-08 01:01:26','2022-04-08 01:01:26',''),('b9b7e710f19749c88616bf6b7c225e3b','“西施殿、北京、赖宁”这几个词的拼音，第一个字的声母要大写。','288dbb53b93a4e7d892df8d88e5bdca8',2,3,5,4,'“西施殿、北京、赖宁”这几个词的拼音，第一个字的声母要大写。','74bc5a4c598b439eaa7e732672531633-d13807fa7aff41f48e9a640f5084efe5','74bc5a4c598b439eaa7e732672531633','2022-04-08 00:57:13','2022-04-08 00:58:47',''),('c0feb20f875341d18671b7834a9fb4bd','词语不恰当','288dbb53b93a4e7d892df8d88e5bdca8',1,1,5,4,'下列括号使用不恰当的一项是','169c3d85d33a4d30b66544d1e2da7732-4322c1f1be9c4d6495b95f57510d26cd-7da6fe7462b14a87a5063387686a2ebf-ea03e0befe8a4979a1c46cbb8221e0a9','169c3d85d33a4d30b66544d1e2da7732','2022-04-08 00:55:47','2022-04-08 00:55:47','');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_category`
--

DROP TABLE IF EXISTS `question_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_category` (
  `question_category_id` int NOT NULL AUTO_INCREMENT,
  `question_category_name` varchar(64) NOT NULL,
  `question_category_description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`question_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_category`
--

LOCK TABLES `question_category` WRITE;
/*!40000 ALTER TABLE `question_category` DISABLE KEYS */;
INSERT INTO `question_category` VALUES (1,'天文','天文'),(2,'英文','英文'),(3,'数学','数学'),(4,'语文','语文'),(5,'生物','生物');
/*!40000 ALTER TABLE `question_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_option`
--

DROP TABLE IF EXISTS `question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_option` (
  `question_option_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目选项表的主键',
  `question_option_content` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '选项的内容',
  `question_option_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '选项的额外描述，可以用于题目答案解析',
  PRIMARY KEY (`question_option_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='题目的选项';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_option`
--

LOCK TABLES `question_option` WRITE;
/*!40000 ALTER TABLE `question_option` DISABLE KEYS */;
INSERT INTO `question_option` VALUES ('0f71a95f68df4b418739e65bcbade872','对',NULL),('1399e830a54c49a496dccb2b9b1bee80','那时候大家简直好像马上就会看见他挥着手帕喊着：“喂！菲利普！”',NULL),('169c3d85d33a4d30b66544d1e2da7732','因为我们的许多白人兄弟已经认识到，他们的命运与我们的命运时紧密相连的，……他们的自由与我们的自由时(休戚)相关的。',NULL),('2718940e7f704ccc92e8d9e3da8d2471','锲而不舍，金石可镂',NULL),('2d59f10baedd4a64a87f4222839fb71d','竹山门啊，你是耸立在我国近代史上一座血染的丰碑！',NULL),('4322c1f1be9c4d6495b95f57510d26cd','我们共和国的缔造者草拟宪法和独立宣言的(气壮山河)的词句时，曾向每一个美国人许下了诺言……',NULL),('4d5561493b1745ffa1d4b386f2370728','蓬生麻中，不扶而直',NULL),('5ee0491a481743818aa25bfcb18bf2ad','《续焚烧书》',NULL),('6b9117631cac4b7f936c4e3c35202516','《高太史全集》',NULL),('74bc5a4c598b439eaa7e732672531633','对',NULL),('7da6fe7462b14a87a5063387686a2ebf','我们认为这些真理是(不言而喻)的，人人生而平等。',NULL),('826c7178ea9d4ca5bbc33392c0743622','《临川集》',NULL),('9408f286554e40ef8669921bf90f71aa','《焚书》',NULL),('969af3f9c7404d15ae6c3e4d6ee0c332','雨，像牛毛，像花针，像细丝，密密地斜织着。',NULL),('97821b50275c4834ba5d209a283a283f','《藏书》',NULL),('a630734899ca434fafe2cdfcfbaaa985','《乐章集》',NULL),('ab0565329a1b49a8ab8c5027c1061bdf','《剑南诗稿》',NULL),('b4b8d3dea8584271997f7938e68365fb','《放翁词》',NULL),('b7f687e493844031800f5406f8b59b87','《西湖寻梦》',NULL),('bf3a465212e04fe8a74621eacdf589ef','公生明，偏生暗',NULL),('d08b2d40d802411a9a88b481b469b8ae','青出于蓝，而胜于蓝',NULL),('d13807fa7aff41f48e9a640f5084efe5','错',NULL),('e4064a9f5447406b98ce371715e41a4c','错',NULL),('ea03e0befe8a4979a1c46cbb8221e0a9','但有朝一日，那里的黑人男孩和女孩将能与白人男孩和女孩(情同骨肉)，携手并进。',NULL),('f0e014857a934e0f9cb3442ab89905b8','《渭南文集》',NULL),('faa53f54d4e84d9fbe9c876b68956d71','晋祠，真不愧为我国锦绣河山中一颗璀璨的明珠。',NULL);
/*!40000 ALTER TABLE `question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_type`
--

DROP TABLE IF EXISTS `question_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_type` (
  `question_type_id` int NOT NULL AUTO_INCREMENT COMMENT '题目类型表的主键',
  `question_type_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目类型名称',
  `question_type_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '题目类型的描述',
  PRIMARY KEY (`question_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='问题类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_type`
--

LOCK TABLES `question_type` WRITE;
/*!40000 ALTER TABLE `question_type` DISABLE KEYS */;
INSERT INTO `question_type` VALUES (1,'single','单选题'),(2,'multi','多选题'),(3,'judge','判断题');
/*!40000 ALTER TABLE `question_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_menu` (
  `id` int NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `menuname` varchar(100) DEFAULT NULL,
  `hasThird` varchar(10) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `children` varchar(255) DEFAULT NULL,
  `authority` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_menu`
--

LOCK TABLES `t_menu` WRITE;
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
INSERT INTO `t_menu` VALUES (1,'li-icon-xiangmuguanli','问题管理',NULL,NULL,'2',2),(2,'icon-cat-skuQuery','问题管理','N','questions/Question',NULL,NULL),(3,'li-icon-xiangmuguanli','答题','null','null','4',3),(4,'icon-cat-skuQuery','自由回答','N','answer/Answer',NULL,NULL),(5,'li-icon-xiangmuguanli','在线考试',NULL,NULL,'6-7',3),(6,'icon-cat-skuQuery','在线考试','N','answer/Examanswer',NULL,NULL),(7,'icon-cat-skuQuery','随机考试','N','exam/Randomexam',NULL,NULL),(8,'li-icon-xiangmuguanli','考试管理',NULL,NULL,'9',2),(9,'icon-cat-skuQuery','考试管理','N','exam/Exam',NULL,NULL),(10,'li-icon-xiangmuguanli','考试记录',NULL,NULL,'11',3),(11,'icon-cat-skuQuery','考试记录','N','record/Examrecord',NULL,NULL);
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_role` (
  `id` bigint NOT NULL COMMENT '角色id',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名',
  `nameZh` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色中文名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` VALUES (1,'admin','管理员'),(2,'teacher','教师'),(3,'student','学生');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` varchar(32) NOT NULL COMMENT '用户id',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `type` int DEFAULT NULL COMMENT '角色',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `classname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES ('184513686d4841348fe324de13f6099c','1013662939@qq.com','张三','$2a$10$7pdfMLldPB93I2YHzBQ/B.5Yad5ruT.P84EbLv3465rigLQEci2r6',3,'user1','计科18-2BJ'),('288dbb53b93a4e7d892df8d88e5bdca8','2697055747@qq.com','教师','$2a$10$Qe09srBUsAOtQpnKy/H5GOgacYBqnD1fdoZo6U1d.Jnu5fdowcogK',2,'1','教师'),('bc58cbc441d84ce7ab835e54f9d5303b','2697055747@qq.com','章煜晨','$2a$10$yowYin4yLKf6wzBkKgNgq.1FlY25olxch/vDDdp7MUwNvvo013Q9i',3,'user','计科18-2BJ');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-08 14:20:10
