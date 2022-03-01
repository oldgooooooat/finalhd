CREATE DATABASE  IF NOT EXISTS `final` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `final`;
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
  `question_subject` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `question_description` longtext CHARACTER SET utf8 COLLATE utf8_bin COMMENT '题目额外的描述',
  `question_option_ids` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的选项，用选项的id用-连在一起表示答案',
  `question_answer_option_ids` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的答案，用选项的id用-连在一起表示答案',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='考试题目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('020d040c5fdf435fabd4fe2c98d8aeeb','ces','5',1,1,100,NULL,'ces','8b53be3133e444768ca6709a44afdbb8-49807673c5614c9d811acd4a80cbf03f','8b53be3133e444768ca6709a44afdbb8','2022-03-01 02:10:59','2022-03-01 02:10:59'),('6094ce9fcc6c41099fc5fb7e6f3df1c8','测试修改','5',3,1,NULL,NULL,'测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试','c5ea1e0ae6c341cdbf02bf2bac080942-91bc88655a1c4900a5443326dca051f7','c5ea1e0ae6c341cdbf02bf2bac080942','2022-02-23 06:31:55','2022-02-26 06:49:15'),('85bb9e681fa948b4bcd4f9040c05a045','123','5',2,1,NULL,NULL,'123','e42e1626580648a59bf0ae3efec87ac5-2c5ca5f324fe454ebc9e69a176980d52','e42e1626580648a59bf0ae3efec87ac5','2022-02-25 01:37:36','2022-02-26 07:01:31'),('e1c29e59c30f4dd28c6c80cf3f031f78','测试1','5',1,2,NULL,NULL,'测试','f0ffd56a9241428d9ac0f9a61e383a1f-8d0fa8f989f6449b8debcf94dcca1e9f-8aa9eefe03744660b48fa8abad79664f-74da57159b2f4cb78dd10de08c3f92db','f0ffd56a9241428d9ac0f9a61e383a1f-8d0fa8f989f6449b8debcf94dcca1e9f','2022-02-25 06:14:52','2022-02-25 06:14:52'),('f3f739d5831140009e9245da04051aa9','测试','5',1,3,NULL,NULL,'测试','cc358dd44576425793720a867a74bbc0','cc358dd44576425793720a867a74bbc0','2022-02-26 01:56:49','2022-02-26 06:35:52');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_level`
--

DROP TABLE IF EXISTS `question_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_level` (
  `question_level_id` int NOT NULL AUTO_INCREMENT COMMENT '题目难易度的主键',
  `question_level_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目难易度名称',
  `question_level_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '题目难易度的描述',
  PRIMARY KEY (`question_level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='问题的难易度级别';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_level`
--

LOCK TABLES `question_level` WRITE;
/*!40000 ALTER TABLE `question_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_level` ENABLE KEYS */;
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
INSERT INTO `question_option` VALUES ('2c5ca5f324fe454ebc9e69a176980d52','123',NULL),('49807673c5614c9d811acd4a80cbf03f','ces',NULL),('74da57159b2f4cb78dd10de08c3f92db','测试3',NULL),('8aa9eefe03744660b48fa8abad79664f','测试1',NULL),('8b53be3133e444768ca6709a44afdbb8','ces',NULL),('8d0fa8f989f6449b8debcf94dcca1e9f','测试2',NULL),('91bc88655a1c4900a5443326dca051f7','测试测试',NULL),('c5ea1e0ae6c341cdbf02bf2bac080942','a测试',NULL),('cc358dd44576425793720a867a74bbc0','2',NULL),('e42e1626580648a59bf0ae3efec87ac5','123',NULL),('f0ffd56a9241428d9ac0f9a61e383a1f','测试1',NULL);
/*!40000 ALTER TABLE `question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_subject`
--

DROP TABLE IF EXISTS `question_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_subject` (
  `subject_id` varchar(32) NOT NULL,
  `subject_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_subject`
--

LOCK TABLES `question_subject` WRITE;
/*!40000 ALTER TABLE `question_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_subject` ENABLE KEYS */;
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
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `type` int DEFAULT NULL COMMENT '角色',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'1556187290@qq.com','admin222','$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm',1,'admin'),(4,'2697055747@qq.com','user','$2a$10$J0bfkx5cIQmEG/0Ri1EhVOue1ayUpZQT7ouhWRAikWTQTCkDYN1Dq',1,'user'),(5,'1013662939@qq.com','1','$2a$10$KfV8E9.sh8mOTBLKMPK9Fe8S7n9TfNSdHoBT6sUQz/Xfw5I7Ed0x6',1,'1'),(6,'123','123','$2a$10$.He84JEgqg/mjTRX2HcU8OFM75QTeBFGcAZZI5AZoBvcmXYySUCnK',1,'123'),(7,'123456','123456','$2a$10$rZb9PIdemMozBIavyxDxL.Pg7REavPHcRvaOCRDvbtznj5y46SfrO',1,'123456'),(8,'2697055747@qq.com','测试','$2a$10$v2uney6JAsZANa5Y57LNfuNtd4cUR3RpsGk9IQVaINArhrkuBZJJi',1,'user1');
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

-- Dump completed on 2022-03-01 11:29:27
