/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : automaticwebsite

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-24 10:58:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auditing`
-- ----------------------------
DROP TABLE IF EXISTS `auditing`;
CREATE TABLE `auditing` (
  `AUDITING_ID` varchar(32) NOT NULL DEFAULT '' COMMENT 'id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `AUDITING_STATE` smallint(1) NOT NULL COMMENT '状态（0：审核中，3审核失败4；审核成功，）',
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
INSERT INTO `auditing` VALUES ('053229df4f914efc84b4bc7b69d8a46a', 'c161a6248cb647c7b25bfbf4263886ef', '4', '', '2017-05-24 02:07:13', '2017-05-24 02:10:53');

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
INSERT INTO `base_setting` VALUES ('04ea150689054ba7bdb4aa935577ba83', 'c161a6248cb647c7b25bfbf4263886ef', 'logo', 'opacity_logoSlider', '100', '#goloModal_pic .logoPic img', 'opacity', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('0b64cc4bced84c6e976d70d27611d687', 'c161a6248cb647c7b25bfbf4263886ef', 'footer-height', 'footer_heightSpinner', '80', '#webFooter', 'height', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('0e494a03d3974c18ab0f0d2bdd593a6f', 'c161a6248cb647c7b25bfbf4263886ef', 'logo', 'logo_y', '14', '#goloModal_pic .logoPic img', 'top', '2017-05-24 02:11:55', 'c4465e5799a849e5ba578e4f22b42b46');
INSERT INTO `base_setting` VALUES ('12fadffc407b442b8d831e1476414f41', 'c161a6248cb647c7b25bfbf4263886ef', 'header-bg', 'headerBgPic', '', '#webHeader', 'src', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('1352ced7513843f3a8a892b2da7a0806', 'c161a6248cb647c7b25bfbf4263886ef', 'footer-font', 'footer_linktext', 'default', '.inner_footer .footLinks a', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('15d44f02234549a1a6e9de105fcf2945', 'c161a6248cb647c7b25bfbf4263886ef', 'title', 'webTitle', '<font size=\"7\" color=\"#f83a22\">集美大学</font>', '#webTitle', 'html', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('18e334b0f742429b822cfa519a193392', 'c161a6248cb647c7b25bfbf4263886ef', 'footer-font', 'footer_linktext_colorpicker', '#8b939d', '.inner_footer .footLinks a', 'color', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('1dfa1a40449942c594057a4dc1f85795', 'c161a6248cb647c7b25bfbf4263886ef', 'header-border', 'header_border_colorpicker', '#ffffff', '#webHeader', 'border-bottom', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('213430f3cf974c80baffbcbf80737d02', 'c161a6248cb647c7b25bfbf4263886ef', 'footer-height', 'footer_height', 'default', '#webFooter', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('2ac0b78a459d45cabeb0515e634f439e', 'c161a6248cb647c7b25bfbf4263886ef', 'bg-bg', 'bgBgPic', '', '#mainContent', 'src', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('3514ebc4a41a4f11b4fd1e41cb15770e', 'c161a6248cb647c7b25bfbf4263886ef', 'header-border', 'header_border_showStyle', 'solid', '#webHeader', 'border-bottom', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('37bced7415db408d9205985ea3a5acfe', 'c161a6248cb647c7b25bfbf4263886ef', 'logo', 'radius_logoSlider', '23', '#goloModal_pic .logoPic img', 'border-radius', '2017-05-24 02:12:08', 'c4465e5799a849e5ba578e4f22b42b46');
INSERT INTO `base_setting` VALUES ('39aecc5e452441119aa5f919758d0e3e', 'c161a6248cb647c7b25bfbf4263886ef', 'content-width', 'content_widthSlider', '100', '#webContainer', 'width', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('3caf33777ee8429c97ff03efab4f0f6e', 'c161a6248cb647c7b25bfbf4263886ef', 'bg-bg', 'bg_bg', 'default', '#mainContent', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('42033eee4585496d97877633b5952807', 'c161a6248cb647c7b25bfbf4263886ef', 'logo', 'logo_width', '280', '#goloModal_pic .logoPic img', 'width', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('4cf1c1d6ed0f4c00979132e9ed59485c', 'c161a6248cb647c7b25bfbf4263886ef', 'footer-font', 'footer_textSlider', '14', '.inner_footer .footLinks span', 'font-size', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('4eaa1af44048412abde8473c133cf0a8', 'c161a6248cb647c7b25bfbf4263886ef', 'title', 'title_y', '-65', '#webTitle', 'top', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('4f8b4b842b954e8aa8fb38c255b48b48', 'c161a6248cb647c7b25bfbf4263886ef', 'header-height', 'header_height', 'default', '#webHeader', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('50532a141f4a4e0e9cf075d6f45fc351', 'c161a6248cb647c7b25bfbf4263886ef', 'logo', 'logo_height', '75', '#goloModal_pic .logoPic img', 'height', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('50d970ff33fa4f13a60248f816dfb756', 'c161a6248cb647c7b25bfbf4263886ef', 'banner-height', 'banner_heightSpinner', '350', '#webBanner', 'height', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('550388d5e6f04154a074d6581bfda9a9', 'c161a6248cb647c7b25bfbf4263886ef', 'header-bg', 'header_bg_colorpicker', '#E4E6E9', '#webHeader', 'background-color', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('56008d5541104da7ae6bfdb23c97a104', 'c161a6248cb647c7b25bfbf4263886ef', 'banner-height', 'banner_heightSlider', '350', '#webBanner', 'height', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('58f57f090fd348098c011c43f395a7d6', 'c161a6248cb647c7b25bfbf4263886ef', 'banner', 'bannerModal_delayTimeSpinner', '500', '#banner', 'delayTime', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('5a81ece76f6a48c3b6228af53fdaccc1', 'c161a6248cb647c7b25bfbf4263886ef', 'header-bg', 'header_bg', 'default', '#webHeader', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('5e84ea409c5f47cfa7d4ac2defc5f4df', 'c161a6248cb647c7b25bfbf4263886ef', 'bg-bg', 'background_background-colorpicker', '#E4E6E9', '#mainContent', 'background-color', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('611d9c0ce06a4241940c0ae88e9af6a2', 'c161a6248cb647c7b25bfbf4263886ef', 'logo', 'logo_x', '341', '#goloModal_pic .logoPic img', 'left', '2017-05-24 02:11:55', 'c4465e5799a849e5ba578e4f22b42b46');
INSERT INTO `base_setting` VALUES ('65479d82165b4427a143abfffc479a84', 'c161a6248cb647c7b25bfbf4263886ef', 'bg-width', 'bgWidthSpiner', '100', '#mainContent', 'width', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('6b2d45d1ca364d778740b65443663bac', 'c161a6248cb647c7b25bfbf4263886ef', 'banner', 'banner_animation', 'fold', '#bannerModal_animation', 'effect', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('6cb5a4b599424abb871b707c417d49a4', 'c161a6248cb647c7b25bfbf4263886ef', 'footer-bg', 'footer_bg_colorpicker', '#222222', '#webFooter', 'background-color', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('76f3f5621bc2424fb14bf9974019a84a', 'c161a6248cb647c7b25bfbf4263886ef', 'content-width', 'content_marginTopSlider', '0', '#webContainer', 'margin-top', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('781dd70b72454a8cb47b8fd435448e3d', 'c161a6248cb647c7b25bfbf4263886ef', 'footer-font', 'footer_linkhover_colorpicker', '#ffffff', '.inner_footer .footLinks a:hover', 'color', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('798336831474476c947fb3c719921716', 'c161a6248cb647c7b25bfbf4263886ef', 'footer-bg', 'footer_bg', 'default', '#webFooter', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('7c8c626893934d52a53a013ef4607456', 'c161a6248cb647c7b25bfbf4263886ef', 'banner-width', 'banner_width', 'default', '#webBanner', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('82750ad3b5cd47f1b170a1d6a6099870', 'c161a6248cb647c7b25bfbf4263886ef', 'content-width', 'content_marginBottomSlider', '0', '#webContainer', 'margin-bottom', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('831b53351d4c4835808d4d322bf3f50b', 'c161a6248cb647c7b25bfbf4263886ef', 'menu', 'menu_widthSlider', '80', '#webMenu .inner_menu', 'width', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('91a48cef6fb0443490f7d09a8a58fbc5', 'c161a6248cb647c7b25bfbf4263886ef', 'menu', 'menu_font_colorpicker', '#ffffff', '#webMenu .inner_menu ul li a', 'color', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('96fdd67d15a64023af8d840a745b2949', 'c161a6248cb647c7b25bfbf4263886ef', 'header-border', 'borderHeightSlider', '0', '#webHeader', 'border-bottom', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('9fb21a03755848da99121f3935e78dc3', 'c161a6248cb647c7b25bfbf4263886ef', 'header-bg', 'header_bg_showStyle', 'contain', '#webHeader', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('a28b3333cf45462db58ed029072abfc3', 'c161a6248cb647c7b25bfbf4263886ef', 'bg-width', 'bg_width', 'default', '#mainContent', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('adcfb2e2570a48699f344726f47d0b8a', 'c161a6248cb647c7b25bfbf4263886ef', 'banner', 'bannerModal_interTimeSpinner', '2500', '#banner', 'interTime', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('b1c9654abfe94a1cb9ecf457894d4266', 'c161a6248cb647c7b25bfbf4263886ef', 'menu', 'menu_selectItem_colorpicker', '#cc0010', '#webMenu .inner_menu ul li a:hover', 'background-color', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('b200986989404a759c3427e286b355e3', 'c161a6248cb647c7b25bfbf4263886ef', 'header-border', 'header_border', 'hide', '#webHeader', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('b46b18d086654a48b339cc04ffac5d86', 'c161a6248cb647c7b25bfbf4263886ef', 'menu', 'menu_bg_colorpicker', '#e60012', '#webMenu .inner_menu ul', 'background-color', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('beee2aa5e1f446cb9838345af2c53cd7', 'c161a6248cb647c7b25bfbf4263886ef', 'bg-bg', 'bg_bg_showStyle', 'contain', '#mainContent', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('bf548ab1d1df40bc8f77140a2c968911', 'c161a6248cb647c7b25bfbf4263886ef', 'logo', 'logoPic', '/pic/sys/PictureLibrary/banner-4.jpg', '#goloModal_pic .logoPic img', 'src', '2017-05-24 02:12:08', 'c4465e5799a849e5ba578e4f22b42b46');
INSERT INTO `base_setting` VALUES ('bfd28126f96c4980b82b704e5633c333', 'c161a6248cb647c7b25bfbf4263886ef', 'header-height', 'headerWidthSpiner', '100', '#webHeader', 'height', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('c21ede4c74fa4a22801a548cba00d788', 'c161a6248cb647c7b25bfbf4263886ef', 'title', 'title_x', '650', '#webTitle', 'left', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('c4831adc77b140e1bdac01d3c1efd75e', 'c161a6248cb647c7b25bfbf4263886ef', 'menu', 'menu_colorpicker', '#e60012', '#webMenu', 'background-color', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('cb44ac4d672c4ec8914c5c2ca2f267c5', 'c161a6248cb647c7b25bfbf4263886ef', 'footer-height', 'footer_heightSlider', '80', '#webFooter', 'height', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('d923436f2a5f48d0922eb8372de9829d', 'c161a6248cb647c7b25bfbf4263886ef', 'banner-width', 'banner_widthSpinner', '100', '#webBanner', 'width', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('e0f4f5dc8fdb431c95548f8fea48cac5', 'c161a6248cb647c7b25bfbf4263886ef', 'banner-height', 'banner_height', 'default', '#webBanner', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('e4d78b7e184f453d84f5e49c72d14075', 'c161a6248cb647c7b25bfbf4263886ef', 'banner', 'banner_pattern', 'arrowSilde', '#bannerModal_pattern .imgBorder', '', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('e52782ac52e344a09ad0b1cc618bb50b', 'c161a6248cb647c7b25bfbf4263886ef', 'bg-width', 'bgWidthSlider', '100', '#mainContent', 'width', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('e835273b7c104343b47b2199fc9e97ed', 'c161a6248cb647c7b25bfbf4263886ef', 'banner-width', 'banner_widthSlider', '100', '#webBanner', 'width', '2017-05-24 02:10:53', '1');
INSERT INTO `base_setting` VALUES ('f603a4f2f6994adf9ff8a4ff2f5118d8', 'c161a6248cb647c7b25bfbf4263886ef', 'header-height', 'headerWidthSlider', '100', '#webHeader', 'height', '2017-05-24 02:10:53', '1');

-- ----------------------------
-- Table structure for `bullentin_board`
-- ----------------------------
DROP TABLE IF EXISTS `bullentin_board`;
CREATE TABLE `bullentin_board` (
  `BULLENTIN_BOARD_ID` varchar(32) NOT NULL COMMENT '公告id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `BULLENTIN_BOARD_TITLE` varchar(255) NOT NULL COMMENT '公告标题',
  `BULLENTIN_BOARD_CONTENT` text NOT NULL COMMENT '公告内容',
  `BB_ORDER` int(32) DEFAULT NULL COMMENT '序号，权重',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATOR` varchar(32) NOT NULL COMMENT '创建人',
  `MODIFY_TIME` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `MODIFIER` varchar(32) DEFAULT NULL COMMENT '修改人',
  `STATUS` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：正常：1停用 2：最新 3：推广）',
  PRIMARY KEY (`BULLENTIN_BOARD_ID`),
  KEY `BULLENTIN_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `BULLENTIN_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bullentin_board
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
INSERT INTO `company` VALUES ('11', '11', '1', '0', '180880180@qq.com', '2017-05-23 22:04:41', null, '0', '2017-05-12', '商品贸易', 'qweqwe', '18950178315', '111111', 'asdads', '350300', '1', '2017-05-23 22:01:56', '1');
INSERT INTO `company` VALUES ('12', '12', '12', '12', '12', '2017-05-21 14:32:46', null, '0', null, null, null, null, null, null, null, '0', '2017-05-21 14:32:46', '1');
INSERT INTO `company` VALUES ('22', '22', '22', '22', '2', '2017-05-21 14:32:46', null, '0', null, null, null, null, null, null, null, '0', '2017-05-21 14:32:46', '1');
INSERT INTO `company` VALUES ('3', '3', '3', '3', '3', '2017-05-21 14:58:49', null, '0', '1970-01-01', null, '', '', '', '', '', '0', '2017-05-21 14:58:49', '1');
INSERT INTO `company` VALUES ('40a26dad53174a84b84d957451d1c1c0', '你好有限公司', 'XYM', '0', '931998400@qq.com1', '2017-05-24 02:05:42', null, '0', '2017-10-06', '商务服务', '11v', '11', '11', 'e111', '11', '2', '2017-05-21 15:10:10', '1');
INSERT INTO `company` VALUES ('c161a6248cb647c7b25bfbf4263886ef', '康康有限公司', 'kangkang', '0', '931998400@qq.com', '2017-05-24 02:10:53', null, '0', '2017-05-25', '商品贸易', null, null, null, null, null, '2', null, null);

