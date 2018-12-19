-- MySQL dump 10.13  Distrib 5.7.21, for osx10.12 (x86_64)
--
-- Host: localhost    Database: chatbot
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `utterance_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属发言ID',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  `content` text COMMENT 'json array',
  `select_index` int(11) NOT NULL DEFAULT '-1' COMMENT '用户选择',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corpus_item`
--

DROP TABLE IF EXISTS `corpus_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corpus_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除',
  `sentence_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '语句ID',
  `hidden_state` text COMMENT 'term vector',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  `char_str` varchar(1024) NOT NULL DEFAULT '' COMMENT 'term',
  `order_id_sentence` int(11) NOT NULL DEFAULT '-1' COMMENT 'term的位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corpus_item`
--

LOCK TABLES `corpus_item` WRITE;
/*!40000 ALTER TABLE `corpus_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `corpus_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corpus_sentence`
--

DROP TABLE IF EXISTS `corpus_sentence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corpus_sentence` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `content` text COMMENT '语料内容',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corpus_sentence`
--

LOCK TABLES `corpus_sentence` WRITE;
/*!40000 ALTER TABLE `corpus_sentence` DISABLE KEYS */;
/*!40000 ALTER TABLE `corpus_sentence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialog`
--

DROP TABLE IF EXISTS `dialog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dialog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '对话ID',
  `is_closed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '对话是否结束 0:未结束 1:结束',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除 0:未删除 1:已删除',
  `dialog_name` varchar(256) NOT NULL DEFAULT '' COMMENT '对话名称',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对话开始时间',
  `update_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对话表，表中一行代表一个对话';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialog`
--

LOCK TABLES `dialog` WRITE;
/*!40000 ALTER TABLE `dialog` DISABLE KEYS */;
/*!40000 ALTER TABLE `dialog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hidden_states`
--

DROP TABLE IF EXISTS `hidden_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hidden_states` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '标示ID',
  `utterance_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属的发言ID',
  `state_matrix` text COMMENT '状态矩阵，json array',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除',
  `content` text COMMENT '纬度矩阵所对应的生成语句',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='隐藏层纬度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hidden_states`
--

LOCK TABLES `hidden_states` WRITE;
/*!40000 ALTER TABLE `hidden_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `hidden_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interactive_pattern`
--

DROP TABLE IF EXISTS `interactive_pattern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interactive_pattern` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '标示ID',
  `color_matrix` text COMMENT '颜色矩阵,格式为json的二维数组',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除',
  `column_utterance_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '列语句对应的utterance ID',
  `row_utterance_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '行语句对应的utterance ID',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '热图类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储interactive pattern的颜色矩阵';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interactive_pattern`
--

LOCK TABLES `interactive_pattern` WRITE;
/*!40000 ALTER TABLE `interactive_pattern` DISABLE KEYS */;
/*!40000 ALTER TABLE `interactive_pattern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_entity`
--

DROP TABLE IF EXISTS `logic_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_entity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(1024) NOT NULL DEFAULT '' COMMENT '实体名称',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='logic tracker的实体表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_entity`
--

LOCK TABLES `logic_entity` WRITE;
/*!40000 ALTER TABLE `logic_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_relation`
--

DROP TABLE IF EXISTS `logic_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_relation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '标示ID',
  `relation_desc` varchar(1024) NOT NULL DEFAULT '' COMMENT '关系描述',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除',
  `source_entity_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '源实体ID',
  `target_entity_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '目标实体ID',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='logic tracker的关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_relation`
--

LOCK TABLES `logic_relation` WRITE;
/*!40000 ALTER TABLE `logic_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_tracker`
--

DROP TABLE IF EXISTS `logic_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_tracker` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '标示ID',
  `utterance_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属的发言ID',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '生成时间',
  `is_tuned` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:untune 1:tune',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储每一句生成的对话的logic tracker的DAG图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_tracker`
--

LOCK TABLES `logic_tracker` WRITE;
/*!40000 ALTER TABLE `logic_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logic_tracker_logic_relation`
--

DROP TABLE IF EXISTS `logic_tracker_logic_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logic_tracker_logic_relation` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tracker_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的tracker_id',
  `logic_relation_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的关系ID',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logic_tracker_logic_relation`
--

LOCK TABLES `logic_tracker_logic_relation` WRITE;
/*!40000 ALTER TABLE `logic_tracker_logic_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `logic_tracker_logic_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(1024) NOT NULL DEFAULT '' COMMENT '用户名',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utterance`
--

DROP TABLE IF EXISTS `utterance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utterance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'term ID',
  `dialog_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '所属的对话ID',
  `content` text COMMENT '发言内容',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '软删除',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '发言者ID',
  `create_time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发言生成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对话，表中一行代表一句发言';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utterance`
--

LOCK TABLES `utterance` WRITE;
/*!40000 ALTER TABLE `utterance` DISABLE KEYS */;
/*!40000 ALTER TABLE `utterance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-19 22:28:50
