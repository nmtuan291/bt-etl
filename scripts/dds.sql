CREATE DATABASE Tour_DDS
GO

USE Tour_DDS
GO

CREATE TABLE KhachHang_Dim (
    MAKH_SK INT PRIMARY KEY,
    HoTen NVARCHAR(100) NULL,
    Email NVARCHAR(100),
    NgaySinh DATE,
    created_at DATETIME,
    updated_at DATETIME
);
GO

drop table Tour_Dim
CREATE TABLE Tour_Dim (
    MaTour_SK INT PRIMARY KEY,
    TenTour NVARCHAR(100),
    Gia DECIMAL,    
    NgayDi DATETIME,
    is_active BIT,
    created_at DATETIME,
    updated_at DATETIME
);
GO

CREATE TABLE Date_Dim (
    date_key INT PRIMARY KEY,   
    date DATE NOT NULL,
    day INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    year INT,
    weekday INT,
    weekday_name VARCHAR(20),
    is_weekend BIT
);

-- Populate the table
DECLARE @startDate DATE = '2000-01-01';
DECLARE @endDate DATE = '2050-12-31';

WITH dates AS (
    SELECT @startDate AS dt
    UNION ALL
    SELECT DATEADD(DAY, 1, dt)
    FROM dates
    WHERE dt < @endDate
)
INSERT INTO Date_Dim(date_key, date, day, month, month_name, quarter, year, weekday, weekday_name, is_weekend)
SELECT 
    CONVERT(INT, FORMAT(dt,'yyyyMMdd')) AS date_key,
    dt AS date,
    DAY(dt) AS day,
    MONTH(dt) AS month,
    DATENAME(MONTH, dt) AS month_name,
    DATEPART(QUARTER, dt) AS quarter,
    YEAR(dt) AS year,
    DATEPART(WEEKDAY, dt) AS weekday,
    DATENAME(WEEKDAY, dt) AS weekday_name,
    CASE WHEN DATEPART(WEEKDAY, dt) IN (1,7) THEN 1 ELSE 0 END AS is_weekend
FROM dates
OPTION (MAXRECURSION 0);

drop table Tour_Fact
create table Tour_Fact (
    MaKH_SK int,
    MaTour_SK int,
    MaNgay_SK int,
    SoLuong int,
    created_at datetime,
    updated_at datetime

    primary key (MaKH_SK, MaTour_SK, MaNgay_SK)
    foreign key (MaKH_SK) references KhachHang_Dim(MAKH_SK),
    foreign key (MaTour_SK) references Tour_Dim(MaTour_SK),
    foreign key (MaNgay_SK) references Date_Dim(date_key)
)