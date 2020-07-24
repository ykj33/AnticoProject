CREATE USER antico IDENTIFIED BY antico;
GRANT CONNECT, RESOURCE, DBA TO antico;

conn antico/antico

CREATE TABLE tbl_member(
mid VARCHAR2(30) PRIMARY KEY,
email VARCHAR2(100) NOT NULL,
mpw VARCHAR2(50) NOT NULL,
mname VARCHAR2(12),
telephone VARCHAR2(11),
subscribe_date DATE DEFAULT SYSDATE
);


CREATE TABLE tbl_delivery_adbk(
mid VARCHAR2(30) REFERENCES tbl_member (mid),
delivery_adbk_no NUMBER(2) NOT NULL,
delivery_adbk_ncm VARCHAR2(50) NOT NULL,
delivery_place_tlnum VARCHAR2(11) NOT NULL,
delivery_place_adres VARCHAR2(300) NOT NULL,
delivery_place_adres_detail VARCHAR2(150) NOT NULL
);

COMMIT

SELECT * FROM tbl_member

INSERT INTO tbl_member(mid, email, mpw) VALUES('lee', 'lee@naver.com', '1')

--상품 테이블
CREATE TABLE tbl_goods(
goods_no NUMBER PRIMARY KEY,
goods_nm VARCHAR2(150),
makr VARCHAR2(60),
goods_category VARCHAR2(30),
goods_img VARCHAR2(500),
goods_info_img VARCHAR2(500),
goods_info_text VARCHAR2(1000)
)

CREATE TABLE tbl_gods_option(
goods_no NUMBER REFERENCES tbl_goods (goods_no),
goods_amount NUMBER,
goods_untpc NUMBER,
goods_size VARCHAR2(30),
goods_color VARCHAR2(30)
)

COMMIT

SELECT * FROM tbl_goods