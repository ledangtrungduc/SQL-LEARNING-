---Tạo cơ sở dữ liệu
create database NVDB
on 
( NAME = 'nvd_dbfuck',
  filename = 'D:\SQL\nvd_dbfuck.mdf',
  size =10MB,
  maxsize = 100MB,
  filegrowth = 5MB)
log on
(NAME = 'nvd_db',
  filename = 'D:\SQL\nvd_dbfuck.ldf',
  size =10MB,
  maxsize = 100MB,
  filegrowth = 5MB)
-- tạo bảng:
USE NVDB; -- Thay chữ này bằng đúng tên Database bài tập của bạn
GO

create table NhanVien (
    MaNV INT not Null Primary Key,
    HoTen Varchar(50) not null,
    Phai Varchar(50),
    ngaysinh date,
    diachi varchar(255),
    Sdt varchar(10)
);
create table khachhang (
    MaKH INT IDENTITY (100,5) not null primary key,
    tenKH Varchar (50) Not null,
    diachi Varchar (255),
    sdt varchar (10) check (sdt like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') -- mấy cái này hoạt động giống như là kiểu điều kiện/nếu nhập sai thì sẽ ko ổn
);

-- thêm cột email cho table nhân viên
alter table NhanVien
add email varchar(100);

alter table NhanVien
alter column HoTen varchar(100);

-- thêm constraint vào mục ngày sinh:
alter table NhanVien
add Constraint NgaySinhCheck CHECK (NgaySinh <= GETDATE())
-- truncate table - xóa dữ liệu trong bảng
-- drop table - drop luôn/xóa luôn cái bảng đó


-- Bài 38: Câu lệnh insert into thêm vào dữ liệu bảng:
-- thêm 1 khách hàng mới:
insert into [NORTHWND].[dbo].[Customers]([CustomerID], [CompanyName],[ContactName],[Phone])
values ('KH123', 'TIVI.VN', 'le trung duc', '123456789'); -- nếu xác định được đúng tên cột, thì nó sẽ điền đúng tên cột cho chúng ta, còn ko thì nó sẽ
-- ko điền và để giá trị null
-- ta có thể insert rất nhiều giá trị cùng một lúc:
insert into [NORTHWND].[dbo].[Customers]([CustomerID], [CompanyName], [ContactName], [Phone])
values
('KH124', 'TIVI.VN', 'le trung duc', '123456789'),
('KH125', 'TIVI.VN', 'le trung duc', '123456789'),
('KH126', 'TIVI.VN', 'le trung duc', '123456789'),
('KH127', 'TIVI.VN', 'le trung duc', '123456789'),
('KH128', 'TIVI.VN', 'le trung duc', '123456789');
-- các thông tin khóa chính như customerID thì không được trùng nhau í!
--Bài tập 2: 
--*Hãy viết câu lệnh INSERT INTO để thêm đơn hàng sau: 
--CustomerID: Chọn một mã khách hàng hiện có trong bảng Customers.
--EmployeeID: Chọn một mã nhân viên hiện có trong bảng Employees 
--OrderDate: Sử dụng ngày hiện tại
--ShipVia: Chọn một mã Shipper hiện có trong bảng Shippers 

INSERT INTO [NORTHWND].[dbo].[Orders]([CustomerID],[EmployeeID],[OrderDate], [ShipVia])
VALUES ('BSBEV', 7, GETDATE(), 3);
-- Bài 39: Câu lệnh select into copy dữ liệu vào bảng mới!
-- tạo ra bảng mới có giá sản phẩm lớn hơn 50;
select *
into HighValueProducts
from [NORTHWND].[dbo].[Products]
where [UnitPrice]>50;
-- so sánh một chút với CTE, việc CTE tạo bảng, cái bảng đó chỉ là một cái bảng tạm thời, còn nếu dùng câu lệnh này,
-- thì nó lại mang ý nghĩa khác, nó tạo hẳn ra một cái bảng mới trong database luôn:

-- tạo bản mới với các đơn hàng được giao đến USA
select *
into USA
from [NORTHWND].[dbo].[Orders]
where [ShipCountry] like 'USA';
--- BÀI 40: CÂU LỆNH DELETE - XÓA DỮ LIỆU TRONG BẢNG
select *
into [NORTHWND].[dbo].[customers_1]  -- Gắn chặt hộ khẩu Bắc Phong vào đây
from [NORTHWND].[dbo].[Customers];
-- xóa đi khách hàng 'ALFKI'
DELETE FROM [NORTHWND].[dbo].[customers_1]
WHERE [CustomerID] = 'ALFKI';
-- xóa đi toàn bộ khách hàng ở USA
-- xóa bắt đầu bằng chữ U
DELETE FROM [NORTHWND].[dbo].[customers_1]
WHERE [CustomerID] LIKE 'U%'; -- gõ lệnh delete thì phải có where
-- xóa sạch 1 bảng
DELETE FROM [NORTHWND].[dbo].[customers_1] 
-- delete cũng khác biệt so với truncate


-- Bài 41: Câu lệnh Update - cập nhật dữ liệu:
-- cập nhật thông tin của khách hàng trong bảng customers:
-- dưới đây là cách cập nhật địa chỉ của khách hàng có 
-- CustomerID là "ALFKI"
update [NORTHWND].[dbo].[customers_1]
set [Address] = 'NEW address'
where [CustomerID] = 'ANATR'
-- Tăng toàn bộ giá sản phẩm trong bảng product này lên 10%:
-- đầu tiên là tạo một cái bảng mới là customers_2 để tiện làm ví dụ 
select *
into [NORTHWND].[dbo].[product_1]
from [NORTHWND].[dbo].[Products]
-- tăng giá toàn bộ sản phẩm lên 10% 
update [NORTHWND].[dbo].[product_1]
set [UnitPrice] = [UnitPrice]*1.1;

-- cập nhật thông tin của sản phẩm có productID = 7
-- trong bảng product để thay đổi sản phẩm thành "Máy tính xách tay mới"
-- và cập nhật giá thành là 999.99 đô la
update [NORTHWND].[dbo].[product_1]
set ProductName = 'Máy tính xách tay mới', [UnitPrice] = '999.99'
where [ProductID] = 7;

