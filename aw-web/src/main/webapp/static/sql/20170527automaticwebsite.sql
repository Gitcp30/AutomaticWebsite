/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : automaticwebsite

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-05-27 03:00:20
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
INSERT INTO `auditing` VALUES ('788d529b54e54170962a12cdad28d330', 'd5427941bbfa458da9b676ef307a3e9a', '4', '', '2017-05-26 16:01:54', '2017-05-26 16:02:41');

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
INSERT INTO `base_setting` VALUES ('007f422942f54c7bb6ce8a0583420ed8', 'd5427941bbfa458da9b676ef307a3e9a', 'bg-bg', 'background_background-colorpicker', '#E4E6E9', '#mainContent', 'background-color', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('03d428436326464db0b3db970319d63b', 'd5427941bbfa458da9b676ef307a3e9a', 'menu', 'menu_selectItem_colorpicker', '#cc0010', '#webMenu .inner_menu ul li a:hover', 'background-color', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('074ac59905b14736a056e834694b894e', 'd5427941bbfa458da9b676ef307a3e9a', 'banner-width', 'banner_width', 'default', '#webBanner', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('10d372cd7ffa441d950520cd48e648f7', 'd5427941bbfa458da9b676ef307a3e9a', 'content-width', 'content_marginBottomSlider', '0', '#webContainer', 'margin-bottom', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('16fc75267f014b95809c4fe3350414c1', 'd5427941bbfa458da9b676ef307a3e9a', 'title', 'title_x', '751', '#webTitle', 'left', '2017-05-27 01:27:35', 'f8142fb595d34db3b975804a962e1ef4');
INSERT INTO `base_setting` VALUES ('2213197757af40a5bea9374198bd0ace', 'd5427941bbfa458da9b676ef307a3e9a', 'banner', 'banner_pattern', 'arrowSilde', '#bannerModal_pattern .imgBorder', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('23c3f3e48fe7419d88f0ec8d097a0eb6', 'd5427941bbfa458da9b676ef307a3e9a', 'logo', 'opacity_logoSlider', '100', '#goloModal_pic .logoPic img', 'opacity', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('23d8bff48d69482d9904a495d71b28cc', 'd5427941bbfa458da9b676ef307a3e9a', 'bg-bg', 'bgBgPic', '', '#mainContent', 'src', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('4c7a8e6305d8462bb9c753c345c63658', 'd5427941bbfa458da9b676ef307a3e9a', 'header-bg', 'header_bg', 'default', '#webHeader', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('4cc2b822b7fb49f8b72a024d10c55e63', 'd5427941bbfa458da9b676ef307a3e9a', 'title', 'webTitle', '<font size=\"7\" color=\"#f83a22\">集美大学</font>', '#webTitle', 'html', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('4fb45d002c7f42f1852101d11fddf7df', 'd5427941bbfa458da9b676ef307a3e9a', 'banner', 'banner_animation', 'fold', '#bannerModal_animation', 'effect', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('5d20ca32d235460ead2d258787da5715', 'd5427941bbfa458da9b676ef307a3e9a', 'logo', 'logo_width', '280', '#goloModal_pic .logoPic img', 'width', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('5f0ea28099674f0f9cc355534c065530', 'd5427941bbfa458da9b676ef307a3e9a', 'footer-font', 'footer_linktext_colorpicker', '#8b939d', '.inner_footer .footLinks a', 'color', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('65993a9d33d449e8bdb3d6643b19a405', 'd5427941bbfa458da9b676ef307a3e9a', 'header-bg', 'header_bg_showStyle', 'contain', '#webHeader', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('69fa847eb35b4662b36b7a8fb3d8891e', 'd5427941bbfa458da9b676ef307a3e9a', 'header-height', 'headerWidthSlider', '100', '#webHeader', 'height', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('6fe0764756a8494195fe13fb59a98ce9', 'd5427941bbfa458da9b676ef307a3e9a', 'header-border', 'borderHeightSlider', '0', '#webHeader', 'border-bottom', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('78aa37cc710e4ee48d5d43f3f3149e1e', 'd5427941bbfa458da9b676ef307a3e9a', 'logo', 'logo_x', '238', '#goloModal_pic .logoPic img', 'left', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('78c13e924e9849afbe24265bb324e900', 'd5427941bbfa458da9b676ef307a3e9a', 'bg-width', 'bgWidthSpiner', '100', '#mainContent', 'width', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('78c78c1619b6450a87098f200219c057', 'd5427941bbfa458da9b676ef307a3e9a', 'menu', 'menu_colorpicker', '#e60012', '#webMenu', 'background-color', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('7a1ce7bc38624bbc8301cd04797aae30', 'd5427941bbfa458da9b676ef307a3e9a', 'logo', 'logoPic', '/pic/sys/default/jmu-logo.png', '#goloModal_pic .logoPic img', 'src', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('7f44f19ffb574272beb7afba3d2ea39b', 'd5427941bbfa458da9b676ef307a3e9a', 'banner-height', 'banner_heightSlider', '350', '#webBanner', 'height', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('82cc243b7d3a43f8b98e8b9dd2fc10e4', 'd5427941bbfa458da9b676ef307a3e9a', 'content-width', 'content_widthSlider', '100', '#webContainer', 'width', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('84156fb902714f5180f4f4a13a52cd68', 'd5427941bbfa458da9b676ef307a3e9a', 'footer-bg', 'footer_bg_colorpicker', '#222222', '#webFooter', 'background-color', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('87c52b07613f4922aa66d9442cf556a3', 'd5427941bbfa458da9b676ef307a3e9a', 'title', 'title_y', '-60', '#webTitle', 'top', '2017-05-27 01:27:35', 'f8142fb595d34db3b975804a962e1ef4');
INSERT INTO `base_setting` VALUES ('8910f450a58440bca985957b816aad64', 'd5427941bbfa458da9b676ef307a3e9a', 'header-border', 'header_border_showStyle', 'solid', '#webHeader', 'border-bottom', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('8a12fb0e6c3f46cf83b5309ff173e568', 'd5427941bbfa458da9b676ef307a3e9a', 'footer-height', 'footer_height', 'default', '#webFooter', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('8c86e7cb25794794856a4d456d1c35ed', 'd5427941bbfa458da9b676ef307a3e9a', 'footer-height', 'footer_heightSpinner', '80', '#webFooter', 'height', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('93a1401931c84cdcbbb6267161d35da0', 'd5427941bbfa458da9b676ef307a3e9a', 'footer-height', 'footer_heightSlider', '80', '#webFooter', 'height', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('96580d943ca8421bb86de5e273901cee', 'd5427941bbfa458da9b676ef307a3e9a', 'banner-height', 'banner_heightSpinner', '350', '#webBanner', 'height', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('97447aff31994a7cb4ab2fab41026ea2', 'd5427941bbfa458da9b676ef307a3e9a', 'header-height', 'headerWidthSpiner', '100', '#webHeader', 'height', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('997c236ab0164d9d9bd8afb3934e2239', 'd5427941bbfa458da9b676ef307a3e9a', 'menu', 'menu_bg_colorpicker', '#e60012', '#webMenu .inner_menu ul', 'background-color', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('a29b716b214a4bfe80d1066ce9744111', 'd5427941bbfa458da9b676ef307a3e9a', 'menu', 'menu_font_colorpicker', '#ffffff', '#webMenu .inner_menu ul li a', 'color', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('a77e2d61724c4b8780033922a3c1ceb0', 'd5427941bbfa458da9b676ef307a3e9a', 'footer-font', 'footer_textSlider', '14', '.inner_footer .footLinks span', 'font-size', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('aac00b1770d4488695e8c2e775062469', 'd5427941bbfa458da9b676ef307a3e9a', 'footer-font', 'footer_linkhover_colorpicker', '#ffffff', '.inner_footer .footLinks a:hover', 'color', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('ad482a585d4544088b753ae353ad67e9', 'd5427941bbfa458da9b676ef307a3e9a', 'banner', 'bannerModal_interTimeSpinner', '2500', '#banner', 'interTime', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('b4b59bf66cd047abab4bbd447e56ac69', 'd5427941bbfa458da9b676ef307a3e9a', 'logo', 'logo_height', '75', '#goloModal_pic .logoPic img', 'height', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('b87061df3d9b4f9cad2fa8273007d977', 'd5427941bbfa458da9b676ef307a3e9a', 'bg-bg', 'bg_bg_showStyle', 'contain', '#mainContent', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('be2448447e0a4d2ba5f6766f5061d732', 'd5427941bbfa458da9b676ef307a3e9a', 'header-border', 'header_border', 'hide', '#webHeader', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('be2fbc0c34dc4de68a87b7b8df84064d', 'd5427941bbfa458da9b676ef307a3e9a', 'bg-width', 'bg_width', 'default', '#mainContent', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('c08b03245cc94686b33301fcb5bf1c92', 'd5427941bbfa458da9b676ef307a3e9a', 'header-bg', 'header_bg_colorpicker', '#E4E6E9', '#webHeader', 'background-color', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('c1a6770a62ab4f8fa90bd98923b6425f', 'd5427941bbfa458da9b676ef307a3e9a', 'header-bg', 'headerBgPic', '', '#webHeader', 'src', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('c7209c17b56f41fd92d5dfed552db170', 'd5427941bbfa458da9b676ef307a3e9a', 'footer-bg', 'footer_bg', 'default', '#webFooter', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('ca96a275037d4969b88525fc127d2908', 'd5427941bbfa458da9b676ef307a3e9a', 'content-width', 'content_marginTopSlider', '0', '#webContainer', 'margin-top', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('cb8f1dc8324643cbbe8d02d39660bdc2', 'd5427941bbfa458da9b676ef307a3e9a', 'banner-height', 'banner_height', 'default', '#webBanner', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('d5cc65048007487688198bc779a1f722', 'd5427941bbfa458da9b676ef307a3e9a', 'footer-font', 'footer_linktext', 'default', '.inner_footer .footLinks a', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('d836990dd62045ef8348065dad117008', 'd5427941bbfa458da9b676ef307a3e9a', 'banner-width', 'banner_widthSpinner', '100', '#webBanner', 'width', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('d9a307d0277a49ef9f9e262a752e4a13', 'd5427941bbfa458da9b676ef307a3e9a', 'bg-bg', 'bg_bg', 'default', '#mainContent', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('de972265ae0e444fbca7c0cc65ffd52c', 'd5427941bbfa458da9b676ef307a3e9a', 'header-border', 'header_border_colorpicker', '#ffffff', '#webHeader', 'border-bottom', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('e1054463b26e4a07aceb7507a9bbf943', 'd5427941bbfa458da9b676ef307a3e9a', 'menu', 'menu_widthSlider', '80', '#webMenu .inner_menu', 'width', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('e40adffb088e48e1a716a4fa9b5c2a82', 'd5427941bbfa458da9b676ef307a3e9a', 'banner', 'bannerModal_delayTimeSpinner', '500', '#banner', 'delayTime', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('efc3959a6d0f4cbfa7cc8fe02b8d5db0', 'd5427941bbfa458da9b676ef307a3e9a', 'logo', 'logo_y', '12', '#goloModal_pic .logoPic img', 'top', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('f3506a0bfbb443c5a3956c76978bd880', 'd5427941bbfa458da9b676ef307a3e9a', 'header-height', 'header_height', 'default', '#webHeader', '', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('f74bf4ab58eb4c4da351e6afc3123ab9', 'd5427941bbfa458da9b676ef307a3e9a', 'banner-width', 'banner_widthSlider', '100', '#webBanner', 'width', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('f8d73700111d4db3bf094b476c80cc8b', 'd5427941bbfa458da9b676ef307a3e9a', 'logo', 'radius_logoSlider', '0', '#goloModal_pic .logoPic img', 'border-radius', '2017-05-26 16:02:41', '123456');
INSERT INTO `base_setting` VALUES ('fc5c87a9566442008ce6146c05cd6c38', 'd5427941bbfa458da9b676ef307a3e9a', 'bg-width', 'bgWidthSlider', '100', '#mainContent', 'width', '2017-05-26 16:02:41', '123456');

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
  `STATUS` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：正常：1停用  2：置顶）',
  PRIMARY KEY (`BULLENTIN_BOARD_ID`),
  KEY `BULLENTIN_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `BULLENTIN_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bullentin_board
-- ----------------------------
INSERT INTO `bullentin_board` VALUES ('1878fda66908419286ae146b39e958f5', 'd5427941bbfa458da9b676ef307a3e9a', '美国侨报：中国琵琶演奏家陈雯雯访美传播中国传统文化', '<p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">我校音乐学院教师、青年琵琶演奏家、纽约州立大学访问学者陈雯雯在美期间开展了系列巡演、学术讲座和授艺等活动，不遗余力地传播中国传统文化，同时，也对对外展现、宣传集美大学起到了积极的影响和推动作用！对此，美国当地民众、华人华侨以及美国、中国等多家主流媒体给予充分的赞誉和关注。详情可查看网址：</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><a href=\"http://ny.uschinapress.com/m/spotlight/2017/04-09/117487.html?from=timeline&amp;isappinstalled=0\" style=\"text-decoration-line: underline; cursor: pointer; color: rgb(30, 80, 162); font-size: 16px;\"><span style=\"line-height: 24px; text-indent: 2em;\">http://ny.uschinapress.com/m/spotlight/2017/04-09/117487.html?from=timeline&amp;isappinstalled=0</span></a></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">http://www.chinaqw.com/zhwh/2017/04-10/135940.shtml</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">一、巡演及相关报道</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">1．美国当地时间2017年2月4日（正月初八），陈雯雯作为中国特邀演出嘉宾，在纽约首府EGG大剧院“Amazing China——纽约首府华人2017年春节联欢会”上倾情演绎了精彩绝伦、震撼人心中国琵琶音乐，展示了中国传统文化。演出当天美国国会议员Paul Tonko先生亲临致辞，一千多人的剧场座无虚席。陈雯雯的演出受到美国各界人士的广泛关注，其中美国《侨报》对其给予了充分的报道：</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\"><strong><a href=\"http://ny.uschinapress.com/m/index.html\" style=\"text-decoration-line: underline; cursor: pointer; color: rgb(30, 80, 162);\"></a></strong></span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><img border=\"0\" src=\"http://www.jmu.edu.cn/__local/3/36/BF/E0CC17ECAC83A163576244D96A5_20493640_A04.gif\" width=\"169\" height=\"57\" vsbhref=\"vurl\" vurl=\"/_vsl/336BFE0CC17ECAC83A163576244D96A5/20493640/A04\" vheight=\"57\" vwidth=\"169\" orisrc=\"/__local/3/36/BF/E0CC17ECAC83A163576244D96A5_20493640_A04.gif\" class=\"img_vsb_content\" style=\"border-width: 1px; border-style: solid; border-color: rgb(204, 204, 204);\"></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><img border=\"0\" src=\"http://www.jmu.edu.cn/__local/A/AE/06/EBC49385F30D01FD6CAB7201239_61FA1C46_A319.jpg\" width=\"540\" height=\"307\" vsbhref=\"vurl\" vurl=\"/_vsl/AAE06EBC49385F30D01FD6CAB7201239/61FA1C46/A319\" vheight=\"307\" vwidth=\"540\" orisrc=\"/__local/A/AE/06/EBC49385F30D01FD6CAB7201239_61FA1C46_A319.jpg\" class=\"img_vsb_content\" style=\"border-width: 1px; border-style: solid; border-color: rgb(204, 204, 204);\"></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><img hspace=\"12\" src=\"http://www.jmu.edu.cn/__local/F/2E/FF/026CAFB4B068CE0652328B1BDD9_5BDD112C_3556.jpg\" width=\"552\" height=\"368\" vsbhref=\"vurl\" vurl=\"/_vsl/F2EFF026CAFB4B068CE0652328B1BDD9/5BDD112C/3556\" vheight=\"368\" vwidth=\"552\" orisrc=\"/__local/F/2E/FF/026CAFB4B068CE0652328B1BDD9_5BDD112C_3556.jpg\" class=\"img_vsb_content\" style=\"border-width: 1px; border-style: solid; border-color: rgb(204, 204, 204);\"></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">（美国《侨报》原文转载——陈雯雯演奏中）</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">2．美国当地时间2017年3月31日晚，陈雯雯在纽约州立宾汉顿大学Casadesus Recital Hall音乐厅成功举办一场精彩绝伦的“珠玉声声”琵琶独奏音乐会，轰动了当地社会和媒体关注。其中，美国纽约《侨报》对其给予了充分的报道：</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><img hspace=\"12\" src=\"http://www.jmu.edu.cn/__local/8/2D/6C/85A57E5860D4F8688368A26B913_E77B7F15_EC3B.jpg\" width=\"576\" height=\"554\" vsbhref=\"vurl\" vurl=\"/_vsl/82D6C85A57E5860D4F8688368A26B913/E77B7F15/EC3B\" vheight=\"554\" vwidth=\"576\" orisrc=\"/__local/8/2D/6C/85A57E5860D4F8688368A26B913_E77B7F15_EC3B.jpg\" class=\"img_vsb_content\" style=\"border-width: 1px; border-style: solid; border-color: rgb(204, 204, 204);\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\"><strong>&nbsp;</strong></span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\"></span>&nbsp;</p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><img border=\"0\" src=\"http://www.jmu.edu.cn/__local/3/36/BF/E0CC17ECAC83A163576244D96A5_20493640_A04.gif\" width=\"169\" height=\"57\" vsbhref=\"vurl\" vurl=\"/_vsl/336BFE0CC17ECAC83A163576244D96A5/20493640/A04\" vheight=\"57\" vwidth=\"169\" orisrc=\"/__local/3/36/BF/E0CC17ECAC83A163576244D96A5_20493640_A04.gif\" class=\"img_vsb_content\" style=\"border-width: 1px; border-style: solid; border-color: rgb(204, 204, 204);\"></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">3．美国当地时间4月21日，受新常春藤大学之一的纽约大学邀请，陈雯雯与中国戏剧第四届梅花奖得主、国家一级演员涂铃慧教授、中国戏曲学院陈世君教授同台献艺。其精彩的演出获得了经久不息的掌声和感动！音乐无国界，似乎只有音乐才可传递、化解语言和文化的差异。</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><img hspace=\"12\" src=\"http://www.jmu.edu.cn/__local/9/09/D5/13F6F0D1AA8FD797BF27091B9CE_07DF7932_8D19.jpg\" width=\"552\" height=\"522\" vsbhref=\"vurl\" vurl=\"/_vsl/909D513F6F0D1AA8FD797BF27091B9CE/07DF7932/8D19\" vheight=\"522\" vwidth=\"552\" orisrc=\"/__local/9/09/D5/13F6F0D1AA8FD797BF27091B9CE_07DF7932_8D19.jpg\" class=\"img_vsb_content\" style=\"border-width: 1px; border-style: solid; border-color: rgb(204, 204, 204);\"></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">（图为纽约大学演出中，陈雯雯提供）</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">二、学术讲座和授艺</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">与此同时，陈雯雯老师在繁忙的访学中，积极为美方大学开展中国乐器——琵琶的学术讲座和授艺活动。</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><img border=\"0\" src=\"http://www.jmu.edu.cn/__local/C/3B/E1/48536E2ADE585E0B789694F38D1_9DF35BC1_7CCB.jpg\" width=\"537\" height=\"448\" vsbhref=\"vurl\" vurl=\"/_vsl/C3BE148536E2ADE585E0B789694F38D1/9DF35BC1/7CCB\" vheight=\"448\" vwidth=\"537\" orisrc=\"/__local/C/3B/E1/48536E2ADE585E0B789694F38D1_9DF35BC1_7CCB.jpg\" class=\"img_vsb_content\" style=\"border-width: 1px; border-style: solid; border-color: rgb(204, 204, 204);\"></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">（图为纽约州立宾汉姆顿大学音乐系学术讲座——中国乐器·琵琶）</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\"></span>&nbsp;</p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><img hspace=\"12\" src=\"http://www.jmu.edu.cn/__local/4/F6/7C/B1BA19D95019ECEF583A652F6A2_3F6DE5E8_636B.jpg\" width=\"528\" height=\"270\" vsbhref=\"vurl\" vurl=\"/_vsl/4F67CB1BA19D95019ECEF583A652F6A2/3F6DE5E8/636B\" vheight=\"270\" vwidth=\"528\" orisrc=\"/__local/4/F6/7C/B1BA19D95019ECEF583A652F6A2_3F6DE5E8_636B.jpg\" class=\"img_vsb_content\" style=\"border-width: 1px; border-style: solid; border-color: rgb(204, 204, 204);\"></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">（在“The Discovery Center Performance of New York State”为美国民众普及中国音乐文化）</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\"></span>&nbsp;</p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">陈雯雯老师除了繁忙的巡演、讲座和授艺活动外，还在访学导师Pro. Zu-yan Chen（纽约州立大学杰出教授）指导下，积极参与学术讨论、学术会议和观摩课堂教学，并将在今年9月份与世界级艺术家合作联袂出演中美大型“室内交响乐——月亮组诗”（Pro. Zu-yan Chen总策划)。</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">陈雯雯老师硕士研究生毕业于中央音乐学院，师从中国著名的琵琶演奏家、教育家张强教授，目前担任中国民族管弦乐协会琵琶专业委员会理事。陈雯雯在琵琶艺术方面已具有深厚的造诣，获得了多方面的艺术成就：受邀参演了第49届“北京奥林匹克运动会”开幕式；中越建交65周年音乐会；中国国家大剧院揭幕仪式演出等重大国际演出与艺术交流活动。习近平等中国国家领导人及克林顿、希拉里、斯蒂芬·哈勃等多位外国元首聆听过她的琴声。也曾多次斩获中国国家文化部、中国音乐家协会、美国华人音乐家协会主办的国际级、国家级重大专业赛事奖项，如2013年获第二届“华音杯”中国国际音乐大赛金奖等。还曾多次参加中外慈善义演，身体力行传播中国音乐文化；主持、参与多项国家级、省部级课题；2014年由北京环球音像出版社出版的首张个人音乐专辑《“滴水观音”——陈雯雯琵琶音乐会精选》同步在全球发行。</span></p>', null, '2017-05-26 16:19:05', 'f8142fb595d34db3b975804a962e1ef4', null, null, '0');
INSERT INTO `bullentin_board` VALUES ('24d2eb6fc1b5489a8f82445184307415', 'd5427941bbfa458da9b676ef307a3e9a', '东南网：菲律宾华裔学生学中文夏令营营员：因流淌着华人血液而骄傲', '<p style=\"margin-bottom: 0px; padding: 0px; border: 0px; font-size: 14px; line-height: 1.75em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\">东南网5月23日讯（本网记者夏月）今天下午，来闽参加菲律宾华裔学生学中文夏令营的同学陆续登机返回菲律宾。在集美大学学习了两个月的同学恋恋不舍地与中国老师道别，并纷纷表示，如果有机会一定再来中国，到集美大学海外教育学院深造。</p><p style=\"margin-bottom: 0px; padding: 0px; border: 0px; font-size: 14px; line-height: 30px; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\">&nbsp;</p><p style=\"margin-bottom: 0px; padding: 0px; border: 0px; font-size: 14px; line-height: 30px; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><img src=\"http://www.jmu.edu.cn/__local/C/AD/F8/D05FF80253927DC6FDDF3518972_A23B9BB1_5527F.jpg\" width=\"500\" vwidth=\"500\" vheight=\"\" vurl=\"/_vsl/CADF8D05FF80253927DC6FDDF3518972/A23B9BB1/5527F\" vsbhref=\"vurl\" orisrc=\"/__local/C/AD/F8/D05FF80253927DC6FDDF3518972_A23B9BB1_5527F.jpg\" class=\"img_vsb_content\"></p><p style=\"margin-bottom: 0px; padding: 0px; border: 0px; font-size: 14px; line-height: 30px; text-align: center; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\">菲律宾华文教育研究中心主席黄端铭接受东南网采访</p><p style=\"margin-bottom: 0px; padding: 0px; border: 0px; font-size: 14px; line-height: 30px; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\">&nbsp;</p>', null, '2017-05-26 16:17:38', 'f8142fb595d34db3b975804a962e1ef4', null, null, '0');
INSERT INTO `bullentin_board` VALUES ('77a7bff2d7bb49c19b4de11c55f2ba82', 'd5427941bbfa458da9b676ef307a3e9a', '辜芳昭：青年人才是高校赢得未来竞争优势的关键', '<p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">高校的核心竞争力是高素质的师资队伍。青年教师代表着未来，是师资队伍的后备军与生力军。一所高校没有一流的青年教师队伍，就不可能建成一流的大学，可以说“得青年者得未来”。</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><span style=\"line-height: 24px; text-indent: 2em; font-size: 16px;\">高校青年教师的成长需要强有力的体系化支持。有学者提出一个很形象的“旺炉”理论——一个熊熊燃烧的火炉，即便扔块湿毛巾进去也能燃烧起来。高校激励青年教师奋发前进的一个重要方面就在于营造这样一个“旺炉”，这个“旺炉”就是高校良好的学术氛围和为青年教师成长“量身定做”的支持体系。</span></p><p style=\"padding: 0px; border: 0px; font-size: 14px; line-height: 1.5em; text-align: justify; text-indent: 2em; color: rgb(0, 0, 0); font-family: Helvetica, Arial, &quot;Microsoft YaHei&quot;;\"><br></p>', null, '2017-05-26 16:18:22', 'f8142fb595d34db3b975804a962e1ef4', '2017-05-26 16:18:22', 'f8142fb595d34db3b975804a962e1ef4', '2');

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
INSERT INTO `company` VALUES ('d5427941bbfa458da9b676ef307a3e9a', '周某某有限公司', 'zzr', '0', '931998400@qq.com', '2017-05-26 16:06:17', null, '0', '2017-05-16', '商品贸易', '周遵荣', '18950178315', '18950178315', '福清市xxx街道xxx村', '350300', '1', '2017-05-26 16:06:17', 'f8142fb595d34db3b975804a962e1ef4');

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
INSERT INTO `message_board` VALUES ('fcfae972467b484692592bd6c78804d5', 'd5427941bbfa458da9b676ef307a3e9a', 'kangang', '123@qq.com', '你好', '2017-05-26 16:12:28');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `PRODUCT_ID` varchar(32) NOT NULL COMMENT '产品id',
  `COMPANY_ID` varchar(32) NOT NULL COMMENT '公司id',
  `PRODUCT_IMG` varchar(255) DEFAULT NULL COMMENT '图片',
  `PRODUCT_DESC` char(255) DEFAULT NULL COMMENT '描述',
  `STATE` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态（0：正常1：停用2：最新。。。）',
  `PRODUCT_ORDER` int(255) DEFAULT NULL COMMENT '权重序号',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `CREATOR` varchar(32) NOT NULL COMMENT '创建人',
  `MODIFY_TIME` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `MODIFIER` varchar(32) DEFAULT NULL COMMENT '修改人',
  `PRODUCT_NAME` varchar(255) DEFAULT NULL COMMENT '产品名称',
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `PRODUCT_COMPANY_ID` (`COMPANY_ID`),
  CONSTRAINT `PRODUCT_COMPANY_ID` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'd5427941bbfa458da9b676ef307a3e9a', '/pic/product/9f2fcc3a546149d4a9c7088e9eafe730.png', '1', '0', '1', '2017-05-27 01:17:59', '1', '2017-05-27 01:17:59', 'f8142fb595d34db3b975804a962e1ef4', '11');
INSERT INTO `product` VALUES ('228236a3af0a4f6e8fe44bd3bd230a42', 'd5427941bbfa458da9b676ef307a3e9a', '/pic/product/1de1788de0c54d818125916cdcfe15f7.jpg', '111222333', '2', '112223', '2017-05-27 00:55:23', 'f8142fb595d34db3b975804a962e1ef4', '2017-05-27 00:55:23', 'f8142fb595d34db3b975804a962e1ef4', '11222333');
INSERT INTO `product` VALUES ('a0a6b9d6f20b4555be123979eec9dd86', 'd5427941bbfa458da9b676ef307a3e9a', '/pic/product/c5ffa31122cd4ec1a49fa4811e5d8206.jpg', '111', '1', '11', '2017-05-27 01:24:35', 'f8142fb595d34db3b975804a962e1ef4', '2017-05-27 01:24:35', 'f8142fb595d34db3b975804a962e1ef4', '111');
INSERT INTO `product` VALUES ('ace3fecdb39443878bd65aba853dc043', 'd5427941bbfa458da9b676ef307a3e9a', '/pic/product/afc161a151b442679272809fc2afb75e.jpg', '111', '2', '11', '2017-05-27 00:55:36', 'f8142fb595d34db3b975804a962e1ef4', '2017-05-27 00:55:36', 'f8142fb595d34db3b975804a962e1ef4', '11');
INSERT INTO `product` VALUES ('b98c43911043461f93356f5082c2f142', 'd5427941bbfa458da9b676ef307a3e9a', '/pic/product/6e1bf340f9d840f9b79d176f31bece88.jpg', '阿斯达大所', '1', '11', '2017-05-27 01:24:35', 'f8142fb595d34db3b975804a962e1ef4', '2017-05-27 01:24:35', 'f8142fb595d34db3b975804a962e1ef4', '三地阿迪');

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
INSERT INTO `sysfunction` VALUES ('1a9ecb3d0fe148f884528d74454ed0ed', '产品管理', '1', '64b30921c3e346f2b344dfb4b2af7079', null, '/admin/web/productPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('20b6cbe44ce743d188da3c79170a9018', '公告栏管理', '1', '64b30921c3e346f2b344dfb4b2af7079', null, '/admin/web/bullentinBoardPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('318830ab1a214401912f2dc9d2f48ca7', '单位管理', '2', 'e9df1082b8704ce19703803566ed2151', null, '/admin/sys/companyPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('4033c863b18c4d29b156fc9ec84d636e', '个人中心', '0', '', null, '', '', 'menu-icon fa fa-user', 'open');
INSERT INTO `sysfunction` VALUES ('44189f5c7b114b47b2e1f1424afdf49c', '单位中心', '1', '', null, '', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('64b30921c3e346f2b344dfb4b2af7079', '网站中心', '1', '', null, '', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('8299b44769534a139f7a455d3b05bae0', '留言板管理', '1', '64b30921c3e346f2b344dfb4b2af7079', null, '/admin/web/messageBoardPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('94dbdca2019a480bbba55774d9ed2c9e', '审核中心', '2', '', null, '', '', 'menu-icon fa fa-flag', 'open');
INSERT INTO `sysfunction` VALUES ('96e7924c45ca4d5985b7222b5c67da5e', '单位审核', '2', '94dbdca2019a480bbba55774d9ed2c9e', null, '/admin/sys/companyAuditing', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('aae3a25c9e104e71909513821698161c', '功能管理', '2', 'e9df1082b8704ce19703803566ed2151', null, '/admin/sys/functionPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('df1cce3cac2e4a0ab9c2fe4f171bd6e8', '个人信息管理', '0', '4033c863b18c4d29b156fc9ec84d636e', null, '/admin/web/userPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('e7093455ea254081bd1b5013fc95083f', '单位信息管理', '1', '44189f5c7b114b47b2e1f1424afdf49c', null, '/admin/web/companyPage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('e9df1082b8704ce19703803566ed2151', '系统管理', '2', '', null, '', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('ea0092b9b2ce4a38bb5a2ff89b0829a0', '员工管理', '1', '44189f5c7b114b47b2e1f1424afdf49c', null, '/admin/web/employeePage', '', 'menu-icon fa fa-list', 'open');
INSERT INTO `sysfunction` VALUES ('faba1342869c416285b3215080d759c4', '网站编辑', '1', '64b30921c3e346f2b344dfb4b2af7079', null, '/web/edit/getEditPage', '', 'menu-icon fa fa-list', 'open');

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
  `STAFF_NO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `FK_COMPANEY` (`COMPANY_ID`),
  CONSTRAINT `FK_COMPANEY` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`COMPANY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123456', 'aw_admin', '10000@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '2', '2017-05-26 14:39:37', '系统管理员', '18950178315', '0', '系统管理', '2009-01-08', '厦门市', '85161357', '350181199406301896', null, null, '/pic/logo.png', null, null, '0', null, '123456');
INSERT INTO `user` VALUES ('58c60c48a52e423cbec951e6573ca1ec', 'aw_111', '111@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-26 16:07:30', '周晓明', '13696808641', '0', '技术总监', '2013-05-26', '北京市', '', '350181199406301896', '', 'd5427941bbfa458da9b676ef307a3e9a', '/pic/profile/2dd5e31f3cb44abf89bd64370bbf5331.jpg', '2017-05-26 16:08:26', '58c60c48a52e423cbec951e6573ca1ec', '0', null, '1002');
INSERT INTO `user` VALUES ('6772ef1e2e95458f8d30eb21f4dd1eae', 'aw_123456', '123456@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '0', '2017-05-26 16:12:47', null, null, null, null, null, null, null, null, null, 'd5427941bbfa458da9b676ef307a3e9a', null, '2017-05-26 16:13:49', 'f8142fb595d34db3b975804a962e1ef4', '0', null, null);
INSERT INTO `user` VALUES ('ead3dba408a64c398e577facbb4a4740', 'aw_111111', '111111@qq.com', '96E79218965EB72C92A549DD5A330112', '0', '2017-05-26 16:44:03', null, null, null, null, null, null, null, null, null, 'd5427941bbfa458da9b676ef307a3e9a', null, null, null, '1', null, null);
INSERT INTO `user` VALUES ('f8142fb595d34db3b975804a962e1ef4', 'aw_931998400', '931998400@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '2017-05-26 16:01:54', '周遵荣', '18950178315', '0', 'ceo', '2017-05-26', '福清市', null, '350181199406301896', '老板', 'd5427941bbfa458da9b676ef307a3e9a', '/pic/profile/7899269291ed4a83aec0d0edd7fef36b.jpg', '2017-05-26 16:04:08', 'f8142fb595d34db3b975804a962e1ef4', '0', null, '10001');

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
INSERT INTO `web_banner_img` VALUES ('28b3bc7c5bd64a12a53f2dcc3571d284', 'd5427941bbfa458da9b676ef307a3e9a', '/pic/sys/PictureLibrary/banner-4.jpg', '#', '2017-05-26 16:02:41', '123456', '2');
INSERT INTO `web_banner_img` VALUES ('bfe33903a3154ff58df579b0469ba1b4', 'd5427941bbfa458da9b676ef307a3e9a', '/pic/sys/PictureLibrary/banner-3.jpg', '#', '2017-05-26 16:02:41', '123456', '1');
INSERT INTO `web_banner_img` VALUES ('e161bf591f6d4e40a7c397d8bb148693', 'd5427941bbfa458da9b676ef307a3e9a', '/pic/sys/PictureLibrary/banner-5.jpg', '#', '2017-05-26 16:02:41', '123456', '3');

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
INSERT INTO `web_column` VALUES ('5abb79129cf24184897209c5e8098eb7', '关于我们', '0', 'aboutUs', 'system', 'admin', null, null, '2017-05-26 16:56:47', '0');
INSERT INTO `web_column` VALUES ('5d9b9916e15a481e9e159bd7d7461f97', '产品展示', '0', 'productDisplay', 'system', 'admin', null, null, '2017-05-07 20:41:27', '0');
INSERT INTO `web_column` VALUES ('7a5dfd6d6355456faada8aab8dde9d09', '会员登录', '0', 'memberLogin', 'system', 'admin', null, null, '2017-05-07 20:41:29', '0');
INSERT INTO `web_column` VALUES ('8b9f4ce107ca4e22b028927a8e92d1cc', '公司公告', '0', 'bulletinBoard', 'system', 'admin', null, null, '2017-05-07 20:41:31', '0');
INSERT INTO `web_column` VALUES ('d65e45c3265a44418c009550ff2653bf', '首页', '0', 'index', 'system', 'admin', null, null, '2017-05-26 16:56:44', '0');
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
INSERT INTO `web_content` VALUES ('18849757f2f54f7fb054f08f67712dab', 'd5427941bbfa458da9b676ef307a3e9a', 'bulletinBoard', '1', '4', '10', '29', 'component_bulletinBoard', '2017-05-26 16:19:35', 'f8142fb595d34db3b975804a962e1ef4');
INSERT INTO `web_content` VALUES ('3a69436474964594ab36c4b1acd6d447', 'd5427941bbfa458da9b676ef307a3e9a', 'messageBoard', '2', '4', '8', '27', 'component_messageBoard', '2017-05-26 16:20:56', 'f8142fb595d34db3b975804a962e1ef4');
INSERT INTO `web_content` VALUES ('87a7894244f64c6c864d6d4da54705ee', 'd5427941bbfa458da9b676ef307a3e9a', 'index', '1', '0', '10', '39', 'component_register', '2017-05-27 01:03:45', 'f8142fb595d34db3b975804a962e1ef4');
INSERT INTO `web_content` VALUES ('a66bd5d1f071431aa05a543e8135c497', 'd5427941bbfa458da9b676ef307a3e9a', 'productDisplay', '0', '0', '12', '49', 'component_product', '2017-05-27 01:47:17', 'f8142fb595d34db3b975804a962e1ef4');

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
INSERT INTO `web_footer` VALUES ('e7a95842898b4e08b1f56118e914789b', 'd5427941bbfa458da9b676ef307a3e9a', '5abb79129cf24184897209c5e8098eb7/7a5dfd6d6355456faada8aab8dde9d09', '<font color=\"#cabdbf\" size=\"2\">Copyright &copy;  2010-2017 福建省厦门集美大学</font>', '2017-05-27 01:03:45', '123456', 'd65e45c3265a44418c009550ff2653bf/7a5dfd6d6355456faada8aab8dde9d09/8b9f4ce107ca4e22b028927a8e92d1cc/5d9b9916e15a481e9e159bd7d7461f97/e34d1c3611e041cbbde4e7122331ea19');
