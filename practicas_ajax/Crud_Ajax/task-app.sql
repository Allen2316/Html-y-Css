-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para task-app
CREATE DATABASE IF NOT EXISTS `task-app` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `task-app`;

-- Volcando estructura para tabla task-app.tareas
CREATE TABLE IF NOT EXISTS `tareas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla task-app.tareas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` (`id`, `nombre`, `descripcion`) VALUES
	(2, 'Programar', 'Tengo que programar una fiesta'),
	(3, 'Correr', 'Tengo que salir a correr'),
	(4, 'Css', 'Trabajo de hamburguesa'),
	(5, 'Jugar play', 'Tengo que jugar en la play, edit1: luego de estudiar, edit2: se cancela todo xd'),
	(7, 'qw', 'asd');
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
