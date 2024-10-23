-- Dumping structure for table qb-new.motel
CREATE TABLE IF NOT EXISTS `motel` (
  `motel` varchar(50) DEFAULT NULL,
  `room` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `expire` datetime DEFAULT NULL,
  `serialkey` varchar(50) DEFAULT NULL,
  KEY `motel` (`motel`),
  KEY `owner` (`owner`),
  KEY `serialkey` (`serialkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

ALTER TABLE motel ADD COLUMN IF NOT EXISTS autopay TINYINT(0);

CREATE TABLE IF NOT EXISTS `motel_owner` (
  `motel` varchar(50) NOT NULL,
  `balance` int(11) DEFAULT 0,
  `total` int(11) DEFAULT 0,
  UNIQUE KEY `motel` (`motel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Handle data for motel owner NOT room owner';

CREATE TABLE IF NOT EXISTS `motel_instances` (
  `identifier` varchar(50) DEFAULT NULL,
  `motel` varchar(50) DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;