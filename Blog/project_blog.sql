/*
MySQL Backup
Database: project_blog
Backup Time: 2022-10-27 19:07:11
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `project_blog`.`categories`;
DROP TABLE IF EXISTS `project_blog`.`comments`;
DROP TABLE IF EXISTS `project_blog`.`posts`;
DROP TABLE IF EXISTS `project_blog`.`posts_cate`;
DROP TABLE IF EXISTS `project_blog`.`roles`;
DROP TABLE IF EXISTS `project_blog`.`users`;
DROP TABLE IF EXISTS `project_blog`.`users_roles`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`name`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `author` int(11) NOT NULL,
  `posts_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updateD_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  KEY `posts_id` (`posts_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`author`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) DEFAULT 1,
  `users_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `update_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`users_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `posts_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `posts_cate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
CREATE TABLE `posts_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posts_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_id` (`posts_id`),
  KEY `categories_id` (`categories_id`),
  CONSTRAINT `posts_cate_ibfk_1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_cate_ibfk_2` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `work` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `image` text DEFAULT NULL,
  `remember_token` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
CREATE TABLE `users_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `roles_id` (`roles_id`),
  CONSTRAINT `users_roles_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_roles_ibfk_2` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
BEGIN;
LOCK TABLES `project_blog`.`categories` WRITE;
DELETE FROM `project_blog`.`categories`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `project_blog`.`comments` WRITE;
DELETE FROM `project_blog`.`comments`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `project_blog`.`posts` WRITE;
DELETE FROM `project_blog`.`posts`;
INSERT INTO `project_blog`.`posts` (`id`,`title`,`description`,`status`,`users_id`,`category_id`,`update_by`,`created_at`,`updated_at`,`deleted_at`) VALUES (1, 'SOS', 'This is final', 1, 16, NULL, 'Ngọc', '2022-07-27 07:29:03', '2022-07-30 10:48:51', NULL),(2, 'abcd1234', 'rand', 1, 17, NULL, 'Vũ Như Hải', '2022-07-29 09:52:46', '2022-07-30 11:20:17', NULL),(3, 'Post 3', 'no no no', 1, 17, NULL, NULL, '2022-07-29 09:55:41', '2022-07-30 10:49:27', NULL),(4, 'final', 'not final', 1, 17, NULL, 'Vũ Như Hải 2000', '2022-07-29 09:56:19', '2022-07-30 11:13:48', NULL),(5, 'test', 'this is first post', 1, 17, NULL, 'Vũ Như Hải', '2022-07-29 10:05:23', '2022-07-29 10:05:23', '2022-08-04 00:33:04'),(6, 'abcd', 'Description test', 0, 21, NULL, 'Nguyễn Ngọc Duy', '2022-08-02 15:39:05', '2022-08-03 17:45:27', NULL),(7, 'check done', 'verify done', 1, 21, NULL, 'Nguyễn Ngọc Duy', '2022-08-02 16:13:39', '2022-08-03 17:23:29', '2022-08-04 00:12:14'),(8, 'Create post', 'this post return show', 1, 21, NULL, 'Nguyễn Ngọc Duy', '2022-08-03 15:59:09', '2022-08-03 15:59:09', NULL),(9, 'First Edit', 'Edit done', 1, 21, NULL, 'Nguyễn Ngọc Duy', '2022-08-03 16:03:28', '2022-08-03 18:07:40', NULL),(10, 'Private', 'status return Private is true', 0, 21, NULL, 'Nguyễn Ngọc Duy', '2022-08-04 11:13:19', '2022-08-04 15:55:18', NULL),(11, 'Private again', 'True or false', 1, 21, NULL, 'Nguyễn Ngọc Duy', '2022-08-04 11:15:58', '2022-08-04 15:55:03', '2022-08-04 16:35:31'),(12, 'Check update', 'return hasnot \"Edited\" is done', 1, 21, NULL, 'Nguyễn Ngọc Duy', '2022-08-04 16:15:22', '2022-08-04 16:15:22', NULL),(13, 'default status', 'return 1 - public', 1, 21, NULL, 'Nguyễn Ngọc Duy', '2022-08-04 16:19:43', '2022-08-04 16:19:43', NULL),(14, 'Check status again', 'done or fail', 1, 21, NULL, 'Nguyễn Ngọc Duy', '2022-08-04 16:25:53', '2022-08-04 16:25:53', NULL);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `project_blog`.`posts_cate` WRITE;
DELETE FROM `project_blog`.`posts_cate`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `project_blog`.`roles` WRITE;
DELETE FROM `project_blog`.`roles`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `project_blog`.`users` WRITE;
DELETE FROM `project_blog`.`users`;
INSERT INTO `project_blog`.`users` (`id`,`name`,`password`,`email`,`phone`,`address`,`work`,`description`,`created_at`,`updated_at`,`birthday`,`image`,`remember_token`) VALUES (2, 'Đỗ Thị Nhung', '$2y$10$tC9HvlYKk9Vv/.CTpoz.HujzLRInHa6Vc8QfIKI6DvHsW8mpi1u3a', 'nhungdt@yahoo.com', '0365028552', 'Thanh Xuân', 'Student', 'This is boss Nhung', '2022-07-15 08:41:28', '2022-07-15 08:41:28', '2022-07-26', '', NULL),(10, 'Hoàng Thị Liên', '$2y$10$TOw8YaTnQR9oioELDjaj/eWm6yzFSXkLJT0.NKa.yYk7ai8gvgw4S', 'liet@edu', '0365098565', '1 Đại Cồ Việt1', 'Teacher', '6', '2022-07-15 09:51:19', '2022-07-15 09:51:19', '2022-07-11', '', NULL),(12, 'Đỗ Ngọc Định', '$2y$10$xc092ASw0D2wI2nnxt.3Rel/9MBCB4Jau/glSMdQfhQxOLQnMmBde', 'dinh.dn@yahoo.com', '19001009', 'Đống Đa', 'Student', 'Tôi là Định', '2022-07-16 02:28:22', '2022-07-16 02:28:22', '2022-07-16', '1657938502.png', NULL),(13, 'week1', '$2y$10$InXFeY99E2HZt/JCOHeCWumIE23603qBRID2WkWuwkKei2oEAwB1m', 'minhvadang1@gmail.com.vn', '036502856556', '1 Đại Cồ Việt', '5', 'adadadad5', '2022-07-16 07:08:36', '2022-07-16 07:08:36', '2022-07-16', '1657955315.jpg', NULL),(14, 'Định', '$2y$10$ryOeQdnBQbroy.7UgZStMOnmAh1UyvGISHFtbeqMA0r0aQF9JyCS6', 'a@c', '036502856565', '1 Đại Cồ Việt', 'Student', 'adadadad5', '2022-07-16 07:29:02', '2022-07-16 07:29:02', '2022-07-16', '1657956542.png', NULL),(15, 'Vũ Minh Đăng', '$2y$10$l9Qq2/ZD5l6Vgj6IXWLwoOCrl2cd.TOs2RUpAYphmmUdt9gRTHxg.', 'minhvadang12@gmail.com', '036502856579', '1 Đại Cồ Việt', 'farmer', 'adadadadscf', '2022-07-16 08:02:42', '2022-07-16 08:02:42', '2022-07-17', 'images\\default_avatar.jpg', NULL),(16, 'Ngọc LND', '$2y$10$lEYAsRyahDN.H2SrfMdjo.hHAQzzg/j3gm2ldLRRw4/0AlXKPDBmq', 'ngoc.nm@edu', '136595', '1 Đại Cồ Việt - Tây Lương', 'doctor', 'This is boss Ngọc', '2022-07-16 09:02:16', '2022-08-03 16:49:30', '2014-01-18', 'images/default_avatar.jpg', 'Z6ytUTWdRa4SxvIZrHwR6ohRUAVU4qVTGRaWVa8lbrw1L3VAIqmxIs7Bqio9'),(17, 'Vũ Như Hải', '$2y$10$TWT3Qq0PG1HmmW96O7450uniX9TurZSWq7YPqBdbGJA5d5qzqGLu2', 'hai.vn@sis.edu', '2345356', 'Bạch Mai', 'doctor', 'This is boss Hải', '2022-07-20 11:36:48', '2022-07-30 11:18:03', '2022-07-06', 'images/default_avatar.jpg', 'VrDUrfzfXzgVxZWhgiEL0xN9BrZVoYylOBNL6glnDbKiW0qH4W3DaNdpd5xv'),(20, 'user1', '$2y$10$GY8./xIubg6yNiYOrr.R4.qbQk5t.pb.AUqP.hOvaI9yjcXY/dPqy', 'user1@edu.vn', '234535689', '1 Đại Cồ Việt - BM', 'farmer', 'kfosifcjdu', '2022-07-21 03:18:32', '2022-07-21 03:18:32', '2022-07-08', 'images/default_avatar.jpg', NULL),(21, 'Nguyễn Ngọc Duy', '$2y$10$JU.J32H7sH2obC5Fizfu3u8P46uIu1HNFsC3fKMM17vifQ6Dc9qSK', 'duy.nn@gmail.com', '0988124234', 'Định Công Hạ', 'Tổng giám đốc shopee - Chủ tịch HĐQT Lazada', 'This is boss Duy NN', '2022-08-02 00:02:19', '2022-08-03 17:22:51', '2000-09-05', 'images/1659373338.jpg', 'UMwY7a0AC3A0gkGibcSW8678GFY09OKcsoSBhG07DP50Uv4A6CiPYyqGsnIM'),(22, 'admin', '$2y$10$px/xzGhk8IgjseLIKoMZGOE6XveXNRfY1KBeWD.NTdWAc5JGVZnVK', 'admin@gmail.com', '0365028565', '1 02 Đại Cồ Việt', 'Chủ tịch shopee', 'password : Dang@193  or Hys@1711', '2022-08-29 09:28:48', '2022-08-29 09:44:43', '2022-08-04', 'images/default_avatar.jpg', 'B3ssmrKMK1UP3uA8H0ajdR70wPlK8qrY8CPRme6HFAASTfftOHXhuAQO4yrr');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `project_blog`.`users_roles` WRITE;
DELETE FROM `project_blog`.`users_roles`;
UNLOCK TABLES;
COMMIT;
