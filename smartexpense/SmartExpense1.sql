-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: smartexpense
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `wallet_id` bigint DEFAULT NULL,
  `allocated_amount` decimal(10,2) DEFAULT NULL,
  `spent_amount` decimal(38,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `amount` decimal(38,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn7qib00712y8dwelmqfwis6ka` (`category_id`),
  KEY `FKln0tm5tgf3f9q3sp9sa5m8m7b` (`user_id`),
  CONSTRAINT `FKln0tm5tgf3f9q3sp9sa5m8m7b` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKn7qib00712y8dwelmqfwis6ka` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
INSERT INTO `budgets` VALUES (1,1,1,NULL,NULL,NULL,'2025-04-01','2025-04-30','2025-04-17 20:42:37','2025-04-17 20:42:37',600.00),(2,1,3,NULL,NULL,NULL,'2025-04-01','2025-04-30','2025-04-17 20:42:37','2025-04-17 20:42:37',1000.00),(3,1,4,NULL,NULL,NULL,'2025-04-01','2025-04-30','2025-04-17 20:42:37','2025-04-17 20:42:37',200.00),(4,1,5,NULL,NULL,NULL,'2025-04-01','2025-04-30','2025-04-17 20:42:37','2025-04-17 20:42:37',300.00),(5,1,7,NULL,NULL,NULL,'2025-04-01','2025-04-30','2025-04-17 20:42:37','2025-04-17 20:42:37',150.00),(6,1,3,NULL,NULL,NULL,'2025-04-01','2025-04-30','2025-04-17 20:42:37','2025-04-17 20:42:37',250.00),(7,1,5,NULL,NULL,NULL,'2025-04-01','2025-04-30','2025-04-17 20:42:37','2025-04-17 20:42:37',120.00),(8,1,4,NULL,NULL,NULL,'2025-04-01','2025-04-30','2025-04-17 20:42:37','2025-04-17 20:42:37',400.00),(9,1,3,NULL,NULL,NULL,'2025-04-01','2025-04-30','2025-04-17 20:42:37','2025-04-17 20:42:37',180.00),(10,1,4,NULL,NULL,NULL,'2025-04-01','2025-04-30','2025-04-17 20:42:37','2025-04-17 20:42:37',90.00);
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKghuylkwuedgl2qahxjt8g41kb` (`user_id`),
  CONSTRAINT `FKghuylkwuedgl2qahxjt8g41kb` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Groceries','2025-04-17 20:42:18','2025-04-17 20:42:18','#FF5733','shopping_cart','EXPENSE',1),(2,'Salary','2025-04-17 20:42:18','2025-04-17 20:42:18','#4CAF50','money','INCOME',1),(3,'Rent','2025-04-17 20:42:18','2025-04-17 20:42:18','#2196F3','home','EXPENSE',1),(4,'Utilities','2025-04-17 20:42:18','2025-04-17 20:42:18','#FFC107','bolt','EXPENSE',1),(5,'Entertainment','2025-04-17 20:42:18','2025-04-17 20:42:18','#9C27B0','tv','EXPENSE',1),(6,'Bonus','2025-04-17 20:42:18','2025-04-17 20:42:18','#00BCD4','star','INCOME',1),(7,'Dining Out','2025-04-17 20:42:18','2025-04-17 20:42:18','#E91E63','restaurant','EXPENSE',1),(8,'Investment Return','2025-04-17 20:42:18','2025-04-17 20:42:18','#8BC34A','trending_up','INCOME',1),(9,'Transport','2025-04-17 20:42:18','2025-04-17 20:42:18','#795548','commute','EXPENSE',1),(10,'Gift','2025-04-17 20:42:18','2025-04-17 20:42:18','#3F51B5','card_giftcard','INCOME',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `wallet_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `amount` decimal(38,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `temp_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsqqi7sneo04kast0o138h19mv` (`category_id`),
  KEY `FK23bop5lktue0o5q7kr19ti8h` (`wallet_id`),
  CONSTRAINT `FK23bop5lktue0o5q7kr19ti8h` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`),
  CONSTRAINT `FKsqqi7sneo04kast0o138h19mv` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (11,1,1,3000.00,'Monthly salary','2025-04-01','INCOME','2025-04-16 20:16:25',NULL,'2025-04-01','2025-04-17'),(12,2,2,1500.00,'Freelance project','2025-04-02','INCOME','2025-04-16 20:16:25',NULL,'2025-04-02','2025-04-17'),(13,3,3,500.00,'Birthday gift','2025-04-03','INCOME','2025-04-16 20:16:25',NULL,'2025-04-03','2025-04-17'),(14,2,1,2000.00,'Paycheck','2025-04-04','INCOME','2025-04-16 20:16:25',NULL,'2025-04-04','2025-04-17'),(15,3,2,2000.00,'Side job','2025-04-05','INCOME','2025-04-16 20:16:25',NULL,'2025-04-05','2025-04-17'),(16,1,4,50.00,'Lunch','2025-04-06','EXPENSE','2025-04-16 20:16:25',NULL,'2025-04-06','2025-04-17'),(17,2,5,20.00,'Subway fare','2025-04-07','EXPENSE','2025-04-16 20:16:25',NULL,'2025-04-07','2025-04-17'),(18,3,6,800.00,'Rent','2025-04-08','EXPENSE','2025-04-16 20:16:25',NULL,'2025-04-08','2025-04-17'),(19,4,7,120.00,'Electricity + Water','2025-04-09','EXPENSE','2025-04-16 20:16:25',NULL,'2025-04-09','2025-04-17'),(20,5,8,250.00,'Clothes shopping','2025-04-10','EXPENSE','2025-04-16 20:16:25',NULL,'2025-04-10','2025-04-17'),(21,1,2,800.00,'Freelance project',NULL,'INCOME','2025-04-18 01:54:51',NULL,'2025-04-03',NULL),(22,1,2,1500.00,'Stock dividend',NULL,'INCOME','2025-04-18 01:54:51',NULL,'2025-04-05',NULL),(23,1,2,600.00,'Gift from friend',NULL,'INCOME','2025-04-18 01:54:51',NULL,'2025-04-08',NULL),(24,1,1,300.00,'Groceries',NULL,'EXPENSE','2025-04-18 01:55:21',NULL,'2025-04-02',NULL),(25,1,3,1000.00,'Rent payment',NULL,'EXPENSE','2025-04-18 01:55:21',NULL,'2025-04-01',NULL),(26,1,4,120.00,'Utilities',NULL,'EXPENSE','2025-04-18 01:55:21',NULL,'2025-04-07',NULL),(27,1,6,250.00,'Dining out',NULL,'EXPENSE','2025-04-18 01:55:21',NULL,'2025-04-05',NULL),(28,1,9,50.00,'Subway ride',NULL,'EXPENSE','2025-04-18 01:55:21',NULL,'2025-04-06',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'alice','alice@example.com','123456','Alice','Smith','REGULAR_USER','2025-04-16 19:58:05',NULL),(2,'bob','bob@example.com','123456','Bob','Johnson','REGULAR_USER','2025-04-16 19:58:05',NULL),(3,'carol','carol@example.com','123456','Carol','Williams','REGULAR_USER','2025-04-16 19:58:05',NULL),(4,'dave','dave@example.com','123456','Dave','Brown','REGULAR_USER','2025-04-16 19:58:05',NULL),(5,'eve','eve@example.com','123456','Eve','Davis','REGULAR_USER','2025-04-16 19:58:05',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `balance` decimal(38,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc1foyisidw7wqqrkamafuwn4e` (`user_id`),
  CONSTRAINT `FKc1foyisidw7wqqrkamafuwn4e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,1,'Main Wallet','CASH',1000.00,'2025-04-16 19:58:19',NULL,NULL),(2,2,'Savings','BANK',5000.00,'2025-04-16 19:58:19',NULL,NULL),(3,3,'Credit Card','CREDIT',-200.00,'2025-04-16 19:58:19',NULL,NULL),(4,4,'Investment','INVESTMENT',15000.00,'2025-04-16 19:58:19',NULL,NULL),(5,5,'Emergency','SAVINGS',3000.00,'2025-04-16 19:58:19',NULL,NULL);
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-18  1:59:51
