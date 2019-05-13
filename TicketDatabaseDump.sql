CREATE DATABASE  IF NOT EXISTS `ticketsdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ticketsdb`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: mysqltickets.mysql.database.azure.com    Database: ticketsdb
-- ------------------------------------------------------
-- Server version	5.6.39.0

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CityZip` varchar(10) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CityZip_Cities_idx` (`CityZip`),
  CONSTRAINT `FK_Adresses_CityZip_Cities` FOREIGN KEY (`CityZip`) REFERENCES `cities` (`ZipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Automatikvej1','2800'),(2,'Kongens Nytorv 9','1050'),(14,'Gl. Kongevej 29','1610'),(20,'Nyborggade 17','2100'),(29,'Winterfell 7','2300'),(30,'Ballerup Campus','2750'),(36,'test','2800'),(37,'Lyngeren','2830'),(59,'TestAdress','2200'),(61,'TestWAddressm','2400'),(63,'TestWB','2800'),(65,'TestWB 23','2800'),(66,'TestWB 23','1021'),(67,'TestWB 234','1021'),(68,'TestAdress2','1601'),(69,'TestAdress25','1601'),(70,'Brordrupvej 3','3790'),(73,'Brordrupvej 4','4000'),(75,'Brordrupvej','4000'),(76,'Kingslanding 14','2300'),(83,'Fuck Cersie','2300'),(84,'Fuck Cersie','2200'),(89,'Brordrupvej','2000'),(90,'Lyngeren','4000');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookedseats`
--

DROP TABLE IF EXISTS `bookedseats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookedseats` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Booking_ID` int(11) NOT NULL,
  `Seat_ID` int(11) NOT NULL,
  `BookedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Booked_Date_UNIQUE` (`BookedDate`,`Seat_ID`),
  KEY `FK_BookedSeats_Show_ID_Shows_idx` (`Seat_ID`),
  KEY `FK_BookedSeats_Booking_ID_Bookings_idx` (`Booking_ID`),
  CONSTRAINT `FK_BookedSeats_Booking_ID_Bookings` FOREIGN KEY (`Booking_ID`) REFERENCES `bookings` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_BookedSeats_Show_ID_Shows` FOREIGN KEY (`Seat_ID`) REFERENCES `seats` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookedseats`
--

LOCK TABLES `bookedseats` WRITE;
/*!40000 ALTER TABLE `bookedseats` DISABLE KEYS */;
INSERT INTO `bookedseats` VALUES (3,4,21,'2019-06-05 20:00:00'),(4,4,22,'2019-06-05 20:00:00'),(5,4,23,'2019-06-05 20:00:00'),(6,4,24,'2019-06-05 20:00:00'),(10,5,31,'2019-06-05 20:00:00'),(11,5,32,'2019-06-05 20:00:00'),(12,5,33,'2019-06-05 20:00:00'),(13,5,34,'2019-06-05 20:00:00'),(20,7,36,'2019-06-06 08:00:00'),(21,7,37,'2019-06-06 08:00:00'),(48,23,21,'2019-06-07 06:00:00'),(49,23,22,'2019-06-07 06:00:00'),(50,23,23,'2019-06-07 06:00:00'),(51,24,62,'2019-06-05 06:00:00'),(52,24,63,'2019-06-05 06:00:00'),(53,24,64,'2019-06-05 06:00:00'),(54,26,11,'2019-06-06 06:00:00'),(55,26,12,'2019-06-06 06:00:00'),(56,26,13,'2019-06-06 06:00:00'),(59,31,95,'2019-06-01 18:00:00'),(61,35,174,'2019-11-12 18:00:00'),(62,35,175,'2019-11-12 18:00:00');
/*!40000 ALTER TABLE `bookedseats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer_ID` varchar(10) NOT NULL,
  `Show_ID` int(11) NOT NULL,
  `BookedDate` datetime NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Booking_Show_ID_Shows_idx` (`Show_ID`),
  KEY `FK_Booking_Customer_ID_Customers_idx` (`Customer_ID`),
  CONSTRAINT `FK_Booking_Customer_ID_Customers` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Booking_Show_ID_Shows` FOREIGN KEY (`Show_ID`) REFERENCES `shows` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (4,'s175120',3,'2019-06-05 20:00:00',1700.00),(5,'s175120',3,'2019-06-05 20:00:00',1750.00),(7,'s175120',2,'2019-06-06 08:00:00',675.00),(23,'s175120',2,'2019-06-07 06:00:00',1260.00),(24,'s175120',2,'2019-06-05 06:00:00',900.00),(25,'s175120',2,'2019-06-06 06:00:00',900.00),(26,'s175120',2,'2019-06-06 06:00:00',923.00),(27,'s175120',3,'2019-06-01 18:00:00',1613.00),(28,'s175120',2,'2019-06-07 06:00:00',1763.00),(31,'s155576',3,'2019-06-01 18:00:00',700.00),(35,'s155576',8,'2019-11-12 18:00:00',860.00),(37,'s175107',10,'2019-10-12 17:00:00',1935.00),(38,'s175120',8,'2019-07-12 17:00:00',1470.00),(39,'s175120',10,'2019-10-12 17:00:00',5940.00),(40,'s164404',2,'2019-06-07 08:00:00',1058.00);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `ZipCode` varchar(10) CHARACTER SET utf8 NOT NULL,
  `CityName` varchar(45) CHARACTER SET utf8 NOT NULL,
  `CountryCode` varchar(5) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ZipCode`),
  KEY `FK_CountryCode_Countries_idx` (`CountryCode`),
  CONSTRAINT `FK_Cities_CountryCode_Countries` FOREIGN KEY (`CountryCode`) REFERENCES `countries` (`CountryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('0555','Scanning','DK'),('0783','Facility','DK'),('0800','Høje Taastrup','DK'),('0877','København C','DK'),('0892','Sjælland USF P','DK'),('0893','Sjælland USF B','DK'),('0894','Udbetaling','DK'),('0899','Kommuneservice','DK'),('0900','København C','DK'),('0910','København C','DK'),('0914','Københavns Pakkecenter','DK'),('0917','Københavns Pakkecenter','DK'),('0918','Københavns Pakke BRC','DK'),('0919','Returprint BRC','DK'),('0929','København C','DK'),('0960','Internationalt Postcenter','DK'),('0999','København C','DK'),('1001','København K','DK'),('1002','København K','DK'),('1003','København K','DK'),('1004','København K','DK'),('1005','København K','DK'),('1006','København K','DK'),('1007','København K','DK'),('1008','København K','DK'),('1009','København K','DK'),('1010','København K','DK'),('1011','København K','DK'),('1012','København K','DK'),('1013','København K','DK'),('1014','København K','DK'),('1015','København K','DK'),('1016','København K','DK'),('1017','København K','DK'),('1018','København K','DK'),('1019','København K','DK'),('1020','København K','DK'),('1021','København K','DK'),('1022','København K','DK'),('1023','København K','DK'),('1024','København K','DK'),('1025','København K','DK'),('1026','København K','DK'),('1045','København K','DK'),('1050','København K','DK'),('1051','København K','DK'),('1052','København K','DK'),('1053','København K','DK'),('1054','København K','DK'),('1055','København K','DK'),('1056','København K','DK'),('1057','København K','DK'),('1058','København K','DK'),('1059','København K','DK'),('1060','København K','DK'),('1061','København K','DK'),('1062','København K','DK'),('1063','København K','DK'),('1064','København K','DK'),('1065','København K','DK'),('1066','København K','DK'),('1067','København K','DK'),('1068','København K','DK'),('1069','København K','DK'),('1070','København K','DK'),('1071','København K','DK'),('1072','København K','DK'),('1073','København K','DK'),('1074','København K','DK'),('1092','København K','DK'),('1093','København K','DK'),('1095','København K','DK'),('1098','København K','DK'),('1100','København K','DK'),('1101','København K','DK'),('1102','København K','DK'),('1103','København K','DK'),('1104','København K','DK'),('1105','København K','DK'),('1106','København K','DK'),('1107','København K','DK'),('1110','København K','DK'),('1111','København K','DK'),('1112','København K','DK'),('1113','København K','DK'),('1114','København K','DK'),('1115','København K','DK'),('1116','København K','DK'),('1117','København K','DK'),('1118','København K','DK'),('1119','København K','DK'),('1120','København K','DK'),('1121','København K','DK'),('1122','København K','DK'),('1123','København K','DK'),('1124','København K','DK'),('1125','København K','DK'),('1126','København K','DK'),('1127','København K','DK'),('1128','København K','DK'),('1129','København K','DK'),('1130','København K','DK'),('1131','København K','DK'),('1140','København K','DK'),('1147','København K','DK'),('1148','København K','DK'),('1150','København K','DK'),('1151','København K','DK'),('1152','København K','DK'),('1153','København K','DK'),('1154','København K','DK'),('1155','København K','DK'),('1156','København K','DK'),('1157','København K','DK'),('1158','København K','DK'),('1159','København K','DK'),('1160','København K','DK'),('1161','København K','DK'),('1162','København K','DK'),('1164','København K','DK'),('1165','København K','DK'),('1166','København K','DK'),('1167','København K','DK'),('1168','København K','DK'),('1169','København K','DK'),('1170','København K','DK'),('1171','København K','DK'),('1172','København K','DK'),('1173','København K','DK'),('1174','København K','DK'),('1175','København K','DK'),('1200','København K','DK'),('1201','København K','DK'),('1202','København K','DK'),('1203','København K','DK'),('1204','København K','DK'),('1205','København K','DK'),('1206','København K','DK'),('1207','København K','DK'),('1208','København K','DK'),('1209','København K','DK'),('1210','København K','DK'),('1211','København K','DK'),('1212','København K','DK'),('1213','København K','DK'),('1214','København K','DK'),('1215','København K','DK'),('1216','København K','DK'),('1217','København K','DK'),('1218','København K','DK'),('1219','København K','DK'),('1220','København K','DK'),('1221','København K','DK'),('1240','København K','DK'),('1250','København K','DK'),('1251','København K','DK'),('1252','København K','DK'),('1253','København K','DK'),('1254','København K','DK'),('1255','København K','DK'),('1256','København K','DK'),('1257','København K','DK'),('1259','København K','DK'),('1260','København K','DK'),('1261','København K','DK'),('1263','København K','DK'),('1264','København K','DK'),('1265','København K','DK'),('1266','København K','DK'),('1267','København K','DK'),('1268','København K','DK'),('1270','København K','DK'),('1271','København K','DK'),('1300','København K','DK'),('1301','København K','DK'),('1302','København K','DK'),('1303','København K','DK'),('1304','København K','DK'),('1306','København K','DK'),('1307','København K','DK'),('1308','København K','DK'),('1309','København K','DK'),('1310','København K','DK'),('1311','København K','DK'),('1312','København K','DK'),('1313','København K','DK'),('1314','København K','DK'),('1315','København K','DK'),('1316','København K','DK'),('1317','København K','DK'),('1318','København K','DK'),('1319','København K','DK'),('1320','København K','DK'),('1321','København K','DK'),('1322','København K','DK'),('1323','København K','DK'),('1324','København K','DK'),('1325','København K','DK'),('1326','København K','DK'),('1327','København K','DK'),('1328','København K','DK'),('1329','København K','DK'),('1350','København K','DK'),('1352','København K','DK'),('1353','København K','DK'),('1354','København K','DK'),('1355','København K','DK'),('1356','København K','DK'),('1357','København K','DK'),('1358','København K','DK'),('1359','København K','DK'),('1360','København K','DK'),('1361','København K','DK'),('1362','København K','DK'),('1363','København K','DK'),('1364','København K','DK'),('1365','København K','DK'),('1366','København K','DK'),('1367','København K','DK'),('1368','København K','DK'),('1369','København K','DK'),('1370','København K','DK'),('1371','København K','DK'),('1400','København K','DK'),('1401','København K','DK'),('1402','København K','DK'),('1403','København K','DK'),('1406','København K','DK'),('1407','København K','DK'),('1408','København K','DK'),('1409','København K','DK'),('1410','København K','DK'),('1411','København K','DK'),('1412','København K','DK'),('1413','København K','DK'),('1414','København K','DK'),('1415','København K','DK'),('1416','København K','DK'),('1417','København K','DK'),('1418','København K','DK'),('1419','København K','DK'),('1420','København K','DK'),('1421','København K','DK'),('1422','København K','DK'),('1423','København K','DK'),('1424','København K','DK'),('1425','København K','DK'),('1426','København K','DK'),('1427','København K','DK'),('1428','København K','DK'),('1429','København K','DK'),('1430','København K','DK'),('1432','København K','DK'),('1433','København K','DK'),('1434','København K','DK'),('1435','København K','DK'),('1436','København K','DK'),('1437','København K','DK'),('1438','København K','DK'),('1439','København K','DK'),('1440','København K','DK'),('1441','København K','DK'),('1448','København K','DK'),('1450','København K','DK'),('1451','København K','DK'),('1452','København K','DK'),('1453','København K','DK'),('1454','København K','DK'),('1455','København K','DK'),('1456','København K','DK'),('1457','København K','DK'),('1458','København K','DK'),('1459','København K','DK'),('1460','København K','DK'),('1461','København K','DK'),('1462','København K','DK'),('1463','København K','DK'),('1464','København K','DK'),('1465','København K','DK'),('1466','København K','DK'),('1467','København K','DK'),('1468','København K','DK'),('1470','København K','DK'),('1471','København K','DK'),('1472','København K','DK'),('1473','København K','DK'),('1500','København V','DK'),('1501','København V','DK'),('1502','København V','DK'),('1503','København V','DK'),('1504','København V','DK'),('1505','København V','DK'),('1506','København V','DK'),('1507','København V','DK'),('1508','København V','DK'),('1509','København V','DK'),('1510','København V','DK'),('1512','Returpost','DK'),('1513','Flytninger og Nejtak','DK'),('1532','København V','DK'),('1533','København V','DK'),('1550','København V','DK'),('1551','København V','DK'),('1552','København V','DK'),('1553','København V','DK'),('1554','København V','DK'),('1555','København V','DK'),('1556','København V','DK'),('1557','København V','DK'),('1558','København V','DK'),('1559','København V','DK'),('1560','København V','DK'),('1561','København V','DK'),('1562','København V','DK'),('1563','København V','DK'),('1564','København V','DK'),('1567','København V','DK'),('1568','København V','DK'),('1569','København V','DK'),('1570','København V','DK'),('1571','København V','DK'),('1572','København V','DK'),('1573','København V','DK'),('1574','København V','DK'),('1575','København V','DK'),('1576','København V','DK'),('1577','København V','DK'),('1592','København V','DK'),('1599','København V','DK'),('1600','København V','DK'),('1601','København V','DK'),('1602','København V','DK'),('1603','København V','DK'),('1604','København V','DK'),('1605','København V','DK'),('1606','København V','DK'),('1607','København V','DK'),('1608','København V','DK'),('1609','København V','DK'),('1610','København V','DK'),('1611','København V','DK'),('1612','København V','DK'),('1613','København V','DK'),('1614','København V','DK'),('1615','København V','DK'),('1616','København V','DK'),('1617','København V','DK'),('1618','København V','DK'),('1619','København V','DK'),('1620','København V','DK'),('1621','København V','DK'),('1622','København V','DK'),('1623','København V','DK'),('1624','København V','DK'),('1630','København V','DK'),('1631','København V','DK'),('1632','København V','DK'),('1633','København V','DK'),('1634','København V','DK'),('1635','København V','DK'),('1650','København V','DK'),('1651','København V','DK'),('1652','København V','DK'),('1653','København V','DK'),('1654','København V','DK'),('1655','København V','DK'),('1656','København V','DK'),('1657','København V','DK'),('1658','København V','DK'),('1659','København V','DK'),('1660','København V','DK'),('1661','København V','DK'),('1662','København V','DK'),('1663','København V','DK'),('1664','København V','DK'),('1665','København V','DK'),('1666','København V','DK'),('1667','København V','DK'),('1668','København V','DK'),('1669','København V','DK'),('1670','København V','DK'),('1671','København V','DK'),('1672','København V','DK'),('1673','København V','DK'),('1674','København V','DK'),('1675','København V','DK'),('1676','København V','DK'),('1677','København V','DK'),('1699','København V','DK'),('1700','København V','DK'),('1701','København V','DK'),('1702','København V','DK'),('1703','København V','DK'),('1704','København V','DK'),('1705','København V','DK'),('1706','København V','DK'),('1707','København V','DK'),('1708','København V','DK'),('1709','København V','DK'),('1710','København V','DK'),('1711','København V','DK'),('1712','København V','DK'),('1714','København V','DK'),('1715','København V','DK'),('1716','København V','DK'),('1717','København V','DK'),('1718','København V','DK'),('1719','København V','DK'),('1720','København V','DK'),('1721','København V','DK'),('1722','København V','DK'),('1723','København V','DK'),('1724','København V','DK'),('1725','København V','DK'),('1726','København V','DK'),('1727','København V','DK'),('1728','København V','DK'),('1729','København V','DK'),('1730','København V','DK'),('1731','København V','DK'),('1732','København V','DK'),('1733','København V','DK'),('1734','København V','DK'),('1735','København V','DK'),('1736','København V','DK'),('1737','København V','DK'),('1738','København V','DK'),('1739','København V','DK'),('1749','København V','DK'),('1750','København V','DK'),('1751','København V','DK'),('1752','København V','DK'),('1753','København V','DK'),('1754','København V','DK'),('1755','København V','DK'),('1756','København V','DK'),('1757','København V','DK'),('1758','København V','DK'),('1759','København V','DK'),('1760','København V','DK'),('1761','København V','DK'),('1762','København V','DK'),('1763','København V','DK'),('1764','København V','DK'),('1765','København V','DK'),('1766','København V','DK'),('1770','København V','DK'),('1771','København V','DK'),('1772','København V','DK'),('1773','København V','DK'),('1774','København V','DK'),('1775','København V','DK'),('1777','København V','DK'),('1780','København V','DK'),('1782','København V','DK'),('1785','København V','DK'),('1786','København V','DK'),('1787','København V','DK'),('1790','København V','DK'),('1799','København V','DK'),('1800','Frederiksberg C','DK'),('1801','Frederiksberg C','DK'),('1802','Frederiksberg C','DK'),('1803','Frederiksberg C','DK'),('1804','Frederiksberg C','DK'),('1805','Frederiksberg C','DK'),('1806','Frederiksberg C','DK'),('1807','Frederiksberg C','DK'),('1808','Frederiksberg C','DK'),('1809','Frederiksberg C','DK'),('1810','Frederiksberg C','DK'),('1811','Frederiksberg C','DK'),('1812','Frederiksberg C','DK'),('1813','Frederiksberg C','DK'),('1814','Frederiksberg C','DK'),('1815','Frederiksberg C','DK'),('1816','Frederiksberg C','DK'),('1817','Frederiksberg C','DK'),('1818','Frederiksberg C','DK'),('1819','Frederiksberg C','DK'),('1820','Frederiksberg C','DK'),('1822','Frederiksberg C','DK'),('1823','Frederiksberg C','DK'),('1824','Frederiksberg C','DK'),('1825','Frederiksberg C','DK'),('1826','Frederiksberg C','DK'),('1827','Frederiksberg C','DK'),('1828','Frederiksberg C','DK'),('1829','Frederiksberg C','DK'),('1835','Frederiksberg C','DK'),('1850','Frederiksberg C','DK'),('1851','Frederiksberg C','DK'),('1852','Frederiksberg C','DK'),('1853','Frederiksberg C','DK'),('1854','Frederiksberg C','DK'),('1855','Frederiksberg C','DK'),('1856','Frederiksberg C','DK'),('1857','Frederiksberg C','DK'),('1860','Frederiksberg C','DK'),('1861','Frederiksberg C','DK'),('1862','Frederiksberg C','DK'),('1863','Frederiksberg C','DK'),('1864','Frederiksberg C','DK'),('1865','Frederiksberg C','DK'),('1866','Frederiksberg C','DK'),('1867','Frederiksberg C','DK'),('1868','Frederiksberg C','DK'),('1870','Frederiksberg C','DK'),('1871','Frederiksberg C','DK'),('1872','Frederiksberg C','DK'),('1873','Frederiksberg C','DK'),('1874','Frederiksberg C','DK'),('1875','Frederiksberg C','DK'),('1876','Frederiksberg C','DK'),('1877','Frederiksberg C','DK'),('1878','Frederiksberg C','DK'),('1879','Frederiksberg C','DK'),('1900','Frederiksberg C','DK'),('1901','Frederiksberg C','DK'),('1902','Frederiksberg C','DK'),('1903','Frederiksberg C','DK'),('1904','Frederiksberg C','DK'),('1905','Frederiksberg C','DK'),('1906','Frederiksberg C','DK'),('1908','Frederiksberg C','DK'),('1909','Frederiksberg C','DK'),('1910','Frederiksberg C','DK'),('1911','Frederiksberg C','DK'),('1912','Frederiksberg C','DK'),('1913','Frederiksberg C','DK'),('1914','Frederiksberg C','DK'),('1915','Frederiksberg C','DK'),('1916','Frederiksberg C','DK'),('1917','Frederiksberg C','DK'),('1920','Frederiksberg C','DK'),('1921','Frederiksberg C','DK'),('1922','Frederiksberg C','DK'),('1923','Frederiksberg C','DK'),('1924','Frederiksberg C','DK'),('1925','Frederiksberg C','DK'),('1926','Frederiksberg C','DK'),('1927','Frederiksberg C','DK'),('1928','Frederiksberg C','DK'),('1931','Frederiksberg C','DK'),('1950','Frederiksberg C','DK'),('1951','Frederiksberg C','DK'),('1952','Frederiksberg C','DK'),('1953','Frederiksberg C','DK'),('1954','Frederiksberg C','DK'),('1955','Frederiksberg C','DK'),('1956','Frederiksberg C','DK'),('1957','Frederiksberg C','DK'),('1958','Frederiksberg C','DK'),('1959','Frederiksberg C','DK'),('1960','Frederiksberg C','DK'),('1961','Frederiksberg C','DK'),('1962','Frederiksberg C','DK'),('1963','Frederiksberg C','DK'),('1964','Frederiksberg C','DK'),('1965','Frederiksberg C','DK'),('1966','Frederiksberg C','DK'),('1967','Frederiksberg C','DK'),('1970','Frederiksberg C','DK'),('1971','Frederiksberg C','DK'),('1972','Frederiksberg C','DK'),('1973','Frederiksberg C','DK'),('1974','Frederiksberg C','DK'),('2000','Frederiksberg','DK'),('2100','København Ø','DK'),('2150','Nordhavn','DK'),('2200','København N','DK'),('2300','København S','DK'),('2400','København NV','DK'),('2412','Grønland','DK'),('2450','København SV','DK'),('2500','Valby','DK'),('2600','Glostrup','DK'),('2605','Brøndby','DK'),('2610','Rødovre','DK'),('2620','Albertslund','DK'),('2625','Vallensbæk','DK'),('2630','Taastrup','DK'),('2635','Ishøj','DK'),('2640','Hedehusene','DK'),('2650','Hvidovre','DK'),('2660','Brøndby Strand','DK'),('2665','Vallensbæk Strand','DK'),('2670','Greve','DK'),('2680','Solrød Strand','DK'),('2690','Karlslunde','DK'),('2700','Brønshøj','DK'),('2720','Vanløse','DK'),('2730','Herlev','DK'),('2740','Skovlunde','DK'),('2750','Ballerup','DK'),('2760','Måløv','DK'),('2765','Smørum','DK'),('2770','Kastrup','DK'),('2791','Dragør','DK'),('2800','Lyngby','DK'),('2820','Gentofte','DK'),('2830','Virum','DK'),('2840','Holte','DK'),('2850','Nærum','DK'),('2860','Søborg','DK'),('2870','Dyssegård','DK'),('2880','Bagsværd','DK'),('2900','Hellerup','DK'),('2920','Charlottenlund','DK'),('2930','Klampenborg','DK'),('2942','Skodsborg','DK'),('2950','Vedbæk','DK'),('2960','Rungsted Kyst','DK'),('2970','Hørsholm','DK'),('2980','Kokkedal','DK'),('2990','Nivå','DK'),('3000','Helsingør','DK'),('3050','Humlebæk','DK'),('3060','Espergærde','DK'),('3070','Snekkersten','DK'),('3080','Tikøb','DK'),('3100','Hornbæk','DK'),('3120','Dronningmølle','DK'),('3140','Ålsgårde','DK'),('3150','Hellebæk','DK'),('3200','Helsinge','DK'),('3210','Vejby','DK'),('3220','Tisvildeleje','DK'),('3230','Græsted','DK'),('3250','Gilleleje','DK'),('3300','Frederiksværk','DK'),('3310','Ølsted','DK'),('3320','Skævinge','DK'),('3330','Gørløse','DK'),('3360','Liseleje','DK'),('3370','Melby','DK'),('3390','Hundested','DK'),('3400','Hillerød','DK'),('3450','Allerød','DK'),('3460','Birkerød','DK'),('3480','Fredensborg','DK'),('3490','Kvistgård','DK'),('3500','Værløse','DK'),('3520','Farum','DK'),('3540','Lynge','DK'),('3550','Slangerup','DK'),('3600','Frederikssund','DK'),('3630','Jægerspris','DK'),('3650','Ølstykke','DK'),('3660','Stenløse','DK'),('3670','Veksø Sjælland','DK'),('3700','Rønne','DK'),('3720','Aakirkeby','DK'),('3730','Nexø','DK'),('3740','Svaneke','DK'),('3751','Østermarie','DK'),('3760','Gudhjem','DK'),('3770','Allinge','DK'),('3782','Klemensker','DK'),('3790','Hasle','DK'),('4000','Roskilde','DK'),('4030','Tune','DK'),('4040','Jyllinge','DK'),('4050','Skibby','DK'),('4060','Kirke Såby','DK'),('4070','Kirke Hyllinge','DK'),('4100','Ringsted','DK'),('4129','Ringsted','DK'),('4130','Viby Sjælland','DK'),('4140','Borup','DK'),('4160','Herlufmagle','DK'),('4171','Glumsø','DK'),('4173','Fjenneslev','DK'),('4174','Jystrup Midtsj','DK'),('4180','Sorø','DK'),('4190','Munke Bjergby','DK'),('4200','Slagelse','DK'),('4220','Korsør','DK'),('4230','Skælskør','DK'),('4241','Vemmelev','DK'),('4242','Boeslunde','DK'),('4243','Rude','DK'),('4244','Agersø','DK'),('4245','Omø','DK'),('4250','Fuglebjerg','DK'),('4261','Dalmose','DK'),('4262','Sandved','DK'),('4270','Høng','DK'),('4281','Gørlev','DK'),('4291','Ruds Vedby','DK'),('4293','Dianalund','DK'),('4295','Stenlille','DK'),('4296','Nyrup','DK'),('4300','Holbæk','DK'),('4305','Orø','DK'),('4320','Lejre','DK'),('4330','Hvalsø','DK'),('4340','Tølløse','DK'),('4350','Ugerløse','DK'),('4360','Kirke Eskilstrup','DK'),('4370','Store Merløse','DK'),('4390','Vipperød','DK'),('4400','Kalundborg','DK'),('4420','Regstrup','DK'),('4440','Mørkøv','DK'),('4450','Jyderup','DK'),('4460','Snertinge','DK'),('4470','Svebølle','DK'),('4480','Store Fuglede','DK'),('4490','Jerslev Sjælland','DK'),('4500','Nykøbing Sj','DK'),('4520','Svinninge','DK'),('4532','Gislinge','DK'),('4534','Hørve','DK'),('4540','Fårevejle','DK'),('4550','Asnæs','DK'),('4560','Vig','DK'),('4571','Grevinge','DK'),('4572','Nørre Asmindrup','DK'),('4573','Højby','DK'),('4581','Rørvig','DK'),('4583','Sjællands Odde','DK'),('4591','Føllenslev','DK'),('4592','Sejerø','DK'),('4593','Eskebjerg','DK'),('4600','Køge','DK'),('4621','Gadstrup','DK'),('4622','Havdrup','DK'),('4623','Lille Skensved','DK'),('4632','Bjæverskov','DK'),('4640','Faxe','DK'),('4652','Hårlev','DK'),('4653','Karise','DK'),('4654','Faxe Ladeplads','DK'),('4660','Store Heddinge','DK'),('4671','Strøby','DK'),('4672','Klippinge','DK'),('4673','Rødvig Stevns','DK'),('4681','Herfølge','DK'),('4682','Tureby','DK'),('4683','Rønnede','DK'),('4684','Holmegaard','DK'),('4690','Haslev','DK'),('4700','Næstved','DK'),('4720','Præstø','DK'),('4733','Tappernøje','DK'),('4735','Mern','DK'),('4736','Karrebæksminde','DK'),('4750','Lundby','DK'),('4760','Vordingborg','DK'),('4771','Kalvehave','DK'),('4772','Langebæk','DK'),('4773','Stensved','DK'),('4780','Stege','DK'),('4791','Borre','DK'),('4792','Askeby','DK'),('4793','Bogø By','DK'),('4800','Nykøbing F','DK'),('4840','Nørre Alslev','DK'),('4850','Stubbekøbing','DK'),('4862','Guldborg','DK'),('4863','Eskilstrup','DK'),('4871','Horbelev','DK'),('4872','Idestrup','DK'),('4873','Væggerløse','DK'),('4874','Gedser','DK'),('4880','Nysted','DK'),('4891','Toreby L','DK'),('4892','Kettinge','DK'),('4894','Øster Ulslev','DK'),('4895','Errindlev','DK'),('4900','Nakskov','DK'),('4912','Harpelunde','DK'),('4913','Horslunde','DK'),('4920','Søllested','DK'),('4930','Maribo','DK'),('4941','Bandholm','DK'),('4942','Askø og Lilleø','DK'),('4943','Torrig L','DK'),('4944','Fejø','DK'),('4945','Femø','DK'),('4951','Nørreballe','DK'),('4952','Stokkemarke','DK'),('4953','Vesterborg','DK'),('4960','Holeby','DK'),('4970','Rødby','DK'),('4983','Dannemare','DK'),('4990','Sakskøbing','DK'),('4992','Midtsjælland USF P','DK'),('5000','Odense C','DK'),('5029','Odense C','DK'),('5100','Odense C','DK'),('5200','Odense V','DK'),('5210','Odense NV','DK'),('5220','Odense SØ','DK'),('5230','Odense M','DK'),('5240','Odense NØ','DK'),('5250','Odense SV','DK'),('5260','Odense S','DK'),('5270','Odense N','DK'),('5290','Marslev','DK'),('5300','Kerteminde','DK'),('5320','Agedrup','DK'),('5330','Munkebo','DK'),('5350','Rynkeby','DK'),('5370','Mesinge','DK'),('5380','Dalby','DK'),('5390','Martofte','DK'),('5400','Bogense','DK'),('5450','Otterup','DK'),('5462','Morud','DK'),('5463','Harndrup','DK'),('5464','Brenderup Fyn','DK'),('5466','Asperup','DK'),('5471','Søndersø','DK'),('5474','Veflinge','DK'),('5485','Skamby','DK'),('5491','Blommenslyst','DK'),('5492','Vissenbjerg','DK'),('5500','Middelfart','DK'),('5540','Ullerslev','DK'),('5550','Langeskov','DK'),('5560','Aarup','DK'),('5580','Nørre Aaby','DK'),('5591','Gelsted','DK'),('5592','Ejby','DK'),('5600','Faaborg','DK'),('5601','Lyø','DK'),('5602','Avernakø','DK'),('5603','Bjørnø','DK'),('5610','Assens','DK'),('5620','Glamsbjerg','DK'),('5631','Ebberup','DK'),('5642','Millinge','DK'),('5672','Broby','DK'),('5683','Haarby','DK'),('5690','Tommerup','DK'),('5700','Svendborg','DK'),('5750','Ringe','DK'),('5762','Vester Skerninge','DK'),('5771','Stenstrup','DK'),('5772','Kværndrup','DK'),('5792','Årslev','DK'),('5800','Nyborg','DK'),('5853','Ørbæk','DK'),('5854','Gislev','DK'),('5856','Ryslinge','DK'),('5863','Ferritslev Fyn','DK'),('5871','Frørup','DK'),('5874','Hesselager','DK'),('5881','Skårup Fyn','DK'),('5882','Vejstrup','DK'),('5883','Oure','DK'),('5884','Gudme','DK'),('5892','Gudbjerg Sydfyn','DK'),('5900','Rudkøbing','DK'),('5932','Humble','DK'),('5935','Bagenkop','DK'),('5943','Strynø','DK'),('5953','Tranekær','DK'),('5960','Marstal','DK'),('5965','Birkholm','DK'),('5970','Ærøskøbing','DK'),('5985','Søby Ærø','DK'),('6000','Kolding','DK'),('6040','Egtved','DK'),('6051','Almind','DK'),('6052','Viuf','DK'),('6064','Jordrup','DK'),('6070','Christiansfeld','DK'),('6091','Bjert','DK'),('6092','Sønder Stenderup','DK'),('6093','Sjølund','DK'),('6094','Hejls','DK'),('6100','Haderslev','DK'),('6200','Aabenraa','DK'),('6210','Barsø','DK'),('6230','Rødekro','DK'),('6240','Løgumkloster','DK'),('6261','Bredebro','DK'),('6270','Tønder','DK'),('6280','Højer','DK'),('6300','Gråsten','DK'),('6310','Broager','DK'),('6320','Egernsund','DK'),('6330','Padborg','DK'),('6340','Kruså','DK'),('6360','Tinglev','DK'),('6372','Bylderup-Bov','DK'),('6392','Bolderslev','DK'),('6400','Sønderborg','DK'),('6430','Nordborg','DK'),('6440','Augustenborg','DK'),('6470','Sydals','DK'),('6500','Vojens','DK'),('6510','Gram','DK'),('6520','Toftlund','DK'),('6534','Agerskov','DK'),('6535','Branderup J','DK'),('6541','Bevtoft','DK'),('6560','Sommersted','DK'),('6580','Vamdrup','DK'),('6600','Vejen','DK'),('6621','Gesten','DK'),('6622','Bække','DK'),('6623','Vorbasse','DK'),('6630','Rødding','DK'),('6640','Lunderskov','DK'),('6650','Brørup','DK'),('6660','Lintrup','DK'),('6670','Holsted','DK'),('6682','Hovborg','DK'),('6683','Føvling','DK'),('6690','Gørding','DK'),('6700','Esbjerg','DK'),('6701','Esbjerg','DK'),('6705','Esbjerg Ø','DK'),('6710','Esbjerg V','DK'),('6715','Esbjerg N','DK'),('6720','Fanø','DK'),('6731','Tjæreborg','DK'),('6740','Bramming','DK'),('6752','Glejbjerg','DK'),('6753','Agerbæk','DK'),('6760','Ribe','DK'),('6771','Gredstedbro','DK'),('6780','Skærbæk','DK'),('6792','Rømø','DK'),('6800','Varde','DK'),('6818','Årre','DK'),('6823','Ansager','DK'),('6830','Nørre Nebel','DK'),('6840','Oksbøl','DK'),('6851','Janderup Vestj','DK'),('6852','Billum','DK'),('6853','Vejers Strand','DK'),('6854','Henne','DK'),('6855','Outrup','DK'),('6857','Blåvand','DK'),('6862','Tistrup','DK'),('6870','Ølgod','DK'),('6880','Tarm','DK'),('6893','Hemmet','DK'),('6900','Skjern','DK'),('6920','Videbæk','DK'),('6933','Kibæk','DK'),('6940','Lem St','DK'),('6950','Ringkøbing','DK'),('6960','Hvide Sande','DK'),('6971','Spjald','DK'),('6973','Ørnhøj','DK'),('6980','Tim','DK'),('6990','Ulfborg','DK'),('7000','Fredericia','DK'),('7007','Fredericia','DK'),('7017','Taulov Pakkecenter','DK'),('7018','Pakker TLP','DK'),('7029','Fredericia','DK'),('7080','Børkop','DK'),('7100','Vejle','DK'),('7120','Vejle Øst','DK'),('7130','Juelsminde','DK'),('7140','Stouby','DK'),('7150','Barrit','DK'),('7160','Tørring','DK'),('7171','Uldum','DK'),('7173','Vonge','DK'),('7182','Bredsten','DK'),('7183','Randbøl','DK'),('7184','Vandel','DK'),('7190','Billund','DK'),('7200','Grindsted','DK'),('7250','Hejnsvig','DK'),('7260','Sønder Omme','DK'),('7270','Stakroge','DK'),('7280','Sønder Felding','DK'),('7300','Jelling','DK'),('7321','Gadbjerg','DK'),('7323','Give','DK'),('7330','Brande','DK'),('7361','Ejstrupholm','DK'),('7362','Hampen','DK'),('7400','Herning','DK'),('7429','Herning','DK'),('7430','Ikast','DK'),('7441','Bording','DK'),('7442','Engesvang','DK'),('7451','Sunds','DK'),('7470','Karup J','DK'),('7480','Vildbjerg','DK'),('7490','Aulum','DK'),('7500','Holstebro','DK'),('7540','Haderup','DK'),('7550','Sørvad','DK'),('7560','Hjerm','DK'),('7570','Vemb','DK'),('7600','Struer','DK'),('7620','Lemvig','DK'),('7650','Bøvlingbjerg','DK'),('7660','Bækmarksbro','DK'),('7673','Harboøre','DK'),('7680','Thyborøn','DK'),('7700','Thisted','DK'),('7730','Hanstholm','DK'),('7741','Frøstrup','DK'),('7742','Vesløs','DK'),('7752','Snedsted','DK'),('7755','Bedsted Thy','DK'),('7760','Hurup Thy','DK'),('7770','Vestervig','DK'),('7790','Thyholm','DK'),('7800','Skive','DK'),('7830','Vinderup','DK'),('7840','Højslev','DK'),('7850','Stoholm Jyll','DK'),('7860','Spøttrup','DK'),('7870','Roslev','DK'),('7884','Fur','DK'),('7900','Nykøbing M','DK'),('7950','Erslev','DK'),('7960','Karby','DK'),('7970','Redsted M','DK'),('7980','Vils','DK'),('7990','Øster Assels','DK'),('7992','Sydjylland/Fyn USF P','DK'),('7993','Sydjylland/Fyn USF B','DK'),('7996','Fakturaservice','DK'),('7997','Fakturascanning','DK'),('7998','Statsservice','DK'),('7999','Kommunepost','DK'),('8000','Aarhus C','DK'),('8100','Aarhus C','DK'),('8200','Aarhus N','DK'),('8210','Aarhus V','DK'),('8220','Brabrand','DK'),('8229','Risskov Ø','DK'),('8230','Åbyhøj','DK'),('8240','Risskov','DK'),('8245','Risskov Ø','DK'),('8250','Egå','DK'),('8260','Viby J','DK'),('8270','Højbjerg','DK'),('8300','Odder','DK'),('8305','Samsø','DK'),('8310','Tranbjerg J','DK'),('8320','Mårslet','DK'),('8330','Beder','DK'),('8340','Malling','DK'),('8350','Hundslund','DK'),('8355','Solbjerg','DK'),('8361','Hasselager','DK'),('8362','Hørning','DK'),('8370','Hadsten','DK'),('8380','Trige','DK'),('8381','Tilst','DK'),('8382','Hinnerup','DK'),('8400','Ebeltoft','DK'),('8410','Rønde','DK'),('8420','Knebel','DK'),('8444','Balle','DK'),('8450','Hammel','DK'),('8462','Harlev J','DK'),('8464','Galten','DK'),('8471','Sabro','DK'),('8472','Sporup','DK'),('8500','Grenaa','DK'),('8520','Lystrup','DK'),('8530','Hjortshøj','DK'),('8541','Skødstrup','DK'),('8543','Hornslet','DK'),('8544','Mørke','DK'),('8550','Ryomgård','DK'),('8560','Kolind','DK'),('8570','Trustrup','DK'),('8581','Nimtofte','DK'),('8585','Glesborg','DK'),('8586','Ørum Djurs','DK'),('8592','Anholt','DK'),('8600','Silkeborg','DK'),('8620','Kjellerup','DK'),('8632','Lemming','DK'),('8641','Sorring','DK'),('8643','Ans By','DK'),('8653','Them','DK'),('8654','Bryrup','DK'),('8660','Skanderborg','DK'),('8670','Låsby','DK'),('8680','Ry','DK'),('8700','Horsens','DK'),('8721','Daugård','DK'),('8722','Hedensted','DK'),('8723','Løsning','DK'),('8732','Hovedgård','DK'),('8740','Brædstrup','DK'),('8751','Gedved','DK'),('8752','Østbirk','DK'),('8762','Flemming','DK'),('8763','Rask Mølle','DK'),('8765','Klovborg','DK'),('8766','Nørre Snede','DK'),('8781','Stenderup','DK'),('8783','Hornsyld','DK'),('8789','Endelave','DK'),('8799','Tunø','DK'),('8800','Viborg','DK'),('8830','Tjele','DK'),('8831','Løgstrup','DK'),('8832','Skals','DK'),('8840','Rødkærsbro','DK'),('8850','Bjerringbro','DK'),('8860','Ulstrup','DK'),('8870','Langå','DK'),('8881','Thorsø','DK'),('8882','Fårvang','DK'),('8883','Gjern','DK'),('8900','Randers C','DK'),('8920','Randers NV','DK'),('8930','Randers NØ','DK'),('8940','Randers SV','DK'),('8950','Ørsted','DK'),('8960','Randers SØ','DK'),('8961','Allingåbro','DK'),('8963','Auning','DK'),('8970','Havndal','DK'),('8981','Spentrup','DK'),('8983','Gjerlev J','DK'),('8990','Fårup','DK'),('9000','Aalborg','DK'),('9029','Aalborg','DK'),('9100','Aalborg','DK'),('9200','Aalborg SV','DK'),('9210','Aalborg SØ','DK'),('9220','Aalborg Øst','DK'),('9230','Svenstrup J','DK'),('9240','Nibe','DK'),('9260','Gistrup','DK'),('9270','Klarup','DK'),('9280','Storvorde','DK'),('9293','Kongerslev','DK'),('9300','Sæby','DK'),('9310','Vodskov','DK'),('9320','Hjallerup','DK'),('9330','Dronninglund','DK'),('9340','Asaa','DK'),('9352','Dybvad','DK'),('9362','Gandrup','DK'),('9370','Hals','DK'),('9380','Vestbjerg','DK'),('9381','Sulsted','DK'),('9382','Tylstrup','DK'),('9400','Nørresundby','DK'),('9430','Vadum','DK'),('9440','Aabybro','DK'),('9460','Brovst','DK'),('9480','Løkken','DK'),('9490','Pandrup','DK'),('9492','Blokhus','DK'),('9493','Saltum','DK'),('9500','Hobro','DK'),('9510','Arden','DK'),('9520','Skørping','DK'),('9530','Støvring','DK'),('9541','Suldrup','DK'),('9550','Mariager','DK'),('9560','Hadsund','DK'),('9574','Bælum','DK'),('9575','Terndrup','DK'),('9600','Aars','DK'),('9610','Nørager','DK'),('9620','Aalestrup','DK'),('9631','Gedsted','DK'),('9632','Møldrup','DK'),('9640','Farsø','DK'),('9670','Løgstør','DK'),('9681','Ranum','DK'),('9690','Fjerritslev','DK'),('9700','Brønderslev','DK'),('9740','Jerslev J','DK'),('9750','Østervrå','DK'),('9760','Vrå','DK'),('9800','Hjørring','DK'),('9830','Tårs','DK'),('9850','Hirtshals','DK'),('9870','Sindal','DK'),('9881','Bindslev','DK'),('9900','Frederikshavn','DK'),('9940','Læsø','DK'),('9970','Strandby','DK'),('9981','Jerup','DK'),('9982','Ålbæk','DK'),('9990','Skagen','DK');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `CountryCode` varchar(5) CHARACTER SET utf8 NOT NULL,
  `CountryName` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`CountryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('DK','Danmark');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `ID` varchar(10) NOT NULL,
  `CustomerName` varchar(45) NOT NULL,
  `Mail` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address_ID` int(11) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Customers_Address_ID_Addresses_idx` (`Address_ID`),
  CONSTRAINT `FK_Customers_Address_ID_Addresses` FOREIGN KEY (`Address_ID`) REFERENCES `addresses` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('s155576','Bran Stark','Threeeyedraven@winterfell.org','12345678',29,'Male',13),('s164404','Nicomusen','nicodrengen@hotmail.com','12345678',2,'Male',16),('s175107','Emil Glimø Vinkel','emilvinkel@gmail.com','12345678',89,'Male',13),('s175109','Frederik','hjorth95@hotmail.com','12345678',29,'Male',24),('s175120','Rallermus','tissemand@live.dk','12345678',30,'Male',31);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `halls` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Theater_ID` int(11) NOT NULL,
  `Hall_Num` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Halls_Theater_ID_Theaters_idx` (`Theater_ID`),
  CONSTRAINT `FK_Halls_Theater_ID_Theaters` FOREIGN KEY (`Theater_ID`) REFERENCES `theaters` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (2,3,1),(3,3,2),(4,1,1),(5,2,1),(6,2,2),(7,1,2);
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seats` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SeatNumber` int(11) NOT NULL,
  `RowNumber` int(11) NOT NULL,
  `Hall_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Seats_Hall_ID_Halls_idx` (`Hall_ID`),
  CONSTRAINT `FK_Seats_Hall_ID_Halls` FOREIGN KEY (`Hall_ID`) REFERENCES `halls` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,1,1,2),(2,2,1,2),(3,3,1,2),(4,4,1,2),(5,5,1,2),(6,6,1,2),(7,7,1,2),(8,8,1,2),(9,9,1,2),(10,10,1,2),(11,1,1,3),(12,2,1,3),(13,3,1,3),(14,4,1,3),(15,5,1,3),(16,6,1,3),(17,7,1,3),(18,8,1,3),(19,9,1,3),(20,10,1,3),(21,1,2,3),(22,2,2,3),(23,3,2,3),(24,4,2,3),(25,5,2,3),(26,6,2,3),(27,7,2,3),(28,8,2,3),(29,9,2,3),(30,10,2,3),(31,1,3,3),(32,2,3,3),(33,3,3,3),(34,4,3,3),(35,5,3,3),(36,6,3,3),(37,7,3,3),(38,8,3,3),(39,9,3,3),(40,10,3,3),(41,1,4,3),(42,2,4,3),(43,3,4,3),(44,4,4,3),(45,5,4,3),(46,6,4,3),(47,7,4,3),(48,8,4,3),(49,9,4,3),(50,10,4,3),(51,1,5,3),(52,2,5,3),(53,3,5,3),(54,4,5,3),(55,5,5,3),(56,6,5,3),(57,7,5,3),(58,8,5,3),(59,9,5,3),(60,10,5,3),(61,1,6,3),(62,2,6,3),(63,3,6,3),(64,4,6,3),(65,5,6,3),(66,6,6,3),(67,7,6,3),(68,8,6,3),(69,9,6,3),(70,10,6,3),(71,1,7,3),(72,2,7,3),(73,3,7,3),(74,4,7,3),(75,5,7,3),(76,6,7,3),(77,7,7,3),(78,8,7,3),(79,9,7,3),(80,10,7,3),(81,1,8,3),(82,2,8,3),(83,3,8,3),(84,4,8,3),(85,5,8,3),(86,6,8,3),(87,7,8,3),(88,8,8,3),(89,9,8,3),(90,10,8,3),(91,1,9,3),(92,2,9,3),(93,3,9,3),(94,4,9,3),(95,5,9,3),(96,6,9,3),(97,7,9,3),(98,8,9,3),(99,9,9,3),(100,10,9,3),(101,1,10,3),(102,2,10,3),(103,3,10,3),(104,4,10,3),(105,5,10,3),(106,6,10,3),(107,7,10,3),(108,8,10,3),(109,9,10,3),(110,10,10,3),(111,1,1,4),(112,2,1,4),(113,3,1,4),(114,4,1,4),(115,5,1,4),(116,6,1,4),(117,7,1,4),(118,8,1,4),(119,9,1,4),(120,10,1,4),(121,1,2,4),(122,2,2,4),(123,3,2,4),(124,4,2,4),(125,5,2,4),(126,6,2,4),(127,7,2,4),(128,8,2,4),(129,9,2,4),(130,10,2,4),(131,1,3,4),(132,2,3,4),(133,3,3,4),(134,4,3,4),(135,5,3,4),(136,6,3,4),(137,7,3,4),(138,8,3,4),(139,9,3,4),(140,10,3,4),(141,1,4,4),(142,2,4,4),(143,3,4,4),(144,4,4,4),(145,5,4,4),(146,6,4,4),(147,7,4,4),(148,8,4,4),(149,9,4,4),(150,10,4,4),(151,1,5,4),(152,2,5,4),(153,3,5,4),(154,4,5,4),(155,5,5,4),(156,6,5,4),(157,7,5,4),(158,8,5,4),(159,9,5,4),(160,10,5,4),(161,1,6,4),(162,2,6,4),(163,3,6,4),(164,4,6,4),(165,5,6,4),(166,6,6,4),(167,7,6,4),(168,8,6,4),(169,9,6,4),(170,10,6,4),(171,1,7,4),(172,2,7,4),(173,3,7,4),(174,4,7,4),(175,5,7,4),(176,6,7,4),(177,7,7,4),(178,8,7,4),(179,9,7,4),(180,10,7,4),(181,1,8,4),(182,2,8,4),(183,3,8,4),(184,4,8,4),(185,5,8,4),(186,6,8,4),(187,7,8,4),(188,8,8,4),(189,9,8,4),(190,10,8,4),(191,1,1,5),(192,2,1,5),(193,3,1,5),(194,4,1,5),(195,5,1,5),(196,6,1,5),(197,7,1,5),(198,8,1,5),(199,9,1,5),(200,10,1,5),(201,11,1,5),(202,12,1,5),(203,1,2,5),(204,2,2,5),(205,3,2,5),(206,4,2,5),(207,5,2,5),(208,6,2,5),(209,7,2,5),(210,8,2,5),(211,9,2,5),(212,10,2,5),(213,11,2,5),(214,12,2,5),(215,1,3,5),(216,2,3,5),(217,3,3,5),(218,4,3,5),(219,5,3,5),(220,6,3,5),(221,7,3,5),(222,8,3,5),(223,9,3,5),(224,10,3,5),(225,11,3,5),(226,12,3,5),(227,1,4,5),(228,2,4,5),(229,3,4,5),(230,4,4,5),(231,5,4,5),(232,6,4,5),(233,7,4,5),(234,8,4,5),(235,9,4,5),(236,10,4,5),(237,11,4,5),(238,12,4,5),(239,1,5,5),(240,2,5,5),(241,3,5,5),(242,4,5,5),(243,5,5,5),(244,6,5,5),(245,7,5,5),(246,8,5,5),(247,9,5,5),(248,10,5,5),(249,11,5,5),(250,12,5,5),(251,1,6,5),(252,2,6,5),(253,3,6,5),(254,4,6,5),(255,5,6,5),(256,6,6,5),(257,7,6,5),(258,8,6,5),(259,9,6,5),(260,10,6,5),(261,11,6,5),(262,12,6,5),(263,1,7,5),(264,2,7,5),(265,3,7,5),(266,4,7,5),(267,5,7,5),(268,6,7,5),(269,7,7,5),(270,8,7,5),(271,9,7,5),(272,10,7,5),(273,11,7,5),(274,12,7,5),(275,1,8,5),(276,2,8,5),(277,3,8,5),(278,4,8,5),(279,5,8,5),(280,6,8,5),(281,7,8,5),(282,8,8,5),(283,9,8,5),(284,10,8,5),(285,11,8,5),(286,12,8,5),(287,1,9,5),(288,2,9,5),(289,3,9,5),(290,4,9,5),(291,5,9,5),(292,6,9,5),(293,7,9,5),(294,8,9,5),(295,9,9,5),(296,10,9,5),(297,11,9,5),(298,12,9,5),(299,1,10,5),(300,2,10,5),(301,3,10,5),(302,4,10,5),(303,5,10,5),(304,6,10,5),(305,7,10,5),(306,8,10,5),(307,9,10,5),(308,10,10,5),(309,11,10,5),(310,12,10,5),(311,1,11,5),(312,2,11,5),(313,3,11,5),(314,4,11,5),(315,5,11,5),(316,6,11,5),(317,7,11,5),(318,8,11,5),(319,9,11,5),(320,10,11,5),(321,11,11,5),(322,12,11,5),(323,1,1,6),(324,2,1,6),(325,3,1,6),(326,4,1,6),(327,5,1,6),(328,6,1,6),(329,7,1,6),(330,8,1,6),(331,9,1,6),(332,10,1,6),(333,11,1,6),(334,12,1,6),(335,13,1,6),(336,14,1,6),(337,15,1,6),(338,16,1,6),(339,1,2,6),(340,2,2,6),(341,3,2,6),(342,4,2,6),(343,5,2,6),(344,6,2,6),(345,7,2,6),(346,8,2,6),(347,9,2,6),(348,10,2,6),(349,11,2,6),(350,12,2,6),(351,13,2,6),(352,14,2,6),(353,15,2,6),(354,16,2,6),(355,1,3,6),(356,2,3,6),(357,3,3,6),(358,4,3,6),(359,5,3,6),(360,6,3,6),(361,7,3,6),(362,8,3,6),(363,9,3,6),(364,10,3,6),(365,11,3,6),(366,12,3,6),(367,13,3,6),(368,14,3,6),(369,15,3,6),(370,16,3,6),(371,1,4,6),(372,2,4,6),(373,3,4,6),(374,4,4,6),(375,5,4,6),(376,6,4,6),(377,7,4,6),(378,8,4,6),(379,9,4,6),(380,10,4,6),(381,11,4,6),(382,12,4,6),(383,13,4,6),(384,14,4,6),(385,15,4,6),(386,16,4,6),(387,1,5,6),(388,2,5,6),(389,3,5,6),(390,4,5,6),(391,5,5,6),(392,6,5,6),(393,7,5,6),(394,8,5,6),(395,9,5,6),(396,10,5,6),(397,11,5,6),(398,12,5,6),(399,13,5,6),(400,14,5,6),(401,15,5,6),(402,16,5,6),(403,1,6,6),(404,2,6,6),(405,3,6,6),(406,4,6,6),(407,5,6,6),(408,6,6,6),(409,7,6,6),(410,8,6,6),(411,9,6,6),(412,10,6,6),(413,11,6,6),(414,12,6,6),(415,13,6,6),(416,14,6,6),(417,15,6,6),(418,16,6,6),(419,1,7,6),(420,2,7,6),(421,3,7,6),(422,4,7,6),(423,5,7,6),(424,6,7,6),(425,7,7,6),(426,8,7,6),(427,9,7,6),(428,10,7,6),(429,11,7,6),(430,12,7,6),(431,13,7,6),(432,14,7,6),(433,15,7,6),(434,16,7,6),(435,1,8,6),(436,2,8,6),(437,3,8,6),(438,4,8,6),(439,5,8,6),(440,6,8,6),(441,7,8,6),(442,8,8,6),(443,9,8,6),(444,10,8,6),(445,11,8,6),(446,12,8,6),(447,13,8,6),(448,14,8,6),(449,15,8,6),(450,16,8,6),(451,1,9,6),(452,2,9,6),(453,3,9,6),(454,4,9,6),(455,5,9,6),(456,6,9,6),(457,7,9,6),(458,8,9,6),(459,9,9,6),(460,10,9,6),(461,11,9,6),(462,12,9,6),(463,13,9,6),(464,14,9,6),(465,15,9,6),(466,16,9,6),(467,1,10,6),(468,2,10,6),(469,3,10,6),(470,4,10,6),(471,5,10,6),(472,6,10,6),(473,7,10,6),(474,8,10,6),(475,9,10,6),(476,10,10,6),(477,11,10,6),(478,12,10,6),(479,13,10,6),(480,14,10,6),(481,15,10,6),(482,16,10,6),(483,1,11,6),(484,2,11,6),(485,3,11,6),(486,4,11,6),(487,5,11,6),(488,6,11,6),(489,7,11,6),(490,8,11,6),(491,9,11,6),(492,10,11,6),(493,11,11,6),(494,12,11,6),(495,13,11,6),(496,14,11,6),(497,15,11,6),(498,16,11,6),(499,1,12,6),(500,2,12,6),(501,3,12,6),(502,4,12,6),(503,5,12,6),(504,6,12,6),(505,7,12,6),(506,8,12,6),(507,9,12,6),(508,10,12,6),(509,11,12,6),(510,12,12,6),(511,13,12,6),(512,14,12,6),(513,15,12,6),(514,16,12,6),(515,1,1,7),(516,2,1,7),(517,3,1,7),(518,4,1,7),(519,5,1,7),(520,6,1,7),(521,7,1,7),(522,8,1,7),(523,1,2,7),(524,2,2,7),(525,3,2,7),(526,4,2,7),(527,5,2,7),(528,6,2,7),(529,7,2,7),(530,8,2,7),(531,1,3,7),(532,2,3,7),(533,3,3,7),(534,4,3,7),(535,5,3,7),(536,6,3,7),(537,7,3,7),(538,8,3,7),(539,1,4,7),(540,2,4,7),(541,3,4,7),(542,4,4,7),(543,5,4,7),(544,6,4,7),(545,7,4,7),(546,8,4,7),(547,1,5,7),(548,2,5,7),(549,3,5,7),(550,4,5,7),(551,5,5,7),(552,6,5,7),(553,7,5,7),(554,8,5,7),(555,1,6,7),(556,2,6,7),(557,3,6,7),(558,4,6,7),(559,5,6,7),(560,6,6,7),(561,7,6,7),(562,8,6,7),(563,1,7,7),(564,2,7,7),(565,3,7,7),(566,4,7,7),(567,5,7,7),(568,6,7,7),(569,7,7,7),(570,8,7,7),(571,1,8,7),(572,2,8,7),(573,3,8,7),(574,4,8,7),(575,5,8,7),(576,6,8,7),(577,7,8,7),(578,8,8,7),(579,1,9,7),(580,2,9,7),(581,3,9,7),(582,4,9,7),(583,5,9,7),(584,6,9,7),(585,7,9,7),(586,8,9,7);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showdates`
--

DROP TABLE IF EXISTS `showdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showdates` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Show_ID` int(11) NOT NULL,
  `ShowDate` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ShowDates_Show_ID_Shows_idx` (`Show_ID`),
  CONSTRAINT `FK_ShowDates_Show_ID_Shows` FOREIGN KEY (`Show_ID`) REFERENCES `shows` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showdates`
