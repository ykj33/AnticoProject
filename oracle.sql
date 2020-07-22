create table tbl_member(
mid varchar2(30) primary key,
email varchar2(100) not null,
mpw varchar2(50) not null,
name varchar2(12) not null,
telepohone varchar2(11) not null,
subscribe_date date default sysdate,
);


create table tbl_delivery_adbk(
mid varchar2(30) references tbl_member (mid),
delivery_adbk_no number(2) not null,
delivery_adbk_ncm varchar2(50) not null,
delivery_place_tlnum varcar2(11) not null,
delivery_place_adres varchar2(300) not null,
delivery_place_adres_detail varchar2(150) not null,
);