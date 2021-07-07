CREATE TABLE T_ACCOUNT
(
	ID INT NOT NULL,
	NAME VARCHAR(20) NOT NULL COMMENT '帐号名',
	HEAD_IMG BLOB COMMENT '头像图片',
	INTRODUCTION TEXT COMMENT '自我介绍',
	PRIMARY KEY (ID)
) COMMENT='帐号';

CREATE TABLE T_ADDRESS
(
	ACCOUNT_ID INT COMMENT '所属帐号',
	CITY VARCHAR(50) COMMENT '城市',
	STREET VARCHAR(100) COMMENT '街道',
	RESIDENTIAL VARCHAR(100) COMMENT '住宅区',
	HOUSE_NUMBER VARCHAR(100) COMMENT '门牌号'
) COMMENT='住址';
ALTER TABLE T_ADDRESS ADD FOREIGN KEY (ACCOUNT_ID) REFERENCES T_ACCOUNT (ID);
ALTER TABLE T_ADDRESS ADD CONSTRAINT UK_ACCOUNT_ID UNIQUE (ACCOUNT_ID);

CREATE TABLE T_ADDRESS_TYPE
(
	ID INT,
	TYPE_NAME VARCHAR(50) NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE T_ADDRESS_MORE
(
	ACCOUNT_ID INT NOT NULL COMMENT '所属地址',
	ADDRESS VARCHAR(200) COMMENT '地址',
	ADDRESS_TYPE INT,
	ADDRESS_PHOTO BLOB COMMENT '地址照片',
	ADDRESS_DESC TEXT COMMENT '地址描述'
) COMMENT='更多住址';
ALTER TABLE T_ADDRESS_MORE ADD FOREIGN KEY (ACCOUNT_ID) REFERENCES T_ADDRESS (ACCOUNT_ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE T_ADDRESS_MORE ADD FOREIGN KEY (ADDRESS_TYPE) REFERENCES T_ADDRESS_TYPE (ID);

CREATE TABLE T_PRODUCT
(
	ID INT NOT NULL,
	NAME VARCHAR(20) NOT NULL COMMENT '商品名称',
	PRICE DECIMAL(10,2) NOT NULL COMMENT '价格',
	PRIMARY KEY (ID)
) COMMENT='商品';

CREATE TABLE T_ORDER
(
	ID INT NOT NULL,
	NAME VARCHAR(20) NOT NULL COMMENT '订单名称',
	ACCOUNT_ID INT COMMENT '所属帐号',
	DESCRIPTION VARCHAR(20) DEFAULT 'note' COMMENT '描述',
	STAR_LEVEL INT DEFAULT 1 COMMENT '星级',
	CREATE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP() COMMENT '创建日期',
	EDIT_TIME DATETIME COMMENT '编辑日期',
	PRIMARY KEY (ID)
) COMMENT='订单';
ALTER TABLE T_ORDER ADD FOREIGN KEY (ACCOUNT_ID) REFERENCES T_ACCOUNT (ID);

CREATE TABLE T_ORDER_PRODUCTS
(
	ORDER_ID INT NOT NULL COMMENT '订单',
	PRODUCT_ID INT NOT NULL COMMENT '商品'
) COMMENT='订单-商品';
ALTER TABLE T_ORDER_PRODUCTS ADD FOREIGN KEY (ORDER_ID) REFERENCES T_ORDER (ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE T_ORDER_PRODUCTS ADD FOREIGN KEY (PRODUCT_ID) REFERENCES T_PRODUCT (ID) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE T_PRODUCT_PRICE_HISTORY
(
	PRODUCT_ID INT NOT NULL COMMENT '商品',
	PRICE DECIMAL(10,2) NOT NULL COMMENT '价格'
);
ALTER TABLE T_PRODUCT_PRICE_HISTORY ADD FOREIGN KEY (PRODUCT_ID) REFERENCES T_PRODUCT (ID) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE T_AUTO_GENERATED_KEYS
(
	ID INT NOT NULL AUTO_INCREMENT,
	NAME VARCHAR(20),
	CREATE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
	PRIMARY KEY (ID)
);

CREATE TABLE `T_PECULIAR_ACCOUNT_[a]b$c`
(
	ID INT NOT NULL,
	NAME VARCHAR(20) NOT NULL COMMENT '帐号名',
	HEAD_IMG BLOB COMMENT '头像图片',
	INTRODUCTION TEXT COMMENT '自我介绍',
	PRIMARY KEY (ID)
) COMMENT='帐号';

CREATE TABLE `T_PECULIAR_ADDRESS_[ab]c$d_1`
(
	ACCOUNT_ID INT COMMENT '所属帐号',
	CITY VARCHAR(50) COMMENT '城市',
	STREET VARCHAR(100) COMMENT '街道',
	RESIDENTIAL VARCHAR(100) COMMENT '住宅区',
	HOUSE_NUMBER VARCHAR(100) COMMENT '门牌号'
) COMMENT='住址';
ALTER TABLE `T_PECULIAR_ADDRESS_[ab]c$d_1` ADD FOREIGN KEY (ACCOUNT_ID) REFERENCES `T_PECULIAR_ACCOUNT_[a]b$c` (ID);
ALTER TABLE `T_PECULIAR_ADDRESS_[ab]c$d_1` ADD CONSTRAINT UK_ACCOUNT_ID UNIQUE (ACCOUNT_ID);

CREATE TABLE `T_PECULIAR_ADDRESS_MORE_a$b[cde]f_1`
(
	ACCOUNT_ID INT NOT NULL COMMENT '所属地址',
	ADDRESS VARCHAR(200) COMMENT '地址',
	ADDRESS_PHOTO BLOB COMMENT '地址照片',
	ADDRESS_DESC TEXT COMMENT '地址描述',
	`PECULIAR_new$_t[a]b.lec<ol>1#` VARCHAR(50)
) COMMENT='更多住址';
ALTER TABLE `T_PECULIAR_ADDRESS_MORE_a$b[cde]f_1` ADD FOREIGN KEY (ACCOUNT_ID) REFERENCES `T_PECULIAR_ADDRESS_[ab]c$d_1` (ACCOUNT_ID) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE T_DATE
(
	ID INT NOT NULL,
	`DATE` DATE,
	`DATETIME` DATETIME,
	`TIME` TIME,
	`TIMESTAMP` TIMESTAMP,
	`YEAR` YEAR,
	PRIMARY KEY (ID)
);

CREATE TABLE T_DATA_IMPORT
(
	ID INT NOT NULL,
	NAME VARCHAR(200),
	COL_DATE DATE,
	COL_DATETIME DATETIME,
	COL_TIME TIME,
	COL_TIMESTAMP TIMESTAMP,
	COL_BLOB BLOB,
	COL_CLOB TEXT,
	PRIMARY KEY (ID)
);

CREATE TABLE T_DATA_EXPORT
(
	ID INT NOT NULL,
	NAME VARCHAR(200),
	COL_DATE DATE,
	COL_DATETIME DATETIME,
	COL_TIME TIME,
	COL_TIMESTAMP TIMESTAMP,
	COL_BLOB BLOB,
	COL_CLOB TEXT,
	PRIMARY KEY (ID)
);

CREATE TABLE T_ANALYSIS
(
	NAME VARCHAR(50) NOT NULL,
	VALUE DECIMAL(10,2) NOT NULL
);

CREATE TABLE T_ANALYSIS_1
(
	COL_NAME VARCHAR(50) NOT NULL,
	COL_DATE DATE NOT NULL,
	COL_VALUE DECIMAL(10,2) NOT NULL
);

CREATE TABLE T_ANALYSIS_2
(
	COL_NAME VARCHAR(50) NOT NULL,
	COL_X DECIMAL(10,2) NOT NULL,
	COL_Y DECIMAL(10,2) NOT NULL
);

CREATE TABLE T_ANALYSIS_MAP
(
    COL_NAME VARCHAR(50) NOT NULL,
    COL_VALUE DECIMAL(10,2) NOT NULL,
    COL_LONGITUDE DECIMAL(12,6),
    COL_LATITUDE DECIMAL(12,6),
	PRIMARY KEY (COL_NAME)
);

CREATE TABLE T_ANALYSIS_MAP_1
(
  COL_NAME VARCHAR(50),
  COL_VALUE DECIMAL(10),
  COL_PARENT VARCHAR(50)
);

CREATE TABLE T_TIME_SERIES
(
  COL_TIME VARCHAR(50),
  COL_VALUE DECIMAL(10,2)
);

/*
truncate table t_auto_generated_keys;
truncate table t_data_export;
truncate table t_data_import;
truncate table t_date;
truncate table t_order_products;
truncate table t_order;
truncate table t_product_price_history;
truncate table t_product;
truncate table `t_peculiar_address_more_a$b[cde]f_1`;
truncate table `t_peculiar_address_[ab]c$d_1`;
truncate table `t_peculiar_account_[a]b$c`;
truncate table t_address_more;
truncate table t_address;
truncate table t_address_type;
truncate table t_account;
truncate table t_analysis;
truncate table t_analysis_1;
truncate table t_analysis_2;
truncate table t_analysis_map;
truncate table t_analysis_map_1;
truncate table t_time_series;
*/

/*
drop table t_auto_generated_keys;
drop table t_data_export;
drop table t_data_import;
drop table t_date;
drop table t_order_products;
drop table t_order;
drop table t_product_price_history;
drop table t_product;
drop table `t_peculiar_address_more_a$b[cde]f_1`;
drop table `t_peculiar_address_[ab]c$d_1`;
drop table `t_peculiar_account_[a]b$c`;
drop table t_address_more;
drop table t_address;
drop table t_address_type;
drop table t_account;
drop table t_analysis;
drop table t_analysis_1;
drop table t_analysis_2;
drop table t_analysis_map;
drop table t_analysis_map_1;
drop table t_time_series;
*/