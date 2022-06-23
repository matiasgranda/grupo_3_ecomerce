/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : amazona_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-06-23 09:03:09
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
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagenes
-- ----------------------------
INSERT INTO `imagenes` VALUES ('1', '1', 'auriculares1.webp', '1');
INSERT INTO `imagenes` VALUES ('2', '0', 'auriculares2.webp', '1');
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
INSERT INTO `imagenes` VALUES ('84', '1', 'sillon2.webp', '11');
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
INSERT INTO `imagenes` VALUES ('154', '0', 'auriculares4.webp', '1');

-- ----------------------------
-- Table structure for marcas
-- ----------------------------
DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of marcas
-- ----------------------------
INSERT INTO `marcas` VALUES ('1', 'Sony', '1');
INSERT INTO `marcas` VALUES ('2', 'Apple', '1');
INSERT INTO `marcas` VALUES ('3', 'MSI', '1');
INSERT INTO `marcas` VALUES ('4', 'Hoodies', '2');
INSERT INTO `marcas` VALUES ('5', 'Nike', '2');
INSERT INTO `marcas` VALUES ('6', 'Montagne', '2');
INSERT INTO `marcas` VALUES ('7', 'Columbia', '2');
INSERT INTO `marcas` VALUES ('8', 'Piero', '3');
INSERT INTO `marcas` VALUES ('9', 'Deco Hogar', '3');
INSERT INTO `marcas` VALUES ('10', 'Sillones Comfy', '3');
INSERT INTO `marcas` VALUES ('11', 'Nike', '4');
INSERT INTO `marcas` VALUES ('12', 'Fit Shop', '4');
INSERT INTO `marcas` VALUES ('13', 'Furia Sobre 2 Ruedas', '5');
INSERT INTO `marcas` VALUES ('14', 'Bike N\' Chill', '5');
INSERT INTO `marcas` VALUES ('15', 'Furia Sobre 2 Ruedas', '6');
INSERT INTO `marcas` VALUES ('16', 'Deetoys', '6');
INSERT INTO `marcas` VALUES ('17', 'Grafica & Utiles', '6');

