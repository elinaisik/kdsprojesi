-- MySQL dump 10.13  Distrib 9.0.1, for macos15.1 (arm64)
--
-- Host: localhost    Database: kdss_projesi
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `siparis_id` int NOT NULL,
  `musteri_id` int NOT NULL,
  `urun_id` int NOT NULL,
  `paketleme_puan` tinyint NOT NULL,
  `kargo_puan` tinyint NOT NULL,
  `musteri_hizmetleri_puan` tinyint NOT NULL,
  `urun_puan` tinyint NOT NULL,
  `yorum` text CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `tarih` datetime NOT NULL,
  PRIMARY KEY (`siparis_id`,`musteri_id`,`urun_id`),
  KEY `siparis_id` (`siparis_id`,`musteri_id`,`urun_id`),
  KEY `musteri_id` (`musteri_id`),
  KEY `urun_id` (`urun_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`siparis_id`, `musteri_id`, `urun_id`) REFERENCES `siparisler` (`siparis_id`, `musteri_id`, `urun_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,101120,2023011,5,2,5,2,'Hiç beğenmedim, yüzümde silgi gibi soyuluyor. Kargo çok yavaştı.','2024-01-27 18:43:32'),(2,101116,2023011,5,3,5,5,'Ürüne bayıldım, cildimle anlaştı. Kargo çok yavaş.','2024-01-22 18:43:32'),(3,101104,2023011,5,4,5,4,'Güneş kremini beğendim, çok hafif ve güzel emiliyor.','2024-01-22 18:43:32'),(3,101104,2023651,5,4,5,5,'Güzel şapka,sorunu yok.','2024-01-22 18:43:32'),(4,101118,2023011,5,4,5,1,'Ürün yüzümü kızarttı, yaktı. Hemen yıkamak zorunda kaldım hiç beğenmedim.','2024-01-22 18:43:33'),(4,101118,2024012,5,4,5,5,'Çok güzel bir güneş kremi, hemen emiliyor vadettiği her şeyi karşıladı tekrar alırım.','2024-01-23 17:43:32'),(5,101113,2024400,2,4,4,4,'Kargo kutusu ezik bir şekilde geldi, paketleme daha düzgün olabilirdi , onun dışında ürün güzel.','2024-01-20 15:43:32'),(6,101105,2024401,2,4,4,5,'Kargo kutusu biraz zarar görmüştü , içinde gözlük var daha dikkatli bir paketleme olmalıydı , ürün iyi.','2024-01-21 18:43:32'),(7,101121,2023651,5,5,5,5,'Süper ürün.','2024-01-16 18:43:32'),(7,101121,2024401,5,5,5,5,'güzel ürün.','2024-01-16 18:43:32'),(8,101116,2024652,5,5,5,5,'Bayıldım harika, çok tarz duruyor.','2024-01-15 18:43:32'),(9,101111,2024401,5,5,5,5,'Gayet güzel hiçbir sorunu yok güvenle alabilirsiniz.','2024-01-14 18:43:32'),(10,101119,2023011,5,5,5,1,'Hiç beğenmedim, soyuluyor ','2024-01-18 18:43:32'),(11,101101,2024652,5,5,5,5,'Bu şapka koleksiyonumda en sevdiğim parça oldu. Hem rahat hem de çok şık.','2024-01-17 15:31:27'),(12,101115,2023011,5,2,5,1,'Kargo yavaş, teslimat süresi çok uzun sürdü. Yüzümde soyuluyor, kesinlikle tavsiye etmiyorum.','2024-01-24 15:31:27'),(13,101106,2024400,5,5,5,5,'Stilime harika uydu. Hem şık hem de çok rahat!','2024-01-18 15:31:27'),(14,101117,2024401,4,3,5,5,'Gideri var.','2024-01-18 15:31:27'),(15,101108,2023011,5,4,5,1,'Terleyince akıyor, yüzümdeki tüm makyajı bozdu.','2024-01-24 15:31:27'),(16,101102,2024400,5,4,4,2,'Burnu rahatsız ediyor, uzun süre kullanılamıyor.','2024-12-26 15:31:27'),(17,101109,2024401,5,5,5,5,'Harika','2024-02-08 16:47:08'),(17,101109,2024652,5,5,5,2,'Şapka yamuk geldi, hiç düzgün değil.','2024-02-08 16:47:08'),(18,101110,2024012,5,3,5,5,'Kargo kutusu ezik geldi, ürünün zarar görmesinden endişelendim.','2024-02-09 16:47:08'),(18,101110,2024400,4,3,4,2,'Buruna baskı yapıyor, çok konforsuz.','2024-02-09 16:47:08'),(19,101113,2023010,5,5,5,5,'Hafif yapısı çok hoşuma gitti. Cildimde asla yağlı bir his bırakmadı.','2024-02-09 16:47:08'),(20,101103,2023010,4,3,4,5,'Kargo kutusu hasar görmüş, ürünümde çizikler vardı.','2024-02-12 16:47:08'),(21,101104,2023651,5,5,5,5,'Muhteşemdi.','2024-02-12 16:47:08'),(22,101108,2023010,4,4,5,4,'Fena değil.','2024-02-15 16:47:08'),(23,101107,2024012,5,4,5,5,'Fena değil.','2024-02-16 16:47:08'),(24,101121,2023010,5,4,5,4,'Çok güzel','2024-02-18 16:47:08'),(25,101118,2023010,5,5,5,5,'Ürün çok iyi.','2024-02-26 17:01:34'),(26,101120,2023650,3,3,3,5,'Ürün geç geldi, paketleme kötü.','2024-03-16 17:01:34'),(27,101118,2023650,4,4,5,5,'Güzel ürün.','2024-03-13 17:01:34'),(28,101113,2023650,5,4,5,4,'Fena değil.','2024-03-11 17:01:34'),(29,101105,2024400,5,4,5,3,'Burnumu acıtıyor, iade etmeyi düşünüyorum.','2024-03-16 17:01:34'),(30,101116,2024400,5,5,5,5,'Güzel ürün','2024-03-13 17:01:34'),(31,101119,2024401,4,4,5,5,'Fena değil.','2024-03-15 17:01:34'),(32,101117,2024400,3,4,4,2,'Burun kısmı sert, rahatsız edici.','2024-03-21 17:01:34'),(33,101114,2023651,3,3,4,5,'Fena değil','2024-04-09 17:01:34'),(33,101114,2024401,3,3,4,4,'Özensiz paketleme ürünlerim zarar görebilirdi. Kargo yavaş','2024-04-09 17:01:34'),(34,101101,2023651,5,5,5,5,'Harika','2024-04-06 17:33:58'),(35,101115,2023650,5,5,5,5,'Güzel ürün','2024-01-22 18:44:42'),(36,101110,2024652,5,5,5,5,'Ben çok beğendim çok iyi kalite.','2024-04-23 17:33:58'),(37,101120,2024400,4,4,5,5,'GAyet iyi','2024-05-05 17:33:58'),(38,101112,2024401,4,3,4,5,'Kargo yavaş geldi ve teslimat süresi çok uzundu.','2024-05-10 17:33:58'),(39,101115,2024400,4,4,5,2,'Güneş geçiriyor, koruma sağlamıyor.','2024-05-07 17:33:58'),(40,101102,2023650,5,5,5,5,'Güzelll','2024-05-08 17:33:58'),(41,101106,2024401,2,5,4,5,'Paketleme çok kötüydü, özellikle hassas ürünlerim için daha dikkatli olunmalıydı.','2024-01-23 18:43:32'),(42,101107,2023651,5,5,5,4,'Güzel, tekrar aldım','2024-05-25 17:33:58'),(42,101107,2024401,5,5,5,4,'tavsiye ederim güzel bir gözlük','2024-12-26 17:33:58'),(43,101104,2024401,2,4,4,5,'Paketleme özensiz, ürünler iyi','2024-05-30 18:04:39'),(44,101120,2024012,5,5,5,5,'Çok güzel bir krem','2024-12-26 18:04:39'),(45,101113,2024012,4,4,5,5,'Bayıldım','2024-06-01 18:04:39'),(46,101105,2024012,5,5,5,5,'Çok iyi gerçekten övüldüğü kadar varmış','2024-06-04 18:04:39'),(47,101103,2024400,4,4,4,1,'Burnu rahatsız ediyor, kötü tasarlanmış.','2024-06-09 18:04:39'),(48,101108,2024400,4,4,4,1,'Burnumu acıtıyor, memnun değilim. ','2024-06-08 18:04:39'),(49,101104,2024012,5,5,5,5,'Müthiş bir güneş kremi ','2024-06-08 18:04:39'),(50,101120,2023010,5,5,5,2,'Yüzümü kızarttı, tahriş etti ','2024-06-16 18:04:39'),(51,101112,2023651,5,3,5,5,'Kaliteli ürün fakat kargo geç geldi','2024-06-12 18:04:39'),(52,101118,2024400,4,4,4,2,'Burnu rahatsız ediyor, hiç rahat değil.','2024-06-16 18:04:39'),(53,101113,2023011,5,5,5,1,'Yüzüm kıpkırmızı oldu, alerjik bir reaksiyon yarattı.','2024-06-12 18:47:27'),(54,101105,2023011,4,4,4,2,'Sivilce yaptı, çok kötü bir ürün.','2024-06-12 18:47:27'),(55,101121,2023011,4,2,4,1,'Silgi gibi soyuluyor, kötü bir deneyim. Kargo yavaştı','2024-06-16 18:47:27'),(56,101116,2024012,4,3,5,5,'Denediklerim arasında en iyisi','2024-06-15 18:47:27'),(57,101111,2023011,4,2,4,2,'Suya dayanıklı değil, terleyince akıyor ayrıca sivilce yaptı ve kargo geç geldi','2024-06-18 18:47:27'),(58,101119,2024012,2,4,4,5,'Paketleme özensiz fakat ürünler iyi.','2024-06-17 18:47:27'),(59,101117,2023010,5,3,4,4,'Fena değil.','2024-06-17 18:47:27'),(59,101117,2023650,5,3,4,5,'Fena değil.','2024-06-17 18:47:27'),(60,101114,2023011,5,4,5,5,'Ben beğeniyorum, cildimi koruyor.','2024-06-19 18:47:27'),(61,101101,2024401,1,2,2,1,'Ürün kırık geldi , bu ne dikkatsizlik!','2024-06-14 18:47:27'),(62,101115,2024012,4,4,5,3,'Bilemiyorum, biraz yüzümde yağlı kalıyor.','2024-06-16 19:03:34'),(63,101103,2024012,5,5,5,5,'Kötü değil.','2024-06-16 19:03:34'),(64,101118,2024012,3,3,4,4,'Berbat değil.','2024-06-16 19:03:34'),(65,101102,2024012,5,4,4,5,'Fena değil.','2024-06-17 19:03:34'),(66,101107,2024012,4,2,4,5,'Ürün çok iyi fakat kargo kutusu ezik geldi.','2024-06-20 19:03:34'),(67,101109,2024012,5,4,4,3,'Ortalama bir ürün.','2024-12-20 19:03:34'),(68,101106,2023011,4,4,5,2,'maalesef benim yüzümde silgi gibi soyuluyor','2024-06-26 19:37:09'),(69,101110,2023011,5,5,5,5,'Bana çok iyi geldi ben çok sevdim, güneşten koruyor.','2024-06-26 19:37:09'),(70,101104,2024652,4,3,4,1,'Birkaç kullanımdan sonra dikişleri açıldı ve taşları düştü.Önermiyorum','2024-06-28 19:37:09'),(71,101120,2024012,5,3,5,5,'Kargo yavaştı ama ürün güzel.','2024-06-26 19:37:09'),(72,101112,2024400,4,4,5,5,'Eşim için aldım, beğendi teşekkürler','2024-06-26 19:37:09'),(73,101118,2024401,3,4,4,4,'Paketleme özensizdi, ürün iyi.','2024-06-27 19:37:09'),(74,101113,2024401,1,2,2,1,'Ürün kırık geldi iade istiyorum!','2024-07-04 19:37:09'),(75,101105,2023010,4,2,4,4,'Ürün iyi ama kargo çok yavaştı, 1 hafta bekledim.','2024-07-15 10:10:13'),(76,101121,2024012,5,3,5,5,'Kargo kutusu biraz ezikti ama ürün sağlam ve güzel.','2024-07-16 11:07:13'),(77,101116,2023010,5,2,5,4,'Kargo geç geldi ama ürün kaliteli.','2024-07-16 11:33:13'),(78,101111,2024012,4,4,5,5,'Ürün kalitesi oldukça iyi.','2024-07-16 12:01:13'),(79,101119,2023010,3,2,5,4,'Paketleme özensizdi, kargo kutusu hasarlıydı.','2024-07-16 12:30:13'),(80,101117,2024012,4,4,4,5,'Memnun kaldım, tavsiye ederim.','2024-07-16 12:43:13'),(81,101114,2023010,2,3,5,4,'Kargo kutusu çok kötüydü ama ürün iyi.','2024-07-16 13:22:13'),(82,101101,2023011,4,4,4,1,'Yüzümü tahriş etti, sivilce çıkarttı. Kesinlikle kullanmayın.','2024-07-16 16:07:00'),(83,101115,2024012,5,5,5,4,'Güzel ürün, tekrar alırım.','2024-07-17 12:36:41'),(84,101103,2023011,5,4,5,1,'Terleyince akıyor, yüzümde silgi gibi soyuluyor.','2024-07-17 12:47:41'),(85,101108,2024012,4,5,5,5,'Harika bir ürün, çok memnunum.','2024-07-17 13:01:41'),(86,101102,2023011,5,5,5,1,'Su değince akıyor, yüzümü kızarttı ve yaktı.','2024-07-17 14:15:41'),(87,101107,2023010,4,4,5,4,'İyi bir ürün, memnun kaldım.','2024-07-23 16:36:41'),(88,101109,2023011,5,4,4,1,'Alerjik reaksiyona sebep oldu, yüzüm kıpkırmızı oldu.','2024-07-23 19:16:41'),(89,101106,2024012,4,5,5,5,'Harika bir ürün, kesinlikle tavsiye ederim.','2024-07-23 21:12:41'),(90,101110,2023011,5,5,4,2,'Ciltte tahriş ve alerji yaptı, hiç memnun kalmadım.','2024-07-25 10:36:41'),(91,101104,2023010,4,4,5,4,'Ürün fena değil, kullanılabilir.','2024-07-25 13:11:41'),(92,101120,2024401,5,5,5,5,'Çok kaliteli bir ürün, teşekkürler.','2024-07-25 16:55:41'),(93,101112,2024012,4,5,4,5,'Başarılı bir ürün, memnun kaldım.','2024-07-25 19:36:41'),(94,101118,2024401,5,4,5,5,'Harika bir ürün, kesinlikle tavsiye ederim.','2024-07-31 16:16:38'),(95,101113,2024012,4,5,5,4,'İyi bir ürün, tekrar tercih ederim.','2024-07-31 17:19:38'),(96,101105,2023650,5,4,4,5,'Çok güzel bir ürün, teşekkürler.','2024-07-31 17:45:38'),(97,101121,2024652,4,4,5,1,'Kalıbı kötü, kafama oturmuyor. Taşları düştü.','2024-07-31 19:03:38'),(98,101116,2024401,5,5,5,5,'Mükemmel bir ürün, çok memnunum.','2024-07-31 23:16:38'),(99,101111,2023651,4,5,4,5,'Güzel bir ürün, tavsiye ederim.','2024-08-06 11:10:38'),(100,101119,2023651,5,4,5,4,'İyi bir ürün, memnun kaldım.','2024-08-06 12:15:38'),(101,101117,2023011,5,4,5,1,'Yüzümde soyuluyor ve çok tahriş etti.','2024-08-06 15:15:38'),(102,101114,2024012,4,5,4,5,'Çok memnun kaldım, teşekkürler.','2024-08-06 19:55:38'),(103,101101,2024012,5,5,5,4,'Başarılı bir ürün, tavsiye ederim.','2024-08-06 21:16:38'),(104,101115,2023010,4,4,5,4,'Fiyatına göre iyi bir ürün.','2024-08-06 23:34:38'),(105,101101,2023010,5,5,4,4,'Memnun kaldım, tekrar alabilirim.','2024-08-10 10:55:59'),(106,101115,2024400,4,5,5,2,'Burnu rahatsız ediyor, burun kısmı çok sert.','2024-08-10 14:02:59'),(107,101103,2023650,5,4,4,5,'Güzel bir ürün, tavsiye ederim.','2024-08-10 18:54:59'),(108,101108,2024652,4,5,5,1,'Dikişleri açıldı, çok büyük geldi.','2024-08-10 21:55:59'),(109,101102,2023010,5,4,4,4,'İyi bir ürün, memnun kaldım.','2024-08-18 09:02:39'),(110,101107,2023011,4,5,5,1,'Yüzümde soyuluyor, sivilce çıkarttı.','2024-08-18 10:09:39'),(111,101109,2023010,5,4,4,4,'Fiyatına göre başarılı bir ürün.','2024-08-18 11:32:39'),(112,101106,2024400,4,5,5,2,'Burnuma baskı yapıyor, rahatsız edici.','2024-08-18 13:05:39'),(113,101110,2023010,5,4,4,4,'Memnun kaldım, teşekkürler.','2024-08-18 14:00:39'),(114,101104,2024400,4,5,5,1,'Burnumu acıtıyor, çok rahatsız edici.','2024-08-18 17:30:39'),(115,101120,2024652,5,4,4,1,'Yamuk geldi ve yırtıldı, çok kötü.','2024-08-23 13:07:17'),(116,101112,2023011,4,5,5,1,'Silgi gibi soyuluyor, yüzüm kızardı.','2024-08-23 13:20:17'),(117,101118,2024012,5,4,4,5,'Harika bir ürün, çok memnunum.','2024-08-23 13:32:17'),(118,101113,2024652,4,5,5,2,'Kalıbı kötü, yamuk duruyor.','2024-08-23 14:07:17'),(119,101105,2024652,5,4,4,1,'Taşları düştü, dikişleri açıldı.','2024-08-23 17:57:17'),(120,101121,2024012,4,5,5,4,'İyi bir ürün, memnun kaldım.','2024-08-23 18:30:17'),(121,101116,2023011,4,3,5,1,'Yüzümü tahriş etti ve kargo geç geldi.','2024-08-28 12:12:48'),(122,101111,2023010,3,2,4,4,'Ürün iyi ama kargo kutusu hasarlıydı.','2024-08-28 14:18:48'),(123,101119,2023010,5,4,4,4,'Fiyatına göre başarılı bir ürün.','2024-08-28 15:12:48'),(124,101117,2024012,4,5,5,5,'Çok başarılı bir ürün.','2024-08-28 18:52:48'),(125,101114,2023011,5,4,4,1,'Terleyince akıyor, yüzümü tahriş etti.','2024-09-05 08:12:48'),(126,101101,2024012,4,5,5,5,'Çok memnun kaldım.','2024-09-05 10:19:48'),(127,101115,2024012,5,4,4,4,'Güzel ürün, teşekkürler.','2024-09-05 13:45:48'),(128,101103,2023011,4,3,5,2,'Su değince akıyor, alerji yaptı.','2024-09-05 16:12:48'),(129,101108,2024400,5,4,4,1,'Burun kısmı sert, çok rahatsız ediyor.','2024-09-05 18:12:48'),(130,101102,2023010,4,3,5,4,'Kargo biraz geç geldi ama ürün iyi.','2024-09-13 11:13:48'),(131,101107,2024012,5,4,4,5,'Başarılı bir ürün.','2024-09-13 14:23:48'),(132,101109,2023011,4,5,5,1,'Alerjik reaksiyon gösterdim, yüzüm yandı.','2024-09-13 18:12:48'),(133,101106,2024400,5,4,4,2,'Burnuma baskı yapıyor, rahatsız.','2024-09-13 18:12:48'),(134,101110,2023011,4,3,5,1,'Yüzümde soyuluyor ve kargo özensizdi.','2024-09-13 22:32:48'),(135,101104,2023651,5,4,4,5,'Güzel ürün, memnun kaldım.','2024-09-23 13:12:48'),(136,101112,2024652,4,5,5,2,'Dikişleri açıldı, kalıbı kötü.','2024-10-08 08:25:54'),(137,101111,2023010,5,3,4,4,'Paketleme özensizdi ama ürün iyi.','2024-10-13 13:25:54'),(138,101103,2023650,4,5,5,5,'Çok güzel bir ürün.','2024-10-13 15:55:54'),(139,101107,2023651,5,4,4,4,'Başarılı bir ürün.','2024-10-22 18:25:54'),(140,101119,2024652,1,2,1,2,'Kargo kutusu ezik, paketleme özensizdi.Şapka yamuk ve boyutu uygun değil. İade için müşteri hizmetlerine bağlanamıyorum.','2024-10-20 14:40:31'),(141,101114,2023011,2,2,3,3,'Ürün patlak geldi, paketleme çok özensiz.\r\nŞikayetimi iletmek için defalarca aramam gerekti.','2024-11-29 14:40:31'),(142,101106,2023010,3,3,4,3,'Biraz yağlı bir dokusu var. Kargo geç geldi, paketleme kötüydü ürünüm zarar görebilirdi.','2024-11-29 14:40:31'),(143,101103,2024400,1,1,1,1,'Ürünüm kırık geldi. Müşteri hizmetleri ilgilenmiyor!','2024-11-10 14:40:31'),(144,101121,2023651,3,3,4,3,'Fena değil, dikişleri biraz zayıf. Kargo şirketi adresimi bulamadı.','2024-11-12 14:40:31'),(145,101116,2024400,3,3,1,1,'Ürünün camlarının kalitesi çok kötü, güneş geçiriyor, boşuna aldım çok kötü bir gözlük. İade etmekte sıkıntı yaşıyorum, müşteri hizmetleri ilgilenmiyor.','2024-11-27 14:40:31'),(146,101105,2023010,1,1,1,1,'Kargo bana ulaşmadı ama teslim edilmiş gözüküyor, para iadesi istiyorum! Müşteri hizmetlerine ulaşamıyorum.','2024-11-22 14:40:31'),(147,101101,2024652,3,3,4,2,'Şapkanın taşları düşüyor.','2024-11-29 14:40:31'),(148,101115,2023650,4,4,5,3,'Kafama uygun değildi. Boyutunda bir sıkıntı var.','2024-12-29 14:40:31'),(149,101108,2024012,4,4,5,2,'Çok yağlı bir dokusu var,beğenmedim.','2024-12-29 14:40:31'),(150,101111,2024401,1,1,1,1,'Ürün kırık geldi.','2024-12-29 14:40:31'),(151,101122,2023651,3,2,4,2,'Şapka yamuk dikilmiş.','2024-12-29 19:44:23'),(152,101123,2024400,2,3,2,1,'Ürün güneş geçiriyor, hiçbir koruması yok. İade için müşteri hizmetlerine başvurdum dönüş yapılmadı. Kargo adresimi bulamadı.','2024-12-27 16:28:23'),(153,101125,2023651,3,3,4,2,'Şapkanın kalıbı çok kötü, kargo çok geç geldi.','2024-12-29 15:48:23'),(153,101125,2024652,3,3,4,2,'Özensiz paketleme, şapkanın taşları birkaç kullanımdan sonra taşları düştü.','2024-12-29 15:48:23'),(154,101124,2024401,4,1,4,3,'Gözlüğün çerçevesi soyulmaya başladı, renk değiştirdi. Kargo paketim yırtık geldi.','2024-12-27 17:58:23'),(155,101125,2023010,4,4,4,2,'Ürün yüzde yapış yapış hissettiriyor.','2024-12-27 13:08:23'),(156,101123,2024012,4,3,4,2,'Ürünün dokusu çok yağlı, sivilce çıkarttı.','2024-12-28 12:48:23'),(157,101122,2024401,4,3,4,2,'Ürünün çerçevesi renk değiştirdi ,soyuldu. Tavsiye etmem.','2024-12-29 15:28:23'),(158,101123,2024401,3,3,4,2,'Ürün geç geldi , paketleme özensizdi. Ürünün çerçevesi soyuluyor, tavsiye etmiyorum.','2024-12-29 15:48:23');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musteriler`
--

DROP TABLE IF EXISTS `musteriler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musteriler` (
  `musteri_id` int NOT NULL,
  `m_ad` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `m_soyad` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `m_eposta` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `m_adres` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  PRIMARY KEY (`musteri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musteriler`
--

LOCK TABLES `musteriler` WRITE;
/*!40000 ALTER TABLE `musteriler` DISABLE KEYS */;
INSERT INTO `musteriler` VALUES (101101,'Melih','Kara','melih.kara@example.com','İzmir'),(101102,'Seyhan','Çelik','seyhan.celik35@example.com','İzmir'),(101103,'Miray','Daner','miray.daner@example.com','İstanbul'),(101104,'Adem','Gürsoy','adem.gürsoy@example.com','Ankara'),(101105,'Buse','Can','busecan@example.com','Kocaeli'),(101106,'Zeynep','Balcı','zeynep.balci@example.com','Kocaeli'),(101107,'Ulaş','Kök','ulaskok@example.com','Balıkesir'),(101108,'Sena','Keskin','sena.keskin@example.com','Balıkesir'),(101109,'Yankı','Doğan','yankeedogan@example.com','İzmir'),(101110,'İpek','Öz','ipekkoz@example.com','İstanbul'),(101111,'Erim','Gün','erimgun@example.com','İstanbul'),(101112,'Ali','Veli','ali.veli@example.com','İzmir'),(101113,'Ayşe','Yılmaz','ayse.yilmaz@example.com','Ankara'),(101114,'Mehmet','Söğüt','mehmet.sogut@example.com','İstanbul'),(101115,'Meryem','Ayna','meryem.ayna@example.com','İzmir'),(101116,'Doğa','Ünal','doga.unal@example.com','İstanbul'),(101117,'Kıvılcım','Arslan','kivilcim.arslan@example.com','Antalya'),(101118,'Aysu','Toprak','aysu.toprak@example.com','Kayseri'),(101119,'Kerem','Ören','kerem.oren@example.com','İzmir'),(101120,'Alev','Kurt','alevvkurt@example.com','Tekirdağ'),(101121,'Can','Karasoy','cankarasoy@example.com','Kayseri'),(101122,'Bedirhan','Kırtan','bedokirtan@example.com','İzmir'),(101123,'Melis','Deniz','melisdeniz@example.com','Tekirdağ'),(101124,'Anıl','Toprak','manavgatli35@example.com','Antalya'),(101125,'Arian','Alagha','arianfora@example.com','Antalya');
/*!40000 ALTER TABLE `musteriler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siparisler`
--

DROP TABLE IF EXISTS `siparisler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siparisler` (
  `siparis_id` int NOT NULL,
  `musteri_id` int NOT NULL,
  `urun_id` int NOT NULL,
  `urun_fiyat` float NOT NULL,
  `adet` int NOT NULL,
  `toplam_tutar` float NOT NULL,
  `tarih` datetime NOT NULL,
  UNIQUE KEY `unique_order_product` (`siparis_id`,`musteri_id`,`urun_id`),
  KEY `musteri_id` (`musteri_id`,`urun_id`),
  KEY `urun_id` (`urun_id`),
  KEY `siparis_id` (`siparis_id`),
  KEY `urun_fiyat` (`urun_fiyat`),
  CONSTRAINT `siparisler_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteriler` (`musteri_id`),
  CONSTRAINT `siparisler_ibfk_2` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siparisler`
