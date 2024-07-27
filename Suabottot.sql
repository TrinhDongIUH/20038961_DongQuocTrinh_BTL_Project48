CREATE DATABASE  IF NOT EXISTS `suabottot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `suabottot`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: greeny_shop
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_image` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (4,NULL,'Sữa cho bé'),(5,NULL,'Sữa cho mẹ'),(6,NULL,'Sữa cho người cao tuổi');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `rate_date` datetime DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `order_detail_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfwepd0s8syqc9s06xnqa7mdwf` (`order_detail_id`),
  KEY `FK6uv0qku8gsu6x1r2jkrtqwjtn` (`product_id`),
  KEY `FKqi14bvepnwtjbbaxm7m4v44yg` (`user_id`),
  CONSTRAINT `FK6uv0qku8gsu6x1r2jkrtqwjtn` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKfwepd0s8syqc9s06xnqa7mdwf` FOREIGN KEY (`order_detail_id`) REFERENCES `order_details` (`order_detail_id`),
  CONSTRAINT `FKqi14bvepnwtjbbaxm7m4v44yg` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `favorite_id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`favorite_id`),
  KEY `FK6sgu5npe8ug4o42bf9j71x20c` (`product_id`),
  KEY `FK1uphh0glinnprjknyl68k1hw1` (`user_id`),
  CONSTRAINT `FK1uphh0glinnprjknyl68k1hw1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK6sgu5npe8ug4o42bf9j71x20c` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_detail_id` bigint NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,3333,11,1,8),(2,2222,1,2,8),(3,120000,1,3,16),(4,39000,1,3,9),(5,25000,1,3,10),(6,39000,1,4,9),(7,25000,1,4,10),(9,39000,1,6,9),(10,25000,1,6,12),(11,40000,1,6,14),(12,35000,2,7,18),(13,35000,2,8,18),(14,25000,1,8,20),(15,16000,1,8,8),(16,39000,1,8,9),(17,25000,1,8,10),(18,22000,3,9,17),(19,35000,1,9,18),(20,16000,1,9,8),(21,16000,1,10,8),(22,39000,1,10,9),(23,16000,1,11,8),(24,39000,1,11,9),(25,16000,1,12,8),(26,25000,1,12,10),(27,39000,1,13,9),(28,25000,2,13,10),(29,30000,1,13,11),(30,22000,1,14,17),(31,25000,1,14,10),(32,30000,2,14,11),(33,25000,1,14,13),(34,120000,3,15,16),(35,10000,2,15,15),(36,22000,1,16,17),(37,39000,1,16,9),(38,25000,1,16,10),(39,120000,3,17,16),(40,10000,2,17,15),(41,25000,1,18,10),(42,25000,1,19,13),(43,25000,1,20,10),(44,30000,1,20,11),(45,22000,1,21,17),(46,170000,1,21,19),(47,25000,1,21,20),(48,39000,1,21,9),(49,120000,1,22,16),(50,25000,1,22,20),(51,40000,2,22,14),(52,10000,1,22,15),(53,40000,1,23,14),(54,22000,1,24,17),(55,35000,1,24,18),(56,16000,2,25,8),(57,25000,1,26,10),(58,25000,1,26,12),(59,25000,1,26,13),(65,25000,1,29,20),(66,25000,2,29,13),(67,170000,1,30,19),(68,40000,1,30,14);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'ha tinh',2,'2022-01-29 00:00:00','0917291997',2,1),(2,'da nang',20000,'2022-01-29 00:00:00','0615856985',2,2),(3,'ha tinh',0,'2022-02-12 00:00:00','0915762565',3,1),(4,'ha tinh',0,'2022-02-12 00:00:00','0915762565',3,1),(6,'68,Đà Nẵng',0,'2022-02-12 00:00:00','0915762565',3,1),(7,'266 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',67900,'2022-02-12 00:00:00','0915746525',2,2),(8,'266 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',169450,'2022-02-12 00:00:00','0915291997',1,2),(9,'268 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',115950,'2022-02-12 00:00:00','0915291997',3,2),(10,'168-Hà Nội',53050,'2022-02-12 00:00:00','0916829635',1,1),(11,'266 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',123,'2022-02-13 00:00:00','0915291997',2,2),(12,'Đà Nẵng',40500,'2022-02-13 00:00:00','0915291997',0,2),(13,'Đà Nẵng',116050,'2022-02-13 00:00:00','0915762565',3,2),(14,'268 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',130750,'2022-02-13 00:00:00','0915291997',3,2),(15,'266 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',362000,'2022-02-13 00:00:00','0915291997',2,2),(16,'Đà Nẵng',83550,'2022-02-13 00:00:00','0915762565',3,2),(17,'Hà Tĩnh',362000,'2022-02-13 00:00:00','0915291997',0,1),(18,'Đà Nẵng',24500,'2022-02-15 00:00:00','0915291997',0,2),(19,'268 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',24250,'2022-02-15 00:00:00','0915762565',2,2),(20,'268 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',54500,'2022-02-15 00:00:00','0915746525',2,2),(21,'268 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',244550,'2022-02-15 00:00:00','0915291997',0,2),(22,'168 Hà Nội',228000,'2022-02-15 00:00:00','0915762565',3,2),(23,'68,Đà Nẵng',40000,'2022-02-16 00:00:00','0915762565',2,2),(24,'Liên Chiểu - Đà Nẵng',55950,'2022-02-16 00:00:00','0915762565',0,2),(25,'268 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',32000,'2022-02-17 00:00:00','0915762565',2,2),(26,'268 Dũng Sĩ Thanh Khê - TP. Đà Nẵng',73750,'2022-02-17 00:00:00','0915291997',2,2),(29,'demo địa chỉ',72500,'2022-02-17 00:00:00','0915291997',2,8),(30,'demo địa chỉ',201500,'2022-02-17 00:00:00','0915291997',2,8);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `discount` int NOT NULL,
  `entered_date` datetime DEFAULT NULL,
  `price` double NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `favorite` bit(1) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES 
(1,'Vinamilk Optimum Gold 4, 850g, 2-6 tuổi là sữa bột công thức dành riêng cho bé 2 - 6 tuổi. Đặc biệt, với công thức dễ tiêu hóa, sản phẩm giúp bé hấp thu tốt các dưỡng chất thiết yếu, tăng cường sức đề kháng, phát triển não bộ và thể chất. Được sản xuất trên dây chuyền công nghệ Đức & dưỡng chất nhập khẩu hoàn toàn, chất lượng Vinamilk Optimum Gold 4 vì vậy đạt chất lượng quốc tế và mang lại nhiều công dụng, giúp trẻ phát triển toàn diện. ',0,'2024-07-17 00:00:00',321000,'OptimumGold.jpg','Vinamilk Optimum Gold 4, 850g, 2-6 tuổi',24,NULL,4,_binary '\0'),
(2,'﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿Sữa Nutifood Varna Complete là một sản phẩm của Nutifood, dành cho người lớn giúp phòng ngừa và phục hồi sức khỏe nhanh. ',5,'2024-07-17 00:00:00',531000,'Varna.jpg','Sữa Nutifood Varna Complete 850g',49,NULL,4,_binary '\0'),
(3,'﻿﻿﻿﻿﻿Dielac Grow Plus 2+ là sản phẩm dinh dưỡng dành cho trẻ từ 2-10 tuổi. Sở hữu công thức dinh dưỡng chuyên biệt, sản phẩm giúp trẻ suy dinh dưỡng, thấp còi bắt kịp đà tăng trưởng và phát triển khoẻ mạnh. ',2,'2024-07-17 00:00:00',330280,'GrowPlus.jpg','Sữa Dielac Grow Plus 2+, 2-10 tuổi, 850g',30,NULL,4,_binary '\0'),
(4,'Thực phẩm dinh dưỡng y học Nestle Kid Essentials Nutritionally Complete﻿﻿﻿﻿ là sản phẩm dinh dưỡng phù hợp cho bé từ 1 đến 10 tuổi. ',0,'2024-07-19 00:00:00',695000,'KidEssentials.jpg','Thực phẩm dinh dưỡng y học Nestle Kid Essentials Nutritionally Complete 800g (1-10 tuổi)',40,NULL,4,_binary '\0'),
(5,'﻿﻿Sữa Enfamil A+ số 4 dành cho bé từ 2 đến 6 tuổi, với mong muốn đồng hành cùng ba mẹ nuôi dưỡng con thông minh, tình cảm.',0,'2024-07-19 00:00:00',935000,'Enfagrow.jpg','Sữa Enfagrow A+ số 4 1700g (2-6 tuổi) 2Flex',30,NULL,4,_binary '\0'),
(6,'Thấu hiểu tâm lý của mẹ luôn muốn kiếm tìm những sản phẩm tốt nhất cho con, với kinh nghiệm 155 năm trong phát triển dưỡng nhi, Nestlé cho ra đời dòng sản phẩm sữa NAN OPTIPRO PLUS giúp hỗ trợ tiêu hóa, tăng cường đề kháng và phát triển thể chất & trí não nhờ: phức hợp 5HMO, 100 triệu lợi khuẩn Bifidus BL, đạm chất lượng Optipro, DHA/ARA, Canxi & Vitamin D. Sản phẩm với công thức mới đột phá từ Thuỵ Sĩ, nhập khẩu chính hãng bởi Nestlé Việt Nam được kiểm tra nghiêm ngặt về chất lượng và an toàn sản phẩm của Nestlé toàn cầu.',3,'2024-07-19 00:00:00',805000,'OptiproPlus.jpg','Sữa Nan Optipro PLUS 4 1.5kg, với 5HMO, Công thức từ Thụy Sĩ (2-6 tuổi)',58,NULL,4,_binary '\0'),
(7,'Sữa Similac 5G số 4 là sản phẩm dinh dưỡng dành cho bé từ 2-6 tuổi. Sở hữu hệ dưỡng chất Prodi-GTM và dinh dưỡng 5G đột phá, sản phẩm giúp bé phát triển tốt não bộ, tăng cường sức đề kháng và hệ tiêu hóa khỏe mạnh.',0,'2024-07-19 00:00:00',869000,'Similac.jpg','Sữa Similac 5G số 4 1,7kg (2-6 tuổi)',50,NULL,4,_binary '\0'),
(8,'﻿﻿﻿﻿﻿﻿﻿﻿﻿Abbott Grow 2+ (﻿﻿﻿﻿﻿﻿﻿﻿Abbott Grow 4) là thức uống dinh dưỡng dành cho bé từ 2 tuổi với hệ dưỡng chất G-Power giàu các dưỡng chất và Protein chất lượng cao, hỗ trợ cho sự phát triển toàn diện của bé.',0,'2024-07-19 00:00:00',335000,'AbbottGrow.jpg','Sữa Abbott Grow 2+ 850g (trên 2 tuổi) (tên cũ: Abbott Grow 4 900g, giao bao bì ngẫu nhiên)',40,NULL,4,_binary '\0'),
(9,'Sữa bột ColosBaby Gold 2+ là sản phẩm phù hợp với trẻ trên 2 tuổi. Với thành phần sữa non cao cấp nhập khẩu từ Mỹ cùng với Lactium và hệ dưỡng chất đầy đủ, cân đối, sản phẩm giúp bé yêu phát triển khỏe mạnh, khôn lớn từng ngày.',5,'2024-07-19 00:00:00',1996000,'ColosBaby.jpg','Combo 4 Sữa ColosBaby Gold 2+ 800g (Trên 2 tuổi)',20,NULL,4,_binary '\0'),
(10,'Thực phẩm dinh dưỡng y học Pediasure bổ sung dinh dưỡng đầy đủ và cân đối, vitamin, khoáng chất giúp phục hồi sức khỏe, tăng trưởng tốt.',0,'2024-07-19 00:00:00',1085000,'PediaSure.jpg','Thực phẩm dinh dưỡng y học cho trẻ 1-10 tuổi: Pediasure vani 1,6kg (Giao bao bì ngẫu nhiên)',60,NULL,4,_binary '\0'),
(11,'Sữa bầu Similac Mom là thức uống dinh dưỡng dành cho mẹ bầu với hệ dưỡng chất IQ Plus cung cấp Vitamin E tự nhiên, Lutein, DHA giúp bé phát triển trí não từ trong bụng mẹ.',3,'2024-07-19 00:00:00',455000,'SimilacMon.jpg','Sữa bầu Similac Mom 900g hương Vani',25,NULL,5,_binary '\0'),
(12,'Sữa bầu Friso Mum Gold hương cam là sản phẩm dành cho mẹ mang thai và cho con bú. Sữa với công thức Dualcare+ cho một nền tảng dinh dưỡng vững chắc cho sự phát triển của bé từ khi còn ở trong bụng mẹ.',5,'2024-07-19 00:00:00',539000,'FrisomumGold.jpg','Sữa bầu Friso Mum Gold 900g hương cam',60,NULL,5,_binary '\0'),
(13,'Sữa bầu Enfamama A+ mới với hệ dưỡng chất 360° Brain Plus là sản phẩm dinh dưỡng chất lượng cao được đặc chế cho mẹ mang thai và cho con bú. Hệ dưỡng chất có trong sữa bầu Enfamama A+ là sự kết hợp đặc biệt các dưỡng chất quan trọng cho sự phát triển toàn diện và giúp đạt nhu cầu dinh dưỡng gia tăng trong suốt giai đoạn mang thai và cho con bú.',4,'2024-07-19 00:00:00',25000,'Enfamama.jpg','Thực phẩm bổ sung Sản phẩm dinh dưỡng Enfamama A+ hương vani 360° Brain Plus 830G',79,NULL,5,_binary '\0'),
(14,'Sữa bầu Meiji mama 350g là thực phẩm bổ sung dành cho cả bà mẹ mang thai và mẹ đang cho con bú. Với công thức tích hợp đầy đủ hệ dưỡng chất thiết yếu, sản phẩm không chỉ cải thiện sức khỏe cho mẹ mang thai hoặc đang cho con bú, mà còn giúp thai nhi và trẻ nhỏ tăng trưởng khỏe mạnh.',0,'2024-07-19 00:00:00',219000,'Meiji.jpg','Sữa bầu Meiji mama 350g',30,NULL,5,_binary '\0'),
(15,'﻿WAKODO MOM là dòng sản phẩm cao cấp dành cho mẹ mang thai và cho con bú, giúp xây dựng nền tảng bền vững cho con ngay từ trong bụng mẹ. Được sản xuất và nhập khẩu nguyên lon từ Nhật Bản, WAKODO MOM là giải pháp tối ưu do các chuyên gia dinh dưỡng, chăm sóc trẻ em nghiên cứu và xây dựng công thức phù hợp.',2,'2024-07-19 00:00:00',219000,'Wakodo.jpg','Sữa Wakodo MOM 300g',100,NULL,5,_binary '\0'),
(16,'Sữa Ensure Gold hương vani bổ sung dinh dưỡng đầy đủ và cân đối, vitamin khoáng chất giúp phục hồi và tăng cường sức khỏe.',0,'2024-07-19 00:00:00',949000,'EnsureGold.jpg','Thực phẩm dinh dưỡng y học Ensure Gold 800g (bao bì cũ 850g, giao bao bì ngẫu nhiên)',500,NULL,6,_binary '\0'),
(17,'Sữa bột nguyên kem a2 Full Cream Milk đã được sấy phun khô để giữ được tất cả sự tự nhiên và những lợi ích đặc biệt của sữa a2. Với hàm lượng canxi cao, cả gia đình có thể tận hưởng nguồn dinh dưỡng tốt nhất chỉ có từ sữa tự nhiên được pha nóng hoặc lạnh. Sản phẩm được đựng trong túi kín khí tiện dụng và có thể đóng kín khi đã mở để bảo quản sữa tốt nhất.',1,'2024-07-19 00:00:00',365000,'A2.jpg','Sữa A2 Full Cream Milk 1kg',2000,NULL,6,_binary '\0'),
(18,'Với 60 nghiên cứu lâm sàng trong suốt 30 năm, Glucerna là sản phẩm dinh dưỡng đầy đủ và cân đối cho người đái tháo đường, tiền đái tháo đường và đái tháo đường thai kỳ.',2,'2024-07-19 00:00:00',869000,'Glucerna.jpg','Thực phẩm dinh dưỡng y học Glucerna hương vani 800g',40,NULL,6,_binary '\0'),
(19,'Sữa bột Vinamilk Kenko Haru hộp 850g là sản phẩm dành cho người lớn cần bổ sung dinh dưỡng hoặc cần phục hồi sức khỏe sau ốm. Sản phẩm bổ sung Fucoidan từ Tảo nâu giúp tăng cường sức khỏe hệ miễn dịch. Fucoidan đã được chứng minh lâm sàng trên người cao tuổi Nhật Bản hỗ trợ chống oxy hóa, tăng kháng thể; chống oxy hóa, giúp tăng cường hệ miễn dịch.',3,'2024-07-19 00:00:00',605000,'Kenko.jpg','Sữa bột Vinamilk Kenko Haru hộp 850g',36,NULL,6,_binary '\0');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_USER'),(2,'ROLE_USER'),(4,'ROLE_ADMIN'),(5,'ROLE_ADMIN'),(6,'ROLE_USER'),(7,'ROLE_USER'),(8,'ROLE_USER'),(9,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES 
(1,'user.png','thaochi6402@gmail.com','Trần Thảo Chi','$2a$10$NNFj7.bICFpxqYTsCswbe.BNGHGicL0LZzXmm.UCLz8sWrM3EL3IC','2024-07-29',_binary ''),
(2,'user.png','huudong297@gmail.com','Trần Hữu Đồng','$2a$10$.XOXsgTmumdrVdQc74mqUO180lLS0OefXAyPIdiVw0IshtW5WYDMm','2024-07-21',_binary ''),
(3,'user.png','dongthd@fpt.edu.vn','user','$2a$10$UtRFor3y5PqxHKFEt1HgAOOaX7tlQs1oEhJA/VLFoUVGKo3OBkISS','2024-07-20',_binary ''),
(4,'user.png','suabottot@gmail.com','Admin Suabottot Shop','$2a$10$Hd54fYSXGv6Pqve.WjeLO.DyNv2gGIq/S2Drilp12ClD6gYzhh4jO','2024-07-19',_binary ''),
(5,'user.png','demo@gmail.com','user1','$2a$10$GtfloNhLVXQaKdXvmueUfu14h6ijuwFHMLb1icK4rsuzpWa6jOh72','2024-07-17',_binary ''),
(6,'user.png','demo2@gmail.com','user2','$2a$10$PUWkbGnEa1OdKmxiQfvw/u3oh3I09nGG6zVHmGLxgigSJC2tCz4Ta','2024-07-22',_binary ''),
(7,'user.png','demo3@gmail.com','user3','$2a$10$ePg/cUabs6dShg4hC4Buv.QaVFx6VqqBUSlmQBntalEOAaWCfY2Hi','2024-07-24',_binary ''),
(8,'user.png','greenyshop.adm@gmail.com','demo tên','$2a$10$zBgbGqKnEPFiMOceXhqwIem4e/JFMYF2rjRElIcuaBAnO.toFIOCm','2022-07-24',_binary '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`),
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,2),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-17 22:38:48
