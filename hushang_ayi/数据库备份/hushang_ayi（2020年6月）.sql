/*
Navicat MySQL Data Transfer

Source Server         : kiwi
Source Server Version : 80020
Source Host           : localhost:3306
Source Database       : hushang_ayi

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2020-07-01 18:52:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gongzi
-- ----------------------------
DROP TABLE IF EXISTS `gongzi`;
CREATE TABLE `gongzi` (
  `gongzi_id` int NOT NULL AUTO_INCREMENT,
  `gongzi_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gongzi_money` double(50,2) NOT NULL,
  `gongzi_remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gongzi_time` bigint NOT NULL,
  PRIMARY KEY (`gongzi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of gongzi
-- ----------------------------
INSERT INTO `gongzi` VALUES ('1', '员工车费', '900.00', null, '202004');
INSERT INTO `gongzi` VALUES ('2', '小时工费', '260.00', null, '202005');
INSERT INTO `gongzi` VALUES ('3', '工资（含加班）', '2200.00', '小夏', '202005');
INSERT INTO `gongzi` VALUES ('4', '工资（含加班，合肥培训，来回路费）', '2868.00', '车雨淋', '202005');
INSERT INTO `gongzi` VALUES ('5', '工资（含加班，奖励）', '2370.00', '小胡', '202005');
INSERT INTO `gongzi` VALUES ('6', '工资', '4000.00', '店长', '202005');
INSERT INTO `gongzi` VALUES ('7', '车费', '3000.00', null, '202005');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

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
INSERT INTO `shouru` VALUES ('30', '1762.00', '20200529');
INSERT INTO `shouru` VALUES ('31', '2811.50', '20200530');
INSERT INTO `shouru` VALUES ('32', '2961.00', '20200531');
INSERT INTO `shouru` VALUES ('33', '2432.00', '20200601');
INSERT INTO `shouru` VALUES ('34', '1879.00', '20200602');
INSERT INTO `shouru` VALUES ('35', '1445.00', '20200603');
INSERT INTO `shouru` VALUES ('36', '2057.00', '20200604');
INSERT INTO `shouru` VALUES ('37', '1225.50', '20200605');
INSERT INTO `shouru` VALUES ('38', '2837.50', '20200606');
INSERT INTO `shouru` VALUES ('39', '2502.50', '20200607');
INSERT INTO `shouru` VALUES ('40', '2005.50', '20200609');
INSERT INTO `shouru` VALUES ('41', '1466.00', '20200610');
INSERT INTO `shouru` VALUES ('42', '1718.50', '20200608');
INSERT INTO `shouru` VALUES ('43', '1596.00', '20200611');
INSERT INTO `shouru` VALUES ('44', '1410.00', '20200612');
INSERT INTO `shouru` VALUES ('45', '2342.50', '20200613');
INSERT INTO `shouru` VALUES ('46', '985.00', '20200616');
INSERT INTO `shouru` VALUES ('47', '2349.00', '20200614');
INSERT INTO `shouru` VALUES ('48', '932.50', '20200615');
INSERT INTO `shouru` VALUES ('49', '1765.50', '20200617');
INSERT INTO `shouru` VALUES ('50', '1749.64', '20200621');
INSERT INTO `shouru` VALUES ('51', '1931.00', '20200620');
INSERT INTO `shouru` VALUES ('52', '1147.00', '20200618');
INSERT INTO `shouru` VALUES ('53', '1378.50', '20200619');
INSERT INTO `shouru` VALUES ('54', '2946.50', '20200624');
INSERT INTO `shouru` VALUES ('55', '5155.81', '20200625');

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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

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
INSERT INTO `zhichu` VALUES ('33', '日常支出', '40.00', '20200529');
INSERT INTO `zhichu` VALUES ('34', '日常支出', '101.50', '20200530');
INSERT INTO `zhichu` VALUES ('35', '日常支出', '149.00', '20200531');
INSERT INTO `zhichu` VALUES ('36', '老七来回路费', '35.00', '20200601');
INSERT INTO `zhichu` VALUES ('37', '白糖', '315.00', '20200602');
INSERT INTO `zhichu` VALUES ('38', '小张水果', '19.00', '20200603');
INSERT INTO `zhichu` VALUES ('39', '养乐多', '60.00', '20200604');
INSERT INTO `zhichu` VALUES ('40', '没有支出', '0.00', '20200605');
INSERT INTO `zhichu` VALUES ('41', '养乐多', '36.00', '20200606');
INSERT INTO `zhichu` VALUES ('42', '超市', '60.00', '20200607');
INSERT INTO `zhichu` VALUES ('43', '没有支出', '0.00', '20200609');
INSERT INTO `zhichu` VALUES ('44', '没有支出', '0.00', '20200610');
INSERT INTO `zhichu` VALUES ('45', '无支出', '0.00', '20200608');
INSERT INTO `zhichu` VALUES ('46', '补记支出', '500.00', '20200523');
INSERT INTO `zhichu` VALUES ('47', '小张水果', '8.00', '20200613');
INSERT INTO `zhichu` VALUES ('48', '小何水果', '12.00', '20200614');
INSERT INTO `zhichu` VALUES ('49', '小何水果', '8.00', '20200616');
INSERT INTO `zhichu` VALUES ('50', '草莓回归-a4立牌打印', '3.00', '20200426');
INSERT INTO `zhichu` VALUES ('51', '扫码免排队-a4立牌打印', '3.00', '20200429');
INSERT INTO `zhichu` VALUES ('52', '葡萄出道-a4立牌打印', '3.00', '20200517');
INSERT INTO `zhichu` VALUES ('53', '丹阳店扫码免排队-写真美工板', '24.00', '20200520');
INSERT INTO `zhichu` VALUES ('54', '展架', '30.00', '20200521');
INSERT INTO `zhichu` VALUES ('55', '打印优惠券', '160.00', '20200521');
INSERT INTO `zhichu` VALUES ('56', '芒果西柚桃子茶饮-a4立牌打印', '9.00', '20200522');
INSERT INTO `zhichu` VALUES ('57', '10元优惠券', '90.00', '20200522');
INSERT INTO `zhichu` VALUES ('58', '招聘-写真', '24.00', '20200527');
INSERT INTO `zhichu` VALUES ('59', '草莓养乐多-a4立牌打印', '3.00', '20200528');
INSERT INTO `zhichu` VALUES ('60', '满14元减2-4元，a4立牌打印', '3.00', '20200601');
INSERT INTO `zhichu` VALUES ('61', '满14元减2-4元，a4立牌打印', '3.00', '20200602');
INSERT INTO `zhichu` VALUES ('62', '买橙子', '15.00', '20200621');
INSERT INTO `zhichu` VALUES ('63', '羊雨佳兼职', '15.00', '20200601');
INSERT INTO `zhichu` VALUES ('64', '买水果', '16.00', '20200601');
INSERT INTO `zhichu` VALUES ('65', '珍珠', '356.00', '20200602');
INSERT INTO `zhichu` VALUES ('66', '白砂糖', '4.50', '20200602');
INSERT INTO `zhichu` VALUES ('67', '小青柠', '55.00', '20200602');
INSERT INTO `zhichu` VALUES ('68', '运费', '120.00', '20200603');
INSERT INTO `zhichu` VALUES ('69', '快递费', '8.00', '20200604');
INSERT INTO `zhichu` VALUES ('70', '不锈钢货架', '650.00', '20200604');
INSERT INTO `zhichu` VALUES ('71', '微波炉', '269.00', '20200604');
INSERT INTO `zhichu` VALUES ('72', '储物架', '217.95', '20200604');
INSERT INTO `zhichu` VALUES ('73', '业绩奖励', '15.00', '20200604');
INSERT INTO `zhichu` VALUES ('74', '订书机', '5.50', '20200606');
INSERT INTO `zhichu` VALUES ('75', '小张水果', '7.00', '20200607');
INSERT INTO `zhichu` VALUES ('76', '一箱抽纸', '20.00', '20200611');
INSERT INTO `zhichu` VALUES ('77', '冷链费用', '30.00', '20200611');
INSERT INTO `zhichu` VALUES ('78', '无支出', '0.00', '20200612');
INSERT INTO `zhichu` VALUES ('79', '无支出', '0.00', '20200615');
INSERT INTO `zhichu` VALUES ('80', '小张水果', '8.00', '20200616');
INSERT INTO `zhichu` VALUES ('81', '店长合肥路费', '161.00', '20200616');
INSERT INTO `zhichu` VALUES ('82', '铁钥匙', '5.47', '20200616');
INSERT INTO `zhichu` VALUES ('83', '除蚂蚁药', '15.90', '20200616');
INSERT INTO `zhichu` VALUES ('84', '防老鼠', '299.36', '20200616');
INSERT INTO `zhichu` VALUES ('85', '无支出', '0.00', '20200617');
INSERT INTO `zhichu` VALUES ('86', '养乐多', '48.00', '20200620');
INSERT INTO `zhichu` VALUES ('87', '订书机', '15.00', '20200620');
INSERT INTO `zhichu` VALUES ('88', '透明胶带台，透明胶带', '13.40', '20200620');
INSERT INTO `zhichu` VALUES ('89', '养乐多', '72.00', '20200622');
INSERT INTO `zhichu` VALUES ('90', '小张水果', '8.00', '20200622');
INSERT INTO `zhichu` VALUES ('91', '新品竞赛排名，红包奖励', '20.00', '20200622');
