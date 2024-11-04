CREATE TABLE IF NOT EXISTS `drx_mdw_evidence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `tags` longtext NOT NULL,
  `timeStamp` longtext not NULL,
  `createdBy` longtext not NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `drx_mdw_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `details` longtext NOT NULL,
  `evidence` longtext DEFAULT NULL,
  `officers` longtext NOT NULL,
  `persons` longtext NOT NULL,
  `tags` longtext NOT NULL,
  `addedCrims` longtext NOT NULL,
  `timeStamp` longtext not NULL,
  `createdBy` longtext not NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `drx_mdw_legislation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext DEFAULT NULL,
  `details` longtext DEFAULT '[]',
  `tags` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `drx_mdw_officers` (
  `citizenid` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `callsign` int(11) NOT NULL DEFAULT 0,
  `alias` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `roles` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `drx_mdw_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `desc` longtext NOT NULL,
  `tags` longtext NOT NULL,
  `evidence` longtext NOT NULL,
  `officers` longtext NOT NULL,
  `persons` longtext NOT NULL,
  `timeStamp` longtext not NULL,
  `createdBy` longtext not NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `drx_mdw_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageofday` longtext DEFAULT NULL,
  `announcements` longtext DEFAULT NULL,
  `chat` longtext DEFAULT NULL,
  `academySheet` longtext DEFAULT NULL,
  `disciplinary` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `drx_mdw_extra` (`id`, `messageofday`, `announcements`, `chat`, `academySheet`, `disciplinary`) VALUES
	(1, NULL, NULL, NULL, NULL, NULL);

ALTER TABLE `players` ADD (
  `note` LONGTEXT NULL,
  `tags` LONGTEXT NULL DEFAULT '[]',
  `points` INT(11) NULL DEFAULT '0',
  `wanted` INT(11) NULL DEFAULT '0',
  `image` TEXT NULL);

  ALTER TABLE `player_vehicles` ADD (
  `note` LONGTEXT NULL DEFAULT '',
  `tags` LONGTEXT NULL DEFAULT '[]',
  `evidence` LONGTEXT NULL DEFAULT '[]');