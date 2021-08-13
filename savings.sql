/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL
 Source Server Type    : MySQL
 Source Server Version : 100419
 Source Host           : localhost:3306
 Source Schema         : savings

 Target Server Type    : MySQL
 Target Server Version : 100419
 File Encoding         : 65001

 Date: 13/08/2021 04:22:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for savingstable
-- ----------------------------
DROP TABLE IF EXISTS `savingstable`;
CREATE TABLE `savingstable`  (
  `custno` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `custname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cdep` double(10, 1) NULL DEFAULT NULL,
  `nyears` int(11) NULL DEFAULT NULL,
  `savtype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`custno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of savingstable
-- ----------------------------
INSERT INTO `savingstable` VALUES ('448895', 'Test 1', 5.0, 10, 'SAVINGS-REGULAR');
INSERT INTO `savingstable` VALUES ('448896', 'Test 2', 5.0, 9, 'SAVINGS-DELUXE');

SET FOREIGN_KEY_CHECKS = 1;
