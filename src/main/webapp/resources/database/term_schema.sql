create database if not exists `calendar`;
use `calendar`;

drop table if exists `calendar_users`;
create table `calendar_users` (
	`id` int(32) unsigned not null auto_increment,
	`user_id` varchar(20) NOT NULL,
	`name` varchar(20) NOT NULL,
	`password` varchar(20) NOT NULL,
	`email` varchar(100) NOT NULL,
	`level` tinyint(4) NOT NULL,
	`login` int(11) NOT NULL,
	`recommend` int(11) NOT NULL,
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `calendar_users` WRITE;
INSERT INTO `calendar_users`(`user_id`, `name`, `password`, `email`, `level`, `login`, `recommend`) VALUES ('admin','홍길동','admin','admin@ksug.org',1,0,0),('bumjin','박범진','p1','user1@ksug.org',1,49,0),('green','오민규','p5','user5@ksug.org',3,100,2147483647);
UNLOCK TABLES;

drop table if exists `events`;
create table `events` (
    `id` int(32) unsigned not null auto_increment,
    `when` timestamp not null,
    `summary` varchar(255) not null,
    `description` varchar(500) not null,
    `owner` int(32) unsigned not null,
    `num_likes` int(32) unsigned not null,
    `event_level` tinyint not null,   
    PRIMARY KEY (`id`),
    KEY `fk_events_owner` (`owner`),
    CONSTRAINT `constraints_events_owner` FOREIGN KEY (`owner`) REFERENCES `calendar_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `events` WRITE;
INSERT INTO `events`(`when`, `summary`, `description`, `owner`, `num_likes`, `event_level`) VALUES ('2014-12-11 03:05:00','test1','test1 zz',1,1,1),('2014-12-11 03:05:00','test2','test2 zz',2,0,1);
UNLOCK TABLES;

drop table if exists `event_attendees`;
create table `events_attendees` (
    `id` int(32) unsigned not null auto_increment,
    `event_id` int(32) unsigned not null,
    `attendee` int(32) unsigned not null,
    PRIMARY KEY (`id`),
    KEY `fk_events_id` (`event_id`),
    KEY `fk_events_attendee` (`attendee`),
    CONSTRAINT `constraints_events_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `constraints_events_attendee` FOREIGN KEY (`attendee`) REFERENCES `calendar_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `events_attendees` WRITE;
INSERT INTO `events_attendees`(`event_id`, `attendee`) VALUES (1,1),(1,2),(2,3);
UNLOCK TABLES;

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_username_role` (`role`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

LOCK TABLES `user_roles` WRITE;
INSERT INTO `user_roles` (`user_id`, `role`) VALUES ('admin','ROLE_ADMIN'),('bumjin','ROLE_USER'),('green','ROLE_USER');
UNLOCK TABLES;