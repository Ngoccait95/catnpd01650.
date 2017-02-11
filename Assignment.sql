-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-02-11 08:44:13.984

-- tables
-- Table: ChiTietHoaDon
CREATE TABLE ChiTietHoaDon (
    MaSP char(10)  NOT NULL,
    MaHD char(10)  NOT NULL,
    SoLuongMua char(10)  NOT NULL,
    DonGiaBan money  NOT NULL,
    HoaDon_MaHD char(10)  NOT NULL,
    SanPham_MaSP char(10)  NOT NULL,
    CONSTRAINT ChiTietHoaDon_pk PRIMARY KEY  (MaSP,MaHD)
);

-- Table: HoaDon
CREATE TABLE HoaDon (
    MaHD char(10)  NOT NULL,
    NgayLap datetime  NOT NULL,
    MaKH char(10)  NOT NULL,
    KhachHang_MaKH char(10)  NOT NULL,
    CONSTRAINT HoaDon_pk PRIMARY KEY  (MaHD)
);

-- Table: KhachHang
CREATE TABLE KhachHang (
    MaKH char(10)  NOT NULL,
    TenKH nvarchar(100)  NOT NULL,
    DiaChi nvarchar(100)  NOT NULL,
    SoDT char(11)  NOT NULL,
    CONSTRAINT KhachHang_pk PRIMARY KEY  (MaKH)
);

-- Table: LoaiSP
CREATE TABLE LoaiSP (
    MaLoai nvarchar(6)  NOT NULL,
    TenLoai nvarchar(60)  NOT NULL,
    CONSTRAINT LoaiSP_pk PRIMARY KEY  (MaLoai)
);

-- Table: SanPham
CREATE TABLE SanPham (
    MaSP char(10)  NOT NULL,
    TenSP nvarchar(200)  NOT NULL,
    SoLuong char(10)  NOT NULL,
    MoTa nvarchar(250)  NOT NULL,
    MaLoai char(10)  NOT NULL,
    HinhAnh nvarchar(250)  NOT NULL,
    LoaiSP_MaLoai nvarchar(6)  NOT NULL,
    CONSTRAINT SanPham_pk PRIMARY KEY  (MaSP)
);

-- foreign keys
-- Reference: ChiTietHoaDon_HoaDon (table: ChiTietHoaDon)
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT ChiTietHoaDon_HoaDon
    FOREIGN KEY (HoaDon_MaHD)
    REFERENCES HoaDon (MaHD);

-- Reference: ChiTietHoaDon_SanPham (table: ChiTietHoaDon)
ALTER TABLE ChiTietHoaDon ADD CONSTRAINT ChiTietHoaDon_SanPham
    FOREIGN KEY (SanPham_MaSP)
    REFERENCES SanPham (MaSP);

-- Reference: HoaDon_KhachHang (table: HoaDon)
ALTER TABLE HoaDon ADD CONSTRAINT HoaDon_KhachHang
    FOREIGN KEY (KhachHang_MaKH)
    REFERENCES KhachHang (MaKH);

-- Reference: SanPham_LoaiSP (table: SanPham)
ALTER TABLE SanPham ADD CONSTRAINT SanPham_LoaiSP
    FOREIGN KEY (LoaiSP_MaLoai)
    REFERENCES LoaiSP (MaLoai);

-- End of file.

