/*
Navicat MySQL Data Transfer

Source Server         : 47.100.176.61
Source Server Version : 50649
Source Host           : 47.100.176.61:3306
Source Database       : one_piece

Target Server Type    : MYSQL
Target Server Version : 50649
File Encoding         : 65001

Date: 2020-09-01 16:40:26
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for one_piece
-- ----------------------------
DROP TABLE IF EXISTS `one_piece`;
CREATE TABLE `one_piece` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识，主键自增长',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '购买者微信名',
  `goods_name` varchar(255) DEFAULT NULL COMMENT '购买的商品名',
  `profit` int(11) DEFAULT NULL COMMENT '净利润',
  `date` int(11) DEFAULT NULL COMMENT '购买的日期',
  `is_deliver` int(11) NOT NULL DEFAULT '0' COMMENT '是否已发货（0：未发；1：已发）',
  `update_time` varchar(255) DEFAULT NULL COMMENT '信息更新的时间',
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`),
  KEY `index_one_piece_date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

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
INSERT INTO `one_piece` VALUES ('9', '我这个暴脾气', '蓝色药丸面膜', '42', '20200709', '1', '20200731170817', '0');
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
INSERT INTO `one_piece` VALUES ('28', '岳奕伶', '天气丹套盒，美瞳', '297', '20200701', '1', '20200731170329', '0');
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
INSERT INTO `one_piece` VALUES ('169', '韵达燕子', '怡丽丝尔水乳清爽，美妆刷，美妆蛋2套', '156', '20200830', '0', '20200830215637', '0');
INSERT INTO `one_piece` VALUES ('170', '阴阳师-小白', '美妆刷', '20', '20200830', '0', '20200830180152', '0');
INSERT INTO `one_piece` VALUES ('171', '小舅妈', '雅诗兰黛多效智妍面霜', '60', '20200830', '1', '20200830220536', '0');
INSERT INTO `one_piece` VALUES ('172', '吴兆燃', 'FILA猫爪鞋', '40', '20200830', '1', '20200830220539', '0');
INSERT INTO `one_piece` VALUES ('173', '栗子', '美妆刷', '20', '20200831', '0', '20200831152159', '0');
INSERT INTO `one_piece` VALUES ('174', '黄梅', '分装瓶', '10', '20200831', '0', '20200831144727', '0');
INSERT INTO `one_piece` VALUES ('175', '余雪', '美妆蛋，美瞳250度2副', '130', '20200831', '0', '20200831144857', '0');
INSERT INTO `one_piece` VALUES ('176', '齐子仪', '美妆刷', '20', '20200831', '0', '20200831152145', '0');
INSERT INTO `one_piece` VALUES ('177', '沈花花', '雅诗兰黛DW粉底液1C1#，美妆蛋', '71', '20200831', '0', '20200901085421', '0');
INSERT INTO `one_piece` VALUES ('178', '罗彦婷', '美妆蛋，美妆刷', '33', '20200831', '0', '20200901085510', '0');
INSERT INTO `one_piece` VALUES ('179', '许文娟（9月10号后发货）', '香奈儿洗面奶2支，欧舒丹护手霜2支', '98', '20200831', '0', '20200901085705', '0');
INSERT INTO `one_piece` VALUES ('180', '孙芳宜', '罗拉散粉', '52', '20200901', '0', '20200901093131', '0');

-- ----------------------------
-- Table structure for photo_information
-- ----------------------------
DROP TABLE IF EXISTS `photo_information`;
CREATE TABLE `photo_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_name` varchar(255) NOT NULL,
  `photo_remark` varchar(255) NOT NULL,
  `photo_date` varchar(255) NOT NULL,
  `update_time` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `is_del` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除（0：否；1：是）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo_information
-- ----------------------------
INSERT INTO `photo_information` VALUES ('3', '美美哒宝宝', '这美好的回忆模块上传的第一张照片，当然要选一张美美哒宝宝啦~', '202009', '20200901103622', 'http://www.kiwilovedaisy.com:8080/image/202009/美美哒宝宝20200901103622.JPG', '0');
INSERT INTO `photo_information` VALUES ('6', '超有气质的宝宝', '第二张照片是超有气质的宝宝，其实我主要是想试一试排版效果怎么样', '202009', '20200901160136', 'http://www.kiwilovedaisy.com:8080/image/202009/IMG_3019(20200821-050359)20200901160136.JPG', '0');

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
