create database tour_metadata
go

use tour_metadata
go

create table data_flow(
	id int,
	table_name varchar(50),
	LSET datetime,
	CET datetime
)


truncate table data_flow
insert into data_flow values (1, 'Tour_A', '2000-01-01', null)
insert into data_flow values (2, 'KhachHang_A', '2000-01-01', null)
insert into data_flow values (3, 'DangkyTour_A', '2000-01-01', null)
insert into data_flow values (4, 'Tour_B', '2000-01-01', null)
insert into data_flow values (5, 'KhachHang_B', '2000-01-01', null)
insert into data_flow values (6, 'Booking_B', '2000-01-01', null)

insert into data_flow values (7, 'Tour_NDS', '2000-01-01', null)
insert into data_flow values (8, 'KhachHang_NDS', '2000-01-01', null)
insert into data_flow values (9, 'DangKyTour_NDS', '2000-01-01', null)

drop table data_flow

-- Switch to tour_nds database
USE tour_nds;
GO

TRUNCATE TABLE dbo.DangKyTour_NDS;
TRUNCATE TABLE dbo.KhachHang_NDS;
TRUNCATE TABLE dbo.Tour_NDS;

-- Switch to Tour_Stage database
USE Tour_Stage;
GO

TRUNCATE TABLE dbo.Booking_B_Stage;
TRUNCATE TABLE dbo.DangKyTour_A_Stage;
TRUNCATE TABLE dbo.KhachHang_A_Stage;
TRUNCATE TABLE dbo.KhachHang_B_Stage;
TRUNCATE TABLE dbo.Tour_A_Stage;
TRUNCATE TABLE dbo.Tour_B_Stage;
