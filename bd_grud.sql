-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla bd_crud.tb_categorias: ~2 rows (aproximadamente)
INSERT INTO `tb_categorias` (`idCategoria_ca`, `descripcion_ca`, `activo`) VALUES
	(1, 'Comestibles', b'1'),
	(2, 'Bebidas', b'1');

-- Volcando estructura para tabla bd_crud.tb_medidas
CREATE TABLE IF NOT EXISTS `tb_medidas` (
  `idCodigo_me` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_me` varchar(50) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCodigo_me`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla bd_crud.tb_medidas: ~4 rows (aproximadamente)
INSERT INTO `tb_medidas` (`idCodigo_me`, `descripcion_me`, `activo`) VALUES
	(1, 'Unidades', 1),
	(2, 'Kilogromas', 1),
	(3, 'Litros', 1),
	(4, 'Metros', 1);

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

-- Volcando estructura para procedimiento bd_crud.usp_guardar_pr
DELIMITER //
CREATE PROCEDURE `usp_guardar_pr`(
	IN `nOpcion` INT,
	IN `nCodigo_pr` INT,
	IN `cDescripcion_pr` VARCHAR(50),
	IN `cMarca_pr` VARCHAR(50),
	IN `nCodigo_me` INT,
	IN `nCodigo_ca` INT,
	IN `nStock_actual` DECIMAL(18,2)
)
BEGIN
if nOpcion = 1 then -- nuevo Registro
	INSERT INTO tb_productos(descripcion_pr,marca_pr,codigo_me,codigo_ca,stock_actual,activo)
	VALUES(cDescripcion_pr,cMarca_pr,nCodigo_me,nCodigo_ca,nStock_actual,1);
ELSE -- Actualizar registro
	UPDATE tb_productos SET descripcion_pr = cDescripcion_pr,
									marca_pr = cMarca_pr,
									codigo_me = nCodigo_me,
									codigo_ca = nCodigo_ca,
									stock_actual = nStock_actual
								WHERE idCodigo_pr = nCodigo_pr;
END if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bd_crud.usp_listado_ca
DELIMITER //
CREATE PROCEDURE `usp_listado_ca`()
BEGIN
SELECT descripcion_ca,idCategoria_ca FROM tb_categorias WHERE activo = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bd_crud.usp_listado_me
DELIMITER //
CREATE PROCEDURE `usp_listado_me`()
BEGIN
SELECT descripcion_me, idCodigo_me FROM tb_medidas WHERE activo = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bd_crud.usp_listado_pr
DELIMITER //
CREATE PROCEDURE `usp_listado_pr`(
	IN `cTexto` VARCHAR(50)
)
BEGIN
SELECT
a.idCodigo_pr,
a.descripcion_pr,
a.marca_pr,
b.descripcion_me,
c.descripcion_ca,
a.stock_actual,
a.codigo_me,
a.codigo_ca 
FROM tb_productos AS a INNER JOIN tb_medidas AS b ON a.codigo_me=b.idCodigo_me
INNER JOIN tb_categorias AS c ON a.codigo_ca=c.idCategoria_ca
WHERE a.activo=1 AND upper(CONCAT(CAST(a.idCodigo_pr AS CHAR),
											trim(a.descripcion_pr),
											trim(a.marca_pr))) LIKE CONCAT('%',upper(trim(cTexto)),'%');
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
