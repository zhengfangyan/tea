SET NAMES UTF8;
DROP DATABASE IF EXISTS tea;
CREATE DATABASE tea CHARSET=UTF8;
USE tea;

/**家族类别**/
CREATE TABLE tea_family(
  tfid INT PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR(64)
);

/**家族**/
CREATE TABLE tea_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  tfid INT,
  fimg VARCHAR(64),
  fname VARCHAR(64),
  href  VARCHAR(64)
);
/**详情**/
CREATE TABLE tea_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  type VARCHAR(128),
  limg1 VARCHAR(128),
  limg2 VARCHAR(128),
  limg3 VARCHAR(128),
  title VARCHAR(128),       
  price DECIMAL(10,2),        
  promise VARCHAR(64),
  limg4 VARCHAR(128),        
  limg5 VARCHAR(128),
  limg6 VARCHAR(128),
  limg7 VARCHAR(128),
  href VARCHAR(128)
);

/**用户信息**/
CREATE TABLE tea_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uimg VARCHAR(600),
  uname VARCHAR(32),
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE tea_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE tea_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**购物车**/
CREATE TABLE tea_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  -- oid INT,
  pName VARCHAR(64),
  count INT
);

/**用户订单**/
CREATE TABLE tea_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  orderId INT,         #产品编号
  count INT               #购买数量
);

