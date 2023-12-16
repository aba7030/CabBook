
DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `id` int NOT NULL,
  `car_id` int DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `booking` WRITE;

INSERT INTO `booking` VALUES (303,302,NULL,'booked','cust1'),(305,352,NULL,'booked','cust1'),(353,402,NULL,'booked','cust1');

UNLOCK TABLES;

DROP TABLE IF EXISTS `booking_seq`;
CREATE TABLE `booking_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `booking_seq` WRITE;
INSERT INTO `booking_seq` VALUES (501);
UNLOCK TABLES;

DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int NOT NULL,
  `available_for_booking` bit(1) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `seating_capacity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `car` WRITE;
INSERT INTO `car` VALUES (552,_binary '','Red',202,'Swift',4),(553,_binary '','Blue',203,'BMW',4),(554,_binary '','White',205,'Car1',7),(555,_binary '','white',206,'Car2',3),(602,_binary '','white',NULL,'Car3',3),(603,_binary '','red',252,'car7',3);
UNLOCK TABLES;

DROP TABLE IF EXISTS `car_request`;
CREATE TABLE `car_request` (
  `id` int NOT NULL,
  `car_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `request_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `car_request` WRITE;
INSERT INTO `car_request` VALUES (303,402,102,'PENDING'),(302,554,252,'REJECTED');
UNLOCK TABLES;
DROP TABLE IF EXISTS `car_request_seq`;

CREATE TABLE `car_request_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `car_request_seq` WRITE;
INSERT INTO `car_request_seq` VALUES (401);
UNLOCK TABLES;
DROP TABLE IF EXISTS `car_seq`;
CREATE TABLE `car_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `car_seq` WRITE;
INSERT INTO `car_seq` VALUES (701);
UNLOCK TABLES;


DROP TABLE IF EXISTS `driver`;

CREATE TABLE `driver` (
  `id` int NOT NULL,
  `assigned_car_id` int DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `used_car_ids` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `driver` WRITE;
INSERT INTO `driver` VALUES (202,552,'$2a$12$TLJOLK.QjLRdxOHew1XMT.eYa2Xr5HMHaT14fRoI3gMOIZijNu9F2','552','driver1'),(203,553,'$2a$12$TLJOLK.QjLRdxOHew1XMT.eYa2Xr5HMHaT14fRoI3gMOIZijNu9F2','553','driver2'),(206,555,'$2a$12$TLJOLK.QjLRdxOHew1XMT.eYa2Xr5HMHaT14fRoI3gMOIZijNu9F2','555','driver5'),(205,554,'$2a$12$TLJOLK.QjLRdxOHew1XMT.eYa2Xr5HMHaT14fRoI3gMOIZijNu9F2','554','driver4'),(252,603,'$2a$12$TLJOLK.QjLRdxOHew1XMT.eYa2Xr5HMHaT14fRoI3gMOIZijNu9F2','602,603','driver6');
UNLOCK TABLES;

DROP TABLE IF EXISTS `driver_seq`;
CREATE TABLE `driver_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `driver_seq` WRITE;
INSERT INTO `driver_seq` VALUES (351);
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (1,'$2a$12$q6uEwAQbTEat0.7VeRC8hOsFZCle66hRDHcYEyYQiBD1Oq8Ry5zwe','ADMIN','admin'),(2,'$2a$12$iJOC0gB0HKAtHq6u93/HAOgWzcR5uudmg/8j5JeAamylycr/UxA7G','USER','cust1'),(3,'$2a$12$WWwVoIGPrIt7/KkEeb2os.ytO9LQdazZVXvNvDVXeSPj.5jzkork2','USER','cust2');
UNLOCK TABLES;



DROP TABLE IF EXISTS `users_seq`;

CREATE TABLE `users_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users_seq` VALUES (1);

