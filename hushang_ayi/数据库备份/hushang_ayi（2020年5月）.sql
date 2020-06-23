/*
Navicat MySQL Data Transfer

Source Server         : kiwi
Source Server Version : 80020
Source Host           : localhost:3306
Source Database       : hushang_ayi

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2020-06-01 20:07:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gongzixinjin
-- ----------------------------
DROP TABLE IF EXISTS `gongzixinjin`;
CREATE TABLE `gongzixinjin` (
  `gongzixinjin_id` int NOT NULL AUTO_INCREMENT,
  `gongzixinjin_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gongzixinjin_money` double(50,2) NOT NULL,
  `gongzixinjin_remark` varchar(50) DEFAULT NULL,
  `gongzixinjin_time` bigint NOT NULL,
  PRIMARY KEY (`gongzixinjin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of gongzixinjin
-- ----------------------------
INSERT INTO `gongzixinjin` VALUES ('1', '员工车费', '900.00', null, '202004');
INSERT INTO `gongzixinjin` VALUES ('2', '小时工费', '260.00', null, '202005');

-- ----------------------------
-- Table structure for gudingzichan
-- ----------------------------
DROP TABLE IF EXISTS `gudingzichan`;
CREATE TABLE `gudingzichan` (
  `gudingzichan_id` int NOT NULL AUTO_INCREMENT,
  `gudingzichan_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gudingzichan_money` double(50,2) NOT NULL,
  PRIMARY KEY (`gudingzichan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of gudingzichan
-- ----------------------------
INSERT INTO `gudingzichan` VALUES ('1', '雪客台四家套', '7758.90');
INSERT INTO `gudingzichan` VALUES ('2', '制冰机', '11700.00');
INSERT INTO `gudingzichan` VALUES ('6', '开水机', '5520.00');
INSERT INTO `gudingzichan` VALUES ('7', '封口机，果糖机', '6280.00');
INSERT INTO `gudingzichan` VALUES ('8', '沙冰机', '1880.00');
INSERT INTO `gudingzichan` VALUES ('10', '挂式净水器', '3700.00');
INSERT INTO `gudingzichan` VALUES ('12', '金刚网（补了20差价）', '140.00');
INSERT INTO `gudingzichan` VALUES ('13', '锁', '40.00');
INSERT INTO `gudingzichan` VALUES ('15', '空调', '3800.00');
INSERT INTO `gudingzichan` VALUES ('16', '电视', '4200.00');
INSERT INTO `gudingzichan` VALUES ('17', '收银机、灭蝇灯、安利净水器', '16716.00');
INSERT INTO `gudingzichan` VALUES ('18', '凯美冰箱', '11950.00');
INSERT INTO `gudingzichan` VALUES ('19', '蒸汽机', '1700.00');
INSERT INTO `gudingzichan` VALUES ('20', '小家电', '1400.00');

-- ----------------------------
-- Table structure for shouru
-- ----------------------------
DROP TABLE IF EXISTS `shouru`;
CREATE TABLE `shouru` (
  `shouru_id` int NOT NULL AUTO_INCREMENT,
  `shouru_money` double(100,2) NOT NULL,
  `shouru_time` bigint NOT NULL,
  PRIMARY KEY (`shouru_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shouru
-- ----------------------------
INSERT INTO `shouru` VALUES ('1', '1728.00', '20200430');
INSERT INTO `shouru` VALUES ('2', '2981.00', '20200501');
INSERT INTO `shouru` VALUES ('3', '3351.00', '20200502');
INSERT INTO `shouru` VALUES ('4', '2465.00', '20200503');
INSERT INTO `shouru` VALUES ('5', '2168.00', '20200504');
INSERT INTO `shouru` VALUES ('6', '2301.00', '20200505');
INSERT INTO `shouru` VALUES ('7', '1588.50', '20200506');
INSERT INTO `shouru` VALUES ('8', '1595.50', '20200507');
INSERT INTO `shouru` VALUES ('9', '1168.00', '20200508');
INSERT INTO `shouru` VALUES ('10', '2053.00', '20200509');
INSERT INTO `shouru` VALUES ('11', '2526.00', '20200510');
INSERT INTO `shouru` VALUES ('12', '1631.00', '20200511');
INSERT INTO `shouru` VALUES ('13', '1640.00', '20200512');
INSERT INTO `shouru` VALUES ('14', '2096.50', '20200513');
INSERT INTO `shouru` VALUES ('15', '1477.00', '20200514');
INSERT INTO `shouru` VALUES ('16', '2231.00', '20200515');
INSERT INTO `shouru` VALUES ('17', '2438.00', '20200516');
INSERT INTO `shouru` VALUES ('18', '2366.10', '20200517');
INSERT INTO `shouru` VALUES ('19', '1569.00', '20200518');
INSERT INTO `shouru` VALUES ('20', '1113.00', '20200519');
INSERT INTO `shouru` VALUES ('21', '2222.00', '20200520');
INSERT INTO `shouru` VALUES ('22', '1441.50', '20200521');
INSERT INTO `shouru` VALUES ('23', '1522.50', '20200522');
INSERT INTO `shouru` VALUES ('24', '6247.50', '20200524');
INSERT INTO `shouru` VALUES ('25', '1781.50', '20200525');
INSERT INTO `shouru` VALUES ('26', '1434.00', '20200526');
INSERT INTO `shouru` VALUES ('27', '9128.00', '20200523');
INSERT INTO `shouru` VALUES ('28', '1807.00', '20200527');
INSERT INTO `shouru` VALUES ('29', '2258.00', '20200528');

-- ----------------------------
-- Table structure for touzi
-- ----------------------------
DROP TABLE IF EXISTS `touzi`;
CREATE TABLE `touzi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `touzi_type` varchar(255) NOT NULL,
  `touzi_name` varchar(255) DEFAULT NULL,
  `touzi_money` double(100,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of touzi
-- ----------------------------
INSERT INTO `touzi` VALUES ('1', '设备类', '卷闸门', '1800.00');
INSERT INTO `touzi` VALUES ('2', '设备类', '监控套装', '3800.00');
INSERT INTO `touzi` VALUES ('3', '设备类', '电视', '4200.00');
INSERT INTO `touzi` VALUES ('4', '设备类', '门头字', '3950.00');
INSERT INTO `touzi` VALUES ('5', '设备类', '煮字发光字', '1898.00');
INSERT INTO `touzi` VALUES ('6', '设备类', '电视机架', '350.00');
INSERT INTO `touzi` VALUES ('7', '设备类', '拖车', '269.00');
INSERT INTO `touzi` VALUES ('8', '设备类', '金刚网+锁', '180.00');
INSERT INTO `touzi` VALUES ('9', '设备类', '其他', '67069.00');
INSERT INTO `touzi` VALUES ('10', '租金类', '各项总和', '141880.00');
INSERT INTO `touzi` VALUES ('11', '其余投资', '烟', '1220.00');
INSERT INTO `touzi` VALUES ('12', '其余投资', '水、电、网', '7616.00');
INSERT INTO `touzi` VALUES ('13', '其余投资', '加盟费、管理费', '49200.00');
INSERT INTO `touzi` VALUES ('14', '其他投资', '首批物料', '49670.10');
INSERT INTO `touzi` VALUES ('15', '其他投资', '首批物料运费', '1032.00');
INSERT INTO `touzi` VALUES ('16', '总投资', '合计', '334134.10');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'daisy', '951105');

-- ----------------------------
-- Table structure for zhichu
-- ----------------------------
DROP TABLE IF EXISTS `zhichu`;
CREATE TABLE `zhichu` (
  `zhichu_id` int NOT NULL AUTO_INCREMENT,
  `zhichu_name` varchar(255) DEFAULT NULL,
  `zhichu_money` double(100,2) NOT NULL,
  `zhichu_time` bigint NOT NULL,
  PRIMARY KEY (`zhichu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zhichu
-- ----------------------------
INSERT INTO `zhichu` VALUES ('1', '日常支出', '1373.80', '20200429');
INSERT INTO `zhichu` VALUES ('2', '日常支出', '376.60', '20200430');
INSERT INTO `zhichu` VALUES ('3', '日常支出', '274.94', '20200501');
INSERT INTO `zhichu` VALUES ('4', '日常支出', '544.50', '20200502');
INSERT INTO `zhichu` VALUES ('5', '日常支出', '158.50', '20200503');
INSERT INTO `zhichu` VALUES ('6', '日常支出', '351.70', '20200504');
INSERT INTO `zhichu` VALUES ('7', '日常支出', '17.00', '20200505');
INSERT INTO `zhichu` VALUES ('8', '日常支出', '79.00', '20200506');
INSERT INTO `zhichu` VALUES ('9', '日常支出', '100.00', '20200507');
INSERT INTO `zhichu` VALUES ('10', '日常支出', '51.72', '20200508');
INSERT INTO `zhichu` VALUES ('11', '日常支出', '47.00', '20200509');
INSERT INTO `zhichu` VALUES ('12', '日常支出', '12.00', '20200510');
INSERT INTO `zhichu` VALUES ('13', '日常支出', '115.24', '20200511');
INSERT INTO `zhichu` VALUES ('14', '日常支出', '70.50', '20200512');
INSERT INTO `zhichu` VALUES ('15', '日常支出', '73.00', '20200513');
INSERT INTO `zhichu` VALUES ('16', '日常支出', '25.00', '20200514');
INSERT INTO `zhichu` VALUES ('17', '日常支出', '110.00', '20200515');
INSERT INTO `zhichu` VALUES ('18', '日常支出', '20.00', '20200516');
INSERT INTO `zhichu` VALUES ('19', '日常支出', '187.50', '20200517');
INSERT INTO `zhichu` VALUES ('20', '日常支出', '901.50', '20200518');
INSERT INTO `zhichu` VALUES ('21', '日常支出', '31.90', '20200519');
INSERT INTO `zhichu` VALUES ('22', '日常支出', '0.00', '20200520');
INSERT INTO `zhichu` VALUES ('23', '日常支出', '184.00', '20200521');
INSERT INTO `zhichu` VALUES ('24', '日常支出', '289.10', '20200522');
INSERT INTO `zhichu` VALUES ('25', '日常支出', '1138.20', '20200523');
INSERT INTO `zhichu` VALUES ('26', '日常支出', '23.00', '20200527');
INSERT INTO `zhichu` VALUES ('27', '原材料', '4323.60', '20200511');
INSERT INTO `zhichu` VALUES ('28', '订货一批（胶囊瓶等）', '3838.50', '20200519');
INSERT INTO `zhichu` VALUES ('29', '运费', '191.00', '20200519');
INSERT INTO `zhichu` VALUES ('30', '运费', '341.00', '20200522');
INSERT INTO `zhichu` VALUES ('31', '原材料', '3953.00', '20200528');
INSERT INTO `zhichu` VALUES ('32', '日常支出', '89.14', '20200528');
