-- Create database
CREATE DATABASE ERP;
GO

USE ERP;
GO

-- Table: Tour_A
CREATE TABLE Tour_A (
    MaTour CHAR(5) PRIMARY KEY,
    TenTour NVARCHAR(100),
    Gia NVARCHAR(10),    
    NgayDi DATE,
    created_at DATETIME,
    updated_at DATETIME
);
GO

-- Table: KhachHang_A
CREATE TABLE KhachHang_A (
    MaKH CHAR(5) PRIMARY KEY,
    TenKH NVARCHAR(100),
    Email NVARCHAR(100),
    created_at DATETIME,
    updated_at DATETIME
);
GO

-- Table: DangKyTour_A
CREATE TABLE DangKyTour_A (
    MaDK CHAR(5) PRIMARY KEY,
    MaKH CHAR(5),
    MaTour CHAR(5),
    SoLuong INT,
    NgayDangKy DATE,
    FOREIGN KEY (MaKH) REFERENCES KhachHang_A(MaKH),
    FOREIGN KEY (MaTour) REFERENCES Tour_A(MaTour),
    created_at DATETIME,
    updated_at DATETIME
);
GO

drop table Tour_A
drop table KhachHang_A
drop table DangKyTour_A

-- Insert sample data based on the images

INSERT INTO Tour_A (MaTour, TenTour, Gia, NgayDi, created_at, updated_at) VALUES
('TA01', N'Đà Nẵng 3 ngày', N'2tr', '2025-11-01', GETDATE(), GETDATE()),
('TA02', N'Sapa', N'4.5tr', '2025-11-05', GETDATE(), GETDATE());

INSERT INTO KhachHang_A (MaKH, TenKH, Email, created_at, updated_at) VALUES
('A001', N'Lê Văn A', 'leva@gmail.com', GETDATE(), GETDATE()),
('A002', N'Nguyễn Thị B', NULL, GETDATE(), GETDATE());

INSERT INTO DangKyTour_A (MaDK, MaKH, MaTour, SoLuong, NgayDangKy, created_at, updated_at) VALUES
('DKA1', 'A001', 'TA01', 2, '2025-10-20', GETDATE(), GETDATE());
GO