-- ----------------------------
-- Table structure for paises
-- ----------------------------
DROP TABLE IF EXISTS `paises`;
CREATE TABLE `paises` (
  `PaisCodigo` char(3) NOT NULL,
  `PaisNombre` char(52) NOT NULL,
  PRIMARY KEY (`PaisCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of paises
-- ----------------------------
INSERT INTO `paises` VALUES ('ARG', 'Argentina');
INSERT INTO `paises` VALUES ('BRA', 'Brazil');
INSERT INTO `paises` VALUES ('CHL', 'Chile');
INSERT INTO `paises` VALUES ('URY', 'Uruguay');

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
-- Table structure for provincias
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `CiudadID` int(11) NOT NULL AUTO_INCREMENT,
  `PaisCodigo` char(3) NOT NULL DEFAULT '',
  `CiudadDistrito` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`CiudadID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of provincias
-- ----------------------------
INSERT INTO `provincias` VALUES ('1', 'ARG', 'Buenos Aires');
INSERT INTO `provincias` VALUES ('2', 'ARG', 'Catamarca');
INSERT INTO `provincias` VALUES ('3', 'ARG', 'Chaco');
INSERT INTO `provincias` VALUES ('4', 'ARG', 'Chubut');
INSERT INTO `provincias` VALUES ('5', 'ARG', 'Córdoba');
INSERT INTO `provincias` VALUES ('6', 'ARG', 'Corrientes');
INSERT INTO `provincias` VALUES ('7', 'ARG', 'Distrito Federal');
INSERT INTO `provincias` VALUES ('8', 'ARG', 'Entre Rios');
INSERT INTO `provincias` VALUES ('9', 'ARG', 'Formosa');
INSERT INTO `provincias` VALUES ('10', 'ARG', 'Jujuy');
INSERT INTO `provincias` VALUES ('11', 'ARG', 'La Rioja');
INSERT INTO `provincias` VALUES ('12', 'ARG', 'Mendoza');
INSERT INTO `provincias` VALUES ('13', 'ARG', 'Misiones');
INSERT INTO `provincias` VALUES ('14', 'ARG', 'Neuquén');
INSERT INTO `provincias` VALUES ('15', 'ARG', 'Otra');
INSERT INTO `provincias` VALUES ('16', 'ARG', 'Rio Negro');
INSERT INTO `provincias` VALUES ('17', 'ARG', 'Salta');
INSERT INTO `provincias` VALUES ('18', 'ARG', 'San Juan');
INSERT INTO `provincias` VALUES ('19', 'ARG', 'San Luis');
INSERT INTO `provincias` VALUES ('20', 'ARG', 'Santa Cruz');
INSERT INTO `provincias` VALUES ('21', 'ARG', 'Santa Fé');
INSERT INTO `provincias` VALUES ('22', 'ARG', 'Santiago del Estero');
INSERT INTO `provincias` VALUES ('23', 'ARG', 'Tucumán');

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
  `colores` varchar(45) NOT NULL,
  `idmarca` int(11) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idpublicacion`),
  KEY `fk_usuarios` (`idusuario`),
  KEY `fk_categorias` (`idcategoria`),
  KEY `fk_marcas_idx` (`idmarca`),
  CONSTRAINT `fk_categorias` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`),
  CONSTRAINT `fk_marcas` FOREIGN KEY (`idmarca`) REFERENCES `marcas` (`idmarca`),
  CONSTRAINT `fk_usuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicaciones
-- ----------------------------
INSERT INTO `publicaciones` VALUES ('1', '1234.00', 'Auriculares inalambricos Sony WH-1000XM4 black. Alcance inalambrico de 10m. Duracion de bateria de 30h. Manos libres incluido', '1', '1', '1', '1', '2022-06-07', '0', 'Auriculares inalambricos Sony', '<h2>Este sería el titulo del detalle de la publicacion</h2>\r\n<p>un parrafito de prueba</p>\r\n', '8', 'Negro', '1', '1');
INSERT INTO `publicaciones` VALUES ('2', '265800.00', 'Apple Macbook Air Capacidad: 8GB RAM / 512 GB SSD Hasta 18 horas de bateria. GPU de hasta 8 nucleos. Pantalla Retina de 13.3 pulgadas', '1', '1', '1', '1', '2022-06-09', '0', 'Macbook Air', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '4', 'Blanco, Griz', '2', '1');
INSERT INTO `publicaciones` VALUES ('3', '345098.00', 'Notebook gamer MSI Thin GF63 Capacidad: 8GB RAM / 512 GB SSD Hasta 20 horas de bateria Placa de video NVIDIA GeForce GTX 1650 Max-Q Pantalla LED de 15.6 pulgadas.', '2', '1', '1', '1', '2022-06-01', '0', 'Notebook MSI', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '3', 'Negro', '3', '1');
INSERT INTO `publicaciones` VALUES ('4', '240000.00', 'Sony Playstation 5 Digital edition Memoria de 825GB Resolucion de 3840px x 2160px.Memoria RAM de 16GB Cuenta con: 1 cable de alimentación ca, 1 cable hdmi, 1 cable de carga usb, 1 dock.', '1', '1', '1', '1', '2022-04-21', '0', 'Playstation 5', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '56', 'Blanco, Griz', '1', '1');
INSERT INTO `publicaciones` VALUES ('5', '6500.00', 'Buzo Canguro Hoodie con capucha 100% algodon Talles S, M, L, XL disponibles Ideal para el invierno.', '2', '1', '2', '1', '2022-05-14', '0', 'Buzo Canguro', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '2', 'Negro', '4', '1');
INSERT INTO `publicaciones` VALUES ('6', '12600.00', 'Agregar descripcion', '1', '1', '2', '1', '2022-05-14', '0', 'Zapatillas Nike', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Negro', '5', '1');
INSERT INTO `publicaciones` VALUES ('7', '8000.00', 'Agregar descripcion', '2', '1', '2', '1', '2022-05-14', '0', 'Pantalon Cargo', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '3', 'Griz Oscuro', '6', '1');
INSERT INTO `publicaciones` VALUES ('8', '16000.00', 'Campera Softshell Verde Con Capucha. Impermeable. Ideal para el invierno. Talles M, L, XL disponibles.', '1', '1', '2', '1', '2022-05-14', '0', 'Campera Softshell', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '78', 'Verde', '7', '1');
INSERT INTO `publicaciones` VALUES ('9', '75000.00', 'Agregar descripcion', '2', '1', '3', '1', '2022-05-14', '0', 'Cama Box Base', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '9', 'Griz Claro', '8', '1');
INSERT INTO `publicaciones` VALUES ('10', '25000.00', 'Agregar descripcion', '2', '1', '3', '1', '2022-05-14', '0', 'Silla de Comedor', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '6', 'Blanco', '9', '1');
INSERT INTO `publicaciones` VALUES ('11', '320000.00', 'Agregar descripcion', '1', '1', '3', '1', '2022-05-14', '0', 'Sillón Esquinero', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Griz, Negro, Blanco, Marron', '10', '1');
INSERT INTO `publicaciones` VALUES ('12', '48000.00', 'Agregar descripcion', '2', '1', '3', '1', '2022-05-14', '0', 'Mesa Ratona', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Madera, Negro', '9', '1');
INSERT INTO `publicaciones` VALUES ('13', '6500.00', 'Agregar descripcion', '1', '1', '4', '1', '2022-05-14', '0', 'Pelota Nike', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Blanco, Negro', '11', '1');
INSERT INTO `publicaciones` VALUES ('14', '13000.00', 'Agregar descripcion', '1', '1', '4', '1', '2022-05-14', '0', 'Botines Nike', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Griz', '11', '1');
INSERT INTO `publicaciones` VALUES ('15', '7000.00', 'Agregar descripcion', '1', '1', '4', '1', '2022-05-14', '0', 'Mancuerna', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Metalico, Negro', '12', '1');
INSERT INTO `publicaciones` VALUES ('16', '4300.00', 'Agregar descripcion', '2', '1', '4', '1', '2022-05-14', '0', 'Colchonetas', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Rojo, Naranja, Verde, Azul, Violeta', '12', '1');
INSERT INTO `publicaciones` VALUES ('17', '107000.00', 'Agregar descripcion', '2', '1', '5', '1', '2022-05-14', '0', 'Monopatín Eléctrico', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Griz, Metalico', '15', '1');
INSERT INTO `publicaciones` VALUES ('18', '140000.00', 'Agregar descripcion', '1', '1', '5', '1', '2022-05-14', '0', 'Hoverboard', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Negro, Rojo', '15', '1');
INSERT INTO `publicaciones` VALUES ('19', '120000.00', 'Agregar descripcion', '1', '1', '5', '1', '2022-05-14', '0', 'Bicicleta MTB', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Naranja', '15', '1');
INSERT INTO `publicaciones` VALUES ('20', '190000.00', 'Agregar descripcion', '2', '1', '5', '1', '2022-05-14', '0', 'Bicicleta Eléctrica', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Rojo', '15', '1');
INSERT INTO `publicaciones` VALUES ('21', '7000.00', 'Agregar descripcion', '1', '1', '6', '1', '2022-05-14', '0', 'Monopatín', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Azul, Negro', '15', '1');
INSERT INTO `publicaciones` VALUES ('22', '11000.00', 'Agregar descripcion', '1', '1', '6', '1', '2022-05-14', '0', 'Auto a control remoto', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Azul, Rojo', '16', '1');
INSERT INTO `publicaciones` VALUES ('23', '5000.00', 'Agregar descripcion', '1', '1', '6', '1', '2022-05-14', '0', 'Kit utiles escolares', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Multicolor', '17', '1');
INSERT INTO `publicaciones` VALUES ('24', '9800.00', 'Agregar descripcion', '2', '1', '6', '1', '2022-05-14', '0', 'Triciclo', '<h2>Este sería el titulo del detalle de la publicacion</h2>', '1', 'Rojo, Azul, Amarillo', '15', '1');

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
  `usuario` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `habilitado` int(11) DEFAULT 1,
  `imagen` varchar(255) DEFAULT '',
  PRIMARY KEY (`idusuario`,`usuario`),
  KEY `idusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', 'José', 'de Figueiredo', '3548978765', '2003-06-12', 'jldefigueiredo@gmail.com', 'Jose', '$2b$10$LTSqR0eQuwCCqzq/xf0./OCwpCwk8BiKttuL1yQtz.T1nNganp7qS', '1', 'default.png');
INSERT INTO `usuarios` VALUES ('2', 'Matias', 'Granda', '126549876', '2022-05-18', 'matigranda93@gmail.com', 'Mati', '$2b$10$.6G4tI.F9yG.LmlAKeVjKe2sI6qtfEWGuvMU5Vy016FT8uyiKNz2i', '1', '1653407731808.jpg');
INSERT INTO `usuarios` VALUES ('10', 'Roseanna', 'Trahmel', '840-301-1253', '2020-09-12', 'rtrahmel0@weibo.com', 'rtrahmel0', 'NzoQvtChmuuq', '0', 'http://dummyimage.com/210x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('11', 'Rebeka', 'Handscombe', '321-238-1947', '2020-05-06', 'rhandscombe1@artisteer.com', 'rhandscombe1', 'XULblP', '1', 'http://dummyimage.com/122x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('12', 'Tarrah', 'Fifoot', '261-276-1646', '2018-08-08', 'tfifoot2@cafepress.com', 'tfifoot2', 'yq9nq7OKO', '0', 'http://dummyimage.com/183x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('13', 'Barbabas', 'Snaden', '422-225-3342', '2018-06-19', 'bsnaden3@diigo.com', 'bsnaden3', 'yEV1PP1u', '0', 'http://dummyimage.com/204x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('14', 'Matthew', 'Kyle', '168-702-7413', '2018-12-28', 'mkyle4@europa.eu', 'mkyle4', 'IiGk0te1ObV', '1', 'http://dummyimage.com/117x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('15', 'Correy', 'Tryhorn', '600-389-6191', '2021-08-09', 'ctryhorn5@simplemachines.org', 'ctryhorn5', 'GfJMS8MfNk', '1', 'http://dummyimage.com/104x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('16', 'Sosanna', 'Devinn', '220-339-0183', '2022-01-26', 'sdevinn6@nbcnews.com', 'sdevinn6', '4oroNWm1d', '1', 'http://dummyimage.com/234x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('17', 'Finn', 'Lawrence', '948-589-9306', '2021-02-21', 'flawrence7@google.co.uk', 'flawrence7', 'rAsdC9QsC4B', '0', 'http://dummyimage.com/208x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('18', 'Romola', 'Miller', '558-218-0588', '2021-10-11', 'rmiller8@typepad.com', 'rmiller8', 'BDjWSfpMPV', '0', 'http://dummyimage.com/156x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('19', 'Zia', 'Tithacott', '893-783-0331', '2022-05-03', 'ztithacott9@quantcast.com', 'ztithacott9', 'TXaMNFEpfWh', '0', 'http://dummyimage.com/138x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('20', 'Meagan', 'Grishaev', '865-684-7003', '2019-03-18', 'mgrishaeva@surveymonkey.com', 'mgrishaeva', 'fL8MCHTaNRc7', '1', 'http://dummyimage.com/140x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('21', 'Alaine', 'Plume', '949-979-1490', '2017-12-17', 'aplumeb@ucla.edu', 'aplumeb', 'xgpOpxeRCiq', '1', 'http://dummyimage.com/132x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('22', 'Scarlet', 'Hunnywell', '387-506-9337', '2018-07-07', 'shunnywellc@netlog.com', 'shunnywellc', 'RXpIYCZxX9V', '0', 'http://dummyimage.com/230x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('23', 'Madelle', 'Bennedsen', '970-665-1019', '2020-05-03', 'mbennedsend@bloglovin.com', 'mbennedsend', '0xYnHMS', '0', 'http://dummyimage.com/229x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('24', 'Celka', 'Grzelewski', '701-188-8227', '2022-05-20', 'cgrzelewskie@xing.com', 'cgrzelewskie', 'T0suHde9A3l2', '0', 'http://dummyimage.com/203x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('25', 'Ashely', 'Adamo', '464-333-9492', '2022-05-05', 'aadamof@ucsd.edu', 'aadamof', 'ioIqTn3sAK', '1', 'http://dummyimage.com/222x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('26', 'Seumas', 'Douglas', '459-778-0669', '2021-02-23', 'sdouglasg@youtube.com', 'sdouglasg', '3CGlk5CC', '0', 'http://dummyimage.com/215x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('27', 'Nadia', 'Josifovic', '533-832-1949', '2020-11-19', 'njosifovich@auda.org.au', 'njosifovich', 'Huf0l88Bq2D1', '1', 'http://dummyimage.com/191x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('28', 'Mirna', 'Peverell', '389-723-6150', '2022-03-16', 'mpeverelli@vistaprint.com', 'mpeverelli', 'OBx9AEJuQmJ7', '1', 'http://dummyimage.com/183x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('29', 'Merwin', 'Brookesbie', '692-917-9831', '2019-01-22', 'mbrookesbiej@stanford.edu', 'mbrookesbiej', '9be18U', '1', 'http://dummyimage.com/249x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('30', 'Robb', 'Daunter', '424-344-8416', '2019-12-04', 'rdaunterk@etsy.com', 'rdaunterk', 'S2C7Xz', '1', 'http://dummyimage.com/122x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('31', 'Olva', 'Fishpool', '339-876-1955', '2019-06-27', 'ofishpooll@accuweather.com', 'ofishpooll', '4ppaSNR', '1', 'http://dummyimage.com/173x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('32', 'Marietta', 'Cribbin', '920-160-7331', '2019-05-23', 'mcribbinm@dedecms.com', 'mcribbinm', 'aS5KLSN1Qe', '1', 'http://dummyimage.com/154x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('33', 'Dallas', 'Dorrity', '247-536-3641', '2021-05-18', 'ddorrityn@europa.eu', 'ddorrityn', 'O9jDfEvaPAc', '1', 'http://dummyimage.com/121x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('34', 'Ozzie', 'Rogans', '166-941-7732', '2022-04-07', 'oroganso@tinyurl.com', 'oroganso', '2OJArm5', '1', 'http://dummyimage.com/131x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('35', 'Dugald', 'Burberye', '286-892-6893', '2020-03-08', 'dburberyep@apple.com', 'dburberyep', 'ulbuuZ2KusHi', '0', 'http://dummyimage.com/122x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('36', 'Linnea', 'Cholomin', '983-342-6436', '2017-07-26', 'lcholominq@about.me', 'lcholominq', 'AyA4Zm3pqtee', '1', 'http://dummyimage.com/176x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('37', 'Arabella', 'Saura', '381-356-1342', '2020-06-21', 'asaurar@shutterfly.com', 'asaurar', 'bnxyoWcY', '1', 'http://dummyimage.com/150x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('38', 'Pauly', 'Bugg', '265-266-1239', '2021-01-31', 'pbuggs@hubpages.com', 'pbuggs', '6xDsLc1uR7hX', '1', 'http://dummyimage.com/139x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('39', 'Roseanna', 'Trahmel', '840-301-1253', '2020-09-12', 'rtrahmel0@weibo.com', 'rtrahmel0', 'NzoQvtChmuuq', '0', 'http://dummyimage.com/210x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('40', 'Rebeka', 'Handscombe', '321-238-1947', '2020-05-06', 'rhandscombe1@artisteer.com', 'rhandscombe1', 'XULblP', '1', 'http://dummyimage.com/122x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('41', 'Tarrah', 'Fifoot', '261-276-1646', '2018-08-08', 'tfifoot2@cafepress.com', 'tfifoot2', 'yq9nq7OKO', '0', 'http://dummyimage.com/183x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('42', 'Barbabas', 'Snaden', '422-225-3342', '2018-06-19', 'bsnaden3@diigo.com', 'bsnaden3', 'yEV1PP1u', '0', 'http://dummyimage.com/204x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('43', 'Matthew', 'Kyle', '168-702-7413', '2018-12-28', 'mkyle4@europa.eu', 'mkyle4', 'IiGk0te1ObV', '1', 'http://dummyimage.com/117x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('44', 'Correy', 'Tryhorn', '600-389-6191', '2021-08-09', 'ctryhorn5@simplemachines.org', 'ctryhorn5', 'GfJMS8MfNk', '1', 'http://dummyimage.com/104x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('45', 'Sosanna', 'Devinn', '220-339-0183', '2022-01-26', 'sdevinn6@nbcnews.com', 'sdevinn6', '4oroNWm1d', '1', 'http://dummyimage.com/234x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('46', 'Finn', 'Lawrence', '948-589-9306', '2021-02-21', 'flawrence7@google.co.uk', 'flawrence7', 'rAsdC9QsC4B', '0', 'http://dummyimage.com/208x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('47', 'Romola', 'Miller', '558-218-0588', '2021-10-11', 'rmiller8@typepad.com', 'rmiller8', 'BDjWSfpMPV', '0', 'http://dummyimage.com/156x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('48', 'Zia', 'Tithacott', '893-783-0331', '2022-05-03', 'ztithacott9@quantcast.com', 'ztithacott9', 'TXaMNFEpfWh', '0', 'http://dummyimage.com/138x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('49', 'Meagan', 'Grishaev', '865-684-7003', '2019-03-18', 'mgrishaeva@surveymonkey.com', 'mgrishaeva', 'fL8MCHTaNRc7', '1', 'http://dummyimage.com/140x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('50', 'Alaine', 'Plume', '949-979-1490', '2017-12-17', 'aplumeb@ucla.edu', 'aplumeb', 'xgpOpxeRCiq', '1', 'http://dummyimage.com/132x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('51', 'Scarlet', 'Hunnywell', '387-506-9337', '2018-07-07', 'shunnywellc@netlog.com', 'shunnywellc', 'RXpIYCZxX9V', '0', 'http://dummyimage.com/230x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('52', 'Madelle', 'Bennedsen', '970-665-1019', '2020-05-03', 'mbennedsend@bloglovin.com', 'mbennedsend', '0xYnHMS', '0', 'http://dummyimage.com/229x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('53', 'Celka', 'Grzelewski', '701-188-8227', '2022-05-20', 'cgrzelewskie@xing.com', 'cgrzelewskie', 'T0suHde9A3l2', '0', 'http://dummyimage.com/203x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('54', 'Ashely', 'Adamo', '464-333-9492', '2022-05-05', 'aadamof@ucsd.edu', 'aadamof', 'ioIqTn3sAK', '1', 'http://dummyimage.com/222x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('55', 'Seumas', 'Douglas', '459-778-0669', '2021-02-23', 'sdouglasg@youtube.com', 'sdouglasg', '3CGlk5CC', '0', 'http://dummyimage.com/215x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('56', 'Nadia', 'Josifovic', '533-832-1949', '2020-11-19', 'njosifovich@auda.org.au', 'njosifovich', 'Huf0l88Bq2D1', '1', 'http://dummyimage.com/191x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('57', 'Mirna', 'Peverell', '389-723-6150', '2022-03-16', 'mpeverelli@vistaprint.com', 'mpeverelli', 'OBx9AEJuQmJ7', '1', 'http://dummyimage.com/183x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('58', 'Merwin', 'Brookesbie', '692-917-9831', '2019-01-22', 'mbrookesbiej@stanford.edu', 'mbrookesbiej', '9be18U', '1', 'http://dummyimage.com/249x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('59', 'Robb', 'Daunter', '424-344-8416', '2019-12-04', 'rdaunterk@etsy.com', 'rdaunterk', 'S2C7Xz', '1', 'http://dummyimage.com/122x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('60', 'Olva', 'Fishpool', '339-876-1955', '2019-06-27', 'ofishpooll@accuweather.com', 'ofishpooll', '4ppaSNR', '1', 'http://dummyimage.com/173x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('61', 'Marietta', 'Cribbin', '920-160-7331', '2019-05-23', 'mcribbinm@dedecms.com', 'mcribbinm', 'aS5KLSN1Qe', '1', 'http://dummyimage.com/154x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('62', 'Dallas', 'Dorrity', '247-536-3641', '2021-05-18', 'ddorrityn@europa.eu', 'ddorrityn', 'O9jDfEvaPAc', '1', 'http://dummyimage.com/121x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('63', 'Ozzie', 'Rogans', '166-941-7732', '2022-04-07', 'oroganso@tinyurl.com', 'oroganso', '2OJArm5', '1', 'http://dummyimage.com/131x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('64', 'Dugald', 'Burberye', '286-892-6893', '2020-03-08', 'dburberyep@apple.com', 'dburberyep', 'ulbuuZ2KusHi', '0', 'http://dummyimage.com/122x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('65', 'Linnea', 'Cholomin', '983-342-6436', '2017-07-26', 'lcholominq@about.me', 'lcholominq', 'AyA4Zm3pqtee', '1', 'http://dummyimage.com/176x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('66', 'Arabella', 'Saura', '381-356-1342', '2020-06-21', 'asaurar@shutterfly.com', 'asaurar', 'bnxyoWcY', '1', 'http://dummyimage.com/150x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('67', 'Pauly', 'Bugg', '265-266-1239', '2021-01-31', 'pbuggs@hubpages.com', 'pbuggs', '6xDsLc1uR7hX', '1', 'http://dummyimage.com/139x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('68', 'Maxie', 'Danilchenko', '574-971-4948', '2018-08-16', 'mdanilchenkot@amazonaws.com', 'mdanilchenkot', '0r7zADs5', '0', 'http://dummyimage.com/130x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('69', 'Cullen', 'Castelain', '545-730-6814', '2020-12-11', 'ccastelainu@nifty.com', 'ccastelainu', 'TCncet', '1', 'http://dummyimage.com/195x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('70', 'Annamaria', 'Beetles', '168-776-4950', '2021-01-29', 'abeetlesv@hc360.com', 'abeetlesv', 'I3p0BnF84', '1', 'http://dummyimage.com/211x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('71', 'Myrta', 'Ohlsen', '910-163-0500', '2022-01-18', 'mohlsenw@a8.net', 'mohlsenw', '1RfltiD061yq', '0', 'http://dummyimage.com/136x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('72', 'Colas', 'Giamo', '120-858-6968', '2020-10-27', 'cgiamox@digg.com', 'cgiamox', 'FdWYaSs1b1', '0', 'http://dummyimage.com/198x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('73', 'Sergei', 'Weber', '814-805-6692', '2021-10-02', 'swebery@soundcloud.com', 'swebery', 'C14Kx6', '1', 'http://dummyimage.com/184x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('74', 'Terrence', 'Ebhardt', '403-597-3463', '2020-10-26', 'tebhardtz@4shared.com', 'tebhardtz', 'rkZm16jCgK', '1', 'http://dummyimage.com/239x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('75', 'Carissa', 'Edmunds', '146-154-4952', '2018-07-04', 'cedmunds10@nhs.uk', 'cedmunds10', 'R5ZlaIIRUV4', '0', 'http://dummyimage.com/197x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('76', 'Odelia', 'Hendonson', '272-331-2102', '2020-11-05', 'ohendonson11@bigcartel.com', 'ohendonson11', 'lk5J9xH', '1', 'http://dummyimage.com/168x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('77', 'Donny', 'Lighton', '168-478-0803', '2019-07-29', 'dlighton12@umn.edu', 'dlighton12', '3oD5s7Ia', '1', 'http://dummyimage.com/226x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('78', 'Joell', 'Mixon', '791-658-9401', '2020-12-29', 'jmixon13@bloglines.com', 'jmixon13', 'OYYvOw', '1', 'http://dummyimage.com/152x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('79', 'Kerby', 'Rickell', '391-692-2617', '2020-11-16', 'krickell14@amazon.de', 'krickell14', 'MqhyogFuFn', '0', 'http://dummyimage.com/165x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('80', 'Atlanta', 'Grocock', '656-965-5998', '2018-08-13', 'agrocock15@scribd.com', 'agrocock15', 'Ts7r2sM68y', '0', 'http://dummyimage.com/220x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('81', 'Morena', 'Mussettini', '424-436-9533', '2020-07-09', 'mmussettini16@topsy.com', 'mmussettini16', 'PfFQ7VUwmhmP', '1', 'http://dummyimage.com/125x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('82', 'Abram', 'Hasnney', '319-501-5628', '2020-08-14', 'ahasnney17@fc2.com', 'ahasnney17', 'WeP9Of', '0', 'http://dummyimage.com/179x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('83', 'Martha', 'Lake', '375-544-9782', '2020-10-19', 'mlake18@who.int', 'mlake18', 'fICKQYfWo', '1', 'http://dummyimage.com/235x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('84', 'Zonda', 'Van Schafflaer', '452-794-3994', '2020-09-07', 'zvanschafflaer19@indiegogo.com', 'zvanschafflaer19', 'HurQLoiCHN', '1', 'http://dummyimage.com/102x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('85', 'Sandor', 'Storek', '471-676-8785', '2021-08-03', 'sstorek1a@jigsy.com', 'sstorek1a', 'zYrNSsIpj', '0', 'http://dummyimage.com/250x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('86', 'Cassaundra', 'Shieldon', '818-205-0940', '2017-12-08', 'cshieldon1b@weebly.com', 'cshieldon1b', '0otIGOcuJ', '1', 'http://dummyimage.com/134x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('87', 'Moore', 'Hartnup', '834-762-8232', '2017-10-26', 'mhartnup1c@house.gov', 'mhartnup1c', 's1QxFvpnX4L', '0', 'http://dummyimage.com/142x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('88', 'Bo', 'Manklow', '367-686-5320', '2020-08-07', 'bmanklow1d@parallels.com', 'bmanklow1d', '4zGXji3pdkG8', '0', 'http://dummyimage.com/199x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('89', 'Wiatt', 'Mannock', '885-231-9563', '2019-07-14', 'wmannock1e@ow.ly', 'wmannock1e', 'MnkMJWHaZbpc', '0', 'http://dummyimage.com/219x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('90', 'Kilian', 'Gerty', '263-152-9590', '2020-03-13', 'kgerty1f@godaddy.com', 'kgerty1f', 'xvYiYwc4vs', '1', 'http://dummyimage.com/230x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('91', 'Temp', 'Puttick', '755-296-9054', '2020-03-06', 'tputtick1g@aboutads.info', 'tputtick1g', 'pJ6sKu2jT', '1', 'http://dummyimage.com/232x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('92', 'Addia', 'Halifax', '907-437-4161', '2020-02-13', 'ahalifax1h@booking.com', 'ahalifax1h', 'fBGM9nck', '0', 'http://dummyimage.com/187x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('93', 'Wilt', 'Dugood', '951-935-2327', '2022-05-05', 'wdugood1i@bing.com', 'wdugood1i', 'fdcYvG', '0', 'http://dummyimage.com/214x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('94', 'Livvyy', 'Mynard', '242-240-6304', '2018-07-08', 'lmynard1j@technorati.com', 'lmynard1j', '2H8H5V3yx9', '1', 'http://dummyimage.com/188x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('95', 'Peria', 'Tersay', '902-110-3010', '2021-10-10', 'ptersay1k@spiegel.de', 'ptersay1k', 'u1Ln3Y7eRIDx', '0', 'http://dummyimage.com/193x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('96', 'Ariel', 'Govan', '559-471-5198', '2021-02-05', 'agovan1l@miibeian.gov.cn', 'agovan1l', 'tiEGZHv', '1', 'http://dummyimage.com/119x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('97', 'Consuelo', 'Tubbles', '703-968-7420', '2022-06-04', 'ctubbles1m@ebay.co.uk', 'ctubbles1m', 'xrdFSYnA', '1', 'http://dummyimage.com/127x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('98', 'Free', 'Wheatley', '562-387-3968', '2020-12-30', 'fwheatley1n@answers.com', 'fwheatley1n', 'CG7NdSDdUgdg', '0', 'http://dummyimage.com/231x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('99', 'Revkah', 'Juszkiewicz', '418-631-3874', '2017-09-09', 'rjuszkiewicz1o@blogs.com', 'rjuszkiewicz1o', 'hlqCln', '1', 'http://dummyimage.com/202x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('100', 'Siouxie', 'Jakubovsky', '461-629-0451', '2017-09-13', 'sjakubovsky1p@unblog.fr', 'sjakubovsky1p', 'LvmvISrkeBzV', '0', 'http://dummyimage.com/136x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('101', 'Tabbatha', 'Cradock', '344-807-7572', '2021-07-24', 'tcradock1q@state.tx.us', 'tcradock1q', 'Tm7M2x2yy6', '1', 'http://dummyimage.com/248x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('102', 'Donnie', 'McLenahan', '845-289-0603', '2019-04-11', 'dmclenahan1r@washington.edu', 'dmclenahan1r', 'cJsEu6', '1', 'http://dummyimage.com/135x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('103', 'Aeriel', 'MacCurlye', '375-579-3589', '2020-03-21', 'amaccurlye1s@plala.or.jp', 'amaccurlye1s', '5MD8Ww', '1', 'http://dummyimage.com/150x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('104', 'Helyn', 'Adaway', '403-494-8053', '2019-12-02', 'hadaway1t@marriott.com', 'hadaway1t', 'J1YGecQ2794N', '1', 'http://dummyimage.com/203x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('105', 'Cory', 'McDuff', '955-578-3200', '2018-06-02', 'cmcduff1u@eventbrite.com', 'cmcduff1u', 'asZQQVFc', '1', 'http://dummyimage.com/164x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('106', 'Hieronymus', 'Duddan', '552-686-4863', '2020-12-22', 'hduddan1v@stanford.edu', 'hduddan1v', 'zfrNlrl6', '0', 'http://dummyimage.com/205x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('107', 'Tracy', 'Cayette', '812-368-7911', '2017-11-04', 'tcayette1w@pagesperso-orange.fr', 'tcayette1w', 'aoNSPo', '0', 'http://dummyimage.com/216x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('108', 'Dan', 'Clews', '769-920-6609', '2020-01-29', 'dclews1x@geocities.jp', 'dclews1x', 'wwmKOv0jQM', '1', 'http://dummyimage.com/244x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('109', 'Adela', 'Allibon', '725-389-7010', '2017-09-11', 'aallibon1y@yolasite.com', 'aallibon1y', 'F2Olq2RmNoQ', '1', 'http://dummyimage.com/243x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('110', 'Lloyd', 'Slany', '608-285-6324', '2018-06-21', 'lslany1z@hud.gov', 'lslany1z', 'BuZ5BMQn', '0', 'http://dummyimage.com/202x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('111', 'Arlana', 'Glaves', '890-932-6217', '2021-08-28', 'aglaves20@wired.com', 'aglaves20', 'pKWMWs', '0', 'http://dummyimage.com/246x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('112', 'Lauritz', 'Dalla', '842-219-1908', '2018-08-25', 'ldalla21@histats.com', 'ldalla21', 'XRrYOrLL', '1', 'http://dummyimage.com/219x100.png/dddddd/000000');
INSERT INTO `usuarios` VALUES ('113', 'Guy', 'Billison', '685-150-3251', '2020-02-07', 'gbillison22@deliciousdays.com', 'gbillison22', 'F7Vkwz', '0', 'http://dummyimage.com/133x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('114', 'Lorelei', 'Tuxell', '749-772-1676', '2020-09-22', 'ltuxell23@booking.com', 'ltuxell23', 'THH3KS', '0', 'http://dummyimage.com/113x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('115', 'Jenica', 'Stoll', '632-796-7641', '2018-03-25', 'jstoll24@soundcloud.com', 'jstoll24', 'yte9sGDo', '1', 'http://dummyimage.com/171x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('116', 'Hyacinth', 'Gear', '108-254-5022', '2021-06-25', 'hgear25@wsj.com', 'hgear25', 'mb05TdQkAg', '1', 'http://dummyimage.com/216x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('117', 'Jenine', 'Quigley', '848-563-1273', '2019-08-08', 'jquigley26@dropbox.com', 'jquigley26', 'umxf49Sbh', '0', 'http://dummyimage.com/159x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('118', 'Prescott', 'Drinkhall', '269-790-6289', '2022-04-08', 'pdrinkhall27@cloudflare.com', 'pdrinkhall27', 'wd9MvMcH75M', '0', 'http://dummyimage.com/226x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('119', 'Liane', 'Daverin', '124-716-4939', '2021-10-05', 'ldaverin28@mozilla.org', 'ldaverin28', 'oW1IQKZ1EkL', '0', 'http://dummyimage.com/226x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('120', 'Mata', 'Verson', '131-130-8982', '2021-09-04', 'mverson29@sciencedirect.com', 'mverson29', 'd6C7om', '1', 'http://dummyimage.com/217x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('121', 'Dexter', 'Spiers', '710-290-7443', '2017-12-23', 'dspiers2a@sogou.com', 'dspiers2a', 'WE55yk4Wo9t', '1', 'http://dummyimage.com/192x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('122', 'Issie', 'Froment', '527-167-5862', '2018-06-20', 'ifroment2b@desdev.cn', 'ifroment2b', '0NX9dsnl', '1', 'http://dummyimage.com/158x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('123', 'Martie', 'O\'Scandall', '826-977-5902', '2021-08-31', 'moscandall2c@free.fr', 'moscandall2c', 'a2pVCRKjHoE', '0', 'http://dummyimage.com/109x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('124', 'Baron', 'Benedek', '574-908-6532', '2022-01-31', 'bbenedek2d@4shared.com', 'bbenedek2d', 'z3jpWeo3', '0', 'http://dummyimage.com/131x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('125', 'Pavla', 'Hackleton', '918-717-7369', '2019-01-25', 'phackleton2e@ifeng.com', 'phackleton2e', 'n0FbImjZA4', '0', 'http://dummyimage.com/163x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('126', 'Mitch', 'Klausewitz', '309-120-5464', '2019-10-16', 'mklausewitz2f@ameblo.jp', 'mklausewitz2f', 'SaiBtjvyopBd', '0', 'http://dummyimage.com/116x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('127', 'Patricia', 'Dutnall', '618-150-5383', '2020-04-27', 'pdutnall2g@latimes.com', 'pdutnall2g', 'T4t9lYP', '1', 'http://dummyimage.com/154x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('128', 'Minna', 'Stickings', '199-835-5999', '2017-11-21', 'mstickings2h@shutterfly.com', 'mstickings2h', 'bsEluuk15IFO', '0', 'http://dummyimage.com/171x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('129', 'Blanch', 'Larsen', '787-355-8572', '2020-07-01', 'blarsen2i@liveinternet.ru', 'blarsen2i', '8qh3gxX', '1', 'http://dummyimage.com/145x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('130', 'Vania', 'Timblett', '239-696-2744', '2017-07-29', 'vtimblett2j@naver.com', 'vtimblett2j', 'LATTdEw', '0', 'http://dummyimage.com/210x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('131', 'Annis', 'Beckensall', '850-737-8431', '2022-04-23', 'abeckensall2k@msu.edu', 'abeckensall2k', 'ju9Db7t9506d', '1', 'http://dummyimage.com/122x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('132', 'Taber', 'Darter', '517-185-8561', '2019-06-05', 'tdarter2l@tuttocitta.it', 'tdarter2l', 'rNOlI7XAHIA', '1', 'http://dummyimage.com/169x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('133', 'Siobhan', 'Till', '241-283-4273', '2021-07-17', 'still2m@netvibes.com', 'still2m', 'BzZl49j', '0', 'http://dummyimage.com/156x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('134', 'Hurley', 'MacGorrie', '216-663-0467', '2021-05-22', 'hmacgorrie2n@miitbeian.gov.cn', 'hmacgorrie2n', 'baE4TTtt', '1', 'http://dummyimage.com/148x100.png/ff4444/ffffff');
INSERT INTO `usuarios` VALUES ('135', 'Carlotta', 'Lambswood', '622-614-8681', '2021-09-08', 'clambswood2o@webmd.com', 'clambswood2o', 'Cp2KWGsnv4nc', '1', 'http://dummyimage.com/191x100.png/cc0000/ffffff');
INSERT INTO `usuarios` VALUES ('136', 'Lindy', 'Rutland', '153-794-2529', '2018-04-02', 'lrutland2p@github.com', 'lrutland2p', 'ln7m0foM', '1', 'http://dummyimage.com/148x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('137', 'Car', 'Skypp', '405-986-4388', '2018-08-28', 'cskypp2q@disqus.com', 'cskypp2q', 'gpQP5YCpC0YI', '0', 'http://dummyimage.com/104x100.png/5fa2dd/ffffff');
INSERT INTO `usuarios` VALUES ('138', 'Avigdor', 'Rushbrook', '535-451-0516', '2017-07-28', 'arushbrook2r@ovh.net', 'arushbrook2r', 'Cwgy4BtTBrq', '0', 'http://dummyimage.com/233x100.png/5fa2dd/ffffff');
