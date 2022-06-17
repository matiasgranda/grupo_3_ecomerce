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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (1,'Esta muy bueno',1,1,3,0,1),(2,'Prueba',2,1,4,0,1),(3,'Prueba',3,2,4,0,1),(4,'Prueba',4,1,4,0,1),(5,'Prueba',5,2,4,0,1),(6,'Prueba',6,2,4,0,1),(7,'Prueba',7,1,4,0,1),(8,'Prueba',8,2,4,0,1),(9,'Prueba',9,1,4,0,1),(10,'Prueba',10,2,5,0,1),(11,'Prueba',11,2,4,0,1),(12,'Prueba',12,1,4,0,1),(13,'Prueba',13,1,5,0,1),(14,'Prueba',14,1,5,0,1),(15,'Prueba',15,2,5,0,1),(16,'Prueba',16,2,5,0,1),(17,'Prueba',17,1,5,0,1),(18,'Prueba',18,1,5,0,1),(19,'Prueba',19,2,4,0,1),(20,'Prueba',20,1,4,0,1),(21,'Prueba',21,2,4,0,1),(22,'Prueba',22,2,4,0,1),(23,'Prueba',23,2,5,0,1),(24,'Prueba',24,1,4,0,1),(25,'Prueba',1,1,5,0,1),(26,'Prueba',2,1,4,0,1),(27,'Prueba',3,1,5,0,1),(28,'Prueba',4,1,4,0,1);
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
  `idprovincia` int NOT NULL,
  `cp` varchar(6) DEFAULT NULL,
  `default` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`iddomicilios`),
  KEY `fk_usuarios_domicilios` (`idusuario`),
  CONSTRAINT `fk_usuarios_domicilios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilios`
--

