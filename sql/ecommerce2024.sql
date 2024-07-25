-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce2024
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Categoria',7,'add_categoria'),(26,'Can change Categoria',7,'change_categoria'),(27,'Can delete Categoria',7,'delete_categoria'),(28,'Can view Categoria',7,'view_categoria'),(29,'Can add Produto',8,'add_produto'),(30,'Can change Produto',8,'change_produto'),(31,'Can delete Produto',8,'delete_produto'),(32,'Can view Produto',8,'view_produto');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$p6TCUvcCvJf1MDoa7DcAcp$nmq516mbrJyhCuJ5cbLYOplwwo/rRxY50ZOp92bYsVM=','2024-04-03 18:00:06.237070',1,'admin','','','admin@admin.com.br',1,1,'2024-04-03 17:59:18.348896');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catproduto_categoria`
--

DROP TABLE IF EXISTS `catproduto_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catproduto_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `catproduto_categoria_nome_ad97f390` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catproduto_categoria`
--

LOCK TABLES `catproduto_categoria` WRITE;
/*!40000 ALTER TABLE `catproduto_categoria` DISABLE KEYS */;
INSERT INTO `catproduto_categoria` VALUES (1,'Monitor','monitor'),(2,'Mem├│ria','memoria'),(3,'Mouse','mouse');
/*!40000 ALTER TABLE `catproduto_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catproduto_produto`
--

DROP TABLE IF EXISTS `catproduto_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catproduto_produto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `descricao` longtext NOT NULL,
  `disponivel` tinyint(1) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `criado` datetime(6) NOT NULL,
  `atualizado` datetime(6) NOT NULL,
  `categoria_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `catproduto_produto_categoria_id_06d1560e_fk_catprodut` (`categoria_id`),
  KEY `catproduto_produto_nome_848a5ea0` (`nome`),
  CONSTRAINT `catproduto_produto_categoria_id_06d1560e_fk_catprodut` FOREIGN KEY (`categoria_id`) REFERENCES `catproduto_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catproduto_produto`
--

LOCK TABLES `catproduto_produto` WRITE;
/*!40000 ALTER TABLE `catproduto_produto` DISABLE KEYS */;
INSERT INTO `catproduto_produto` VALUES (1,'Monitor 17\'\' LG','monitor-17-lg','produtos/2024/04/03/baixados.jfif','dafad adf adf adfad adsfafadsf asdfadsf asd fadsf asdf adsf g43fgaewfewfaweveavdsva vas a  fe h hgreh erh sdf sg shshfshfhsf  hshs shshfhsfd shs',1,873.68,'2024-04-03 18:02:28.166841','2024-04-03 18:02:28.166841',1),(2,'Monitor 15\'\' Asus','monitor-15-asus','produtos/2024/04/03/baixados2.jfif','dufaohu fu ewonf ouin vuna seuvoin eaov iu aevu ewui yoiav yuiavy ouiaev iuoaeh uh aevo9 vaeuooaewvaewv',1,987.25,'2024-04-03 18:03:05.894723','2024-04-03 18:03:05.894723',1),(3,'Mem├│ria RAM DDR5 odi','memoria-ram-ddr5-odi','produtos/2024/04/03/mem1.jfif','dfadfads ad fadf adsf waef ew gre trhytujytjyr jy tynry n etner trntr netn',1,575.55,'2024-04-03 18:03:56.598618','2024-04-03 18:03:56.598618',2),(4,'Mem├│ria RAM DDR4 ferw','memoria-ram-ddr4-ferw','produtos/2024/04/03/mem2.jfif','fadfaf t efew ew f f  feqf e',1,345.58,'2024-04-03 18:04:23.058183','2024-04-03 18:04:23.058183',2),(5,'Mouse ├│tico adda','mouse-otico-adda','produtos/2024/04/03/OIP2.jfif','fafa  ew ew wef f wqef af ae ffasfaf a fa',1,125.58,'2024-04-03 18:04:57.736191','2024-04-03 18:15:57.673636',3),(6,'Mouse com fio dkakka','mouse-com-fio-dkakka','produtos/2024/04/03/OIP3.jfif','dfiopafpaioi dfija fi jaifjp daiop fjip afiop pjfa pi adf',1,87.68,'2024-04-03 18:05:26.416575','2024-04-03 18:05:26.416575',3),(7,'Mouse sem fio dkkskk','mouse-sem-fio-dkkskk','produtos/2024/04/03/OIP.jfif','fafadfa a ew werewf afafaf aff',1,98.87,'2024-04-03 18:05:51.126474','2024-04-03 18:05:51.126474',3);
/*!40000 ALTER TABLE `catproduto_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-03 18:01:01.061695','1','Monitor',1,'[{\"added\": {}}]',7,1),(2,'2024-04-03 18:01:06.453690','2','Mem├│ria',1,'[{\"added\": {}}]',7,1),(3,'2024-04-03 18:01:12.156753','3','Mouse',1,'[{\"added\": {}}]',7,1),(4,'2024-04-03 18:02:28.166841','1','Monitor 17\'\' LG',1,'[{\"added\": {}}]',8,1),(5,'2024-04-03 18:03:05.894723','2','Monitor 15\'\' Asus',1,'[{\"added\": {}}]',8,1),(6,'2024-04-03 18:03:56.601123','3','Mem├│ria RAM DDR5 odi',1,'[{\"added\": {}}]',8,1),(7,'2024-04-03 18:04:23.058183','4','Mem├│ria RAM DDR4 ferw',1,'[{\"added\": {}}]',8,1),(8,'2024-04-03 18:04:57.737195','5','Mouse ├│tico adda',1,'[{\"added\": {}}]',8,1),(9,'2024-04-03 18:05:26.416575','6','Mouse com fio dkakka',1,'[{\"added\": {}}]',8,1),(10,'2024-04-03 18:05:51.127785','7','Mouse sem fio dkkskk',1,'[{\"added\": {}}]',8,1),(11,'2024-04-03 18:15:13.269748','5','Mouse ├│tico adda',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',8,1),(12,'2024-04-03 18:15:47.265032','5','Mouse ├│tico adda',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',8,1),(13,'2024-04-03 18:15:57.674636','5','Mouse ├│tico adda',2,'[{\"changed\": {\"fields\": [\"Imagem\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'catproduto','categoria'),(8,'catproduto','produto'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-03 17:58:44.691863'),(2,'auth','0001_initial','2024-04-03 17:58:45.227229'),(3,'admin','0001_initial','2024-04-03 17:58:45.508480'),(4,'admin','0002_logentry_remove_auto_add','2024-04-03 17:58:45.524105'),(5,'admin','0003_logentry_add_action_flag_choices','2024-04-03 17:58:45.539729'),(6,'contenttypes','0002_remove_content_type_name','2024-04-03 17:58:45.664729'),(7,'auth','0002_alter_permission_name_max_length','2024-04-03 17:58:45.742859'),(8,'auth','0003_alter_user_email_max_length','2024-04-03 17:58:45.774104'),(9,'auth','0004_alter_user_username_opts','2024-04-03 17:58:45.774104'),(10,'auth','0005_alter_user_last_login_null','2024-04-03 17:58:45.836604'),(11,'auth','0006_require_contenttypes_0002','2024-04-03 17:58:45.836604'),(12,'auth','0007_alter_validators_add_error_messages','2024-04-03 17:58:45.836604'),(13,'auth','0008_alter_user_username_max_length','2024-04-03 17:58:45.914729'),(14,'auth','0009_alter_user_last_name_max_length','2024-04-03 17:58:45.977229'),(15,'auth','0010_alter_group_name_max_length','2024-04-03 17:58:45.992856'),(16,'auth','0011_update_proxy_permissions','2024-04-03 17:58:45.992856'),(17,'auth','0012_alter_user_first_name_max_length','2024-04-03 17:58:46.070977'),(18,'catproduto','0001_initial','2024-04-03 17:58:46.216843'),(19,'sessions','0001_initial','2024-04-03 17:58:46.248116');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('71eaj3bfcsciukr0jde35nittiyaf8o5','.eJxVjDsOwjAQBe_iGlnxN2tK-pzB2vUHB5AtxUmFuDuJlALamXnvzTxua_FbT4ufI7sywS6_jDA8Uz1EfGC9Nx5aXZeZ-JHw03Y-tZhet7P9OyjYy742SjtUUgNKSuSUcDpAGk0kByLIDDbmQThDKoCIlCWqNFqrwZodDpl9vtNaN4g:1rs4u6:e1ek_y1frCyYnVw5JZyGbqTuu6F-0XYugYp6fipLG7o','2024-04-17 18:00:06.244460');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-03 14:23:13
