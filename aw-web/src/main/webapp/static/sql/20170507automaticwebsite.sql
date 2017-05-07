/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : automaticwebsite

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-07 21:45:28
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
-- Table structure for `base_setting`
-- ----------------------------
DROP TABLE IF EXISTS `base_setting`;
CREATE TABLE `base_setting` (
  `BASE_SETTING_ID` varchar(32) NOT NULL COMMENT '基础设置id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `TYPE` varchar(32) NOT NULL COMMENT '设置类型（背景-*，头部-*，横幅-*，内容-*，底部-*）',
  `BS_NAME` varchar(50) DEFAULT NULL COMMENT '设置主体名词',
  `BS_VALUE` varchar(255) DEFAULT NULL COMMENT '设置主体值',
  `BS_TARGET` varchar(255) DEFAULT NULL COMMENT '设置主体对象',
  `BS_CSS` varchar(32) DEFAULT NULL COMMENT '设置样式',
  `MODIFY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `MODIFIER` varchar(32) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`BASE_SETTING_ID`),
  KEY `BASESETTING_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `BASESETTING_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_setting
-- ----------------------------
INSERT INTO `base_setting` VALUES ('16d51072c30449b680d6e807689250ec', '222', 'footer-bg', 'footer_bg_colorpicker', '#eb1fca', '#webFooter', 'background-color', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('191ad328c9ff4336a787a2908b840239', '222', 'title', 'title_y', '-49', '#webTitle', 'top', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('1d47858d39404961a782fd2837cbb6aa', '222', 'bg-width', 'bgWidthSlider', '100', '#mainContent', 'width', '2017-05-07 20:11:30', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('20058482680649bfa2afd43a3552d84a', '222', 'header-bg', 'header_bg_showStyle', 'contain', '#webHeader', '', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('26e90bab08c44601b334cfd24fbc719c', '222', 'menu', 'menu_font_colorpicker', '#39d91f', '#webMenu .inner_menu ul li a', 'color', '2017-05-07 19:31:22', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('2f1f89e8d896487c9f5e0590ab794f9b', '222', 'footer-font', 'footer_linkhover_colorpicker', '#b73392', '.inner_footer .footLinks a:hover', 'color', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('3a5c0b274c4e47ff8b05d50e4ca86883', '222', 'logo', 'logo_height', '75', '#goloModal_pic .logoPic img', 'height', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('4404210a92be47b3ae2b82de3f0b5805', '222', 'banner-width', 'banner_widthSlider', '100', '#webBanner', 'width', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('453d383bf0b745e6b334e3725ce1b377', '222', 'header-border', 'borderHeightSlider', '0', '#webHeader', 'border-bottom', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('47fe54bac6524c9fbfba8a11ec452e6a', '222', 'banner', 'banner_pattern', 'arrowSilde', '#bannerModal_pattern .imgBorder', '', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('495b53cf7716492d81e7c3c670a47db1', '222', 'menu', 'menu_widthSlider', '100', '#webMenu .inner_menu', 'width', '2017-05-07 20:11:30', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('5480478551c74beca25be9294da77c06', '222', 'logo', 'logo_y', '16', '#goloModal_pic .logoPic img', 'top', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('54c6d42218e34c86ae36573ea9f592ea', '222', 'header-bg', 'header_bg_colorpicker', '#E4E6E9', '#webHeader', 'background-color', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('58dadde474354a25ba3488fe11c15d62', '222', 'header-height', 'headerWidthSpiner', '100', '#webHeader', 'height', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('5b35ea52eca9466ebfb91280ca810cfb', '222', 'bg-bg', 'bg_bg_showStyle', 'contain', '#mainContent', '', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('5cc844cc81f1421eb1f7b8931829fc1c', '222', 'logo', 'opacity_logoSlider', '23', '#goloModal_pic .logoPic img', 'opacity', '2017-05-07 19:16:02', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('63676c9c3c634c7794c3bc6f727be7a9', '222', 'header-bg', 'header_bg', 'default', '#webHeader', '', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('6cf639f23e6a4e4d9922361dba1fc87e', '222', 'title', 'webTitle', '<font size=\"5\" color=\"#9fe1e7\">集美大学</font>', '#webTitle', 'html', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('73f63aae5f3c45ce881af7726027a542', '222', 'banner', 'bannerModal_interTimeSpinner', '2500', '#banner', 'interTime', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('8107f0976e4c40e8b6cc5768d7b9cc73', '222', 'footer-font', 'footer_linktext', 'custom', '.inner_footer .footLinks a', '', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('85b7fceb99fb4526ba1ad504443880aa', '222', 'content-width', 'content_marginBottomSlider', '0', '#webContainer', 'margin-bottom', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('8bf39c85d205446fb084bd1d14c8a658', '222', 'menu', 'menu_selectItem_colorpicker', '#b5abac', '#webMenu .inner_menu ul li a:hover', 'background-color', '2017-05-07 19:31:22', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('8e543b39d13343aeb4408e15e71291c1', '222', 'footer-height', 'footer_height', 'custom', '#webFooter', '', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('8e9bc7f2d3de409c9df378704802d42f', '222', 'bg-width', 'bgWidthSpiner', '100', '#mainContent', 'width', '2017-05-07 20:11:30', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('8f361029ba2049e2a9df039dd7a6039d', '222', 'logo', 'logo_width', '280', '#goloModal_pic .logoPic img', 'width', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('91f2836ae7924bf0abf3bf547f229688', '222', 'banner', 'banner_animation', 'left', '#bannerModal_animation', 'effect', '2017-05-07 19:36:54', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('9663b5f3f0ee4212892001e54f70f6d7', '222', 'menu', 'menu_bg_colorpicker', '#e60012', '#webMenu .inner_menu ul', 'background-color', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('9e9a4b2df1ea4dbcb96aeed208c1f215', '222', 'header-height', 'header_height', 'default', '#webHeader', '', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('a0dd0fffeee24693bbeb49360e7d0334', '222', 'bg-bg', 'bg_bg', 'hide', '#mainContent', '', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('a100cd1726564fc4a2fea42db988a6fc', '222', 'banner-height', 'banner_heightSlider', '350', '#webBanner', 'height', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('a3647eca12d04c4da6e8089919f6f4b4', '222', 'bg-width', 'bg_width', 'default', '#mainContent', '', '2017-05-07 20:11:30', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('a554dff995234dc49a58f8bb0b6af168', '222', 'header-border', 'header_border_colorpicker', '#ffffff', '#webHeader', 'border-bottom', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('a8631b2687d248edafc51205447046ce', '222', 'bg-bg', 'bgBgPic', '', '#mainContent', 'src', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('ab65e97c90154a3fa886198af5508230', '222', 'footer-font', 'footer_linktext_colorpicker', '#3882de', '.inner_footer .footLinks a', 'color', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('adabae658d2d458ea19c8dd7859c009f', '222', 'banner', 'bannerModal_delayTimeSpinner', '500', '#banner', 'delayTime', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('afe033edb3ae466f8f80c3be999046cd', '222', 'content-width', 'content_marginTopSlider', '0', '#webContainer', 'margin-top', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('b13d697cb5f44a9ea21b38e384ae6ca1', '222', 'logo', 'logoPic', '/pic/sys/default/jmu-logo.png', '#goloModal_pic .logoPic img', 'src', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('b405290245fe466f8a276119eff62a88', '222', 'banner-width', 'banner_widthSpinner', '100', '#webBanner', 'width', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('b77d12163ebe4ee3bf66b989503d6274', '222', 'footer-bg', 'footer_bg', 'custom', '#webFooter', '', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('befd008aeb924575bda0f8defca413d8', '222', 'bg-bg', 'background_background-colorpicker', '', '#mainContent', 'background-color', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('bf8daa78a1b945009743efb440fcfaf6', '222', 'header-height', 'headerWidthSlider', '100', '#webHeader', 'height', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('c09c026e3d07477dbe9c6173c17cfd58', '222', 'footer-height', 'footer_heightSpinner', '70', '#webFooter', 'height', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('c7a945f3997b4d13ac064fbd7e991add', '222', 'banner-height', 'banner_heightSpinner', '350', '#webBanner', 'height', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('ca2c6cd24bc84f4b8a9527422d8f75f3', '222', 'menu', 'menu_colorpicker', '#473c41', '#webMenu', 'background-color', '2017-05-07 19:31:22', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('ccb7752a438c40bb8cdd4ef6c7b5890c', '222', 'footer-height', 'footer_heightSlider', '70', '#webFooter', 'height', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('d4a8bfa3c67c41648c6e3eb21b5cb498', '222', 'logo', 'logo_x', '381', '#goloModal_pic .logoPic img', 'left', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('d502d0c063b94040882466d8cae363e7', '222', 'logo', 'radius_logoSlider', '50', '#goloModal_pic .logoPic img', 'border-radius', '2017-05-07 19:16:02', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('d7fcc6fa5ce74ae2be0cf817a10024dd', '222', 'title', 'title_x', '801', '#webTitle', 'left', '2017-05-07 19:24:48', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('d8ed8a7145cf40f7b7011287270ca17d', '222', 'footer-font', 'footer_textSlider', '20', '.inner_footer .footLinks span', 'font-size', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('e77ce71030ba42198866f8eb8a325ff4', '222', 'content-width', 'content_widthSlider', '100', '#webContainer', 'width', '2017-05-07 20:11:30', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('ecd14fb6e6404637b26b2df733d9fda1', '222', 'header-bg', 'headerBgPic', '', '#webHeader', 'src', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('ee134c32c6de400a98324f1caa69e7f5', '222', 'header-border', 'header_border', 'hide', '#webHeader', '', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('f1b11c4fe83f405facf054d7d3dba711', '222', 'banner-height', 'banner_height', 'default', '#webBanner', '', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `base_setting` VALUES ('f46221a8df2548abb9cef267e7b91cd8', '222', 'header-border', 'header_border_showStyle', 'solid', '#webHeader', 'border-bottom', '2017-05-06 20:39:23', '111');
INSERT INTO `base_setting` VALUES ('fed7efe5a9014684bea9c83d9b117d9b', '222', 'banner-width', 'banner_width', 'default', '#webBanner', '', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');

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
INSERT INTO `company` VALUES ('222', '你好', 'aw', '0', '1808801480@qq.com', '2017-05-04 13:43:06', null, '0', '2017-08-04', '商务服务', null, null, null, null, null, '2', null, null);

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
-- Table structure for `sys_picture`
-- ----------------------------
DROP TABLE IF EXISTS `sys_picture`;
CREATE TABLE `sys_picture` (
  `PICTURE_ID` varchar(32) NOT NULL COMMENT '图片id',
  `PICTURE_NAME` varchar(32) DEFAULT NULL COMMENT '图片名称',
  `PICTURE_URL` varchar(64) NOT NULL COMMENT '图片路径',
  `PICTURE_TYPE` smallint(1) NOT NULL DEFAULT '0' COMMENT '图片类型（0：系统1；用户）',
  `COMPANY_ID` varchar(32) NOT NULL DEFAULT 'sys' COMMENT '公司id',
  `PICTURE_DESC` varchar(255) DEFAULT NULL COMMENT '图片描述',
  `PICTURE_SORT` varchar(32) DEFAULT NULL COMMENT '图片分类',
  `MODIFY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`PICTURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_picture
-- ----------------------------
INSERT INTO `sys_picture` VALUES ('1', '1', '/pic/sys/PictureLibrary/1.jpg', '0', 'sys', null, null, '2017-05-04 21:50:41');
INSERT INTO `sys_picture` VALUES ('10', '10', '/pic/sys/PictureLibrary/banner-3.jpg', '0', 'sys', null, null, '2017-05-04 21:51:21');
INSERT INTO `sys_picture` VALUES ('11', '11', '/pic/sys/PictureLibrary/banner-4.jpg', '0', 'sys', null, null, '2017-05-04 21:51:23');
INSERT INTO `sys_picture` VALUES ('12', '12', '/pic/sys/PictureLibrary/banner-5.jpg', '0', 'sys', null, null, '2017-05-04 21:51:25');
INSERT INTO `sys_picture` VALUES ('13', '13', '/pic/sys/PictureLibrary/banner-6.jpg', '0', 'sys', null, null, '2017-05-04 21:51:28');
INSERT INTO `sys_picture` VALUES ('14', '14', '/pic/sys/PictureLibrary/image-1.jpg', '0', 'sys', null, null, '2017-05-04 21:51:31');
INSERT INTO `sys_picture` VALUES ('15', '15', '/pic/sys/PictureLibrary/image-2.jpg', '0', 'sys', null, null, '2017-05-04 21:51:35');
INSERT INTO `sys_picture` VALUES ('16', '16', '/pic/sys/PictureLibrary/image-3.jpg', '0', 'sys', null, null, '2017-05-04 21:51:37');
INSERT INTO `sys_picture` VALUES ('17', '17', '/pic/sys/PictureLibrary/image-4.jpg', '0', 'sys', null, null, '2017-05-04 21:51:40');
INSERT INTO `sys_picture` VALUES ('18', '18', '/pic/sys/PictureLibrary/image-5.jpg', '0', 'sys', null, null, '2017-05-04 21:51:43');
INSERT INTO `sys_picture` VALUES ('19', '19', '/pic/sys/PictureLibrary/image-6.jpg', '0', 'sys', null, null, '2017-05-04 21:51:46');
INSERT INTO `sys_picture` VALUES ('2', '2', '/pic/sys/PictureLibrary/2.jpg', '0', 'sys', null, null, '2017-05-04 21:50:42');
INSERT INTO `sys_picture` VALUES ('3', '3', '/pic/sys/PictureLibrary/3.jpg', '0', 'sys', null, null, '2017-05-04 21:50:44');
INSERT INTO `sys_picture` VALUES ('4', '4', '/pic/sys/PictureLibrary/4.jpg', '0', 'sys', null, null, '2017-05-04 21:50:47');
INSERT INTO `sys_picture` VALUES ('5', '5', '/pic/sys/PictureLibrary/1920-2.jpg', '0', 'sys', null, null, '2017-05-04 21:51:09');
INSERT INTO `sys_picture` VALUES ('6', '6', '/pic/sys/PictureLibrary/1920-3.jpg', '0', 'sys', null, null, '2017-05-04 21:51:12');
INSERT INTO `sys_picture` VALUES ('7', '7', '/pic/sys/PictureLibrary/1920-4.jpg', '0', 'sys', null, null, '2017-05-04 21:51:14');
INSERT INTO `sys_picture` VALUES ('8', '8', '/pic/sys/PictureLibrary/banner-1.jpg', '0', 'sys', null, null, '2017-05-04 21:51:16');
INSERT INTO `sys_picture` VALUES ('9', '9', '/pic/sys/PictureLibrary/banner-2.jpg', '0', 'sys', null, null, '2017-05-04 21:51:18');

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
  CONSTRAINT `FK_COMPANEY` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('f78162985b12446fb7c1599f9126d5da', 'aw_1808801480', '1808801480@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '2017-04-27 15:35:47', '11', null, null, null, null, null, null, null, null, '222', '/pic/1.jpg', null, null, '0', null, null);

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
-- Table structure for `web_banner_img`
-- ----------------------------
DROP TABLE IF EXISTS `web_banner_img`;
CREATE TABLE `web_banner_img` (
  `BANNER_IMG_ID` varchar(32) NOT NULL COMMENT '横幅图片id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `BANNER_PIC` varchar(255) NOT NULL COMMENT '横幅图片路径',
  `PIC_URL` varchar(32) NOT NULL DEFAULT '#' COMMENT '图片链接',
  `MODIFY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `MODIFIER` varchar(32) NOT NULL COMMENT '修改人',
  `BANNER_ORDER` int(32) DEFAULT NULL,
  PRIMARY KEY (`BANNER_IMG_ID`),
  KEY `BANNER_IMG_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `BANNER_IMG_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_banner_img
-- ----------------------------
INSERT INTO `web_banner_img` VALUES ('412f005b78604746acde45ea021ac5b6', '222', '/pic/sys/PictureLibrary/image-3.jpg', '#', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da', '4');
INSERT INTO `web_banner_img` VALUES ('8d62d6fe420c44b48626871d1c7902c4', '222', '/pic/sys/PictureLibrary/banner-5.jpg', '#', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da', '0');
INSERT INTO `web_banner_img` VALUES ('93b78a1cee874ab0b797a11c81648c85', '222', '/pic/sys/PictureLibrary/1.jpg', '#', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da', '1');
INSERT INTO `web_banner_img` VALUES ('971a8e8297a7419b92f2d5d3ac570b59', '222', '/pic/sys/PictureLibrary/image-2.jpg', '#', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da', '3');
INSERT INTO `web_banner_img` VALUES ('acd58a2a48df4dae876d4b7b13532857', '222', '/pic/sys/PictureLibrary/image-4.jpg', '#', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da', '2');

-- ----------------------------
-- Table structure for `web_column`
-- ----------------------------
DROP TABLE IF EXISTS `web_column`;
CREATE TABLE `web_column` (
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
  KEY `WEBCOLUMN_COMPANEY_ID` (`COMPANEY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_column
-- ----------------------------
INSERT INTO `web_column` VALUES ('5abb79129cf24184897209c5e8098eb7', '关于我们', '0', 'aboutUs', 'system', 'admin', null, null, '2017-05-07 20:41:24', '0');
INSERT INTO `web_column` VALUES ('5d9b9916e15a481e9e159bd7d7461f97', '产品展示', '0', 'productDisplay', 'system', 'admin', null, null, '2017-05-07 20:41:27', '0');
INSERT INTO `web_column` VALUES ('7a5dfd6d6355456faada8aab8dde9d09', '会员登录', '0', 'memberLogin', 'system', 'admin', null, null, '2017-05-07 20:41:29', '0');
INSERT INTO `web_column` VALUES ('8b9f4ce107ca4e22b028927a8e92d1cc', '公司公告', '0', 'bulletinBoard', 'system', 'admin', null, null, '2017-05-07 20:41:31', '0');
INSERT INTO `web_column` VALUES ('d65e45c3265a44418c009550ff2653bf', '首页', '0', 'index', 'system', 'admin', null, null, '2017-05-07 20:41:33', '0');
INSERT INTO `web_column` VALUES ('e34d1c3611e041cbbde4e7122331ea19', '留言板', '0', 'messageBoard', 'system', 'admin', null, null, '2017-05-07 20:41:35', '0');
INSERT INTO `web_column` VALUES ('feef8a6b8ae34137a8f3876317728d8a', '用户注册', '0', 'memberRegister', 'system', 'admin', null, null, '2017-05-07 20:41:38', '0');

-- ----------------------------
-- Table structure for `web_content`
-- ----------------------------
DROP TABLE IF EXISTS `web_content`;
CREATE TABLE `web_content` (
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
  CONSTRAINT `WEBCONTENT_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_content
-- ----------------------------
INSERT INTO `web_content` VALUES ('2f40e2c18a594c66b926f81d21daab2a', '222', 'productDisplay', '0', '0', '11', '14', 'component_login', '2017-05-07 21:20:57', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `web_content` VALUES ('3b338cffe5804a419bda73a7ec5a4389', '222', 'memberLogin', '0', '0', '12', '29', 'component_bulletinBoard', '2017-05-07 21:21:38', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `web_content` VALUES ('41f879d3bfc3437ab1ec3002b73dc9f3', '222', 'index', '3', '33', '9', '30', 'component_bulletinBoard', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `web_content` VALUES ('6e4000517fc44ab5b53ba4737e783051', '222', 'aboutUs', '0', '0', '3', '30', 'component_login', '2017-05-07 15:28:06', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `web_content` VALUES ('89ab354342dd4540aede1dcd5a74b5c8', '222', 'memberLogin', '1', '29', '9', '32', 'component_login', '2017-05-07 21:21:38', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `web_content` VALUES ('cc490a222fdc4bfdb2a5ed8efee43642', '222', 'index', '0', '63', '12', '29', 'component_bulletinBoard', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');
INSERT INTO `web_content` VALUES ('cfd94212bb9f4bf9ab976109185daf92', '222', 'index', '0', '0', '12', '33', 'component_bulletinBoard', '2017-05-07 20:19:12', 'f78162985b12446fb7c1599f9126d5da');

-- ----------------------------
-- Table structure for `web_footer`
-- ----------------------------
DROP TABLE IF EXISTS `web_footer`;
CREATE TABLE `web_footer` (
  `FOOTER_ID` varchar(32) NOT NULL COMMENT '底部id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `Link_SELECT_IDS` varchar(255) DEFAULT NULL COMMENT '链接已选栏目id',
  `COPYRIGHT_TEXT` text COMMENT '版权信息内容',
  `MODIFY_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `MODIFIER` varchar(32) NOT NULL COMMENT '修改人',
  `MENU_SELECT_IDS` varchar(255) DEFAULT NULL COMMENT '菜单栏已选id',
  PRIMARY KEY (`FOOTER_ID`),
  KEY `FOOTER_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `FOOTER_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_footer
-- ----------------------------
INSERT INTO `web_footer` VALUES ('d86489f06410429eb603cff417504a41', '222', 'd65e45c3265a44418c009550ff2653bf', '<font color=\"#cabdbf\" size=\"2\">Copyright &copy;     2010-2017 福建省厦门集美大学1</font>', '2017-05-07 20:19:12', '111', '5abb79129cf24184897209c5e8098eb7/5d9b9916e15a481e9e159bd7d7461f97/7a5dfd6d6355456faada8aab8dde9d09');
