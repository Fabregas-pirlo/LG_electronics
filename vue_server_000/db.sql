#db.sql 创建表添加数据
#学子商城 mintui版本

#功能一:创建表xz_login 用户登录表
USE xz;
CREATE TABLE xz_login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(50),
  upwd  VARCHAR(32)
);
#功能二:添加二条测试数据 
INSERT INTO xz_login VALUES(null,'tom',md5('123'));
INSERT INTO xz_login VALUES(null,'jerry',md5('123'));

###功能商品添加
#功能三:向商品表中添加一列 img_url
USE xz;
ALTER TABLE xz_laptop ADD img_url VARCHAR(255);
#更新商品表图片 01.jpg 02.jpg
UPDATE xz_laptop SET img_url='01.jpg'
WHERE lid = 1;
UPDATE xz_laptop SET img_url='02.jpg'
WHERE lid > 1;



#创建表 购物车
#DECIMAL 高精度浮点数 2.00-1.99=0.01
#INT     199分 /100  无误差
#lid 商品编号/price 价格/count数量
#lname 商品名称/uid用户编号
CREATE TABLE xz_cart(
  id     INT PRIMARY KEY AUTO_INCREMENT,
  lid    INT,
  price  DECIMAL(10,2),
  count  INT,
  lname  VARCHAR(255),
  uid    INT
);

use xz;
DROP TABLE IF EXISTS lg_pro;
CREATE TABLE lg_pro(
  lid    INT(11) PRIMARY KEY AUTO_INCREMENT,
  lname  VARCHAR(128), 
  price  DECIMAL(10,2),
  img_url VARCHAR(255),
  details VARCHAR(1024)
);
INSERT INTO lg_pro VALUES(null,"LG冰箱GR-M2471PSF",'12999',"img/1.PNG",null); 
INSERT INTO lg_pro VALUES(null,"LG洗衣机WDFH457CO",'8848',"img/2.PNG",null); 
INSERT INTO lg_pro VALUES(null,"LG冰箱GR-K40PNVQ",'8848',"img/3.PNG"); 
INSERT INTO lg_pro VALUES(null,"LG冰箱F448MC12B",'8848',"img/4.PNG"); 
INSERT INTO lg_pro VALUES(null,"LG电视OLED55E9P",'8848',"img/5.PNG"); 
INSERT INTO lg_pro VALUES(null,"LG电视OLED65W9PCA",'8848',"img/6.PNG");
INSERT INTO lg_pro VALUES(null,"LG洗衣机FS10TG4",'8848',"img/7.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视OLED65E9P",'8848',"img/8.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视OLED77W9PCA",'8848',"img/9.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视75SM9000",'8848',"img/10.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视55SM8100",'6656',"img/11.PNG");
INSERT INTO lg_pro VALUES(null,"LG电视55UM7600PCA",'6656',"img/12.PNG");
INSERT INTO lg_pro VALUES(null,"LG滚筒洗衣机",'6856',"img/13.PNG");
INSERT INTO lg_pro VALUES(null,"LG滚筒洗衣机WD",'12456',"img/14.PNG");
INSERT INTO lg_pro VALUES(null,"LG滚筒洗衣机DHZ",'9856',"img/15.PNG");
INSERT INTO lg_pro VALUES(null,"LG洗衣机WD-VH451D7S",'6656',"img/16.PNG");
INSERT INTO lg_pro VALUES(null,"LG美容仪LGBLJ",'6656',"img/17.PNG");
INSERT INTO lg_pro VALUES(null,"LG吸尘器A958KA",'8899',"img/18.PNG");
INSERT INTO lg_pro VALUES(null,"LG吸尘器A958SA",'6656',"img/19.PNG");
INSERT INTO lg_pro VALUES(null,"LG衣物护理机S3RF",'6656',"img/20.PNG");

use xz;
DROP TABLE IF EXISTS lg_cart;
CREATE TABLE lg_cart(
  id     INT PRIMARY KEY AUTO_INCREMENT,
  lid    INT,
  price  DECIMAL(10,2),
  count  INT,
  lname  VARCHAR(255),
  uid    INT
);




