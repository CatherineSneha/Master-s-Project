CREATE TABLE `contact_form_details` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `ADDRESS1` varchar(255) DEFAULT NULL,
  `ADDRESS2` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `ZIP` varchar(255) DEFAULT NULL,
  `MESSAGE` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
