create database web_demo;
use web_demo;
create table `tblnguoidung` (
nguoi_dung_id BIGINT not null auto_increment,
ten_dang_nhap varchar(50) not null,
mat_khau varchar(60) not null,
ho_ten varchar(50) not null,
primary key(nguoi_dung_id)
);

create table `tblvaitro` (
vai_tro_id BIGINT not null auto_increment,
ten_vai_tro varchar(50) not null,
primary key(vai_tro_id)
);

CREATE TABLE `tblnguoidungvaitro` (
  nguoi_dung_id bigint NOT NULL,
  vai_tro_id bigint NOT NULL,
  PRIMARY KEY (nguoi_dung_id,vai_tro_id),
   foreign key(vai_tro_id) references tblvaitro(vai_tro_id)
); 

create table `tbldoituongsanpham`(
doi_tuong_san_pham_id bigint not null auto_increment,
ten_doi_tuong_san_pham varchar(50) not null,
primary key(doi_tuong_san_pham_id)
);

create table `tbldanhmucsanpham`(
danh_muc_san_pham_id bigint not null auto_increment,
doi_tuong_san_pham_id bigint not null,
ten_danh_muc_san_pham varchar(50) not null,
anh_danh_muc varchar(500),
foreign key (doi_tuong_san_pham_id) references tbldoituongsanpham(doi_tuong_san_pham_id),
primary key(danh_muc_san_pham_id)
);

create table `tblsanpham`(
san_pham_id bigint not null auto_increment,
danh_muc_san_pham_id  bigint not null,
ten_san_pham varchar(100) not null,
mota varchar(1000) not null,
gia_ban double not null,
banchay  tinyint(1),
giamgia  tinyint(1),
 foreign key(danh_muc_san_pham_id) references tbldanhmucsanpham(danh_muc_san_pham_id),
 primary key(san_pham_id)
);

create table `tblanhsanpham`(
anh_san_pham_id bigint not null auto_increment,
san_pham_id bigint not null,
anh varchar(500),
foreign key (san_pham_id) references tblsanpham(san_pham_id),
primary key(anh_san_pham_id)
);

create table `tblkichco`(
kich_co_id bigint not null auto_increment,
ten_kich_co varchar(10) not null,
primary key(kich_co_id)
);

create table `tblchitietkichcosanpham`(
chi_tien_kich_co_san_pham_id bigint not null auto_increment,
kich_co_id bigint not null,
san_pham_id bigint not null,
so_luong_ton int,
foreign key (kich_co_id) references tblkichco(kich_co_id),
foreign key(san_pham_id) references tblsanpham(san_pham_id),
primary key(chi_tien_kich_co_san_pham_id)
);

create table `tblhinhthucthanhtoan`(
hinh_thuc_thanh_toan_id bigint not null auto_increment,
ten_hinh_thuc_thanh_toan varchar(50) not null,
anh_hinh_thuc_thanh_toan varchar(500),
primary key(hinh_thuc_thanh_toan_id)
);

create table `tbldonhang`(
don_hang_id bigint not null auto_increment,
nguoi_dung_id bigint,
hinh_thuc_thanh_toan_id bigint,
ten_khach_hang varchar(50)  not null,
so_dien_thoai varchar(10) not null,
ngay_dat_hang date not null,
so_tien double,
dia_chi varchar(100),
trang_thai_thanh_toan  tinyint(1),
 foreign key(nguoi_dung_id) references tblnguoidung(nguoi_dung_id),
 foreign key(hinh_thuc_thanh_toan_id) references tblhinhthucthanhtoan(hinh_thuc_thanh_toan_id),
 primary key(don_hang_id)
);

create table `tblchitietdonhang`(
chi_tiet_don_hang_id bigint not null auto_increment,
don_hang_id bigint not null,
chi_tien_kich_co_san_pham_id bigint not null unique,
so_luong_san_pham int not null,
gia_ban double,
tong_gia double,
foreign key(don_hang_id) references tbldonhang(don_hang_id),
foreign key(chi_tien_kich_co_san_pham_id) references tblchitietkichcosanpham(chi_tien_kich_co_san_pham_id),
primary key(chi_tiet_don_hang_id)
);