--

LOCK TABLES `siparisler` WRITE;
/*!40000 ALTER TABLE `siparisler` DISABLE KEYS */;
INSERT INTO `siparisler` VALUES (1,101120,2023011,780.5,1,780.5,'2024-01-10 09:24:13'),(2,101116,2023011,780.5,1,780.5,'2024-01-10 10:24:17'),(3,101104,2023011,780.5,2,1561,'2024-01-10 10:40:07'),(3,101104,2023651,150,3,450,'2024-01-10 10:40:07'),(4,101118,2023011,780.5,1,780.5,'2024-01-10 10:50:47'),(4,101118,2024012,960.4,1,960.4,'2024-01-10 10:50:47'),(5,101113,2024400,1800,1,1800,'2024-01-10 10:58:07'),(6,101105,2024401,2900,1,2900,'2024-01-10 11:00:37'),(7,101121,2023651,150,2,300,'2024-01-10 11:10:41'),(7,101121,2024401,2900,1,2900,'2024-01-10 11:10:41'),(8,101116,2024652,250,1,250,'2024-01-10 11:25:52'),(9,101111,2024401,2900,1,2900,'2024-01-10 12:46:55'),(10,101119,2023011,780.5,1,780.5,'2024-01-10 14:50:39'),(11,101101,2024652,250,2,500,'2024-01-13 10:52:01'),(12,101115,2023011,780.5,1,780.5,'2024-01-13 16:52:11'),(13,101106,2024400,1800,1,1800,'2024-01-13 18:52:01'),(14,101117,2024401,2900,1,2900,'2024-01-13 20:56:01'),(15,101108,2023011,780.5,1,780.5,'2024-01-19 10:55:58'),(16,101102,2024400,1800,1,1800,'2024-01-19 12:45:58'),(17,101109,2024401,2900,1,2900,'2024-02-04 10:59:04'),(17,101109,2024652,250,1,250,'2024-02-04 10:59:04'),(18,101110,2024012,960.4,2,1920.8,'2024-02-04 11:00:44'),(18,101110,2024400,1800,1,1800,'2024-02-04 11:00:44'),(19,101113,2023010,680.7,1,680.7,'2024-02-04 13:02:53'),(20,101103,2023010,680.7,2,1361.4,'2024-02-04 14:04:37'),(21,101104,2023651,150,2,300,'2024-02-04 14:15:13'),(22,101108,2023010,680.7,1,680.7,'2024-02-12 14:37:41'),(23,101107,2024012,960.4,1,960.4,'2024-02-12 15:36:41'),(24,101121,2023010,680.7,1,680.7,'2024-02-12 16:46:41'),(25,101118,2023010,680.7,1,680.7,'2024-02-22 19:56:41'),(26,101120,2023650,150,2,300,'2024-03-07 12:09:41'),(27,101118,2023650,150,1,150,'2024-03-07 13:15:41'),(28,101113,2023650,150,1,150,'2024-03-07 15:17:41'),(29,101105,2024400,1800,1,1800,'2024-03-10 12:12:42'),(30,101116,2024400,1800,1,1800,'2024-03-10 15:12:42'),(31,101119,2024401,2900,1,2900,'2024-03-10 17:14:42'),(32,101117,2024400,1800,1,1800,'2024-03-14 19:14:42'),(33,101114,2023651,150,2,300,'2024-04-03 11:18:43'),(33,101114,2024401,2900,1,2900,'2024-04-03 11:18:43'),(34,101101,2023651,150,1,150,'2024-04-03 15:18:43'),(35,101115,2023650,150,2,300,'2024-04-14 12:20:43'),(36,101110,2024652,250,3,750,'2024-04-19 15:18:43'),(37,101120,2024400,1800,2,3600,'2024-05-02 09:28:19'),(38,101112,2024401,2900,2,5800,'2024-05-02 10:09:19'),(39,101115,2024400,1800,1,1800,'2024-05-02 13:14:19'),(40,101102,2023650,150,2,300,'2024-05-04 15:28:19'),(41,101106,2024401,2900,1,2900,'2024-05-04 17:39:19'),(42,101107,2023651,150,2,300,'2024-05-17 18:25:19'),(42,101107,2024401,2900,1,2900,'2024-05-17 18:25:19'),(43,101104,2024401,2900,2,5800,'2024-05-25 22:28:19'),(44,101120,2024012,960.4,2,1920.8,'2024-05-28 10:42:19'),(45,101113,2024012,960.4,1,960.4,'2024-05-28 11:11:19'),(46,101105,2024012,960.4,1,960.4,'2024-06-02 12:00:19'),(47,101103,2024400,1800,1,1800,'2024-06-04 11:42:02'),(48,101108,2024400,1800,1,1800,'2024-06-04 13:42:02'),(49,101104,2024012,960.4,1,960.4,'2024-06-04 15:26:02'),(50,101120,2023010,680.7,1,680.7,'2024-06-06 10:30:02'),(51,101112,2023651,150,2,300,'2024-06-06 13:12:02'),(52,101118,2024400,1800,1,1800,'2024-06-06 14:42:02'),(53,101113,2023011,780.5,1,780.5,'2024-06-06 15:10:02'),(54,101105,2023011,780.5,1,780.5,'2024-06-07 09:42:02'),(55,101121,2023011,780.5,1,780.5,'2024-06-07 10:52:02'),(56,101116,2024012,960.4,1,960.4,'2024-06-07 11:42:02'),(57,101111,2023011,780.5,1,780.5,'2024-06-08 12:22:02'),(58,101119,2024012,960.4,2,1920.8,'2024-06-08 13:32:02'),(59,101117,2023010,680.7,2,1361.4,'2024-06-08 14:42:02'),(59,101117,2023650,150,2,300,'2024-06-08 14:42:02'),(60,101114,2023011,780.5,1,780.5,'2024-06-10 09:11:02'),(61,101101,2024401,2900,1,2900,'2024-06-10 13:18:02'),(62,101115,2024012,960.4,2,1920.8,'2024-06-10 14:34:02'),(63,101103,2024012,960.4,2,1920.8,'2024-06-10 15:06:02'),(64,101108,2024012,960.4,1,960.4,'2024-06-10 23:42:02'),(64,101118,2024012,960.4,1,960.4,'2024-06-08 18:04:39'),(65,101102,2024012,960.4,2,1920.8,'2024-06-15 11:07:13'),(66,101107,2024012,960.4,2,1920.8,'2024-06-15 12:27:13'),(67,101109,2024012,960.4,2,1920.8,'2024-06-15 15:03:13'),(68,101106,2023011,780.5,1,780.5,'2024-06-21 10:09:13'),(69,101110,2023011,780.5,2,1561,'2024-06-21 11:11:13'),(70,101104,2024652,250,2,500,'2024-06-22 13:07:13'),(71,101120,2024012,960.4,3,2881.2,'2024-06-22 16:27:13'),(72,101112,2024400,1800,1,1800,'2024-06-22 16:32:13'),(73,101118,2024401,2900,1,2900,'2024-06-22 20:11:13'),(74,101113,2024401,2900,1,2900,'2024-06-30 09:56:13'),(75,101105,2023010,680.7,1,680.7,'2024-06-30 10:10:13'),(76,101121,2024012,960.4,1,960.4,'2024-07-01 11:07:13'),(77,101116,2023010,680.7,1,680.7,'2024-07-01 11:33:13'),(78,101111,2024012,960.4,1,960.4,'2024-07-01 12:01:13'),(79,101119,2023010,680.7,1,680.7,'2024-07-01 12:30:13'),(80,101117,2024012,960.4,1,960.4,'2024-07-01 12:43:13'),(81,101114,2023010,680.7,1,680.7,'2024-07-01 13:22:13'),(82,101101,2023011,780.5,1,780.5,'2024-07-01 16:07:00'),(83,101115,2024012,960.4,1,960.4,'2024-07-02 12:36:41'),(84,101103,2023011,780.5,1,780.5,'2024-07-02 12:47:41'),(85,101108,2024012,960.4,1,960.4,'2024-07-02 13:01:41'),(86,101102,2023011,780.5,1,780.5,'2024-07-02 14:15:41'),(87,101107,2023010,680.7,1,680.7,'2024-07-08 16:36:41'),(88,101109,2023011,780.5,1,780.5,'2024-07-08 19:16:41'),(89,101106,2024012,960.4,1,960.4,'2024-07-08 21:12:41'),(90,101110,2023011,780.5,2,1561,'2024-07-10 10:36:41'),(91,101104,2023010,680.7,2,1361.4,'2024-07-10 13:11:41'),(92,101120,2024401,2900,1,2900,'2024-07-10 16:55:41'),(93,101112,2024012,960.4,2,1920.8,'2024-07-10 19:36:41'),(94,101118,2024401,2900,1,2900,'2024-07-16 16:16:38'),(95,101113,2024012,960.4,2,1920.8,'2024-07-16 17:19:38'),(96,101105,2023650,150,2,300,'2024-07-16 17:45:38'),(97,101121,2024652,250,2,500,'2024-07-16 19:03:38'),(98,101116,2024401,2900,1,2900,'2024-07-16 23:16:38'),(99,101111,2023651,150,2,300,'2024-07-22 11:10:38'),(100,101119,2023651,150,1,150,'2024-07-22 12:15:38'),(101,101117,2023011,780.5,1,780.5,'2024-07-22 15:15:38'),(102,101114,2024012,960.4,1,960.4,'2024-07-22 19:55:38'),(103,101101,2024012,960.4,1,960.4,'2024-07-22 21:16:38'),(104,101115,2023010,680.7,1,680.7,'2024-07-22 23:34:38'),(105,101101,2023010,680.7,1,680.7,'2024-07-26 10:55:59'),(106,101115,2024400,1800,1,1800,'2024-08-10 14:02:59'),(106,101115,2024401,2900,1,2900,'2024-07-26 14:02:59'),(107,101103,2023650,150,3,450,'2024-07-26 18:54:59'),(108,101108,2024652,250,2,500,'2024-07-26 21:55:59'),(109,101102,2023010,680.7,1,680.7,'2024-08-03 09:02:39'),(110,101107,2023011,780.5,1,780.5,'2024-08-03 10:09:39'),(111,101109,2023010,680.7,1,680.7,'2024-08-03 11:32:39'),(112,101106,2023010,680.7,1,680.7,'2024-08-03 13:05:39'),(112,101106,2024400,1800,1,1800,'2024-08-18 13:05:39'),(113,101110,2023010,680.7,1,680.7,'2024-08-03 14:00:39'),(114,101104,2024400,1800,1,1800,'2024-08-03 17:30:39'),(115,101120,2024652,250,2,500,'2024-08-08 13:07:17'),(116,101112,2023011,780.5,1,780.5,'2024-08-08 13:20:17'),(117,101118,2024012,960.4,1,960.4,'2024-08-08 13:32:17'),(118,101113,2024652,250,1,250,'2024-08-08 14:07:17'),(119,101105,2024652,250,1,250,'2024-08-08 17:57:17'),(120,101121,2024012,960.4,1,960.4,'2024-08-08 18:30:17'),(121,101116,2023011,780.5,1,780.5,'2024-08-14 12:12:48'),(122,101111,2023010,680.7,1,680.7,'2024-08-14 14:18:48'),(123,101119,2023010,680.7,1,680.7,'2024-08-14 15:12:48'),(124,101117,2024012,960.4,2,1920.8,'2024-08-14 18:52:48'),(125,101114,2023011,780.5,2,1561,'2024-08-20 08:12:48'),(126,101101,2024012,960.4,2,1920.8,'2024-08-20 10:19:48'),(127,101115,2024012,960.4,2,1920.8,'2024-08-20 13:45:48'),(128,101103,2023011,780.5,2,1561,'2024-08-20 16:12:48'),(129,101108,2024012,960.4,3,2881.2,'2024-08-20 18:12:48'),(129,101108,2024400,250,2,500,'2024-08-20 18:12:48'),(130,101102,2023010,680.7,2,1361.4,'2024-08-28 11:13:48'),(131,101107,2024012,960.4,3,2881.2,'2024-08-28 14:23:48'),(132,101109,2023011,780.5,2,1561,'2024-08-28 18:12:48'),(133,101106,2023010,680.7,3,2042.1,'2024-08-28 18:12:48'),(133,101106,2024400,1800,3,5400,'2024-08-28 18:12:48'),(134,101110,2023011,780.5,2,1561,'2024-08-28 22:32:48'),(135,101104,2023651,150,1,150,'2024-09-08 13:12:48'),(136,101112,2023651,150,1,150,'2024-09-08 08:25:54'),(136,101112,2024652,250,2,500,'2024-10-08 08:25:54'),(137,101111,2023010,680.7,1,680.7,'2024-09-13 13:25:54'),(138,101103,2023650,150,1,150,'2024-09-13 15:55:54'),(139,101107,2023651,150,1,150,'2024-09-22 18:25:54'),(140,101119,2024652,250,1,250,'2024-10-02 13:32:56'),(141,101114,2023011,780.5,1,780.5,'2024-10-02 14:00:56'),(142,101106,2023010,680.7,1,680.7,'2024-10-22 17:02:56'),(143,101103,2024400,1800,1,1800,'2024-10-22 18:42:56'),(144,101121,2023651,150,1,150,'2024-10-23 21:10:56'),(145,101116,2024400,1800,1,1800,'2024-10-27 22:02:56'),(146,101105,2023010,680.7,1,680.7,'2024-11-16 17:31:56'),(147,101101,2024652,250,1,250,'2024-11-22 18:09:56'),(148,101115,2023650,150,1,150,'2024-11-25 19:52:56'),(149,101108,2024012,960.4,1,960.4,'2024-12-21 13:12:56'),(150,101111,2024401,2900,1,2900,'2024-12-22 16:36:56'),(151,101122,2023651,150,1,150,'2024-11-10 15:29:01'),(152,101123,2024400,1800,1,1800,'2024-11-10 15:29:01'),(153,101125,2023651,150,1,150,'2024-11-10 15:29:01'),(153,101125,2024652,250,1,250,'2024-12-10 15:29:01'),(154,101124,2024401,2900,1,2900,'2024-12-23 15:29:01'),(155,101125,2023010,680.7,1,680.7,'2024-12-23 15:29:01'),(156,101123,2024012,960.4,1,960.4,'2024-12-24 15:29:01'),(157,101122,2024401,2900,1,2900,'2024-11-23 15:29:01'),(158,101123,2024401,2900,1,2900,'2024-11-23 16:12:01');
/*!40000 ALTER TABLE `siparisler` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CalculateTotalAmount` BEFORE INSERT ON `siparisler` FOR EACH ROW BEGIN
    SET NEW.toplam_tutar = NEW.adet * NEW.urun_fiyat;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `urunler`
--

DROP TABLE IF EXISTS `urunler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urunler` (
  `urun_id` int NOT NULL,
  `ad` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `kategori` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `fiyat` float NOT NULL,
  PRIMARY KEY (`urun_id`),
  KEY `fiyat` (`fiyat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urunler`
--

LOCK TABLES `urunler` WRITE;
/*!40000 ALTER TABLE `urunler` DISABLE KEYS */;
INSERT INTO `urunler` VALUES (2023010,'Pro-Balance Biotics Clear Up Sun SPF50+ Fiziksel F','Güneş Koruyucu',680.7),(2023011,'Green Fit Sun SPF50+ Hibrit Filtreli Güneş Kremi 5','Güneş Koruyucu',780.5),(2023650,'Kadın Günlük Şapka','Giyim',150),(2023651,'Erkek Günlük Şapka','Giyim',150),(2024012,'Juice Sunscreen Nemlendirici Huş Özlü SPF50+ Kimy','Güneş Koruyucu',960.4),(2024400,'Kadın Güneş Gözlüğü','Aksesuar',1800),(2024401,'Unisex Güneş Gözlüğü','Aksesuar',2900),(2024652,'Koleksiyon Günlük Şapka','Giyim',250);
/*!40000 ALTER TABLE `urunler` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-31 14:18:00
