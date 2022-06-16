/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : amazona_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-06-16 14:37:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for calificaciones
-- ----------------------------
DROP TABLE IF EXISTS `calificaciones`;
CREATE TABLE `calificaciones` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` text NOT NULL,
  `idpublicacion` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `calificacion` int(11) NOT NULL DEFAULT 1,
  `reportado` int(11) DEFAULT 0,
  `habilitado` int(11) DEFAULT 1,
  PRIMARY KEY (`idcomentario`),
  KEY `fk_calificaciones` (`idpublicacion`),
  CONSTRAINT `fk_calificaciones` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calificaciones
-- ----------------------------
INSERT INTO `calificaciones` VALUES ('1', 'Esta muy bueno', '1', '1', '3', '0', '1');
INSERT INTO `calificaciones` VALUES ('2', 'Prueba', '2', '1', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('3', 'Prueba', '3', '2', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('4', 'Prueba', '4', '1', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('5', 'Prueba', '5', '2', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('6', 'Prueba', '6', '2', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('7', 'Prueba', '7', '1', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('8', 'Prueba', '8', '2', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('9', 'Prueba', '9', '1', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('10', 'Prueba', '10', '2', '5', '0', '1');
INSERT INTO `calificaciones` VALUES ('11', 'Prueba', '11', '2', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('12', 'Prueba', '12', '1', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('13', 'Prueba', '13', '1', '5', '0', '1');
INSERT INTO `calificaciones` VALUES ('14', 'Prueba', '14', '1', '5', '0', '1');
INSERT INTO `calificaciones` VALUES ('15', 'Prueba', '15', '2', '5', '0', '1');
INSERT INTO `calificaciones` VALUES ('16', 'Prueba', '16', '2', '5', '0', '1');
INSERT INTO `calificaciones` VALUES ('17', 'Prueba', '17', '1', '5', '0', '1');
INSERT INTO `calificaciones` VALUES ('18', 'Prueba', '18', '1', '5', '0', '1');
INSERT INTO `calificaciones` VALUES ('19', 'Prueba', '19', '2', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('20', 'Prueba', '20', '1', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('21', 'Prueba', '21', '2', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('22', 'Prueba', '22', '2', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('23', 'Prueba', '23', '2', '5', '0', '1');
INSERT INTO `calificaciones` VALUES ('24', 'Prueba', '24', '1', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('25', 'Prueba', '1', '1', '5', '0', '1');
INSERT INTO `calificaciones` VALUES ('26', 'Prueba', '2', '1', '4', '0', '1');
INSERT INTO `calificaciones` VALUES ('27', 'Prueba', '3', '1', '5', '0', '1');
INSERT INTO `calificaciones` VALUES ('28', 'Prueba', '4', '1', '4', '0', '1');

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `habilitado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('1', 'Tecnología', '1');
INSERT INTO `categorias` VALUES ('2', 'Moda', '1');
INSERT INTO `categorias` VALUES ('3', 'Hogar', '1');
INSERT INTO `categorias` VALUES ('4', 'Deportes', '1');
INSERT INTO `categorias` VALUES ('5', 'Movilidad', '1');
INSERT INTO `categorias` VALUES ('6', 'Niños', '1');