--

LOCK TABLES `showdates` WRITE;
/*!40000 ALTER TABLE `showdates` DISABLE KEYS */;
INSERT INTO `showdates` VALUES (5,2,'2019-06-05 08:00:00'),(6,2,'2019-06-06 08:00:00'),(7,2,'2019-06-07 08:00:00'),(56,3,'2019-06-01 20:00:00'),(57,3,'2019-06-02 20:00:00'),(58,3,'2019-06-03 20:00:00'),(59,3,'2019-06-04 20:00:00'),(60,3,'2019-06-05 20:00:00'),(61,3,'2019-06-06 20:00:00'),(62,3,'2019-06-07 20:00:00'),(63,3,'2019-06-08 20:00:00'),(64,3,'2019-06-09 20:00:00'),(77,8,'2019-07-12 19:00:00'),(78,8,'2019-07-12 19:00:00'),(79,8,'2019-08-12 19:00:00'),(80,8,'2019-09-12 19:00:00'),(81,8,'2019-10-12 19:00:00'),(82,8,'2019-11-12 19:00:00'),(83,9,'2019-07-12 19:00:00'),(84,9,'2019-07-12 19:00:00'),(85,9,'2019-08-12 19:00:00'),(86,9,'2019-09-12 19:00:00'),(87,9,'2019-10-12 19:00:00'),(88,9,'2019-11-12 19:00:00'),(89,10,'2019-07-12 19:00:00'),(90,10,'2019-07-12 19:00:00'),(91,10,'2019-08-12 19:00:00'),(92,10,'2019-09-12 19:00:00'),(93,10,'2019-10-12 19:00:00'),(94,10,'2019-11-12 19:00:00');
/*!40000 ALTER TABLE `showdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Hall_ID` int(11) NOT NULL,
  `ImgUrl` varchar(200) DEFAULT NULL,
  `Active` tinyint(4) DEFAULT '1',
  `BasePrice` decimal(6,2) NOT NULL,
  `Description` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Shows_Hall_ID_Halls_idx` (`Hall_ID`),
  CONSTRAINT `FK_Shows_Hall_ID_Halls` FOREIGN KEY (`Hall_ID`) REFERENCES `halls` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (2,'Kong Arthur',3,'https://kglteater.dk/globalassets/det-sker/sason-2018-2019/pdp-images-new-format/kong_arthur_1170x720_0327.jpg',1,150.00,'Lorem ipsum dolor sit amet, tempus vulputate hendrerit in in mattis eleifend, magna elementum pede magna lorem, sodales mauris, est ac non.'),(3,'Spillemand på en Tagryg',3,'https://s1.ticketm.net/img/tat/dam/a/5d3/6d216f86-cb55-488b-bc4d-9fc301c325d3_1000811_CUSTOM.jpg',1,250.00,'Noob on los Roof'),(8,'The Lion King',4,'https://i.imgur.com/zhIu8XS.jpg',1,200.00,'Omhandler simba der skal være konge en dag'),(9,'Shrek The Musical',5,'https://i.imgur.com/3pOQhP2.jpg',1,175.00,'Shrek er en stor grøn trold, som drømmer om at gifte sig med den smukke prinsesse. MEN.. det er ikke så nemt!'),(10,'Terkel i Knibe',6,'https://i.imgur.com/YYndEVb.jpg',1,150.00,'Terken er en uheldig og kikset teenage dreng, der er skyld i at sin bedste vens søster dør. ');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theaters`
--

DROP TABLE IF EXISTS `theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theaters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Address_ID` int(11) NOT NULL,
  `Active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `FK_Theaters_Address_ID_Addresses_idx` (`Address_ID`),
  CONSTRAINT `FK_Theaters_Address_ID_Addresses` FOREIGN KEY (`Address_ID`) REFERENCES `addresses` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaters`
--

LOCK TABLES `theaters` WRITE;
/*!40000 ALTER TABLE `theaters` DISABLE KEYS */;
INSERT INTO `theaters` VALUES (1,'Østre Gasværk Teater',20,1),(2,'Det Kongelige Teater',2,1),(3,'Det Ny Teater',14,1),(9,'Mit hjemmelavede teaterdad',90,1),(10,'Mit hjemmelavede teater',37,1);
/*!40000 ALTER TABLE `theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ticketsdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `spCreateBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spCreateBooking`( CustomerID varchar(10), ShowTitle varchar(50), BookingDate DATETIME, SeatStart int, SeatEnd int, RowNumber int, TotalPrice decimal)
BEGIN

	DECLARE ShowID int;
    DECLARE BookingID int;
    DECLARE HallID int;
    
    
    SET ShowID = (SELECT ID FROM Shows WHERE Title = ShowTitle LIMIT 1);
    SET HallID = (SELECT Hall_ID FROM Shows WHERE ID = ShowID LIMIT 1);
    
	INSERT INTO Bookings (Customer_ID, Show_ID, BookedDate, TotalPrice) VALUES (CustomerID, ShowID, BookingDate, TotalPrice);
    
	SET BookingID = (SELECT MAX(ID) From Bookings WHERE 
	Customer_ID = CustomerID AND
	Show_ID = ShowID AND
	BookedDate = BookingDate AND
	TotalPrice = TotalPrice LIMIT 1);
    
    
    INSERT INTO BookedSeats (Booking_ID, Seat_ID, BookedDate) 
		SELECT BookingID, s.ID, BookingDate FROM Seats s 
        WHERE s.Hall_ID = HallID AND s.RowNumber = RowNumber AND s.SeatNumber BETWEEN SeatStart and SeatEnd;
        
	SELECT BookingID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCreateCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spCreateCustomer`(ID varchar(10), CustomerName varchar(45), Email varchar(100), Phone varchar(20), Address varchar(100), Gender varchar(10), Age int)
BEGIN

	DECLARE AddressID int;    
    
	IF ( (SELECT COUNT(*) FROM Addresses a WHERE a.Address = TRIM(SUBSTRING_INDEX(Address, ',', 1)) AND a.CityZip = TRIM(SUBSTRING_INDEX(Address, ',', -1))) = 0)
		THEN INSERT INTO Addresses (Address, CityZip) VALUES (TRIM(SUBSTRING_INDEX(Address, ',', 1)), TRIM(SUBSTRING_INDEX(Address, ',', -1)));
	END IF;
    
    SET AddressID = (SELECT a.ID FROM Addresses a WHERE a.Address = TRIM(SUBSTRING_INDEX(Address, ',', 1)) AND a.CityZip = TRIM(SUBSTRING_INDEX(Address, ',', -1)));
	    
	INSERT INTO Customers (ID, CustomerName, Mail, Phone, Address_ID, Gender, Age) VALUES (ID, CustomerName, Email, Phone, AddressID, Gender, Age);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCreateHall` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spCreateHall`(HallNum int, Theater varchar(45), SeatCount int, RowCount int )
BEGIN

	DECLARE TheaterID int;
    DECLARE HallID int;
    DECLARE row_num INT Default 1;
    DECLARE seat_num INT Default 1;
    
    SET TheaterID = (SELECT ID FROM Theaters WHERE Name = Theater LIMIT 1);

	INSERT INTO Halls (Theater_ID, Hall_Num) VALUES (TheaterID, HallNum);
    
    SET HallID = (SELECT ID FROM Halls WHERE Theater_ID = TheaterID and Hall_Num = HallNum LIMIT 1);
    
	WHILE(row_num < RowCount + 1) DO
    
		WHILE(seat_num < SeatCount + 1) DO
        
			INSERT INTO Seats (SeatNumber, RowNumber, Hall_ID) VALUES (seat_num, row_num, HallID);
			SET seat_num = seat_num+1;
           
		END WHILE;
        
        SET row_num = row_num + 1;
        SET seat_num = 1;
        
	END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCreateShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spCreateShow`(Title varchar(50), ImgUrl varchar(200), Hall_ID int, Dates varchar(1000), basePrice decimal, description varchar(140))
BEGIN
	DECLARE ShowID int;
	DECLARE i INT Default 0 ;
	DECLARE date_string VARCHAR(255);
    DECLARE date_element Datetime;
    
	INSERT INTO Shows (Title, Hall_ID, ImgUrl, basePrice, Description) VALUES (Title, Hall_ID, ImgUrl, basePrice, description);
    
    SET ShowID = (SELECT ID FROM Shows s WHERE s.Title = Title LIMIT 1);

    _loop: LOOP
		SET i=i+1;
		SET date_string=REPLACE(SUBSTRING(SUBSTRING_INDEX(Dates, ',', i), LENGTH(SUBSTRING_INDEX(Dates, ',', i -1)) + 1), ',', ' ');
        IF date_string='' THEN
           LEAVE _loop;
        END IF;
        
        SET date_element = CAST(date_string as Datetime);
        
        IF(date_element is not null) THEN
                INSERT INTO ShowDates(Show_ID, ShowDate) VALUES (ShowID, date_element);
		END IF;
        
	END LOOP _loop;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCreateTheater` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spCreateTheater`(Theater varchar(45), Address varchar(100), Active Tinyint)
BEGIN

	DECLARE AddressID int;

	IF ( (SELECT COUNT(*) FROM Addresses a WHERE a.Address = TRIM(SUBSTRING_INDEX(Address, ',', 1)) AND a.CityZip = TRIM(SUBSTRING_INDEX(Address, ',', -1))) = 0)
		THEN INSERT INTO Addresses (Address, CityZip) VALUES (TRIM(SUBSTRING_INDEX(Address, ',', 1)), TRIM(SUBSTRING_INDEX(Address, ',', -1)));
	END IF;
	
    SET AddressID = (SELECT ID FROM Addresses a WHERE a.Address = TRIM(SUBSTRING_INDEX(Address, ',', 1)) AND a.CityZip = TRIM(SUBSTRING_INDEX(Address, ',', -1)));
        
	INSERT INTO Theaters (Name, Address_ID, Active) VALUES (Theater, AddressID, Active);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spDeleteBooking`(BookingID int)
BEGIN

	DELETE FROM BookedSeats WHERE booking_ID = BookingID;
    DELETE FROM Bookings WHERE ID = BookingID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spDeleteCustomer`(CustomerID varchar(10))
BEGIN

	DELETE FROM BookedSeats WHERE booking_ID = (Select ID from Bookings WHERE Customer_ID = CustomerID);
    DELETE FROM Bookings WHERE Customer_ID = CustomerID;
    DELETE FROM Customers WHERE ID = CustomerID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteShowDates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spDeleteShowDates`(ShowID int, showdate Datetime)
BEGIN

	DELETE sd FROM ShowDates sd
    JOIN Shows s ON s.ID = sd.Show_ID
    WHERE s.ID = ShowID AND 
	sd.ShowDate = showdate;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllShows` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spGetAllShows`()
BEGIN

	SELECT s.ID, s.Title, s.ImgUrl, h.ID, t.Name AS Theater, CONCAT(a.Address, ', ', a.CityZip) AS Address, s.BasePrice, s.Description FROM Shows s
    JOIN Halls h ON h.ID = s.Hall_ID
    JOIN Theaters t ON t.ID = h.Theater_ID
    JOIN Addresses a ON a.ID = t.Address_ID
    WHERE s.Active = 1;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetBookedSeats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spGetBookedSeats`(ShowID int, ShowDate datetime)
BEGIN

	SELECT SeatNumber, RowNumber FROM Seats s 
	JOIN BookedSeats bs ON bs.Seat_ID = s.ID 
	JOIN Bookings b ON b.ID = bs.Booking_ID
	WHERE bs.BookedDate = ShowDate
	AND b.Show_ID = ShowID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetBookingDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spGetBookingDetails`(BookingID int)
BEGIN
	
	SELECT s.Title, t.Name as Theater, h.ID as Hall, CONCAT(a.Address, ', ', a.CityZip) as Address, BookedDate, Customer_ID, s.ImgUrl, s.BasePrice,  b.TotalPrice, s.ID as ShowID FROM Bookings b
	JOIN Shows s ON s.ID = b.Show_ID
	JOIN Halls h ON h.ID = s.Hall_ID
	JOIN Theaters t ON t.ID = h.Theater_ID
    JOIN Addresses a ON a.ID = t.Address_ID
	WHERE b.ID = BookingID;

	SELECT SeatNumber, RowNumber FROM BookedSeats bs
	JOIN Seats s ON bs.Seat_ID = s.ID 
	WHERE bs.Booking_ID = BookingID;   
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spGetCustomer`(CustomerID varchar(10))
BEGIN
	SELECT c.CustomerName, c.Mail, c.Phone, CONCAT(a.Address, ', ', a.CityZip, ' ', ci.CityName) as Address, c.Gender, c.Age 
	FROM Customers c
	JOIN Addresses a ON a.ID = c.Address_ID
    JOIN Cities ci ON ci.ZipCode = a.CityZip
    WHERE c.ID = CustomerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetCustomerBookings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spGetCustomerBookings`(CustomerID varchar(10))
BEGIN

	SELECT  b.ID, s.Title, t.Name, h.ID as Hall,  CONCAT(a.Address, ', ', a.CityZip) as Address, BookedDate, s.ImgUrl, s.BasePrice, b.TotalPrice FROM Bookings b
	JOIN Shows s ON s.ID = b.Show_ID
	JOIN Halls h ON h.ID = s.Hall_ID
	JOIN Theaters t ON t.ID = h.Theater_ID
    JOIN Addresses a ON a.ID = t.Address_ID
	WHERE b.Customer_ID = CustomerID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetDatesBySeats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spGetDatesBySeats`(ShowID int, RowNumber int, SeatStart int, SeatEnd int)
BEGIN

	SET @HallID = (SELECT Hall_ID FROM Shows WHERE ID = ShowID LIMIT 1);
    
	SELECT DISTINCT ds.ShowDate FROM ShowDates ds WHERE 
	ds.Show_ID = ShowID AND 
	ds.ShowDate NOT IN (
	SELECT DISTINCt bs.BookedDate FROM BookedSeats bs WHERE bs.Seat_ID IN  (SELECT ID FROM Seats s WHERE s.RowNumber = RowNumber AND Hall_ID = @HallID AND s.SeatNumber BETWEEN SeatStart AND SeatEnd));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spGetShow`(ShowID int)
BEGIN    

	SELECT s.ID, s.Title, s.ImgUrl, h.ID as Hall_ID, t.Name AS Theater, CONCAT(a.Address, ', ', a.CityZip) AS Address, s.BasePrice, s.Description FROM Shows s
    JOIN Halls h ON h.ID = s.Hall_ID
    JOIN Theaters t ON t.ID = h.Theater_ID
    JOIN Addresses a ON a.ID = t.Address_ID
    WHERE s.ID = ShowID;
    
    SELECT ShowDate FROM ShowDates sd
    JOIN Shows s ON s.ID = sd.Show_ID
    WHERE s.ID = ShowID;

	SELECT COUNT(DISTINCT RowNumber) AS RowCount, COUNT(DISTINCT SeatNumber) AS SeatCount FROM Seats se JOIN Shows sh ON sh.Hall_ID = se.Hall_ID WHERE sh.ID = ShowID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetTheater` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spGetTheater`(Theater varchar(45))
BEGIN
	SELECT Name as Theater, CONCAT(a.Address, ', ', a.CityZip) as Address, Active FROM Theaters t
    JOIN Addresses a ON a.ID = t.Address_ID
    WHERE t.Name = Theater;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spUpdateCustomer`(CustomerID varchar(10), CustomerName varchar(45), Email varchar(100), Phone varchar(20), Address varchar(100), Gender varchar(10), Age int)
BEGIN

	IF ( (SELECT COUNT(*) FROM Addresses a WHERE a.Address = TRIM(SUBSTRING_INDEX(Address, ',', 1)) AND a.CityZip = TRIM(SUBSTRING_INDEX(Address, ',', -1))) = 0)
		THEN INSERT INTO Addresses (Address, CityZip) VALUES (TRIM(SUBSTRING_INDEX(Address, ',', 1)), TRIM(SUBSTRING_INDEX(Address, ',', -1)));
	END IF;

    UPDATE Customers c SET 
		c.CustomerName = CustomerName,
		c.Mail = Email,
        c.Phone = Phone,
        c.Address_ID = (SELECT a.ID FROM Addresses a WHERE a.Address = TRIM(SUBSTRING_INDEX(Address, ',', 1)) AND a.CityZip = TRIM(SUBSTRING_INDEX(Address, ',', -1))),
        c.Gender = Gender,
        c.Age = Age 
	WHERE c.ID = CustomerID;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateShow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spUpdateShow`(ShowID int, Title varchar(50), ImgUrl varchar(200), Hall_ID int, Dates varchar(1000), Active tinyint, basePrice decimal, Description varchar(140))
BEGIN

	DECLARE i INT Default 0 ;
	DECLARE date_string VARCHAR(255);
    DECLARE date_element Datetime;
    
	UPDATE Shows s SET
		s.Title = Title,
        s.ImgUrl = ImgUrl,
        s.Hall_ID = Hall_ID,
        s.Active = Active,
        s.BasePrice = basePrice,
        s.Description = Description
	WHERE s.ID = ShowID;
    
    DELETE FROM ShowDates WHERE Show_ID = ShowID;
    
	_loop: LOOP
		SET i=i+1;
		SET date_string=REPLACE(SUBSTRING(SUBSTRING_INDEX(Dates, ',', i), LENGTH(SUBSTRING_INDEX(Dates, ',', i -1)) + 1), ',', ' ');
        IF date_string='' THEN
           LEAVE _loop;
        END IF;
        
        SET date_element = CAST(date_string as Datetime);
        
        IF(date_element is not null) THEN
                INSERT INTO ShowDates(Show_ID, ShowDate) VALUES (ShowID, date_element);
		END IF;
        
	END LOOP _loop;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateTheater` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`mysqltickets`@`%` PROCEDURE `spUpdateTheater`(Theater varchar(45), Address varchar(100), Active Tinyint, OldName varchar(45))
BEGIN

	IF ( (SELECT COUNT(*) FROM Addresses a WHERE a.Address = TRIM(SUBSTRING_INDEX(Address, ',', 1)) AND a.CityZip = TRIM(SUBSTRING_INDEX(Address, ',', -1))) = 0)
		THEN INSERT INTO Addresses (Address, CityZip) VALUES (TRIM(SUBSTRING_INDEX(Address, ',', 1)), TRIM(SUBSTRING_INDEX(Address, ',', -1)));
	END IF;
    
	UPDATE Theaters t SET 
		t.Name = Theater,
        t.Address_ID = (SELECT ID FROM Addresses a WHERE a.Address = TRIM(SUBSTRING_INDEX(Address, ',', 1)) AND a.CityZip = TRIM(SUBSTRING_INDEX(Address, ',', -1)) LIMIT 1),
        t.Active = Active 
	WHERE t.Name = OldName;
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

-- Dump completed on 2019-05-13 10:36:47
