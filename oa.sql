/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : oa

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 05/10/2019 16:49:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for analysis
-- ----------------------------
DROP TABLE IF EXISTS `analysis`;
CREATE TABLE `analysis`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simpledis` varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detaileddis` varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` date NULL DEFAULT NULL,
  `updatetime` date NULL DEFAULT NULL,
  `remark` varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `analysis_ibfk_1` FOREIGN KEY (`id`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of analysis
-- ----------------------------
INSERT INTO `analysis` VALUES (1, '人力资源管理系统', '人力资源管理系统需求分析', '该分析为最终需求', '可以进行人力资管理', '2019-06-09', '2019-06-09', '请参考需求分析');
INSERT INTO `analysis` VALUES (2, 'ERP管理系统', 'ERP管理系统需求分析', '该ERP可以实现很多功能', '该ERP可以实现很多功能', '2019-06-09', '2019-06-09', '该ERP可以实现很多功能');
INSERT INTO `analysis` VALUES (3, 'OA自动办公系统', 'OA自动办公系统需求分析', '可以实现员工管理', '可以实现让员工的考勤、打卡、邮箱、办公等功能。', '2019-06-09', '2019-06-09', '参考需求分析');
INSERT INTO `analysis` VALUES (4, '财务核算系', '财务核算系需求分', '包括月财务核算等', '包括月财务核算等', '2019-06-13', '2019-06-13', '包括月财务核算等');
INSERT INTO `analysis` VALUES (6, '医疗系统', '医疗服务', '完善医疗系统', '完善医疗系统户口', '2019-09-25', '2019-09-25', '参考需求分析');

-- ----------------------------
-- Table structure for archives
-- ----------------------------
DROP TABLE IF EXISTS `archives`;
CREATE TABLE `archives`  (
  `dnum` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `landline` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固话',
  `school` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `zhuanye` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `sosperson` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `biyedate` date NULL DEFAULT NULL COMMENT '毕业时间',
  `zzmm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `minzu` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `xueli` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `emp_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`dnum`) USING BTREE,
  INDEX `emp_fk`(`emp_fk`) USING BTREE,
  CONSTRAINT `archives_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_fk` int(11) NULL DEFAULT NULL,
  `attname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attdis` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadtime` date NULL DEFAULT NULL,
  `updatetime` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKhdq50yhhjhdiyfm03xjohqlki`(`pro_fk`) USING BTREE,
  CONSTRAINT `FKhdq50yhhjhdiyfm03xjohqlki` FOREIGN KEY (`pro_fk`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`pro_fk`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES (1, 1, '资源管理系统附件', '关于bug的修正', '无', 'file/13/8/maven.txt', '2019-06-04', '2019-07-19');
INSERT INTO `attachment` VALUES (2, 1, '资源管理系统附件', '关于bug的修正', '无', 'file/13/8/maven.txt', '2019-06-01', '2019-07-24');
INSERT INTO `attachment` VALUES (12, 1, '资源管理系统附件', '关于bug的修正222', 'qqqq', 'file/6/9/attatchmentinfo.xls', '2019-08-01', '2019-08-11');
INSERT INTO `attachment` VALUES (13, 2, 'ERP测试', 'ERP测试文件', '无', 'a4bf0aca4a14ERP.xls', '2019-09-27', '2019-09-27');

-- ----------------------------
-- Table structure for baoxiao
-- ----------------------------
DROP TABLE IF EXISTS `baoxiao`;
CREATE TABLE `baoxiao`  (
  `bxid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paymode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `totalmoney` double NULL DEFAULT NULL COMMENT '总金额',
  `bxtime` date NULL DEFAULT NULL COMMENT '报销时间',
  `bxremark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报销备注',
  `bxstatus` int(11) NULL DEFAULT NULL COMMENT '报销状态',
  `emp_fk` int(11) NULL DEFAULT NULL COMMENT '发起报销人',
  `caiwu_fk` int(11) NULL DEFAULT NULL COMMENT '处理报销人',
  PRIMARY KEY (`bxid`) USING BTREE,
  INDEX `emp_fk`(`emp_fk`) USING BTREE,
  INDEX `caiwu_fk`(`caiwu_fk`) USING BTREE,
  CONSTRAINT `baoxiao_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `baoxiao_ibfk_2` FOREIGN KEY (`caiwu_fk`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for comparison
-- ----------------------------
DROP TABLE IF EXISTS `comparison`;
CREATE TABLE `comparison`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `turnonver` double NULL DEFAULT NULL,
  `targetmoney` double NULL DEFAULT NULL,
  `plan` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `disparity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `emp_fk`(`emp_fk`) USING BTREE,
  CONSTRAINT `comparison_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyperson` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comaddress` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comphone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `camera` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `present` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addtime` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (17, '百度', '张辉', '北京市海淀区上地软件园', '13910199182', '010-88167124', '提供搜索、广告。', '无', '2019-06-09');
INSERT INTO `customer` VALUES (18, '北京其久软件有限公司', '王强', '北京市石景山区万寿路1号', '13511021782', '010-87127910', '税务软件', '无', '2019-06-09');
INSERT INTO `customer` VALUES (19, '北京字节跳动有限公司', '张千一', '北京市海淀区学清路112号', '18611012762', '010-77217634', '内容推送', '无', '2019-06-09');
INSERT INTO `customer` VALUES (20, '京东', '刘强东', '北京', '17786768023', '010-49878632', '电商', '购物', '2019-09-18');
INSERT INTO `customer` VALUES (21, '阿里巴巴', '马云', '杭州', '13987882371', '023-48988342', '淘宝', '无', '2019-09-18');
INSERT INTO `customer` VALUES (22, '腾讯', '马化腾', '深圳', '13978921872', '023-48793217', '全是游戏', '无', '2019-09-18');

-- ----------------------------
-- Table structure for datacollect
-- ----------------------------
DROP TABLE IF EXISTS `datacollect`;
CREATE TABLE `datacollect`  (
  `daid` int(11) NOT NULL AUTO_INCREMENT,
  `dacname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标公司名称',
  `daturnover` double NULL DEFAULT NULL COMMENT '营业额',
  `datime` date NULL DEFAULT NULL COMMENT '年度',
  `dabusiness` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要业务',
  `dasuperiority` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优势',
  `dainforiority` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '劣势',
  `dasort` int(11) NULL DEFAULT NULL COMMENT '行业排名',
  `empcount` int(11) NULL DEFAULT NULL COMMENT '员工数量',
  `buildtime` date NULL DEFAULT NULL COMMENT '企业创建时间',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简单描述',
  `daother` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`daid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of datacollect
-- ----------------------------
INSERT INTO `datacollect` VALUES (1, '浪潮集团', 10, '2015-01-01', '软件研发', '国家扶持', '自主能力较差', 1, 3000, '1980-09-09', '创建时间较长，市场比较稳定', '2015年-浪潮集团详细调研说明书.doc');
INSERT INTO `datacollect` VALUES (2, '浪潮集团', 20, '2016-01-01', '软件研发,服务器研发', '国家扶持', '自主能力较差', 1, 3001, '1980-09-10', '创建时间较长，市场比较稳定', '2016年-浪潮集团详细调研说明书.doc');
INSERT INTO `datacollect` VALUES (3, '浪潮集团', 50, '2017-01-01', '软件研发，软件销售', '国家扶持', '自主能力较差', 1, 3002, '1980-09-11', '创建时间较长，市场比较稳定', '2017年-浪潮集团详细调研说明书.doc');
INSERT INTO `datacollect` VALUES (4, '浪潮集团', 70, '2018-01-01', '软件研发', '国家扶持', '自主能力较差', 1, 3003, '1980-09-12', '创建时间较长，市场比较稳定', '2018年-浪潮集团详细调研说明书.doc');
INSERT INTO `datacollect` VALUES (5, '浪潮集团', 8, '2014-01-01', '软件研发', '国家扶持', '自主能力较差', 1, 3004, '1980-09-13', '创建时间较长，市场比较稳定', '2014年-浪潮集团详细调研说明书.doc');
INSERT INTO `datacollect` VALUES (6, '中科软', 30, '1018-01-01', '软件外包服务', '技术人员充沛', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `deptno` int(11) NOT NULL,
  `dname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dlocation` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`deptno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (10, '开发部', '北京');
INSERT INTO `dept` VALUES (20, '市场部', '北京');
INSERT INTO `dept` VALUES (30, '财务器', '北京');

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendtime` date NULL DEFAULT NULL,
  `content` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_fk` int(11) NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbwdib3s3ugq70b5h2ocn0rfvb`(`emp_fk`) USING BTREE,
  CONSTRAINT `FKbwdib3s3ugq70b5h2ocn0rfvb` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for emp_role
-- ----------------------------
DROP TABLE IF EXISTS `emp_role`;
CREATE TABLE `emp_role`  (
  `emp_fk` int(11) NULL DEFAULT NULL,
  `role_fk` int(11) NULL DEFAULT NULL,
  `erdis` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工和角色的描述',
  INDEX `emp_fk`(`emp_fk`) USING BTREE,
  INDEX `role_fk`(`role_fk`) USING BTREE,
  CONSTRAINT `emp_role_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `emp_role_ibfk_2` FOREIGN KEY (`role_fk`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `esex` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eage` int(11) NULL DEFAULT NULL,
  `telephone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hiredate` date NULL DEFAULT NULL,
  `pnum` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `p_fk` int(11) NULL DEFAULT NULL,
  `d_fk` int(11) NULL DEFAULT NULL,
  `l_fk` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`eid`) USING BTREE,
  INDEX `FKt4aodqf7acjpmo7iejdmg3k78`(`p_fk`) USING BTREE,
  INDEX `d_fk`(`d_fk`) USING BTREE,
  INDEX `l_fk`(`l_fk`) USING BTREE,
  CONSTRAINT `FKt4aodqf7acjpmo7iejdmg3k78` FOREIGN KEY (`p_fk`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`p_fk`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`d_fk`) REFERENCES `dept` (`deptno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`l_fk`) REFERENCES `level` (`jid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '张三', '男', 22, '13577818911', '1990-12-12', '1', 'zhangsan', '111111', 'aaaa', 4, 10, 4);
INSERT INTO `employee` VALUES (2, '李四', '女', 28, '34324324', '1992-10-10', '1', 'lisi', '111111', 'dddd', 4, 10, 4);
INSERT INTO `employee` VALUES (3, '陈梦晗', '男', 21, '131414141', '1990-10-10', '1', 'chengmenghan', '111111', 'cccc', 1, 10, 2);
INSERT INTO `employee` VALUES (4, '董吉鹏', '男', 24, '3432432432', '1992-10-10', '1', 'dongjipeng', '111111', 'ddddd', 2, 10, 3);
INSERT INTO `employee` VALUES (5, '刘岳龙', '男', 22, '432324324', '1990-11-11', '1', 'liuyuelong', '111111', 'eeee', 3, 10, 3);
INSERT INTO `employee` VALUES (6, '马力', '男', 25, '34535435', '1990-12-12', '1', 'mali', '111111', 'fffff', 3, 10, 3);

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate`  (
  `evaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `forum_fk` int(11) NULL DEFAULT NULL COMMENT '帖子外键',
  `emp_fk4` int(11) NULL DEFAULT NULL COMMENT '评价人外键',
  `evaid_fk` int(11) NULL DEFAULT NULL COMMENT '回复外键',
  `evacontent` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `evatime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `evastatus` int(11) NULL DEFAULT 0 COMMENT '评价状态',
  PRIMARY KEY (`evaid`) USING BTREE,
  INDEX `emp_fk4`(`emp_fk4`) USING BTREE,
  INDEX `forum_fk`(`forum_fk`) USING BTREE,
  INDEX `evaid_fk`(`evaid_fk`) USING BTREE,
  CONSTRAINT `evaluate_ibfk_1` FOREIGN KEY (`emp_fk4`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `evaluate_ibfk_2` FOREIGN KEY (`forum_fk`) REFERENCES `forumpost` (`forumid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `evaluate_ibfk_3` FOREIGN KEY (`evaid_fk`) REFERENCES `evaluate` (`evaid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES (1, 2, 5, NULL, '<p>发发发发发发付</p>', NULL, '2019-01-07 11:08:33', NULL);
INSERT INTO `evaluate` VALUES (2, 2, 2, 1, '<p>发发发发发发付</p>', NULL, '2019-01-07 11:08:27', NULL);
INSERT INTO `evaluate` VALUES (3, 2, 3, 1, '<p>发发发发发发付</p>', NULL, '2019-01-07 11:08:25', NULL);
INSERT INTO `evaluate` VALUES (6, 2, 4, NULL, '<p>发发发发发发付</p>', NULL, '2019-01-07 11:08:24', 0);
INSERT INTO `evaluate` VALUES (7, 2, 1, 6, '<p>发发发发发发付</p>', NULL, '2019-01-07 11:08:23', 0);
INSERT INTO `evaluate` VALUES (8, 2, 2, NULL, '<p>发发发发发发付</p>', NULL, '2019-01-07 11:05:34', 0);
INSERT INTO `evaluate` VALUES (9, 2, 2, NULL, '<p>反反复复</p><p>反反复复</p>', NULL, '2019-01-07 11:10:07', 0);
INSERT INTO `evaluate` VALUES (10, 3, 2, NULL, '<p>反反复复付付</p>', NULL, '2019-01-07 11:14:50', 0);
INSERT INTO `evaluate` VALUES (11, 14, 6, NULL, '<p>呃呃呃呃呃</p>', NULL, '2019-01-09 10:05:20', 0);
INSERT INTO `evaluate` VALUES (14, 3, 3, NULL, '<p><img src=\"/static/单拦截器执行过程.png\" title=\"upfile\" alt=\"upfile\" width=\"610\" height=\"386\"/></p><p>dddddddd<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/></p>', '2019-07-16 22:36:00', '2019-07-16 22:36:00', 0);
INSERT INTO `evaluate` VALUES (17, 3, 3, 14, '<p><img src=\"http://img.baidu.com/hi/jx2/j_0015.gif\"/>dddd嗯嗯嗯</p>', '2019-07-16 22:41:13', '2019-07-16 22:41:13', 0);
INSERT INTO `evaluate` VALUES (18, 4, 1, NULL, '<p>反反复复<img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/></p>', '2019-07-22 15:49:23', '2019-07-22 15:49:23', 0);
INSERT INTO `evaluate` VALUES (19, 4, 6, 18, '<p>健康的法国进口梵蒂冈<img src=\"http://img.baidu.com/hi/jx2/j_0060.gif\"/></p>', '2019-07-22 15:56:03', '2019-07-22 15:56:03', 0);

-- ----------------------------
-- Table structure for forumpost
-- ----------------------------
DROP TABLE IF EXISTS `forumpost`;
CREATE TABLE `forumpost`  (
  `forumid` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `forumtitle` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子的标题',
  `forumcontent` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子的内容',
  `emp_fk3` int(11) NOT NULL COMMENT '发帖人',
  `createtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `status` int(11) NULL DEFAULT 0 COMMENT '帖子状态',
  PRIMARY KEY (`forumid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of forumpost
-- ----------------------------
INSERT INTO `forumpost` VALUES (2, '投入让人', '<p>发发发发发发付多岁的爽肤水</p>', 2, '2019-01-04 15:54:23', 0);
INSERT INTO `forumpost` VALUES (3, '反反复复', '<p>反反复复</p>', 2, '2019-01-04 16:01:28', 0);
INSERT INTO `forumpost` VALUES (4, '附近反复讲', '<p>发的顺丰科技的史莱克</p><p>第三方就离开的说法</p><p>是的房间里看电视</p>', 2, '2019-01-04 16:16:18', 0);
INSERT INTO `forumpost` VALUES (6, '333333', '<p>333333333<br/></p>', 2, '2019-01-04 16:50:10', 0);
INSERT INTO `forumpost` VALUES (7, '444', '<p>4444</p>', 2, '2019-01-04 17:48:12', 0);
INSERT INTO `forumpost` VALUES (8, '444', '<p>44444</p>', 2, '2019-01-04 17:48:18', 0);
INSERT INTO `forumpost` VALUES (9, '444', '<p>5555</p>', 2, '2019-01-04 17:50:03', 0);
INSERT INTO `forumpost` VALUES (10, '666', '<p>666666</p>', 2, '2019-01-04 17:53:49', 0);
INSERT INTO `forumpost` VALUES (11, '555', '<p>55555</p>', 2, '2019-01-04 18:22:04', 0);
INSERT INTO `forumpost` VALUES (12, '333333', '<p>ttttttttttt</p>', 2, '2019-01-04 18:32:31', 0);
INSERT INTO `forumpost` VALUES (13, '杯子出售', '<p>杯子在呢么名史莱克的减肥的流口水</p>', 2, '2019-01-07 09:01:37', 0);
INSERT INTO `forumpost` VALUES (14, '3333', '<p>33333</p>', 6, '2019-01-09 10:05:11', 0);
INSERT INTO `forumpost` VALUES (15, '好笨呀', '<p>啛啛喳喳错错，啥也学不会<img width=\"530\" height=\"340\" src=\"http://api.map.baidu.com/staticimage?center=116.404,39.915&zoom=10&width=530&height=340&markers=116.404,39.915\"/><img src=\"/.png\" title=\".png\" alt=\"单拦截器执行过程.png\"/></p>', 2, '2019-07-17 20:28:09', 0);
INSERT INTO `forumpost` VALUES (16, '等等', '<p>对对对对对对<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/></p>', 2, '2019-07-17 20:28:50', 0);
INSERT INTO `forumpost` VALUES (17, '三生三世', '<p>第三方第三方师傅<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/></p>', 2, '2019-07-17 21:02:18', 0);

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `analysisname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modele_fk` int(11) NULL DEFAULT NULL,
  `functionname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simpledis` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detaileddis` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKjonpxsiii6o3xv16nttvg500w`(`modele_fk`) USING BTREE,
  CONSTRAINT `FKjonpxsiii6o3xv16nttvg500w` FOREIGN KEY (`modele_fk`) REFERENCES `module` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `function_ibfk_1` FOREIGN KEY (`modele_fk`) REFERENCES `module` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES (1, '人力资源管理系统', '人力资源管理系统需求分析', 6, '员工考勤功能', '中', '对员工进行考勤记录', '上班时间  上午9:00 下午：18：00', '无');
INSERT INTO `function` VALUES (2, '人力资源管理系统', '人力资源管理系统需求分析', 6, '员工请假功能', '中', '员工可以进行请假制度', '同工可以倒休和请假', '无');
INSERT INTO `function` VALUES (3, '人力资源管理系统', '人力资源管理系统需求分析', 6, '员工增删改查功能', '中', '无', '无', '无');
INSERT INTO `function` VALUES (5, 'ERP管理系统', 'ERP管理系统需求分析', 10, 'ERP后台', '低', 'ERP后台管理', 'ERP后台管理实现', '无');
INSERT INTO `function` VALUES (6, '医疗系统', '医疗服务', 9, '医疗管理系统完善', '高', '医疗管理系统完善', '医疗管理系统的各个功能完善', '无');

-- ----------------------------
-- Table structure for indexvalue
-- ----------------------------
DROP TABLE IF EXISTS `indexvalue`;
CREATE TABLE `indexvalue`  (
  `in_id` int(11) NOT NULL AUTO_INCREMENT,
  `in_turnover` double NULL DEFAULT NULL COMMENT '目标营业额',
  `in_business` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要业务方向',
  `comname_fk` int(11) NULL DEFAULT NULL COMMENT '对比企业名称',
  `in_remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简单说明',
  `in_file` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件',
  `emp_fk5` int(11) NULL DEFAULT NULL COMMENT '指标制定人',
  `in_starttime` date NULL DEFAULT NULL COMMENT '开始时间',
  `in_endtime` date NULL DEFAULT NULL COMMENT '截止时间',
  `in_updatetime` date NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`in_id`) USING BTREE,
  INDEX `comname_fk`(`comname_fk`) USING BTREE,
  INDEX `emp_fk5`(`emp_fk5`) USING BTREE,
  CONSTRAINT `indexvalue_ibfk_1` FOREIGN KEY (`comname_fk`) REFERENCES `datacollect` (`daid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `indexvalue_ibfk_2` FOREIGN KEY (`emp_fk5`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of indexvalue
-- ----------------------------
INSERT INTO `indexvalue` VALUES (4, 75, '软件开发服务器销售', 4, '扩展业务为服务器销售', 'a1e97cf3-ded9-4f53-860f-5e95b4fafa00_abc.xls', 2, '2019-01-01', '2019-06-30', NULL);

-- ----------------------------
-- Table structure for level
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level`  (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `jname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jdis` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`jid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of level
-- ----------------------------
INSERT INTO `level` VALUES (1, 'p1', '实习生');
INSERT INTO `level` VALUES (2, 'p2', '初级程序员');
INSERT INTO `level` VALUES (3, 'p3', '高级程序员');
INSERT INTO `level` VALUES (4, 'p4', '项目经理');
INSERT INTO `level` VALUES (5, 'p5', '管理');
INSERT INTO `level` VALUES (6, 'p6', '管理');

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `analysis_fk` int(11) NULL DEFAULT NULL,
  `modname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `simpledis` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detaileddis` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK986a0ufpo55087x7uc0ous7nb`(`analysis_fk`) USING BTREE,
  CONSTRAINT `FK986a0ufpo55087x7uc0ous7nb` FOREIGN KEY (`analysis_fk`) REFERENCES `analysis` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`analysis_fk`) REFERENCES `analysis` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES (6, '人力资源管理系统', 1, '员工管理模块', '中', '对员工信息进行管理', '员工模块包括：增、改、删、查等功能。', '无');
INSERT INTO `module` VALUES (7, '人力资源管理系统', 1, '部门管理模块', '中', '建立部门', '对部门的增、删、改查', '无');
INSERT INTO `module` VALUES (8, '人力资源管理系统', 1, '工资模块', '中', '对工资进行管理', '详细列表工资条信息', '无');
INSERT INTO `module` VALUES (9, '医疗系统', 6, '医疗系统后台', '高', '医疗系统后台', '医疗系统后台开发', '无');
INSERT INTO `module` VALUES (10, 'ERP管理系统', 2, 'ERP管理模块', '低', 'ERP管理模块', 'ERP管理模块实现', '无');

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg`  (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `sendp` int(32) NULL DEFAULT NULL,
  `recvp` int(32) NULL DEFAULT NULL,
  `mark` int(11) NULL DEFAULT NULL,
  `msgcontent` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msgtime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`msgid`) USING BTREE,
  INDEX `sendp`(`sendp`) USING BTREE,
  INDEX `recvp`(`recvp`) USING BTREE,
  CONSTRAINT `msg_ibfk_1` FOREIGN KEY (`sendp`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `msg_ibfk_2` FOREIGN KEY (`recvp`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(320) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ndate` date NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, '初级开发工程师');
INSERT INTO `position` VALUES (2, '中级开发工程师');
INSERT INTO `position` VALUES (3, '高级开发工程师');
INSERT INTO `position` VALUES (4, '项目经理');
INSERT INTO `position` VALUES (5, '项目总监');
INSERT INTO `position` VALUES (6, ' 其他');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comname` int(11) NULL DEFAULT NULL,
  `comper` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_fk1` int(11) NULL DEFAULT NULL,
  `empcount` int(11) NULL DEFAULT NULL,
  `starttime` date NULL DEFAULT NULL,
  `buildtime` date NULL DEFAULT NULL,
  `cost` int(11) NULL DEFAULT NULL,
  `level` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endtime` date NULL DEFAULT NULL,
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emp_fk` int(11) NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `emp_fk1`(`emp_fk1`) USING BTREE,
  INDEX `FKtirudsu3khj865hrqeamn153y`(`comname`) USING BTREE,
  INDEX `FKj4vtyyp6ew24vggobfcmav1be`(`emp_fk`) USING BTREE,
  CONSTRAINT `FKj4vtyyp6ew24vggobfcmav1be` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`comname`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, '人力资源管理系统', 18, '王强', 0, 5, '2019-06-13', '2019-06-07', 30, '1', '2019-06-27', '无', 1);
INSERT INTO `project` VALUES (2, 'ERP管理系统', 19, '张千一', 0, 10, '2019-06-27', '2019-06-07', 300, '1', '2019-07-26', '无', 2);
INSERT INTO `project` VALUES (3, 'OA自动办公系统', 17, '张辉', 0, 20, '2019-06-18', '2019-06-27', 100, '1', '2019-07-30', '无', 1);
INSERT INTO `project` VALUES (4, '财务核算系', 22, '马化腾', 0, 20, '2019-06-14', '2019-06-05', 300, '2', '2019-07-30', '不急，慢慢做', 1);
INSERT INTO `project` VALUES (5, '国税务报税系统', 18, '王强', 0, 20, '2019-06-04', '2019-06-04', 200, '1', '2019-06-27', '报税系统', 2);
INSERT INTO `project` VALUES (6, '医疗系统', 21, '马云', NULL, 25, '2019-09-27', '2019-09-24', 500, '2', '2020-09-24', '无', 2);
INSERT INTO `project` VALUES (7, '小米电脑', 19, '张千一', NULL, 25, '2018-09-30', '2017-09-30', 500, '2', '2020-09-30', '东uu', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roledis` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role_sources
-- ----------------------------
DROP TABLE IF EXISTS `role_sources`;
CREATE TABLE `role_sources`  (
  `roleid` int(11) NULL DEFAULT NULL,
  `sid` int(11) NULL DEFAULT NULL,
  `rsdis` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色和资源的描述',
  INDEX `roleid`(`roleid`) USING BTREE,
  INDEX `sid`(`sid`) USING BTREE,
  CONSTRAINT `role_sources_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_sources_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `sources` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sources
-- ----------------------------
DROP TABLE IF EXISTS `sources`;
CREATE TABLE `sources`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sndis` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spath` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` date NULL DEFAULT NULL,
  `endtime` date NULL DEFAULT NULL,
  `level` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `define` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fun_fk` int(11) NULL DEFAULT NULL,
  `emp_fk2` int(11) NULL DEFAULT NULL,
  `emp_fk` int(11) NOT NULL,
  `tasktitle` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '值为:0,1,2',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `emp_fk2`(`emp_fk2`) USING BTREE,
  INDEX `FK8pqhf0pdn5r478vp69g6sip3`(`fun_fk`) USING BTREE,
  INDEX `FKcpxt4jxiaoqj5nwny5ai74drj`(`emp_fk`) USING BTREE,
  CONSTRAINT `FK8pqhf0pdn5r478vp69g6sip3` FOREIGN KEY (`fun_fk`) REFERENCES `function` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKcpxt4jxiaoqj5nwny5ai74drj` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`fun_fk`) REFERENCES `function` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`emp_fk2`) REFERENCES `employee` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, '2019-06-17', '2019-06-20', '高', NULL, 1, 3, 1, '员工考勤功能任务', '暂无', 2);
INSERT INTO `task` VALUES (2, '2019-09-09', '2019-09-29', '中', NULL, 6, 3, 1, '完善后台', '尽快', 1);
INSERT INTO `task` VALUES (3, '2019-10-03', '2019-11-03', '中', NULL, 1, 5, 1, '搞定后台', '大范围', 0);

SET FOREIGN_KEY_CHECKS = 1;
