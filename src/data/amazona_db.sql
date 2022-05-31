/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : amazona_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-05-31 10:59:17
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
  `calificacion` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcomentario`),
  KEY `fk_calificaciones` (`idpublicacion`),
  CONSTRAINT `fk_calificaciones` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calificaciones
-- ----------------------------

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) NOT NULL,
  `habilitado` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorias
-- ----------------------------

-- ----------------------------
-- Table structure for colores
-- ----------------------------
DROP TABLE IF EXISTS `colores`;
CREATE TABLE `colores` (
  `idcolor` int(11) NOT NULL AUTO_INCREMENT,
  `idpublicacion` int(11) NOT NULL,
  `color` varchar(12) NOT NULL,
  PRIMARY KEY (`idcolor`),
  KEY `fk_colores` (`idpublicacion`),
  CONSTRAINT `fk_colores` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of colores
-- ----------------------------

-- ----------------------------
-- Table structure for domicilios
-- ----------------------------
DROP TABLE IF EXISTS `domicilios`;
CREATE TABLE `domicilios` (
  `iddomicilios` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `altura` int(5) DEFAULT NULL,
  `piso` int(2) DEFAULT NULL,
  `depto` varchar(3) DEFAULT NULL,
  `idpais` int(2) NOT NULL,
  `idprovincia` int(2) NOT NULL,
  `cp` varchar(6) DEFAULT NULL,
  `default` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`iddomicilios`),
  KEY `fk_usuarios_domicilios` (`idusuario`),
  CONSTRAINT `fk_usuarios_domicilios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `imgagenprincipal` int(1) NOT NULL DEFAULT 0,
  `imagen` varchar(40) NOT NULL,
  `idpublicacion` int(11) NOT NULL,
  PRIMARY KEY (`idimagen`),
  KEY `fk_img_publicaciones` (`idpublicacion`),
  CONSTRAINT `fk_img_publicaciones` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imagenes
-- ----------------------------

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
  CONSTRAINT `fk_preguntas` FOREIGN KEY (`idpublicacion`) REFERENCES `publicaciones` (`idpublicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preguntas
-- ----------------------------

-- ----------------------------
-- Table structure for publicaciones
-- ----------------------------
DROP TABLE IF EXISTS `publicaciones`;
CREATE TABLE `publicaciones` (
  `idpublicacion` int(11) NOT NULL AUTO_INCREMENT,
  `precio` decimal(8,2) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `habilitado` int(1) DEFAULT 1,
  `idcategoria` int(11) NOT NULL,
  `idsubcategoria` int(11) DEFAULT NULL,
  `fechapublicacion` date DEFAULT NULL,
  `reportado` int(1) DEFAULT 0,
  `titulo` varchar(70) NOT NULL,
  PRIMARY KEY (`idpublicacion`),
  KEY `fk_usuarios` (`idusuario`),
  KEY `fk_categorias` (`idcategoria`),
  CONSTRAINT `fk_categorias` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of publicaciones
-- ----------------------------

-- ----------------------------
-- Table structure for respuestas
-- ----------------------------
DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE `respuestas` (
  `idrespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `idpregunta` int(11) NOT NULL,
  `respuesta` text DEFAULT NULL,
  `fecharespuesta` date DEFAULT NULL,
  `reportado` int(1) DEFAULT 0,
  PRIMARY KEY (`idrespuesta`),
  KEY `fk_respuestas` (`idpregunta`),
  CONSTRAINT `fk_respuestas` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idpregunta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Esta es la tabla que contiene las respuestas de las preguntas realizadas por los usuarios';

-- ----------------------------
-- Records of respuestas
-- ----------------------------

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
  `habilitado` int(1) DEFAULT 1,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idusuario`,`usuario`),
  KEY `idusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', 'José', 'de Figueiredo', '3548978765', '2003-06-12', 'jldefigueiredo@gmail.com', 'Jose', '$2b$10$LTSqR0eQuwCCqzq/xf0./OCwpCwk8BiKttuL1yQtz.T1nNganp7qS', '1', '/img/user-image-default.png');
INSERT INTO `usuarios` VALUES ('2', 'Matias', 'Granda', '126549876', '2022-05-18', 'matigranda93@gmail.com', 'Mati', '$2b$10$.6G4tI.F9yG.LmlAKeVjKe2sI6qtfEWGuvMU5Vy016FT8uyiKNz2i', '1', '/img/user-image-default.png');