LOCK TABLES `domicilios` WRITE;
/*!40000 ALTER TABLE `domicilios` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
INSERT INTO `imagenes` VALUES (1,1,'auriculares1.webp',1),(2,0,'auriculares2.webp',1),(3,0,'auriculares3.webp',1),(4,0,'auriculares4.webp',1),(5,1,'macbookair1.webp',2),(6,0,'macbookair2.webp',2),(7,0,'macbookair3.webp',2),(8,0,'macbookair4.webp',2),(9,1,'msi1.webp',3),(10,0,'msi2.webp',3),(11,0,'msi3.webp',3),(12,0,'msi4.webp',3),(13,1,'ps51.webp',4),(14,0,'ps52.webp',4),(15,0,'ps53.webp',4),(16,0,'ps54.webp',4),(17,1,'buzo1.webp',5),(18,0,'buzo2.webp',5),(19,0,'buzo3.webp',5),(20,1,'zapatillas1.webp',6),(21,0,'zapatillas2.webp',6),(22,0,'zapatillas3.webp',6),(23,0,'zapatillas4.webp',6),(24,1,'pantalon1.webp',7),(25,0,'pantalon2.webp',7),(26,0,'pantalon3.webp',7),(27,1,'campera1.webp',8),(28,0,'campera2.webp',8),(29,0,'campera3.webp',8),(79,1,'cama1.webp',9),(80,0,'cama2.webp',9),(81,1,'silla1.webp',10),(82,0,'silla2.webp',10),(83,1,'sillon1.webp',11),(84,0,'sillon2.webp',11),(85,0,'sillon3.webp',11),(86,1,'mesa1.webp',12),(87,0,'mesa2.webp',12),(88,0,'mesa3.webp',12),(89,1,'pelota1.webp',13),(90,0,'pelota1.webp',13),(91,0,'pelota1.webp',13),(92,1,'botines1.webp',14),(93,0,'botines2.webp',14),(94,0,'botines3.webp',14),(95,1,'pesas1.webp',15),(96,0,'pesas2.webp',15),(97,0,'pesas3.webp',15),(98,1,'colchoneta1.webp',16),(99,0,'colchoneta2.webp',16),(100,0,'colchoneta3.webp',16),(101,0,'colchoneta4.webp',16),(102,1,'monopatinelectrico1.webp',17),(103,0,'monopatinelectrico2.webp',17),(104,0,'monopatinelectrico3.webp',17),(105,0,'monopatinelectrico4.webp',17),(106,1,'hoverboard1.webp',18),(107,0,'hoverboard2.webp',18),(108,0,'hoverboard3.webp',18),(109,0,'hoverboard4.webp',18),(110,1,'bicicleta1.webp',19),(111,0,'bicicleta2.webp',19),(112,0,'bicicleta3.webp',19),(113,0,'bicicleta4.webp',19),(114,1,'bicicletaelectrica1.webp',20),(115,0,'bicicletaelectrica2.webp',20),(116,0,'bicicletaelectrica3.webp',20),(117,0,'bicicletaelectrica4.webp',20),(118,1,'monopatin1.webp',21),(119,0,'monopatin1.webp',21),(120,0,'monopatin1.webp',21),(121,1,'autito1.webp',22),(122,0,'autito1.webp',22),(123,0,'autito1.webp',22),(124,1,'utilesescolares1.webp',23),(125,0,'utilesescolares1.webp',23),(126,0,'utilesescolares1.webp',23),(127,0,'utilesescolares1.webp',23),(128,1,'triciclo1.webp',24),(129,0,'triciclo1.webp',24),(130,0,'triciclo1.webp',24),(131,0,'triciclo1.webp',24),(139,1,'/img/1655390953752.webp',24),(140,0,'/img/1655390953752.webp',24),(141,0,'/img/1655390953753.webp',24),(142,1,'/img/1655391052108.webp',34),(143,0,'/img/1655391052109.webp',34),(144,0,'/img/1655391052110.webp',34),(145,0,'/img/1655391052111.webp',34),(146,1,'/img/1655391093031.webp',35),(147,0,'/img/1655391093037.webp',35),(148,0,'/img/1655391093038.webp',35),(149,0,'/img/1655391093039.webp',35);
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
  `marca` varchar(45) NOT NULL,
  `idcategoria` int NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Sony',1),(2,'Apple',1),(3,'MSI',1),(4,'Hoodies',2),(5,'Nike',2),(6,'Montagne',2),(7,'Columbia',2),(8,'Piero',3),(9,'Deco Hogar',3),(10,'Sillones Comfy',3),(11,'Nike',4),(12,'Fit Shop',4),(13,'Furia Sobre 2 Ruedas',5),(14,'Bike N\' Chill',5),(15,'Furia Sobre 2 Ruedas',6),(16,'Deetoys',6),(17,'Grafica & Utiles',6);
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
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
  PRIMARY KEY (`idpregunta`),
  KEY `fk_preguntas` (`idpublicacion`),
  CONSTRAINT `fk_preguntas` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (1,1,'Hola funciona con pilas AAA?',3,'2022-06-08',0),(2,1,'Viene en color rojo ferrari?',3,'2022-06-08',0),(3,2,'Hola, que resolución tiene la pantalla?',3,'2022-05-30',0);
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
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
  PRIMARY KEY (`idpublicacion`),
  KEY `fk_usuarios` (`idusuario`),
  KEY `fk_categorias` (`idcategoria`),
  KEY `fk_marcas_idx` (`idmarca`),
  CONSTRAINT `fk_categorias` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`),
  CONSTRAINT `fk_marcas` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`idmarca`),
  CONSTRAINT `fk_usuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicaciones`
--

LOCK TABLES `publicaciones` WRITE;
/*!40000 ALTER TABLE `publicaciones` DISABLE KEYS */;
INSERT INTO `publicaciones` VALUES (1,17500.00,'Auriculares inalambricos Sony WH-1000XM4 black. Alcance inalambrico de 10m. Duracion de bateria de 30h. Manos libres incluido',1,1,1,1,'2022-06-07',0,'Auriculares inalambricos Sony','<h2>Este sería el titulo del detalle de la publicacion</h2>\r\n<p>un parrafito de prueba</p>\r\n',8,'Negro',1),(2,265800.00,'Apple Macbook Air Capacidad: 8GB RAM / 512 GB SSD Hasta 18 horas de bateria. GPU de hasta 8 nucleos. Pantalla Retina de 13.3 pulgadas',1,1,1,1,'2022-06-09',0,'Macbook Air','<h2>Este sería el titulo del detalle de la publicacion</h2>',4,'Blanco, Griz',2),(3,345098.00,'Notebook gamer MSI Thin GF63 Capacidad: 8GB RAM / 512 GB SSD Hasta 20 horas de bateria Placa de video NVIDIA GeForce GTX 1650 Max-Q Pantalla LED de 15.6 pulgadas.',2,1,1,1,'2022-06-01',0,'Notebook MSI','<h2>Este sería el titulo del detalle de la publicacion</h2>',3,'Negro',3),(4,240000.00,'Sony Playstation 5 Digital edition Memoria de 825GB Resolucion de 3840px x 2160px.Memoria RAM de 16GB Cuenta con: 1 cable de alimentación ca, 1 cable hdmi, 1 cable de carga usb, 1 dock.',1,1,1,1,'2022-04-21',0,'Playstation 5','<h2>Este sería el titulo del detalle de la publicacion</h2>',56,'Blanco, Griz',1),(5,6500.00,'Buzo Canguro Hoodie con capucha 100% algodon Talles S, M, L, XL disponibles Ideal para el invierno.',2,1,2,1,'2022-05-14',0,'Buzo Canguro','<h2>Este sería el titulo del detalle de la publicacion</h2>',2,'Negro',4),(6,12600.00,'Agregar descripcion',1,1,2,1,'2022-05-14',0,'Zapatillas Nike','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Negro',5),(7,8000.00,'Agregar descripcion',2,1,2,1,'2022-05-14',0,'Pantalon Cargo','<h2>Este sería el titulo del detalle de la publicacion</h2>',3,'Griz Oscuro',6),(8,16000.00,'Campera Softshell Verde Con Capucha. Impermeable. Ideal para el invierno. Talles M, L, XL disponibles.',1,1,2,1,'2022-05-14',0,'Campera Softshell','<h2>Este sería el titulo del detalle de la publicacion</h2>',78,'Verde',7),(9,75000.00,'Agregar descripcion',2,1,3,1,'2022-05-14',0,'Cama Box Base','<h2>Este sería el titulo del detalle de la publicacion</h2>',9,'Griz Claro',8),(10,25000.00,'Agregar descripcion',2,1,3,1,'2022-05-14',0,'Silla de Comedor','<h2>Este sería el titulo del detalle de la publicacion</h2>',6,'Blanco',9),(11,320000.00,'Agregar descripcion',1,1,3,1,'2022-05-14',0,'Sillón Esquinero','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Griz, Negro, Blanco, Marron',10),(12,48000.00,'Agregar descripcion',2,1,3,1,'2022-05-14',0,'Mesa Ratona','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Madera, Negro',9),(13,6500.00,'Agregar descripcion',1,1,4,1,'2022-05-14',0,'Pelota Nike','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Blanco, Negro',11),(14,13000.00,'Agregar descripcion',1,1,4,1,'2022-05-14',0,'Botines Nike','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Griz',11),(15,7000.00,'Agregar descripcion',1,1,4,1,'2022-05-14',0,'Mancuerna','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Metalico, Negro',12),(16,4300.00,'Agregar descripcion',2,1,4,1,'2022-05-14',0,'Colchonetas','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Rojo, Naranja, Verde, Azul, Violeta',12),(17,107000.00,'Agregar descripcion',2,1,5,1,'2022-05-14',0,'Monopatín Eléctrico','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Griz, Metalico',15),(18,140000.00,'Agregar descripcion',1,1,5,1,'2022-05-14',0,'Hoverboard','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Negro, Rojo',15),(19,120000.00,'Agregar descripcion',1,1,5,1,'2022-05-14',0,'Bicicleta MTB','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Naranja',15),(20,190000.00,'Agregar descripcion',2,1,5,1,'2022-05-14',0,'Bicicleta Eléctrica','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Rojo',15),(21,7000.00,'Agregar descripcion',1,1,6,1,'2022-05-14',0,'Monopatín','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Azul, Negro',15),(22,11000.00,'Agregar descripcion',1,1,6,1,'2022-05-14',0,'Auto a control remoto','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Azul, Rojo',16),(23,5000.00,'Agregar descripcion',1,1,6,1,'2022-05-14',0,'Kit utiles escolares','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Multicolor',17),(24,9800.00,'Agregar descripcion',2,1,6,1,'2022-05-14',0,'Triciclo','<h2>Este sería el titulo del detalle de la publicacion</h2>',1,'Rojo, Azul, Amarillo',15);
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
  `usuario` varchar(12) NOT NULL,
  `password` varchar(255) NOT NULL,
  `habilitado` int DEFAULT '1',
  `imagen` varchar(255) DEFAULT '',
  PRIMARY KEY (`idusuario`,`usuario`),
  KEY `idusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'José','de Figueiredo','3548978765','2003-06-12','jldefigueiredo@gmail.com','Jose','$2b$10$LTSqR0eQuwCCqzq/xf0./OCwpCwk8BiKttuL1yQtz.T1nNganp7qS',1,'default.png'),(2,'Matias','Granda','126549876','2022-05-18','matigranda93@gmail.com','Mati','$2b$10$.6G4tI.F9yG.LmlAKeVjKe2sI6qtfEWGuvMU5Vy016FT8uyiKNz2i',1,'default.png');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-17 11:41:50
