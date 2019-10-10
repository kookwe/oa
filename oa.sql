-- MySQL dump 10.13  Distrib 5.5.49, for Win32 (x86)
--
-- Host: localhost    Database: oa
-- ------------------------------------------------------
-- Server version	5.5.49

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analysis`
--

DROP TABLE IF EXISTS `analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(64) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `simpledis` varchar(320) DEFAULT NULL,
  `detaileddis` varchar(320) DEFAULT NULL,
  `addtime` date DEFAULT NULL,
  `updatetime` date DEFAULT NULL,
  `remark` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `analysis_ibfk_1` FOREIGN KEY (`id`) REFERENCES `project` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analysis`
--

LOCK TABLES `analysis` WRITE;
/*!40000 ALTER TABLE `analysis` DISABLE KEYS */;
INSERT INTO `analysis` VALUES (1,'人力资源管理系统','人力资源管理系统需求分析','该分析为最终需求','可以进行人力资管理','2019-06-09','2019-06-09','请参考需求分析'),(2,'ERP管理系统','ERP管理系统需求分析','该ERP可以实现很多功能','该ERP可以实现很多功能','2019-06-09','2019-06-09','该ERP可以实现很多功能'),(3,'OA自动办公系统','OA自动办公系统需求分析','可以实现员工管理','可以实现让员工的考勤、打卡、邮箱、办公等功能。','2019-06-09','2019-06-09','参考需求分析'),(4,'财务核算系','财务核算系需求分','包括月财务核算等','包括月财务核算等','2019-06-13','2019-06-13','包括月财务核算等'),(6,'医疗系统','医疗服务','完善医疗系统','完善医疗系统户口','2019-09-25','2019-09-25','参考需求分析');
/*!40000 ALTER TABLE `analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archives`
--

DROP TABLE IF EXISTS `archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archives` (
  `dnum` varchar(64) NOT NULL,
  `landline` varchar(32) DEFAULT NULL COMMENT '固话',
  `school` varchar(32) DEFAULT NULL COMMENT '毕业院校',
  `zhuanye` varchar(32) DEFAULT NULL COMMENT '专业',
  `sosperson` varchar(32) DEFAULT NULL COMMENT '紧急联系人',
  `biyedate` date DEFAULT NULL COMMENT '毕业时间',
  `zzmm` varchar(32) DEFAULT NULL COMMENT '政治面貌',
  `minzu` varchar(32) DEFAULT NULL COMMENT '民族',
  `xueli` varchar(32) DEFAULT NULL COMMENT '学历',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `emp_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`dnum`) USING BTREE,
  KEY `emp_fk` (`emp_fk`) USING BTREE,
  CONSTRAINT `archives_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archives`
--

