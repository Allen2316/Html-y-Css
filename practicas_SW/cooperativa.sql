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


-- Volcando estructura de base de datos para cooperativa
CREATE DATABASE IF NOT EXISTS `cooperativa` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cooperativa`;

-- Volcando estructura para tabla cooperativa.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_group: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` (`id`, `name`) VALUES
	(2, 'clientes'),
	(1, 'gestion_clientes'),
	(3, 'transacciones');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_group_permissions: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
	(5, 1, 25),
	(6, 1, 26),
	(7, 1, 27),
	(8, 1, 28),
	(1, 1, 33),
	(2, 1, 34),
	(3, 1, 35),
	(4, 1, 36),
	(10, 3, 28),
	(11, 3, 29),
	(9, 3, 32),
	(12, 3, 36);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_permission: ~36 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add cliente', 7, 'add_cliente'),
	(26, 'Can change cliente', 7, 'change_cliente'),
	(27, 'Can delete cliente', 7, 'delete_cliente'),
	(28, 'Can view cliente', 7, 'view_cliente'),
	(29, 'Can add cuenta', 8, 'add_cuenta'),
	(30, 'Can change cuenta', 8, 'change_cuenta'),
	(31, 'Can delete cuenta', 8, 'delete_cuenta'),
	(32, 'Can view cuenta', 8, 'view_cuenta'),
	(33, 'Can add transaccion', 9, 'add_transaccion'),
	(34, 'Can change transaccion', 9, 'change_transaccion'),
	(35, 'Can delete transaccion', 9, 'delete_transaccion'),
	(36, 'Can view transaccion', 9, 'view_transaccion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `api_token` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_user: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `api_token`) VALUES
	(1, 'pbkdf2_sha256$216000$M5lhpq1rCPcP$9YeTGFLXyrDBlZRTaGmZrsqpqtg+QvWPVZIuy99hu7w=', '2021-01-27 04:08:08.676393', 1, 'allen', 'Luis', 'Sarmiento', 'luis@gmail.com', 1, 1, '2021-01-04 21:53:23.000000', NULL),
	(4, 'pbkdf2_sha256$216000$wBwov0x8WUsN$Ro55SRUz8tQMc1+xPdrHMmLIoylVJjSXVL3LftO3E6Q=', '2021-01-13 14:01:38.602000', 1, 'luis123', 'Luis Alberto', 'Sarmiento', 'luis1@gmail.com', 1, 1, '2021-01-07 02:59:34.000000', NULL),
	(8, 'pbkdf2_sha256$216000$tZoUNgjopnQ5$ztO0YBiPJTMn73d4J7JCootnYYw/YsSOEYEaoNXCzzA=', '2021-01-13 13:27:16.291000', 0, '5555', 'Maura', 'Cuenca', 'maura@gmail', 0, 1, '2021-01-13 13:17:56.187000', NULL),
	(9, 'pbkdf2_sha256$216000$u8MWDTFKQBtK$Y6qH8JPwju8lUsnKNyzDwAfAUrZFtw7aj8ttnxlFiro=', NULL, 0, '555333', 'Marco', 'Aurelio', 'aur@gmail.com', 0, 1, '2021-01-19 20:23:59.642000', NULL),
	(10, 'pbkdf2_sha256$216000$wI42fO9DsmHi$qSg5AYxjrP6TBpZnhDYZorJ5S2R1gdNasktyDQEtDVc=', NULL, 0, '11060782', 'Cornelio', 'Cuenca', 'corne@gmail.com', 0, 1, '2021-01-21 22:19:51.494169', NULL),
	(11, 'pbkdf2_sha256$216000$rUZqgzTS0Vgm$9Tqre85sLRG0nP7ROEzNXe8WhcIq5AAs2joYcHyXmc4=', NULL, 0, '110607', 'Luis', 'Sarmiento', 'luis@gmail.com', 0, 1, '2021-01-26 04:38:00.029707', NULL),
	(12, 'pbkdf2_sha256$216000$lvDJEDIOKB18$yIBntuPWtTJrWyJGXUa6JybibIsnS8IKtkZmlu3rXF0=', NULL, 0, '1111', 'Rosa', 'Cuenca', 'rosa@gmail.com', 0, 1, '2021-01-26 04:38:50.055638', NULL),
	(13, 'pbkdf2_sha256$216000$LGVZ8sKH7hc3$tfrGsd6Zrc0SWh5Q8lFzM84qLs1CuSYcZ2u9y1be32k=', NULL, 0, '2222', 'Maura', 'Cuenca', 'maura@gmail', 0, 1, '2021-01-26 04:39:23.770719', NULL),
	(14, 'pbkdf2_sha256$216000$HIzM7SisL9YD$wUPHPoit8KeyYHb25l7r7rUtWca/7KKewSpoyC26V3c=', NULL, 0, '3333', 'Juan', 'Gonzalez', 'juanito@gmail.com', 0, 1, '2021-01-26 04:40:10.619611', NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_user_groups: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 8, 2),
	(5, 9, 2),
	(6, 10, 2),
	(7, 11, 2),
	(8, 12, 2),
	(9, 13, 2),
	(10, 14, 2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.django_admin_log: ~37 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2021-01-04 22:45:58.720000', '1', '2323232', 1, '[{"added": {}}]', 7, 1),
	(2, '2021-01-04 22:46:34.563000', '1', '2323232', 3, '', 7, 1),
	(3, '2021-01-04 22:46:56.635000', '2', '2323232', 1, '[{"added": {}}]', 7, 1),
	(4, '2021-01-04 22:47:19.135000', '3', '2323232', 1, '[{"added": {}}]', 7, 1),
	(5, '2021-01-05 18:55:55.174000', '2', '45; 2', 1, '[{"added": {}}]', 9, 1),
	(6, '2021-01-05 18:56:45.434000', '3', '4; 3', 1, '[{"added": {}}]', 9, 1),
	(7, '2021-01-06 13:02:45.950000', '1', 'gestion_clientes', 1, '[{"added": {}}]', 3, 1),
	(8, '2021-01-06 14:06:20.529000', '2', 'luis123', 1, '[{"added": {}}]', 4, 1),
	(9, '2021-01-06 14:07:37.894000', '2', 'luis123', 2, '[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]', 4, 1),
	(10, '2021-01-06 14:08:11.653000', '2', 'luis123', 2, '[{"changed": {"fields": ["First name", "Superuser status"]}}]', 4, 1),
	(11, '2021-01-06 14:08:33.238000', '2', 'luis123', 2, '[{"changed": {"fields": ["Staff status"]}}]', 4, 1),
	(13, '2021-01-06 14:11:49.899000', '2', 'luis123', 2, '[{"changed": {"fields": ["Staff status"]}}]', 4, 1),
	(14, '2021-01-06 14:13:54.009000', '2', 'luis123', 2, '[{"changed": {"fields": ["Superuser status"]}}]', 4, 1),
	(15, '2021-01-07 01:33:49.240000', '2', 'luis123', 3, '', 4, 1),
	(16, '2021-01-07 01:34:56.712000', '3', 'luis123', 1, '[{"added": {}}]', 4, 1),
	(17, '2021-01-07 01:35:03.444000', '3', 'luis123', 2, '[]', 4, 1),
	(18, '2021-01-07 01:35:16.291000', '3', 'luis123', 2, '[{"changed": {"fields": ["Staff status", "Superuser status"]}}]', 4, 1),
	(19, '2021-01-07 01:35:59.658000', '3', 'luis123', 2, '[{"changed": {"fields": ["Active", "Staff status"]}}]', 4, 1),
	(20, '2021-01-07 01:44:40.231000', '3', 'luis123', 2, '[{"changed": {"fields": ["Staff status"]}}]', 4, 1),
	(21, '2021-01-07 01:45:27.545000', '3', 'luis123', 2, '[]', 4, 1),
	(22, '2021-01-07 02:29:50.253000', '3', 'luis123', 2, '[{"changed": {"fields": ["Staff status", "Superuser status"]}}]', 4, 1),
	(23, '2021-01-07 02:57:08.657000', '3', 'luis123', 2, '[{"changed": {"fields": ["Staff status", "Superuser status"]}}]', 4, 1),
	(24, '2021-01-07 02:58:55.648000', '3', 'luis123', 3, '', 4, 1),
	(25, '2021-01-07 02:59:35.194000', '4', 'luis123', 1, '[{"added": {}}]', 4, 1),
	(26, '2021-01-07 02:59:39.295000', '4', 'luis123', 2, '[]', 4, 1),
	(27, '2021-01-07 02:59:51.951000', '4', 'luis123', 2, '[{"changed": {"fields": ["Staff status", "Superuser status"]}}]', 4, 1),
	(28, '2021-01-07 03:00:33.598000', '4', 'luis123', 2, '[{"changed": {"fields": ["Active"]}}]', 4, 4),
	(29, '2021-01-07 03:04:39.114000', '4', 'luis123', 2, '[{"changed": {"fields": ["Active"]}}]', 4, 1),
	(30, '2021-01-12 17:12:49.874000', '4', 'luis123', 2, '[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]', 4, 1),
	(31, '2021-01-12 17:24:29.108000', '1', 'allen', 2, '[{"changed": {"fields": ["Groups"]}}]', 4, 1),
	(32, '2021-01-13 12:39:49.813000', '2', 'clientes', 1, '[{"added": {}}]', 3, 1),
	(33, '2021-01-13 12:55:34.062000', '5', '5555', 3, '', 4, 1),
	(34, '2021-01-13 12:58:58.175000', '6', '5555', 3, '', 4, 1),
	(35, '2021-01-13 13:15:42.436000', '7', '5555', 3, '', 4, 1),
	(36, '2021-01-13 14:23:17.513000', '3', 'transacciones', 1, '[{"added": {}}]', 3, 1),
	(37, '2021-01-13 14:23:51.444000', '3', 'transacciones', 2, '[]', 3, 1),
	(38, '2021-01-13 14:24:24.371000', '1', 'allen', 2, '[{"changed": {"fields": ["First name", "Last name", "Groups"]}}]', 4, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.django_content_type: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'modelo', 'cliente'),
	(8, 'modelo', 'cuenta'),
	(9, 'modelo', 'transaccion'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.django_migrations: ~20 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2021-01-21 22:13:16.006495'),
	(2, 'auth', '0001_initial', '2021-01-21 22:13:18.065342'),
	(3, 'admin', '0001_initial', '2021-01-21 22:13:24.923512'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2021-01-21 22:13:26.552147'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-01-21 22:13:26.590139'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2021-01-21 22:13:27.302516'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2021-01-21 22:13:27.446408'),
	(8, 'auth', '0003_alter_user_email_max_length', '2021-01-21 22:13:27.584336'),
	(9, 'auth', '0004_alter_user_username_opts', '2021-01-21 22:13:27.628325'),
	(10, 'auth', '0005_alter_user_last_login_null', '2021-01-21 22:13:28.303670'),
	(11, 'auth', '0006_require_contenttypes_0002', '2021-01-21 22:13:28.338705'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2021-01-21 22:13:28.380201'),
	(13, 'auth', '0008_alter_user_username_max_length', '2021-01-21 22:13:28.514448'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2021-01-21 22:13:28.736050'),
	(15, 'auth', '0010_alter_group_name_max_length', '2021-01-21 22:13:28.919398'),
	(16, 'auth', '0011_update_proxy_permissions', '2021-01-21 22:13:28.986649'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2021-01-21 22:13:29.113690'),
	(18, 'modelo', '0001_initial', '2021-01-21 22:13:30.080232'),
	(19, 'modelo', '0002_auto_20210121_1502', '2021-01-21 22:13:36.016827'),
	(20, 'sessions', '0001_initial', '2021-01-21 22:13:37.201167');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.django_session: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('28dgk6bj8ph252r7lrye1yd835uz5jwn', '.eJxVjMsOwiAQRf-FtSE8hgm6dO83kAEGqRpISrsy_rtt0oVu7znnvkWgdalhHTyHKYuL0OL0u0VKT247yA9q9y5Tb8s8Rbkr8qBD3nrm1_Vw_w4qjbrV3rOzbDKeEQGQtNbMXLT10STjwREYxRYVlsLgHRn0wGxg01GlKD5fxyI3Gg:1l1u8l:Envri9gbgtQaDmiTRjpA2ZHBYyGNtxKs_neG4Ea-rJs', '2021-02-02 16:45:59.842000'),
	('kk8f24kehezet14ycsoprvkqgbwl6tdf', '.eJxVjMsOwiAQRf-FtSE8hgm6dO83kAEGqRpISrsy_rtt0oVu7znnvkWgdalhHTyHKYuL0OL0u0VKT247yA9q9y5Tb8s8Rbkr8qBD3nrm1_Vw_w4qjbrV3rOzbDKeEQGQtNbMXLT10STjwREYxRYVlsLgHRn0wGxg01GlKD5fxyI3Gg:1kwXnN:G_ZzkNBWjlToLZVJWxBogAUVNH7RHTrQfqppI2wUqSQ', '2021-01-18 21:53:45.418000'),
	('s69xjzt7pxki64zygrg9bv77z86jakw7', '.eJxVjMsOwiAQRf-FtSE8hgm6dO83kAEGqRpISrsy_rtt0oVu7znnvkWgdalhHTyHKYuL0OL0u0VKT247yA9q9y5Tb8s8Rbkr8qBD3nrm1_Vw_w4qjbrV3rOzbDKeEQGQtNbMXLT10STjwREYxRYVlsLgHRn0wGxg01GlKD5fxyI3Gg:1kxKJK:7fQPI6Qbd2JuNYlL6RmWdDrzx3qEP7s50s3FNkNrJG4', '2021-01-21 01:41:58.594000'),
	('sb1nl3xhpj6gbszgawgdfoy0hz8bfzoi', '.eJxVjMsOwiAQRf-FtSE8hgm6dO83kAEGqRpISrsy_rtt0oVu7znnvkWgdalhHTyHKYuL0OL0u0VKT247yA9q9y5Tb8s8Rbkr8qBD3nrm1_Vw_w4qjbrV3rOzbDKeEQGQtNbMXLT10STjwREYxRYVlsLgHRn0wGxg01GlKD5fxyI3Gg:1kzgj5:xb6Lh4BGLkVUc89OF_uTBBKqwa37RoJoLZKm0833NoU', '2021-01-27 14:02:19.696000'),
	('tto2mjvvortviqtnl28js7z47jagqik4', '.eJxVjMsOwiAQRf-FtSE8hgm6dO83kAEGqRpISrsy_rtt0oVu7znnvkWgdalhHTyHKYuL0OL0u0VKT247yA9q9y5Tb8s8Rbkr8qBD3nrm1_Vw_w4qjbrV3rOzbDKeEQGQtNbMXLT10STjwREYxRYVlsLgHRn0wGxg01GlKD5fxyI3Gg:1l4G33:LuG_6W5PEoKUMiBZUZ1crCrwhG2HicxuwHVCj3LMtss', '2021-02-09 04:33:49.887772'),
	('uivbbxron06eywsllbiw2gl4558dtlnk', '.eJxVjMsOwiAQRf-FtSE8hgm6dO83kAEGqRpISrsy_rtt0oVu7znnvkWgdalhHTyHKYuL0OL0u0VKT247yA9q9y5Tb8s8Rbkr8qBD3nrm1_Vw_w4qjbrV3rOzbDKeEQGQtNbMXLT10STjwREYxRYVlsLgHRn0wGxg01GlKD5fxyI3Gg:1l2gEa:4NKjzthVSQcShRTQoXHORwQ1MHeaz_K3P5zyLD9Xg8c', '2021-02-04 20:07:12.672000'),
	('vc64tenbfqqht2g5rnt85lagkp4olvoe', '.eJxVjMsOwiAQRf-FtSE8hgm6dO83kAEGqRpISrsy_rtt0oVu7znnvkWgdalhHTyHKYuL0OL0u0VKT247yA9q9y5Tb8s8Rbkr8qBD3nrm1_Vw_w4qjbrV3rOzbDKeEQGQtNbMXLT10STjwREYxRYVlsLgHRn0wGxg01GlKD5fxyI3Gg:1l1xx8:43oo6ym2SoPG0rL77IiXDwQLakwgDDXntDIA_HZw8Rk', '2021-02-02 20:50:14.346000'),
	('zfrb98iuvpxpu6hu077as8wcg49j9j6o', '.eJxVjMsOwiAQRf-FtSE8hgm6dO83kAEGqRpISrsy_rtt0oVu7znnvkWgdalhHTyHKYuL0OL0u0VKT247yA9q9y5Tb8s8Rbkr8qBD3nrm1_Vw_w4qjbrV3rOzbDKeEQGQtNbMXLT10STjwREYxRYVlsLgHRn0wGxg01GlKD5fxyI3Gg:1l4c7k:ncDlwAclXPSBGZKbeeX8jWouH74UorPFxsPirb9ZuaM', '2021-02-10 04:08:08.699629');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.modelo_cliente
CREATE TABLE IF NOT EXISTS `modelo_cliente` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(70) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `estadoCivil` varchar(20) NOT NULL,
  `correo` varchar(105) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `direccion` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.modelo_cliente: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_cliente` DISABLE KEYS */;
INSERT INTO `modelo_cliente` (`cliente_id`, `cedula`, `nombres`, `apellidos`, `genero`, `estadoCivil`, `correo`, `telefono`, `celular`, `direccion`, `date_created`) VALUES
	(1, '110607', 'Luis', 'Sarmiento', 'masculino', 'soltero', 'luis@gmail.com', '23424234', '09897549865', 'Loja-Ecuador', '2021-01-26 04:37:58.943574'),
	(2, '1111', 'Rosa', 'Cuenca', 'femenino', 'casado', 'rosa@gmail.com', '0989023836', '0989023836', 'Loja', '2021-01-26 04:38:49.838673'),
	(3, '2222', 'Maura', 'Cuenca', 'femenino', 'casado', 'maura@gmail', '86554544', '87699876', 'Orianga', '2021-01-26 04:39:23.626708'),
	(4, '3333', 'Juan', 'Gonzalez', 'masculino', 'soltero', 'juanito@gmail.com', '87987', '97678', 'El Plateado', '2021-01-26 04:40:10.384615'),
	(5, '5555', 'Aurelio', 'Marco', 'masculino', 'soltero', 'marco@gmail.com', '76579', '78343443', 'Roma', '2021-01-26 04:41:22.231140'),
	(6, '66666', 'Caro', 'Guaman', 'femenino', 'soltero', 'caro@gmail.com', '543579', '7834113', 'Loja', '2021-01-29 12:30:22.231140'),
	(9, '123451', 'Marco', 'Guaman', 'masculino', 'soltero', 'marco@gmail.com', '3339', '744444113', 'Loja', '2021-02-02 12:40:22.231140'),
	(10, '00011', 'Francis', 'Malc', 'masculino', 'soltero', 'fran@gmail.com', '3339', '744444113', 'Loja', '2021-02-02 12:48:22.231140'),
	(12, '0011', 'Francis', 'Malc', 'masculino', 'soltero', 'fran@gmail.com', '3339', '744444113', 'Loja', '2021-02-02 12:48:22.231140'),
	(13, '9898', 'Marco', 'Mark', 'masculino', 'soltero', 'fran@gmail.com', '3339', '11122', 'Quito', '2021-02-22 20:09:22.231140'),
	(14, '7687', 'Alexis', 'Sanchez', 'masculino', 'soltero', 'fran@gmail.com', '3339', '11122', 'Guayas', '2021-02-22 20:09:22.231140');
/*!40000 ALTER TABLE `modelo_cliente` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.modelo_cuenta
CREATE TABLE IF NOT EXISTS `modelo_cuenta` (
  `cuenta_id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `fechaApartura` datetime(6) NOT NULL,
  `tipoCuenta` varchar(20) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`cuenta_id`),
  UNIQUE KEY `numero` (`numero`),
  KEY `modelo_cuenta_cliente_id_dcab0d68_fk_modelo_cliente_cliente_id` (`cliente_id`),
  CONSTRAINT `modelo_cuenta_cliente_id_dcab0d68_fk_modelo_cliente_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `modelo_cliente` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.modelo_cuenta: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_cuenta` DISABLE KEYS */;
INSERT INTO `modelo_cuenta` (`cuenta_id`, `numero`, `fechaApartura`, `tipoCuenta`, `saldo`, `estado`, `date_created`, `cliente_id`) VALUES
	(1, '1', '2021-01-26 05:38:07.376742', 'corriente', 779.60, 1, '2021-01-26 04:37:59.449090', 1),
	(2, '2', '2021-01-26 04:38:49.945641', 'ahorros', 678.00, 1, '2021-01-26 04:38:49.945641', 2),
	(3, '3', '2021-01-26 05:34:10.489265', 'corriente', 5063.00, 1, '2021-01-26 04:39:23.692708', 3),
	(4, '4', '2021-01-26 05:25:49.922670', 'ahorros', 400.00, 1, '2021-01-26 04:40:10.486611', 4),
	(5, '6', '2021-01-26 05:11:20.524531', 'programado', 470.00, 1, '2021-01-26 04:41:22.337674', 5),
	(6, '111', '2021-01-26 05:35:25.547257', 'corriente', 2985.00, 1, '2021-01-26 05:02:10.501591', 1),
	(7, '121', '2021-01-26 05:36:08.632063', 'corriente', 2204.00, 1, '2021-01-26 05:02:18.370830', 1),
	(8, '212', '2021-01-26 05:02:29.818109', 'corriente', 2323.00, 1, '2021-01-26 05:02:29.818109', 2),
	(9, '221', '2021-01-26 05:02:38.755146', 'programado', 3434.00, 1, '2021-01-26 05:02:38.756146', 2),
	(10, '321', '2021-01-26 05:38:51.190621', 'corriente', 800.00, 1, '2021-01-26 05:02:52.564161', 3),
	(11, '312', '2021-01-26 05:03:01.363803', 'corriente', 34.00, 1, '2021-01-26 05:03:01.363803', 3),
	(12, '423', '2021-01-26 05:03:12.384760', 'corriente', 3443.00, 1, '2021-01-26 05:03:12.384760', 4),
	(13, '412', '2021-01-26 05:28:02.463253', 'programado', 700.00, 1, '2021-01-26 05:03:21.996465', 4),
	(14, '4133', '2021-01-26 05:26:54.092328', 'corriente', 2399.50, 1, '2021-01-26 05:03:36.769797', 4);
/*!40000 ALTER TABLE `modelo_cuenta` ENABLE KEYS */;

-- Volcando estructura para tabla cooperativa.modelo_transaccion
CREATE TABLE IF NOT EXISTS `modelo_transaccion` (
  `transaccion_id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descripcion` longtext NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cuenta_id` int(11) NOT NULL,
  PRIMARY KEY (`transaccion_id`),
  KEY `modelo_transaccion_cuenta_id_13e268f8_fk_modelo_cuenta_cuenta_id` (`cuenta_id`),
  CONSTRAINT `modelo_transaccion_cuenta_id_13e268f8_fk_modelo_cuenta_cuenta_id` FOREIGN KEY (`cuenta_id`) REFERENCES `modelo_cuenta` (`cuenta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla cooperativa.modelo_transaccion: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo_transaccion` DISABLE KEYS */;
INSERT INTO `modelo_transaccion` (`transaccion_id`, `fecha`, `tipo`, `valor`, `descripcion`, `updated_at`, `cuenta_id`) VALUES
	(1, '2021-01-26 05:07:04.774828', 'deposito', 4.00, 'Desposito de prueba', '2021-01-26 05:07:04.774828', 5),
	(2, '2021-01-26 05:11:20.334522', 'deposito', 10.00, 'Gracias', '2021-01-26 05:11:20.334522', 5),
	(3, '2021-01-26 05:12:20.154338', 'deposito', 259.60, 'Depositando ahorro', '2021-01-26 05:12:20.154338', 1),
	(4, '2021-01-26 05:25:49.810652', 'retiro', 3034.00, 'retiro grande', '2021-01-26 05:25:49.810652', 4),
	(5, '2021-01-26 05:26:53.953845', 'retiro', 1034.50, 'retiro', '2021-01-26 05:26:53.953845', 14),
	(6, '2021-01-26 05:28:02.338263', 'deposito', 256.00, 'deposito', '2021-01-26 05:28:02.339258', 13),
	(7, '2021-01-26 05:31:51.812598', 'retiro', 156.00, 'retiro de ahorro', '2021-01-26 05:31:51.812598', 3),
	(8, '2021-01-26 05:32:49.276984', 'retiro', 156.00, 'retiro de ahorro', '2021-01-26 05:32:49.276984', 3),
	(9, '2021-01-26 05:33:59.890835', 'retiro', 156.00, 'retiro de ahorro', '2021-01-26 05:33:59.890835', 3),
	(10, '2021-01-26 05:34:03.136917', 'retiro', 156.00, 'retiro de ahorro', '2021-01-26 05:34:03.136917', 3),
	(11, '2021-01-26 05:34:10.361265', 'retiro', 2.00, 'a', '2021-01-26 05:34:10.361265', 3),
	(12, '2021-01-26 05:35:25.397160', 'retiro', 450.00, 'retiro', '2021-01-26 05:35:25.397160', 6),
	(13, '2021-01-26 05:36:08.513767', 'retiro', 1230.00, 'retirando', '2021-01-26 05:36:08.513767', 7),
	(14, '2021-01-26 05:37:33.708088', 'deposito', 10.00, 'me gane 10 dolares', '2021-01-26 05:37:33.708088', 1),
	(15, '2021-01-26 05:38:07.301849', 'deposito', 10.00, 'me gane 10 dolares', '2021-01-26 05:38:07.301849', 1),
	(16, '2021-01-26 05:38:51.064309', 'deposito', 567.00, 'ahi estan', '2021-01-26 05:38:51.064309', 10);
/*!40000 ALTER TABLE `modelo_transaccion` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
