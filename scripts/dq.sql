CREATE DATABASE Tour_DQ
go

USE Tour_DQ
go

CREATE TABLE data_quality (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	row_id NVARCHAR(10),
	source_table VARCHAR(50),
	source_id NVARCHAR(7),
	destination VARCHAR(50),
	reason NVARCHAR(255),
	data_status VARCHAR(50),
	created_at DATETIME,
	updated_at DATETIME
)

drop table data_quality