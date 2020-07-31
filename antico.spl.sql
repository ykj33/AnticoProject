-- 계정 생성
CREATE USER antico IDENTIFIED BY antico;
GRANT CONNECT, RESOURCE, DBA TO antico;

COMMIT

--DROP USER antico CASCADE;

conn antico/antico

-- 회원
CREATE TABLE tbl_member(
email VARCHAR2(100) PRIMARY KEY,
mpw VARCHAR2(50) NOT NULL,
key VARCHAR2(20) NOT NULL,
subscribe_date DATE DEFAULT SYSDATE
);

-- 회원 배송지 주소록
CREATE TABLE tbl_delivery_adbk(
email VARCHAR2(100) REFERENCES tbl_member (email),
delivery_adbk_no NUMBER(2) NOT NULL,
delivery_adbk_ncm VARCHAR2(50) NOT NULL,
delivery_place_tlnum VARCHAR2(11) NOT NULL,
delivery_place_adres VARCHAR2(300) NOT NULL,
delivery_place_adres_detail VARCHAR2(150) NOT NULL
);

COMMIT

--DROP TABLE tbl_order
--DROP TABLE tbl_delivery_adbk
--DROP TABLE tbl_member

SELECT * FROM tbl_member
SELECT * FROM tbl_delivery_adbk

--상품 테이블
CREATE TABLE tbl_goods(
goods_no VARCHAR2(4) PRIMARY KEY,
goods_nm VARCHAR2(150),
makr VARCHAR2(60),
goods_category VARCHAR2(30),
goods_img VARCHAR2(500),
goods_info_img VARCHAR2(500),
goods_info_text VARCHAR2(1000)
)

-- 상품 옵션
CREATE TABLE tbl_goods_option(
goods_no VARCHAR2(4) REFERENCES tbl_goods (goods_no),
goods_amount NUMBER,
goods_untpc NUMBER,
goods_size VARCHAR2(30),
goods_color VARCHAR2(30)
)

COMMIT

--DROP TABLE tbl_order_detail
--DROP TABLE tbl_goods_option
--DROP TABLE tbl_goods

SELECT * FROM tbl_goods
SELECT * FROM tbl_goods_option

-- 주문
CREATE TABLE tbl_order(
order_no NUMBER PRIMARY KEY,
email VARCHAR2(100) REFERENCES tbl_member(email),
delivery_no VARCHAR2(15) NOT NULL,
order_date DATE DEFAULT SYSDATE,
order_totamt NUMBER NOT NULL,
order_pro_sttus_code VARCHAR2(12) NOT NULL,
frwll_reason_code VARCHAR2(60),
setle_mth VARCHAR2(60) NOT NULL,
delivery_adbk_no NUMBER(2) NOT NULL
)

-- 주문 상세
CREATE TABLE tbl_order_detail(
order_no NUMBER REFERENCES tbl_order(order_no),
goods_no VARCHAR2(4) REFERENCES tbl_goods(goods_no),
order_amount NUMBER not null,
goods_untpc NUMBER not null,
application_dscnt_rate NUMBER DEFAULT 0,
goods_size VARCHAR2(30),
goods_color VARCHAR2(30)
)

COMMIT

--DROP TABLE tbl_order_detail
--DROP TABLE tbl_order

SELECT * FROM tbl_order
SELECT * FROM tbl_order_detail

-- 장바구니
CREATE TABLE tbl_cart(
cart_id NUMBER NOT NULL PRIMARY KEY,
email VARCHAR2(100) REFERENCES tbl_member(email),
goods_no VARCHAR2(4) REFERENCES tbl_goods(goods_no),
goods_img VARCHAR2(500),
goods_nm VARCHAR2(150) NOT NULL,
goods_color VARCHAR2(30) NOT NULL,
goods_size VARCHAR2(30) NOT NULL,
goods_amount NUMBER NOT NULL,
goods_untpc NUMBER NOT NULL
);


CREATE SEQUENCE seq_tbl_cart START WITH 1 increment BY 1;

COMMIT;


--DROP TABLE tbl_goods
--DROP TABLE tbl_member
--DROP TABLE tbl_cart