/****首页轮播广告商品****/
CREATE TABLE tea_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);
/****首页轮播广告商品****/
CREATE TABLE tea_index_menu(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);
/****首页商品****/
CREATE TABLE tea_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,
  pimg  VARCHAR(128),
  details VARCHAR(128),
  type VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  pri VARCHAR(128)
);
/*******************/
/******数据导入******/
/*******************/
INSERT INTO tea_family VALUES
(NULL,"乌龙茶"),
(NULL,"红茶"),
(NULL,"绿茶"),
(NULL,"黑茶"),
(NULL,"白茶"),
(NULL,"花茶"),
(NULL,"藏茶"),
(NULL,"茶器");
/**分类**/
INSERT INTO tea_laptop_family VALUES
(NULL,1,'http://127.0.0.1:3000/img/class/w_01.jpg','安溪铁观音','product_details.html?lid=28'),
(NULL,1,'http://127.0.0.1:3000/img/class/w_02.jpg','武夷岩茶','product_details.html?lid=28'),
(NULL,1,'http://127.0.0.1:3000/img/class/w_03.jpg','广东单枞','product_details.html?lid=28'),
(NULL,1,'http://127.0.0.1:3000/img/class/w_04.jpg','漳平水仙','product_details.html?lid=28'),
(NULL,1,'http://127.0.0.1:3000/img/class/w_05.jpg','台湾乌龙茶','product_details.html?lid=28'),
(NULL,2,'http://127.0.0.1:3000/img/class/h_01.jpg','金骏眉','product_details.html?lid=28'),
(NULL,2,'http://127.0.0.1:3000/img/class/h_02.jpg','正山小种','product_details.html?lid=28'),
(NULL,2,'http://127.0.0.1:3000/img/class/h_03.jpg','滇红','product_details.html?lid=28'),
(NULL,2,'http://127.0.0.1:3000/img/class/h_04.jpg','祁门红茶','product_details.html?lid=28'),
(NULL,2,'http://127.0.0.1:3000/img/class/h_05.jpg','广西红茶','product_details.html?lid=28'),
(NULL,2,'http://127.0.0.1:3000/img/class/h_06.jpg','锡兰红茶','product_details.html?lid=28'),
(NULL,2,'http://127.0.0.1:3000/img/class/h_07.jpg','其它红茶','product_details.html?lid=28'),
(NULL,2,'http://127.0.0.1:3000/img/class/h_08.jpg','安化红针','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_01.jpg','龙井','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_02.jpg','四川绿茶','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_03.jpg','安吉白茶','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_04.jpg','信阳毛尖','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_05.jpg','碧螺春','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_06.jpg','黄山毛峰','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_07.jpg','六安瓜片','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_08.jpg','太平猴魁','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_09.jpg','广西绿茶','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_10.jpg','其它绿茶','product_details.html?lid=28'),
(NULL,3,'http://127.0.0.1:3000/img/class/l_11.jpg','贵州绿茶','product_details.html?lid=28'),
(NULL,4,'http://127.0.0.1:3000/img/class/b_01.jpg','普洱茶','product_details.html?lid=28'),
(NULL,4,'http://127.0.0.1:3000/img/class/b_02.jpg','安化黑茶','product_details.html?lid=28'),
(NULL,4,'http://127.0.0.1:3000/img/class/b_03.jpg','柑普茶','product_details.html?lid=28'),
(NULL,4,'http://127.0.0.1:3000/img/class/b_04.jpg','藏茶','product_details.html?lid=28'),
(NULL,4,'http://127.0.0.1:3000/img/class/b_05.jpg','六堡茶','product_details.html?lid=28'),
(NULL,4,'http://127.0.0.1:3000/img/class/b_06.jpg','陕西黑茶','product_details.html?lid=28'),
(NULL,5,'http://127.0.0.1:3000/img/class/f_01.jpg','银针','product_details.html?lid=28'),
(NULL,5,'http://127.0.0.1:3000/img/class/f_02.jpg','白牡丹','product_details.html?lid=28'),
(NULL,5,'http://127.0.0.1:3000/img/class/f_03.jpg','寿眉','product_details.html?lid=28'),
(NULL,5,'http://127.0.0.1:3000/img/class/f_04.jpg','其它白茶','product_details.html?lid=28'),
(NULL,6,'http://127.0.0.1:3000/img/class/m_01.jpg','茉莉花茶','product_details.html?lid=28'),
(NULL,6,'http://127.0.0.1:3000/img/class/m_02.jpg','玫瑰花茶','product_details.html?lid=28'),
(NULL,6,'http://127.0.0.1:3000/img/class/m_03.jpg','菊花茶','product_details.html?lid=28'),
(NULL,6,'http://127.0.0.1:3000/img/class/m_04.jpg','花草茶','product_details.html?lid=28'),
(NULL,7,'http://127.0.0.1:3000/img/class/j_01.jpg','陶瓷茶具','product_details.html?lid=28'),
(NULL,7,'http://127.0.0.1:3000/img/class/j_02.jpg','紫砂茶具','product_details.html?lid=28'),
(NULL,7,'http://127.0.0.1:3000/img/class/j_03.jpg','玻璃茶具','product_details.html?lid=28'),
(NULL,7,'http://127.0.0.1:3000/img/class/j_04.jpg','茶盘','product_details.html?lid=28'),
(NULL,7,'http://127.0.0.1:3000/img/class/j_05.jpg','建盏','product_details.html?lid=28'),
(NULL,7,'http://127.0.0.1:3000/img/class/j_06.jpg','茶道配件','product_details.html?lid=28'),
(NULL,7,'http://127.0.0.1:3000/img/class/j_07.jpg','银器','product_details.html?lid=28');
/**详情**/
INSERT INTO tea_laptop VALUES
(NULL,'乌龙茶', 'http://127.0.0.1:3000/img/goods/g_01.jpg','http://127.0.0.1:3000/img/goods/g_02.jpg','http://127.0.0.1:3000/img/goods/g_03.jpg','三和 安溪铁观音 2018春茶 乌龙茶 清香型 特级 和清333 250g',450, '已优惠￥50(9折)','http://127.0.0.1:3000/img/goods/g_04.jpg','http://127.0.0.1:3000/img/goods/g_05.jpg','http://127.0.0.1:3000/img/goods/g_06.jpg','http://127.0.0.1:3000/img/goods/g_07.jpg','product_details.html?lid=1'),
(NULL,'红茶','http://127.0.0.1:3000/img/goods/g1_01.jpg','http://127.0.0.1:3000/img/goods/g1_02.jpg','http://127.0.0.1:3000/img/goods/g1_03.jpg', '八桂凌云 广西红茶 金毫 高山云雾凌云白毫茶 150g 特级',202.50,'已优惠￥88(8.5折)', 'http://127.0.0.1:3000/img/goods/g1_04.jpg','http://127.0.0.1:3000/img/goods/g1_05.jpg','http://127.0.0.1:3000/img/goods/g1_06.jpg','http://127.0.0.1:3000/img/goods/g1_07.jpg', 'product_details.html?lid=1'),
(NULL,'乌龙茶', 'http://127.0.0.1:3000/img/goods/g2_01.jpg','http://127.0.0.1:3000/img/goods/g2_02.jpg','http://127.0.0.1:3000/img/goods/g2_03.jpg','贡茗春 凤凰单丛 2018春茶 乌龙茶 乌岽老树东方红 一级 128g 单罐',512.10,'已优惠￥88(8.8折)','http://127.0.0.1:3000/img/goods/g2_04.jpg','http://127.0.0.1:3000/img/goods/g2_05.jpg','http://127.0.0.1:3000/img/goods/g2_05.jpg','http://127.0.0.1:3000/img/goods/g2_07.jpg','product_details.html?lid=1'),
(NULL,'乌龙茶', 'http://127.0.0.1:3000/img/goods/g3_01.jpg','http://127.0.0.1:3000/img/goods/g3_02.jpg','http://127.0.0.1:3000/img/goods/g3_03.jpg','天池 凤凰单丛 2018年春茶 乌龙茶 蜜兰香 125g 单罐',259.20,'已优惠￥27(9折)','http://127.0.0.1:3000/img/goods/g3_04.jpg','http://127.0.0.1:3000/img/goods/g3_05.jpg','http://127.0.0.1:3000/img/goods/g3_06.jpg','http://127.0.0.1:3000/img/goods/g3_07.jpg', 'product_details.html?lid=1'),
(NULL,'藏茶','http://127.0.0.1:3000/img/goods/g4_01.jpg','http://127.0.0.1:3000/img/goods/g4_02.jpg','http://127.0.0.1:3000/img/goods/g4_03.jpg', '藏顿 雅安藏茶 2018年藏黑·禅茶 醇香 160g',241.20,'已优惠￥27(9折)','http://127.0.0.1:3000/img/goods/g4_04.jpg','http://127.0.0.1:3000/img/goods/g4_05.jpg','http://127.0.0.1:3000/img/goods/g4_06.jpg','http://127.0.0.1:3000/img/goods/g4_07.jpg', 'product_details.html?lid=1'),
(NULL,'铁观音','http://127.0.0.1:3000/img/goods/g5_01.jpg','http://127.0.0.1:3000/img/goods/g5_02.jpg','http://127.0.0.1:3000/img/goods/g5_03.jpg', '一匠一品 2019年 春茶 安溪铁观音 名匠刘文品代表作 特级 50g',65,'已优惠￥55(5.4折)','http://127.0.0.1:3000/img/goods/g5_04.jpg','http://127.0.0.1:3000/img/goods/g5_05.jpg','http://127.0.0.1:3000/img/goods/g5_06.jpg','http://127.0.0.1:3000/img/goods/g5_07.jpg', 'product_details.html?lid=1'),
(NULL,'铁观音','http://127.0.0.1:3000/img/goods/g6_01.jpg','http://127.0.0.1:3000/img/goods/g6_02.jpg','http://127.0.0.1:3000/img/goods/g6_03.jpg', '醉品叶界 2019年 春茶 王清海大师代表作 安溪铁观音  特级 288g 生肖“狗”标志元素礼盒',449,'已优惠￥519(4.6折)','http://127.0.0.1:3000/img/goods/g6_04.jpg','http://127.0.0.1:3000/img/goods/g6_05.jpg','http://127.0.0.1:3000/img/goods/g6_06.jpg','http://127.0.0.1:3000/img/goods/g6_07.jpg', 'product_details.html?lid=1'),
(NULL,'龙井','http://127.0.0.1:3000/img/goods/g7_01.jpg','http://127.0.0.1:3000/img/goods/g7_02.jpg','http://127.0.0.1:3000/img/goods/g7_03.jpg', '醉品朴茶 2019年头采明前龙井 自饮装 100g 买两盒赠手提袋',256,'已优惠￥264(4.9折)','http://127.0.0.1:3000/img/goods/g7_04.jpg','http://127.0.0.1:3000/img/goods/g7_05.jpg','http://127.0.0.1:3000/img/goods/g7_06.jpg','http://127.0.0.1:3000/img/goods/g7_07.jpg', 'product_details.html?lid=1'),
(NULL,'龙井','http://127.0.0.1:3000/img/goods/g8_01.jpg','http://127.0.0.1:3000/img/goods/g8_02.jpg','http://127.0.0.1:3000/img/goods/g8_03.jpg', '醉品朴茶 2019年雨前茶 西湖龙井 绿茶 清香型 一级 醉清芯·一见倾心 50g',118,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g8_04.jpg','http://127.0.0.1:3000/img/goods/g8_05.jpg','http://127.0.0.1:3000/img/goods/g8_06.jpg','http://127.0.0.1:3000/img/goods/g7_07.jpg', 'product_details.html?lid=1'),
(NULL,'龙井','http://127.0.0.1:3000/img/goods/g9_01.jpg','http://127.0.0.1:3000/img/goods/g9_02.jpg','http://127.0.0.1:3000/img/goods/g9_03.jpg', '醉品朴茶 诗酒茶系列&烟雨 2019年 西湖龙井 一级 体验装非卖品 6g',12,'已优惠￥8(6折)','http://127.0.0.1:3000/img/goods/g9_04.jpg','http://127.0.0.1:3000/img/goods/g9_05.jpg','http://127.0.0.1:3000/img/goods/g9_06.jpg','http://127.0.0.1:3000/img/goods/g9_07.jpg', 'product_details.html?lid=1'),
(NULL,'龙井','http://127.0.0.1:3000/img/goods/g10_01.jpg','http://127.0.0.1:3000/img/goods/g10_02.jpg','http://127.0.0.1:3000/img/goods/g10_03.jpg', '狮牌 西湖龙井 2018年明前茶 绿茶 特级 100g 方金罐',520,'已优惠￥630(4.5折)','http://127.0.0.1:3000/img/goods/g10_04.jpg','http://127.0.0.1:3000/img/goods/g10_05.jpg','http://127.0.0.1:3000/img/goods/g10_06.jpg','http://127.0.0.1:3000/img/goods/g10_07.jpg', 'product_details.html?lid=1'),
(NULL,'白茶','http://127.0.0.1:3000/img/goods/g11_01.jpg','http://127.0.0.1:3000/img/goods/g11_02.jpg','http://127.0.0.1:3000/img/goods/g11_03.jpg', '醉品叶界 吴月平大师代表作 寿眉饼 2013年 357g 礼盒白茶',398,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g11_04.jpg','http://127.0.0.1:3000/img/goods/g11_05.jpg','http://127.0.0.1:3000/img/goods/g11_06.jpg','http://127.0.0.1:3000/img/goods/g11_07.jpg', 'product_details.html?lid=1'),
(NULL,'白茶','http://127.0.0.1:3000/img/goods/g12_01.jpg','http://127.0.0.1:3000/img/goods/g12_02.jpg','http://127.0.0.1:3000/img/goods/g12_03.jpg', '太姥瑞祥龙 福鼎白茶 太姥山韵·雾幻 2016年 特级 寿眉 350g/饼',178,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g12_04.jpg','http://127.0.0.1:3000/img/goods/g12_05.jpg','http://127.0.0.1:3000/img/goods/g12_06.jpg','http://127.0.0.1:3000/img/goods/g12_07.jpg', 'product_details.html?lid=1'),
(NULL,'水仙 大红袍','http://127.0.0.1:3000/img/goods/g13_01.jpg','http://127.0.0.1:3000/img/goods/g13_02.jpg','http://127.0.0.1:3000/img/goods/g13_03.jpg', '醉品朴茶 武夷岩茶 水仙 本朴DHP1680-250 125g*2盒 中火 特级',342,'已优惠￥508(4折)','http://127.0.0.1:3000/img/goods/g13_04.jpg','http://127.0.0.1:3000/img/goods/g13_05.jpg','http://127.0.0.1:3000/img/goods/g13_06.jpg','http://127.0.0.1:3000/img/goods/g13_07.jpg', 'product_details.html?lid=1'),
(NULL,'大红袍 乌龙茶','http://127.0.0.1:3000/img/goods/g14_01.jpg','http://127.0.0.1:3000/img/goods/g14_02.jpg','http://127.0.0.1:3000/img/goods/g14_03.jpg', '曦瓜 武夷岩茶 大红袍 圆罐250g 中火 特级 乌龙茶 单罐',188,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g14_04.jpg','http://127.0.0.1:3000/img/goods/g14_05.jpg','http://127.0.0.1:3000/img/goods/g14_06.jpg','http://127.0.0.1:3000/img/goods/g14_07.jpg', 'product_details.html?lid=1'),
(NULL,'大红袍','http://127.0.0.1:3000/img/goods/g15_01.jpg','http://127.0.0.1:3000/img/goods/g15_02.jpg','http://127.0.0.1:3000/img/goods/g15_03.jpg','醉品朴茶 诗酒茶系列&星河 武夷大红袍  花香型中火 一级 体验装 16g',13.5,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g15_04.jpg','http://127.0.0.1:3000/img/goods/g15_05.jpg','http://127.0.0.1:3000/img/goods/g15_06.jpg','http://127.0.0.1:3000/img/goods/g15_07.jpg', 'product_details.html?lid=1'),
(NULL,'金骏眉','http://127.0.0.1:3000/img/goods/g16_01.jpg','http://127.0.0.1:3000/img/goods/g16_02.jpg','http://127.0.0.1:3000/img/goods/g16_03.jpg', '醉品朴茶 金骏眉 深山老林野茶 2019年 特级 礼盒装 250g',399,'已优惠￥491(4.5折)','http://127.0.0.1:3000/img/goods/g16_04.jpg','http://127.0.0.1:3000/img/goods/g16_05.jpg','http://127.0.0.1:3000/img/goods/g16_06.jpg','http://127.0.0.1:3000/img/goods/g16_07.jpg', 'product_details.html?lid=1'),
(NULL,'金骏眉','http://127.0.0.1:3000/img/goods/g17_01.jpg','http://127.0.0.1:3000/img/goods/g17_02.jpg','http://127.0.0.1:3000/img/goods/g17_03.jpg', '醉品朴茶·良品严选 2018年金骏眉 旅行装 JM2060-50g',75,'已优惠￥85(4.7折)','http://127.0.0.1:3000/img/goods/g17_04.jpg','http://127.0.0.1:3000/img/goods/g17_05.jpg','http://127.0.0.1:3000/img/goods/g17_06.jpg','http://127.0.0.1:3000/img/goods/g17_07.jpg', 'product_details.html?lid=1'),
(NULL,'茶针','http://127.0.0.1:3000/img/goods/g18_01.jpg','http://127.0.0.1:3000/img/goods/g18_02.jpg','http://127.0.0.1:3000/img/goods/g18_03.jpg', '茶道配件 黑檀小号扁茶针',10,'已优惠￥5(6.7折)','http://127.0.0.1:3000/img/goods/g18_04.jpg','http://127.0.0.1:3000/img/goods/g18_05.jpg','http://127.0.0.1:3000/img/goods/g18_06.jpg','http://127.0.0.1:3000/img/goods/g18_07.jpg', 'product_details.html?lid=1'),
(NULL,'正山小种','http://127.0.0.1:3000/img/goods/g19_01.jpg','http://127.0.0.1:3000/img/goods/g19_02.jpg','http://127.0.0.1:3000/img/goods/g19_03.jpg', '醉品朴茶  诗酒茶系列&浮生 2019年 正山小种 一级  体验装 10g',10,'已优惠￥8(5.6折)','http://127.0.0.1:3000/img/goods/g19_04.jpg','http://127.0.0.1:3000/img/goods/g19_05.jpg','http://127.0.0.1:3000/img/goods/g19_06.jpg','http://127.0.0.1:3000/img/goods/g19_07.jpg', 'product_details.html?lid=1'),
(NULL,'乌龙茶 金萱','http://127.0.0.1:3000/img/goods/g20_01.jpg','http://127.0.0.1:3000/img/goods/g20_02.jpg','http://127.0.0.1:3000/img/goods/g20_03.jpg', '宝泽台湾乌龙茶 阿里山高山金萱 150g 单罐',230,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g20_04.jpg','http://127.0.0.1:3000/img/goods/g20_05.jpg','http://127.0.0.1:3000/img/goods/g20_06.jpg','http://127.0.0.1:3000/img/goods/g20_07.jpg', 'product_details.html?lid=1'),
(NULL,'武夷岩茶','http://127.0.0.1:3000/img/goods/g21_01.jpg','http://127.0.0.1:3000/img/goods/g21_02.jpg','http://127.0.0.1:3000/img/goods/g21_03.jpg', '中华老字号 龙雀 武夷岩茶 厦门岁月铁罗汉 一级 500g',580,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g21_04.jpg','http://127.0.0.1:3000/img/goods/g21_05.jpg','http://127.0.0.1:3000/img/goods/g21_06.jpg','http://127.0.0.1:3000/img/goods/g21_07.jpg', 'product_details.html?lid=1'),
(NULL,'金骏眉 正山小种','http://127.0.0.1:3000/img/goods/g22_01.jpg','http://127.0.0.1:3000/img/goods/g22_02.jpg','http://127.0.0.1:3000/img/goods/g22_03.jpg', '菩美 三行情书 四种口味 袋泡茶 红茶组合装 礼盒 60g',68,'已优惠￥90(4.3折)','http://127.0.0.1:3000/img/goods/g22_02.jpg','http://127.0.0.1:3000/img/goods/g22_03.jpg','http://127.0.0.1:3000/img/goods/g22_04.jpg','http://127.0.0.1:3000/img/goods/g22_05.jpg', 'product_details.html?lid=1'),
(NULL,'普洱茶 柑普茶','http://127.0.0.1:3000/img/goods/g23_01.jpg','http://127.0.0.1:3000/img/goods/g23_02.jpg','http://127.0.0.1:3000/img/goods/g23_03.jpg', '益泡柑 代用茶 柑普茶 陈皮普洱茶饼  2017年 一级 礼盒357g',398,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g23_04.jpg','http://127.0.0.1:3000/img/goods/g23_05.jpg','http://127.0.0.1:3000/img/goods/g23_06.jpg','http://127.0.0.1:3000/img/goods/g23_07.jpg', 'product_details.html?lid=1'),
(NULL,'普洱茶','http://127.0.0.1:3000/img/goods/g24_01.jpg','http://127.0.0.1:3000/img/goods/g24_02.jpg','http://127.0.0.1:3000/img/goods/g24_03.jpg','老同志 普洱茶 2017年 熟茶 为天下人做好茶 357g/饼',280,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g24_04.jpg','http://127.0.0.1:3000/img/goods/g24_05.jpg','http://127.0.0.1:3000/img/goods/g24_06.jpg','http://127.0.0.1:3000/img/goods/g24_07.jpg', 'product_details.html?lid=1'),
(NULL,'宝泽台湾乌龙茶','http://127.0.0.1:3000/img/goods/g25_01.jpg','http://127.0.0.1:3000/img/goods/g25_02.jpg','http://127.0.0.1:3000/img/goods/g25_03.jpg', '宝泽台湾乌龙茶 冻顶乌龙高山茶 150g 单罐',330,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g25_04.jpg','http://127.0.0.1:3000/img/goods/g25_06.jpg','http://127.0.0.1:3000/img/goods/g25_07.jpg','http://127.0.0.1:3000/img/goods/g25_08.jpg', 'product_details.html?lid=1'),
(NULL,'傣园普香 普洱茶 黑茶','http://127.0.0.1:3000/img/goods/g26_01.jpg','http://127.0.0.1:3000/img/goods/g26_02.jpg','http://127.0.0.1:3000/img/goods/g26_03.jpg', '傣园普香 普洱茶 2017年 熟茶 班章 250g/砖 黑茶',420,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g26_04.jpg','http://127.0.0.1:3000/img/goods/g26_05.jpg','http://127.0.0.1:3000/img/goods/g26_06.jpg','http://127.0.0.1:3000/img/goods/g26_07.jpg', 'product_details.html?lid=1'),
(NULL,'乌龙茶 水仙 凤凰单丛','http://127.0.0.1:3000/img/goods/g27_01.jpg','http://127.0.0.1:3000/img/goods/g27_02.jpg','http://127.0.0.1:3000/img/goods/g27_03.jpg', '天池 凤凰单丛 乌龙茶 水仙 特级 50g 单罐',80,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g27_04.jpg','http://127.0.0.1:3000/img/goods/g27_05.jpg','http://127.0.0.1:3000/img/goods/g27_06.jpg','http://127.0.0.1:3000/img/goods/g27_07.jpg', 'product_details.html?lid=1'),
(NULL,'广东单丛','http://127.0.0.1:3000/img/goods/g28_01.jpg','http://127.0.0.1:3000/img/goods/g28_02.jpg','http://127.0.0.1:3000/img/goods/g28_03.jpg', '香云山广东单丛 共和先生之礼 四款经典香型组合装 99g',428,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g28_04.jpg','http://127.0.0.1:3000/img/goods/g28_05.jpg','http://127.0.0.1:3000/img/goods/g28_06.jpg','http://127.0.0.1:3000/img/goods/g28_07.jpg', 'product_details.html?lid=1'),
(NULL,'凤凰单丛','http://127.0.0.1:3000/img/goods/g29_01.jpg','http://127.0.0.1:3000/img/goods/g29_02.jpg','http://127.0.0.1:3000/img/goods/g29_03.jpg', '天池 凤凰单丛 2018年春茶 喝杯（袋泡茶） 一级 24g',38,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g29_04.jpg','http://127.0.0.1:3000/img/goods/g29_05.jpg','http://127.0.0.1:3000/img/goods/g29_06.jpg','http://127.0.0.1:3000/img/goods/g29_07.jpg', 'product_details.html?lid=1'),
(NULL,'广东单丛','http://127.0.0.1:3000/img/goods/g30_01.jpg','http://127.0.0.1:3000/img/goods/g30_02.jpg','http://127.0.0.1:3000/img/goods/g30_03.jpg', '香云山广东单丛 特别定制款先生之礼 90g 长条盒',498,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g30_04.jpg','http://127.0.0.1:3000/img/goods/g30_05.jpg','http://127.0.0.1:3000/img/goods/g30_06.jpg','http://127.0.0.1:3000/img/goods/g30_07.jpg', 'product_details.html?lid=1'),
(NULL,'茶具','http://127.0.0.1:3000/img/goods/g31_01.jpg','http://127.0.0.1:3000/img/goods/g31_02.jpg','http://127.0.0.1:3000/img/goods/g31_03.jpg', '陶瓷茶具 小号盖帽杯 白色',1950,'全场商品90天保价','http://127.0.0.1:3000/img/goods/g31_04.jpg','http://127.0.0.1:3000/img/goods/g31_05.jpg','http://127.0.0.1:3000/img/goods/g31_06.jpg','http://127.0.0.1:3000/img/goods/g31_07.jpg', 'product_details.html?lid=1'),
(NULL,'茶具 茶壶','http://127.0.0.1:3000/img/goods/g32_01.jpg','http://127.0.0.1:3000/img/goods/g32_02.jpg','http://127.0.0.1:3000/img/goods/g32_03.jpg', '陶瓷茶具 茶壶 高白壶2号 轻巧防烫壶',105,'已优惠￥43(7.1折)','http://127.0.0.1:3000/img/goods/g32_04.jpg','http://127.0.0.1:3000/img/goods/g32_05.jpg','http://127.0.0.1:3000/img/goods/g32_06.jpg','http://127.0.0.1:3000/img/goods/g32_07.jpg', 'product_details.html?lid=1'),
(NULL,'茶具 茶杯','http://127.0.0.1:3000/img/goods/g33_01.jpg','http://127.0.0.1:3000/img/goods/g33_02.jpg','http://127.0.0.1:3000/img/goods/g33_03.jpg', '玻璃茶具 锤纹小杯 个人杯',32,'全场商品90天保价','http://127.0.0.1:3000/img/goods/g33_04.jpg','http://127.0.0.1:3000/img/goods/g33_05.jpg','http://127.0.0.1:3000/img/goods/g33_06.jpg','http://127.0.0.1:3000/img/goods/g33_07.jpg', 'product_details.html?lid=1'),
(NULL,'红茶 ','http://127.0.0.1:3000/img/goods/g34_01.jpg','http://127.0.0.1:3000/img/goods/g34_02.jpg','http://127.0.0.1:3000/img/goods/g34_03.jpg', '【有机茶】八桂凌云 广西红茶  雾中缘金毫红茶 特级 180g',960,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g34_04.jpg','http://127.0.0.1:3000/img/goods/g34_05.jpg','http://127.0.0.1:3000/img/goods/g34_06.jpg','http://127.0.0.1:3000/img/goods/g34_07.jpg', 'product_details.html?lid=1'),
(NULL,'水仙 ','http://127.0.0.1:3000/img/goods/g35_01.jpg','http://127.0.0.1:3000/img/goods/g35_02.jpg','http://127.0.0.1:3000/img/goods/g35_03.jpg', '醉品朴茶 全新升级之自饮系列 2018年漳平水仙 特级 100g',120,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g35_04.jpg','http://127.0.0.1:3000/img/goods/g35_05.jpg','http://127.0.0.1:3000/img/goods/g35_06.jpg','http://127.0.0.1:3000/img/goods/g35_07.jpg', 'product_details.html?lid=1'),
(NULL,'碧螺春 ','http://127.0.0.1:3000/img/goods/g36_01.jpg','http://127.0.0.1:3000/img/goods/g36_02.jpg','http://127.0.0.1:3000/img/goods/g36_03.jpg', '醉品朴茶 江苏吴中核心产区25年炒茶师傅纯手工炒制碧螺春 100g',150,'已优惠￥165(4.8折)','http://127.0.0.1:3000/img/goods/g36_04.jpg','http://127.0.0.1:3000/img/goods/g36_05.jpg','http://127.0.0.1:3000/img/goods/g36_06.jpg','http://127.0.0.1:3000/img/goods/g36_07.jpg', 'product_details.html?lid=1'),
(NULL,'玫瑰花茶 ','http://127.0.0.1:3000/img/goods/g37_01.jpg','http://127.0.0.1:3000/img/goods/g37_02.jpg','http://127.0.0.1:3000/img/goods/g37_03.jpg', '赏友 玫瑰花后 大礼盒 特级 18朵 27g',298,'已优惠￥0(10折)','http://127.0.0.1:3000/img/goods/g37_04.jpg','http://127.0.0.1:3000/img/goods/g37_05.jpg','http://127.0.0.1:3000/img/goods/g37_06.jpg','http://127.0.0.1:3000/img/goods/g37_07.jpg', 'product_details.html?lid=1');

/****首页轮播广告商品****/
INSERT INTO tea_index_carousel VALUES
(NULL, 'http://127.0.0.1:3000/img/index/banner1.jpg','轮播广告商品1','product_details.html?lid=28'),
(NULL, 'http://127.0.0.1:3000/img/index/banner2.gif','轮播广告商品2','product_details.html?lid=19'),
(NULL, 'http://127.0.0.1:3000/img/index/banner3.jpg','轮播广告商品3','lookforward.html'),
(NULL, 'http://127.0.0.1:3000/img/index/banner4.jpg','轮播广告商品4','lookforward.html');

/****首页菜单告商品****/
INSERT INTO tea_index_menu VALUES
(NULL, 'http://127.0.0.1:3000/img/index/menu1.png','品牌集成','product_details.html?lid=28'),
(NULL, 'http://127.0.0.1:3000/img/index/menu2.png','大师名匠','product_details.html?lid=19'),
(NULL, 'http://127.0.0.1:3000/img/index/menu3.png','新客专享','lookforward.html'),
(NULL, 'http://127.0.0.1:3000/img/index/menu4.png','醉品茶集','lookforward.html'),
(NULL, 'http://127.0.0.1:3000/img/index/menu5.png','积分商城','lookforward.html');

/****首页商品****/
INSERT INTO tea_index_product VALUES
(NULL,1, 'http://127.0.0.1:3000/img/index/p1_01.jpg', '三和 安溪铁观音 2018春茶 乌龙茶 清香型 特级 和清333 250g',NULL,'http://127.0.0.1:3000/img/index/tj.png',450, 'product_details.html?lid=1',500),
(NULL,2, 'http://127.0.0.1:3000/img/index/p1_02.jpg', '八桂凌云 广西红茶 金毫 高山云雾凌云白毫茶 150g 特级',NULL,'http://127.0.0.1:3000/img/index/tj.png',202.50, 'product_details.html?lid=1',225),
(NULL,3, 'http://127.0.0.1:3000/img/index/p1_03.jpg', '贡茗春 凤凰单丛 2018春茶 乌龙茶 乌岽老树东方红 一级 128g 单罐',NULL,'http://127.0.0.1:3000/img/index/tj.png',512.10, 'product_details.html?lid=1',600),
(NULL, 4,'http://127.0.0.1:3000/img/index/p1_04.jpg', '天池 凤凰单丛 2018年春茶 乌龙茶 蜜兰香 125g 单罐',NULL,'http://127.0.0.1:3000/img/index/tj.png',259.20, 'product_details.html?lid=1',288),
(NULL,5,'http://127.0.0.1:3000/img/index/p1_05.jpg', '藏顿 雅安藏茶 2018年藏黑·禅茶 醇香 160g',NULL,'http://127.0.0.1:3000/img/index/tj.png',241.20, 'product_details.html?lid=1',268),
(NULL, 19,'http://127.0.0.1:3000/img/index/p2_01.jpg', '茶道配件 黑檀小号扁茶针'," ",NULL,10, 'product_details.html?lid=1',1),
(NULL,16, 'http://127.0.0.1:3000/img/index/p2_02.jpg', '醉品朴茶 诗酒茶系列&星河 武夷大红袍  花香型中火 一级 体验装 16g','8703811同款体验装',NULL,13.5,'product_details.html?lid=1',1),
(NULL,20, 'http://127.0.0.1:3000/img/index/p2_03.jpg', '醉品朴茶 诗酒茶系列&浮生 2019年 正山小种 一级 体验装 10g','8700564同款体验装',NULL,10, 'product_details.html?lid=1',1),
(NULL,10, 'http://127.0.0.1:3000/img/index/p2_04.jpg', '醉品朴茶 诗酒茶系列&烟雨 2019年 西湖龙井 一级 体验装非卖品 6g','8699842同款体验装',NULL,12, 'product_details.html?lid=1',1),
(NULL,6 ,'http://127.0.0.1:3000/img/index/p2_05.jpg', '一匠一品 匡保华 2019年 安化红针 礼盒装 60g','养颜甜蜜红茶',NULL,390, 'product_details.html?lid=1',1),
(NULL,21, 'http://127.0.0.1:3000/img/index/p3_01.jpg', '台湾乌龙茶 150g','漂洋过海来看你，等了特别久，非常满意，人家很喜欢，包装也很好','http://127.0.0.1:3000/img/index/xt1.png',330, 'product_details.html?lid=1','来自打酱油男孩的评价'),
(NULL,22, 'http://127.0.0.1:3000/img/index/p3_02.jpg', '武夷岩茶 500g','刚上新我就买了，口感不错，比我以前和的大红袍口感浓厚，回味更香，以后就它啦','http://127.0.0.1:3000/img/index/xt1.png',580, 'product_details.html?lid=1',"来自小豆壳的评价"),
(NULL, 23,'http://127.0.0.1:3000/img/index/p3_03.jpg', '金骏眉 60g','三行情书，很棒的创意，密封包装 分量足 口感好满意','http://127.0.0.1:3000/img/index/xt2.png',68, 'product_details.html?lid=1',"来自洋葱头的评价"),
(NULL,24, 'http://127.0.0.1:3000/img/index/p3_04.jpg', '柑普茶 357g','满意，很正宗的味道，送人也合适',"http://127.0.0.1:3000/img/index/xt1.png",398, 'product_details.html?lid=1',"来自掠风米的评价"),
(NULL,25, 'http://127.0.0.1:3000/img/index/p3_05.jpg', '普洱茶 357g','不拆了。非常好，满意(据以往经验)',"http://127.0.0.1:3000/img/index/xt3.png",280, 'product_details.html?lid=1',"来自爱的信念7的评价"),
(NULL,26, 'http://127.0.0.1:3000/img/index/p3_06.jpg', '台湾乌龙茶 150g','正宗台湾乌龙茶。很满意的茶，很好的客服。',"http://127.0.0.1:3000/img/index/xt3.png",330, 'product_details.html?lid=1',"来自yxtcly的评价"),
(NULL, 27,'http://127.0.0.1:3000/img/index/p3_07.jpg', '普洱茶 357g','很喜欢这一款，买了很多次了。今后会继续光顾，信任醉品',"http://127.0.0.1:3000/img/index/xt3.png",420, 'product_details.html?lid=1',"来自lieber126的评价"),
(NULL,NULL,'http://127.0.0.1:3000/img/index/p4_01.jpg', '安溪铁观音','',"",180, 'product_details.html?lid=1',"茶农直供 实惠好喝 买就省70%"),
(NULL,NULL,'http://127.0.0.1:3000/img/index/p4_02.jpg', '武夷大红袍','',"",188, 'product_details.html?lid=1',"岩骨花香"),
(NULL,NULL,'http://127.0.0.1:3000/img/index/p4_03.jpg', '正山小种','',"",488, 'product_details.html?lid=1',"金骏眉创始人监制"),
(NULL,NULL,'http://127.0.0.1:3000/img/index/p4_04.jpg', '金骏眉','',"",259, 'product_details.html?lid=1',"专业评委亲选"),
(NULL,NULL,'http://127.0.0.1:3000/img/index/p4_05.jpg', '福鼎白茶','',"",368, 'product_details.html?lid=1',"欧盟出口标准打造"),
(NULL,NULL,'http://127.0.0.1:3000/img/index/p4_06.jpg', '普洱','',"",280, 'product_details.html?lid=1',"送礼诚意之选"),
(NULL,NULL,'http://127.0.0.1:3000/img/index/p4_07.jpg', '广东单枞','',"",128, 'product_details.html?lid=1',"火山上的凤凰单丛"),
(NULL,NULL,'http://127.0.0.1:3000/img/index/p4_08.jpg', '龙井','',"",280, 'product_details.html?lid=1',"G20峰会指定产品");