-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.46 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 votedb.wj_admins 结构
CREATE TABLE IF NOT EXISTS `wj_admins` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 votedb.wj_answer 结构
CREATE TABLE IF NOT EXISTS `wj_answer` (
  `answerId` int(11) NOT NULL AUTO_INCREMENT COMMENT '答案Id',
  `replayId` int(11) NOT NULL COMMENT '回答者Id',
  `oid` int(11) NOT NULL COMMENT '回复主题Id',
  `qSeq` int(11) DEFAULT NULL COMMENT '问题序号',
  `seSeq` int(11) DEFAULT NULL COMMENT '选项序号',
  `seValue` varchar(1000) DEFAULT NULL COMMENT '选项内容',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`answerId`),
  KEY `Aoid_index` (`oid`),
  KEY `FKReplayId` (`replayId`),
  CONSTRAINT `FKReplayId` FOREIGN KEY (`replayId`) REFERENCES `wj_replay` (`replayId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 votedb.wj_object 结构
CREATE TABLE IF NOT EXISTS `wj_object` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT NULL,
  `discribe` varchar(1000) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `anonymousFlag` char(1) DEFAULT NULL COMMENT '是否匿名投递',
  `giftFlag` int(4) DEFAULT '0' COMMENT '是否赠送参课卷',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 votedb.wj_question 结构
CREATE TABLE IF NOT EXISTS `wj_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `qtype` int(11) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 votedb.wj_replay 结构
CREATE TABLE IF NOT EXISTS `wj_replay` (
  `replayId` int(11) NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  `replayCode` varchar(100) DEFAULT NULL COMMENT '回复者代码',
  `replayIp` varchar(100) DEFAULT NULL COMMENT '回复者IP',
  `oid` int(11) NOT NULL COMMENT '主题Id',
  `replayTime` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`replayId`),
  KEY `oidIndex` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 ROW_FORMAT=DYNAMIC COMMENT='回复内容表';

-- 数据导出被取消选择。


-- 导出  表 votedb.wj_selecter 结构
CREATE TABLE IF NOT EXISTS `wj_selecter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `qseq` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `selseq` int(11) DEFAULT NULL,
  `remark` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
