SET NAMES UTF8;
DROP DATABASE IF EXISTS lg;
CREATE DATABASE	lg charset=utf8;
#进入数据库
USE lg;

DROP TABLE IF EXISTS lg_login;
CREATE TABLE lg_login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(50),
  upwd  VARCHAR(32)
);
#功能二:添加二条测试数据 
INSERT INTO lg_login VALUES(null,'tom',md5('123'));
INSERT INTO lg_login VALUES(null,'jerry',md5('123'));

DROP TABLE IF EXISTS lg_pro;
CREATE TABLE lg_pro(
  lid    INT(11) PRIMARY KEY AUTO_INCREMENT,
  lname  VARCHAR(128), 
  price  DECIMAL(10,2),
  img_url VARCHAR(255),
  details1 VARCHAR(255),
  details2 VARCHAR(255)
);
INSERT INTO lg_pro VALUES(null,"LG冰箱GR-M2471PSF",'12999',"img/1.PNG","freezer_detail/freezer1.png","freezer_detail/freezer2.png"); 
INSERT INTO lg_pro VALUES(null,"LG洗衣机WDFH457CO",'8848',"img/2.PNG","washer_detail/1.PNG","washer_detail/2.PNG"); 
INSERT INTO lg_pro VALUES(null,"LG冰箱GR-K40PNVQ",'8848',"img/3.PNG","freezer_detail/freezer3.png","freezer_detail/freezer4.png"); 
INSERT INTO lg_pro VALUES(null,"LG冰箱F448MC12B",'8848',"img/4.PNG","freezer_detail/freezer1.png","freezer_detail/freezer2.png"); 
INSERT INTO lg_pro VALUES(null,"LG电视OLED55E9P",'8848',"img/5.PNG","tv_detail/tv1.PNG","tv_detail/tv2.PNG"); 
INSERT INTO lg_pro VALUES(null,"LG电视OLED65W9PCA",'8848',"img/6.PNG","tv_detail/tv3.PNG","tv_detail/tv4.PNG");
INSERT INTO lg_pro VALUES(null,"LG洗衣机FS10TG4",'8848',"img/7.PNG","washer_detail/3.PNG","washer_detail/4.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视OLED65E9P",'8848',"img/8.PNG","tv_detail/tv5.PNG","tv_detail/tv6.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视OLED77W9PCA",'8848',"img/9.PNG","tv_detail/tv7.PNG","tv_detail/tv8.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视75SM9000",'8848',"img/10.PNG","tv_detail/tv9.PNG","tv_detail/tv1.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视55SM8100",'6656',"img/11.PNG","tv_detail/10.PNG","tv_detail/11.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视55UM7600PCA",'6656',"img/12.PNG","tv_detail/12.PNG","tv_detail/13.PNG");
INSERT INTO lg_pro VALUES(null,"LG滚筒洗衣机",'6856',"img/13.PNG","washer_detail/5.PNG","washer_detail/6.PNG");
INSERT INTO lg_pro VALUES(null,"LG滚筒洗衣机WD",'12456',"img/14.PNG","washer_detail/7.PNG","washer_detail/8.PNG");
INSERT INTO lg_pro VALUES(null,"LG滚筒洗衣机DHZ",'9856',"img/15.PNG","washer_detail/1.PNG","washer_detail/3.PNG");
INSERT INTO lg_pro VALUES(null,"LG洗衣机WD-VH451D7S",'6656',"img/16.PNG","washer_detail/9.PNG","washer_detail/10.PNG");
INSERT INTO lg_pro VALUES(null,"LG8K高清电视",'16656',"img/17.PNG","tv_detail/14.PNG","tv_detail/15.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视OLED75GZ",'14899',"img/18.PNG","tv_detail/16.PNG","tv_detail/10.PNG");
INSERT INTO lg_pro VALUES(null,"LG冰箱A9513",'8656',"img/19.PNG","freezer_detail/freezer2.png","freezer_detail/freezer3.png");
INSERT INTO lg_pro VALUES(null,"LG节能冰箱S3RF",'6656',"img/20.PNG","freezer_detail/freezer1.png","freezer_detail/freezer4.png");


DROP TABLE IF EXISTS lg_cart;
CREATE TABLE lg_cart(
  id     INT PRIMARY KEY AUTO_INCREMENT,
  lid    INT,
  price  DECIMAL(10,2),
  count  INT,
  lname  VARCHAR(255),
  uid    INT
);