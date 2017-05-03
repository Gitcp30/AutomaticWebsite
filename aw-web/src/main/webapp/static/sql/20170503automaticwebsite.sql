/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : automaticwebsite

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-03 20:33:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auditing`
-- ----------------------------
DROP TABLE IF EXISTS `auditing`;
CREATE TABLE `auditing` (
  `AUDITING_ID` varchar(32) NOT NULL DEFAULT '' COMMENT 'id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `AUDITING_STATE` smallint(1) NOT NULL COMMENT '状态（0：审核中，1；审核成功，2审核失败）',
  `FAIL_REASON` varchar(255) DEFAULT NULL COMMENT '失败原因',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `AUDITING_TIME` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`AUDITING_ID`),
  KEY `FK_COMPANEY_AUDITING` (`COMPANY_ID`),
  CONSTRAINT `FK_COMPANEY_AUDITING` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auditing
-- ----------------------------

-- ----------------------------
-- Table structure for `basesetting`
-- ----------------------------
DROP TABLE IF EXISTS `basesetting`;
CREATE TABLE `basesetting` (
  `BASE_SETTING_ID` varchar(32) NOT NULL COMMENT '基础设置id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `TYPE` varchar(32) NOT NULL COMMENT '设置类型（背景-*，头部-*，横幅-*，内容-*，底部-*）',
  `BS_NAME` varchar(32) DEFAULT NULL COMMENT '设置主体名词',
  `BS_VALUE` varchar(32) DEFAULT NULL COMMENT '设置主体值',
  `BS_TARGET` varchar(32) DEFAULT NULL COMMENT '设置主体对象',
  `BS_CSS` varchar(32) DEFAULT NULL COMMENT '设置样式',
  `MODIFY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `MODIFIER` varchar(32) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`BASE_SETTING_ID`),
  KEY `BASESETTING_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `BASESETTING_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basesetting
