/*
Navicat MySQL Data Transfer

Source Server         : CuisineSharing
Source Server Version : 50636
Source Host           : us-cdbr-iron-east-05.cleardb.net:3306
Source Database       : ad_e2994e10f52486f

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-11-23 05:33:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `dateline` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `rating` int(11) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_apirq8ka64iidc18f3k6x5tc5` (`post_id`),
  KEY `FK_jhvt6d9ap8gxv67ftrmshdfhj` (`user_id`),
  CONSTRAINT `FK_apirq8ka64iidc18f3k6x5tc5` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FK_jhvt6d9ap8gxv67ftrmshdfhj` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', 'sdasfsdf', null, '\0', '0', '21', '1');

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `series` varchar(255) NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `dateline` int(11) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `memberLimit` int(11) DEFAULT NULL,
  `showTime` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `video` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_s7ui38nhrh0c7q4nfpgf93bfk` (`user_id`),
  CONSTRAINT `FK_s7ui38nhrh0c7q4nfpgf93bfk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', 'dddd', null, null, '/CuisineSharing/resource/uploads/2b8e9d40d9e75be52a75a415a759eb9f.jpg', '', null, null, 'aaaa', '1', null, '1');
INSERT INTO `post` VALUES ('11', 'bbb', null, null, '/CuisineSharing/resource/uploads/34fb458156df459731114ba98aed2e0.jpg', '', null, null, 'bbb', '1', null, '1');
INSERT INTO `post` VALUES ('21', 'ccc', null, null, '/CuisineSharing/resource/uploads/d674dceb35cb699b11757c396a847d85.jpg', '', null, null, 'ccc', '1', null, '1');

-- ----------------------------
-- Table structure for post_comment
-- ----------------------------
DROP TABLE IF EXISTS `post_comment`;
CREATE TABLE `post_comment` (
  `Post_id` bigint(20) NOT NULL,
  `comments_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_5nd2ucnctmvwq31ovab2vi00x` (`comments_id`),
  KEY `FK_er6ity1dxt1bobfug8s7ibn2o` (`Post_id`),
  CONSTRAINT `FK_5nd2ucnctmvwq31ovab2vi00x` FOREIGN KEY (`comments_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `FK_er6ity1dxt1bobfug8s7ibn2o` FOREIGN KEY (`Post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_comment
-- ----------------------------
INSERT INTO `post_comment` VALUES ('21', '1');

-- ----------------------------
-- Table structure for post_user
-- ----------------------------
DROP TABLE IF EXISTS `post_user`;
CREATE TABLE `post_user` (
  `Post_id` bigint(20) NOT NULL,
  `joinedUsers_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_jvw3b46n61fi0vank4b7vbhgb` (`joinedUsers_id`),
  KEY `FK_3lurlvqgdba0qae6glsnuy6hn` (`Post_id`),
  CONSTRAINT `FK_3lurlvqgdba0qae6glsnuy6hn` FOREIGN KEY (`Post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `FK_jvw3b46n61fi0vank4b7vbhgb` FOREIGN KEY (`joinedUsers_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_user
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birthDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', null, '', 'baoxianjian@gmail.com', '', null, 'China', '$2a$10$qAfY1kHIMshx7it1kh6HouKueAK/4nl802BIUQ5Seo.SB1Rv2F8pK', null, 'ROLE_USER', 'baoxianjian@gmail.com');

-- ----------------------------
-- Table structure for user_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_comment`;
CREATE TABLE `user_comment` (
  `User_id` bigint(20) NOT NULL,
  `comments_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_ah9x95me6onvo198wl0s87lji` (`comments_id`),
  KEY `FK_irlvalt2dtjvuof5n6wxmif7f` (`User_id`),
  CONSTRAINT `FK_ah9x95me6onvo198wl0s87lji` FOREIGN KEY (`comments_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `FK_irlvalt2dtjvuof5n6wxmif7f` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_comment
-- ----------------------------

-- ----------------------------
-- Table structure for user_post
-- ----------------------------
DROP TABLE IF EXISTS `user_post`;
CREATE TABLE `user_post` (
  `User_id` bigint(20) NOT NULL,
  `posts_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_sh5m62anjiodj8l9whe7oofbo` (`posts_id`),
  KEY `FK_ai38i48bv26442edbq41snjnr` (`User_id`),
  CONSTRAINT `FK_ai38i48bv26442edbq41snjnr` FOREIGN KEY (`User_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_sh5m62anjiodj8l9whe7oofbo` FOREIGN KEY (`posts_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_post
-- ----------------------------
