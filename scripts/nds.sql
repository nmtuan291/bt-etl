CREATE DATABASE tour_nds;
GO

USE tour_nds;
GO

CREATE TABLE Tour_NDS (
    MaTour_SK INT IDENTITY(1,1) PRIMARY KEY,
    MaTour_NK NVARCHAR(10),
    TenTour NVARCHAR(100),
    Gia DECIMAL,    
    NgayDi DATETIME,
    source_id NVARCHAR(7),
    created_at DATETIME,
    updated_at DATETIME
);
GO

CREATE TABLE KhachHang_NDS (
    MAKH_SK INT IDENTITY(1,1) PRIMARY KEY,
    MaKH_NK NVARCHAR(10),
    HoTen NVARCHAR(100) NULL,
    Email NVARCHAR(100),
    NgaySinh DATE,
    source_id NVARCHAR(7),
    created_at DATETIME,
    updated_at DATETIME
);
GO

CREATE TABLE DangKyTour_NDS (
    MaDK_SK INT IDENTITY(1,1) PRIMARY KEY,
    MaKH_SK INT,
    MaTour_SK INT,
    MaDK_NK NVARCHAR(10),
    MaKH_NK NVARCHAR(10),
    MaTour_NK NVARCHAR(10),
    SoLuong INT,
    NgayDangKy DATE,
    source_id NVARCHAR(7),
    created_at DATETIME,
    updated_at DATETIME
    FOREIGN KEY (MaKH_SK) REFERENCES KhachHang_NDS(MaKH_SK),
    FOREIGN KEY (MaTour_SK) REFERENCES Tour_NDS(MaTour_SK)
);

drop table Tour_NDS
drop table KhachHang_NDS
drop table DangKyTour_NDS

truncate table Tour_NDS