-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: amazona_db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `idcomentario` int NOT NULL AUTO_INCREMENT,
  `comentario` text NOT NULL,
  `idpublicacion` int DEFAULT NULL,
  `idusuario` int DEFAULT NULL,
  `calificacion` int NOT NULL DEFAULT '1',
  `reportado` int DEFAULT '0',
  `habilitado` int DEFAULT '1',
  PRIMARY KEY (`idcomentario`),
  KEY `fk_calificaciones` (`idpublicacion`),
  CONSTRAINT `fk_calificaciones` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (1,'Esta muy bueno',1,1,3,0,1),(2,'Prueba',2,1,4,0,1),(3,'Prueba',3,2,4,0,1),(4,'Prueba',4,1,4,0,1),(5,'Prueba',5,2,4,0,1),(6,'Prueba',6,2,4,0,1),(7,'Prueba',7,1,4,0,1),(8,'Prueba',8,2,4,0,1),(9,'Prueba',9,1,4,0,1),(10,'Prueba',10,2,5,0,1),(11,'Prueba',11,2,4,0,1),(12,'Prueba',12,1,4,0,1),(13,'Prueba',13,1,5,0,1),(14,'Prueba',14,1,5,0,1),(15,'Prueba',15,2,5,0,1),(16,'Prueba',16,2,5,0,1),(17,'Prueba',17,1,5,0,1),(18,'Prueba',18,1,5,0,1),(19,'Prueba',19,2,4,0,1),(20,'Prueba',20,1,4,0,1),(21,'Prueba',21,2,4,0,1),(22,'Prueba',22,2,4,0,1),(23,'Prueba',23,2,5,0,1),(24,'Prueba',24,1,4,0,1),(25,'Prueba',1,1,5,0,1),(26,'Prueba',2,1,4,0,1),(27,'Prueba',3,1,5,0,1),(28,'Prueba',4,1,4,0,1),(29,'aaaa',1,2,5,0,1);
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `habilitado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Tecnología',1),(2,'Moda',1),(3,'Hogar',1),(4,'Deportes',1),(5,'Movilidad',1),(6,'Niños',1);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventa` (
  `iddetalleventa` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `producto` varchar(70) DEFAULT NULL,
  `precio` int DEFAULT NULL,
  `idventa` int DEFAULT NULL,
  PRIMARY KEY (`iddetalleventa`),
  UNIQUE KEY `iddetalleventa_UNIQUE` (`iddetalleventa`),
  KEY `fk_venta_idx` (`idventa`),
  CONSTRAINT `fk_venta` FOREIGN KEY (`idventa`) REFERENCES `ventas` (`idventa`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` VALUES (1,1,'Buzo Canguro',6500,1),(2,3,'Colchoneta gimnasia',4300,1),(3,9,'Sillón Esquinero',320000,1),(4,6,'Botines Nike',13000,1),(5,5,'Bicicleta MTB',120000,1),(6,4,'Auriculares inalambricos Sony',1234,1),(7,5,'Triciclo',9800,1),(8,1,'Auriculares inalambricos Sony',1234,2),(9,1,'Sillón Esquinero',320000,2),(10,1,'Pantalon Cargo',8000,2),(11,1,'Macbook Air',265800,3),(12,1,'Playstation 5',240000,4),(13,1,'Notebook MSI',345098,4),(14,1,'Hoverboard',140000,4),(15,1,'Auto a control remoto',11000,4),(16,1,'Silla de Comedor',25000,4),(17,1,'Buzo Canguro',6500,5),(18,1,'oooooooooooooorrr',9685,6);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domicilios`
--

DROP TABLE IF EXISTS `domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilios` (
  `iddomicilios` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `calle` varchar(100) NOT NULL,
  `altura` int DEFAULT NULL,
  `piso` int DEFAULT NULL,
  `depto` varchar(3) DEFAULT NULL,
  `idpais` int NOT NULL,
  `idProvincia` int NOT NULL,
  `cp` varchar(6) DEFAULT NULL,
  `entregadefault` int NOT NULL DEFAULT '0',
  `facturaciondefault` int NOT NULL DEFAULT '0',
  `alias` varchar(45) NOT NULL DEFAULT '----',
  PRIMARY KEY (`iddomicilios`),
  KEY `fk_usuarios_domicilios` (`idusuario`),
  KEY `fk_pais_idx` (`idpais`),
  KEY `fk_provincia_idx` (`idProvincia`),
  CONSTRAINT `fk_pais` FOREIGN KEY (`idpais`) REFERENCES `paises` (`idpais`),
  CONSTRAINT `fk_provincia` FOREIGN KEY (`idProvincia`) REFERENCES `provincias` (`idProvincia`),
  CONSTRAINT `fk_usuarios_domicilios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilios`
--

LOCK TABLES `domicilios` WRITE;
/*!40000 ALTER TABLE `domicilios` DISABLE KEYS */;
INSERT INTO `domicilios` VALUES (1,2,'calle',666,0,'',1,1,'666',0,0,'Casa'),(2,1,'Calle Fake',1234,3,'y',1,1,'40005',1,0,'Trabajo'),(3,1,'Av. Siempre viva',742,NULL,NULL,1,1,'232',0,1,'Evergreen'),(4,140,'Av Fulanito',420,999,'Z',1,1,'999999',0,0,'----'),(5,143,'lalala',1,1,'1',1,1,'1',0,0,'----'),(6,145,'lalala',123,132,'123',1,1,'321',0,0,'----');
/*!40000 ALTER TABLE `domicilios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `idimagen` int NOT NULL AUTO_INCREMENT,
  `imagenprincipal` int NOT NULL DEFAULT '0',
  `imagen` varchar(40) NOT NULL,
  `idpublicacion` int NOT NULL,
  PRIMARY KEY (`idimagen`),
  KEY `fk_img_publicaciones` (`idpublicacion`),
  CONSTRAINT `fk_img_publicaciones` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
INSERT INTO `imagenes` VALUES (1,1,'auriculares1.webp',1),(2,0,'auriculares2.webp',1),(5,1,'macbookair1.webp',2),(6,0,'macbookair2.webp',2),(7,0,'macbookair3.webp',2),(8,0,'macbookair4.webp',2),(9,1,'msi1.webp',3),(10,0,'msi2.webp',3),(11,0,'msi3.webp',3),(12,0,'msi4.webp',3),(13,1,'ps51.webp',4),(14,0,'ps52.webp',4),(15,0,'ps53.webp',4),(16,0,'ps54.webp',4),(17,1,'buzo1.webp',5),(18,0,'buzo2.webp',5),(19,0,'buzo3.webp',5),(20,1,'zapatillas1.webp',6),(21,0,'zapatillas2.webp',6),(22,0,'zapatillas3.webp',6),(23,0,'zapatillas4.webp',6),(24,1,'pantalon1.webp',7),(25,0,'pantalon2.webp',7),(26,0,'pantalon3.webp',7),(27,1,'campera1.webp',8),(28,0,'campera2.webp',8),(29,0,'campera3.webp',8),(79,1,'cama1.webp',9),(80,0,'cama2.webp',9),(81,1,'silla1.webp',10),(82,0,'silla2.webp',10),(84,1,'sillon2.webp',11),(85,0,'sillon3.webp',11),(86,1,'mesa1.webp',12),(87,0,'mesa2.webp',12),(88,0,'mesa3.webp',12),(89,1,'pelota1.webp',13),(90,0,'pelota1.webp',13),(91,0,'pelota1.webp',13),(92,1,'botines1.webp',14),(93,0,'botines2.webp',14),(94,0,'botines3.webp',14),(95,1,'pesas1.webp',15),(96,0,'pesas2.webp',15),(97,0,'pesas3.webp',15),(98,1,'colchoneta1.webp',16),(99,0,'colchoneta2.webp',16),(100,0,'colchoneta3.webp',16),(101,0,'colchoneta4.webp',16),(102,1,'monopatinelectrico1.webp',17),(103,0,'monopatinelectrico2.webp',17),(104,0,'monopatinelectrico3.webp',17),(105,0,'monopatinelectrico4.webp',17),(106,1,'hoverboard1.webp',18),(107,0,'hoverboard2.webp',18),(108,0,'hoverboard3.webp',18),(109,0,'hoverboard4.webp',18),(110,1,'bicicleta1.webp',19),(111,0,'bicicleta2.webp',19),(112,0,'bicicleta3.webp',19),(113,0,'bicicleta4.webp',19),(114,1,'bicicletaelectrica1.webp',20),(115,0,'bicicletaelectrica2.webp',20),(116,0,'bicicletaelectrica3.webp',20),(117,0,'bicicletaelectrica4.webp',20),(118,1,'monopatin1.webp',21),(119,0,'monopatin1.webp',21),(120,0,'monopatin1.webp',21),(121,1,'autito1.webp',22),(122,0,'autito1.webp',22),(123,0,'autito1.webp',22),(124,1,'utilesescolares1.webp',23),(125,0,'utilesescolares1.webp',23),(126,0,'utilesescolares1.webp',23),(127,0,'utilesescolares1.webp',23),(128,1,'triciclo1.webp',24),(129,0,'triciclo1.webp',24),(130,0,'triciclo1.webp',24),(131,0,'triciclo1.webp',24),(139,1,'/img/1655390953752.webp',24),(140,0,'/img/1655390953752.webp',24),(141,0,'/img/1655390953753.webp',24),(142,1,'/img/1655391052108.webp',34),(143,0,'/img/1655391052109.webp',34),(144,0,'/img/1655391052110.webp',34),(145,0,'/img/1655391052111.webp',34),(146,1,'/img/1655391093031.webp',35),(147,0,'/img/1655391093037.webp',35),(148,0,'/img/1655391093038.webp',35),(149,0,'/img/1655391093039.webp',35),(154,0,'auriculares4.webp',1),(201,0,'1660304761058.webp',53),(202,0,'1660304761059.webp',53),(203,0,'1660304761061.webp',53),(204,0,'1660304761062.webp',53),(205,0,'1660304761063.webp',53),(206,1,'1660304761057.webp',53),(207,0,'1660306050108.webp',54),(208,0,'1660306050111.webp',54),(209,0,'1660306050111.webp',54),(210,0,'1660306050112.webp',54),(211,0,'1660306050113.webp',54),(212,1,'1660306050107.webp',54),(213,0,'1660575730214.webp',55),(214,0,'1660575730215.webp',55),(215,0,'1660575730215.webp',55),(216,1,'1660575730212.webp',55),(217,0,'1660578753185.webp',56),(218,1,'1660578753184.webp',56);
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `idmarca` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `idcategoria` int NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Sony',1),(2,'Apple',1),(3,'MSI',1),(4,'Hoodies',2),(5,'Nike',2),(6,'Montagne',2),(7,'Columbia',2),(8,'Piero',3),(9,'Deco Hogar',3),(10,'Sillones Comfy',3),(11,'Nike',4),(12,'Fit Shop',4),(13,'Furia Sobre 2 Ruedas',5),(14,'Bike N\' Chill',5),(15,'Furia Sobre 2 Ruedas',6),(16,'Deetoys',6),(17,'Grafica & Utiles',6),(18,'LG',1),(20,'Head',4);
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediosdepago`
--

DROP TABLE IF EXISTS `mediosdepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediosdepago` (
  `idmediosdepago` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `activo` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idmediosdepago`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediosdepago`
--

LOCK TABLES `mediosdepago` WRITE;
/*!40000 ALTER TABLE `mediosdepago` DISABLE KEYS */;
INSERT INTO `mediosdepago` VALUES (1,'Visa (Débito)',1),(2,'Visa (Crédito)',1),(3,'MasterCard (Débito)',1),(4,'MasterCard (Crédito)',1),(5,'MercadoPago',1),(6,'Rapipago',1),(7,'PagoFacil',1),(8,'Transferencia Bancaria',1);
/*!40000 ALTER TABLE `mediosdepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `idpais` int NOT NULL AUTO_INCREMENT,
  `PaisNombre` char(52) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idpais`),
  UNIQUE KEY `PaisCodigo_UNIQUE` (`idpais`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Argentina'),(2,'Brazil'),(3,'Chile'),(4,'Uruguay');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `idpregunta` int NOT NULL AUTO_INCREMENT,
  `idusuario` int NOT NULL,
  `pregunta` text NOT NULL,
  `idpublicacion` int DEFAULT NULL,
  `fechapregunta` date NOT NULL,
  `reportado` int DEFAULT '0',
  `respondido` int DEFAULT '0',
  PRIMARY KEY (`idpregunta`),
  KEY `fk_preguntas` (`idpublicacion`),
  CONSTRAINT `fk_preguntas` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,1,'Hola funciona con pilas AAA?',3,'2022-06-08',0,0),(2,1,'Viene en color rojo ferrari?',3,'2022-06-08',0,0),(3,2,'Hola, que resolución tiene la pantalla?',3,'2022-05-30',0,0),(4,140,'Me los prestas?',1,'2022-06-20',0,0),(5,140,'Es removible la bateria?',2,'2022-06-20',0,0);
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `idProvincia` int NOT NULL AUTO_INCREMENT,
  `PaisCodigo` int NOT NULL,
  `Provincia` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`idProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,1,'Buenos Aires'),(2,1,'Catamarca'),(3,1,'Chaco'),(4,1,'Chubut'),(5,1,'Córdoba'),(6,1,'Corrientes'),(7,1,'Distrito Federal'),(8,1,'Entre Rios'),(9,1,'Formosa'),(10,1,'Jujuy'),(11,1,'La Rioja'),(12,1,'Mendoza'),(13,1,'Misiones'),(14,1,'Neuquén'),(15,1,'Otra'),(16,1,'Rio Negro'),(17,1,'Salta'),(18,1,'San Juan'),(19,1,'San Luis'),(20,1,'Santa Cruz'),(21,1,'Santa Fé'),(22,1,'Santiago del Estero'),(23,1,'Tucumán');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicaciones` (
  `idpublicacion` int NOT NULL AUTO_INCREMENT,
  `precio` decimal(8,2) DEFAULT NULL,
  `descripcion` text,
  `idusuario` int NOT NULL,
  `habilitado` int DEFAULT '1',
  `idcategoria` int NOT NULL,
  `idsubcategoria` int DEFAULT NULL,
  `fechapublicacion` date DEFAULT NULL,
  `reportado` int DEFAULT '0',
  `titulo` varchar(70) NOT NULL,
  `detallepublicacion` text,
  `stock` int DEFAULT '1',
  `colores` varchar(45) NOT NULL,
  `idmarca` int NOT NULL,
  `visible` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idpublicacion`),
  KEY `fk_usuarios` (`idusuario`),
  KEY `fk_categorias` (`idcategoria`),
  KEY `fk_marcas_idx` (`idmarca`),
  CONSTRAINT `fk_categorias` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`),
  CONSTRAINT `fk_marcas` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`idmarca`),
  CONSTRAINT `fk_usuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicaciones`
--

LOCK TABLES `publicaciones` WRITE;
/*!40000 ALTER TABLE `publicaciones` DISABLE KEYS */;
INSERT INTO `publicaciones` VALUES (1,1234.00,'Auriculares inalambricos Sony WH-1000XM4 black. <br> Alcance inalambrico de 10m. <br> Duracion de bateria de 30h. <br> Manos libres incluido',1,1,1,1,'2022-06-07',0,'Auriculares inalambricos Sony','<h2>Este sería el titulo del detalle de la publicacion</h2>\r\n<p>un parrafito de prueba</p>\r\n',80,'Negro',1,1),(2,265800.00,'Apple Macbook Air. <br> Capacidad: 8GB RAM / 512 GB SSD <br> Hasta 18 horas de bateria. <br> GPU de hasta 8 nucleos. <br> Pantalla Retina de 13.3 pulgadas',1,1,1,1,'2022-06-09',0,'Macbook Air','<h2>Este sería el titulo del detalle de la publicacion</h2>',89,'Blanco, Griz',2,1),(3,345098.00,'Notebook gamer MSI Thin GF63. <br> Capacidad: 8GB RAM / 512 GB SSD <br> Hasta 20 horas de bateria <br> Placa de video NVIDIA GeForce GTX 1650 Max-Q <br> Pantalla LED de 15.6 pulgadas.',2,1,1,1,'2022-06-01',0,'Notebook MSI','<h2>Este sería el titulo del detalle de la publicacion</h2>',93,'Negro',3,1),(4,240000.00,'Sony Playstation 5 Digital edition <br> Memoria de 825GB <br> Resolucion de 3840px x 2160px. <br> Memoria RAM de 16GB <br> Cuenta con: 1 cable de alimentación ca, 1 cable hdmi, 1 cable de carga usb, 1 dock.',1,1,1,1,'2022-04-21',0,'Playstation 5','<h2>Este sería el titulo del detalle de la publicacion</h2>',96,'Blanco, Griz',1,1),(5,6500.00,'Buzo Canguro Hoodie con capucha. <br> 100% algodon <br> Talles S, M, L, XL disponibles <br> Ideal para el invierno.',2,1,2,1,'2022-05-14',0,'Buzo Canguro','<h2>Este sería el titulo del detalle de la publicacion</h2>',96,'Negro',4,1),(6,12600.45,'Nike Court Legacy. <br> Estilo urbano. <br> Ajuste con cordones',1,1,2,1,'2022-05-14',0,'Zapatillas Nike','<h2>Este sería el titulo del detalle de la publicacion</h2>',98,'Negro',5,1),(7,8000.00,'Modelo: Sherpa hombre. <br> Con bolsillos <br> Tiro medio.',2,1,2,1,'2022-05-14',0,'Pantalon Cargo','<h2>Este sería el titulo del detalle de la publicacion</h2>',90,'Griz Oscuro',6,1),(8,16000.00,'Campera Softshell Verde Con Capucha. <br> Impermeable. <br> Ideal para el invierno. <br> Talles M, L, XL disponibles.',1,1,2,1,'2022-05-14',0,'Campera Softshell','<h2>Este sería el titulo del detalle de la publicacion</h2>',95,'Verde',7,1),(9,75000.00,'Base Somier BOX con Cajones. <br> Peso máximo soportado por cama: 240 kg. <br> Largo x Ancho: 195 cm x 142 cm',2,1,3,1,'2022-05-14',0,'Cama Box Base','<h2>Este sería el titulo del detalle de la publicacion</h2>',98,'Griz Claro',8,1),(10,25000.00,'Combo 4 sillas, modelo Eames. <br> Materiales de la estructura: Polipropileno <br> Medidas: Alto 83cm, Ancho 47cm, profundidad 45cm',2,1,3,1,'2022-05-14',0,'Silla de Comedor','<h2>Este sería el titulo del detalle de la publicacion</h2>',99,'Blanco',9,1),(11,320000.00,'Material de tapizado: Chenile. <br> Cantidad de cuerpos: 2. <br> Material de las patas: madera.',1,1,3,1,'2022-05-14',0,'Sillón Esquinero','<h2>Este sería el titulo del detalle de la publicacion</h2>',84,'Griz, Negro, Blanco, Marron',10,1),(12,48000.00,'Material de la base: Melamina <br> Material del tablero: Melamina <br> Es extensible: No <br> Requiere ensamblado: Sí',2,1,3,1,'2022-05-14',0,'Mesa Ratona','<h2>Este sería el titulo del detalle de la publicacion</h2>',98,'Madera, Negro',9,1),(13,6500.00,'Tipo de superficie: Futsal. <br> Material: Goma <br> Año de lanzamiento: 2022',1,1,4,1,'2022-05-14',0,'Pelota Nike','<h2>Este sería el titulo del detalle de la publicacion</h2>',100,'Blanco, Negro',11,1),(14,13000.00,'Tipo de superficie: cesped. <br> Modelo: Phantom 316-9183 <br>',1,1,4,1,'2022-05-14',0,'Botines Nike','<h2>Este sería el titulo del detalle de la publicacion</h2>',94,'Griz',11,1),(15,7000.00,'Set 2 mancuernas <br> Peso: 5KG c/u <br> Material de recubrimiento de la mancuerna: Goma',1,1,4,1,'2022-05-14',0,'Mancuerna','<h2>Este sería el titulo del detalle de la publicacion</h2>',99,'Metalico, Negro',12,1),(16,4300.00,'Precio por unidad. <br> Largo x Ancho: 100 cm x 40 cm <br>Espesor: 3 cm <br> Densidad: 22 kg/m³',2,1,4,1,'2022-05-14',0,'Colchoneta gimnasia','<h2>Este sería el titulo del detalle de la publicacion</h2>',93,'Rojo, Naranja, Verde, Azul, Violeta',12,1),(17,107000.00,'Potencia del motor: 250 W <br> Velocidad máxima: 25 km/h <br> Peso: 12.5 kg <br> Altura: 114 cm <br> Largo: 108 cm <br> Ancho: 43 cm',2,1,5,1,'2022-05-14',0,'Monopatín Eléctrico','<h2>Este sería el titulo del detalle de la publicacion</h2>',100,'Griz, Metalico',15,1),(18,140000.00,'Modelo: F5-MAX <br> Velocidad máxima: 12 km/h <br> Tiempo de carga: 180 m',1,1,5,1,'2022-05-14',0,'Hoverboard','<h2>Este sería el titulo del detalle de la publicacion</h2>',92,'Negro, Rojo',15,1),(19,120000.00,'Tipo de bicicleta: Mountain bike <br> Rodado: 29 <br> Tamaño del cuadro: 18 \" <br> Cantidad de velocidades: 21',1,1,5,1,'2022-05-14',0,'Bicicleta MTB','<h2>Este sería el titulo del detalle de la publicacion</h2>',90,'Naranja',15,1),(20,190000.00,'Modelo	F500X-FFBIKE20-R <br> Rodado 20*3 <br> Motor 250W <br> Bateria 7,8AH',2,1,5,1,'2022-05-14',0,'Bicicleta Eléctrica','<h2>Este sería el titulo del detalle de la publicacion</h2>',100,'Rojo',15,1),(21,7000.00,'Materiales del monopatín: Aluminio <br> Material del deck: Alumínio <br> Peso: 6 kg <br> Es plegable: Sí',1,1,6,1,'2022-05-14',0,'Monopatín','<h2>Este sería el titulo del detalle de la publicacion</h2>',100,'Azul, Negro',15,1),(22,11000.00,'Tipo de alimentación del vehículo: Pilas <br> Edad mínima recomendada: 2 años <br> Marca: Carformers <br> Escala: 20cm',1,1,6,1,'2022-05-14',0,'Auto a control remoto','<h2>Este sería el titulo del detalle de la publicacion</h2>',99,'Azul, Rojo',16,1),(23,5000.00,'Incluye: 2 Cuadernos tapa blanda, 4 Resaltadores, 2 Lapiceras. <br> 1 Lapiz negro, 1 Goma de borrar, 1 Regla <br> 1 Kit de notas',1,1,6,1,'2022-05-14',0,'Kit utiles escolares','<h2>Este sería el titulo del detalle de la publicacion</h2>',99,'Multicolor',17,1),(24,9800.00,'Edad mínima recomendada: 2 años <br> Edad máxima recomendada: 4 años <br> Material de las ruedas: Poliuretano <br> Peso: 4.5 kg <br> Este triciclo será más que un vehículo de 3 ruedas para los niños. Gracias a su diseño y fácil uso, se volverá rápidamente un compañero de aventuras para los más chicos.',2,1,6,1,'2022-05-14',0,'Triciclo','<h2>Este sería el titulo del detalle de la publicacion</h2>',95,'Rojo, Azul, Amarillo',15,1),(53,9658.00,'<h2>Descripci&oacute;n</h2>\r\n<p>Doble c&aacute;mara y m&aacute;s detalles<br>Sus 2 c&aacute;maras traseras de 13 Mpx/2 Mpx te permitir&aacute;n tomar im&aacute;genes con m&aacute;s detalles y lograr efectos &uacute;nicos como el famoso modo retrato de poca profundidad de campo.<br><br>Adem&aacute;s, el dispositivo cuenta con c&aacute;mara frontal de 5 Mpx para que puedas sacarte divertidas selfies o hacer videollamadas.<br><br>M&aacute;s para ver<br>Con su pantalla IPS de 6.5\", disfrut&aacute; de colores intensos y mayor nitidez en todos tus contenidos.<br><br>Todo lo que necesit&aacute;s<br>Su memoria RAM de 2 GB es justo lo que necesit&aacute;s para utilizar las funciones m&aacute;s importantes como llamar, enviar mensajes, navegar y ejecutar aplicaciones de uso frecuente como redes sociales o multimedia.<br><br>Desbloqueo facial y dactilar<br>M&aacute;xima seguridad para que solo vos puedas acceder al equipo. Podr&aacute;s elegir entre el sensor de huella dactilar para habilitar el tel&eacute;fono en un toque, o el reconocimiento facial que permite un desbloqueo hasta un 30% m&aacute;s r&aacute;pido.<br><br>Bater&iacute;a de duraci&oacute;n superior<br>&iexcl;Desenchufate! Con la s&uacute;per bater&iacute;a de 4000 mAh tendr&aacute;s energ&iacute;a por mucho m&aacute;s tiempo para jugar, ver series o trabajar sin necesidad de realizar recargas.<br><br>El espacio que necesit&aacute;s<br>Con su memoria interna de 32 GB descarg&aacute; tus aplicaciones favoritas y guard&aacute; todas las fotos y videos que quieras.</p>',1,1,1,NULL,NULL,0,'producto de prueba','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Negrosdfsd',2,0),(54,9685.00,'<p style=\"text-align: left;\">El mejor <em>celular </em>de la historia del ser <strong>humano</strong></p>',1,1,1,NULL,NULL,0,'oooooooooooooorrr','<div>\r\n<div>\r\n<h1>Detalles t&eacute;cnicos</h1>\r\n</div>\r\n</div>\r\n<div aria-expanded=\"true\">\r\n<div>\r\n<div aria-expanded=\"true\">\r\n<table id=\"productDetails_techSpec_section_1\" style=\"width: 680.594px;\" role=\"presentation\">\r\n<tbody>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Marca</th>\r\n<td>&lrm;SAMSUNG</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Fabricante</th>\r\n<td>&lrm;Samsung</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Modelo</th>\r\n<td>&lrm;SM-S908BZWGEUH</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Nombre del modelo</th>\r\n<td>&lrm;S22</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">A&ntilde;o del modelo</th>\r\n<td>&lrm;2022</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Dimensiones del paquete</th>\r\n<td>&lrm;18.2 x 9.5 x 2.9 cm; 320 gramos</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Pilas</th>\r\n<td>&lrm;1 Litio Ion necesaria(s), incluida(s)</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">N&uacute;mero de modelo del producto</th>\r\n<td>&lrm;SM-S908BZWGEUH</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">N&uacute;mero de producto</th>\r\n<td>&lrm;SM-S908BZWGEUH</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Capacidad de la memoria RAM</th>\r\n<td>&lrm;8 GB</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Capacidad de la memoria</th>\r\n<td>&lrm;8 GB</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Capacidad de la memoria flash instalada</th>\r\n<td>&lrm;8 GB</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Capacidad de almacenamiento digital</th>\r\n<td>&lrm;256 GB</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Sistema operativo</th>\r\n<td>&lrm;Android</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Componentes incluidos</th>\r\n<td>&lrm;USB Cable</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">N&uacute;mero de productos</th>\r\n<td>&lrm;1</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Tama&ntilde;o de la pantalla</th>\r\n<td>&lrm;6.8 Pulgadas</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Tipo de pantalla</th>\r\n<td>&lrm;LCD</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Pilas / bater&iacute;as incluidas</th>\r\n<td>&lrm;S&iacute;</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Pilas / bater&iacute;as necesarias</th>\r\n<td>&lrm;S&iacute;</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Battery Power Rating</th>\r\n<td>&lrm;3700</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Tecnolog&iacute;a GSM</th>\r\n<td>&lrm;5G</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Factor de forma</th>\r\n<td>&lrm;Slider</td>\r\n</tr>\r\n<tr>\r\n<th style=\"width: 340.297px;\">Peso del producto</th>\r\n<td>&lrm;320 g</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>',50,'Negrowdfsdfsdf',18,1),(55,6800.00,'<ul>\r\n<li style=\"list-style-type: none;\">\r\n<p>Material de la palma: SOLID</p>\r\n</li>\r\n<li style=\"list-style-type: none;\">\r\n<p>Material del dorso: PVC</p>\r\n</li>\r\n<li style=\"list-style-type: none;\">\r\n<p>Corte del guante: Expanse</p>\r\n</li>\r\n<li style=\"list-style-type: none;\">Marca: Reusch</li>\r\n</ul>',2,1,4,NULL,NULL,0,'Guantes arquero','',1,'Negro, Griz',5,1),(56,3180.00,'<p>Tipo de pelota: Entrenamiento.</p>\r\n<p>Tipo de cancha: Rapida / Lenta.</p>\r\n<p>Formato de venta: Tubo.</p>',2,1,4,NULL,NULL,0,'Tubo X3 Pelotas tennis','',1,'Amarillo',20,1);
/*!40000 ALTER TABLE `publicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas` (
  `idrespuesta` int NOT NULL AUTO_INCREMENT,
  `idpregunta` int NOT NULL,
  `respuesta` text,
  `fecharespuesta` date DEFAULT NULL,
  `reportado` int DEFAULT '0',
  PRIMARY KEY (`idrespuesta`),
  KEY `fk_respuestas` (`idpregunta`),
  CONSTRAINT `fk_respuestas` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idpregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Esta es la tabla que contiene las respuestas de las preguntas realizadas por los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
INSERT INTO `respuestas` VALUES (1,1,'Hola, no. Tiene batería interna','2022-06-09',0);
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fechanac` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `habilitado` int DEFAULT '1',
  `imagen` varchar(255) DEFAULT '',
  PRIMARY KEY (`idusuario`,`usuario`),
  KEY `idusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'José','de Figueiredo','3548978765','2003-06-12','jldefigueiredo@gmail.com','Jose','$2b$10$LTSqR0eQuwCCqzq/xf0./OCwpCwk8BiKttuL1yQtz.T1nNganp7qS',1,'yo.jpg'),(2,'Matias','Granda','123456789','1993-07-03','matigranda93@gmail.com','Mati','$2b$10$.6G4tI.F9yG.LmlAKeVjKe2sI6qtfEWGuvMU5Vy016FT8uyiKNz2i',1,'1653407731808.jpg'),(10,'Roseanna','Trahmel','840-301-1253','2020-09-12','rtrahmel0@weibo.com','rtrahmel0','NzoQvtChmuuq',0,'http://dummyimage.com/210x100.png/5fa2dd/ffffff'),(11,'Rebeka','Handscombe','321-238-1947','2020-05-06','rhandscombe1@artisteer.com','rhandscombe1','XULblP',1,'http://dummyimage.com/122x100.png/ff4444/ffffff'),(12,'Tarrah','Fifoot','261-276-1646','2018-08-08','tfifoot2@cafepress.com','tfifoot2','yq9nq7OKO',0,'http://dummyimage.com/183x100.png/cc0000/ffffff'),(13,'Barbabas','Snaden','422-225-3342','2018-06-19','bsnaden3@diigo.com','bsnaden3','yEV1PP1u',0,'http://dummyimage.com/204x100.png/dddddd/000000'),(14,'Matthew','Kyle','168-702-7413','2018-12-28','mkyle4@europa.eu','mkyle4','IiGk0te1ObV',1,'http://dummyimage.com/117x100.png/dddddd/000000'),(15,'Correy','Tryhorn','600-389-6191','2021-08-09','ctryhorn5@simplemachines.org','ctryhorn5','GfJMS8MfNk',1,'http://dummyimage.com/104x100.png/5fa2dd/ffffff'),(16,'Sosanna','Devinn','220-339-0183','2022-01-26','sdevinn6@nbcnews.com','sdevinn6','4oroNWm1d',1,'http://dummyimage.com/234x100.png/dddddd/000000'),(17,'Finn','Lawrence','948-589-9306','2021-02-21','flawrence7@google.co.uk','flawrence7','rAsdC9QsC4B',0,'http://dummyimage.com/208x100.png/cc0000/ffffff'),(18,'Romola','Miller','558-218-0588','2021-10-11','rmiller8@typepad.com','rmiller8','BDjWSfpMPV',0,'http://dummyimage.com/156x100.png/5fa2dd/ffffff'),(19,'Zia','Tithacott','893-783-0331','2022-05-03','ztithacott9@quantcast.com','ztithacott9','TXaMNFEpfWh',0,'http://dummyimage.com/138x100.png/ff4444/ffffff'),(20,'Meagan','Grishaev','865-684-7003','2019-03-18','mgrishaeva@surveymonkey.com','mgrishaeva','fL8MCHTaNRc7',1,'http://dummyimage.com/140x100.png/5fa2dd/ffffff'),(21,'Alaine','Plume','949-979-1490','2017-12-17','aplumeb@ucla.edu','aplumeb','xgpOpxeRCiq',1,'http://dummyimage.com/132x100.png/cc0000/ffffff'),(22,'Scarlet','Hunnywell','387-506-9337','2018-07-07','shunnywellc@netlog.com','shunnywellc','RXpIYCZxX9V',0,'http://dummyimage.com/230x100.png/ff4444/ffffff'),(23,'Madelle','Bennedsen','970-665-1019','2020-05-03','mbennedsend@bloglovin.com','mbennedsend','0xYnHMS',0,'http://dummyimage.com/229x100.png/5fa2dd/ffffff'),(24,'Celka','Grzelewski','701-188-8227','2022-05-20','cgrzelewskie@xing.com','cgrzelewskie','T0suHde9A3l2',0,'http://dummyimage.com/203x100.png/5fa2dd/ffffff'),(25,'Ashely','Adamo','464-333-9492','2022-05-05','aadamof@ucsd.edu','aadamof','ioIqTn3sAK',1,'http://dummyimage.com/222x100.png/5fa2dd/ffffff'),(26,'Seumas','Douglas','459-778-0669','2021-02-23','sdouglasg@youtube.com','sdouglasg','3CGlk5CC',0,'http://dummyimage.com/215x100.png/ff4444/ffffff'),(27,'Nadia','Josifovic','533-832-1949','2020-11-19','njosifovich@auda.org.au','njosifovich','Huf0l88Bq2D1',1,'http://dummyimage.com/191x100.png/cc0000/ffffff'),(28,'Mirna','Peverell','389-723-6150','2022-03-16','mpeverelli@vistaprint.com','mpeverelli','OBx9AEJuQmJ7',1,'http://dummyimage.com/183x100.png/5fa2dd/ffffff'),(29,'Merwin','Brookesbie','692-917-9831','2019-01-22','mbrookesbiej@stanford.edu','mbrookesbiej','9be18U',1,'http://dummyimage.com/249x100.png/dddddd/000000'),(30,'Robb','Daunter','424-344-8416','2019-12-04','rdaunterk@etsy.com','rdaunterk','S2C7Xz',1,'http://dummyimage.com/122x100.png/5fa2dd/ffffff'),(31,'Olva','Fishpool','339-876-1955','2019-06-27','ofishpooll@accuweather.com','ofishpooll','4ppaSNR',1,'http://dummyimage.com/173x100.png/ff4444/ffffff'),(32,'Marietta','Cribbin','920-160-7331','2019-05-23','mcribbinm@dedecms.com','mcribbinm','aS5KLSN1Qe',1,'http://dummyimage.com/154x100.png/dddddd/000000'),(33,'Dallas','Dorrity','247-536-3641','2021-05-18','ddorrityn@europa.eu','ddorrityn','O9jDfEvaPAc',1,'http://dummyimage.com/121x100.png/5fa2dd/ffffff'),(34,'Ozzie','Rogans','166-941-7732','2022-04-07','oroganso@tinyurl.com','oroganso','2OJArm5',1,'http://dummyimage.com/131x100.png/ff4444/ffffff'),(35,'Dugald','Burberye','286-892-6893','2020-03-08','dburberyep@apple.com','dburberyep','ulbuuZ2KusHi',0,'http://dummyimage.com/122x100.png/cc0000/ffffff'),(36,'Linnea','Cholomin','983-342-6436','2017-07-26','lcholominq@about.me','lcholominq','AyA4Zm3pqtee',1,'http://dummyimage.com/176x100.png/cc0000/ffffff'),(37,'Arabella','Saura','381-356-1342','2020-06-21','asaurar@shutterfly.com','asaurar','bnxyoWcY',1,'http://dummyimage.com/150x100.png/dddddd/000000'),(38,'Pauly','Bugg','265-266-1239','2021-01-31','pbuggs@hubpages.com','pbuggs','6xDsLc1uR7hX',1,'http://dummyimage.com/139x100.png/cc0000/ffffff'),(39,'Roseanna','Trahmel','840-301-1253','2020-09-12','rtrahmel0@weibo.com','rtrahmel0','NzoQvtChmuuq',0,'http://dummyimage.com/210x100.png/5fa2dd/ffffff'),(40,'Rebeka','Handscombe','321-238-1947','2020-05-06','rhandscombe1@artisteer.com','rhandscombe1','XULblP',1,'http://dummyimage.com/122x100.png/ff4444/ffffff'),(41,'Tarrah','Fifoot','261-276-1646','2018-08-08','tfifoot2@cafepress.com','tfifoot2','yq9nq7OKO',0,'http://dummyimage.com/183x100.png/cc0000/ffffff'),(42,'Barbabas','Snaden','422-225-3342','2018-06-19','bsnaden3@diigo.com','bsnaden3','yEV1PP1u',0,'http://dummyimage.com/204x100.png/dddddd/000000'),(43,'Matthew','Kyle','168-702-7413','2018-12-28','mkyle4@europa.eu','mkyle4','IiGk0te1ObV',1,'http://dummyimage.com/117x100.png/dddddd/000000'),(44,'Correy','Tryhorn','600-389-6191','2021-08-09','ctryhorn5@simplemachines.org','ctryhorn5','GfJMS8MfNk',1,'http://dummyimage.com/104x100.png/5fa2dd/ffffff'),(45,'Sosanna','Devinn','220-339-0183','2022-01-26','sdevinn6@nbcnews.com','sdevinn6','4oroNWm1d',1,'http://dummyimage.com/234x100.png/dddddd/000000'),(46,'Finn','Lawrence','948-589-9306','2021-02-21','flawrence7@google.co.uk','flawrence7','rAsdC9QsC4B',0,'http://dummyimage.com/208x100.png/cc0000/ffffff'),(47,'Romola','Miller','558-218-0588','2021-10-11','rmiller8@typepad.com','rmiller8','BDjWSfpMPV',0,'http://dummyimage.com/156x100.png/5fa2dd/ffffff'),(48,'Zia','Tithacott','893-783-0331','2022-05-03','ztithacott9@quantcast.com','ztithacott9','TXaMNFEpfWh',0,'http://dummyimage.com/138x100.png/ff4444/ffffff'),(49,'Meagan','Grishaev','865-684-7003','2019-03-18','mgrishaeva@surveymonkey.com','mgrishaeva','fL8MCHTaNRc7',1,'http://dummyimage.com/140x100.png/5fa2dd/ffffff'),(50,'Alaine','Plume','949-979-1490','2017-12-17','aplumeb@ucla.edu','aplumeb','xgpOpxeRCiq',1,'http://dummyimage.com/132x100.png/cc0000/ffffff'),(51,'Scarlet','Hunnywell','387-506-9337','2018-07-07','shunnywellc@netlog.com','shunnywellc','RXpIYCZxX9V',0,'http://dummyimage.com/230x100.png/ff4444/ffffff'),(52,'Madelle','Bennedsen','970-665-1019','2020-05-03','mbennedsend@bloglovin.com','mbennedsend','0xYnHMS',0,'http://dummyimage.com/229x100.png/5fa2dd/ffffff'),(53,'Celka','Grzelewski','701-188-8227','2022-05-20','cgrzelewskie@xing.com','cgrzelewskie','T0suHde9A3l2',0,'http://dummyimage.com/203x100.png/5fa2dd/ffffff'),(54,'Ashely','Adamo','464-333-9492','2022-05-05','aadamof@ucsd.edu','aadamof','ioIqTn3sAK',1,'http://dummyimage.com/222x100.png/5fa2dd/ffffff'),(55,'Seumas','Douglas','459-778-0669','2021-02-23','sdouglasg@youtube.com','sdouglasg','3CGlk5CC',0,'http://dummyimage.com/215x100.png/ff4444/ffffff'),(56,'Nadia','Josifovic','533-832-1949','2020-11-19','njosifovich@auda.org.au','njosifovich','Huf0l88Bq2D1',1,'http://dummyimage.com/191x100.png/cc0000/ffffff'),(57,'Mirna','Peverell','389-723-6150','2022-03-16','mpeverelli@vistaprint.com','mpeverelli','OBx9AEJuQmJ7',1,'http://dummyimage.com/183x100.png/5fa2dd/ffffff'),(58,'Merwin','Brookesbie','692-917-9831','2019-01-22','mbrookesbiej@stanford.edu','mbrookesbiej','9be18U',1,'http://dummyimage.com/249x100.png/dddddd/000000'),(59,'Robb','Daunter','424-344-8416','2019-12-04','rdaunterk@etsy.com','rdaunterk','S2C7Xz',1,'http://dummyimage.com/122x100.png/5fa2dd/ffffff'),(60,'Olva','Fishpool','339-876-1955','2019-06-27','ofishpooll@accuweather.com','ofishpooll','4ppaSNR',1,'http://dummyimage.com/173x100.png/ff4444/ffffff'),(61,'Marietta','Cribbin','920-160-7331','2019-05-23','mcribbinm@dedecms.com','mcribbinm','aS5KLSN1Qe',1,'http://dummyimage.com/154x100.png/dddddd/000000'),(62,'Dallas','Dorrity','247-536-3641','2021-05-18','ddorrityn@europa.eu','ddorrityn','O9jDfEvaPAc',1,'http://dummyimage.com/121x100.png/5fa2dd/ffffff'),(63,'Ozzie','Rogans','166-941-7732','2022-04-07','oroganso@tinyurl.com','oroganso','2OJArm5',1,'http://dummyimage.com/131x100.png/ff4444/ffffff'),(64,'Dugald','Burberye','286-892-6893','2020-03-08','dburberyep@apple.com','dburberyep','ulbuuZ2KusHi',0,'http://dummyimage.com/122x100.png/cc0000/ffffff'),(65,'Linnea','Cholomin','983-342-6436','2017-07-26','lcholominq@about.me','lcholominq','AyA4Zm3pqtee',1,'http://dummyimage.com/176x100.png/cc0000/ffffff'),(66,'Arabella','Saura','381-356-1342','2020-06-21','asaurar@shutterfly.com','asaurar','bnxyoWcY',1,'http://dummyimage.com/150x100.png/dddddd/000000'),(67,'Pauly','Bugg','265-266-1239','2021-01-31','pbuggs@hubpages.com','pbuggs','6xDsLc1uR7hX',1,'http://dummyimage.com/139x100.png/cc0000/ffffff'),(68,'Maxie','Danilchenko','574-971-4948','2018-08-16','mdanilchenkot@amazonaws.com','mdanilchenkot','0r7zADs5',0,'http://dummyimage.com/130x100.png/cc0000/ffffff'),(69,'Cullen','Castelain','545-730-6814','2020-12-11','ccastelainu@nifty.com','ccastelainu','TCncet',1,'http://dummyimage.com/195x100.png/cc0000/ffffff'),(70,'Annamaria','Beetles','168-776-4950','2021-01-29','abeetlesv@hc360.com','abeetlesv','I3p0BnF84',1,'http://dummyimage.com/211x100.png/5fa2dd/ffffff'),(71,'Myrta','Ohlsen','910-163-0500','2022-01-18','mohlsenw@a8.net','mohlsenw','1RfltiD061yq',0,'http://dummyimage.com/136x100.png/5fa2dd/ffffff'),(72,'Colas','Giamo','120-858-6968','2020-10-27','cgiamox@digg.com','cgiamox','FdWYaSs1b1',0,'http://dummyimage.com/198x100.png/cc0000/ffffff'),(73,'Sergei','Weber','814-805-6692','2021-10-02','swebery@soundcloud.com','swebery','C14Kx6',1,'http://dummyimage.com/184x100.png/cc0000/ffffff'),(74,'Terrence','Ebhardt','403-597-3463','2020-10-26','tebhardtz@4shared.com','tebhardtz','rkZm16jCgK',1,'http://dummyimage.com/239x100.png/5fa2dd/ffffff'),(75,'Carissa','Edmunds','146-154-4952','2018-07-04','cedmunds10@nhs.uk','cedmunds10','R5ZlaIIRUV4',0,'http://dummyimage.com/197x100.png/dddddd/000000'),(76,'Odelia','Hendonson','272-331-2102','2020-11-05','ohendonson11@bigcartel.com','ohendonson11','lk5J9xH',1,'http://dummyimage.com/168x100.png/dddddd/000000'),(77,'Donny','Lighton','168-478-0803','2019-07-29','dlighton12@umn.edu','dlighton12','3oD5s7Ia',1,'http://dummyimage.com/226x100.png/ff4444/ffffff'),(78,'Joell','Mixon','791-658-9401','2020-12-29','jmixon13@bloglines.com','jmixon13','OYYvOw',1,'http://dummyimage.com/152x100.png/dddddd/000000'),(79,'Kerby','Rickell','391-692-2617','2020-11-16','krickell14@amazon.de','krickell14','MqhyogFuFn',0,'http://dummyimage.com/165x100.png/cc0000/ffffff'),(80,'Atlanta','Grocock','656-965-5998','2018-08-13','agrocock15@scribd.com','agrocock15','Ts7r2sM68y',0,'http://dummyimage.com/220x100.png/5fa2dd/ffffff'),(81,'Morena','Mussettini','424-436-9533','2020-07-09','mmussettini16@topsy.com','mmussettini16','PfFQ7VUwmhmP',1,'http://dummyimage.com/125x100.png/ff4444/ffffff'),(82,'Abram','Hasnney','319-501-5628','2020-08-14','ahasnney17@fc2.com','ahasnney17','WeP9Of',0,'http://dummyimage.com/179x100.png/5fa2dd/ffffff'),(83,'Martha','Lake','375-544-9782','2020-10-19','mlake18@who.int','mlake18','fICKQYfWo',1,'http://dummyimage.com/235x100.png/cc0000/ffffff'),(84,'Zonda','Van Schafflaer','452-794-3994','2020-09-07','zvanschafflaer19@indiegogo.com','zvanschafflaer19','HurQLoiCHN',1,'http://dummyimage.com/102x100.png/dddddd/000000'),(85,'Sandor','Storek','471-676-8785','2021-08-03','sstorek1a@jigsy.com','sstorek1a','zYrNSsIpj',0,'http://dummyimage.com/250x100.png/dddddd/000000'),(86,'Cassaundra','Shieldon','818-205-0940','2017-12-08','cshieldon1b@weebly.com','cshieldon1b','0otIGOcuJ',1,'http://dummyimage.com/134x100.png/ff4444/ffffff'),(87,'Moore','Hartnup','834-762-8232','2017-10-26','mhartnup1c@house.gov','mhartnup1c','s1QxFvpnX4L',0,'http://dummyimage.com/142x100.png/ff4444/ffffff'),(88,'Bo','Manklow','367-686-5320','2020-08-07','bmanklow1d@parallels.com','bmanklow1d','4zGXji3pdkG8',0,'http://dummyimage.com/199x100.png/dddddd/000000'),(89,'Wiatt','Mannock','885-231-9563','2019-07-14','wmannock1e@ow.ly','wmannock1e','MnkMJWHaZbpc',0,'http://dummyimage.com/219x100.png/5fa2dd/ffffff'),(90,'Kilian','Gerty','263-152-9590','2020-03-13','kgerty1f@godaddy.com','kgerty1f','xvYiYwc4vs',1,'http://dummyimage.com/230x100.png/cc0000/ffffff'),(91,'Temp','Puttick','755-296-9054','2020-03-06','tputtick1g@aboutads.info','tputtick1g','pJ6sKu2jT',1,'http://dummyimage.com/232x100.png/dddddd/000000'),(92,'Addia','Halifax','907-437-4161','2020-02-13','ahalifax1h@booking.com','ahalifax1h','fBGM9nck',0,'http://dummyimage.com/187x100.png/5fa2dd/ffffff'),(93,'Wilt','Dugood','951-935-2327','2022-05-05','wdugood1i@bing.com','wdugood1i','fdcYvG',0,'http://dummyimage.com/214x100.png/cc0000/ffffff'),(94,'Livvyy','Mynard','242-240-6304','2018-07-08','lmynard1j@technorati.com','lmynard1j','2H8H5V3yx9',1,'http://dummyimage.com/188x100.png/ff4444/ffffff'),(95,'Peria','Tersay','902-110-3010','2021-10-10','ptersay1k@spiegel.de','ptersay1k','u1Ln3Y7eRIDx',0,'http://dummyimage.com/193x100.png/5fa2dd/ffffff'),(96,'Ariel','Govan','559-471-5198','2021-02-05','agovan1l@miibeian.gov.cn','agovan1l','tiEGZHv',1,'http://dummyimage.com/119x100.png/cc0000/ffffff'),(97,'Consuelo','Tubbles','703-968-7420','2022-06-04','ctubbles1m@ebay.co.uk','ctubbles1m','xrdFSYnA',1,'http://dummyimage.com/127x100.png/cc0000/ffffff'),(98,'Free','Wheatley','562-387-3968','2020-12-30','fwheatley1n@answers.com','fwheatley1n','CG7NdSDdUgdg',0,'http://dummyimage.com/231x100.png/ff4444/ffffff'),(99,'Revkah','Juszkiewicz','418-631-3874','2017-09-09','rjuszkiewicz1o@blogs.com','rjuszkiewicz1o','hlqCln',1,'http://dummyimage.com/202x100.png/ff4444/ffffff'),(100,'Siouxie','Jakubovsky','461-629-0451','2017-09-13','sjakubovsky1p@unblog.fr','sjakubovsky1p','LvmvISrkeBzV',0,'http://dummyimage.com/136x100.png/ff4444/ffffff'),(101,'Tabbatha','Cradock','344-807-7572','2021-07-24','tcradock1q@state.tx.us','tcradock1q','Tm7M2x2yy6',1,'http://dummyimage.com/248x100.png/cc0000/ffffff'),(102,'Donnie','McLenahan','845-289-0603','2019-04-11','dmclenahan1r@washington.edu','dmclenahan1r','cJsEu6',1,'http://dummyimage.com/135x100.png/dddddd/000000'),(103,'Aeriel','MacCurlye','375-579-3589','2020-03-21','amaccurlye1s@plala.or.jp','amaccurlye1s','5MD8Ww',1,'http://dummyimage.com/150x100.png/cc0000/ffffff'),(104,'Helyn','Adaway','403-494-8053','2019-12-02','hadaway1t@marriott.com','hadaway1t','J1YGecQ2794N',1,'http://dummyimage.com/203x100.png/5fa2dd/ffffff'),(105,'Cory','McDuff','955-578-3200','2018-06-02','cmcduff1u@eventbrite.com','cmcduff1u','asZQQVFc',1,'http://dummyimage.com/164x100.png/ff4444/ffffff'),(106,'Hieronymus','Duddan','552-686-4863','2020-12-22','hduddan1v@stanford.edu','hduddan1v','zfrNlrl6',0,'http://dummyimage.com/205x100.png/cc0000/ffffff'),(107,'Tracy','Cayette','812-368-7911','2017-11-04','tcayette1w@pagesperso-orange.fr','tcayette1w','aoNSPo',0,'http://dummyimage.com/216x100.png/ff4444/ffffff'),(108,'Dan','Clews','769-920-6609','2020-01-29','dclews1x@geocities.jp','dclews1x','wwmKOv0jQM',1,'http://dummyimage.com/244x100.png/5fa2dd/ffffff'),(109,'Adela','Allibon','725-389-7010','2017-09-11','aallibon1y@yolasite.com','aallibon1y','F2Olq2RmNoQ',1,'http://dummyimage.com/243x100.png/dddddd/000000'),(110,'Lloyd','Slany','608-285-6324','2018-06-21','lslany1z@hud.gov','lslany1z','BuZ5BMQn',0,'http://dummyimage.com/202x100.png/dddddd/000000'),(111,'Arlana','Glaves','890-932-6217','2021-08-28','aglaves20@wired.com','aglaves20','pKWMWs',0,'http://dummyimage.com/246x100.png/5fa2dd/ffffff'),(112,'Lauritz','Dalla','842-219-1908','2018-08-25','ldalla21@histats.com','ldalla21','XRrYOrLL',1,'http://dummyimage.com/219x100.png/dddddd/000000'),(113,'Guy','Billison','685-150-3251','2020-02-07','gbillison22@deliciousdays.com','gbillison22','F7Vkwz',0,'http://dummyimage.com/133x100.png/5fa2dd/ffffff'),(114,'Lorelei','Tuxell','749-772-1676','2020-09-22','ltuxell23@booking.com','ltuxell23','THH3KS',0,'http://dummyimage.com/113x100.png/5fa2dd/ffffff'),(115,'Jenica','Stoll','632-796-7641','2018-03-25','jstoll24@soundcloud.com','jstoll24','yte9sGDo',1,'http://dummyimage.com/171x100.png/ff4444/ffffff'),(116,'Hyacinth','Gear','108-254-5022','2021-06-25','hgear25@wsj.com','hgear25','mb05TdQkAg',1,'http://dummyimage.com/216x100.png/5fa2dd/ffffff'),(117,'Jenine','Quigley','848-563-1273','2019-08-08','jquigley26@dropbox.com','jquigley26','umxf49Sbh',0,'http://dummyimage.com/159x100.png/cc0000/ffffff'),(118,'Prescott','Drinkhall','269-790-6289','2022-04-08','pdrinkhall27@cloudflare.com','pdrinkhall27','wd9MvMcH75M',0,'http://dummyimage.com/226x100.png/ff4444/ffffff'),(119,'Liane','Daverin','124-716-4939','2021-10-05','ldaverin28@mozilla.org','ldaverin28','oW1IQKZ1EkL',0,'http://dummyimage.com/226x100.png/ff4444/ffffff'),(120,'Mata','Verson','131-130-8982','2021-09-04','mverson29@sciencedirect.com','mverson29','d6C7om',1,'http://dummyimage.com/217x100.png/5fa2dd/ffffff'),(121,'Dexter','Spiers','710-290-7443','2017-12-23','dspiers2a@sogou.com','dspiers2a','WE55yk4Wo9t',1,'http://dummyimage.com/192x100.png/5fa2dd/ffffff'),(122,'Issie','Froment','527-167-5862','2018-06-20','ifroment2b@desdev.cn','ifroment2b','0NX9dsnl',1,'http://dummyimage.com/158x100.png/5fa2dd/ffffff'),(123,'Martie','O\'Scandall','826-977-5902','2021-08-31','moscandall2c@free.fr','moscandall2c','a2pVCRKjHoE',0,'http://dummyimage.com/109x100.png/cc0000/ffffff'),(124,'Baron','Benedek','574-908-6532','2022-01-31','bbenedek2d@4shared.com','bbenedek2d','z3jpWeo3',0,'http://dummyimage.com/131x100.png/5fa2dd/ffffff'),(125,'Pavla','Hackleton','918-717-7369','2019-01-25','phackleton2e@ifeng.com','phackleton2e','n0FbImjZA4',0,'http://dummyimage.com/163x100.png/ff4444/ffffff'),(126,'Mitch','Klausewitz','309-120-5464','2019-10-16','mklausewitz2f@ameblo.jp','mklausewitz2f','SaiBtjvyopBd',0,'http://dummyimage.com/116x100.png/ff4444/ffffff'),(127,'Patricia','Dutnall','618-150-5383','2020-04-27','pdutnall2g@latimes.com','pdutnall2g','T4t9lYP',1,'http://dummyimage.com/154x100.png/5fa2dd/ffffff'),(128,'Minna','Stickings','199-835-5999','2017-11-21','mstickings2h@shutterfly.com','mstickings2h','bsEluuk15IFO',0,'http://dummyimage.com/171x100.png/5fa2dd/ffffff'),(129,'Blanch','Larsen','787-355-8572','2020-07-01','blarsen2i@liveinternet.ru','blarsen2i','8qh3gxX',1,'http://dummyimage.com/145x100.png/ff4444/ffffff'),(130,'Vania','Timblett','239-696-2744','2017-07-29','vtimblett2j@naver.com','vtimblett2j','LATTdEw',0,'http://dummyimage.com/210x100.png/cc0000/ffffff'),(131,'Annis','Beckensall','850-737-8431','2022-04-23','abeckensall2k@msu.edu','abeckensall2k','ju9Db7t9506d',1,'http://dummyimage.com/122x100.png/5fa2dd/ffffff'),(132,'Taber','Darter','517-185-8561','2019-06-05','tdarter2l@tuttocitta.it','tdarter2l','rNOlI7XAHIA',1,'http://dummyimage.com/169x100.png/5fa2dd/ffffff'),(133,'Siobhan','Till','241-283-4273','2021-07-17','still2m@netvibes.com','still2m','BzZl49j',0,'http://dummyimage.com/156x100.png/5fa2dd/ffffff'),(134,'Hurley','MacGorrie','216-663-0467','2021-05-22','hmacgorrie2n@miitbeian.gov.cn','hmacgorrie2n','baE4TTtt',1,'http://dummyimage.com/148x100.png/ff4444/ffffff'),(135,'Carlotta','Lambswood','622-614-8681','2021-09-08','clambswood2o@webmd.com','clambswood2o','Cp2KWGsnv4nc',1,'http://dummyimage.com/191x100.png/cc0000/ffffff'),(136,'Lindy','Rutland','153-794-2529','2018-04-02','lrutland2p@github.com','lrutland2p','ln7m0foM',1,'http://dummyimage.com/148x100.png/5fa2dd/ffffff'),(137,'Car','Skypp','405-986-4388','2018-08-28','cskypp2q@disqus.com','cskypp2q','gpQP5YCpC0YI',0,'http://dummyimage.com/104x100.png/5fa2dd/ffffff'),(138,'Avigdor','Rushbrook','535-451-0516','2017-07-28','arushbrook2r@ovh.net','arushbrook2r','Cwgy4BtTBrq',0,'http://dummyimage.com/233x100.png/5fa2dd/ffffff'),(140,'cosme','fulanito','123456789','1783-01-14','cosme@fulanito.com','CosmeFulanito','$2b$10$lls1FhOImLcXpTXVol9Fuuon532.s3NfXvBxQ1fzxE/Tc6M.F0Pke',1,'default.png'),(141,'usuario','prueba','123456789','2022-08-09','usuarioprueba@prueba.com','usuarioprueba','$2b$10$txzOcLTUjpGdpPwvXHsrzu65qCChFrwNA4eVyW2q94t6qRSVTK1ju',1,'default.png'),(143,'Matias','Granda','123456789','2022-08-08','matigranda93@gmail.com','Matuca','$2b$10$hRV5LRjtZqtlAZ.uvlqBK.svp0eSo40tDjLpwiTY3eCnylvwEs2Ge',1,'default.png'),(144,'mati','granda','123456789','2022-08-01','matigranda93@gmail.com','mati','$2b$10$AbYjWrI/Q5vF91EhtNLcEeEp.vr9pXluoC76jTSMLtMOQTe5evBki',1,'default.png'),(145,'mati123','mati123','123456789','2022-08-01','mati123@mail.com','mati123','$2b$10$QRfzJPO/bWUj/FSEJlZpse0QraB9Q2KL7MA0t0zJhlWx68VEFk6bC',1,'default.png');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idventa` int NOT NULL AUTO_INCREMENT,
  `idusuario` int DEFAULT NULL,
  `montototal` int DEFAULT NULL,
  `mediodepago` int DEFAULT NULL,
  `domicilioentrega` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fechayhora` datetime NOT NULL,
  PRIMARY KEY (`idventa`),
  UNIQUE KEY `idventa_UNIQUE` (`idventa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,2,3631336,1,'1','2022-08-03 12:36:58'),(2,2,329234,1,'1','2022-08-03 12:40:21'),(3,1,265800,1,'2','2022-08-03 13:06:36'),(4,1,761098,1,'2','2022-08-03 13:07:05'),(5,1,6500,1,'2','2022-08-05 07:37:25'),(6,1,9685,4,'2','2022-08-05 12:37:30');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-15 12:55:47