-- ----------------------------
-- Table structure for domicilios
-- ----------------------------
DROP TABLE IF EXISTS `domicilios`;
CREATE TABLE `domicilios` (
  `iddomicilios` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `altura` int(11) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  `depto` varchar(3) DEFAULT NULL,
  `idpais` int(11) NOT NULL,
  `idprovincia` int(11) NOT NULL,
  `cp` varchar(6) DEFAULT NULL,
  `default` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`iddomicilios`),
  KEY `fk_usuarios_domicilios` (`idusuario`),
  CONSTRAINT `fk_usuarios_domicilios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of domicilios
-- ----------------------------

-- ----------------------------
-- Table structure for imagenes
-- ----------------------------
DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE `imagenes` (
  `idimagen` int(11) NOT NULL AUTO_INCREMENT,
  `imagenprincipal` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(40) NOT NULL,
  `idpublicacion` int(11) NOT NULL,
  PRIMARY KEY (`idimagen`),
  KEY `fk_img_publicaciones` (`idpublicacion`),
  CONSTRAINT `fk_img_publicaciones` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagenes
-- ----------------------------
INSERT INTO `imagenes` VALUES ('1', '1', 'auriculares1.webp', '1');
INSERT INTO `imagenes` VALUES ('2', '0', 'auriculares2.webp', '1');
INSERT INTO `imagenes` VALUES ('3', '0', 'auriculares3.webp', '1');
INSERT INTO `imagenes` VALUES ('4', '0', 'auriculares4.webp', '1');
INSERT INTO `imagenes` VALUES ('5', '1', 'macbookair1.webp', '2');
INSERT INTO `imagenes` VALUES ('6', '0', 'macbookair2.webp', '2');
INSERT INTO `imagenes` VALUES ('7', '0', 'macbookair3.webp', '2');
INSERT INTO `imagenes` VALUES ('8', '0', 'macbookair4.webp', '2');
INSERT INTO `imagenes` VALUES ('9', '1', 'msi1.webp', '3');
INSERT INTO `imagenes` VALUES ('10', '0', 'msi2.webp', '3');
INSERT INTO `imagenes` VALUES ('11', '0', 'msi3.webp', '3');
INSERT INTO `imagenes` VALUES ('12', '0', 'msi4.webp', '3');
INSERT INTO `imagenes` VALUES ('13', '1', 'ps51.webp', '4');
INSERT INTO `imagenes` VALUES ('14', '0', 'ps52.webp', '4');
INSERT INTO `imagenes` VALUES ('15', '0', 'ps53.webp', '4');
INSERT INTO `imagenes` VALUES ('16', '0', 'ps54.webp', '4');
INSERT INTO `imagenes` VALUES ('17', '1', 'buzo1.webp', '5');
INSERT INTO `imagenes` VALUES ('18', '0', 'buzo2.webp', '5');
INSERT INTO `imagenes` VALUES ('19', '0', 'buzo3.webp', '5');
INSERT INTO `imagenes` VALUES ('20', '1', 'zapatillas1.webp', '6');
INSERT INTO `imagenes` VALUES ('21', '0', 'zapatillas2.webp', '6');
INSERT INTO `imagenes` VALUES ('22', '0', 'zapatillas3.webp', '6');
INSERT INTO `imagenes` VALUES ('23', '0', 'zapatillas4.webp', '6');
INSERT INTO `imagenes` VALUES ('24', '1', 'pantalon1.webp', '7');
INSERT INTO `imagenes` VALUES ('25', '0', 'pantalon2.webp', '7');
INSERT INTO `imagenes` VALUES ('26', '0', 'pantalon3.webp', '7');
INSERT INTO `imagenes` VALUES ('27', '1', 'campera1.webp', '8');
INSERT INTO `imagenes` VALUES ('28', '0', 'campera2.webp', '8');
INSERT INTO `imagenes` VALUES ('29', '0', 'campera3.webp', '8');
INSERT INTO `imagenes` VALUES ('79', '1', 'cama1.webp', '9');
INSERT INTO `imagenes` VALUES ('80', '0', 'cama2.webp', '9');
INSERT INTO `imagenes` VALUES ('81', '1', 'silla1.webp', '10');
INSERT INTO `imagenes` VALUES ('82', '0', 'silla2.webp', '10');
INSERT INTO `imagenes` VALUES ('83', '1', 'sillon1.webp', '11');
INSERT INTO `imagenes` VALUES ('84', '0', 'sillon2.webp', '11');
INSERT INTO `imagenes` VALUES ('85', '0', 'sillon3.webp', '11');
INSERT INTO `imagenes` VALUES ('86', '1', 'mesa1.webp', '12');
INSERT INTO `imagenes` VALUES ('87', '0', 'mesa2.webp', '12');
INSERT INTO `imagenes` VALUES ('88', '0', 'mesa3.webp', '12');
INSERT INTO `imagenes` VALUES ('89', '1', 'pelota1.webp', '13');
INSERT INTO `imagenes` VALUES ('90', '0', 'pelota1.webp', '13');
INSERT INTO `imagenes` VALUES ('91', '0', 'pelota1.webp', '13');
INSERT INTO `imagenes` VALUES ('92', '1', 'botines1.webp', '14');
INSERT INTO `imagenes` VALUES ('93', '0', 'botines2.webp', '14');
INSERT INTO `imagenes` VALUES ('94', '0', 'botines3.webp', '14');
INSERT INTO `imagenes` VALUES ('95', '1', 'pesas1.webp', '15');
INSERT INTO `imagenes` VALUES ('96', '0', 'pesas2.webp', '15');
INSERT INTO `imagenes` VALUES ('97', '0', 'pesas3.webp', '15');
INSERT INTO `imagenes` VALUES ('98', '1', 'colchoneta1.webp', '16');
INSERT INTO `imagenes` VALUES ('99', '0', 'colchoneta2.webp', '16');
INSERT INTO `imagenes` VALUES ('100', '0', 'colchoneta3.webp', '16');
INSERT INTO `imagenes` VALUES ('101', '0', 'colchoneta4.webp', '16');
INSERT INTO `imagenes` VALUES ('102', '1', 'monopatinelectrico1.webp', '17');
INSERT INTO `imagenes` VALUES ('103', '0', 'monopatinelectrico2.webp', '17');
INSERT INTO `imagenes` VALUES ('104', '0', 'monopatinelectrico3.webp', '17');
INSERT INTO `imagenes` VALUES ('105', '0', 'monopatinelectrico4.webp', '17');
INSERT INTO `imagenes` VALUES ('106', '1', 'hoverboard1.webp', '18');
INSERT INTO `imagenes` VALUES ('107', '0', 'hoverboard2.webp', '18');
INSERT INTO `imagenes` VALUES ('108', '0', 'hoverboard3.webp', '18');
INSERT INTO `imagenes` VALUES ('109', '0', 'hoverboard4.webp', '18');
INSERT INTO `imagenes` VALUES ('110', '1', 'bicicleta1.webp', '19');
INSERT INTO `imagenes` VALUES ('111', '0', 'bicicleta2.webp', '19');
INSERT INTO `imagenes` VALUES ('112', '0', 'bicicleta3.webp', '19');
INSERT INTO `imagenes` VALUES ('113', '0', 'bicicleta4.webp', '19');
INSERT INTO `imagenes` VALUES ('114', '1', 'bicicletaelectrica1.webp', '20');
INSERT INTO `imagenes` VALUES ('115', '0', 'bicicletaelectrica2.webp', '20');
INSERT INTO `imagenes` VALUES ('116', '0', 'bicicletaelectrica3.webp', '20');
INSERT INTO `imagenes` VALUES ('117', '0', 'bicicletaelectrica4.webp', '20');
INSERT INTO `imagenes` VALUES ('118', '1', 'monopatin1.webp', '21');
INSERT INTO `imagenes` VALUES ('119', '0', 'monopatin1.webp', '21');
INSERT INTO `imagenes` VALUES ('120', '0', 'monopatin1.webp', '21');
INSERT INTO `imagenes` VALUES ('121', '1', 'autito1.webp', '22');
INSERT INTO `imagenes` VALUES ('122', '0', 'autito1.webp', '22');
INSERT INTO `imagenes` VALUES ('123', '0', 'autito1.webp', '22');
INSERT INTO `imagenes` VALUES ('124', '1', 'utilesescolares1.webp', '23');
INSERT INTO `imagenes` VALUES ('125', '0', 'utilesescolares1.webp', '23');
INSERT INTO `imagenes` VALUES ('126', '0', 'utilesescolares1.webp', '23');
INSERT INTO `imagenes` VALUES ('127', '0', 'utilesescolares1.webp', '23');
INSERT INTO `imagenes` VALUES ('128', '1', 'triciclo1.webp', '24');
INSERT INTO `imagenes` VALUES ('129', '0', 'triciclo1.webp', '24');
INSERT INTO `imagenes` VALUES ('130', '0', 'triciclo1.webp', '24');
INSERT INTO `imagenes` VALUES ('131', '0', 'triciclo1.webp', '24');
INSERT INTO `imagenes` VALUES ('139', '1', '/img/1655390953752.webp', '24');
INSERT INTO `imagenes` VALUES ('140', '0', '/img/1655390953752.webp', '24');
INSERT INTO `imagenes` VALUES ('141', '0', '/img/1655390953753.webp', '24');
INSERT INTO `imagenes` VALUES ('142', '1', '/img/1655391052108.webp', '34');
INSERT INTO `imagenes` VALUES ('143', '0', '/img/1655391052109.webp', '34');
INSERT INTO `imagenes` VALUES ('144', '0', '/img/1655391052110.webp', '34');
INSERT INTO `imagenes` VALUES ('145', '0', '/img/1655391052111.webp', '34');
INSERT INTO `imagenes` VALUES ('146', '1', '/img/1655391093031.webp', '35');
INSERT INTO `imagenes` VALUES ('147', '0', '/img/1655391093037.webp', '35');
INSERT INTO `imagenes` VALUES ('148', '0', '/img/1655391093038.webp', '35');
INSERT INTO `imagenes` VALUES ('149', '0', '/img/1655391093039.webp', '35');

-- ----------------------------
-- Table structure for preguntas
-- ----------------------------
DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE `preguntas` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `idpublicacion` int(11) DEFAULT NULL,
  `fechapregunta` date NOT NULL,
  `reportado` int(11) DEFAULT 0,
  PRIMARY KEY (`idpregunta`),
  KEY `fk_preguntas` (`idpublicacion`),
  CONSTRAINT `fk_preguntas` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preguntas
-- ----------------------------
INSERT INTO `preguntas` VALUES ('1', '1', 'Hola funciona con pilas AAA?', '3', '2022-06-08', '0');
INSERT INTO `preguntas` VALUES ('2', '1', 'Viene en color rojo ferrari?', '3', '2022-06-08', '0');
INSERT INTO `preguntas` VALUES ('3', '2', 'Hola, que resolución tiene la pantalla?', '3', '2022-05-30', '0');

-- ----------------------------
-- Table structure for publicaciones
-- ----------------------------
DROP TABLE IF EXISTS `publicaciones`;
CREATE TABLE `publicaciones` (
  `idpublicacion` int(11) NOT NULL AUTO_INCREMENT,
  `precio` decimal(8,2) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `habilitado` int(11) DEFAULT 1,
  `idcategoria` int(11) NOT NULL,
  `idsubcategoria` int(11) DEFAULT NULL,
  `fechapublicacion` date DEFAULT NULL,
  `reportado` int(11) DEFAULT 0,
  `titulo` varchar(70) NOT NULL,
  `detallepublicacion` text DEFAULT NULL,
  `stock` int(11) DEFAULT 1,
  `marca` varchar(45) NOT NULL,
  `colores` varchar(45) NOT NULL,
  PRIMARY KEY (`idpublicacion`),
  KEY `fk_usuarios` (`idusuario`),
  KEY `fk_categorias` (`idcategoria`),
  CONSTRAINT `fk_categorias` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`),
  CONSTRAINT `fk_usuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicaciones
-- ----------------------------
INSERT INTO `publicaciones` VALUES ('1', '17500.00', 'Auriculares inalambricos Sony WH-1000XM4 black. Alcance inalambrico de 10m. Duracion de bateria de 30h. Manos libres incluido', '1', '1', '1', '1', '2022-06-07', '0', 'Auriculares inalambricos Sony', '<h2>Este sería el titulo del detalle de la publicacion</h2>\r\n<p>un parrafito de prueba</p>\r\n', '8', 'Sony', 'Negro');
INSERT INTO `publicaciones` VALUES ('2', '265800.00', 'Apple Macbook Air Capacidad: 8GB RAM / 512 GB SSD Hasta 18 horas de bateria. GPU de hasta 8 nucleos. Pantalla Retina de 13.3 pulgadas', '1', '1', '1', '1', '2022-06-09', '0', 'Macbook Air', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '4', 'Apple', 'Blanco, Griz');
INSERT INTO `publicaciones` VALUES ('3', '345098.00', 'Notebook gamer MSI Thin GF63 Capacidad: 8GB RAM / 512 GB SSD Hasta 20 horas de bateria Placa de video NVIDIA GeForce GTX 1650 Max-Q Pantalla LED de 15.6 pulgadas.', '2', '1', '1', '1', '2022-06-01', '0', 'Notebook MSI', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '3', 'MSI', 'Negro');
INSERT INTO `publicaciones` VALUES ('4', '240000.00', 'Sony Playstation 5 Digital edition Memoria de 825GB Resolucion de 3840px x 2160px.Memoria RAM de 16GB Cuenta con: 1 cable de alimentación ca, 1 cable hdmi, 1 cable de carga usb, 1 dock.', '1', '1', '1', '1', '2022-04-21', '0', 'Playstation 5', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '56', 'Sony', 'Blanco, Griz');
INSERT INTO `publicaciones` VALUES ('5', '6500.00', 'Buzo Canguro Hoodie con capucha 100% algodon Talles S, M, L, XL disponibles Ideal para el invierno.', '2', '1', '2', '1', '2022-05-14', '0', 'Buzo Canguro', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '2', 'Hoodies', 'Negro');
INSERT INTO `publicaciones` VALUES ('6', '12600.00', 'Agregar descripcion', '1', '1', '2', '1', '2022-05-14', '0', 'Zapatillas Nike', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Nike', 'Negro');
INSERT INTO `publicaciones` VALUES ('7', '8000.00', 'Agregar descripcion', '2', '1', '2', '1', '2022-05-14', '0', 'Pantalon Cargo', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '3', 'Montagne', 'Griz Oscuro');
INSERT INTO `publicaciones` VALUES ('8', '16000.00', 'Campera Softshell Verde Con Capucha. Impermeable. Ideal para el invierno. Talles M, L, XL disponibles.', '1', '1', '2', '1', '2022-05-14', '0', 'Campera Softshell', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '78', 'Columbia', 'Verde');
INSERT INTO `publicaciones` VALUES ('9', '75000.00', 'Agregar descripcion', '2', '1', '3', '1', '2022-05-14', '0', 'Cama Box Base', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '9', 'Piero', 'Griz Claro');
INSERT INTO `publicaciones` VALUES ('10', '25000.00', 'Agregar descripcion', '2', '1', '3', '1', '2022-05-14', '0', 'Silla de Comedor', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '6', 'Deco Hogar', 'Blanco');
INSERT INTO `publicaciones` VALUES ('11', '320000.00', 'Agregar descripcion', '1', '1', '3', '1', '2022-05-14', '0', 'Sillón Esquinero', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Sillones Comfy', 'Griz, Negro, Blanco, Marron');
INSERT INTO `publicaciones` VALUES ('12', '48000.00', 'Agregar descripcion', '2', '1', '3', '1', '2022-05-14', '0', 'Mesa Ratona', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Deco Hogar', 'Madera, Negro');
INSERT INTO `publicaciones` VALUES ('13', '6500.00', 'Agregar descripcion', '1', '1', '4', '1', '2022-05-14', '0', 'Pelota Nike', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Nike', 'Blanco, Negro');
INSERT INTO `publicaciones` VALUES ('14', '13000.00', 'Agregar descripcion', '1', '1', '4', '1', '2022-05-14', '0', 'Botines Nike', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Nike', 'Griz');
INSERT INTO `publicaciones` VALUES ('15', '7000.00', 'Agregar descripcion', '1', '1', '4', '1', '2022-05-14', '0', 'Mancuerna', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Fit Shop', 'Metalico, Negro');
INSERT INTO `publicaciones` VALUES ('16', '4300.00', 'Agregar descripcion', '2', '1', '4', '1', '2022-05-14', '0', 'Colchonetas', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Fit Shop', 'Rojo, Naranja, Verde, Azul, Violeta');
INSERT INTO `publicaciones` VALUES ('17', '107000.00', 'Agregar descripcion', '2', '1', '5', '1', '2022-05-14', '0', 'Monopatín Eléctrico', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Furia Sobre 2 Ruedas', 'Griz, Metalico');
INSERT INTO `publicaciones` VALUES ('18', '140000.00', 'Agregar descripcion', '1', '1', '5', '1', '2022-05-14', '0', 'Hoverboard', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Furia Sobre 2 Ruedas', 'Negro, Rojo');
INSERT INTO `publicaciones` VALUES ('19', '120000.00', 'Agregar descripcion', '1', '1', '5', '1', '2022-05-14', '0', 'Bicicleta MTB', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Bike N Chill', 'Naranja');
INSERT INTO `publicaciones` VALUES ('20', '190000.00', 'Agregar descripcion', '2', '1', '5', '1', '2022-05-14', '0', 'Bicicleta Eléctrica', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Bike N Chill', 'Rojo');
INSERT INTO `publicaciones` VALUES ('21', '7000.00', 'Agregar descripcion', '1', '1', '6', '1', '2022-05-14', '0', 'Monopatín', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Furia Sobre 2 Ruedas', 'Azul, Negro');
INSERT INTO `publicaciones` VALUES ('22', '11000.00', 'Agregar descripcion', '1', '1', '6', '1', '2022-05-14', '0', 'Auto a control remoto', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Deetoys', 'Azul, Rojo');
INSERT INTO `publicaciones` VALUES ('23', '5000.00', 'Agregar descripcion', '1', '1', '6', '1', '2022-05-14', '0', 'Kit utiles escolares', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Grafica & Utiles', 'Multicolor');
INSERT INTO `publicaciones` VALUES ('24', '9800.00', 'Agregar descripcion', '2', '1', '6', '1', '2022-05-14', '0', 'Triciclo', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Deetoys', 'Rojo, Azul, Amarillo');

-- ----------------------------
-- Table structure for respuestas
-- ----------------------------
DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE `respuestas` (
  `idrespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `idpregunta` int(11) NOT NULL,
  `respuesta` text DEFAULT NULL,
  `fecharespuesta` date DEFAULT NULL,
  `reportado` int(11) DEFAULT 0,
  PRIMARY KEY (`idrespuesta`),
  KEY `fk_respuestas` (`idpregunta`),
  CONSTRAINT `fk_respuestas` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idpregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Esta es la tabla que contiene las respuestas de las preguntas realizadas por los usuarios';

-- ----------------------------
-- Records of respuestas
-- ----------------------------
INSERT INTO `respuestas` VALUES ('1', '1', 'Hola, no. Tiene batería interna', '2022-06-09', '0');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fechanac` date NOT NULL,
  `email` varchar(40) NOT NULL,
  `usuario` varchar(12) NOT NULL,
  `password` varchar(255) NOT NULL,
  `habilitado` int(11) DEFAULT 1,
  `imagen` varchar(255) DEFAULT '',
  PRIMARY KEY (`idusuario`,`usuario`),
  KEY `idusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', 'José', 'de Figueiredo', '3548978765', '2003-06-12', 'jldefigueiredo@gmail.com', 'Jose', '$2b$10$LTSqR0eQuwCCqzq/xf0./OCwpCwk8BiKttuL1yQtz.T1nNganp7qS', '1', 'default.png');
INSERT INTO `usuarios` VALUES ('2', 'Matias', 'Granda', '126549876', '2022-05-18', 'matigranda93@gmail.com', 'Mati', '$2b$10$.6G4tI.F9yG.LmlAKeVjKe2sI6qtfEWGuvMU5Vy016FT8uyiKNz2i', '1', 'default.png');