-- ----------------------------
-- Table structure for `message_board`
-- ----------------------------
DROP TABLE IF EXISTS `message_board`;
CREATE TABLE `message_board` (
  `MESSAGE_BOARD_ID` varchar(32) NOT NULL COMMENT '留言板id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `USER_NAME` varchar(255) DEFAULT NULL COMMENT '用户名',
  `MAILBOX` varchar(255) NOT NULL COMMENT '游戏',
  `CONTENT` varchar(255) NOT NULL COMMENT '留言内容',
  `CREATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`MESSAGE_BOARD_ID`),
  KEY `MESSAGE_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `MESSAGE_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_board
-- ----------------------------
INSERT INTO `message_board` VALUES ('11', '11', '231', '123', '132', '2017-05-24 01:41:27');
INSERT INTO `message_board` VALUES ('12', '11', '的冯绍峰', '12', '12', '2017-05-24 01:41:36');
INSERT INTO `message_board` VALUES ('2', '11', '12', '235', '45', '2017-05-24 01:41:48');
INSERT INTO `message_board` VALUES ('3', '11', '214', '123', '123', '2017-05-24 01:41:53');
INSERT INTO `message_board` VALUES ('4', '11', '123', '1321', '123', '2017-05-24 01:29:59');
INSERT INTO `message_board` VALUES ('5', '11', '123', '45', '312', '2017-07-13 01:41:59');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `PRODUCT_ID` varchar(32) NOT NULL COMMENT '产品id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `PRODUCT_IMG` varchar(32) DEFAULT NULL COMMENT '图片',
  `PRODUCT_DESC` char(255) DEFAULT NULL COMMENT '描述',
  `STATE` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：正常1：停用2：最新。。。）',
  `PRODUCT_ORDER` int(255) DEFAULT NULL COMMENT '权重序号',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATOR` varchar(32) NOT NULL COMMENT '创建人',
  `MODIFY_TIME` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `MODIFIER` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `PRODUCT_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `PRODUCT_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

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
  `TEXT` varchar(32) NOT NULL COMMENT '功能名称',
  `FUNCTION_TYPE` smallint(1) DEFAULT '0' COMMENT '功能类型（0：通用，1：网站，2：系统）',
  `PARENT_ID` varchar(32) DEFAULT NULL COMMENT '父节点id',
  `ORDER_NO` smallint(6) DEFAULT NULL COMMENT '同级排序序号',
  `URL` varchar(255) DEFAULT NULL COMMENT '功能跳转路径',
  `FUNCTION_DESC` varchar(255) DEFAULT NULL COMMENT '描述',
  `FUNCTION_CLASS` varchar(255) DEFAULT NULL COMMENT '图标',
  `STYLE` varchar(255) DEFAULT NULL COMMENT '开/关状态',
  PRIMARY KEY (`FUNCTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysfunction
-- ----------------------------
INSERT INTO `sysfunction` VALUES ('31f6510afe7e43c0bdb6c8a1d1acecd7', '欢迎页面', '0', 'eeb6fa6192d545bdbdc53003dcfc901a', null, '/admin/welcome', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('36db70d22a2345e094bf347fdf815078', '单位中心', '1', '', null, '', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('680eedd613ff4f1994918f28b922bfdb', '员工管理', '1', '908aca79a8a047b09577709fec683fc5', null, '/admin/web/employeePage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('81f1e14eed4b4574a699647eaa790da9', '用户管理', '1', '36db70d22a2345e094bf347fdf815078', null, '/admin/web/userPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('8f3573c6391f4e2f8bbeae5439300eba', '功能管理', '1', 'eeb6fa6192d545bdbdc53003dcfc901a', null, '/admin/sys/functionPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('908aca79a8a047b09577709fec683fc5', '网站管理', '1', '', null, '', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('a7acb6b7bc434b3e9e0305069705163d', '单位中心', '1', '36db70d22a2345e094bf347fdf815078', null, '/admin/web/companyPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('c0b9c4ade4494d659916f1b6e9809463', '留言板管理', '1', '908aca79a8a047b09577709fec683fc5', null, '/admin/web/messageBoardPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('d9b4b357d9994fd8a4cf43ba53105f0b', '单位审核', '0', 'eeb6fa6192d545bdbdc53003dcfc901a', null, '/admin/sys/companyAuditing', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('de752558fcc74325801b3a6ac6408ef2', '单位管理', '0', 'eeb6fa6192d545bdbdc53003dcfc901a', null, '/admin/sys/companyPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('eeb6fa6192d545bdbdc53003dcfc901a', '审核中心', '1', '', null, '', '', 'menu-icon fa fa-list', 'open');

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
INSERT INTO `user` VALUES ('0a64c5bcbc9e47589dfe27da57cac50d', 'aw_11ss34', '11ss34', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 19:57:11', '11', '11', '0', '11', '2017-05-23', '11', '11', '11', '11', '11', '/pic/sys/PictureLibrary/1.jpg', '2017-05-23 23:01:49', '0a64c5bcbc9e47589dfe27da57cac50d', '0', null, '11');
INSERT INTO `user` VALUES ('1', '12', '123456', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '2017-05-18 09:54:35', 'ww', 'ss', '0', '11', '2017-05-23', '11', '1', '', '1', '11', '/pic/profile/e5074dec5eed458296a1e0047964126b.jpg', '2017-05-23 23:09:51', '1', '0', null, 'ss');
INSERT INTO `user` VALUES ('2e809dbc34f04fb6be6078afa95a16b7', 'aw_11ss34444', '11ss34444', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 19:57:22', '11', '11', '0', '11', '2017-05-23', '11', '11', '11', '11', '11', '/pic/sys/PictureLibrary/1.jpg', null, null, '0', null, '11');
INSERT INTO `user` VALUES ('3c629f13569b4ab581e77ba500930a4d', 'aw_931998400', '9319984001@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '2017-05-08 15:50:00', null, null, null, null, null, null, null, null, null, '40a26dad53174a84b84d957451d1c1c0', null, null, null, '0', null, null);
INSERT INTO `user` VALUES ('661766c3877a4906af2e4c99271ed0d2', 'aw_11ss344444', '11ss344444', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 19:57:26', '11', '11', '0', '11', '2017-05-23', '11', '11', '11', '11', '11', '/pic/sys/PictureLibrary/1.jpg', null, null, '0', null, '11');
INSERT INTO `user` VALUES ('70f432e407f948a594b26192f449a5da', 'aw_11ss3444444', '11ss3444444', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 19:57:30', '11', '11', '0', '11', '2017-05-23', '11', '11', '11', '11', '11', '/pic/sys/PictureLibrary/1.jpg', null, null, '0', null, '11');
INSERT INTO `user` VALUES ('853022a496274c64907a1538e17a0123', 'aw_931998400', '931998400@1qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 23:00:45', '11', '11', '0', '', '1970-01-01', '', '', '', '', '11', '/pic/sys/PictureLibrary/1.jpg', '2017-05-23 23:03:05', '853022a496274c64907a1538e17a0123', '0', null, '111');
INSERT INTO `user` VALUES ('927998d7a4a145159a4bfa36f6207f97', 'aw_11ss344', '11ss344', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 19:57:15', '11', '11', '0', '11', '2017-05-23', '11', '11', '11', '11', '11', '/pic/sys/PictureLibrary/1.jpg', '2017-05-23 20:23:40', '1', '0', null, '11');
INSERT INTO `user` VALUES ('958ff96acdbe4ab8ae55fa7146520dd5', 'aw_ss', 'ss2323', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 22:24:58', 'ss2323', 'ss23', '1', '23', '1970-01-01', '2323', '23', '2323', '23', '11', '/pic/sys/PictureLibrary/1.jpg', '2017-05-23 22:32:15', '958ff96acdbe4ab8ae55fa7146520dd5', '1', null, 'ss23');
INSERT INTO `user` VALUES ('ad3245a3b476429997db75e6b69af9b4', 'aw_931998400', '9319984001@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 22:08:37', 'ww', '', '0', '', null, '', '', '', '', '11', '/pic/sys/PictureLibrary/1.jpg', null, null, '0', null, '');
INSERT INTO `user` VALUES ('b0cc8c86d6f740a6ac10bc37ab7ebbbe', 'aw_11ss3444', '11ss3444', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 19:57:18', 'sssssssss', '11', '0', '11', '2017-05-23', '11', '11', '11', '11', '11', '/pic/sys/PictureLibrary/1.jpg', '2017-05-23 23:10:01', 'b0cc8c86d6f740a6ac10bc37ab7ebbbe', '0', null, '11');
INSERT INTO `user` VALUES ('c4465e5799a849e5ba578e4f22b42b46', 'aw_931998400', '931998400@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '2017-05-24 02:07:13', null, null, null, null, null, null, null, null, null, 'c161a6248cb647c7b25bfbf4263886ef', null, null, null, '0', null, null);
INSERT INTO `user` VALUES ('dee80463a2514e9f95919e0ebfdbb9e3', 'aw_ww', 'ww', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 22:31:15', 'ww', 'ww', '0', '', '1970-02-06', '', '', '', '', '11', '/pic/sys/PictureLibrary/1.jpg', '2017-05-23 23:03:09', 'dee80463a2514e9f95919e0ebfdbb9e3', '0', null, 'ww');
INSERT INTO `user` VALUES ('f39a25675c424edfb489dca6de42ce42', 'aw_ww', 'qw', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-23 22:30:24', 'qw', '', '0', '', '1970-02-07', '', '', '', '', '11', '/pic/sys/PictureLibrary/1.jpg', '2017-05-23 22:32:31', 'f39a25675c424edfb489dca6de42ce42', '0', null, 'qw');

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
INSERT INTO `web_banner_img` VALUES ('104ded65740243129cd619a51ccb8b32', 'c161a6248cb647c7b25bfbf4263886ef', '/pic/sys/PictureLibrary/banner-3.jpg', '#', '2017-05-24 02:10:53', '1', '1');
INSERT INTO `web_banner_img` VALUES ('ac59b696a0c140c5b7a5b65d38b76cb5', 'c161a6248cb647c7b25bfbf4263886ef', '/pic/sys/PictureLibrary/banner-4.jpg', '#', '2017-05-24 02:10:53', '1', '2');
INSERT INTO `web_banner_img` VALUES ('b895152c89b444c9baf0175a84824987', 'c161a6248cb647c7b25bfbf4263886ef', '/pic/sys/PictureLibrary/banner-5.jpg', '#', '2017-05-24 02:10:53', '1', '3');

-- ----------------------------
-- Table structure for `web_column`
-- ----------------------------
DROP TABLE IF EXISTS `web_column`;
CREATE TABLE `web_column` (
  `COLUMN_ID` varchar(32) NOT NULL COMMENT '栏目id',
  `COLUMN_NAME` varchar(32) NOT NULL COMMENT '栏目名称',
  `COLUMN_TYPE` smallint(1) NOT NULL DEFAULT '1' COMMENT '栏目类型（0：系统；1：用户）',
  `URL` varchar(32) NOT NULL COMMENT '对应访问地址',
  `COMPANY_ID` varchar(32) DEFAULT NULL COMMENT '公司id',
  `CREATOR` varchar(32) NOT NULL COMMENT '修改人',
  `MODIFY_TIME` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `MODIFIER` varchar(32) DEFAULT NULL COMMENT '修改人',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `STATE` smallint(1) NOT NULL DEFAULT '0' COMMENT '栏目状态（0：启用：1停用）',
  PRIMARY KEY (`COLUMN_ID`),
  KEY `WEBCOLUMN_COMPANEY_ID` (`COMPANY_ID`)
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
INSERT INTO `web_content` VALUES ('c8bded59a80443f3b9bc9f950faba9b4', 'c161a6248cb647c7b25bfbf4263886ef', 'index', '0', '0', '3', '30', 'component_login', '2017-05-24 02:12:08', 'c4465e5799a849e5ba578e4f22b42b46');
INSERT INTO `web_content` VALUES ('ce393c836a3f4dd38bbb6604f72a674a', 'c161a6248cb647c7b25bfbf4263886ef', 'index', '3', '0', '9', '30', 'component_bulletinBoard', '2017-05-24 02:12:08', 'c4465e5799a849e5ba578e4f22b42b46');

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
INSERT INTO `web_footer` VALUES ('642b7b2da2944fe9ba4e3d4489f5c829', 'c161a6248cb647c7b25bfbf4263886ef', 'e09b490d6a364dd99b4046d827d74f04/ef7334b835da42fd9d79e2b834e62b65/4465a5934f4f4c04aa6ec3fee693f411/27d102bcb9da4c5486046560f3fbe0ac', '<font color=\"#cabdbf\" size=\"2\">Copyright &copy; 2010-2017 福建省厦门集美大学</font>', '2017-05-24 02:10:53', '1', 'e09b490d6a364dd99b4046d827d74f04/ef7334b835da42fd9d79e2b834e62b65/4465a5934f4f4c04aa6ec3fee693f411/27d102bcb9da4c5486046560f3fbe0ac');
