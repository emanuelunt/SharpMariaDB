-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bd_crud
CREATE DATABASE IF NOT EXISTS `bd_crud` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bd_crud`;

-- Volcando estructura para tabla bd_crud.tb_categorias
CREATE TABLE IF NOT EXISTS `tb_categorias` (
  `idCategoria_ca` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_ca` varchar(50) DEFAULT NULL,
  `activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idCategoria_ca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla bd_crud.tb_categorias: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_crud.tb_medidas
CREATE TABLE IF NOT EXISTS `tb_medidas` (
  `idCodigo_me` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_me` varchar(50) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCodigo_me`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla bd_crud.tb_medidas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_crud.tb_productos
CREATE TABLE IF NOT EXISTS `tb_productos` (
  `idCodigo_pr` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_pr` varchar(50) DEFAULT NULL,
  `marca_pr` varchar(50) DEFAULT NULL,
  `codigo_me` int(11) NOT NULL DEFAULT 0,
  `codigo_ca` int(11) NOT NULL DEFAULT 0,
  `stock_actual` decimal(18,2) DEFAULT NULL,
  `activo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idCodigo_pr`),
  KEY `FK_tb_productos_tb_medidas` (`codigo_me`),
  KEY `FK_tb_productos_tb_categorias` (`codigo_ca`),
  CONSTRAINT `FK_tb_productos_tb_categorias` FOREIGN KEY (`codigo_ca`) REFERENCES `tb_categorias` (`idCategoria_ca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tb_productos_tb_medidas` FOREIGN KEY (`codigo_me`) REFERENCES `tb_medidas` (`idCodigo_me`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla bd_crud.tb_productos: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
