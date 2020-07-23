CREATE USER antico IDENTIFIED BY antico;
GRANT CONNECT, RESOURCE, DBA TO antico;

CREATE TABLE tbl_member(
mid VARCHAR2(30) PRIMARY KEY,
email VARCHAR2(100) NOT NULL,
mpw VARCHAR2(50) NOT NULL,
mname VARCHAR2(12),
telephone VARCHAR2(11),
subscribe_date DATE DEFAULT SYSDATE
)


CREATE TABLE tbl_delivery_adbk(
mid VARCHAR2(30) REFERENCES tbl_member (mid),
delivery_adbk_no NUMBER(2) NOT NULL,
delivery_adbk_ncm VARCHAR2(50) NOT NULL,
delivery_place_tlnum VARCHAR2(11) NOT NULL,
delivery_place_adres VARCHAR2(300) NOT NULL,
delivery_place_adres_detail VARCHAR2(150) NOT NULL
)

COMMIT

SELECT * FROM tbl_member

INSERT INTO tbl_member(mid, email, mpw) VALUES('lee', 'lee@naver.com', '1')

--상품 테이블
create table tbl_goods(
goods_no number primary key,
goods_nm varchar2(150),
makr varchar2(60),
goods_category varchar2(30),
goods_img varchar2(500),
goods_info_img varchar2(500),
goods_info_text varchar2(1000)
)

create table tbl_gods_option(
goods_no number references tbl_goods (goods_no),
goods_amount number,
goods_untpc number,
size varchar2(30),
color varchar2(30)
)
