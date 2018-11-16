/* CSCI 3308 - Milestone 4 */
/* bChat SQL */

DROP TABLE IF EXISTS `chats`;

CREATE TABLE `chats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user1_id` int(10) unsigned NOT NULL,
  `user2_id` int(10) unsigned NOT NULL,
  `delete_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pending` tinyint(1) NOT NULL,
  `pending_secret` varchar(23) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chats_user1_id_foreign` (`user1_id`),
  KEY `chats_user2_id_foreign` (`user2_id`),
  CONSTRAINT `chats_user1_id_foreign` FOREIGN KEY (`user1_id`) REFERENCES `users` (`id`),
  CONSTRAINT `chats_user2_id_foreign` FOREIGN KEY (`user2_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `chats` WRITE;

INSERT INTO `chats` VALUES
(1,1,2,'2018-10-29 00:00:00','2018-10-28 05:44:47','2018-10-28 05:44:47',0,''),
(2,3,1,'2018-10-29 00:00:00','2018-10-28 05:45:42','2018-10-28 05:45:42',0,''),
(3,1,2,'2018-10-29 00:00:00','2018-10-29 05:56:21','2018-10-29 05:56:21',0,''),
(4,1,2,'2018-11-06 00:00:00','2018-11-05 06:44:46','2018-11-05 06:44:46',1,'5bdf846e6b2353.32171436'),
(5,1,2,'2018-11-06 00:00:00','2018-11-05 06:47:50','2018-11-05 06:47:50',1,'5bdf85264ead27.86013101'),
(6,1,2,'2018-11-06 00:00:00','2018-11-05 06:52:00','2018-11-05 06:52:00',1,'5bdf8620a39a87.55154049'),
(7,2,1,'2018-11-06 00:00:00','2018-11-05 08:03:45','2018-11-05 08:03:45',1,'5bdf96f1b488e3.76823906'),
(8,1,2,'2018-11-06 00:00:00','2018-11-05 09:45:13','2018-11-05 09:45:13',1,'5bdfaeb9b74d17.53142417'),
(9,1,2,'2018-11-06 00:00:00','2018-11-05 10:31:47','2018-11-05 10:31:47',1,'5bdfb9a33ffa37.79329195'),
(10,1,2,'2018-11-06 00:00:00','2018-11-05 10:38:25','2018-11-05 10:38:25',1,'5bdfbb3143d6a2.03796685'),
(11,1,2,'2018-11-06 00:00:00','2018-11-05 12:45:24','2018-11-05 12:45:24',1,'5bdfd8f4bdb9c5.60685006'),
(12,1,2,'2018-11-06 00:00:00','2018-11-05 12:52:43','2018-11-05 12:52:43',1,'5bdfdaab3bab70.93547974'),
(13,1,2,'2018-11-06 00:00:00','2018-11-05 12:54:25','2018-11-05 12:54:25',1,'5bdfdb1114b7e1.45816702'),
(14,2,1,'2018-11-18 00:00:00','2018-11-16 01:52:23','2018-11-16 01:52:23',1,'5bedc067c92cd2.08182442'),
(15,2,1,'2018-11-18 00:00:00','2018-11-16 01:54:26','2018-11-16 01:54:26',1,'5bedc0e24b7c17.52587757'),
(16,2,1,'2018-11-18 00:00:00','2018-11-16 01:55:25','2018-11-16 01:55:25',1,'5bedc11d39e612.79648742'),
(17,2,1,'2018-11-18 00:00:00','2018-11-16 02:03:36','2018-11-16 02:03:36',1,'5bedc308a28544.63264366'),
(18,2,1,'2018-11-18 00:00:00','2018-11-16 02:07:58','2018-11-16 02:07:58',1,'5bedc40ed43cb7.76432461'),
(19,2,1,'2018-11-18 00:00:00','2018-11-16 02:08:45','2018-11-16 02:08:45',1,'5bedc43d72bab4.01819603'),
(21,2,1,'2018-11-18 00:00:00','2018-11-16 02:15:44','2018-11-16 02:15:52',0,'5bedc5e06e5116.01397227'),
(23,2,1,'2018-11-18 00:00:00','2018-11-16 02:30:42','2018-11-16 02:30:48',0,'5bedc962496c49.18077618'),
(24,2,1,'2018-11-18 00:00:00','2018-11-16 02:31:45','2018-11-16 02:31:55',0,'5bedc9a18d0d91.11900340'),
(25,2,1,'2018-11-18 00:00:00','2018-11-16 02:34:02','2018-11-16 02:34:07',0,'5bedca2ace7089.87132079'),
(26,2,1,'2018-11-18 00:00:00','2018-11-16 02:35:21','2018-11-16 02:35:30',0,'5bedca7914c402.09437451'),
(27,2,1,'2018-11-18 00:00:00','2018-11-16 08:24:34','2018-11-16 08:25:06',0,'5bee1c5238cf22.75755555');

UNLOCK TABLES;


DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` int(10) unsigned NOT NULL,
  `message_content` blob NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_chat_id_foreign` (`chat_id`),
  CONSTRAINT `messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `messages` WRITE;

INSERT INTO `messages` VALUES
(1,2,_binary 'What\'s up','2018-11-16 08:50:13','2018-11-16 08:50:13'),
(2,27,_binary 'What\'s up','2018-11-16 08:53:30','2018-11-16 08:53:30'),
(3,27,_binary 'What\'s up','2018-11-16 08:54:17','2018-11-16 08:54:17');

UNLOCK TABLES;


DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;

INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(5,'2018_10_18_034442_create_chats_table',2),
(6,'2018_10_18_034538_create_messages_table',2),
(8,'2018_10_20_050633_force_username_unique',3),
(10,'2018_10_29_010609_cascade_delete_messages',4),
(12,'2018_11_04_204129_chats_pending',5);

UNLOCK TABLES;


DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `password_resets` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;

INSERT INTO `users` VALUES
(1,'sam','smmauck@gmail.com',NULL,'$2y$10$Z.F8AmZaofiZYeHd6Y043.M3zaf7E3qTgowBPaDPtRnURmGB.iP9e','bEbuHja5SlrpejrCypigqnxzP55dykkFdUwLBOCeKnJu6jNO7h9wAmpQu24X','2018-10-18 09:32:37','2018-10-18 09:32:37'),
(2,'mas','test@test.com',NULL,'$2y$10$EMJAmoLf.ZmisURAV3S0M.lfcA.wZsdzLGWkz8n58dr6Z85mJab0O','XnwINHQ7epKez4chIvQV48Z0EnNRJBY4QnIkHbI4uJMcu1HGL9yBjfb6cpgx','2018-10-23 11:56:06','2018-10-23 11:56:06'),
(3,'ams','ams@test.com',NULL,'$2y$10$FOy1Bb10BBRa/uxatbTDXOeDt4AQFon3hv3qNFd.ys0Jn4lMxffA.','oUxkfNsWJ49n4WgsEslYGMNJLE5MBcv9cLMPJGu5FD8FKlZ3cWosQ7dkirPo','2018-10-28 05:45:42','2018-10-28 05:45:42');

UNLOCK TABLES;
