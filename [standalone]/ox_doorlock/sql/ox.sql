-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for crps
CREATE DATABASE IF NOT EXISTS `crps` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `crps`;

-- Dumping structure for table crps.ox_doorlock
CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table crps.ox_doorlock: ~42 rows (approximately)
INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'jewellery_stores jewellery-citymain', '{"coords":{"x":-631.19091796875,"y":-237.38540649414063,"z":38.2065315246582},"state":1,"doors":[{"model":9467943,"heading":306,"coords":{"x":-630.426513671875,"y":-238.4375457763672,"z":38.2065315246582}},{"model":1425919976,"heading":306,"coords":{"x":-631.9553833007813,"y":-236.33326721191407,"z":38.2065315246582}}],"groups":{"police":0},"maxDistance":2}'),
	(2, 'jewellery_stores jewellery-citysec', '{"coords":{"x":-629.1338500976563,"y":-230.15170288085938,"z":38.20658493041992},"state":1,"doors":false,"heading":36,"model":1335309163,"groups":{"police":0},"maxDistance":2}'),
	(3, 'jewellery_stores jewellery-grapemain', '{"coords":{"x":1653.470458984375,"y":4882.861328125,"z":42.30984497070312},"state":1,"doors":[{"model":9467943,"heading":98,"coords":{"x":1653.2855224609376,"y":4884.1484375,"z":42.30984497070312}},{"model":1425919976,"heading":98,"coords":{"x":1653.655517578125,"y":4881.57373046875,"z":42.30984497070312}}],"groups":{"police":0},"maxDistance":2}'),
	(4, 'jewellery_stores jewellery-grapesec', '{"coords":{"x":1648.27490234375,"y":4877.42333984375,"z":42.30989837646484},"state":1,"doors":false,"heading":188,"model":1335309163,"groups":{"police":0},"maxDistance":2}'),
	(5, 'jewellery_stores jewellery-palmain', '{"coords":{"x":-382.9197692871094,"y":6043.1376953125,"z":31.65892028808593},"state":1,"doors":[{"model":9467943,"heading":315,"coords":{"x":-382.0016174316406,"y":6042.216796875,"z":31.65892028808593}},{"model":1425919976,"heading":315,"coords":{"x":-383.8379211425781,"y":6044.05908203125,"z":31.65892028808593}}],"groups":{"police":0},"maxDistance":2}'),
	(6, 'jewellery_stores jewellery-palsec', '{"coords":{"x":-382.0077209472656,"y":6050.60302734375,"z":31.65897369384765},"state":1,"doors":false,"heading":45,"model":1335309163,"groups":{"police":0},"maxDistance":2}'),
	(32, 'PD_1', '{"maxDistance":2,"doorRate":1.1,"doors":[{"model":-1547307588,"heading":90,"coords":{"x":434.74444580078127,"y":-983.078125,"z":30.81530380249023}},{"model":-1547307588,"heading":270,"coords":{"x":434.74444580078127,"y":-980.7555541992188,"z":30.81530380249023}}],"state":1,"coords":{"x":434.74444580078127,"y":-981.9168701171875,"z":30.81530380249023},"groups":{"police":0,"ambulance":0}}'),
	(33, 'PD_2', '{"maxDistance":2,"model":-96679321,"doors":false,"state":1,"coords":{"x":440.52008056640627,"y":-986.2334594726563,"z":30.82319259643554},"heading":180,"groups":{"police":0,"ambulance":0}}'),
	(34, 'PD_3', '{"maxDistance":2,"model":-1406685646,"doors":false,"state":1,"coords":{"x":440.52008056640627,"y":-977.60107421875,"z":30.82319259643554},"heading":0,"groups":{"police":0,"ambulance":0}}'),
	(35, 'PD_4', '{"maxDistance":2,"doors":[{"model":-288803980,"heading":90,"coords":{"x":469.44061279296877,"y":-987.4376831054688,"z":30.82319259643554}},{"model":-288803980,"heading":270,"coords":{"x":469.44061279296877,"y":-985.0313110351563,"z":30.82319259643554}}],"state":1,"coords":{"x":469.44061279296877,"y":-986.2344970703125,"z":30.82319259643554},"groups":{"police":0}}'),
	(36, 'PD_5', '{"maxDistance":2,"model":-692649124,"doors":false,"state":1,"coords":{"x":479.750732421875,"y":-999.6290283203125,"z":30.7891674041748},"heading":90,"groups":{"police":0}}'),
	(37, 'PD_6', '{"maxDistance":2,"doors":[{"model":-1547307588,"heading":180,"coords":{"x":458.208740234375,"y":-972.2542724609375,"z":30.8153076171875}},{"model":-1547307588,"heading":0,"coords":{"x":455.88616943359377,"y":-972.2542724609375,"z":30.8153076171875}}],"state":1,"coords":{"x":457.0474548339844,"y":-972.2542724609375,"z":30.8153076171875},"groups":{"police":0}}'),
	(38, 'PD_7', '{"maxDistance":2,"model":1830360419,"doors":false,"state":1,"coords":{"x":464.1590576171875,"y":-974.6655883789063,"z":26.3707046508789},"heading":270,"groups":{"police":0}}'),
	(39, 'PD_8', '{"maxDistance":2,"model":1830360419,"doors":false,"state":1,"coords":{"x":464.15655517578127,"y":-997.50927734375,"z":26.3707046508789},"heading":90,"groups":{"police":0}}'),
	(40, 'PD_9', '{"maxDistance":3,"doors":[{"model":-692649124,"heading":0,"coords":{"x":467.3686218261719,"y":-1014.406005859375,"z":26.48381614685058}},{"model":-692649124,"heading":180,"coords":{"x":469.7742614746094,"y":-1014.406005859375,"z":26.48381614685058}}],"state":1,"coords":{"x":468.5714416503906,"y":-1014.406005859375,"z":26.48381614685058},"groups":{"police":0}}'),
	(41, 'PD_10', '{"maxDistance":1.5,"doors":[{"model":149284793,"heading":90,"coords":{"x":471.3758239746094,"y":-1010.1978759765625,"z":26.40548324584961}},{"model":149284793,"heading":270,"coords":{"x":471.36785888671877,"y":-1007.7933959960938,"z":26.40548324584961}}],"state":1,"coords":{"x":471.371826171875,"y":-1008.99560546875,"z":26.40548324584961},"groups":{"police":0}}'),
	(42, 'PD_11', '{"maxDistance":1.5,"model":-53345114,"doors":false,"state":1,"coords":{"x":476.6156921386719,"y":-1008.8754272460938,"z":26.48005485534668},"heading":270,"groups":{"police":0}}'),
	(43, 'cell1', '{"maxDistance":1,"model":-53345114,"doors":false,"state":1,"coords":{"x":481.00836181640627,"y":-1004.1179809570313,"z":26.48005485534668},"heading":180,"groups":{"police":0}}'),
	(44, 'cell2', '{"maxDistance":1,"model":-53345114,"doors":false,"state":1,"coords":{"x":484.1764221191406,"y":-1007.734375,"z":26.48005485534668},"heading":180,"groups":{"police":0}}'),
	(45, 'cell3', '{"maxDistance":2,"model":-53345114,"auto":true,"doors":false,"state":1,"coords":{"x":486.9131164550781,"y":-1012.1886596679688,"z":26.48005485534668},"heading":0,"groups":{"police":0}}'),
	(46, 'cell4', '{"maxDistance":1.5,"model":-53345114,"auto":true,"doors":false,"state":1,"coords":{"x":483.9127197265625,"y":-1012.1886596679688,"z":26.48005485534668},"heading":0,"groups":{"police":0}}'),
	(47, 'cell5', '{"maxDistance":1,"model":-53345114,"doors":false,"state":1,"coords":{"x":480.9128112792969,"y":-1012.1886596679688,"z":26.48005485534668},"heading":0,"groups":{"police":0}}'),
	(48, 'cell6', '{"maxDistance":1,"model":-53345114,"doors":false,"state":1,"coords":{"x":477.91259765625,"y":-1012.1886596679688,"z":26.48005485534668},"heading":0,"groups":{"police":0}}'),
	(49, 'garage1', '{"maxDistance":7,"model":2130672747,"auto":true,"doors":false,"state":1,"coords":{"x":452.3005065917969,"y":-1000.7716674804688,"z":26.69660949707031},"heading":0,"groups":{"police":0}}'),
	(50, 'garage2', '{"maxDistance":7,"model":2130672747,"auto":true,"doors":false,"state":1,"coords":{"x":431.41192626953127,"y":-1000.7716674804688,"z":26.69660949707031},"heading":0,"groups":{"police":0}}'),
	(51, 'front1', '{"maxDistance":5,"model":-1868050792,"doors":false,"state":1,"coords":{"x":410.0257873535156,"y":-1024.2259521484376,"z":29.2202205657959},"heading":270,"groups":{"police":0}}'),
	(52, 'frontgate2', '{"maxDistance":5,"model":-1635161509,"doors":false,"state":1,"coords":{"x":410.0257873535156,"y":-1024.219970703125,"z":29.22019958496093},"heading":270,"groups":{"police":0}}'),
	(53, 'backgarage', '{"maxDistance":7,"model":-1603817716,"doors":false,"state":1,"coords":{"x":488.8948059082031,"y":-1017.2119750976563,"z":27.14934921264648},"heading":90,"groups":{"police":0}}'),
	(61, 'pilbox1', '{"coords":{"x":-440.6439208984375,"y":-321.7954406738281,"z":35.06683349609375},"doorRate":1,"heading":293,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(62, 'ambulance2', '{"coords":{"x":-444.2193908691406,"y":-320.15704345703127,"z":35.06685638427734},"doorRate":2,"groups":{"police":0,"ambulance":0},"doors":[{"model":665455406,"heading":202,"coords":{"x":-443.0124206542969,"y":-319.66937255859377,"z":35.06685638427734}},{"model":665455406,"heading":22,"coords":{"x":-445.4263610839844,"y":-320.6446838378906,"z":35.06685638427734}}],"state":1,"maxDistance":2}'),
	(63, 'ems3', '{"coords":{"x":-442.5889892578125,"y":-317.0564270019531,"z":35.06619262695312},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(64, 'ems4', '{"coords":{"x":-448.6458435058594,"y":-316.0326232910156,"z":35.06632232666015},"doorRate":1,"heading":292,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(65, 'ems5', '{"coords":{"x":-449.22491455078127,"y":-314.634033203125,"z":35.06632232666015},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(66, 'ems6', '{"coords":{"x":-451.474609375,"y":-309.0658264160156,"z":35.06632232666015},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(67, 'ems7', '{"coords":{"x":-447.341796875,"y":-305.49908447265627,"z":35.07070922851562},"doorRate":1,"heading":292,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(68, 'ems8', '{"coords":{"x":-452.70513916015627,"y":-306.0628967285156,"z":35.06632232666015},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(69, 'ems9', '{"coords":{"x":-449.6571960449219,"y":-299.8382873535156,"z":35.07070922851562},"doorRate":1,"heading":292,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(70, 'ems10', '{"coords":{"x":-454.9653015136719,"y":-300.55145263671877,"z":35.06632232666015},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(71, 'ems11', '{"coords":{"x":-453.0472106933594,"y":-291.5856018066406,"z":35.06544494628906},"doorRate":1,"heading":292,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(72, 'ems11', '{"coords":{"x":-457.1219787597656,"y":-295.3081970214844,"z":35.06632232666015},"doorRate":1,"heading":112,"groups":{"ambulance":0},"doors":false,"model":493136920,"state":1,"maxDistance":2}'),
	(73, 'ems11', '{"coords":{"x":-457.01513671875,"y":-288.7811279296875,"z":35.06948852539062},"doorRate":2,"groups":{"police":0,"ambulance":0},"doors":[{"model":665455406,"heading":202,"coords":{"x":-455.8128356933594,"y":-288.2953796386719,"z":35.06948852539062}},{"model":665455406,"heading":22,"coords":{"x":-458.2174072265625,"y":-289.26690673828127,"z":35.06948852539062}}],"state":0,"maxDistance":2}'),
	(74, 'ems12', '{"coords":{"x":-500.5936279296875,"y":-325.24713134765627,"z":42.46982955932617},"doorRate":2,"groups":{"ambulance":0},"doors":[{"model":873979204,"heading":185,"coords":{"x":-499.2977294921875,"y":-325.1405944824219,"z":42.46982955932617}},{"model":873979204,"heading":5,"coords":{"x":-501.8894958496094,"y":-325.3536682128906,"z":42.46982955932617}}],"state":1,"maxDistance":2}'),
	(75, 'ems13', '{"coords":{"x":-495.837646484375,"y":-333.49407958984377,"z":69.67925262451172},"doorRate":2,"groups":{"ambulance":0},"doors":[{"model":665455406,"heading":262,"coords":{"x":-495.6571350097656,"y":-332.2098693847656,"z":69.67925262451172}},{"model":665455406,"heading":82,"coords":{"x":-496.01812744140627,"y":-334.7782897949219,"z":69.67925262451172}}],"state":1,"maxDistance":2}'),
	(76, 'pd_12', '{"coords":{"x":441.9004821777344,"y":-998.7462158203125,"z":30.81530380249023},"state":1,"maxDistance":2,"doorRate":3,"groups":{"police":0},"doors":[{"coords":{"x":443.061767578125,"y":-998.7462158203125,"z":30.81530380249023},"heading":180,"model":-1547307588},{"coords":{"x":440.73919677734377,"y":-998.7462158203125,"z":30.81530380249023},"heading":0,"model":-1547307588}]}');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