-- ----------------------------

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `COMPANY_ID` varchar(32) NOT NULL COMMENT 'id',
  `COMPANY_NAME` varchar(32) NOT NULL COMMENT '名称',
  `VISIT_URL` varchar(10) NOT NULL COMMENT '公司访问路径',
  `SUBJECT_TYPE` smallint(1) NOT NULL DEFAULT '0' COMMENT '注册主体（0：公司，1：机构，2:个人）',
  `MAILBOX` varchar(32) NOT NULL COMMENT '联系邮箱',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `LOGO_SRC` varchar(255) DEFAULT NULL COMMENT 'logo头像路径',
  `COMPANY_STATE` smallint(1) DEFAULT '2' COMMENT '状态（0：正常，1：锁定 ，2:审核中 3：审核失败）',
  `ESTABLISHMENT_DATE` date DEFAULT NULL COMMENT '成立日期',
  `INDUSTRY_TYPE` varchar(255) DEFAULT NULL COMMENT '所在行业',
  `REPRESENTATIVE` varchar(32) DEFAULT NULL COMMENT '负责人',
  `MOBILE` varchar(11) DEFAULT NULL COMMENT '手机号',
  `TEL_PHONE` varchar(16) DEFAULT NULL COMMENT '固定电话',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `ZIP_CODE` varchar(6) DEFAULT NULL COMMENT '邮政编码',
  `COMPANY_SIZE` smallint(1) DEFAULT '0' COMMENT '规模（0:1-10人，1:10-50人，2:50人以上）',
  `MODIFY_TIME` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `MODIFIER` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`COMPANY_ID`),
  KEY `SUBJECTTYPE` (`SUBJECT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '1', 'aaa', '0', '1', '2017-04-27 09:31:15', null, '0', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `company` VALUES ('5cc0b47ed0584fd2933416d3160a0a9c', '你好', 'aw', '0', '1808801480@qq.com', '2017-04-27 16:42:16', null, '0', '2017-08-04', '商务服务', null, null, null, null, null, '2', null, null);

-- ----------------------------
-- Table structure for `rolefunction`
-- ----------------------------
DROP TABLE IF EXISTS `rolefunction`;
CREATE TABLE `rolefunction` (
  `ROLE_FUNC_ID` varchar(32) NOT NULL COMMENT 'id',
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色id',
  `FUNCTION_ID` varchar(32) NOT NULL COMMENT '功能id',
  PRIMARY KEY (`ROLE_FUNC_ID`),
  KEY `FK_ROLE_ROELFUNC` (`ROLE_ID`),
  KEY `FK_FUNC_ROLEFUNC` (`FUNCTION_ID`),
  CONSTRAINT `FK_FUNC_ROLEFUNC` FOREIGN KEY (`FUNCTION_ID`) REFERENCES `sysfunction` (`FUNCTION_ID`),
  CONSTRAINT `FK_ROLE_ROELFUNC` FOREIGN KEY (`ROLE_ID`) REFERENCES `sysrole` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rolefunction
-- ----------------------------

-- ----------------------------
-- Table structure for `sysfunction`
-- ----------------------------
DROP TABLE IF EXISTS `sysfunction`;
CREATE TABLE `sysfunction` (
  `FUNCTION_ID` varchar(32) NOT NULL COMMENT '主键',
  `FUNCTION_NAME` varchar(32) NOT NULL COMMENT '功能名称',
  `FUNCTION_TYPE` smallint(1) DEFAULT '0' COMMENT '功能类型（0：通用，1：网站，2：系统）',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父节点id',
  `ORDER_NO` smallint(6) DEFAULT NULL COMMENT '同级排序序号',
  `FUNCTION_URL` varchar(10) DEFAULT NULL COMMENT '功能跳转路径',
  `FUNCTION_DESC` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`FUNCTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysfunction
-- ----------------------------
INSERT INTO `sysfunction` VALUES ('1', '系统功能', '0', null, null, null, 'aaaaaaaaaaaaaaaaaaaaa');
INSERT INTO `sysfunction` VALUES ('122', '系统功能', '1', null, null, null, 'aaaaaaaaaaaaaaaaaaaaa');

-- ----------------------------
-- Table structure for `sysrole`
-- ----------------------------
DROP TABLE IF EXISTS `sysrole`;
CREATE TABLE `sysrole` (
  `ROLE_ID` varchar(32) NOT NULL COMMENT 'id',
  `ROLE_NAME` varchar(32) NOT NULL COMMENT '角色名称',
  `ROLE_DESC` varchar(255) DEFAULT NULL COMMENT '描述',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`ROLE_ID`),
  KEY `FK_COMPAEY_ROLE` (`COMPANY_ID`),
  CONSTRAINT `FK_COMPAEY_ROLE` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysrole
-- ----------------------------
INSERT INTO `sysrole` VALUES ('1', '1', null, '1', '2017-04-27 00:14:58');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USER_ID` varchar(32) NOT NULL COMMENT '用户id',
  `SYS_ACCOUNT` varchar(20) NOT NULL COMMENT '系统账号（可用登录）',
  `MAILBOX` varchar(32) NOT NULL COMMENT '邮箱',
  `PASSWORD` varchar(255) NOT NULL COMMENT '密码',
  `USER_TYPE` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户类型(0：员工，1：网站管理员，2：系统管理员）',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `USER_NAME` varchar(32) DEFAULT NULL COMMENT '用户名',
  `MOBILE` varchar(11) DEFAULT NULL COMMENT '手机号',
  `SEX` smallint(1) DEFAULT NULL COMMENT '性别（0：男，1：女）',
  `DUTIES` varchar(255) DEFAULT NULL COMMENT '职务',
  `BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `TEL_PHONE` varchar(16) DEFAULT NULL COMMENT '固定电话',
  `ID_CARD` varchar(18) DEFAULT NULL COMMENT '身份证',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `COMPANY_ID` varchar(32) DEFAULT NULL COMMENT '公司id',
  `PIC_SRC` varchar(255) DEFAULT NULL COMMENT '头像路径',
  `MODIFY_TIME` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `MODIFIER` varchar(32) DEFAULT NULL COMMENT '修改人',
  `USER_STATE` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户状态（0：正常，1锁定）',
  `LCOK_REASON` varchar(255) DEFAULT NULL COMMENT '锁定原因',
  `STAFF_NO` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `FK_COMPANEY` (`COMPANY_ID`),
  CONSTRAINT `FK_COMPANEY` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('f78162985b12446fb7c1599f9126d5da', 'aw_1808801480', '1808801480@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '2017-04-27 15:35:47', '11', null, null, null, null, null, null, null, null, '5cc0b47ed0584fd2933416d3160a0a9c', '/pic/1.jpg', null, null, '0', null, null);

-- ----------------------------
-- Table structure for `userrole`
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `USER_ROLE_ID` varchar(32) NOT NULL COMMENT '主键',
  `USER_ID` varchar(32) NOT NULL COMMENT '用户id',
  `ROLE_ID` varchar(32) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`USER_ROLE_ID`),
  KEY `FK_USER_USERROLE` (`USER_ID`),
  KEY `FK_ROLE_USERROEL` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_USERROEL` FOREIGN KEY (`ROLE_ID`) REFERENCES `sysrole` (`ROLE_ID`),
  CONSTRAINT `FK_USER_USERROLE` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrole
-- ----------------------------

-- ----------------------------
-- Table structure for `webbanner`
-- ----------------------------
DROP TABLE IF EXISTS `webbanner`;
CREATE TABLE `webbanner` (
  `BANNER_ID` varchar(32) NOT NULL COMMENT '横幅id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `SWITCH_TYPE` smallint(1) NOT NULL DEFAULT '0' COMMENT '切换方式（0：数字轮播；1:箭头滑动）',
  `ANIMATIN_TYPE` varchar(32) NOT NULL COMMENT '动画方式（fode,fade,left,top）',
  `INTERTIME` int(255) NOT NULL COMMENT '横幅展示时间(毫秒)',
  `DELAYTME` int(255) NOT NULL COMMENT '动画切换时间(毫秒)',
  `MODIFY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `MODIFIER` varchar(32) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`BANNER_ID`),
  KEY `BANNER_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `BANNER_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webbanner
