-- Create CRM database
CREATE DATABASE CRM;
GO

USE CRM;
GO

-- Table: Tour_B
CREATE TABLE Tour_B (
    TourCode CHAR(5) PRIMARY KEY,
    Name NVARCHAR(100),
    Price DECIMAL(18, 2) NULL,
    StartDate DATETIME NULL,
    created_at DATETIME,
    updated_at DATETIME
);
GO

-- Table: KhachHang_B
CREATE TABLE KhachHang_B (
    CustomerID CHAR(5) PRIMARY KEY,
    FullName NVARCHAR(100) NULL,
    Email NVARCHAR(100),
    Birthday DATE,
    created_at DATETIME,
    updated_at DATETIME
);
GO

-- Table: Booking_B
CREATE TABLE Booking_B (
    BookingID CHAR(5) PRIMARY KEY,
    CustomerID CHAR(5),
    TourCode CHAR(5),
    Quantity INT,
    BookedAt DATETIMEOFFSET,
    created_at DATETIME,
    updated_at DATETIME
    FOREIGN KEY (CustomerID) REFERENCES KhachHang_B(CustomerID),
    FOREIGN KEY (TourCode) REFERENCES Tour_B(TourCode)
);
GO

drop table Booking_B
drop table Tour_B
drop table KhachHang_B

-- Insert sample data based on the provided tables

INSERT INTO Tour_B (TourCode, Name, Price, StartDate, created_at, updated_at) VALUES
('TB01', N'Tour Hạ Long', 3000000, '2025-11-07T08:00:00', GETDATE(), GETDATE()),
('TB02', N'Tour Nha Trang', NULL, NULL, GETDATE(), GETDATE());

INSERT INTO KhachHang_B (CustomerID, FullName, Email, Birthday, created_at, updated_at) VALUES
('B001', N'Trần Văn C', 'c@gmail.com', '1990-01-01', GETDATE(), GETDATE()),
('B002', NULL, 'b002@gmail.com', '1995-05-10', GETDATE(), GETDATE());

INSERT INTO Booking_B (BookingID, CustomerID, TourCode, Quantity, BookedAt, created_at, updated_at) VALUES
('BK01', 'B002', 'TB02', 1, '2025-10-25T09:00:00Z', GETDATE(), GETDATE());
GO
