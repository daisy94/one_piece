/*
Navicat MySQL Data Transfer

Source Server         : 47.100.176.61
Source Server Version : 50649
Source Host           : 47.100.176.61:3306
Source Database       : one_piece

Target Server Type    : MYSQL
Target Server Version : 50649
File Encoding         : 65001

Date: 2021-01-15 13:56:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gongzi
-- ----------------------------
DROP TABLE IF EXISTS `gongzi`;
CREATE TABLE `gongzi` (
  `gongzi_id` int(11) NOT NULL AUTO_INCREMENT,
  `gongzi_name` varchar(50) NOT NULL,
  `gongzi_remark` varchar(50) DEFAULT NULL,
  `gongzi_money` double(50,2) NOT NULL,
  `gongzi_time` bigint(20) NOT NULL,
  PRIMARY KEY (`gongzi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gongzi
-- ----------------------------
INSERT INTO `gongzi` VALUES ('1', '员工车费', '其他', '900.00', '202004');
INSERT INTO `gongzi` VALUES ('2', '小时工费', '其他', '260.00', '202005');
INSERT INTO `gongzi` VALUES ('3', '工资（含加班）', '小夏', '2200.00', '202005');
INSERT INTO `gongzi` VALUES ('4', '工资（含加班，合肥培训，来回路费）', '车雨淋', '2868.00', '202005');
INSERT INTO `gongzi` VALUES ('5', '工资（含加班，奖励）', '小胡', '2370.00', '202005');
INSERT INTO `gongzi` VALUES ('6', '工资', '店长', '4000.00', '202005');
INSERT INTO `gongzi` VALUES ('7', '车费', '其他', '3000.00', '202005');
INSERT INTO `gongzi` VALUES ('8', '工资', '车雨淋', '3662.00', '202006');
INSERT INTO `gongzi` VALUES ('9', '工资', '胡亚琴', '3480.00', '202006');
INSERT INTO `gongzi` VALUES ('10', '工资', '吴会会', '2165.00', '202006');
INSERT INTO `gongzi` VALUES ('11', '工资', '店长', '4000.00', '202006');
INSERT INTO `gongzi` VALUES ('12', '车费', '其他', '3000.00', '202006');

-- ----------------------------
-- Table structure for gudingzichan
-- ----------------------------
DROP TABLE IF EXISTS `gudingzichan`;
CREATE TABLE `gudingzichan` (
  `gudingzichan_id` int(11) NOT NULL AUTO_INCREMENT,
  `gudingzichan_name` varchar(50) NOT NULL,
  `gudingzichan_money` double(50,2) NOT NULL,
  PRIMARY KEY (`gudingzichan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

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
-- Table structure for menstruation_cycle
-- ----------------------------
DROP TABLE IF EXISTS `menstruation_cycle`;
CREATE TABLE `menstruation_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识，主键自增长',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `update_time` varchar(255) DEFAULT NULL COMMENT '更新时间',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menstruation_cycle
-- ----------------------------
INSERT INTO `menstruation_cycle` VALUES ('14', '20160308', '20160313', '20200727153731', '0');
INSERT INTO `menstruation_cycle` VALUES ('15', '20160410', '20160414', '20200727153800', '0');
INSERT INTO `menstruation_cycle` VALUES ('16', '20160515', '20160520', '20200727153816', '0');
INSERT INTO `menstruation_cycle` VALUES ('17', '20160622', '20160628', '20200727153828', '0');
INSERT INTO `menstruation_cycle` VALUES ('18', '20160806', '20160812', '20200727153845', '0');
INSERT INTO `menstruation_cycle` VALUES ('19', '20161001', '20161007', '20200727153857', '0');
INSERT INTO `menstruation_cycle` VALUES ('20', '20161104', '20161110', '20200727154034', '0');
INSERT INTO `menstruation_cycle` VALUES ('21', '20161228', '20170103', '20200727154054', '0');
INSERT INTO `menstruation_cycle` VALUES ('22', '20170316', '20170323', '20200727154113', '0');
INSERT INTO `menstruation_cycle` VALUES ('23', '20170207', '20170213', '20200727154151', '0');
INSERT INTO `menstruation_cycle` VALUES ('24', '20170422', '20170428', '20200727154252', '0');
INSERT INTO `menstruation_cycle` VALUES ('25', '20170525', '20170531', '20200727154308', '0');
INSERT INTO `menstruation_cycle` VALUES ('26', '20170709', '20170715', '20200727154330', '0');
INSERT INTO `menstruation_cycle` VALUES ('27', '20170827', '20170902', '20200727154343', '0');
INSERT INTO `menstruation_cycle` VALUES ('28', '20171006', '20171013', '20200727154402', '0');
INSERT INTO `menstruation_cycle` VALUES ('29', '20171118', '20171124', '20200727154418', '0');
INSERT INTO `menstruation_cycle` VALUES ('30', '20180109', '20180115', '20200727154510', '0');
INSERT INTO `menstruation_cycle` VALUES ('31', '20180207', '20180213', '20200727154526', '0');
INSERT INTO `menstruation_cycle` VALUES ('32', '20180309', '20180315', '20200727154607', '0');
INSERT INTO `menstruation_cycle` VALUES ('33', '20180417', '20180423', '20200727154620', '0');
INSERT INTO `menstruation_cycle` VALUES ('34', '20180521', '20180527', '20200727154632', '0');
INSERT INTO `menstruation_cycle` VALUES ('35', '20180625', '20180701', '20200727154646', '0');
INSERT INTO `menstruation_cycle` VALUES ('36', '20180802', '20180809', '20200727154658', '0');
INSERT INTO `menstruation_cycle` VALUES ('37', '20180911', '20180917', '20200727154710', '0');
INSERT INTO `menstruation_cycle` VALUES ('38', '20181013', '20181020', '20200727154722', '0');
INSERT INTO `menstruation_cycle` VALUES ('39', '20181124', '20181201', '20200727154737', '0');
INSERT INTO `menstruation_cycle` VALUES ('40', '20181230', '20190105', '20200727154756', '0');
INSERT INTO `menstruation_cycle` VALUES ('41', '20190202', '20190208', '20200727154823', '0');
INSERT INTO `menstruation_cycle` VALUES ('42', '20190311', '20190318', '20200727154835', '0');
INSERT INTO `menstruation_cycle` VALUES ('43', '20190428', '20190505', '20200727154848', '0');
INSERT INTO `menstruation_cycle` VALUES ('44', '20190610', '20190616', '20200727154858', '0');
INSERT INTO `menstruation_cycle` VALUES ('45', '20190718', '20190724', '20200727154915', '0');
INSERT INTO `menstruation_cycle` VALUES ('46', '20190824', '20190830', '20200727154925', '0');
INSERT INTO `menstruation_cycle` VALUES ('47', '20190929', '20191005', '20200727154935', '0');
INSERT INTO `menstruation_cycle` VALUES ('48', '20191030', '20191124', '20200727154956', '0');
INSERT INTO `menstruation_cycle` VALUES ('49', '20191218', '20191225', '20200727155023', '0');
INSERT INTO `menstruation_cycle` VALUES ('50', '20200112', '20200119', '20200727155038', '0');
INSERT INTO `menstruation_cycle` VALUES ('51', '20200221', '20200228', '20200727155049', '0');
INSERT INTO `menstruation_cycle` VALUES ('52', '20200409', '20200415', '20200727155103', '0');
INSERT INTO `menstruation_cycle` VALUES ('53', '20200518', '20200525', '20200727155115', '0');
INSERT INTO `menstruation_cycle` VALUES ('54', '20200717', '20200724', '20200727155137', '0');
INSERT INTO `menstruation_cycle` VALUES ('55', '20200820', '20200826', '20200827164914', '0');
INSERT INTO `menstruation_cycle` VALUES ('56', '20201001', '20201007', '20201013155100', '0');
INSERT INTO `menstruation_cycle` VALUES ('57', '20201104', '20201110', '20201118144610', '0');

-- ----------------------------
-- Table structure for one_piece
-- ----------------------------
DROP TABLE IF EXISTS `one_piece`;
CREATE TABLE `one_piece` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '顾客微信名',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `profit` int(11) DEFAULT NULL COMMENT '净利润',
  `date` int(11) DEFAULT NULL COMMENT '购买的日期',
  `is_deliver` int(11) NOT NULL DEFAULT '0' COMMENT '是否已发货（0：未发；1：已发）',
  `update_time` varchar(255) DEFAULT NULL COMMENT '信息更新的时间',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`),
  KEY `index_one_piece_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of one_piece
-- ----------------------------
INSERT INTO `one_piece` VALUES ('1', '许琛', '美瞳', '112', '20200713', '1', '20200731170828', '0');
INSERT INTO `one_piece` VALUES ('2', '冯安琪', '海蓝之谜绿眼霜', '125', '20200713', '1', '20200731170828', '0');
INSERT INTO `one_piece` VALUES ('3', '翟伟健', 'SK2套装', '100', '20200710', '1', '20200802144327', '0');
INSERT INTO `one_piece` VALUES ('4', '丹丹', '美瞳', '87', '20200714', '1', '20200731170829', '0');
INSERT INTO `one_piece` VALUES ('5', '宝藏女孩', 'Mac口红', '23', '20200715', '1', '20200731170830', '0');
INSERT INTO `one_piece` VALUES ('6', '值得所有美好', '椰子鞋子', '50', '20200711', '1', '20200731170826', '0');
INSERT INTO `one_piece` VALUES ('7', 'Reset', 'N4面霜', '45', '20200710', '1', '20200731170822', '0');
INSERT INTO `one_piece` VALUES ('8', '阿潘达', '碧欧泉套盒，Nars腮红', '77', '20200711', '1', '20200731170826', '0');
INSERT INTO `one_piece` VALUES ('9', '我这个暴脾气', '蓝色药丸面膜2盒', '42', '20200709', '1', '20201015100106', '0');
INSERT INTO `one_piece` VALUES ('10', '张帆', '美瞳', '75', '20200716', '1', '20200731170830', '0');
INSERT INTO `one_piece` VALUES ('11', 'spring', '雅诗兰黛小棕瓶眼霜，疤克', '110', '20200717', '1', '20200731170833', '0');
INSERT INTO `one_piece` VALUES ('12', '孙航', 'AJ鞋子', '30', '20200717', '1', '20200731170833', '0');
INSERT INTO `one_piece` VALUES ('13', '陈沁夷', 'SK2神仙水，蓝色药丸面膜', '120', '20200717', '1', '20200731170834', '0');
INSERT INTO `one_piece` VALUES ('14', '刘念', '雅诗兰黛小棕瓶精华100ml', '80', '20200717', '1', '20200731170837', '0');
INSERT INTO `one_piece` VALUES ('15', 'la belle', '椰子鞋', '50', '20200717', '1', '20200731170839', '0');
INSERT INTO `one_piece` VALUES ('16', '九亿梦的少女', 'MLB小标', '30', '20200718', '1', '20200731170840', '0');
INSERT INTO `one_piece` VALUES ('17', '向日葵', '太多了，不记了', '310', '20200719', '1', '20200731170840', '0');
INSERT INTO `one_piece` VALUES ('18', '保妹', '娇兰复原蜜，科颜氏面霜', '190', '20200719', '1', '20200731170905', '0');
INSERT INTO `one_piece` VALUES ('19', 'Sunshine', '小黑瓶中样，420中样', '60', '20200719', '1', '20200731170914', '0');
INSERT INTO `one_piece` VALUES ('20', 'Wsxny', '雅诗兰黛420中样', '20', '20200719', '1', '20200731170918', '0');
INSERT INTO `one_piece` VALUES ('21', '付薇', '雅诗兰黛420中样', '20', '20200719', '1', '20200731170921', '0');
INSERT INTO `one_piece` VALUES ('22', '美女小战士', '希思黎乳液，娇韵诗水，YSL粉底液', '195', '20200719', '1', '20200731170925', '0');
INSERT INTO `one_piece` VALUES ('23', '小雨滴', '兰蔻粉水', '30', '20200719', '1', '20200731170928', '0');
INSERT INTO `one_piece` VALUES ('24', 'Vitana', 'Mac定妆喷雾', '40', '20200719', '1', '20200731170929', '0');
INSERT INTO `one_piece` VALUES ('25', '不二', '植村秀眉笔', '30', '20200719', '1', '20200731170930', '0');
INSERT INTO `one_piece` VALUES ('26', '周勤勤', '安耐晒60ml', '35', '20200709', '1', '20200731170818', '0');
INSERT INTO `one_piece` VALUES ('27', '欢喜', '白金粉底液，资生堂蜜露', '110', '20200708', '1', '20200731170809', '0');
INSERT INTO `one_piece` VALUES ('28', '岳奕伶', '天气丹套盒，美瞳', '297', '20200701', '1', '20200904104005', '0');
INSERT INTO `one_piece` VALUES ('29', '岳奕伶', 'SK2清莹露', '80', '20200708', '1', '20200731170809', '0');
INSERT INTO `one_piece` VALUES ('30', '王小环', 'Nars腮红', '30', '20200708', '1', '20200731170811', '0');
INSERT INTO `one_piece` VALUES ('31', '王慧慧', '植村秀唇釉中样', '15', '20200708', '1', '20200731170813', '0');
INSERT INTO `one_piece` VALUES ('32', '殷杰', '植村秀唇釉中样', '15', '20200708', '1', '20200731170815', '0');
INSERT INTO `one_piece` VALUES ('33', '晓航', '迪奥老花气垫，娇兰双效精华', '142', '20200701', '1', '20200731170335', '0');
INSERT INTO `one_piece` VALUES ('34', '夏景', '植村秀唇釉中样', '15', '20200709', '1', '20200731170818', '0');
INSERT INTO `one_piece` VALUES ('35', '千与', '一些洗面奶什么的', '115', '20200702', '1', '20200731170336', '0');
INSERT INTO `one_piece` VALUES ('36', '锐锐', '兰蔻面霜中样', '30', '20200703', '1', '20200731170337', '0');
INSERT INTO `one_piece` VALUES ('37', '暗里着迷', '兰蔻面霜中样', '30', '20200703', '1', '20200731170802', '0');
INSERT INTO `one_piece` VALUES ('38', '陶玉', '兰蔻小黑瓶眼霜', '57', '20200703', '1', '20200731170803', '0');
INSERT INTO `one_piece` VALUES ('39', '伶', '雅诗兰黛洗面奶', '30', '20200703', '1', '20200731170803', '0');
INSERT INTO `one_piece` VALUES ('40', '小雨滴', '蓝色药丸面膜，后洗面奶', '110', '20200707', '1', '20200731170806', '0');
INSERT INTO `one_piece` VALUES ('41', '樱', '美瞳', '60', '20200709', '1', '20200731170819', '0');
INSERT INTO `one_piece` VALUES ('42', 'Chris', '悦薇眼霜，悦薇眼膜', '50', '20200710', '1', '20200731170825', '0');
INSERT INTO `one_piece` VALUES ('43', '马薇', '娇韵诗身体磨砂', '20', '20200703', '1', '20200731170805', '0');
INSERT INTO `one_piece` VALUES ('44', '夏', '防晒衣', '27', '20200708', '1', '20200731170816', '0');
INSERT INTO `one_piece` VALUES ('45', '小舅妈', '雅诗兰黛的一些东西', '130', '20200703', '1', '20200731170805', '0');
INSERT INTO `one_piece` VALUES ('46', '我只喝可乐', '椰子鞋', '50', '20200720', '1', '20200731170930', '0');
INSERT INTO `one_piece` VALUES ('47', '杨青青', 'GM墨镜，雅诗兰黛420中样', '140', '20200720', '1', '20200809092350', '0');
INSERT INTO `one_piece` VALUES ('48', '小希希', '美瞳', '25', '20200721', '1', '20200731170934', '0');
INSERT INTO `one_piece` VALUES ('49', '九九', '丽得姿面膜', '32', '20200722', '1', '20200802142154', '0');
INSERT INTO `one_piece` VALUES ('50', '樱', '美瞳', '64', '20200722', '1', '20200731170936', '0');
INSERT INTO `one_piece` VALUES ('51', '宁琥珀', '美瞳', '32', '20200722', '1', '20200731170936', '0');
INSERT INTO `one_piece` VALUES ('52', 'W', '雅诗兰黛小棕瓶精华100ml', '270', '20200723', '1', '20200731170939', '0');
INSERT INTO `one_piece` VALUES ('53', '美女小战士', '海蓝之谜精粹水，娇兰复复原蜜', '204', '20200723', '1', '20200827113852', '0');
INSERT INTO `one_piece` VALUES ('54', 'W', 'SPA蛇毒眼膜', '67', '20200724', '1', '20200802142157', '0');
INSERT INTO `one_piece` VALUES ('55', '不长豆的小瘦子', 'EVE LOM卸妆膏', '59', '20200724', '1', '20200802142158', '0');
INSERT INTO `one_piece` VALUES ('56', '眠', '美瞳', '60', '20200724', '1', '20200731170948', '0');
INSERT INTO `one_piece` VALUES ('57', '美女小战士', '敷尔佳黑膜2盒', '50', '20200725', '1', '20200827113853', '0');
INSERT INTO `one_piece` VALUES ('58', '崔曦文', '春雨茄子面膜', '16', '20200726', '1', '20200731170955', '0');
INSERT INTO `one_piece` VALUES ('59', '王文贺', '雅诗兰黛小棕瓶精华100ml，悦木之源菌菇水', '160', '20200726', '1', '20200731170959', '0');
INSERT INTO `one_piece` VALUES ('60', '麻麻', 'JM面膜', '48', '20200726', '1', '20200731171001', '0');
INSERT INTO `one_piece` VALUES ('61', '范静', '兰蔻防晒霜，黛珂AQ洗面奶', '65', '20200726', '1', '20200731171004', '0');
INSERT INTO `one_piece` VALUES ('62', '罗婷婷', '黑魔法洗脸巾', '5', '20200727', '1', '20200731171005', '0');
INSERT INTO `one_piece` VALUES ('63', '罗彦婷', 'YSL逆龄粉底液', '80', '20200728', '1', '20200802142205', '0');
INSERT INTO `one_piece` VALUES ('64', '小饭', '黛珂紫苏水，黛珂牛油果乳液', '50', '20200728', '1', '20200731171009', '0');
INSERT INTO `one_piece` VALUES ('65', '程磊', '芭比布朗虫草粉底液', '48', '20200728', '1', '20200802141706', '0');
INSERT INTO `one_piece` VALUES ('66', '金行', '兰蔻小黑瓶精华100ml', '110', '20200729', '1', '20200802142208', '0');
INSERT INTO `one_piece` VALUES ('67', '晓晓', '鲸鱼面膜2盒，美妆刷，美妆蛋', '73', '20200729', '1', '20200802143706', '0');
INSERT INTO `one_piece` VALUES ('68', 'Star', '黛珂小紫瓶精华60ml', '70', '20200730', '1', '20200806123749', '0');
INSERT INTO `one_piece` VALUES ('69', '李思进', '美妆刷1套，Mac生姜高光，NYX眼影盘', '130', '20200730', '1', '20200802143700', '0');
INSERT INTO `one_piece` VALUES ('70', 'CC', '雪花秀滋阴套盒，资生堂红腰子精华100ml，芙丽芳丝洗面奶', '155', '20200730', '1', '20200802144346', '0');
INSERT INTO `one_piece` VALUES ('71', '婷姐', '美妆蛋', '12', '20200729', '1', '20200802142127', '0');
INSERT INTO `one_piece` VALUES ('72', '小雨滴', '蓝色药丸面膜2盒', '40', '20200730', '1', '20200802142139', '0');
INSERT INTO `one_piece` VALUES ('73', '东周量贩', '美妆刷，美妆蛋2套', '44', '20200730', '1', '20200802144413', '0');
INSERT INTO `one_piece` VALUES ('74', '保妹', '娇兰黄金双效精华', '115', '20200730', '1', '20200805121718', '0');
INSERT INTO `one_piece` VALUES ('75', 'MC Robers小旦旦', '欧莱雅小黑瓶精华，兰芝紫色隔离', '70', '20200731', '1', '20200806123940', '0');
INSERT INTO `one_piece` VALUES ('76', '阿楠楠', '欧莱雅小黑瓶精华，敷尔佳黑膜', '60', '20200731', '1', '20200806124103', '0');
INSERT INTO `one_piece` VALUES ('77', 'MC Robers小旦旦', 'Mac眼影omega', '30', '20200801', '1', '20200826111628', '0');
INSERT INTO `one_piece` VALUES ('78', '向日葵', 'TF眼影盘26#，美妆刷，美妆蛋', '100', '20200801', '1', '20200808131227', '0');
INSERT INTO `one_piece` VALUES ('79', '北北', 'fila老爹鞋', '40', '20200801', '0', '20200801200141', '1');
INSERT INTO `one_piece` VALUES ('80', '玩具熊', 'fila黑色猫爪鞋', '40', '20200801', '1', '20200805223303', '0');
INSERT INTO `one_piece` VALUES ('81', '向日葵', '敷尔佳白膜', '20', '20200802', '1', '20200808131232', '0');
INSERT INTO `one_piece` VALUES ('82', '七七', '娇韵诗身体乳中样', '40', '20200801', '1', '20200806124303', '0');
INSERT INTO `one_piece` VALUES ('83', 'TK最乖了', '黑色鱼刺鞋', '40', '20200802', '1', '20200803150557', '0');
INSERT INTO `one_piece` VALUES ('84', 'Momo', '科颜氏淡斑精华100ml', '45', '20200802', '1', '20200805121443', '0');
INSERT INTO `one_piece` VALUES ('85', '程水玲', '雅诗兰黛小棕瓶精华100ml，YSL逆龄粉底液B10#，爱敬全能气垫21#2个', '280', '20200803', '1', '20200805121723', '0');
INSERT INTO `one_piece` VALUES ('86', '忘', '芙丽芳丝洗面奶', '20', '20200803', '1', '20200811112241', '0');
INSERT INTO `one_piece` VALUES ('87', '忘', 'Unny卸妆水', '30', '20200804', '1', '20200811112242', '0');
INSERT INTO `one_piece` VALUES ('88', '小舅妈', '迪奥变色唇膏橙色', '45', '20200804', '1', '20200811112916', '0');
INSERT INTO `one_piece` VALUES ('89', '王大陆', 'fresh黑茶套盒', '50', '20200804', '1', '20200811112911', '0');
INSERT INTO `one_piece` VALUES ('90', '万能的小包包', '碧欧泉水动力套盒', '135', '20200805', '1', '20200811112117', '0');
INSERT INTO `one_piece` VALUES ('91', 'HX', 'SKG颈椎仪', '20', '20200805', '1', '20200806142504', '0');
INSERT INTO `one_piece` VALUES ('92', '陈慧媛', '敷尔佳积雪草1盒，虾青素4盒', '90', '20200805', '1', '20200811112549', '0');
INSERT INTO `one_piece` VALUES ('93', '罗丹洁', '美瞳普通材质225、250度', '58', '20200805', '1', '20200818135650', '0');
INSERT INTO `one_piece` VALUES ('94', '刘莎', 'fila鞋子', '55', '20200805', '1', '20200806174039', '0');
INSERT INTO `one_piece` VALUES ('95', '庞丹', 'fila鞋子', '40', '20200806', '1', '20200806174110', '0');
INSERT INTO `one_piece` VALUES ('96', 'Chris', 'CNP鼻贴', '40', '20200807', '1', '20200808131238', '0');
INSERT INTO `one_piece` VALUES ('97', '考拉', '小CK包包', '60', '20200807', '1', '20200807232321', '0');
INSERT INTO `one_piece` VALUES ('98', '晓航', 'CPB套盒', '247', '20200807', '1', '20200811112119', '0');
INSERT INTO `one_piece` VALUES ('99', '王乐佳', '雪花秀气垫中样2个', '29', '20200807', '1', '20200815140624', '0');
INSERT INTO `one_piece` VALUES ('100', 'Narcissus', '雪花秀气垫中样，敷尔佳积雪草面膜', '25', '20200807', '1', '20200815140625', '0');
INSERT INTO `one_piece` VALUES ('101', '奶瓶', 'FILA黑色猫爪鞋', '40', '20200807', '1', '20200807232322', '0');
INSERT INTO `one_piece` VALUES ('102', '纳米', '雅诗兰黛小棕瓶眼霜2个', '80', '20200808', '1', '20200815140631', '0');
INSERT INTO `one_piece` VALUES ('103', 'HAHA', '宝格丽大吉岭茶100ml', '58', '20200808', '1', '20200815111827', '0');
INSERT INTO `one_piece` VALUES ('104', 'Chris', '兰蔻口红宝石02#', '33', '20200807', '1', '20200815111200', '0');
INSERT INTO `one_piece` VALUES ('105', '朱大宝', 'FILA猫爪鞋', '40', '20200808', '1', '20200808225458', '0');
INSERT INTO `one_piece` VALUES ('106', '程小妹', 'FILA满天星', '40', '20200808', '1', '20200808230419', '0');
INSERT INTO `one_piece` VALUES ('107', '陶玲', '阿迪达斯老爹鞋', '40', '20200808', '1', '20200808230419', '0');
INSERT INTO `one_piece` VALUES ('108', 'Reset', '欧莱雅小黑瓶精华', '30', '20200808', '1', '20200809092345', '0');
INSERT INTO `one_piece` VALUES ('109', 'Reset', '雅漾大喷，兰蔻口红宝石02#', '57', '20200808', '1', '20200815111924', '0');
INSERT INTO `one_piece` VALUES ('110', '晓晓', '兰蔻口红宝石02#', '33', '20200808', '1', '20200815111258', '0');
INSERT INTO `one_piece` VALUES ('111', '迪', '兰蔻口红宝石02#', '33', '20200808', '1', '20200815111329', '0');
INSERT INTO `one_piece` VALUES ('112', '欢喜', '兰蔻口红宝石02#', '33', '20200808', '1', '20200815111412', '0');
INSERT INTO `one_piece` VALUES ('113', '那些年，那些事', '雅诗兰黛沁水粉底液2W0', '68', '20200808', '1', '20200812104532', '0');
INSERT INTO `one_piece` VALUES ('114', '睿', '珂润面霜', '22', '20200809', '1', '20200815111714', '0');
INSERT INTO `one_piece` VALUES ('115', '句号', 'DM背背佳', '19', '20200811', '1', '20200811183613', '0');
INSERT INTO `one_piece` VALUES ('116', '晓明大人', '美瞳普通材质425、475度，美瞳硅水凝胶425、475度', '131', '20200810', '1', '20200823133419', '0');
INSERT INTO `one_piece` VALUES ('117', '陆瑞', 'GUCCI香水套盒', '27', '20200805', '1', '20200811193920', '0');
INSERT INTO `one_piece` VALUES ('118', 'PoPoY', '阿迪达斯鞋', '40', '20200811', '1', '20200811191912', '0');
INSERT INTO `one_piece` VALUES ('119', '李方选', 'DM背背佳', '19', '20200811', '1', '20200811193244', '0');
INSERT INTO `one_piece` VALUES ('120', '张倩倩', 'JM蜂蜜面膜4盒，珂润面霜', '59', '20200811', '1', '20200818135652', '0');
INSERT INTO `one_piece` VALUES ('121', '小雨滴', 'DM背背佳', '19', '20200811', '1', '20200811222502', '0');
INSERT INTO `one_piece` VALUES ('122', '九亿梦的少女', 'DM背背佳', '19', '20200811', '1', '20200811222503', '0');
INSERT INTO `one_piece` VALUES ('123', '九亿梦的少女', '阿迪达斯厚底金标鞋', '40', '20200811', '1', '20200811222505', '0');
INSERT INTO `one_piece` VALUES ('124', '龙怡瑛', '阿迪达斯鞋', '40', '20200811', '1', '20200811222506', '0');
INSERT INTO `one_piece` VALUES ('125', '张倩倩', 'FILA鞋', '40', '20200811', '1', '20200811222506', '0');
INSERT INTO `one_piece` VALUES ('126', '阿楠楠', 'DM背背佳3个', '33', '20200812', '1', '20200812112447', '0');
INSERT INTO `one_piece` VALUES ('127', '沈花花', 'DM背背佳', '19', '20200812', '1', '20200812102257', '0');
INSERT INTO `one_piece` VALUES ('128', '意中人', 'DM背背佳，FILA双肩包', '59', '20200812', '1', '20200812112537', '0');
INSERT INTO `one_piece` VALUES ('129', '玖玖', '阿迪达斯厚底鞋', '40', '20200812', '1', '20200812120516', '0');
INSERT INTO `one_piece` VALUES ('130', '丫丫', 'DM背背佳', '19', '20200812', '1', '20200812135526', '0');
INSERT INTO `one_piece` VALUES ('131', '纳米', 'DM背背佳', '19', '20200812', '1', '20200812135653', '0');
INSERT INTO `one_piece` VALUES ('132', '郑荟伶', 'Coca-Cola短袖', '30', '20200812', '1', '20200827113730', '0');
INSERT INTO `one_piece` VALUES ('133', '晓航', 'Lee短袖3件', '90', '20200812', '1', '20200812162236', '0');
INSERT INTO `one_piece` VALUES ('134', '李彤彤', 'DM背背佳', '19', '20200813', '1', '20200813142904', '0');
INSERT INTO `one_piece` VALUES ('135', '张婷', '娇韵诗焕颜紧致套盒，娇韵诗双萃精华，兰蔻小黑瓶眼霜', '305', '20200813', '1', '20200813143431', '0');
INSERT INTO `one_piece` VALUES ('136', '王心睿', 'SK2洗面奶', '10', '20200813', '1', '20200813143822', '0');
INSERT INTO `one_piece` VALUES ('137', '宋婧雯', '五道杠短袖2件', '12', '20200813', '1', '20200827113730', '0');
INSERT INTO `one_piece` VALUES ('138', '罗彦婷', '雅诗兰黛沁水粉底液1C0', '77', '20200815', '1', '20200823133422', '0');
INSERT INTO `one_piece` VALUES ('139', '牛奶不甜', '安耐晒防晒霜60ml 2个', '80', '20200816', '1', '20200823133451', '0');
INSERT INTO `one_piece` VALUES ('140', '陈慧媛', '黛珂牛油果乳液150ml', '50', '20200816', '1', '20200823133542', '0');
INSERT INTO `one_piece` VALUES ('141', '王蓉', '雅诗兰黛沁水粉底液1C0', '77', '20200816', '1', '20200823133627', '0');
INSERT INTO `one_piece` VALUES ('142', '周莹', '娇兰双效精华，娇兰复原蜜，海蓝之谜精粹水，DM背背佳，Nars蜜粉饼', '320', '20200817', '1', '20200820140128', '0');
INSERT INTO `one_piece` VALUES ('143', '美女小战士', 'Mac口红marrakesh#', '33', '20200818', '1', '20200827113854', '0');
INSERT INTO `one_piece` VALUES ('144', '保妹', '黛珂紫苏水300ml，黛珂牛油果乳液300ml', '89', '20200818', '1', '20200820134309', '0');
INSERT INTO `one_piece` VALUES ('145', '夏科长', '娜丽丝防晒喷雾2瓶', '24', '20200818', '1', '20200820134309', '0');
INSERT INTO `one_piece` VALUES ('146', '罗丹洁', 'FILA猫爪鞋', '40', '20200818', '1', '20200819142709', '0');
INSERT INTO `one_piece` VALUES ('147', '陈沁夷', 'SK2小灯泡，敷尔佳积雪草面膜2盒，祖马龙蓝风铃30ml', '223', '20200818', '1', '20200820134222', '0');
INSERT INTO `one_piece` VALUES ('148', '沈花花', '欧莱雅紫熨斗眼霜', '53', '20200819', '1', '20200823133702', '0');
INSERT INTO `one_piece` VALUES ('149', '曾思敏', '珂润面霜', '22', '20200819', '1', '20200820134033', '0');
INSERT INTO `one_piece` VALUES ('150', '王锦红', '兰蔻持妆粉底液PO-01#', '66', '20200820', '1', '20200825102001', '0');
INSERT INTO `one_piece` VALUES ('151', 'MC Robers小旦旦', '悦木之源泥娃娃面膜', '35', '20200820', '1', '20200829094554', '0');
INSERT INTO `one_piece` VALUES ('152', '保妹', 'Vans板鞋，芭比布朗粉饼，芭比布朗五花肉高光', '80', '20200821', '1', '20200821163454', '0');
INSERT INTO `one_piece` VALUES ('153', '小雨滴', '蓝色药丸面膜10张', '44', '20200823', '1', '20200823133831', '0');
INSERT INTO `one_piece` VALUES ('154', '程磊', 'FRESH玫瑰面膜，敷尔佳黑膜，敷尔佳积雪草面膜', '30', '20200822', '1', '20200823215027', '0');
INSERT INTO `one_piece` VALUES ('155', '我的心呐', '阿迪达斯空军鞋', '40', '20200823', '1', '20200823231826', '0');
INSERT INTO `one_piece` VALUES ('156', '王文贺', '娇兰金钻粉底液00#', '62', '20200822', '1', '20200827114011', '0');
INSERT INTO `one_piece` VALUES ('157', '意中人', '酵素', '37', '20200822', '1', '20200827114156', '0');
INSERT INTO `one_piece` VALUES ('158', '伶', 'SK2大红瓶面霜80g清爽', '115', '20200821', '1', '20200829094556', '0');
INSERT INTO `one_piece` VALUES ('159', 'Keiko', 'IPSA流金水，IPSA乳液R1', '111', '20200823', '1', '20200829094553', '0');
INSERT INTO `one_piece` VALUES ('160', '衣栋春', '娇兰金钻粉饼01#', '77', '20200824', '1', '20200829094600', '0');
INSERT INTO `one_piece` VALUES ('161', '伶', '美瞳700、550度，美瞳硅水凝胶700、550度', '123', '20200824', '1', '20200829094556', '0');
INSERT INTO `one_piece` VALUES ('162', '宋咏琪', '雅诗兰黛三件套', '162', '20200824', '1', '20200829094558', '0');
INSERT INTO `one_piece` VALUES ('163', 'MC Robers小旦旦', '芭比布朗蜜粉饼01#', '80', '20200824', '1', '20200829094554', '0');
INSERT INTO `one_piece` VALUES ('164', '糖糖', 'IPSA乳液S3', '110', '20200824', '1', '20200829094600', '0');
INSERT INTO `one_piece` VALUES ('165', '夏天', '美瞳双眼550度2副', '117', '20200825', '1', '20200829094558', '0');
INSERT INTO `one_piece` VALUES ('166', '金牛', 'YSL小金条21#', '23', '20200825', '1', '20200829094601', '0');
INSERT INTO `one_piece` VALUES ('167', '何千', '敷尔佳白膜2盒', '48', '20200825', '1', '20200829094556', '0');
INSERT INTO `one_piece` VALUES ('168', '王琳', '雅诗兰黛小棕瓶精华100ml', '120', '20200826', '1', '20200827162735', '0');
INSERT INTO `one_piece` VALUES ('169', '韵达燕子', '怡丽丝尔水乳清爽，美妆刷，美妆蛋2套', '156', '20200830', '1', '20200906214921', '0');
INSERT INTO `one_piece` VALUES ('170', '阴阳师-小白', '美妆刷', '20', '20200830', '1', '20200906110621', '0');
INSERT INTO `one_piece` VALUES ('171', '小舅妈', '雅诗兰黛多效智妍面霜', '60', '20200830', '1', '20200830220536', '0');
INSERT INTO `one_piece` VALUES ('172', '吴兆燃', 'FILA猫爪鞋', '40', '20200830', '1', '20200830220539', '0');
INSERT INTO `one_piece` VALUES ('173', '栗子', '美妆刷', '20', '20200831', '1', '20200906110414', '0');
INSERT INTO `one_piece` VALUES ('174', '黄梅', '分装瓶', '10', '20200831', '1', '20200906112717', '0');
INSERT INTO `one_piece` VALUES ('175', '余雪', '美妆蛋，美瞳250度2副', '130', '20200831', '1', '20200910105256', '0');
INSERT INTO `one_piece` VALUES ('176', '齐子仪', '美妆刷', '20', '20200831', '1', '20200912124406', '0');
INSERT INTO `one_piece` VALUES ('177', '沈花花', '雅诗兰黛DW粉底液1C1#，美妆蛋', '71', '20200831', '1', '20200906110416', '0');
INSERT INTO `one_piece` VALUES ('178', '罗彦婷', '美妆蛋，美妆刷', '33', '20200831', '1', '20200906110516', '0');
INSERT INTO `one_piece` VALUES ('179', '许文娟', '香奈儿洗面奶2支，欧舒丹护手霜2支', '98', '20200831', '1', '20200912124403', '0');
INSERT INTO `one_piece` VALUES ('180', '孙芳宜', '罗拉散粉', '52', '20200901', '1', '20200903134120', '0');
INSERT INTO `one_piece` VALUES ('181', '苏晨', '阿玛尼大师粉底液3#', '60', '20200901', '1', '20200906110546', '0');
INSERT INTO `one_piece` VALUES ('182', '么么哒', 'FILA鱼骨鞋', '60', '20200902', '1', '20200902094708', '0');
INSERT INTO `one_piece` VALUES ('183', '琳琳', '阿玛尼大师粉底液3#', '60', '20200902', '1', '20200906110448', '0');
INSERT INTO `one_piece` VALUES ('184', '刘欣', 'IPSA流金水300ml', '60', '20200903', '1', '20200903134123', '0');
INSERT INTO `one_piece` VALUES ('185', 'LoO', 'GUCCI绿繁花香水', '39', '20200824', '1', '20200910134608', '0');
INSERT INTO `one_piece` VALUES ('186', '杨颖钰', '阿玛尼大师粉底液3#', '60', '20200903', '1', '20200906110410', '0');
INSERT INTO `one_piece` VALUES ('187', '杨洋', '纪梵希散粉1#', '48', '20200903', '1', '20200903145451', '0');
INSERT INTO `one_piece` VALUES ('188', '张婷', 'CPB长管隔离', '45', '20200903', '1', '20200904091622', '0');
INSERT INTO `one_piece` VALUES ('189', '王锦红', '兰芝水乳套盒滋润版2套', '98', '20200904', '1', '20200908112914', '0');
INSERT INTO `one_piece` VALUES ('190', '何千', '后水妍洗面奶', '52', '20200905', '1', '20200910104733', '0');
INSERT INTO `one_piece` VALUES ('191', '齐子仪', '呼吸水乳霜套盒', '124', '20200905', '1', '20200912124408', '0');
INSERT INTO `one_piece` VALUES ('192', '孙彩芳', 'FILA鞋', '40', '20200905', '1', '20200905210750', '0');
INSERT INTO `one_piece` VALUES ('193', '何志', 'FILA鞋', '40', '20200905', '1', '20200906000254', '0');
INSERT INTO `one_piece` VALUES ('194', '晓晓', '芭比布朗粉饼1#', '47', '20200904', '1', '20200915154517', '0');
INSERT INTO `one_piece` VALUES ('195', '小舅妈', '黄色春雨面膜50张', '190', '20200907', '1', '20200907142442', '0');
INSERT INTO `one_piece` VALUES ('196', '阿楠楠', '芭妮兰卸妆膏套盒', '40', '20200907', '1', '20200910104655', '0');
INSERT INTO `one_piece` VALUES ('197', 'Sunshine', '科颜氏高保湿面霜50ml，蓝色药丸面膜10张', '100', '20200907', '1', '20200908112911', '0');
INSERT INTO `one_piece` VALUES ('198', '王文贺', '美瞳硅水凝胶双眼425度', '87', '20200908', '0', '20200926112946', '1');
INSERT INTO `one_piece` VALUES ('199', '傅嘉莉', '后拱辰享套盒，芭妮兰卸妆膏套盒2套', '115', '20200909', '1', '20200913121109', '0');
INSERT INTO `one_piece` VALUES ('200', '罗丹洁', '美妆刷', '20', '20200909', '1', '20200910105122', '0');
INSERT INTO `one_piece` VALUES ('201', '汪筱敏', 'IPSA粘土面膜', '64', '20200909', '1', '20200913121105', '0');
INSERT INTO `one_piece` VALUES ('202', '意中人', 'DM背背佳', '19', '20200911', '1', '20200911135155', '0');
INSERT INTO `one_piece` VALUES ('203', '程磊', '悦木之源菌菇水，科颜氏高保湿面霜50ml', '87', '20200911', '1', '20200911154657', '0');
INSERT INTO `one_piece` VALUES ('204', '张婷', '芭比布朗五花肉高光', '43', '20200911', '1', '20200911154656', '0');
INSERT INTO `one_piece` VALUES ('205', 'Bella', '安耐晒防晒霜90ml', '35', '20200911', '1', '20200920113639', '0');
INSERT INTO `one_piece` VALUES ('206', 'Jing.Chen', 'Nars修容盘', '46', '20200911', '0', '20200912123217', '1');
INSERT INTO `one_piece` VALUES ('207', '林欣欣', '艾凡达气垫梳', '24', '20200912', '1', '20200916120750', '0');
INSERT INTO `one_piece` VALUES ('208', '王文贺', '兰蔻菁纯面霜清爽', '120', '20200913', '1', '20200925120904', '0');
INSERT INTO `one_piece` VALUES ('209', '婷姐', '美瞳硅水凝胶，珂润面霜', '79', '20200912', '1', '20200914085615', '0');
INSERT INTO `one_piece` VALUES ('210', '海燕阿姨', '春雨面膜黄色20张，阿玛尼红管405#', '131', '20200912', '1', '20200914093544', '0');
INSERT INTO `one_piece` VALUES ('211', 'summer君', 'Three卸妆油，艾凡达气垫梳', '89', '20200913', '1', '20200916120746', '0');
INSERT INTO `one_piece` VALUES ('212', '没恰到饭', '没恰到饭', '0', '20200906', '1', '20200914103132', '0');
INSERT INTO `one_piece` VALUES ('213', '没恰到饭', '没恰到饭', '0', '20200910', '1', '20200914103414', '0');
INSERT INTO `one_piece` VALUES ('214', '没恰到饭', '没恰到饭', '0', '20200704', '1', '20200914103416', '0');
INSERT INTO `one_piece` VALUES ('215', '没恰到饭', '没恰到饭', '0', '20200705', '1', '20200914103418', '0');
INSERT INTO `one_piece` VALUES ('216', '没恰到饭', '没恰到饭', '0', '20200706', '1', '20200914103419', '0');
INSERT INTO `one_piece` VALUES ('217', '没恰到饭', '没恰到饭', '0', '20200712', '1', '20200914103420', '0');
INSERT INTO `one_piece` VALUES ('218', '没恰到饭', '没恰到饭', '0', '20200814', '1', '20200914103421', '0');
INSERT INTO `one_piece` VALUES ('219', '没恰到饭', '没恰到饭', '0', '20200827', '1', '20200914103423', '0');
INSERT INTO `one_piece` VALUES ('220', '没恰到饭', '没恰到饭', '0', '20200828', '1', '20200914103424', '0');
INSERT INTO `one_piece` VALUES ('221', '没恰到饭', '没恰到饭', '0', '20200829', '1', '20200914103426', '0');
INSERT INTO `one_piece` VALUES ('222', 'LoO（140未付）', '美瞳硅水凝胶双眼475度', '80', '20200914', '0', '20200920222937', '1');
INSERT INTO `one_piece` VALUES ('223', 'summer君', '美妆蛋', '12', '20200914', '1', '20200916120748', '0');
INSERT INTO `one_piece` VALUES ('224', '萨瓦迪卡', 'Nike AJ鞋', '52', '20200914', '1', '20200915154506', '0');
INSERT INTO `one_piece` VALUES ('225', '萨瓦迪卡', '雪花秀粉色精华套盒', '45', '20200914', '1', '20200920113922', '0');
INSERT INTO `one_piece` VALUES ('226', '西瓜', 'FILA鞋', '50', '20200915', '1', '20200915154706', '0');
INSERT INTO `one_piece` VALUES ('227', '淡美霖', 'FILA鞋', '50', '20200915', '1', '20200915154707', '0');
INSERT INTO `one_piece` VALUES ('228', 'cherry', '芭妮兰卸妆膏套盒', '40', '20200915', '1', '20200920113704', '0');
INSERT INTO `one_piece` VALUES ('229', 'cherry', '兰蔻菁纯面霜滋润', '120', '20200915', '1', '20200920113704', '0');
INSERT INTO `one_piece` VALUES ('230', '宾哥', '阿迪鞋', '50', '20200915', '1', '20200915164308', '0');
INSERT INTO `one_piece` VALUES ('231', '吴子聪', '莆田鞋', '50', '20200915', '1', '20200917120625', '1');
INSERT INTO `one_piece` VALUES ('232', '最初', 'FILA鞋', '50', '20200915', '1', '20200915214050', '0');
INSERT INTO `one_piece` VALUES ('233', '陈沁夷', 'YSL粉底液B20#', '68', '20200915', '1', '20200920222326', '0');
INSERT INTO `one_piece` VALUES ('234', '美女小战士', '黛珂散粉11#', '40', '20200916', '1', '20200916120743', '0');
INSERT INTO `one_piece` VALUES ('235', 'Yi', 'FILA鞋', '50', '20200916', '1', '20200916223907', '0');
INSERT INTO `one_piece` VALUES ('236', '黄秀霞', 'FILA鞋', '50', '20200916', '1', '20200916223907', '0');
INSERT INTO `one_piece` VALUES ('237', '晓', '雅诗兰黛白金粉底液1C0', '35', '20200916', '1', '20200920113826', '0');
INSERT INTO `one_piece` VALUES ('238', '小雨滴', '雅诗兰黛小棕瓶眼霜，蓝色药丸面膜10张', '104', '20200916', '1', '20200920113805', '0');
INSERT INTO `one_piece` VALUES ('239', '甘俊雅', '莆田鞋', '50', '20200917', '1', '20200917120602', '0');
INSERT INTO `one_piece` VALUES ('240', '纳米', '科颜氏金盏花面霜100ml，雅诗兰黛新版白金粉底液1W0#', '155', '20200918', '1', '20201001142239', '0');
INSERT INTO `one_piece` VALUES ('241', '最初', '美瞳硅水凝胶双眼650度', '80', '20200917', '1', '20200925120910', '0');
INSERT INTO `one_piece` VALUES ('242', '龄龙家的九九', '珂润面霜', '22', '20200917', '1', '20200918135413', '0');
INSERT INTO `one_piece` VALUES ('243', '周磊', 'FILA鞋', '50', '20200917', '1', '20200918135148', '0');
INSERT INTO `one_piece` VALUES ('244', '陈沁夷', '敷尔佳积雪草面膜2盒', '36', '20200918', '1', '20200927114645', '0');
INSERT INTO `one_piece` VALUES ('245', 'Sabrina', '芙丽芳丝洗面奶2支', '32', '20200918', '1', '20200919095933', '0');
INSERT INTO `one_piece` VALUES ('246', '冯晓琳', 'FILA鞋', '30', '20200919', '1', '20200920103615', '0');
INSERT INTO `one_piece` VALUES ('247', '柔', '美妆蛋', '12', '20200919', '1', '20200920113851', '0');
INSERT INTO `one_piece` VALUES ('248', '冯安琪', '旅行分装', '10', '20200920', '1', '20200920130516', '0');
INSERT INTO `one_piece` VALUES ('249', '锐锐', '安耐晒防晒霜60ml', '40', '20200920', '1', '20200920222416', '0');
INSERT INTO `one_piece` VALUES ('250', '十二', 'Mac口红chili#', '15', '20200920', '1', '20200920222443', '0');
INSERT INTO `one_piece` VALUES ('251', '意中人', 'FILA鞋2双', '100', '20200920', '1', '20200920222500', '0');
INSERT INTO `one_piece` VALUES ('252', '王梦瑶', 'Mac生姜高光，欧莱雅紫熨斗眼霜，芭比布朗蜜粉饼1#，迪奥红毒香水50ml', '270', '20200920', '1', '20200929120655', '0');
INSERT INTO `one_piece` VALUES ('253', 'M', '兰蔻小黑瓶精华100ml', '100', '20200921', '1', '20200927114449', '0');
INSERT INTO `one_piece` VALUES ('254', '纳米', '祖马龙桂花香水30ml', '60', '20200921', '1', '20200926112900', '0');
INSERT INTO `one_piece` VALUES ('255', '吴子聪', '悦木之源洗面奶', '38', '20200922', '1', '20200927115008', '0');
INSERT INTO `one_piece` VALUES ('256', '韫韵', '芭比布朗虫草粉底液W-016#', '75', '20200922', '1', '20200927114830', '0');
INSERT INTO `one_piece` VALUES ('257', '沈花花', 'YSL黑鸦片浓香香水50ml', '80', '20200922', '1', '20200927114651', '0');
INSERT INTO `one_piece` VALUES ('258', '戴戴', '植村秀粉底液774#', '50', '20200922', '1', '20200926214712', '0');
INSERT INTO `one_piece` VALUES ('259', '吴子聪', 'SK2小灯泡精华，悦木之源菌菇水', '152', '20200923', '1', '20200927115007', '0');
INSERT INTO `one_piece` VALUES ('260', '韵达-杭小蓓', '酵素', '40', '20200923', '1', '20200923163339', '0');
INSERT INTO `one_piece` VALUES ('261', '文芳', 'FILA鞋', '50', '20200923', '1', '20200924225837', '0');
INSERT INTO `one_piece` VALUES ('262', '不加糖', '悦木之源洗面奶', '45', '20200924', '1', '20200926214717', '0');
INSERT INTO `one_piece` VALUES ('263', '余青', 'IPSA流金水300ml', '50', '20200926', '1', '20201001142347', '0');
INSERT INTO `one_piece` VALUES ('264', '纳米', 'Nars蜜粉饼', '50', '20200925', '1', '20201001142237', '0');
INSERT INTO `one_piece` VALUES ('265', '衣栋春', '艾凡达气垫梳', '19', '20200925', '1', '20201001142308', '0');
INSERT INTO `one_piece` VALUES ('266', '马薇', '纪梵希N37#', '20', '20200925', '1', '20200926113041', '0');
INSERT INTO `one_piece` VALUES ('267', '小雨滴', '兰蔻眼唇卸妆油', '30', '20200927', '1', '20200930171239', '0');
INSERT INTO `one_piece` VALUES ('268', '陈绪静', '敷尔佳积雪草面膜2盒，敷尔佳白膜面膜1盒', '48', '20200927', '1', '20201001142141', '0');
INSERT INTO `one_piece` VALUES ('269', '龙芳芳', '兰蔻持妆粉底液PO-03#', '25', '20200928', '1', '20201005111745', '0');
INSERT INTO `one_piece` VALUES ('270', '黎元', 'fresh红茶面膜（白色瓶）', '67', '20200928', '1', '20201012143329', '0');
INSERT INTO `one_piece` VALUES ('271', '小鱼', 'FILA鞋2双', '100', '20200929', '1', '20200930133944', '0');
INSERT INTO `one_piece` VALUES ('272', '猪君', 'TF眼影盘03#', '55', '20200929', '1', '20201003110948', '0');
INSERT INTO `one_piece` VALUES ('273', '潘子婉', '雅诗兰黛沁水粉底液1C0#2瓶', '162', '20200930', '1', '20201005112831', '0');
INSERT INTO `one_piece` VALUES ('274', '童心', '后天气丹套盒新版，欧莱雅紫熨斗眼霜', '257', '20200930', '1', '20201007160756', '0');
INSERT INTO `one_piece` VALUES ('275', '小王乔治', '兰蔻小黑瓶眼霜', '50', '20201001', '1', '20201005112755', '0');
INSERT INTO `one_piece` VALUES ('276', '张伊', '艾珂薇N4面霜，兰芝紫色隔离', '110', '20201002', '1', '20201010133238', '0');
INSERT INTO `one_piece` VALUES ('277', 'Bella', 'SK2大红瓶面霜100g', '87', '20201002', '1', '20201007160741', '0');
INSERT INTO `one_piece` VALUES ('278', '欢喜', '兰蔻小黑瓶眼霜，资生堂百优面霜75ml，资生堂悦薇水乳中样2套', '230', '20201001', '1', '20201007160748', '0');
INSERT INTO `one_piece` VALUES ('279', 'spring', '兰蔻小黑瓶眼霜，雅诗兰黛红石榴洗面奶', '90', '20201001', '1', '20201015144256', '0');
INSERT INTO `one_piece` VALUES ('280', '辜静萩', '兰芝绿色隔离', '47', '20201003', '1', '20201012143456', '0');
INSERT INTO `one_piece` VALUES ('281', '半晚', '久光贴', '25', '20201003', '1', '20201007160742', '0');
INSERT INTO `one_piece` VALUES ('282', '王蓉', '后天气丹套盒新版，CNP鼻贴', '277', '20201003', '1', '20201012143130', '0');
INSERT INTO `one_piece` VALUES ('283', '王小环', '娇韵诗防晒隔离', '51', '20201004', '1', '20201007160752', '0');
INSERT INTO `one_piece` VALUES ('284', '您', '植村秀卸妆油450ml', '55', '20201006', '1', '20201012143248', '0');
INSERT INTO `one_piece` VALUES ('285', '别雁', '芭比布朗粉饼01#', '80', '20201006', '1', '20201007114509', '0');
INSERT INTO `one_piece` VALUES ('286', '小雨滴', '欧舒丹护手霜', '30', '20200928', '1', '20201007112551', '0');
INSERT INTO `one_piece` VALUES ('287', '小雨滴', '蓝色药丸面膜10张', '45', '20201007', '1', '20201007112554', '0');
INSERT INTO `one_piece` VALUES ('288', '今天认真学习了吗', 'MUF卸妆膏中样3个', '13', '20201006', '1', '20201012143246', '0');
INSERT INTO `one_piece` VALUES ('289', '刘莎', 'MUF眼唇卸妆乳中样2个', '21', '20201006', '1', '20201010133559', '0');
INSERT INTO `one_piece` VALUES ('290', '买瓶可乐喝喝', '黛珂紫苏水150ml，黛珂牛油果乳液150ml', '77', '20201006', '1', '20201007114644', '0');
INSERT INTO `one_piece` VALUES ('291', '樱花雨', '欧莱雅小黑瓶精华', '30', '20201006', '1', '20201007114605', '0');
INSERT INTO `one_piece` VALUES ('292', '清莞嫂子', 'MUF卸妆膏中样3个', '20', '20201006', '1', '20201012143709', '0');
INSERT INTO `one_piece` VALUES ('293', '王乐佳', 'AG面膜，敷尔佳黑膜', '64', '20201005', '1', '20201012143707', '0');
INSERT INTO `one_piece` VALUES ('294', '小雨滴', '香奈儿洗面奶', '20', '20201007', '1', '20201008210831', '0');
INSERT INTO `one_piece` VALUES ('295', '萨瓦迪卡', '海蓝之谜中样，Belif中样', '219', '20201008', '1', '20201008211441', '0');
INSERT INTO `one_piece` VALUES ('296', '小雨滴', '雅诗兰黛小棕瓶精华100ml', '90', '20201008', '1', '20201012143201', '0');
INSERT INTO `one_piece` VALUES ('297', '赵晗宇', '阿玛尼大师粉底液3#', '60', '20201007', '1', '20201008211426', '0');
INSERT INTO `one_piece` VALUES ('298', '李雪', 'MUF水粉霜R250#', '50', '20201007', '1', '20201012143249', '0');
INSERT INTO `one_piece` VALUES ('299', '皇冠', 'MUF水粉霜R250#', '50', '20201007', '1', '20201010133324', '0');
INSERT INTO `one_piece` VALUES ('300', 'Ganzi窈', '娇韵诗颈霜新版', '112', '20201007', '1', '20201010133151', '0');
INSERT INTO `one_piece` VALUES ('301', '张姝', '海蓝之谜绒布袋3个', '50', '20201008', '1', '20201008221637', '0');
INSERT INTO `one_piece` VALUES ('302', '刘荣荣', '珂润面霜', '22', '20201010', '1', '20201010133728', '0');
INSERT INTO `one_piece` VALUES ('303', '陈沁夷', 'IPSA乳液S3，怡丽丝尔防晒霜', '126', '20201009', '1', '20201016104139', '0');
INSERT INTO `one_piece` VALUES ('304', '王燕', '兰蔻菁纯粉底液100#', '82', '20201010', '1', '20201015100007', '0');
INSERT INTO `one_piece` VALUES ('305', 'Stolz', 'Nars吉隆坡眼影', '56', '20201010', '1', '20201015095901', '0');
INSERT INTO `one_piece` VALUES ('306', '没恰到饭', '没恰到饭', '0', '20201011', '1', '20201012145133', '0');
INSERT INTO `one_piece` VALUES ('307', '陶玉', '资生堂红腰子精华100ml', '125', '20201012', '1', '20201015114622', '0');
INSERT INTO `one_piece` VALUES ('308', '韵达-燕子', '酵素', '40', '20201012', '1', '20201015114618', '0');
INSERT INTO `one_piece` VALUES ('309', '小雨滴', 'CPB长管隔离', '50', '20201012', '1', '20201015095930', '0');
INSERT INTO `one_piece` VALUES ('310', 'Shimmer', '黛珂紫苏水150ml，牛油果乳液150ml，科颜氏白泥面膜', '130', '20201012', '1', '20201016103923', '0');
INSERT INTO `one_piece` VALUES ('311', 'Stars', '芙丽芳丝洗面奶2支', '35', '20201013', '1', '20201015095816', '0');
INSERT INTO `one_piece` VALUES ('312', '陈绪靖', 'SK2大红瓶面霜80g，欧舒丹护手霜，兰蔻极光水中样', '105', '20201013', '1', '20201018195433', '0');
INSERT INTO `one_piece` VALUES ('313', '孙航', '蓝色药丸面膜3盒', '45', '20201014', '1', '20201015100146', '0');
INSERT INTO `one_piece` VALUES ('314', '小雨滴', 'SK2大红瓶面霜80g滋润', '34', '20201014', '1', '20201018195420', '0');
INSERT INTO `one_piece` VALUES ('315', 'YHM', '兰蔻小黑瓶眼霜，资生堂悦薇眼霜中样', '100', '20201015', '1', '20201106090814', '0');
INSERT INTO `one_piece` VALUES ('316', '欢喜', 'YSL黑鸭片香水中样7.5ml，Belif面霜中样', '20', '20201013', '1', '20201025130317', '0');
INSERT INTO `one_piece` VALUES ('317', '最初', '眼药水2瓶', '20', '20201015', '1', '20201025130315', '0');
INSERT INTO `one_piece` VALUES ('318', '阴阳师-华原瞳', '蒂普提可车载香薰无花果', '47', '20201015', '1', '20201112084826', '0');
INSERT INTO `one_piece` VALUES ('319', '张新秀', '珂润面霜', '22', '20201015', '1', '20201016104031', '0');
INSERT INTO `one_piece` VALUES ('320', '孙彩芳', 'MUF散粉', '50', '20201015', '1', '20201022114520', '0');
INSERT INTO `one_piece` VALUES ('321', '进姐', '雅诗兰黛DW粉底液1W2#，IPSA流金水，科颜氏淡斑精华50ml', '200', '20201015', '1', '20201023154623', '0');
INSERT INTO `one_piece` VALUES ('322', '范静', '敷尔佳积雪草面膜2盒', '38', '20201017', '1', '20201017213844', '0');
INSERT INTO `one_piece` VALUES ('323', '没恰到饭', '没恰到饭', '0', '20201016', '1', '20201018195426', '0');
INSERT INTO `one_piece` VALUES ('324', '车晓琴', '娇韵诗双萃精华2瓶，悦木之源菌菇水，资生堂盼丽风姿眼霜', '207', '20201017', '1', '20201025130320', '0');
INSERT INTO `one_piece` VALUES ('325', '亦安', '兰芝套盒滋润', '55', '20201019', '1', '20201022114519', '0');
INSERT INTO `one_piece` VALUES ('326', '没恰到饭', '没恰到饭', '0', '20201018', '1', '20201019154711', '0');
INSERT INTO `one_piece` VALUES ('327', '衣栋春', 'UGG保暖内衣', '68', '20201020', '1', '20201021141218', '0');
INSERT INTO `one_piece` VALUES ('328', '王文贺', '碧欧泉水动力套盒', '52', '20201020', '1', '20201026152936', '0');
INSERT INTO `one_piece` VALUES ('329', '皇冠', '爱敬气垫黑色21#', '52', '20201019', '1', '20201028115119', '0');
INSERT INTO `one_piece` VALUES ('330', '陈红玲', '雅诗兰黛小棕瓶精华100ml', '74', '20201021', '1', '20201025130322', '0');
INSERT INTO `one_piece` VALUES ('331', '丹丹', 'YSL圆管12#', '29', '20201021', '1', '20201027140923', '0');
INSERT INTO `one_piece` VALUES ('332', '几秋', '兰蔻防晒霜', '53', '20201022', '1', '20201026152915', '0');
INSERT INTO `one_piece` VALUES ('333', '刘阿刘', 'YSL圆管83#', '38', '20201022', '1', '20201027140924', '0');
INSERT INTO `one_piece` VALUES ('334', '晓航', 'UGG豆豆鞋', '58', '20201022', '1', '20201022145753', '0');
INSERT INTO `one_piece` VALUES ('335', '意中人', 'YSL圆管12#，黛珂植物韵律乳液滋润', '79', '20201022', '1', '20201030155541', '0');
INSERT INTO `one_piece` VALUES ('336', '王乐佳', 'FILA鞋', '50', '20201022', '1', '20201022154728', '0');
INSERT INTO `one_piece` VALUES ('337', '洪玲', 'UGG大喜庆鞋', '50', '20201022', '1', '20201022160251', '0');
INSERT INTO `one_piece` VALUES ('338', '杨智彬', 'YSL圆管83#', '38', '20201022', '1', '20201027140927', '0');
INSERT INTO `one_piece` VALUES ('339', '小元六', 'YSL圆管83#', '38', '20201022', '1', '20201027140925', '0');
INSERT INTO `one_piece` VALUES ('340', '叶', 'UGG鞋', '39', '20201022', '1', '20201023154547', '0');
INSERT INTO `one_piece` VALUES ('341', '丹丹', 'UGG宝宝鞋2双，UGG宝宝围巾', '63', '20201023', '1', '20201026153427', '0');
INSERT INTO `one_piece` VALUES ('342', 'BlaBla', 'UGG凯琳5代', '78', '20201023', '1', '20201026164108', '0');
INSERT INTO `one_piece` VALUES ('343', '小元六', 'YSL圆管83#', '38', '20201023', '0', '20201026153630', '1');
INSERT INTO `one_piece` VALUES ('344', '智乐教育', 'YSL圆管80#', '38', '20201024', '1', '20201027142653', '0');
INSERT INTO `one_piece` VALUES ('345', '杨曼云', '黛珂散粉10#', '56', '20201024', '1', '20201027140928', '0');
INSERT INTO `one_piece` VALUES ('346', '马薇', '雅诗兰黛小棕瓶眼霜2个', '92', '20201024', '1', '20201028143935', '0');
INSERT INTO `one_piece` VALUES ('347', '付颖', '后拱辰享洗面奶', '72', '20201024', '1', '20201028143816', '0');
INSERT INTO `one_piece` VALUES ('348', '甘俊雅', 'Nars蜜粉饼', '49', '20201025', '1', '20201028115225', '0');
INSERT INTO `one_piece` VALUES ('349', 'Ganzi窈', 'YSL黑管407#，CPB粉扑', '37', '20201025', '1', '20201027140921', '0');
INSERT INTO `one_piece` VALUES ('350', '衣栋春', 'UGG宝宝小马甲', '33', '20201025', '1', '20201026163340', '0');
INSERT INTO `one_piece` VALUES ('351', '葛星宇', 'Nars腮红深喉', '27', '20201025', '1', '20201028115224', '0');
INSERT INTO `one_piece` VALUES ('352', '寒冰石', 'UGG豆豆鞋', '58', '20201024', '1', '20201026163743', '0');
INSERT INTO `one_piece` VALUES ('353', '夏珂', 'UGG鞋', '10', '20201024', '1', '20201026164216', '0');
INSERT INTO `one_piece` VALUES ('354', '美女小战士', '科颜氏淡斑精华100ml', '100', '20201026', '1', '20201228093026', '0');
INSERT INTO `one_piece` VALUES ('355', '丹丹', 'SK2大红瓶80g滋润', '72', '20201027', '1', '20201101133945', '0');
INSERT INTO `one_piece` VALUES ('356', '陈红玲', '美瞳硅水凝胶双眼650度', '70', '20201027', '1', '20201030154758', '0');
INSERT INTO `one_piece` VALUES ('357', '任静雯', 'FILA鞋', '50', '20201027', '1', '20201027152813', '0');
INSERT INTO `one_piece` VALUES ('358', '汪媛媛', 'YSL圆管46#', '29', '20201027', '1', '20201104093421', '0');
INSERT INTO `one_piece` VALUES ('359', '傅佳莉', '资生堂红腰子精华100ml', '50', '20201024', '1', '20201028143719', '0');
INSERT INTO `one_piece` VALUES ('360', '星辰', '酵素', '35', '20201029', '1', '20201101134036', '0');
INSERT INTO `one_piece` VALUES ('361', '蔡嘉惠', '雅诗兰黛多效智妍霜75ml', '28', '20201028', '1', '20201104094155', '0');
INSERT INTO `one_piece` VALUES ('362', '阿璠达', 'MAC口红991#，MAC口红211#', '43', '20201028', '1', '20201107152721', '0');
INSERT INTO `one_piece` VALUES ('363', '小饭', 'CPB长管隔离，黛珂紫苏水牛油果乳液', '110', '20201028', '1', '20201104094018', '0');
INSERT INTO `one_piece` VALUES ('364', '小饭', '悦木之源泥娃娃面膜', '35', '20201029', '1', '20201104094023', '0');
INSERT INTO `one_piece` VALUES ('365', '阿璠达', '纪梵希口红N37#', '20', '20201029', '1', '20201030154753', '0');
INSERT INTO `one_piece` VALUES ('366', 'NONO', '美瞳硅水凝胶双眼1000度', '70', '20201030', '1', '20201105121209', '0');
INSERT INTO `one_piece` VALUES ('367', '旺仔小牛奶', '海蓝之谜精萃液', '70', '20201029', '1', '20201101134115', '0');
INSERT INTO `one_piece` VALUES ('368', '玉竹', '爱敬气垫黑色21#', '52', '20201030', '1', '20201101134210', '0');
INSERT INTO `one_piece` VALUES ('369', '李英男', '倩碧透明黄油', '38', '20201030', '1', '20201101134201', '0');
INSERT INTO `one_piece` VALUES ('370', '傅佳莉', '美瞳日抛', '20', '20201031', '1', '20201105121211', '0');
INSERT INTO `one_piece` VALUES ('371', '潘子婉', '资生堂百优面霜，黛珂白檀水乳滋润', '158', '20201030', '1', '20201104093634', '0');
INSERT INTO `one_piece` VALUES ('372', '刘爽', '黛珂紫苏水150ml，牛油果乳液150ml', '55', '20201031', '1', '20201104093327', '0');
INSERT INTO `one_piece` VALUES ('373', '九九', '雪花秀滋阴三件套', '120', '20201030', '1', '20201105121112', '0');
INSERT INTO `one_piece` VALUES ('374', '顾佳宸', 'YSL逆龄粉底液B10#', '50', '20201031', '1', '20201104093517', '0');
INSERT INTO `one_piece` VALUES ('375', '钱', '芙丽芳丝散粉，欧莱雅眼霜', '35', '20201101', '1', '20201103142501', '0');
INSERT INTO `one_piece` VALUES ('376', '陆瑞', 'FRESH三件套，FRESH玫瑰眼霜', '107', '20201101', '1', '20201120204136', '0');
INSERT INTO `one_piece` VALUES ('377', '小雨滴', '雅诗兰黛多效智妍面霜50ml，欧舒丹芍药护手霜75ml，药丸面膜3盒', '158', '20201101', '1', '20201106085543', '0');
INSERT INTO `one_piece` VALUES ('378', 'Lyyyy', '晓姿眼膜，倩碧透明黄油', '74', '20201102', '1', '20201115103317', '0');
INSERT INTO `one_piece` VALUES ('379', 'SShuang', 'UGG儿童帽3个', '90', '20201102', '1', '20201102172626', '0');
INSERT INTO `one_piece` VALUES ('380', '王燕', 'UGG马丁靴', '68', '20201102', '1', '20201102193744', '0');
INSERT INTO `one_piece` VALUES ('381', '傅佳莉', '无人区香水50ml', '30', '20201102', '1', '20201108200800', '0');
INSERT INTO `one_piece` VALUES ('382', '旺仔仙贝', 'UGG鞋', '98', '20201102', '1', '20201103154003', '0');
INSERT INTO `one_piece` VALUES ('383', '罗彦婷', 'UGG鞋2双', '120', '20201102', '1', '20201103154007', '0');
INSERT INTO `one_piece` VALUES ('384', '记得', 'UGG儿童围巾，UGG儿童手套', '39', '20201102', '1', '20201103154011', '0');
INSERT INTO `one_piece` VALUES ('385', '王锦红', '兰芝气垫13#', '65', '20201102', '1', '20201107152730', '0');
INSERT INTO `one_piece` VALUES ('386', 'Lost in time', 'UGG豆豆鞋', '58', '20201102', '1', '20201103153948', '1');
INSERT INTO `one_piece` VALUES ('387', '宝宝的外婆', 'UGG鞋', '80', '20201103', '1', '20201103181549', '0');
INSERT INTO `one_piece` VALUES ('388', '美女小战士', 'UGG拖鞋', '38', '20201103', '1', '20201103192745', '0');
INSERT INTO `one_piece` VALUES ('389', '宝宝的同事', 'UGG鞋2双', '70', '20201104', '1', '20201104103657', '0');
INSERT INTO `one_piece` VALUES ('390', '衣栋春', 'UGG奶奶裤', '65', '20201103', '1', '20201104132145', '0');
INSERT INTO `one_piece` VALUES ('391', '秃头浪仔', 'Nars蜜粉饼', '47', '20201104', '1', '20201109085449', '0');
INSERT INTO `one_piece` VALUES ('392', '婷姐', 'UGG鲨鱼裤', '10', '20201104', '1', '20201202165428', '0');
INSERT INTO `one_piece` VALUES ('393', '秃头浪仔', '纪梵希散粉1#', '62', '20201104', '1', '20201109085449', '0');
INSERT INTO `one_piece` VALUES ('394', '罗希', 'FILA鞋', '110', '20201105', '1', '20201106100904', '0');
INSERT INTO `one_piece` VALUES ('395', '顾佳宸', '斐思妮绿膜3盒', '12', '20201102', '1', '20201122153037', '0');
INSERT INTO `one_piece` VALUES ('396', '欢喜', 'UGG袜子', '18', '20201104', '1', '20201106085950', '0');
INSERT INTO `one_piece` VALUES ('397', '杨曼云', 'SK2神仙水230ml', '100', '20201104', '1', '20201109085444', '0');
INSERT INTO `one_piece` VALUES ('398', '孙洁美女', '资生堂悦薇水乳中样2套', '90', '20201104', '1', '20201106101924', '0');
INSERT INTO `one_piece` VALUES ('399', '孙洁美女', '雅诗兰黛红石榴面霜组合', '137', '20201104', '1', '20201117150221', '0');
INSERT INTO `one_piece` VALUES ('400', '李芬芳', '资生堂悦薇水乳滋润', '100', '20201106', '1', '20201109095451', '0');
INSERT INTO `one_piece` VALUES ('401', '小雨滴', '绿色药丸面膜10张', '53', '20201107', '1', '20201111113130', '0');
INSERT INTO `one_piece` VALUES ('402', '陆瑞', '呼吸气垫1#', '77', '20201108', '1', '20201120204138', '0');
INSERT INTO `one_piece` VALUES ('403', '萨瓦迪卡', 'GUCCI粉饼00#', '52', '20201107', '1', '20201115103644', '0');
INSERT INTO `one_piece` VALUES ('404', '萨瓦迪卡', '阿玛尼红气垫2#', '60', '20201108', '1', '20201115103647', '0');
INSERT INTO `one_piece` VALUES ('405', '冯安琪', '雪花秀滋阴三件套', '130', '20201109', '1', '20201114000117', '0');
INSERT INTO `one_piece` VALUES ('406', 'Y', '兰蔻清爽防晒霜', '52', '20201109', '1', '20201111112955', '0');
INSERT INTO `one_piece` VALUES ('407', '吴子聪', 'SK2小灯泡精华', '100', '20201109', '1', '20201111113025', '0');
INSERT INTO `one_piece` VALUES ('408', '小雨滴', '雅诗兰黛小棕瓶眼霜，绿色药丸面膜5张', '72', '20201109', '1', '20201111113132', '0');
INSERT INTO `one_piece` VALUES ('409', '张艺铄', '悦木之源粉娃娃面膜', '70', '20201110', '1', '20201114215013', '0');
INSERT INTO `one_piece` VALUES ('410', '向日葵', '木瓜膏，雅诗兰黛口红333#，悦木之源菌菇水400ml', '160', '20201110', '1', '20201119103839', '0');
INSERT INTO `one_piece` VALUES ('411', 'hemeng', '斐思妮绿膜3盒', '12', '20201110', '1', '20201122153030', '0');
INSERT INTO `one_piece` VALUES ('412', 'Lyyyy', '阿玛尼大师粉底液3#', '60', '20201111', '1', '20201115103318', '0');
INSERT INTO `one_piece` VALUES ('413', '郑琳姿', '兰蔻菁纯面霜清爽版', '110', '20201111', '1', '20201117001714', '0');
INSERT INTO `one_piece` VALUES ('414', 'Reset', '科颜氏高保湿面霜125ml，兰蔻小黑瓶眼霜', '115', '20201111', '1', '20201117001700', '0');
INSERT INTO `one_piece` VALUES ('415', '王乐佳', '希思黎全能乳液，CPB洗面奶滋润版', '148', '20201110', '1', '20201115103603', '0');
INSERT INTO `one_piece` VALUES ('416', '杨颖', '黛珂紫苏水', '30', '20201111', '1', '20201114000122', '0');
INSERT INTO `one_piece` VALUES ('417', '那些年，那些事', '祖马龙橙花香水30ml', '62', '20201111', '1', '20201122134310', '0');
INSERT INTO `one_piece` VALUES ('418', '程磊', '敷尔佳白膜，敷尔佳黑膜，蓝色药丸面膜', '62', '20201111', '1', '20201112091018', '0');
INSERT INTO `one_piece` VALUES ('419', '没恰到饭', '没恰到饭', '0', '20201112', '1', '20201113233144', '0');
INSERT INTO `one_piece` VALUES ('420', '伶', '雅诗兰黛多效智妍霜75ml，娇兰蜂皇水', '177', '20201113', '1', '20201122153031', '0');
INSERT INTO `one_piece` VALUES ('421', '杨曼云', '伊丽莎白雅顿粉胶', '52', '20201114', '1', '20201202165430', '0');
INSERT INTO `one_piece` VALUES ('422', '冯晓琳', '酵素2瓶', '10', '20201114', '1', '20201122153032', '0');
INSERT INTO `one_piece` VALUES ('423', '李诗语', '雅诗兰黛小棕瓶眼霜', '35', '20201115', '1', '20201119103837', '0');
INSERT INTO `one_piece` VALUES ('424', '陆瑞', '资生堂悦薇水清爽', '68', '20201115', '1', '20201120204141', '0');
INSERT INTO `one_piece` VALUES ('425', '沈花花', 'CPB粉扑', '12', '20201116', '1', '20201122153034', '0');
INSERT INTO `one_piece` VALUES ('426', '小雨滴', '雅诗兰黛樱花水', '129', '20201115', '1', '20201122134208', '0');
INSERT INTO `one_piece` VALUES ('427', '清莞嫂子', '迪奥变色唇膏004#', '38', '20201117', '1', '20201122153036', '0');
INSERT INTO `one_piece` VALUES ('428', '那些年，那些事', '雪花秀顺行洁面', '29', '20201117', '1', '20201122134312', '0');
INSERT INTO `one_piece` VALUES ('429', '毛毛', '巧克力1盒，阿玛尼206#', '80', '20201117', '1', '20201202165431', '0');
INSERT INTO `one_piece` VALUES ('430', '记忆妄想症', '兰蔻睫毛膏套盒', '40', '20201118', '1', '20201124204543', '0');
INSERT INTO `one_piece` VALUES ('431', '向日葵', '兰蔻睫毛膏套盒', '40', '20201124', '1', '20201202165434', '0');
INSERT INTO `one_piece` VALUES ('432', '锐锐', '欧莱雅抗皱套盒', '71', '20201118', '1', '20201124204542', '0');
INSERT INTO `one_piece` VALUES ('433', '衣栋春', '悦木之源祛痘凝胶', '25', '20201118', '1', '20201124204540', '0');
INSERT INTO `one_piece` VALUES ('434', '房慧', 'TF细管27#', '46', '20201120', '1', '20201124204536', '0');
INSERT INTO `one_piece` VALUES ('435', '张新秀', 'TF哑光16#，雅诗兰黛333#', '75', '20201120', '1', '20201124204535', '0');
INSERT INTO `one_piece` VALUES ('436', '付薇', '阿玛尼200#中样', '20', '20201122', '1', '20201202165440', '0');
INSERT INTO `one_piece` VALUES ('437', 'Sunshine', '雪花秀雨润面膜', '32', '20201122', '1', '20201202165439', '0');
INSERT INTO `one_piece` VALUES ('438', 'Ganzi窈', '娇韵诗粉水', '40', '20201122', '1', '20201124204524', '0');
INSERT INTO `one_piece` VALUES ('439', 'MC Robers小旦旦', '娇韵诗粉水，纪梵希N37#', '60', '20201122', '1', '20201124204526', '0');
INSERT INTO `one_piece` VALUES ('440', '气球', '黛珂紫苏水牛油果乳液', '80', '20201119', '1', '20201202165435', '0');
INSERT INTO `one_piece` VALUES ('441', '嗝', 'CPB隔离', '52', '20201119', '1', '20201124204530', '0');
INSERT INTO `one_piece` VALUES ('442', '婷姐', 'EVE卸妆膏2个，复活草面膜2个，娇韵诗弹簧水2瓶，雪花秀雨润面膜', '129', '20201122', '1', '20201202165426', '0');
INSERT INTO `one_piece` VALUES ('443', 'summer君', '雪花秀套盒，Lamer绿眼霜，pola黑ba洗面奶，EVE卸妆膏50ml，口罩2包，安耐晒90ml 3瓶，卫衣2件', '519', '20201122', '1', '20201208143618', '0');
INSERT INTO `one_piece` VALUES ('444', '没恰到饭', '没恰到饭', '0', '20201121', '1', '20201124205655', '0');
INSERT INTO `one_piece` VALUES ('445', 'LoO', '迪奥变色唇膏004#', '18', '20201119', '1', '20201124205840', '0');
INSERT INTO `one_piece` VALUES ('446', '宣萱', '爱敬气垫粉色13#', '50', '20201202', '1', '20201208143621', '0');
INSERT INTO `one_piece` VALUES ('447', '杨曼云', '海蓝之谜经典面霜30ml，珂润面霜', '120', '20201202', '1', '20201208143624', '0');
INSERT INTO `one_piece` VALUES ('448', '毛毛', '兰蔻菁纯面霜清爽', '162', '20201201', '1', '20201208143612', '0');
INSERT INTO `one_piece` VALUES ('449', '杨洋', '阿玛尼红管405#', '40', '20201203', '1', '20201208143625', '0');
INSERT INTO `one_piece` VALUES ('450', '郭枝涛', 'UGG羊毛袜5双', '20', '20201203', '1', '20201208143635', '0');
INSERT INTO `one_piece` VALUES ('451', '刘莎', 'UGG羊毛袜5双', '10', '20201201', '1', '20201208143619', '0');
INSERT INTO `one_piece` VALUES ('452', '向日葵', '泡菜4斤', '25', '20201201', '1', '20201208143621', '0');
INSERT INTO `one_piece` VALUES ('453', '孙航', '蓝色药丸面膜4盒', '108', '20201209', '1', '20201215114116', '0');
INSERT INTO `one_piece` VALUES ('454', '王心睿', 'SK2小灯泡，海蓝之谜精萃水', '80', '20201213', '1', '20201215171601', '0');
INSERT INTO `one_piece` VALUES ('455', '纳米', '芙丽芳丝洗面奶2支', '35', '20201126', '1', '20201215163520', '0');
INSERT INTO `one_piece` VALUES ('456', '谌倩', '泡菜4斤', '25', '20201127', '1', '20201215163526', '0');
INSERT INTO `one_piece` VALUES ('457', '谌倩', '泡菜4斤', '25', '20201127', '0', '20201215160245', '1');
INSERT INTO `one_piece` VALUES ('458', '伶', 'CURE去角质', '45', '20201126', '1', '20201215163524', '0');
INSERT INTO `one_piece` VALUES ('459', 'LoO', '迪奥变色唇膏004#', '18', '20201125', '1', '20201215163520', '0');
INSERT INTO `one_piece` VALUES ('460', '嘉宁', '纪梵希打底袜2双', '40', '20201130', '1', '20201215163536', '0');
INSERT INTO `one_piece` VALUES ('461', 'CYW', '阿玛尼红管400#', '20', '20201129', '1', '20201215163531', '0');
INSERT INTO `one_piece` VALUES ('462', '超人廖', '泡菜4斤', '25', '20201127', '1', '20201215163526', '0');
INSERT INTO `one_piece` VALUES ('463', '刘莎', 'UGG袜子5双', '10', '20201201', '0', '20201215161152', '1');
INSERT INTO `one_piece` VALUES ('464', '房慧', '纪梵希打底袜2双', '40', '20201128', '1', '20201215163529', '0');
INSERT INTO `one_piece` VALUES ('465', '云朵', '纪梵希打底袜2双', '40', '20201203', '1', '20201215163454', '0');
INSERT INTO `one_piece` VALUES ('466', '云朵', '纪梵希打底袜2双', '40', '20201203', '0', '20201215161507', '1');
INSERT INTO `one_piece` VALUES ('467', '清莞嫂子', '纪梵希打底袜2双', '40', '20201128', '1', '20201215163528', '0');
INSERT INTO `one_piece` VALUES ('468', 'summer君', '宙斯梳子', '102', '20201129', '1', '20201215163533', '0');
INSERT INTO `one_piece` VALUES ('469', '沈花花', '纪梵希打底袜2双', '40', '20201128', '1', '20201215163531', '0');
INSERT INTO `one_piece` VALUES ('470', '沈花花', 'UGG周冬雨同款', '47', '20201129', '1', '20201215163533', '0');
INSERT INTO `one_piece` VALUES ('471', '张平', '纪梵希打底袜', '20', '20201203', '1', '20201215163453', '0');
INSERT INTO `one_piece` VALUES ('472', '樱花雨', 'Takami小蓝瓶精华', '80', '20201204', '1', '20201215163452', '0');
INSERT INTO `one_piece` VALUES ('473', 'however', 'SP-60魔术裤', '38', '20201205', '1', '20201215163451', '0');
INSERT INTO `one_piece` VALUES ('474', '卢启明', '雅诗兰黛樱花水，雅诗兰黛多效智妍霜75ml', '156', '20201205', '1', '20201215163450', '0');
INSERT INTO `one_piece` VALUES ('475', 'la belle', '莆田椰子', '29', '20201205', '1', '20201215163449', '0');
INSERT INTO `one_piece` VALUES ('476', 'la belle', '莆田椰子', '29', '20201205', '0', '20201215162905', '1');
INSERT INTO `one_piece` VALUES ('477', '小舅妈', '敷尔佳白膜', '13', '20201207', '1', '20201215163447', '0');
INSERT INTO `one_piece` VALUES ('478', '嗝', 'UGG帽子2顶', '50', '20201129', '1', '20201215163535', '0');
INSERT INTO `one_piece` VALUES ('479', '嗝', 'UGG帽子2顶', '50', '20201129', '0', '20201215163346', '1');
INSERT INTO `one_piece` VALUES ('480', '意中人', 'UGG羊毛袜5双，兰蔻护手霜2支', '66', '20201208', '1', '20210103184604', '0');
INSERT INTO `one_piece` VALUES ('481', '意中人', 'UGG大喜庆2双', '98', '20201130', '1', '20201215171816', '0');
INSERT INTO `one_piece` VALUES ('482', '范静', '黛珂AQ洗面奶，纪梵希打底袜', '90', '20201203', '1', '20201215164945', '0');
INSERT INTO `one_piece` VALUES ('483', '邓云', 'UGG雪地靴', '82', '20201208', '1', '20201215164953', '0');
INSERT INTO `one_piece` VALUES ('484', 'zyw', 'SP-60魔术裤2条', '76', '20201205', '1', '20201215164949', '0');
INSERT INTO `one_piece` VALUES ('485', '栗子', '狮王牙膏5支', '34', '20201209', '1', '20201215164955', '0');
INSERT INTO `one_piece` VALUES ('486', '丹丹', 'SP-60魔术裤', '38', '20201205', '1', '20201215164950', '0');
INSERT INTO `one_piece` VALUES ('487', 'L', '纪梵希打底袜', '20', '20201128', '1', '20201215171810', '0');
INSERT INTO `one_piece` VALUES ('488', '刘一鸣', '泡菜4斤', '25', '20201127', '1', '20201215171813', '0');
INSERT INTO `one_piece` VALUES ('489', '超级无敌美少女阿', '爱马仕香水套盒', '62', '20201211', '1', '20201215165802', '0');
INSERT INTO `one_piece` VALUES ('490', 'Kkkk', '雪花秀套盒', '135', '20201211', '1', '20201216183853', '0');
INSERT INTO `one_piece` VALUES ('491', '晨晨', 'SP-60魔术裤', '38', '20201211', '1', '20201215165806', '0');
INSERT INTO `one_piece` VALUES ('492', '聪', '海蓝之谜精粹水', '69', '20201208', '1', '20201215165801', '0');
INSERT INTO `one_piece` VALUES ('493', '聪', '海蓝之谜精粹水', '69', '20201208', '0', '20201215165623', '1');
INSERT INTO `one_piece` VALUES ('494', '高飞飞', 'UGG羊毛袜5双', '16', '20201207', '1', '20201215165810', '0');
INSERT INTO `one_piece` VALUES ('495', 'fleur blanche', '兰蔻口红888#', '25', '20201208', '1', '20201215171803', '0');
INSERT INTO `one_piece` VALUES ('496', 'MineJoe', '娇兰金钻粉底液00#', '30', '20201207', '1', '20201215171811', '0');
INSERT INTO `one_piece` VALUES ('497', '最初', 'SK2韩流美肌套盒', '171', '20201215', '1', '20201218145058', '0');
INSERT INTO `one_piece` VALUES ('498', '张双', '悦木之源套盒', '60', '20201211', '1', '20201216183857', '0');
INSERT INTO `one_piece` VALUES ('499', '萨瓦迪卡', '海蓝之谜SOFT面霜60ml', '112', '20201208', '1', '20201215171822', '0');
INSERT INTO `one_piece` VALUES ('500', '程水玲', 'IPSA流金水，IPSA自律乳，JM面膜3盒，芙丽芳丝洗面奶，阿玛尼206#，Mac口红646#', '274', '20201209', '1', '20201218145101', '0');
INSERT INTO `one_piece` VALUES ('501', '许文娟', '海蓝之谜精粹水，希思黎全能乳，娇韵诗双萃精华，香奈儿山茶花洗面奶', '266', '20201215', '1', '20201218145105', '0');
INSERT INTO `one_piece` VALUES ('502', '冯晓琳', '晓姿眼膜，悦薇眼膜', '70', '20201213', '1', '20201215171812', '0');
INSERT INTO `one_piece` VALUES ('503', '晨晨', '后王炸套盒', '100', '20201205', '1', '20201215172302', '0');
INSERT INTO `one_piece` VALUES ('504', '没恰到饭', '没恰到饭', '0', '20201123', '1', '20201215173021', '0');
INSERT INTO `one_piece` VALUES ('505', '没恰到饭', '没恰到饭', '0', '20201206', '1', '20201215173024', '0');
INSERT INTO `one_piece` VALUES ('506', '没恰到饭', '没恰到饭', '0', '20201210', '1', '20201215173025', '0');
INSERT INTO `one_piece` VALUES ('507', '没恰到饭', '没恰到饭', '0', '20201212', '1', '20201215173027', '0');
INSERT INTO `one_piece` VALUES ('508', '没恰到饭', '没恰到饭', '0', '20201214', '1', '20201215173028', '0');
INSERT INTO `one_piece` VALUES ('509', '麻麻', '兰芝隔离紫色', '17', '20201207', '1', '20201215174048', '0');
INSERT INTO `one_piece` VALUES ('510', '王心睿', 'UGG雪地靴', '20', '20201216', '1', '20201216183859', '0');
INSERT INTO `one_piece` VALUES ('511', '婷姐', 'UGG雪地靴', '30', '20201216', '1', '20201216183854', '0');
INSERT INTO `one_piece` VALUES ('512', 'summer君', 'fresh唇膏套盒', '65', '20201215', '1', '20201223092944', '0');
INSERT INTO `one_piece` VALUES ('513', '王乐佳', '雅顿身体乳', '48', '20201216', '1', '20201223093015', '0');
INSERT INTO `one_piece` VALUES ('514', '婷姐', '后航母套盒', '50', '20201216', '1', '20201223093024', '0');
INSERT INTO `one_piece` VALUES ('515', 'summer君', '雅顿身体乳', '56', '20201216', '1', '20201223092945', '0');
INSERT INTO `one_piece` VALUES ('516', '萨瓦迪卡', 'AJ鞋', '80', '20201221', '1', '20201223093020', '0');
INSERT INTO `one_piece` VALUES ('517', '婷姐', '后航母套盒', '50', '20201222', '1', '20201223093024', '0');
INSERT INTO `one_piece` VALUES ('518', '记忆妄想症', '兰蔻睫毛膏套盒', '20', '20201217', '1', '20201223093017', '0');
INSERT INTO `one_piece` VALUES ('519', '柠檬有点甜', '奥尔滨健康水', '65', '20201217', '1', '20201223093014', '0');
INSERT INTO `one_piece` VALUES ('520', '伶', 'UGG护膝', '23', '20201217', '1', '20201223092948', '0');
INSERT INTO `one_piece` VALUES ('521', '婷姐', '后航母套盒', '50', '20201219', '1', '20201223093157', '0');
INSERT INTO `one_piece` VALUES ('522', '张婷', 'IPSA流金水，IPSA自律乳', '142', '20201218', '1', '20201223114341', '0');
INSERT INTO `one_piece` VALUES ('523', '张新秀', '阿玛尼权力粉底液2#', '62', '20201222', '1', '20201227123820', '0');
INSERT INTO `one_piece` VALUES ('524', '宋阿宋', 'UGG兔毛围巾', '25', '20201218', '1', '20201223170709', '0');
INSERT INTO `one_piece` VALUES ('525', '温温', '芭比布朗虫草粉底液W016#', '97', '20201218', '1', '20201223170717', '0');
INSERT INTO `one_piece` VALUES ('526', '似溪美人', 'HACCI洁面皂', '20', '20201218', '1', '20201223170701', '0');
INSERT INTO `one_piece` VALUES ('527', '玩具熊', '悦木之源洗面奶', '45', '20201219', '1', '20201223170734', '0');
INSERT INTO `one_piece` VALUES ('528', '我姓甘', 'Mac小辣椒', '25', '20201219', '1', '20201223170713', '0');
INSERT INTO `one_piece` VALUES ('529', '王寄梅', '雅诗兰黛中样三件套', '90', '20201219', '1', '20201223170723', '0');
INSERT INTO `one_piece` VALUES ('530', 'Mine', '迪奥花漾甜心香水50ml', '50', '20201217', '1', '20201223170852', '0');
INSERT INTO `one_piece` VALUES ('531', '翟伟健', '资生堂悦薇水乳清爽', '112', '20201219', '1', '20201227123831', '0');
INSERT INTO `one_piece` VALUES ('532', 'clever', '雅诗兰黛小棕瓶眼霜', '43', '20201221', '1', '20201227123814', '0');
INSERT INTO `one_piece` VALUES ('533', '潘子婉', '阿玛尼权力粉底液3#', '65', '20201217', '1', '20201223170719', '0');
INSERT INTO `one_piece` VALUES ('534', '余青', '欧莱雅水乳', '90', '20201218', '1', '20201223170707', '0');
INSERT INTO `one_piece` VALUES ('535', '张新秀', '雅诗兰黛333#', '25', '20201222', '1', '20201227123825', '0');
INSERT INTO `one_piece` VALUES ('536', '冯晓琳', '海蓝之谜鎏金水，雪花秀三件套', '135', '20201218', '1', '20201223195913', '0');
INSERT INTO `one_piece` VALUES ('537', '傅佳莉', '娇韵诗弹簧水', '20', '20201217', '1', '20201223195911', '0');
INSERT INTO `one_piece` VALUES ('538', '傅佳莉', '后天气丹套盒', '74', '20201219', '1', '20201223195912', '0');
INSERT INTO `one_piece` VALUES ('539', 'Outsider', '北面雪山羽绒服2件', '80', '20201219', '1', '20201223200109', '0');
INSERT INTO `one_piece` VALUES ('540', '程磊', 'JM燕窝面膜', '27', '20201220', '1', '20201228093023', '0');
INSERT INTO `one_piece` VALUES ('541', '小耳朵', '兰蔻防晒霜清爽', '35', '20201224', '1', '20210101230720', '0');
INSERT INTO `one_piece` VALUES ('542', '向日葵', '兰蔻防晒霜清爽', '35', '20201224', '1', '20210109155613', '0');
INSERT INTO `one_piece` VALUES ('543', 'mangue', '资生堂小钢炮眼霜', '60', '20201224', '1', '20210101230717', '0');
INSERT INTO `one_piece` VALUES ('544', '小雨滴', '雅诗兰黛小棕瓶眼霜，绿色药丸面膜2盒', '102', '20201223', '1', '20210101230724', '0');
INSERT INTO `one_piece` VALUES ('545', '旺仔小牛奶', '呼吸气垫套盒1#', '52', '20201224', '1', '20210101230734', '0');
INSERT INTO `one_piece` VALUES ('546', '小舅妈', 'JM急救补水面膜2盒', '50', '20201221', '1', '20210104134030', '0');
INSERT INTO `one_piece` VALUES ('547', '樱', '美瞳硅水凝胶', '69', '20201225', '1', '20201229203714', '0');
INSERT INTO `one_piece` VALUES ('548', '李诗语', 'YSL气垫B10#', '40', '20201227', '1', '20210101230739', '0');
INSERT INTO `one_piece` VALUES ('549', '就陪你到这', '阿玛尼权利粉底液2#', '64', '20201225', '1', '20210109155620', '0');
INSERT INTO `one_piece` VALUES ('550', 'ali', '美瞳日抛3盒，送小礼物', '162', '20201227', '0', '20210114200000', '0');
INSERT INTO `one_piece` VALUES ('551', '小舅妈', 'AHC补水面膜2盒', '45', '20201225', '1', '20210104134032', '0');
INSERT INTO `one_piece` VALUES ('552', 'Reset', '小MK包包', '70', '20201228', '1', '20201228153548', '0');
INSERT INTO `one_piece` VALUES ('553', '没恰到饭', '没恰到饭', '0', '20201226', '1', '20201228153612', '0');
INSERT INTO `one_piece` VALUES ('554', '徐丽娜', '保暖内衣2套', '42', '20201218', '1', '20210103184609', '0');
INSERT INTO `one_piece` VALUES ('555', '吴越', '敷尔佳白膜，AHC蓝色补水', '36', '20201222', '1', '20201229203657', '0');
INSERT INTO `one_piece` VALUES ('556', '张婷', '资生堂小钢炮眼霜', '50', '20201229', '1', '20210104134045', '0');
INSERT INTO `one_piece` VALUES ('557', '程磊', 'Vidivici女神洗面奶', '52', '20201229', '1', '20201229201759', '0');
INSERT INTO `one_piece` VALUES ('558', '刘丫丫', '久光贴3包', '72', '20201229', '1', '20210103184555', '0');
INSERT INTO `one_piece` VALUES ('559', '向日葵', 'Nars散粉，Nars遮瑕蜜custard#，兰蔻持妆粉底液PO-01#', '190', '20201230', '1', '20210109155617', '0');
INSERT INTO `one_piece` VALUES ('560', '韵达-杭小蓓', '植村秀琥珀卸妆油小样', '28', '20201231', '1', '20210103184607', '0');
INSERT INTO `one_piece` VALUES ('561', '汪小花', '雅诗兰黛微精华原生液400ml', '107', '20210101', '1', '20210109155625', '0');
INSERT INTO `one_piece` VALUES ('562', '沙茹', '后水妍四件套', '120', '20210104', '1', '20210114220955', '0');
INSERT INTO `one_piece` VALUES ('563', '沈花花', '卡诗发膜', '55', '20210103', '0', '20210104152937', '0');
INSERT INTO `one_piece` VALUES ('564', '没恰到饭', '没恰到饭', '0', '20210102', '1', '20210104153008', '0');
INSERT INTO `one_piece` VALUES ('565', '徐丽娜', '保暖内衣2套', '46', '20210104', '1', '20210104162641', '0');
INSERT INTO `one_piece` VALUES ('566', 'summer君', '雅诗兰黛333#，YSL圆管76#，小收纳袋', '56', '20210104', '0', '20210115105415', '0');
INSERT INTO `one_piece` VALUES ('567', '刘蓉蓉', '德妃水乳，珂润面霜', '85', '20210104', '0', '20210104220301', '0');
INSERT INTO `one_piece` VALUES ('568', '刘涵', 'UGG雪地靴', '60', '20210105', '1', '20210105110111', '0');
INSERT INTO `one_piece` VALUES ('569', '记忆妄想症', '雅诗兰黛红石榴洗面奶，YSL口红76#，玫瑰营养面膜', '110', '20210105', '0', '20210105220623', '0');
INSERT INTO `one_piece` VALUES ('570', '丹丹', 'SK2大红瓶面霜80g清爽', '82', '20210105', '1', '20210111200824', '0');
INSERT INTO `one_piece` VALUES ('571', '张婷（170未付）', 'YSL小金条11#', '35', '20210106', '0', '20210113223734', '0');
INSERT INTO `one_piece` VALUES ('572', '美女小战士', 'POLA沐浴露', '52', '20210106', '1', '20210109155637', '0');
INSERT INTO `one_piece` VALUES ('573', '余莉', '兰蔻粉水，FANCL卸妆油', '95', '20210107', '1', '20210111200820', '0');
INSERT INTO `one_piece` VALUES ('574', 'Yy', 'YSL黑管416#', '45', '20210107', '1', '20210113204219', '0');
INSERT INTO `one_piece` VALUES ('575', '向日葵', '科颜氏金盏花水500ml', '80', '20210108', '1', '20210113204222', '0');
INSERT INTO `one_piece` VALUES ('576', '萨瓦迪卡', 'IPSA遮瑕盘', '22', '20210108', '0', '20210110113831', '0');
INSERT INTO `one_piece` VALUES ('577', '陈沁夷', '兰蔻小黑瓶精华100ml', '90', '20210109', '1', '20210113204229', '0');
INSERT INTO `one_piece` VALUES ('578', '万能的小包包', 'YSL小金条11#', '25', '20210111', '0', '20210111084537', '0');
INSERT INTO `one_piece` VALUES ('579', '钟小姐', '珂润面霜', '22', '20210112', '1', '20210113204420', '0');
INSERT INTO `one_piece` VALUES ('580', '没恰到饭', '没恰到饭', '0', '20210110', '1', '20210113204429', '0');
INSERT INTO `one_piece` VALUES ('581', '约翰 小明', 'FILA火星鞋', '58', '20210113', '1', '20210113223817', '0');
INSERT INTO `one_piece` VALUES ('582', '傅琳', '蓝色药丸面膜2盒，资生堂洗面奶', '69', '20210111', '0', '20210115103654', '0');
INSERT INTO `one_piece` VALUES ('583', '小胖纸', 'YSL口红409#', '33', '20210111', '0', '20210115103810', '0');
INSERT INTO `one_piece` VALUES ('584', '晓晓', '尔木萄星空套装', '24', '20210113', '0', '20210115104012', '0');
INSERT INTO `one_piece` VALUES ('585', '猿猿哥', 'PJ搪瓷隔离01#', '24', '20210113', '0', '20210115104145', '0');
INSERT INTO `one_piece` VALUES ('586', '绵绵', '尔木萄洗脸巾3包', '24', '20210113', '0', '20210115104258', '0');
INSERT INTO `one_piece` VALUES ('587', '记忆妄想症', '海蓝之谜精粹水，海蓝之谜眼霜，YSL唇釉433#，YSL唇油409#', '240', '20210113', '0', '20210115104658', '0');
INSERT INTO `one_piece` VALUES ('588', '皇冠', '尔木萄唇釉WS05#，MT05#，尔木萄唇膏套盒', '56', '20210114', '0', '20210115104859', '0');
INSERT INTO `one_piece` VALUES ('589', '岳奕伶', '美瞳硅水凝胶650、750度', '80', '20210114', '0', '20210115105017', '0');
INSERT INTO `one_piece` VALUES ('590', '马薇', '宫中秘策套盒', '74', '20210114', '0', '20210115105130', '0');
INSERT INTO `one_piece` VALUES ('591', '何女生', '宫中秘策套盒，尔木萄修眉刀', '91', '20210114', '0', '20210115105257', '0');
INSERT INTO `one_piece` VALUES ('592', '夏', '美瞳硅水凝胶550、400度', '80', '20210114', '0', '20210115105330', '0');
INSERT INTO `one_piece` VALUES ('593', 'summer君', '海蓝之谜精粹水', '60', '20210112', '0', '20210115105502', '0');
INSERT INTO `one_piece` VALUES ('594', '文芳', 'POLA黑BA洗面奶', '112', '20210115', '0', '20210115105617', '0');
INSERT INTO `one_piece` VALUES ('595', '小羊儿', '阿玛尼寄情香水30ml', '42', '20210115', '0', '20210115105714', '0');
INSERT INTO `one_piece` VALUES ('596', '一个小太阳', '宫中秘策套盒', '76', '20210115', '0', '20210115105804', '0');
INSERT INTO `one_piece` VALUES ('597', '傅佳莉', 'SK2小灯泡，雅诗兰黛肌原液200ml', '94', '20210114', '0', '20210115110142', '0');

-- ----------------------------
-- Table structure for photo_album
-- ----------------------------
DROP TABLE IF EXISTS `photo_album`;
CREATE TABLE `photo_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_album_date` varchar(255) NOT NULL,
  `photo_album_url` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo_album
-- ----------------------------
INSERT INTO `photo_album` VALUES ('11', '202008', 'http://www.kiwilovedaisy.com:8080/image/photo_album/IMG_3490(20200903-143207)20200903143254.JPG', '20200903143254', '0');
INSERT INTO `photo_album` VALUES ('12', '202007', 'http://www.kiwilovedaisy.com:8080/image/photo_album/IMG_3491(20200903-161432)20200903161511.JPG', '20200903161511', '0');
INSERT INTO `photo_album` VALUES ('13', '202006', 'http://www.kiwilovedaisy.com:8080/image/photo_album/IMG_3492(20200903-162221)20200903162259.JPG', '20200903162259', '0');
INSERT INTO `photo_album` VALUES ('14', '202009', 'http://www.kiwilovedaisy.com:8080/image/photo_album/IMG_3575(20200908-142238)20200908142322.JPG', '20200908142322', '0');
INSERT INTO `photo_album` VALUES ('15', '202010', 'http://www.kiwilovedaisy.com:8080/image/photo_album/IMG_5642(20201030-104203)20201030104305.JPG', '20201030104305', '0');

-- ----------------------------
-- Table structure for photo_information
-- ----------------------------
DROP TABLE IF EXISTS `photo_information`;
CREATE TABLE `photo_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_name` varchar(255) NOT NULL,
  `photo_remark` varchar(255) NOT NULL,
  `photo_album_id` int(11) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo_information
-- ----------------------------
INSERT INTO `photo_information` VALUES ('11', '生日和宝宝一起吃日料', '在点餐的宝宝也是那么迷人~', '11', '20200903143716', 'http://www.kiwilovedaisy.com:8080/image/2020年 08月/QQ图片2020090116543920200903143716.jpg', '0');
INSERT INTO `photo_information` VALUES ('12', '拿着大虾肉的我', 'iPhone的后置真的是一言难尽啊', '11', '20200903143815', 'http://www.kiwilovedaisy.com:8080/image/2020年 08月/QQ图片2020090116544620200903143815.jpg', '0');
INSERT INTO `photo_information` VALUES ('13', '做鲜虾厚蛋烧给宝宝吃', '8月14号，第一次做鲜虾厚蛋烧，很成功呀，就是滑蛋有点太多了', '11', '20200903160721', 'http://www.kiwilovedaisy.com:8080/image/2020年 08月/QQ图片2020090315590420200903160721.jpg', '0');
INSERT INTO `photo_information` VALUES ('14', '牛排、拌饭和电影', '7月31号，做了牛排和韩式拌饭，一起看电影活着', '12', '20200903161740', 'http://www.kiwilovedaisy.com:8080/image/2020年 07月/QQ图片2020090316151320200903161740.jpg', '0');
INSERT INTO `photo_information` VALUES ('15', '这个真超好吃，就是热量爆炸', '7月5号，做了很成功的芝士牛排饭，就是热量太高了哈哈哈', '12', '20200903161911', 'http://www.kiwilovedaisy.com:8080/image/2020年 07月/QQ图片2020090316175920200903161911.jpg', '0');
INSERT INTO `photo_information` VALUES ('16', '看着简单，做起来巨难的寿司', '7月12号，怎么都捏不紧的寿司，才发现做寿司也是技术活', '12', '20200903162013', 'http://www.kiwilovedaisy.com:8080/image/2020年 07月/QQ图片2020090316190420200903162013.jpg', '0');
INSERT INTO `photo_information` VALUES ('17', '虾仁拌饭', '6月26号，辛勤的三十五不仅做了韩式拌饭，还剥出了虾肉', '13', '20200903162349', 'http://www.kiwilovedaisy.com:8080/image/2020年 06月/QQ图片2020090316223620200903162349.jpg', '0');
INSERT INTO `photo_information` VALUES ('18', '超好吃的牛舌', '6月25号，这个牛舌真的惊艳到我了，入口即化，浓郁的牛肉香味，赞！', '13', '20200903162637', 'http://www.kiwilovedaisy.com:8080/image/2020年 06月/IMG_140120200903162637.JPG', '0');
INSERT INTO `photo_information` VALUES ('19', '好吃的~咸菜~', '做咸了，如果少放盐的话，这两道菜将绝杀~', '14', '20200908142606', 'http://www.kiwilovedaisy.com:8080/image/2020年 09月/QQ图片2020090814163820200908142606.jpg', '0');
INSERT INTO `photo_information` VALUES ('20', '好看的电影和好看的天空', '这电影是真的烧脑，但是看完电影再看影评会有种恍然大悟的感觉', '14', '20200908142904', 'http://www.kiwilovedaisy.com:8080/image/2020年 09月/QQ图片2020090814263320200908142904.jpg', '0');
INSERT INTO `photo_information` VALUES ('21', '好看的电影和好看的天空', '周末开着车带着宝宝出去玩，哪怕是简单地看一场电影，也像一场旅行一样让人愉悦', '14', '20200908143108', 'http://www.kiwilovedaisy.com:8080/image/2020年 09月/QQ图片2020090814263720200908143108.jpg', '0');
INSERT INTO `photo_information` VALUES ('22', '好看的电影和好看的天空', '这天空的颜色真让人舒服', '14', '20200908143204', 'http://www.kiwilovedaisy.com:8080/image/2020年 09月/QQ图片2020090814264220200908143204.jpg', '0');
INSERT INTO `photo_information` VALUES ('23', '迟到的七夕午餐', '上班偷偷溜出来跟宝宝一起吃一顿美美的七夕午餐，奶茶好喝肉好吃~', '11', '20200908151753', 'http://www.kiwilovedaisy.com:8080/image/2020年 08月/IMG_3258(20200826-123801)20200908151753.JPG', '0');
INSERT INTO `photo_information` VALUES ('24', '生日夜宵', '生日的晚上跟宝宝在酒店点夜宵吃，虽然没有那么好吃（谁让自己做的东西太好吃了，哈哈），但是我超级喜欢这个感觉，这个氛围~', '11', '20200908152303', 'http://www.kiwilovedaisy.com:8080/image/2020年 08月/IMG_3014(20200908-151924)20200908152303.JPG', '0');
INSERT INTO `photo_information` VALUES ('25', '好次的四川菜', '这种菜要很久吃一次才觉得好吃，但是吃着吃着又感觉太咸了，我和宝宝的口味都变淡了呀', '14', '20200909112832', 'http://www.kiwilovedaisy.com:8080/image/2020年 09月/8D7EFE23-90C8-4780-B8EA-A9FCDB8B08BD20200909112832.jpeg', '0');
INSERT INTO `photo_information` VALUES ('26', '周末跟宝宝一起吃炸鸡翅', '鸡翅有点淡了，料酒也有点放多了，感觉有好多地方需要改进，而且一次吃太多鸡翅真的会腻啊', '14', '20200914103758', 'http://www.kiwilovedaisy.com:8080/image/2020年 09月/41C73E3F-8EA9-4E8D-97DB-ECF77B1A57ED20200914103758.jpeg', '0');
INSERT INTO `photo_information` VALUES ('27', '跟宝宝一起去山姆啦', '这个是我～', '14', '20200928164620', 'http://www.kiwilovedaisy.com:8080/image/2020年 09月/D4067265-2B6E-4B1F-B05D-C53609AAB21420200928164620.jpeg', '0');
INSERT INTO `photo_information` VALUES ('28', '跟宝宝一起去山姆啦', '这个是宝宝～', '14', '20200928165048', 'http://www.kiwilovedaisy.com:8080/image/2020年 09月/7C0E3605-C5A1-479B-B9A5-DA5F69AC7E1B20200928165048.jpeg', '0');
INSERT INTO `photo_information` VALUES ('29', '鲜虾娃娃菜', '真不错～鲜虾娃娃菜真不错～', '14', '20200928165200', 'http://www.kiwilovedaisy.com:8080/image/2020年 09月/2F86CA05-5BDF-43AC-8F40-2CCB124B92B520200928165200.jpeg', '0');
INSERT INTO `photo_information` VALUES ('30', '这龙虾不错', '我觉得龙虾比帝王蟹好吃，哈哈～', '15', '20201030104635', 'http://www.kiwilovedaisy.com:8080/image/2020年 10月/DA6EADC5-D6F0-4B2C-9D39-030E1A357A1120201030104635.jpeg', '0');
INSERT INTO `photo_information` VALUES ('31', '一对可爱的小娃娃', '抽盲盒正好抽了一对CP，运气不错', '15', '20201030104904', 'http://www.kiwilovedaisy.com:8080/image/2020年 10月/8A3A408D-DA9C-4E78-AA66-6D497477F5C020201030104904.jpeg', '0');
INSERT INTO `photo_information` VALUES ('32', '来找全身合照', '和宝宝在MUJI拍张照～', '15', '20201030105005', 'http://www.kiwilovedaisy.com:8080/image/2020年 10月/77D7DD58-40AE-4C67-898A-2D82C91D78D020201030105005.jpeg', '0');
INSERT INTO `photo_information` VALUES ('33', '鹅肝好吃', '这份鹅肝寿司还是不错的', '15', '20201030105043', 'http://www.kiwilovedaisy.com:8080/image/2020年 10月/960C39A5-0BB8-423C-AA85-008938772B8820201030105043.jpeg', '0');
INSERT INTO `photo_information` VALUES ('34', '来看帝王蟹', '付大厨已经上线～', '15', '20201030105402', 'http://www.kiwilovedaisy.com:8080/image/2020年 10月/9B909F3E-611D-4C2C-A699-82632F7A6FC920201030105402.jpeg', '0');
INSERT INTO `photo_information` VALUES ('35', '烤羊排', '山姆这个羊排性价比是真的高～', '15', '20201030105429', 'http://www.kiwilovedaisy.com:8080/image/2020年 10月/E2316F33-9A95-4374-BCD2-D2CD13110A2820201030105429.jpeg', '0');
INSERT INTO `photo_information` VALUES ('36', '一大锅大骨汤', '稍微有点翻车，还有很大的改进空间', '15', '20201030105516', 'http://www.kiwilovedaisy.com:8080/image/2020年 10月/1A81FEC0-2686-46E2-A62C-14AED2799E1220201030105516.jpeg', '0');
INSERT INTO `photo_information` VALUES ('37', '来碗卤肉饭', '卤肉饭还是不错的，就是稍微甜了一些～', '15', '20201030105556', 'http://www.kiwilovedaisy.com:8080/image/2020年 10月/110291C9-CFDC-45F1-BA52-EA1BF57C549120201030105556.jpeg', '0');

-- ----------------------------
-- Table structure for shouru
-- ----------------------------
DROP TABLE IF EXISTS `shouru`;
CREATE TABLE `shouru` (
  `shouru_id` int(11) NOT NULL AUTO_INCREMENT,
  `shouru_money` double(100,2) NOT NULL,
  `shouru_time` bigint(20) NOT NULL,
  PRIMARY KEY (`shouru_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

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
INSERT INTO `shouru` VALUES ('56', '4030.44', '20200626');
INSERT INTO `shouru` VALUES ('57', '2807.85', '20200627');
INSERT INTO `shouru` VALUES ('58', '1542.67', '20200628');
INSERT INTO `shouru` VALUES ('59', '1702.53', '20200629');
INSERT INTO `shouru` VALUES ('60', '2114.80', '20200630');
INSERT INTO `shouru` VALUES ('61', '1811.47', '20200701');
INSERT INTO `shouru` VALUES ('62', '1559.30', '20200702');
INSERT INTO `shouru` VALUES ('63', '2588.32', '20200703');
INSERT INTO `shouru` VALUES ('64', '2780.80', '20200704');
INSERT INTO `shouru` VALUES ('65', '2005.04', '20200705');
INSERT INTO `shouru` VALUES ('66', '1608.05', '20200706');
INSERT INTO `shouru` VALUES ('67', '2055.58', '20200707');
INSERT INTO `shouru` VALUES ('68', '2273.78', '20200708');
INSERT INTO `shouru` VALUES ('69', '2304.84', '20200709');
INSERT INTO `shouru` VALUES ('70', '2223.59', '20200710');
INSERT INTO `shouru` VALUES ('71', '2395.00', '20200711');
INSERT INTO `shouru` VALUES ('72', '3099.14', '20200712');
INSERT INTO `shouru` VALUES ('73', '2234.76', '20200714');
INSERT INTO `shouru` VALUES ('74', '2016.16', '20200715');
INSERT INTO `shouru` VALUES ('75', '1804.14', '20200716');
INSERT INTO `shouru` VALUES ('76', '2088.50', '20200717');
INSERT INTO `shouru` VALUES ('77', '1685.14', '20200718');
INSERT INTO `shouru` VALUES ('78', '2425.99', '20200719');
INSERT INTO `shouru` VALUES ('79', '2249.42', '20200720');
INSERT INTO `shouru` VALUES ('80', '1783.38', '20200713');
INSERT INTO `shouru` VALUES ('81', '2216.58', '20200721');
INSERT INTO `shouru` VALUES ('82', '2068.93', '20200722');
INSERT INTO `shouru` VALUES ('83', '2041.36', '20200723');
INSERT INTO `shouru` VALUES ('84', '2082.33', '20200724');
INSERT INTO `shouru` VALUES ('85', '2860.61', '20200725');
INSERT INTO `shouru` VALUES ('86', '2359.48', '20200726');
INSERT INTO `shouru` VALUES ('87', '2049.37', '20200727');
INSERT INTO `shouru` VALUES ('88', '2122.92', '20200728');
INSERT INTO `shouru` VALUES ('89', '2592.10', '20200729');
INSERT INTO `shouru` VALUES ('90', '2103.88', '20200730');
INSERT INTO `shouru` VALUES ('91', '2554.00', '20200731');
INSERT INTO `shouru` VALUES ('92', '2059.88', '20200801');
INSERT INTO `shouru` VALUES ('93', '2378.20', '20200802');
INSERT INTO `shouru` VALUES ('94', '1060.76', '20200803');
INSERT INTO `shouru` VALUES ('95', '2191.40', '20200804');
INSERT INTO `shouru` VALUES ('96', '2303.44', '20200805');
INSERT INTO `shouru` VALUES ('97', '1938.29', '20200806');
INSERT INTO `shouru` VALUES ('98', '1505.50', '20200807');
INSERT INTO `shouru` VALUES ('99', '1706.49', '20200808');
INSERT INTO `shouru` VALUES ('100', '1815.90', '20200809');

-- ----------------------------
-- Table structure for t_customers
-- ----------------------------
DROP TABLE IF EXISTS `t_customers`;
CREATE TABLE `t_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `
customer_name` varchar(255) NOT NULL COMMENT '顾客微信名',
  `
customer_address` varchar(255) NOT NULL COMMENT '顾客收货地址',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否使用（0：否；1：是）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customers
-- ----------------------------

-- ----------------------------
-- Table structure for t_products
-- ----------------------------
DROP TABLE IF EXISTS `t_products`;
CREATE TABLE `t_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_name` varchar(255) NOT NULL COMMENT '商品名称',
  `product_price` int(11) NOT NULL COMMENT '商品卖价',
  `product_cost` int(11) DEFAULT NULL COMMENT '商品成本',
  `product_profit` int(11) DEFAULT NULL COMMENT '商品利润',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_use` int(11) NOT NULL DEFAULT '1' COMMENT '是否使用（0：否；1：是）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_products
-- ----------------------------

-- ----------------------------
-- Table structure for touzi
-- ----------------------------
DROP TABLE IF EXISTS `touzi`;
CREATE TABLE `touzi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_power` int(11) NOT NULL COMMENT '0：全部；1：只能查看',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'daisy', '863547d9c2daf5bd088f365163ad784', '0');
INSERT INTO `user` VALUES ('2', 'kiwi', 'c38e82290607134fadcfd1a6158edde8', '1');

-- ----------------------------
-- Table structure for zhichu
-- ----------------------------
DROP TABLE IF EXISTS `zhichu`;
CREATE TABLE `zhichu` (
  `zhichu_id` int(11) NOT NULL AUTO_INCREMENT,
  `zhichu_name` varchar(255) DEFAULT NULL,
  `zhichu_money` double(100,2) NOT NULL,
  `zhichu_time` bigint(20) NOT NULL,
  PRIMARY KEY (`zhichu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

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
INSERT INTO `zhichu` VALUES ('81', '店长合肥路费', '165.00', '20200616');
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
INSERT INTO `zhichu` VALUES ('92', '电费', '516.60', '20200517');
INSERT INTO `zhichu` VALUES ('93', '筒灯和线开关', '150.00', '20200506');
INSERT INTO `zhichu` VALUES ('94', '风幕机', '1400.00', '20200520');
INSERT INTO `zhichu` VALUES ('95', '水果（金桔）', '23.50', '20200524');
INSERT INTO `zhichu` VALUES ('96', '兼职发传单', '200.00', '20200524');
INSERT INTO `zhichu` VALUES ('97', '车雨琳开业奖励', '50.00', '20200527');
INSERT INTO `zhichu` VALUES ('98', '胡亚琴开业奖励', '50.00', '20200527');
INSERT INTO `zhichu` VALUES ('99', '开业文宣制作', '346.00', '20200528');
INSERT INTO `zhichu` VALUES ('100', '姚云支援丹阳5天', '500.00', '20200531');
INSERT INTO `zhichu` VALUES ('101', '小柏支援1天', '100.00', '20200531');
INSERT INTO `zhichu` VALUES ('102', '冷链运费', '60.00', '20200511');
INSERT INTO `zhichu` VALUES ('103', '进货', '6693.50', '20200522');
INSERT INTO `zhichu` VALUES ('104', '运费', '110.00', '20200528');
INSERT INTO `zhichu` VALUES ('105', '儿童节红包', '20.00', '20200601');
INSERT INTO `zhichu` VALUES ('106', '养乐多', '60.00', '20200602');
INSERT INTO `zhichu` VALUES ('107', '水果，养乐多', '89.00', '20200604');
INSERT INTO `zhichu` VALUES ('108', '挂钩', '16.80', '20200604');
INSERT INTO `zhichu` VALUES ('109', '垃圾袋', '33.24', '20200604');
INSERT INTO `zhichu` VALUES ('110', '淘宝柠檬', '50.00', '20200604');
INSERT INTO `zhichu` VALUES ('111', '淘宝金桔', '23.50', '20200605');
INSERT INTO `zhichu` VALUES ('112', '群活动红包', '5.00', '20200610');
INSERT INTO `zhichu` VALUES ('113', '水果', '9.00', '20200610');
INSERT INTO `zhichu` VALUES ('114', '两箱纸巾', '54.80', '20200611');
INSERT INTO `zhichu` VALUES ('115', '水果', '9.00', '20200611');
INSERT INTO `zhichu` VALUES ('116', '去丹阳带货', '15.00', '20200615');
INSERT INTO `zhichu` VALUES ('117', '群活动红包', '5.00', '20200616');
INSERT INTO `zhichu` VALUES ('118', '水果', '12.00', '20200617');
INSERT INTO `zhichu` VALUES ('119', '水果', '14.00', '20200618');
INSERT INTO `zhichu` VALUES ('120', '亚克力A4', '9.41', '20200618');
INSERT INTO `zhichu` VALUES ('121', '保鲜膜', '9.90', '20200618');
INSERT INTO `zhichu` VALUES ('122', '水果', '12.00', '20200618');
INSERT INTO `zhichu` VALUES ('123', '水果', '23.00', '20200619');
INSERT INTO `zhichu` VALUES ('124', '水果', '23.90', '20200619');
INSERT INTO `zhichu` VALUES ('125', '淘宝金桔', '22.50', '20200619');
INSERT INTO `zhichu` VALUES ('126', '水果', '15.00', '20200620');
INSERT INTO `zhichu` VALUES ('127', '考试奖励', '27.63', '20200621');
INSERT INTO `zhichu` VALUES ('128', '水果', '5.00', '20200623');
INSERT INTO `zhichu` VALUES ('129', '电费', '1335.98', '20200623');
INSERT INTO `zhichu` VALUES ('130', '水果', '17.80', '20200624');
INSERT INTO `zhichu` VALUES ('131', '淘宝金桔', '22.50', '20200624');
INSERT INTO `zhichu` VALUES ('132', '端午节红包', '40.00', '20200625');
INSERT INTO `zhichu` VALUES ('133', '水果', '38.00', '20200625');
INSERT INTO `zhichu` VALUES ('134', '养乐多', '60.00', '20200625');
INSERT INTO `zhichu` VALUES ('135', '水果', '11.00', '20200625');
INSERT INTO `zhichu` VALUES ('136', '超市日用品', '9.00', '20200626');
INSERT INTO `zhichu` VALUES ('137', '鲜果文宣', '150.00', '20200626');
INSERT INTO `zhichu` VALUES ('138', '养乐多', '60.00', '20200626');
INSERT INTO `zhichu` VALUES ('139', '玻璃水', '16.66', '20200626');
INSERT INTO `zhichu` VALUES ('140', '淘宝柠檬', '45.00', '20200626');
INSERT INTO `zhichu` VALUES ('141', '水果', '23.00', '20200627');
INSERT INTO `zhichu` VALUES ('142', '杨枝甘露制作包', '356.00', '20200627');
INSERT INTO `zhichu` VALUES ('143', '84消毒液', '8.00', '20200627');
INSERT INTO `zhichu` VALUES ('144', '群活动红包', '5.00', '20200628');
INSERT INTO `zhichu` VALUES ('145', '养乐多', '84.00', '20200628');
INSERT INTO `zhichu` VALUES ('146', '店里聚餐', '260.00', '20200628');
INSERT INTO `zhichu` VALUES ('147', '葡萄罐头', '66.00', '20200628');
INSERT INTO `zhichu` VALUES ('148', '水果', '10.00', '20200629');
INSERT INTO `zhichu` VALUES ('149', '群活动红包', '5.00', '20200629');
INSERT INTO `zhichu` VALUES ('150', '进货', '5186.20', '20200601');
INSERT INTO `zhichu` VALUES ('151', '进货运费', '302.00', '20200601');
INSERT INTO `zhichu` VALUES ('152', '进货-养乐多', '232.00', '20200601');
INSERT INTO `zhichu` VALUES ('153', '进货-橙子', '58.50', '20200601');
INSERT INTO `zhichu` VALUES ('154', '进货-冷链', '1698.00', '20200610');
INSERT INTO `zhichu` VALUES ('155', '运费-冷链', '40.00', '20200610');
INSERT INTO `zhichu` VALUES ('156', '进货', '4310.10', '20200616');
INSERT INTO `zhichu` VALUES ('157', '运费', '303.00', '20200616');
INSERT INTO `zhichu` VALUES ('158', '进货', '5571.50', '20200622');
INSERT INTO `zhichu` VALUES ('159', '运费', '232.00', '20200622');
INSERT INTO `zhichu` VALUES ('160', '进货-冷链', '1804.00', '20200622');
INSERT INTO `zhichu` VALUES ('161', '运费-冷链', '60.00', '20200622');
INSERT INTO `zhichu` VALUES ('162', '进货', '4551.90', '20200629');
INSERT INTO `zhichu` VALUES ('163', '运费', '284.00', '20200629');
INSERT INTO `zhichu` VALUES ('164', '进货-冷链', '1322.00', '20200629');
INSERT INTO `zhichu` VALUES ('165', '运费-冷链', '40.00', '20200629');