-- ----------------------------

-- ----------------------------
-- Table structure for `webbannerimg`
-- ----------------------------
DROP TABLE IF EXISTS `webbannerimg`;
CREATE TABLE `webbannerimg` (
  `BANNER_IMG_ID` varchar(32) NOT NULL COMMENT '横幅图片id',
  `BANNER_ID` varchar(32) NOT NULL COMMENT '横幅id',
  `BANNER_PIC` varchar(255) NOT NULL COMMENT '横幅图片路径',
  `PIC_URL` varchar(32) NOT NULL DEFAULT '#' COMMENT '图片链接',
  `MODIFY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `MODIFIER` varchar(32) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`BANNER_IMG_ID`),
  KEY `BANNERPIC_BANNER_ID` (`BANNER_ID`),
  CONSTRAINT `BANNERPIC_BANNER_ID` FOREIGN KEY (`BANNER_ID`) REFERENCES `webbanner` (`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webbannerimg
-- ----------------------------

-- ----------------------------
-- Table structure for `webcolumn`
-- ----------------------------
DROP TABLE IF EXISTS `webcolumn`;
CREATE TABLE `webcolumn` (
  `COLUMN_ID` varchar(32) NOT NULL COMMENT '栏目id',
  `COLUMN_NAME` varchar(32) NOT NULL COMMENT '栏目名称',
  `COLUMN_TYPE` smallint(1) NOT NULL DEFAULT '1' COMMENT '栏目类型（0：系统；1：用户）',
  `URL` varchar(32) NOT NULL COMMENT '对应访问地址',
  `COMPANEY_ID` varchar(32) DEFAULT NULL COMMENT '公司id',
  `CREATOR` varchar(32) NOT NULL COMMENT '修改人',
  `MODIFY_TIME` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `MODIFIER` varchar(32) DEFAULT NULL COMMENT '修改人',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `STATE` smallint(1) NOT NULL DEFAULT '0' COMMENT '栏目状态（0：启用：1停用）',
  PRIMARY KEY (`COLUMN_ID`),
  KEY `WEBCOLUMN_COMPANEY_ID` (`COMPANEY_ID`),
  CONSTRAINT `WEBCOLUMN_COMPANEY_ID` FOREIGN KEY (`COMPANEY_ID`) REFERENCES `company` (`COMPANY_ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webcolumn
-- ----------------------------

-- ----------------------------
-- Table structure for `webcontent`
-- ----------------------------
DROP TABLE IF EXISTS `webcontent`;
CREATE TABLE `webcontent` (
  `CONTENT_ID` varchar(32) NOT NULL COMMENT 'web页面内容部分',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `COMUMN_ID` varchar(32) NOT NULL COMMENT '栏目id',
  `POSITION_X` int(255) NOT NULL DEFAULT '0' COMMENT '位置x',
  `POSITION_Y` int(255) NOT NULL DEFAULT '0' COMMENT '位置y',
  `SIZE_WIDTH` int(255) NOT NULL DEFAULT '0' COMMENT '宽度',
  `SIZE_HEIGHT` int(255) NOT NULL DEFAULT '0' COMMENT '高度',
  `COMPONENT_ID` varchar(32) NOT NULL COMMENT '组件id',
  `MODIFY_TME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `MODIFIER` varchar(32) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`CONTENT_ID`),
  KEY `WEBCONTENT_COMPANY_ID` (`COMPANY_ID`),
  KEY `WEBCONTENT_CONMUMN_ID` (`COMUMN_ID`),
  CONSTRAINT `WEBCONTENT_CONMUMN_ID` FOREIGN KEY (`COMUMN_ID`) REFERENCES `webcolumn` (`COLUMN_ID`),
  CONSTRAINT `WEBCONTENT_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webcontent
-- ----------------------------

-- ----------------------------
-- Table structure for `webfooter`
-- ----------------------------
DROP TABLE IF EXISTS `webfooter`;
CREATE TABLE `webfooter` (
  `FOOTER_ID` varchar(32) NOT NULL COMMENT '底部id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `SELECT_COLUMN_ID` varchar(255) DEFAULT NULL COMMENT '已选栏目id',
  `COPYRIGHT_TEXT` text COMMENT '版权信息内容',
  `MODIFY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `MODIFIER` varchar(32) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`FOOTER_ID`),
  KEY `FOOTER_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `FOOTER_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webfooter
-- ----------------------------

-- ----------------------------
-- Table structure for `webheader`
-- ----------------------------
DROP TABLE IF EXISTS `webheader`;
CREATE TABLE `webheader` (
  `HEADER_ID` varchar(32) NOT NULL COMMENT '网站头部id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `LOGO_PIC` varchar(255) NOT NULL COMMENT 'logo路径',
  `LOGO_POSITION_X` int(255) NOT NULL DEFAULT '0' COMMENT 'logo位置x',
  `LOGO_POSITION_Y` int(255) NOT NULL DEFAULT '0' COMMENT 'logo位置y',
  `LOGO_SIZE_WIDTH` int(255) NOT NULL DEFAULT '0' COMMENT 'logo宽度',
  `LOGO_SIZE_HEIGHT` int(255) NOT NULL DEFAULT '0' COMMENT 'logo高度',
  `LOGO_RADIUS` int(255) NOT NULL DEFAULT '0' COMMENT 'logo弧度',
  `LOGO_OPATICY` int(255) NOT NULL DEFAULT '100' COMMENT 'logo透明度',
  `TITLE_TEXT` text NOT NULL COMMENT '标题内容',
  `TITLE_POSITION_X` int(255) NOT NULL DEFAULT '0' COMMENT '标题位置x',
  `TITLE_POSITION_Y` int(255) NOT NULL DEFAULT '0' COMMENT '标题位置y',
  `MODIFY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `MODIFIER` varchar(32) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`HEADER_ID`),
  KEY `WEBHEADER_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `WEBHEADER_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webheader
-- ----------------------------

-- ----------------------------
-- Table structure for `webnavgationbar`
-- ----------------------------
DROP TABLE IF EXISTS `webnavgationbar`;
CREATE TABLE `webnavgationbar` (
  `NAVGATION_BAR_ID` varchar(32) NOT NULL COMMENT '导航栏id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `MENU_COLOR` varchar(32) NOT NULL COMMENT '菜单栏颜色',
  `MENU_ITEM_COLOR` varchar(32) NOT NULL COMMENT '菜单栏  选项颜色',
  `FONT_COLOR` varchar(32) NOT NULL COMMENT '文字颜色',
  `SELECT_COLOR` varchar(32) NOT NULL COMMENT '选中颜色',
  `MENU_WIDTH` varchar(255) NOT NULL COMMENT '菜单栏宽度',
  `MODIFY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `MODIFIER` varchar(32) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`NAVGATION_BAR_ID`),
  KEY `NAVGATIONBAR_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `NAVGATIONBAR_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webnavgationbar
-- ----------------------------
