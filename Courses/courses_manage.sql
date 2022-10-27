/*
MySQL Backup
Database: couses_manage
Backup Time: 2022-10-27 19:00:28
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `couses_manage`.`attendance`;
DROP TABLE IF EXISTS `couses_manage`.`class_student`;
DROP TABLE IF EXISTS `couses_manage`.`classes`;
DROP TABLE IF EXISTS `couses_manage`.`courses`;
DROP TABLE IF EXISTS `couses_manage`.`feedbacks`;
DROP TABLE IF EXISTS `couses_manage`.`lessons`;
DROP TABLE IF EXISTS `couses_manage`.`managers`;
DROP TABLE IF EXISTS `couses_manage`.`students`;
DROP TABLE IF EXISTS `couses_manage`.`studies`;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `study_id` (`study_id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE,
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`study_id`) REFERENCES `studies` (`id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
CREATE TABLE `class_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classes_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `classes_id` (`classes_id`) USING BTREE,
  KEY `students_id` (`students_id`) USING BTREE,
  CONSTRAINT `class_student_ibfk_1` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `class_student_ibfk_2` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `carer_staff` varchar(255) NOT NULL,
  `teaching_assistant` varchar(255) NOT NULL,
  `start` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `courses_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `courses_id` (`courses_id`) USING BTREE,
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `fees` int(11) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feeling` text NOT NULL,
  `questions` text DEFAULT NULL,
  `improve` text DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `study_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `study_id` (`study_id`) USING BTREE,
  KEY `student_id` (`student_id`) USING BTREE,
  KEY `course_id` (`course_id`) USING BTREE,
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`study_id`) REFERENCES `studies` (`id`),
  CONSTRAINT `feedbacks_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  CONSTRAINT `feedbacks_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courses_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `teacher` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `question` text DEFAULT NULL,
  `document` text DEFAULT NULL,
  `homework` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `courses_id` (`courses_id`) USING BTREE,
  CONSTRAINT `lessons_ibfk_1` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
CREATE TABLE `managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `role` enum('Giang vien','Tro giang','Chu nhiem') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `birthday` date NOT NULL,
  `native_place` varchar(255) NOT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `citizen_identify` varchar(12) NOT NULL,
  `date_of_issue` date DEFAULT NULL,
  `place_of_issue` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `school` varchar(255) DEFAULT NULL,
  `majors` varchar(255) DEFAULT NULL,
  `guardian` varchar(255) NOT NULL,
  `guardian_phone` varchar(15) NOT NULL,
  `father` varchar(255) DEFAULT NULL,
  `mother` varchar(255) DEFAULT NULL,
  `mother_job` varchar(255) DEFAULT NULL,
  `father_job` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
CREATE TABLE `studies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` varchar(255) NOT NULL,
  `carer_staff` varchar(255) NOT NULL,
  `teaching_assistant` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `location` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `class_id` (`class_id`) USING BTREE,
  KEY `lesson_id` (`lesson_id`) USING BTREE,
  CONSTRAINT `studies_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `studies_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
BEGIN;
LOCK TABLES `couses_manage`.`attendance` WRITE;
DELETE FROM `couses_manage`.`attendance`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `couses_manage`.`class_student` WRITE;
DELETE FROM `couses_manage`.`class_student`;
INSERT INTO `couses_manage`.`class_student` (`id`,`classes_id`,`students_id`) VALUES (1, 1, 1),(2, 1, 2),(3, 1, 3),(4, 1, 4),(5, 2, 1),(6, 2, 3);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `couses_manage`.`classes` WRITE;
DELETE FROM `couses_manage`.`classes`;
INSERT INTO `couses_manage`.`classes` (`id`,`name`,`carer_staff`,`teaching_assistant`,`start`,`status`,`courses_id`,`created_at`,`updated_at`) VALUES (1, 'TLKN 10.1', 'A', 'a', '0000-00-00', 0, 1, '2022-09-13 18:17:31', NULL),(2, 'TLKN 10.2', 'B', 'b', '0000-00-00', 0, 1, '2022-09-13 18:17:53', NULL),(3, 'TLKN 10.3', 'C', 'c', '0000-00-00', 0, 1, '2022-09-13 18:18:17', NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `couses_manage`.`courses` WRITE;
DELETE FROM `couses_manage`.`courses`;
INSERT INTO `couses_manage`.`courses` (`id`,`name`,`fees`,`description`,`status`,`created_at`,`updated_at`) VALUES (1, 'TLKN', 480000, '', 1, '2022-09-13 18:16:19', NULL),(2, 'TDTN', 500000, '', 0, '2022-09-13 18:16:40', NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `couses_manage`.`feedbacks` WRITE;
DELETE FROM `couses_manage`.`feedbacks`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `couses_manage`.`lessons` WRITE;
DELETE FROM `couses_manage`.`lessons`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `couses_manage`.`managers` WRITE;
DELETE FROM `couses_manage`.`managers`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `couses_manage`.`students` WRITE;
DELETE FROM `couses_manage`.`students`;
INSERT INTO `couses_manage`.`students` (`id`,`image`,`name`,`sex`,`birthday`,`native_place`,`nation`,`religion`,`citizen_identify`,`date_of_issue`,`place_of_issue`,`address`,`phone`,`email`,`facebook`,`school`,`majors`,`guardian`,`guardian_phone`,`father`,`mother`,`mother_job`,`father_job`,`created_at`,`updated_at`) VALUES (1, NULL, 'Dang', 0, '0000-00-00', '', NULL, NULL, '', NULL, NULL, '', '', '', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '2022-09-13 18:19:11', NULL),(2, NULL, 'Duy', 0, '0000-00-00', '', NULL, NULL, '', NULL, NULL, '', '', '', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '2022-09-13 18:19:18', NULL),(3, NULL, 'Hai', 0, '0000-00-00', '', NULL, NULL, '', NULL, NULL, '', '', '', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '2022-09-13 18:19:24', NULL),(4, NULL, 'Phuong', 0, '0000-00-00', '', NULL, NULL, '', NULL, NULL, '', '', '', '', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '2022-09-13 18:19:32', NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `couses_manage`.`studies` WRITE;
DELETE FROM `couses_manage`.`studies`;
UNLOCK TABLES;
COMMIT;