LOCK TABLES `archives` WRITE;
/*!40000 ALTER TABLE `archives` DISABLE KEYS */;
INSERT INTO `archives` VALUES ('451-qaz','0654-010','北京大学1','软件工程1','人托人','2018-09-10','群众','苗族','大专','123@127.com',3),('459-qaz','0654-009','北京大学','软件工程','李萌萌','2018-09-09','群众','汉族','本科','123@126.com',2),('682d7f2','18562324217','武汉大学','计算机','马蜂窝','2012-01-01','党员','汉','本科','4345343@163.com',6),('8c8ff62','17784253421','北大','计算机','陈bf','2014-06-01','团员','汉','硕士','32425@163.com',1);
/*!40000 ALTER TABLE `archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_fk` int(11) DEFAULT NULL,
  `attname` varchar(32) DEFAULT NULL,
  `attdis` varchar(128) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  `uploadtime` date DEFAULT NULL,
  `updatetime` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKhdq50yhhjhdiyfm03xjohqlki` (`pro_fk`) USING BTREE,
  CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`pro_fk`) REFERENCES `project` (`pid`),
  CONSTRAINT `FKhdq50yhhjhdiyfm03xjohqlki` FOREIGN KEY (`pro_fk`) REFERENCES `project` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (1,1,'资源管理系统附件','关于bug的修正','无','file/13/8/maven.txt','2019-06-04','2019-07-19'),(2,1,'资源管理系统附件','关于bug的修正','无','file/13/8/maven.txt','2019-06-01','2019-07-24'),(12,1,'资源管理系统附件','关于bug的修正222','qqqq','file/6/9/attatchmentinfo.xls','2019-08-01','2019-08-11'),(13,2,'ERP测试','ERP测试文件','无','a4bf0aca4a14ERP.xls','2019-09-27','2019-09-27');
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baoxiao`
--

DROP TABLE IF EXISTS `baoxiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baoxiao` (
  `bxid` varchar(64) NOT NULL,
  `paymode` varchar(32) DEFAULT NULL COMMENT '类型',
  `totalmoney` double DEFAULT NULL COMMENT '总金额',
  `bxtime` date DEFAULT NULL COMMENT '报销时间',
  `bxremark` varchar(100) DEFAULT NULL COMMENT '报销备注',
  `remark` varchar(255) DEFAULT NULL COMMENT '报销批注',
  `bxstatus` int(11) DEFAULT NULL COMMENT '报销状态',
  `emp_fk` int(11) DEFAULT NULL COMMENT '发起报销人',
  `caiwu_fk` int(11) DEFAULT NULL COMMENT '处理报销人',
  PRIMARY KEY (`bxid`) USING BTREE,
  KEY `emp_fk` (`emp_fk`) USING BTREE,
  KEY `caiwu_fk` (`caiwu_fk`) USING BTREE,
  CONSTRAINT `baoxiao_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`),
  CONSTRAINT `baoxiao_ibfk_2` FOREIGN KEY (`caiwu_fk`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baoxiao`
--

LOCK TABLES `baoxiao` WRITE;
/*!40000 ALTER TABLE `baoxiao` DISABLE KEYS */;
INSERT INTO `baoxiao` VALUES ('00-812a-ecb98ad3cb29','办公采购',30000,'2018-10-09','电脑采购','同意',1,3,NULL),('ff-b666-067146f67c63','出差票据',3000,'2019-10-09','北京出差','',0,1,NULL);
/*!40000 ALTER TABLE `baoxiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comparison`
--

DROP TABLE IF EXISTS `comparison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comparison` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(32) DEFAULT NULL,
  `turnonver` double DEFAULT NULL,
  `targetmoney` double DEFAULT NULL,
  `plan` varchar(100) DEFAULT NULL,
  `disparity` varchar(100) DEFAULT NULL,
  `emp_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  KEY `emp_fk` (`emp_fk`) USING BTREE,
  CONSTRAINT `comparison_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comparison`
--

LOCK TABLES `comparison` WRITE;
/*!40000 ALTER TABLE `comparison` DISABLE KEYS */;
/*!40000 ALTER TABLE `comparison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comname` varchar(128) DEFAULT NULL,
  `companyperson` varchar(32) DEFAULT NULL,
  `comaddress` varchar(128) DEFAULT NULL,
  `comphone` varchar(32) DEFAULT NULL,
  `camera` varchar(128) DEFAULT NULL,
  `present` varchar(128) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `addtime` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (17,'百度','张辉','北京市海淀区上地软件园','13910199182','010-88167124','提供搜索、广告。','无','2019-06-09'),(18,'北京其久软件有限公司','王强','北京市石景山区万寿路1号','13511021782','010-87127910','税务软件','无','2019-06-09'),(19,'北京字节跳动有限公司','张千一','北京市海淀区学清路112号','18611012762','010-77217634','内容推送','无','2019-06-09'),(20,'京东','刘强东','北京','17786768023','010-49878632','电商','购物','2019-09-18'),(21,'阿里巴巴','马云','杭州','13987882371','023-48988342','淘宝','无','2019-09-18'),(22,'腾讯','马化腾','深圳','13978921872','023-48793217','全是游戏','无','2019-09-18');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datacollect`
--

DROP TABLE IF EXISTS `datacollect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datacollect` (
  `daid` int(11) NOT NULL AUTO_INCREMENT,
  `dacname` varchar(32) DEFAULT NULL COMMENT '目标公司名称',
  `daturnover` double DEFAULT NULL COMMENT '营业额',
  `datime` date DEFAULT NULL COMMENT '年度',
  `dabusiness` varchar(128) DEFAULT NULL COMMENT '主要业务',
  `dasuperiority` varchar(128) DEFAULT NULL COMMENT '优势',
  `dainforiority` varchar(128) DEFAULT NULL COMMENT '劣势',
  `dasort` int(11) DEFAULT NULL COMMENT '行业排名',
  `empcount` int(11) DEFAULT NULL COMMENT '员工数量',
  `buildtime` date DEFAULT NULL COMMENT '企业创建时间',
  `remark` varchar(256) DEFAULT NULL COMMENT '简单描述',
  `daother` varchar(128) DEFAULT NULL COMMENT '其他',
  PRIMARY KEY (`daid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datacollect`
--

LOCK TABLES `datacollect` WRITE;
/*!40000 ALTER TABLE `datacollect` DISABLE KEYS */;
INSERT INTO `datacollect` VALUES (1,'浪潮集团',10,'2015-01-01','软件研发','国家扶持','自主能力较差',1,3000,'1980-09-09','创建时间较长，市场比较稳定','2015年-浪潮集团详细调研说明书.doc'),(2,'浪潮集团',20,'2016-01-01','软件研发,服务器研发','国家扶持','自主能力较差',1,3001,'1980-09-10','创建时间较长，市场比较稳定','2016年-浪潮集团详细调研说明书.doc'),(3,'浪潮集团',50,'2017-01-01','软件研发，软件销售','国家扶持','自主能力较差',1,3002,'1980-09-11','创建时间较长，市场比较稳定','2017年-浪潮集团详细调研说明书.doc'),(4,'浪潮集团',70,'2018-01-01','软件研发','国家扶持','自主能力较差',1,3003,'1980-09-12','创建时间较长，市场比较稳定','2018年-浪潮集团详细调研说明书.doc'),(5,'浪潮集团',8,'2014-01-01','软件研发','国家扶持','自主能力较差',1,3004,'1980-09-13','创建时间较长，市场比较稳定','2014年-浪潮集团详细调研说明书.doc'),(6,'中科软',30,'1018-01-01','软件外包服务','技术人员充沛',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `datacollect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `deptno` int(11) NOT NULL,
  `dname` varchar(32) DEFAULT NULL,
  `dlocation` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`deptno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (10,'开发部','北京'),(20,'市场部','北京'),(30,'财务器','北京');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `ename` varchar(32) DEFAULT NULL,
  `sendtime` date DEFAULT NULL,
  `content` varchar(128) DEFAULT NULL,
  `emp_fk` int(11) DEFAULT NULL,
  `emp_fk2` int(11) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbwdib3s3ugq70b5h2ocn0rfvb` (`emp_fk`) USING BTREE,
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`),
  CONSTRAINT `email_ibfk_2` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES (5,'测试',NULL,'2019-10-10','测试内容',1,6,'oa.sql');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_role`
--

DROP TABLE IF EXISTS `emp_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_role` (
  `emp_fk` int(11) DEFAULT NULL,
  `role_fk` int(11) DEFAULT NULL,
  `erdis` varchar(32) DEFAULT NULL COMMENT '员工和角色的描述',
  KEY `emp_fk` (`emp_fk`) USING BTREE,
  KEY `role_fk` (`role_fk`) USING BTREE,
  CONSTRAINT `emp_role_ibfk_1` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`),
  CONSTRAINT `emp_role_ibfk_2` FOREIGN KEY (`role_fk`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_role`
--

LOCK TABLES `emp_role` WRITE;
/*!40000 ALTER TABLE `emp_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(32) DEFAULT NULL,
  `esex` varchar(32) DEFAULT NULL,
  `eage` int(11) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `pnum` varchar(32) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `p_fk` int(11) DEFAULT NULL,
  `d_fk` int(11) DEFAULT NULL,
  `l_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`) USING BTREE,
  KEY `FKt4aodqf7acjpmo7iejdmg3k78` (`p_fk`) USING BTREE,
  KEY `d_fk` (`d_fk`) USING BTREE,
  KEY `l_fk` (`l_fk`) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`p_fk`) REFERENCES `position` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`d_fk`) REFERENCES `dept` (`deptno`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`l_fk`) REFERENCES `level` (`jid`),
  CONSTRAINT `FKt4aodqf7acjpmo7iejdmg3k78` FOREIGN KEY (`p_fk`) REFERENCES `position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'张三','男',22,'13577818911','1990-12-12','1','zhangsan','111111','aaaa',4,10,4),(2,'李四','女',28,'34324324','1992-10-10','1','lisi','111111','dddd',4,10,4),(3,'陈梦晗','男',21,'131414141','1990-10-10','1','chengmenghan','111111','cccc',1,10,2),(4,'董吉鹏','男',24,'3432432432','1992-10-10','1','dongjipeng','111111','ddddd',2,10,3),(5,'刘岳龙','男',22,'432324324','1990-11-11','1','liuyuelong','111111','eeee',3,10,3),(6,'马力','男',25,'34535435','1990-12-12','1','mali','111111','fffff',3,10,3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluate`
