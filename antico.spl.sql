CREATE USER antico IDENTIFIED BY antico;
GRANT CONNECT, RESOURCE, DBA TO antico;

CREATE TABLE tbl_member(
mid VARCHAR2(30) PRIMARY KEY,
email VARCHAR2(100) NOT NULL,
mpw VARCHAR2(50) NOT NULL,
mname VARCHAR2(12),
telepohone VARCHAR2(11),
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

alter table tbl_member drop(mname, telepohone)
alter table tbl_member add(mname varchar2(12), telepohone varchar2(11))

commit

select * from tbl_member

select * from cols where table_name = 'tbl_member'

insert into tbl_member(mid, email, mpw) values('lee', 'lee@naver.com', '1')