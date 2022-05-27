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
  PRIMARY KEY (`idcomentario`)
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
  PRIMARY KEY (`idcolor`)
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
  PRIMARY KEY (`iddomicilios`)
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
  PRIMARY KEY (`idimagen`)
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
  PRIMARY KEY (`idpregunta`)
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
  PRIMARY KEY (`idpublicacion`)
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
  PRIMARY KEY (`idrespuesta`)
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
  PRIMARY KEY (`idusuario`,`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