--

DROP TABLE IF EXISTS `evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluate` (
  `evaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `forum_fk` int(11) DEFAULT NULL COMMENT '帖子外键',
  `emp_fk4` int(11) DEFAULT NULL COMMENT '评价人外键',
  `evaid_fk` int(11) DEFAULT NULL COMMENT '回复外键',
  `evacontent` varchar(256) DEFAULT NULL COMMENT '评价内容',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `evatime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `evastatus` int(11) DEFAULT '0' COMMENT '评价状态',
  PRIMARY KEY (`evaid`),
  KEY `emp_fk4` (`emp_fk4`),
  KEY `forum_fk` (`forum_fk`),
  KEY `evaid_fk` (`evaid_fk`),
  CONSTRAINT `evaluate_ibfk_1` FOREIGN KEY (`emp_fk4`) REFERENCES `employee` (`eid`),
  CONSTRAINT `evaluate_ibfk_2` FOREIGN KEY (`forum_fk`) REFERENCES `forumpost` (`forumid`),
  CONSTRAINT `evaluate_ibfk_3` FOREIGN KEY (`evaid_fk`) REFERENCES `evaluate` (`evaid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluate`
--

LOCK TABLES `evaluate` WRITE;
/*!40000 ALTER TABLE `evaluate` DISABLE KEYS */;
INSERT INTO `evaluate` VALUES (1,2,5,NULL,'<p>发发发发发发付</p>',NULL,'2019-01-07 03:08:33',NULL),(2,2,2,1,'<p>发发发发发发付</p>',NULL,'2019-01-07 03:08:27',NULL),(3,2,3,1,'<p>发发发发发发付</p>',NULL,'2019-01-07 03:08:25',NULL),(6,2,4,NULL,'<p>发发发发发发付</p>',NULL,'2019-01-07 03:08:24',0),(7,2,1,6,'<p>发发发发发发付</p>',NULL,'2019-01-07 03:08:23',0),(8,2,2,NULL,'<p>发发发发发发付</p>',NULL,'2019-01-07 03:05:34',0),(9,2,2,NULL,'<p>反反复复</p><p>反反复复</p>',NULL,'2019-01-07 03:10:07',0),(10,3,2,NULL,'<p>反反复复付付</p>',NULL,'2019-01-07 03:14:50',0),(11,14,6,NULL,'<p>呃呃呃呃呃</p>',NULL,'2019-01-09 02:05:20',0),(14,3,3,NULL,'<p><img src=\"/static/单拦截器执行过程.png\" title=\"upfile\" alt=\"upfile\" width=\"610\" height=\"386\"/></p><p>dddddddd<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/></p>','2019-07-16 22:36:00','2019-07-16 14:36:00',0),(17,3,3,14,'<p><img src=\"http://img.baidu.com/hi/jx2/j_0015.gif\"/>dddd嗯嗯嗯</p>','2019-07-16 22:41:13','2019-07-16 14:41:13',0),(18,4,1,NULL,'<p>反反复复<img src=\"http://img.baidu.com/hi/jx2/j_0001.gif\"/></p>','2019-07-22 15:49:23','2019-07-22 07:49:23',0),(19,4,6,18,'<p>健康的法国进口梵蒂冈<img src=\"http://img.baidu.com/hi/jx2/j_0060.gif\"/></p>','2019-07-22 15:56:03','2019-07-22 07:56:03',0),(20,16,1,NULL,'<p>不</p>','2019-10-10 16:14:30','2019-10-10 08:14:30',0),(21,16,3,NULL,'<p>等什么</p>','2019-10-10 16:15:14','2019-10-10 08:15:14',0),(22,16,3,20,'<p>对</p>','2019-10-10 16:15:20','2019-10-10 08:16:31',0),(23,16,3,20,'<p>你在哪</p>','2019-10-10 16:16:54','2019-10-10 08:16:54',0);
/*!40000 ALTER TABLE `evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forumpost`
--

DROP TABLE IF EXISTS `forumpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forumpost` (
  `forumid` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `forumtitle` varchar(32) NOT NULL COMMENT '帖子的标题',
  `forumcontent` varchar(256) NOT NULL COMMENT '帖子的内容',
  `emp_fk3` int(11) NOT NULL COMMENT '发帖人',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` int(11) DEFAULT '0' COMMENT '帖子状态',
  PRIMARY KEY (`forumid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forumpost`
--

LOCK TABLES `forumpost` WRITE;
/*!40000 ALTER TABLE `forumpost` DISABLE KEYS */;
INSERT INTO `forumpost` VALUES (2,'投入让人','<p>发发发发发发付多岁的爽肤水</p>',2,'2019-01-04 07:54:23',0),(3,'反反复复','<p>反反复复</p>',2,'2019-01-04 08:01:28',0),(4,'附近反复讲','<p>发的顺丰科技的史莱克</p><p>第三方就离开的说法</p><p>是的房间里看电视</p>',2,'2019-01-04 08:16:18',0),(6,'333333','<p>333333333<br/></p>',2,'2019-01-04 08:50:10',0),(7,'444','<p>4444</p>',2,'2019-01-04 09:48:12',0),(8,'444','<p>44444</p>',2,'2019-01-04 09:48:18',0),(9,'444','<p>5555</p>',2,'2019-01-04 09:50:03',0),(10,'666','<p>666666</p>',2,'2019-01-04 09:53:49',0),(11,'555','<p>55555</p>',2,'2019-01-04 10:22:04',0),(12,'333333','<p>ttttttttttt</p>',2,'2019-01-04 10:32:31',0),(13,'杯子出售','<p>杯子在呢么名史莱克的减肥的流口水</p>',2,'2019-01-07 01:01:37',0),(14,'3333','<p>33333</p>',6,'2019-01-09 02:05:11',0),(15,'好笨呀','<p>啛啛喳喳错错，啥也学不会<img width=\"530\" height=\"340\" src=\"http://api.map.baidu.com/staticimage?center=116.404,39.915&zoom=10&width=530&height=340&markers=116.404,39.915\"/><img src=\"/.png\" title=\".png\" alt=\"单拦截器执行过程.png\"/></p>',2,'2019-07-17 12:28:09',0),(16,'等等','<p>对对对对对对<img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/></p>',2,'2019-07-17 12:28:50',0),(17,'三生三世','<p>第三方第三方师傅<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/></p>',2,'2019-07-17 13:02:18',0),(18,'发个帖子玩玩','<p><img src=\"http://img.baidu.com/hi/jx2/j_0071.gif\"/>哈哈</p>',1,'2019-10-10 08:46:54',0);
/*!40000 ALTER TABLE `forumpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(32) DEFAULT NULL,
  `analysisname` varchar(32) DEFAULT NULL,
  `modele_fk` int(11) DEFAULT NULL,
  `functionname` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `simpledis` varchar(256) DEFAULT NULL,
  `detaileddis` varchar(256) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKjonpxsiii6o3xv16nttvg500w` (`modele_fk`) USING BTREE,
  CONSTRAINT `FKjonpxsiii6o3xv16nttvg500w` FOREIGN KEY (`modele_fk`) REFERENCES `module` (`id`),
  CONSTRAINT `function_ibfk_1` FOREIGN KEY (`modele_fk`) REFERENCES `module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function`
--

LOCK TABLES `function` WRITE;
/*!40000 ALTER TABLE `function` DISABLE KEYS */;
INSERT INTO `function` VALUES (1,'人力资源管理系统','人力资源管理系统需求分析',6,'员工考勤功能','中','对员工进行考勤记录','上班时间  上午9:00 下午：18：00','无'),(2,'人力资源管理系统','人力资源管理系统需求分析',6,'员工请假功能','中','员工可以进行请假制度','同工可以倒休和请假','无'),(3,'人力资源管理系统','人力资源管理系统需求分析',6,'员工增删改查功能','中','无','无','无'),(5,'ERP管理系统','ERP管理系统需求分析',10,'ERP后台','低','ERP后台管理','ERP后台管理实现','无'),(6,'医疗系统','医疗服务',9,'医疗管理系统完善','高','医疗管理系统完善','医疗管理系统的各个功能完善','无');
/*!40000 ALTER TABLE `function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indexvalue`
--

DROP TABLE IF EXISTS `indexvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indexvalue` (
  `in_id` int(11) NOT NULL AUTO_INCREMENT,
  `in_turnover` double DEFAULT NULL COMMENT '目标营业额',
  `in_business` varchar(128) DEFAULT NULL COMMENT '主要业务方向',
  `comname_fk` int(11) DEFAULT NULL COMMENT '对比企业名称',
  `in_remark` varchar(256) DEFAULT NULL COMMENT '简单说明',
  `in_file` varchar(128) DEFAULT NULL COMMENT '附件',
  `emp_fk5` int(11) DEFAULT NULL COMMENT '指标制定人',
  `in_starttime` date DEFAULT NULL COMMENT '开始时间',
  `in_endtime` date DEFAULT NULL COMMENT '截止时间',
  `in_updatetime` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`in_id`),
  KEY `comname_fk` (`comname_fk`),
  KEY `emp_fk5` (`emp_fk5`),
  CONSTRAINT `indexvalue_ibfk_1` FOREIGN KEY (`comname_fk`) REFERENCES `datacollect` (`daid`),
  CONSTRAINT `indexvalue_ibfk_2` FOREIGN KEY (`emp_fk5`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indexvalue`
--

LOCK TABLES `indexvalue` WRITE;
/*!40000 ALTER TABLE `indexvalue` DISABLE KEYS */;
INSERT INTO `indexvalue` VALUES (4,75,'软件开发服务器销售',4,'扩展业务为服务器销售','a1e97cf3-ded9-4f53-860f-5e95b4fafa00_abc.xls',2,'2019-01-01','2019-06-30',NULL);
/*!40000 ALTER TABLE `indexvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `jid` int(11) NOT NULL AUTO_INCREMENT,
  `jname` varchar(32) DEFAULT NULL,
  `jdis` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`jid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'p1','实习生'),(2,'p2','初级程序员'),(3,'p3','高级程序员'),(4,'p4','项目经理'),(5,'p5','管理'),(6,'p6','管理');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(32) DEFAULT NULL,
  `analysis_fk` int(11) DEFAULT NULL,
  `modname` varchar(32) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `simpledis` varchar(256) DEFAULT NULL,
  `detaileddis` varchar(256) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK986a0ufpo55087x7uc0ous7nb` (`analysis_fk`) USING BTREE,
  CONSTRAINT `FK986a0ufpo55087x7uc0ous7nb` FOREIGN KEY (`analysis_fk`) REFERENCES `analysis` (`id`),
  CONSTRAINT `module_ibfk_1` FOREIGN KEY (`analysis_fk`) REFERENCES `analysis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (6,'人力资源管理系统',1,'员工管理模块','中','对员工信息进行管理','员工模块包括：增、改、删、查等功能。','无'),(7,'人力资源管理系统',1,'部门管理模块','中','建立部门','对部门的增、删、改查','无'),(8,'人力资源管理系统',1,'工资模块','中','对工资进行管理','详细列表工资条信息','无'),(9,'医疗系统',6,'医疗系统后台','高','医疗系统后台','医疗系统后台开发','无'),(10,'ERP管理系统',2,'ERP管理模块','低','ERP管理模块','ERP管理模块实现','无');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `sendp` int(32) DEFAULT NULL,
  `recvp` int(32) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `msgcontent` varchar(32) DEFAULT NULL,
  `msgtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`msgid`) USING BTREE,
  KEY `sendp` (`sendp`) USING BTREE,
  KEY `recvp` (`recvp`) USING BTREE,
  CONSTRAINT `msg_ibfk_1` FOREIGN KEY (`sendp`) REFERENCES `employee` (`eid`),
  CONSTRAINT `msg_ibfk_2` FOREIGN KEY (`recvp`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(32) DEFAULT NULL,
  `remark` varchar(320) DEFAULT NULL,
  `ndate` date DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'中国移动关于设立作风建设监督举报电话的公告','举报电话0232414151','2019-08-13'),(2,'开会通知','所有人必须参加','2019-09-09'),(3,'放假通知','国庆放假7天','2019-09-27');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'初级开发工程师'),(2,'中级开发工程师'),(3,'高级开发工程师'),(4,'项目经理'),(5,'项目总监'),(6,' 其他');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(128) DEFAULT NULL,
  `comname` int(11) DEFAULT NULL,
  `comper` varchar(64) DEFAULT NULL,
  `emp_fk1` int(11) DEFAULT NULL,
  `empcount` int(11) DEFAULT NULL,
  `starttime` date DEFAULT NULL,
  `buildtime` date DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `emp_fk` int(11) NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  KEY `emp_fk1` (`emp_fk1`) USING BTREE,
  KEY `FKtirudsu3khj865hrqeamn153y` (`comname`) USING BTREE,
  KEY `FKj4vtyyp6ew24vggobfcmav1be` (`emp_fk`) USING BTREE,
  CONSTRAINT `FKj4vtyyp6ew24vggobfcmav1be` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`comname`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'人力资源管理系统',18,'王强',0,5,'2019-06-13','2019-06-07',30,'1','2019-06-27','无',1),(2,'ERP管理系统',19,'张千一',0,10,'2019-06-27','2019-06-07',300,'1','2019-07-26','无',2),(3,'OA自动办公系统',17,'张辉',0,20,'2019-06-18','2019-06-27',100,'1','2019-07-30','无',1),(4,'财务核算系',22,'马化腾',0,20,'2019-06-14','2019-06-05',300,'2','2019-07-30','不急，慢慢做',1),(5,'国税务报税系统',18,'王强',0,20,'2019-06-04','2019-06-04',200,'1','2019-06-27','报税系统',2),(6,'医疗系统',21,'马云',NULL,25,'2019-09-27','2019-09-24',500,'2','2020-09-24','无',2),(7,'小米电脑',19,'张千一',NULL,25,'2018-09-30','2017-09-30',500,'2','2020-09-30','东uu',1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(32) DEFAULT NULL,
  `roledis` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_sources`
--

DROP TABLE IF EXISTS `role_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_sources` (
  `roleid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `rsdis` varchar(32) DEFAULT NULL COMMENT '角色和资源的描述',
  KEY `roleid` (`roleid`) USING BTREE,
  KEY `sid` (`sid`) USING BTREE,
  CONSTRAINT `role_sources_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `role_sources_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `sources` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_sources`
--

LOCK TABLES `role_sources` WRITE;
/*!40000 ALTER TABLE `role_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` date DEFAULT NULL,
  `endtime` date DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `define` varchar(256) DEFAULT NULL,
  `fun_fk` int(11) DEFAULT NULL,
  `emp_fk2` int(11) DEFAULT NULL,
  `emp_fk` int(11) NOT NULL,
  `tasktitle` varchar(256) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '值为:0,1,2',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `emp_fk2` (`emp_fk2`) USING BTREE,
  KEY `FK8pqhf0pdn5r478vp69g6sip3` (`fun_fk`) USING BTREE,
  KEY `FKcpxt4jxiaoqj5nwny5ai74drj` (`emp_fk`) USING BTREE,
  CONSTRAINT `FK8pqhf0pdn5r478vp69g6sip3` FOREIGN KEY (`fun_fk`) REFERENCES `function` (`id`),
  CONSTRAINT `FKcpxt4jxiaoqj5nwny5ai74drj` FOREIGN KEY (`emp_fk`) REFERENCES `employee` (`eid`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`fun_fk`) REFERENCES `function` (`id`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`emp_fk2`) REFERENCES `employee` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'2019-06-17','2019-06-20','中',NULL,1,3,1,'员工考勤功能任务','无',2),(2,'2019-09-09','2019-09-29','中',NULL,6,3,1,'完善后台','尽快',1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-10 17:00:57
