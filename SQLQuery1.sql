-- CODE MẪU - CÂU LỆNH TRUY VẤN SQL - SELECT

-- VIET LAI CAU LENH SQL LAY TEN CUA TAT CA CAC SAN PHAM 
SELECT [ProductID]
FROM [NORTHWND].[dbo].[Products];

-- VIET LAI CAU LENH SQL LAY TEN CUA TAT CA CAC SAN PHAM,
-- gia ban tren moi don vi, so luong san pham tren moi don vi
select [ProductName], [UnitPrice], [QuantityPerUnit]
from [NORTHWND].[dbo].[Products];
-- VIET CAU LENH LAY RA TEN CONG TY CUA KHACH HANG VA QUOC GIA CỦA KHÁCH HÀNG ĐÓ:
SELECT [CompanyName], [Country]
FROM [NORTHWND].[dbo].[Customers];
-- Một cách viết khác ko cần dùng "[]"
SELECT CompanyName, Country
FROM NORTHWND.dbo.Customers
-- Chọn tất cả các cột/ dữ liệu luôn dùng kí tự *:
-- VIẾT CÂU LỆNH SQL LẤY HẾT CÁC CÂU LỆNH:
SELECT * 
FROM [NORTHWND].[dbo].[Customers];
-- LẤY RA TẤT CẢ DỮ LIỆU TỪ BẢNG PRODUCT 
SELECT *
FROM [NORTHWND].[dbo].[Products];
-- GÕ CÂU LỆNH DISTINCT SELECT - ĐỂ CHỌN DỮ LIỆU KHÔNG TRÙNG LẶP - 1 QUỐC GIA CHỈ HIỂN THỊ MỘT LẦN DUY NHẤT:
SELECT DISTINCT [Country]
FROM [NORTHWND].[dbo].[Customers];
-- VIẾT CÁC CÂU LỆNH SQL LẤY RA CÁC TÊN MÃ SỐ BƯU ĐIỆN POSTAL CODE KHÁC NHAU TỪ CÁC NHÀ CUNG CẤP - SUPPLIERS:
SELECT DISTINCT [PostalCode]
FROM [NORTHWND].[dbo].[Suppliers];
-- VIẾT CÂU LỆNH SQL ĐỂ LẤY LASTNAME CỦA NHÂN VIÊN VÀ TITILE OF COURTESY CỦA NHÂN VIÊN TỪ BẢNG EMPLOYEES
SELECT DISTINCT [LastName], [TitleOfCourtesy]
FROM [NORTHWND].[dbo].[Employees];
-- CÂU LỆNH SELECT TOP - GIỚI HẠN SỐ LƯỢNG DÒNG HOẶC % KHI ĐƯỢC TRẢ VỀ:
-- viết câu lệnh SQL lấy 5 dòng đầu tiên:
SELECT TOP 5 * 
FROM [NORTHWND].[dbo].[Customers];
-- viết câu lệnh SQL lấy ra 30% nhân viên của công ty hiện tại:
SELECT TOP 30 percent *
FROM [NORTHWND].[dbo].[Employees]
-- viết câu lệnh SQL lấy ra các mã khách hàng trong mã đơn hàng với quy định là mã khách hàng ko dc trùng lặp, chỉ lấy 5 dòng dữ liệu 
-- đầu tiên
SELECT DISTINCT TOP 5 [CustomerID]
FROM [NORTHWND].[dbo].[Orders]
-- Viết câu lệnh SQL lấy ra các sản phẩm có mã thể loại ko bị trùng lặp, và chỉ lấy ra 3 dòng đầu tiên!
 Select Distinct Top 3 [CategoryID] From [NORTHWND].[dbo].[Products];
 -- DÙNG ALIAS - AS để gán định danh
 -- VIẾt SQL lấy ra "CompanyName" và đặt tên thay thế là Công Ty; Postal code đặt tên thay thế là Mã Bưu Điện
select distinct [CompanyName] as [Tên công ty],
                 [PostalCode]  as [mã bưu điện],
                 [City] as "thành phố" -- ko có as nó vẫn chạy, và mình có thể thay thế " và [
from [NORTHWND].[dbo].[Customers];
-- Viết SQL lấy ra cột last name và first name ở cột employee để thay bằng tiếng việt:
select [LastName] as [Họ],
       [FirstName] as [Tên]
from [NORTHWND].[dbo].[Employees];
-- VD3: Viết câu lệnh SQL lấy ra 15 dòng đầu tiên tất cả các cột trong bảng orders, đặt tên thay thế cho bảng order là "o"
select top 15  *
from [NORTHWND].[dbo].[Orders] as [o];   
-- sau khi mình thay đổi tên table bằng o sau đó mình có thể viết code như sau:
select top 15  [o].*
from [NORTHWND].[dbo].[Orders] as [o];  
-- Bài tập: viết các câu lênh SQL lấy ra các cột, và đặt các tên thay thế cho dòng product:
-- ProductName >> tên sp, supplierID >> mã cung cấp; CategorID>> mã thể loại - chỉ lấy ra 5 dòng đầu tiên trong bảng:
-- và đặt tên cho bảng product là p
select top 5 [ProductName] as [tên sản phẩm],
             [SupplierID]  as [mã cung cấp],
             [CategoryID]  as [mã thể loại]
from [NORTHWND].[dbo].[Products] as p;

------HỌC VỀ MIN, MAX TRONG SQL:
-- Viết câu lệnh SQL tìm giá trị thấp nhất của các sản phẩm trong bảng product 
select min ([UnitPrice]) as [Minprice]
from [NORTHWND].[dbo].[Products]

--- Viết một câu lệnh lấy ngày đặt hàng gần đây nhất
-- note: ngày gần đây tức là ngày nó càng lớn và càng tốt:
select max ([OrderDate]) as [maxorderday]
from [NORTHWND].[dbo].[Orders];
-- Tìm số lượng hàng trong kho lớn nhất (Unitinstock):
select max ([UnitsInStock]) as [hàng tồn kho]
from [NORTHWND].[dbo].[Products];
-- Bài tập: Tính tuổi đời của nhân viên lớn nhất trong công ty:
-- note: Ai có ngày sinh càng nhỏ thì người đó càng lớn tuổi!
select min ([BirthDate]) as [Ngày Sinh]
from [NORTHWND].[dbo].[Employees];


---- KHÓA HỌC CÁC HÀM COUNT, SUM, AVG TRONG SQL
-- hãy đếm số lượng khách hàng trong bảng customers:
select count (*) as [numberOfcustomers]
from [NORTHWND].[dbo].[Customers];

select count ([CustomerID]) as [numberOfcustomers]
from [NORTHWND].[dbo].[Customers];
-- tính tổng số tiền vận chuyển (freight) của tất cả các đơn đặt hàng:
select sum([Freight]) as [tổng số tiền vận chuyển]
from[NORTHWND].[dbo].[Orders];

--- tính avg số lượng đặt hàng quantity của tất cả các sản phẩm trong bảng [order details]
select avg([Quantity]) as [Trung bình số lượng đặt hàng]
from [NORTHWND].[dbo].[Order Details];
--- đếm số lượng, tính tổng số lượng hàng tồn kho và trung bình giá sản phẩm có trong bảng Product
select count (*) as [numbersofproduct], sum([UnitsInStock]) as [total unit in stock], avg([UnitPrice]) as [trung bình giá bán]
from [NORTHWND].[dbo].[Products];
-- bài tập: Hãy đếm số lượng đơn hàng từ bảng (orders) với 2 cách:
-- Cách 1: Dùng dấu * 
-- cách 2: dùng mã đơn hàng
-- cách 1 :
select count (*) as [ma don hang]
from [NORTHWND].[dbo].[Orders]
-- cách 2:
select count ([OrderID]) as [ma don hang]
from [NORTHWND].[dbo].[Orders]
-- bài tập 2: từ bảng [order details] hãy tính trung bình cho các cột unit price, và tính tổng cho cột quantity
select avg ([UnitPrice]) as [Trung bình giá sp], sum([Quantity]) as [tổng số lượng]
from [NORTHWND].[dbo].[Order Details];

---- BÀI 10: HỌC ORDER BY: SẮP XẾP CÁC KẾT QUẢ TRUY VẤN DÙNG SQL
-- đây là hàm sắp kết quả trả về theo một thứ tự nhất định:
-- ASC: theo thứ tự tăng dần
-- DESC: theo thứ tự giảm dần
-- VD1: Liệt kê tất cả các nhà cung cấp (company name) từ A tới Z:
select * 
from [NORTHWND].[dbo].[Suppliers]
order by  [CompanyName] ASC -- sắp xếp theo company name, nếu  ko viết ASC cũng được vì SQL nó cũng tự hiểu là tăng dần
-- VD2 : Bạn hãy liệt kê các sản phẩm theo thứ tự giá giảm dần:
select *
from [NORTHWND].[dbo].[Products]
order by [UnitPrice] DESC
-- VD 3: Hãy liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm A-Z - không dùng ASC and DESC
select *
from [NORTHWND].[dbo].[Employees]
order by [FirstName] asc, [LastName] asc
-- VD4: Hãy lấy ra một số lượng sản phẩm có số lượng bán cao nhất từ bảng order details:
-- ko dc dùng MAX.
select top 1 *
from [NORTHWND].[dbo].[Order Details]
order by [Quantity] DESC;
-- Bài tập: Hãy liệt kê các đơn đặt hàng (orderID) trong bảng orders theo thứ tự giảm dần của ngày đặt hàng:
select *
from [NORTHWND].[dbo].[Orders]
order by [OrderDate] desc
-- Bài tập 2: Hãy liệt kê, đơn giá, số lượng hàng tồn kho (UnitsInStock) của tất cả các sản phẩm trong bảng Products
-- theo thứ tự giảm dần ủa UnitsInStock.
select [ProductName] as [tên sản phẩm], [UnitPrice] as [đơn giá], [UnitsInStock] as [số lượng hàng tồn kho]
from [NORTHWND].[dbo].[Products]
order by [UnitsInStock] desc;

---- BÀI TẬP 11: CÁC PHÉP TOÁN CỘNG, TRỪ NHÂN CHIA, CHIA LẤY SỐ DƯ TRONG SQL
-- VD1: tính số lượng sản phầm còn lại trong kho (Unitinstock) sau khi bán hết các sản phẩm đã được đặt hàng (UnitsOnOrder)
-- stockremainding = UnitsinStock-UnitsonOrder
select [ProductID], [ProductName], ([UnitsInStock]-[UnitsOnOrder]) as [StockRemaining]
from [NORTHWND].[dbo].[Products]; -- hàng có số âm thì chứng tỏ là cần phải đặt thêm hàng:
-- VD2: Tính giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng OrderDetails:
-- OrderdetailValue = UnitPrice x Quantity
select *,
        ([UnitPrice]*[Quantity]) as [OrderdetailValue]
from [NORTHWND].[dbo].[Order Details]
-- VD3: Tính tỷ lệ giá vận chuyển đơn hàng (Freight) trung bình của các đơn hàng trong bảng orders so với 
-- giá trị vận chuyển của đơn hàng lớn nhất (MaxFreight)
-- Freight Ratio = AVG/ MAX(Freight)
select AVG([Freight])/Max([Freight]) as [FreightRatio]
from [NORTHWND].[dbo].[Orders];
-- BÀI TẬP 1: Hãy liệt kê dannh sách các sản phẩm và giá (Unit Price) của từng sản phẩm và sẽ dc giảm đi 10%
-- cách 1: Dùng phép nhân hoặc phép chia
-- cách 2: chỉ dc dùng phép nhân
-- cách 1
select *,
       ([UnitPrice] - [UnitPrice]*0.1) as [Giá sản phầm sau khi giảm]
from [NORTHWND].[dbo].[Products];
-- cách 2
select *,
       ([UnitPrice]*0.9) as [Giá sản phầm sau khi giảm]
from [NORTHWND].[dbo].[Products];
-- BÀI TẬP 12: LỌC DỮ LIỆU BẰNG MỆNH ĐỀ WHERE - TRUY VẤN SQL - ĐÂY CHÍNH LÀ MỘT BIỂU THỨC ĐIỀU KIỆN:
-- VD1: Hãy liệt kệ tất cả các nhân viên đến từ thành phố London
select *
from [NORTHWND].[dbo].[Employees]
where [City] = 'london';
-- VD1: Hãy liệt kệ tất cả các nhân viên đến từ thành phố London và sau đó sắp xếp kết quả theo lastname:
select *
from [NORTHWND].[dbo].[Employees]
where [City] = 'london'
order by [LastName] asc;
-- Vd2: Hãy liệt kê tất cả các đơn hàng bị giao muộn , biết ngày cần phải giao hàng là requireddate, ngày giao hàng thực tế là shippedDate.
select [OrderID],[RequiredDate],[ShippedDate]
from [NORTHWND].[dbo].[Orders]
where [ShippedDate]>[RequiredDate]
-- đếm số lượng ngày trễ cụ thể:
select COUNT(*) as [số đơn giao trễ]
from [NORTHWND].[dbo].[Orders]
where [ShippedDate]>[RequiredDate]
-- Ví dụ 3: Lấy ra các đơn hàng chi tiết được giảm giá nhiều hơn 10%
-- (discount>0.1)
select *
from [NORTHWND].[dbo].[Order Details]
where [Discount] > 0.1

--bài tập 1: hãy liệt kê các đơn hàng được gửi đến quốc gia:France
select [OrderID]
from [NORTHWND].[dbo].[Orders]
where [ShipCountry] = 'France';
--bài tập 2: Hãy liệt kê các sản phẩm có số lượng hàng trong kho Unitinstock lớn hơn 20:
select [ProductID],[ProductName]
from [NORTHWND].[dbo].[Products]
where [UnitsInStock]>20 
order by [ProductName] asc



-- BÀI 13: KẾT HỢP ĐIỀU KIỆN BẰNG TOÁN TỬ AND, OR, NOT TRONG SQL:
-- Bạn hãy liệt kê các sản phẩm có số lượng trong kho (Unitinstock)
-- nhỏ hơn và lớn hơn 100
select *
from [NORTHWND].[dbo].[Products]
where [UnitsInStock]<50 or [UnitsInStock]>100; -- kết hợp 2 biểu thức điều kiện bằng cách dùng "or"
-- Bạn hãy liệt kê tất cả các đơn hàng dc giao đến Brazil đã giao muộn:
select *
from [NORTHWND].[dbo].[Orders]
where [ShipCountry] = 'brazil' and [ShippedDate]>[RequiredDate]
-- Lấy ra tất cả các sản phẩm có giá dưới 100$ và mã thể loại khác 1.
-- note: Dùng NOT
select *
from [NORTHWND].[dbo].[Products]
where [UnitPrice]>=100 or [CategoryID]=1

select *
from [NORTHWND].[dbo].[Products]
where Not([UnitPrice]>=100 or [CategoryID]=1);

-- Bài tập 1: Hãy liệt kê tất cả các đơn hàng có giá vận chuyển Freight trong khoảng [50,100] đô
select *
from [NORTHWND].[dbo].[Orders]
where [Freight]>=50 and [Freight]<=100;
-- Bài tập 2: Hãy liệt kê các sản phẩm có số lượng hàng tồn kho (Unitsinstock) lớn hơn 20
-- và số lượng hàng trong đơn hàng (UnitsOnOrder) nhỏ hơn 20
select *
from [NORTHWND].[dbo].[Products]
where [UnitsInStock]>20 and [UnitsOnOrder]<20

 -- BÀI 14:TOÁN TỬ BETWEEN
 -- Lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 tới 20 đô la 
 select *
 from [NORTHWND].[dbo].[Products]
 where [UnitPrice] between 10 and 20 
 -- Lấy danh sách các sản phẩm được đặt hàng từ ngày 1996-07-01 tới 1996 -07-31
 select *
 from [NORTHWND].[dbo].[Orders]
 where [OrderDate]  between '1996-07-01' and '1996-07-31'
 -- Tính tổng số tiền vận chuyển (Freight) của các đơn đặt hàng được đặt trong khoảng tg 1996-07-01 tới 1996-07-31
 select SUM([Freight]) as [totalJulyFreight]
 from [NORTHWND].[dbo].[Orders]
 where [OrderDate]  between '1996-07-01' and '1996-07-31'
 -- bài tập 1:--BT1: Lấy danh sách các đơn đặt hàng có ngày đặt hàng trong khoảng từ ngay 1/1/1997 đến ngày 31/12/1997
--và được vận chuyển bằng đường tày thủy  (Shipvia =3)
 select *
 from [NORTHWND].[dbo].[Orders]
 where [OrderDate]  between '1997-01-01' and '1997-12-31' and [ShipVia] = '3'
 -- BÀI 15: TOÁN TỬ LIKE, LỌC DỮ LIỆU TRONG CHUỖI!
 -- Lọc ra tất cả các khách hàng và khách hàng này đều đến từ quốc gia (Country) có bắt đầu bằng "A"
 select *
 from [NORTHWND].[dbo].[Customers]
 where [Country] LIKE 'A%' -- dùng % thì để tìm ra bao nhiêu kí tự sau chữ A cũng được
 -- Lọc ra tất cả các đơn hàng đều đến từ thành phố (City) có chữ A
 select *
 from [NORTHWND].[dbo].[Orders]
 where [ShipCity] LIKE '%a%' -- dùng % thì để tìm ra bao nhiêu kí tự sau/trước chữ A cũng được
 -- Hãy lọc ra tất cả các đơn hàng với điều kiện: 
 -- ShipCountry LIKE'U_' -- lấy 1 kí tự sau U
 -- ShipCountry LIKE'U%' -- lấy bao nhiêu kí tự sau U cũng dc
 select *
 from [NORTHWND].[dbo].[Orders] 
 where [ShipCountry] like 'U_' 

 select *
 from [NORTHWND].[dbo].[Orders]
 where [ShipCountry] like 'U%' 
-- Bài tập 1: hãy lấy ra tất cả các nhà cung cấp có chữ "b" trong tên công ty của họ 
 select *
 from [NORTHWND].[dbo].[Suppliers]
 where [CompanyName] like '%b%'

 -- BÀI 16: KÍ TỰ ĐẠI DIỆN WILDCARD:
 -- % represent zero or more characters
 -- _ represent single character
 -- [] represent any characters inside the brackets?
 -- ^ represent any characters not in the brackets
 --  - represents any single character within the specified range
 -- hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ cái 'A'
 select *
 from [NORTHWND].[dbo].[Customers]
 where [ContactName] LIKE 'A%';
 -- hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu hằng chữ H, và có chữ
 -- thứ 2 là bất kì kí tự nào? 
 select *
 from [NORTHWND].[dbo].[Customers]
 where [ContactName] LIKE 'H_%';
 -- hãy lọc ra tất cả các đơn hàng dc gởi đến thành phố 
 -- có chữ cái bắt đầu bằng L, chữ cái thứ 2 là u hoặc o
 select [OrderID], [ShipCity]
 from [NORTHWND].[dbo].[Orders]
 where [ShipCity] like 'L[u,o]%';
 -- hãy lọc ra tất cả các đơn hàng dc gởi đến thành phố 
 -- có chữ cái bắt đầu bằng L, chữ cái thứ 2 ko là u hoặc o
 select [OrderID], [ShipCity]
 from [NORTHWND].[dbo].[Orders]
 where [ShipCity] like 'L[^u,o]%';
 -- hãy lọc ra tất cả các đơn hàng dc gởi đến thành phố 
 -- có chữ cái bắt đầu bằng L, chữ cái thứ 2 là các kí tự từ a đến e
 select [OrderID], [ShipCity]
 from [NORTHWND].[dbo].[Orders]
 where [ShipCity] like 'L[a-e]%';
 -- Bài tập 1: Hãy lấy ra các nhà cung cấp hàng có tên công ty bắt đầu
 -- bằng chữ A và ko chứa kí tự b.
 select *
 from [NORTHWND].[dbo].[Suppliers]
 where [CompanyName] like 'A%[^b]%';
 

 -- BÀI GIẢNG 17: IN AND NOT IN - TÌM KIẾM GIÁ TRỊ TRONG DANH SÁCH:
 -- vd1: hãy lọc ra tất cả các đơn hàng với điều kiện:
 -- a. ĐƠn hàng được giao đến Germany, UK, Brazil
 select *
 from [NORTHWND].[dbo].[Orders]
 where [ShipCountry] = 'Germany' or [ShipCountry] = 'UK'or [ShipCountry] = 'Brazil'

 select *
 from [NORTHWND].[dbo].[Orders]
 where [ShipCountry] IN ('Germany', 'UK', 'Brazil');  -- miễn là trong ship country có những quốc gia này là được



 -- b. Đơn hàng được giao đến các quốc gia khác Germany, UK, Brazil
 select *
 from [NORTHWND].[dbo].[Orders]
 where [ShipCountry] Not IN ('Germany', 'UK', 'Brazil');  -- miễn là trong ship country có những quốc gia này là được
 -- Lấy ra sản phẩm có mã thể loại khác với 2, 3 và 4
 select *
 from [NORTHWND].[dbo].[Products]
 where [CategoryID] not in ('2', '3', '4');
 -- ví dụ 3: từ bảng employee
 -- a. Hãy liệt kê các nhân viên không phải là nữ từ bảng nhân viên
 select *
 from [NORTHWND].[dbo].[Employees]
 where [TitleOfCourtesy] in ('Mr.')

 -- b. Liệt kê các nhân viên là nữ từ bảng nhân viên
 select *
 from [NORTHWND].[dbo].[Employees]
 where [TitleOfCourtesy] in ('Mrs.', 'Ms.')
 -- Bài tập: hãy lấy ra tất cả các khách hàng đến từ một trong các thành phố sau đây:
 -- berlin, london, warszawa
 select *
 from [NORTHWND].[dbo].[Customers]
 where [City] in ('berlin', 'london', 'warszawa')

 -- BÀI HỌC 18: KIỂM TRA DỮ LIỆU NULL TRONG SQL
 -- lấy ra các đơn hàng chưa được giao (shippeddate =  null)
SELECT *
FROM [NORTHWND].[dbo].[Orders]
WHERE [ShippedDate] IS null;
-- đếm xem bao nhiêu đơn
SELECT COUNT(*)
FROM [NORTHWND].[dbo].[Orders]
WHERE [ShippedDate] IS null;
 -- lấy danh sách khách hàng có khu vực region ko bị null
SELECT *
FROM [NORTHWND].[dbo].[Customers]
WHERE [Region] IS null;

SELECT COUNT(*)
FROM [NORTHWND].[dbo].[Customers]
WHERE [Region] IS null;
-- lấy danh sách các khách hàng ko có tên công ty (companyname)
select *
from [NORTHWND].[dbo].[Customers]
where [CompanyName] is Null
-- bài tập: hãy lấy ra tất cả các đơn hàng chưa dc giao và có khu vực giao hàng
-- shippedregion ko bị null
select *
from [NORTHWND].[dbo].[Orders]
where [ShippedDate] is null and [ShipRegion] is not null

--BÀI 19: GROUP BY - NHÓM DỮ LIỆU TRONG SQL
-- VD1: Hãy cho biết mỗi khách hàng đặt bao nhiêu đơn hàng:
select [CustomerID], count([OrderID])
from [NORTHWND].[dbo].[Orders]
group by [CustomerID];
-- VD2: Tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm:
select [SupplierID], avg([UnitPrice])
from [NORTHWND].[dbo].[Products]
group by [SupplierID];
-- VD3: Cho biết xem là mỗi thể loại có tổng số sản phẩm trong kho là bao nhiêu [UnitOnstock]
select [CategoryID], sum([UnitsInStock]) as [total unit on stock]
from [NORTHWND].[dbo].[Products]
group by [CategoryID];
-- VD4: hãy cho biết giá vận chuyển thấp nhất và lớn nhất của các đơn hàng theo từng thành phố
-- và quốc gia khác nhau
select [ShipCountry], [ShipCity], 
       MIN([Freight]) as [Min Freight],
       Max([Freight]) as [Max Freight]
from [NORTHWND].[dbo].[Orders]
group by [ShipCountry], [ShipCity]
order by [ShipCountry] asc , [ShipCity] asc
-- Bài tập 1: Hãy thống kê số lượng nhân viên theo từng quốc gia khác nhau:
select [Country], count([EmployeeID])
from [NORTHWND].[dbo].[Employees]
group by [Country];
-- neu dung ham sum trong bai tap 1 thi se tro nen vo nghia, khi ta co gang cong ID lai voi nhau

--BAI 20: HÀM DỮ LIỆU LẤY NGÀY, THÁNG, NĂM
-- tính số lượng đơn đặt hàng trong năm 1997 của từng khách hàng
select [CustomerID], 
       COUNT([OrderID]) as [total order],
       YEAR([OrderDate]) as [year]
from [NORTHWND].[dbo].[Orders]
where year([OrderDate])=1997
group by [CustomerID], year([OrderDate])
--  Hãy lọc ra các đơn hàng được đặt hàng vào tháng 5 năm 1997
select *
from [NORTHWND].[dbo].[Orders]
where month([OrderDate]) = 5 and year([OrderDate])=1997
-- Lấy danh sách các đơn hàng được đặt vào ngày 04/09/1996
select *
from [NORTHWND].[dbo].[Orders]
where day([OrderDate])=04 and month([OrderDate]) = 09 and year([OrderDate])=1996
--or
select *
from [NORTHWND].[dbo].[Orders]
where [OrderDate]= '1996-09-04'
-- Lấy ra danh sách khách hàng đặt hàng trong năm 1998 và số đơn hàng mỗi tháng, sắp xếp tháng tăng dần
select [CustomerID], month([OrderDate]) as [MONTH], count (*) as [total order]
from [NORTHWND].[dbo].[Orders] 
where year([OrderDate])=1998
group by [CustomerID], month([OrderDate])
order by month([OrderDate]) asc
-- Bài tập: Lọc ra các đơn hàng đã dc giao vào tháng 5, và sắp xếp tăng dần theo năm
select *
from [NORTHWND].[dbo].[Orders] 
where month([ShippedDate])=5
order by year([ShippedDate]) asc
-- BÀI 21: HAVING - LỌC DỮ LIỆU SAU GROUP BY
-- vd 1: Hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng
-- sắp xếp theo thứ tự tổng số đơn hàng giảm dần
select [CustomerID], count([OrderID]) as [Total Orders]
from [NORTHWND].[dbo].[Orders] 
group by [CustomerID]
-- nếu đã dùng lệnh groupby để tính toán thì ko dùng where để lọc đơn >20 đơn hàng dc nên phải dùng having
having count([OrderID])>20
order by count([OrderID]) desc;
-- hãy lọc ra những nhà cung cấp sản phẩm có tổng lượng hàng trong kho (Unitinstock) > 30 và có trung bình đơn giá unit price có giá trị dưới 50
select [SupplierID], 
        sum([UnitsInStock]) as [total Units in stock],
        avg([UnitPrice]) as [total unit price]
from [NORTHWND].[dbo].[Products]
group by [SupplierID]
having sum([UnitsInStock])>30 and avg([UnitPrice])<50
-- hãy cho biết tổng tiền vận chuyển của từng tháng, trong nửa năm sau của năm 1996, sắp xếp theo tháng tăng dần
select month([ShippedDate]), sum([Freight]) as [total frieght]
from [NORTHWND].[dbo].[Orders] 
where [ShippedDate] between '1996-07-01' and '1996-12-31'
group by month([ShippedDate])
order by month([ShippedDate]) asc

-- hãy cho biết tổng tiền vận chuyển của từng tháng, trong nửa năm sau của năm 1996, sắp xếp theo tháng tăng dần 
-- tổng tiền vận chuyển >1000$
select month([ShippedDate]), sum([Freight]) as [total frieght]
from [NORTHWND].[dbo].[Orders] 
where [ShippedDate] between '1996-07-01' and '1996-12-31'
group by month([ShippedDate])
having sum([Freight]) >1000
order by month([ShippedDate]) asc
-- Bài tập 1: Hãy lọc ra các thành phố có số lượng đơn hàng >16
-- và sắp xếp theo tổng số lượng giảm dần

select [ShipCity], count([OrderID]) as [total order]
from [NORTHWND].[dbo].[Orders] 
group by [ShipCity]
having count([OrderID]) >16
order by count([OrderID]) desc
-- BÀI 22: LUYỆN TẬP CODE SQL:
-- BT1: Hãy cho biết những khách hàng nào đã đặt 20 đơn hàng, 
-- sắp xếp theo thứ tự tổng số đơn hàng giảm dần
select [CustomerID], count([OrderID]) as [total order]
from [NORTHWND].[dbo].[Orders] 
group by [CustomerID]
having count([OrderID]) >20
order by count([OrderID]) desc
-- Hãy lọc ra các nhân viên có tổng số đơn hàng lớn hơn 100, sắp xếp theo tổng số đơn hàng giảm dần
select [EmployeeID], count([OrderID]) as [total order]
from [NORTHWND].[dbo].[Orders] 
group by [EmployeeID]
having count([OrderID]) >100
order by count([OrderID]) desc
-- Hãy cho biết những thể loại nào có số sản phẩm khác nhau lớn hơn 11
select [CategoryID], count ([ProductID])  as [total kind]
from [NORTHWND].[dbo].[Products]
group by [CategoryID]
having count ([ProductID]) >11
-- Hãy cho biết những thể loại nào có số sản phẩm ton kho lớn hơn 350
select [CategoryID], sum ([UnitsInStock])  as [total unit instock]
from [NORTHWND].[dbo].[Products]
group by [CategoryID]
having sum ([UnitsInStock]) >350
-- cho biết quốc gia nào có nhiều hơn 7 đơn hàng
select [ShipCountry], count([OrderID]) as [total orders]
from [NORTHWND].[dbo].[Orders] 
group by [ShipCountry]
having count([OrderID]) > 7
-- hãy cho biết những ngày nào có nhiều hơn 5 đơn hàng được giao, sắp xếp tăng dần theo ngày giao hàng
select [ShippedDate], count (*) as [total orders]
from [NORTHWND].[dbo].[Orders] 
group by [ShippedDate]
having count (*) > 5 
order by count (*) asc
-- Hãy cho biết các quốc gia nào bắt đầu bằng chữ A hay G 
-- và có số lượng đơn hàng lớn hơn 29.
select [ShipCountry], count (*) as [total orders]
from [NORTHWND].[dbo].[Orders] 
where [ShipCountry] like 'A%' or [ShipCountry] like 'G%' -- dùng cho các cột ko tính toán - original
group by [ShipCountry]
having count (*) > 29 -- dùng cho các cột đã tính toán như count, sum,avg
-- Bài tập: hãy cho biết những thành phố nào có số lượng đơn hàng là được giao là khác 1 và 2
-- ngày đặt hàng từ ngày '1997-04-01' đến ngày '1997-08-31'
select [ShipCity], count ([ShippedDate]) as [total orders]
from [NORTHWND].[dbo].[Orders] 
where [OrderDate] between '1997-04-01' and '1997-08-31'
group by [ShipCity]
HAVING COUNT([ShippedDate]) <>1 AND COUNT([ShippedDate]) <>2; -- giấu <> là giấu khác?!


-- BÀI 23: TRUY VẤN DỮ LIỆU TỪ NHIỀU TABLE:
--vd1: từ bảng products và categories, hãy in ra các thông tin sau đây:
-- mã thể loại, tên thể loại, mã sp, tên sp
select p.ProductID, p.ProductName, c.CategoryID, c.CategoryName
from [NORTHWND].[dbo].[Products] as p, [NORTHWND].[dbo].[Categories] as c
where c.CategoryID = p.CategoryID;
-- vd2: Từ bảng employees và orders, hãy in ra các thông tin sau:
-- Mã nhân viên/tên nhân viên/ số lượng đơn hàng mà nhân viên đã bán được!
select o.[EmployeeID], e.[LastName], e.[FirstName], count(o.[OrderID]) as [total order]
from [NORTHWND].[dbo].[Orders] as o, [NORTHWND].[dbo].[Employees] as e
where o.[EmployeeID] = e.[EmployeeID]
group by o.[EmployeeID], e.[LastName], e.[FirstName];
-- vd3: Từ bảng Customers và Orders, hãy in ra các thông tin sau đây:
-- mã số khách hàng
-- tên công ty
-- tên liên hệ
-- số lượng đơn hàng đã mua
-- với đk: quốc gia của khách hàng là UK
select c.CustomerID, c.CompanyName, c.ContactName, c.Country, count (o.[OrderID]) as [total order], c.Country
from [NORTHWND].[dbo].[Customers] as c, [NORTHWND].[dbo].[Orders] as o
where  c.CustomerID = o.CustomerID and c.[Country] = 'UK'
group by c.CustomerID, c.CompanyName, c.ContactName, c.Country;
-- vd 4: từ mảng orders và shippers, hãy in ra các thông tin sau đây:
-- mã nhà vận chuyển, tên công ty vận chuyển, tổng số tiền được vận chuyển (SUM FREIGHT) và 
-- in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giàm dần?!
select s.[ShipperID], s.[CompanyName], sum(o.[Freight]) as [SUM FREIGHT]
from [NORTHWND].[dbo].[Shippers] as s, [NORTHWND].[dbo].[Orders] as o
where s.ShipperID = o.ShipVia
group by s.[ShipperID], s.[CompanyName]
order by sum(o.[Freight]) desc
-- vd5: Từ bảng products và suppliers, hãy in ra các thông tin sau đây:
-- mã nhà cung cấp
-- tên công ty
-- tổng số các sản phẩm khác nhau đã cung cấp
-- vả chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhiều nhất.
select top 1 s.[SupplierID], s.[CompanyName], count(p.[ProductID]) as [Total Product]
from [NORTHWND].[dbo].[Suppliers] as s, [NORTHWND].[dbo].[Products] as p
where s.supplierID = p.supplierID
group by s.[SupplierID], s.[CompanyName]
order by count(p.[ProductID]) desc
-- vd6: từ bảng order và order details hãy in ra các thông tin sau đây:
-- mã đơn hàng và tính tổng số tiền đon hàng đó!
select o.[OrderID], sum(od.[UnitPrice]*od.[Quantity]) as [Total Value] -- tính toán để ra con số kết quả nhé
from [NORTHWND].[dbo].[Orders] as o, [NORTHWND].[dbo].[Order Details] as od
where o.[OrderID] = od.[OrderID]
group by o.[OrderID]
-- vd7: từ 3 bảng order details, employees, orders, hãy in ra các thông tin sau:
-- mã đơn hàng
-- tên nhân viên
-- tổng số tiền sản phẩm của đơn hàng
select o.OrderID, e.LastName, e.FirstName, sum(od.[UnitPrice]*od.[Quantity]) as [Total Product Money]
from [NORTHWND].[dbo].[Orders] as o, [NORTHWND].[dbo].[Employees] as e , [NORTHWND].[dbo].[Order Details]  as od
where o.OrderID = od.OrderID and e.[EmployeeID] = o.EmployeeID
group by o.OrderID, e.LastName, e.FirstName
-- bài tập 1: Từ 3 bảng trong hình customer, orders, shippers hãy in ra các thông tin sau:
-- mã đơn hàng
-- tên khách hàng
-- tên công ty vận chuyển
-- và chỉ ra các đơn hàng dc giao đến UK trong năm 1997
select o.OrderID, c.[CompanyName], o.[ShippedDate], o.[ShipCountry], o.[CustomerID]
from [NORTHWND].[dbo].[Orders] as o, [NORTHWND].[dbo].[Customers] as c, [NORTHWND].[dbo].[Shippers] as s
where o.[CustomerID] = o.CustomerID and s.ShipperID = o.ShipVia and o.[ShipCountry] = 'UK' and year(o.[ShippedDate])='1997'


--BÀI 24: TIẾP TỤC TRUY VẤN DỮ LIỆU TỪ NHIỀU TABLE KHÁC NHAU:
-- từ bảng Products và Categories, hãy tìm các sản phẩm thuộc danh mục seafood (đồ hải sản) và
-- in ra các thông tin sau đây:
-- Mã thể loại
-- tên thể loại
-- mã sản phẩm
-- tên sản phẩm
select c.CategoryName, c.CategoryID, p.ProductID, p.ProductName
from [NORTHWND].[dbo].[Categories] as c, [NORTHWND].[dbo].[Products] as p
where c.CategoryID = p.CategoryID and c.CategoryName = 'SeaFood'
-- BT2: Từ bảng Product và Supplier, hãy tìm các sản phẩm được cung cấp
-- bởi nước Đức - Germany
-- Mã nhà cung cấp
-- Quốc gia
-- Mã sản phẩm
-- Tên sản phẩm
select  s.SupplierID, s.Country, p.ProductID, p.ProductName
from [NORTHWND].[dbo].[Products] as p, [NORTHWND].[dbo].[Suppliers] as s
where s.supplierID = p.supplierID and s.Country = 'Germany'
-- BT3: Từ 3 bảng trong hình (orders/customers/shippers) hãy in ra các thông tin sau đây
-- mã đơn hàng
-- tên khách hàng
-- tên công ty vận chuyển
-- và chỉ in ra các đơn hàng của khách hàng đến từ thành phố london

select o.OrderID, c.ContactName, s.CompanyName
from [NORTHWND].[dbo].[Orders] as o, [NORTHWND].[dbo].[Shippers] as s, [NORTHWND].[dbo].[Customers] as c
where o.CustomerID = c.CustomerID and o.ShipVia = s.ShipperID and c.City = 'London';
-- BT4: Từ 3 bảng trong hình hãy in ra các thông tin sau đây:
-- mã đơn hàng
-- tên khách hàng
-- tên công ty vận chuyển
-- ngày yêu cầu chuyển hàng
-- Ngày giao hàng
-- Và chỉ in ra các đơn hàng đã giao muộn hơn quy định:
-- Required Date< Shipped Date
select o.OrderID, c.ContactName, s.CompanyName, o.RequiredDate, o.ShippedDate
from [NORTHWND].[dbo].[Orders] as o, [NORTHWND].[dbo].[Shippers] as s, [NORTHWND].[dbo].[Customers] as c
where o.CustomerID = c.CustomerID and o.ShipVia = s.ShipperID and o.RequiredDate < o.ShippedDate
-- Excercise:
-- give these shipcountries for which customers dont come from the united states
-- select only these countries which is over than 100 orders
-- display ship country and number of orders
select o.ShipCountry, count(o.[OrderID]) as [total order]
from [NORTHWND].[dbo].[Orders] as o, [NORTHWND].[dbo].[Shippers] as s, [NORTHWND].[dbo].[Customers] as c
where o.CustomerID = c.CustomerID and o.ShipVia = s.ShipperID and c.country not in ('USA')
group by o.ShipCountry
having count(o.[OrderID]) > 100


-- BÀI 25: CÂU LỆNH UNION
-- VD1:
-- từ bảng order details hãy liệt kê các thông tin sau đây:
-- các đơn đặt hàng có unit price
-- nằm trong phạm vi từ 100 tới 200
select od.[OrderID]
from [NORTHWND].[dbo].[Order Details] as od
where od.[UnitPrice] between 100 and 200;
-- VD2:
-- từ bảng order details hãy liệt kê các thông tin sau đây:
-- các đơn đặt hàng có quantity
-- nằm trong phạm vi từ 10 hoặc 20:
select od.[OrderID]
from [NORTHWND].[dbo].[Order Details] as od
where od.[Quantity] in (10,20);
-- VD3:
-- từ bảng order details hãy liệt kê các đơn đặt hàng có Unit Price nằm
-- trong phạm vi từ 100 đến 200 và đơn hàng phải có quantity bằng 10 hoặc 20
select od.[OrderID]
from [NORTHWND].[dbo].[Order Details] as od
where (od.[UnitPrice] between 100 and 200) and (od.[Quantity] in (10,20))
-- VD4:
-- từ bảng order details hãy liệt kê các đơn đặt hàng có Unit Price nằm
-- trong phạm vi từ 100 đến 200 hoặc đơn hàng phải có quantity bằng 10 hoặc 20
select od.[OrderID]
from [NORTHWND].[dbo].[Order Details] as od
where (od.[UnitPrice] between 100 and 200) or (od.[Quantity] in (10,20))
-- 448 dòng
-- VD5:
-- từ bảng order details hãy liệt kê các đơn đặt hàng có Unit Price nằm
-- trong phạm vi từ 100 đến 200 hoặc đơn hàng phải có quantity bằng 10 hoặc 20 và sử dụng từ khóa DISTINCT
select distinct od.[OrderID]
from [NORTHWND].[dbo].[Order Details] as od
where (od.[UnitPrice] between 100 and 200) or (od.[Quantity] in (10,20))
-- câu lệnh UNION

--V=I+II =360 rows
select od.[OrderID]
from [NORTHWND].[dbo].[Order Details] as od
where od.[UnitPrice] between 100 and 200
UNION
select od.[OrderID]
from [NORTHWND].[dbo].[Order Details] as od
where od.[Quantity] in (10,20);

-- IV=I or II = 455 rows = 448+7 = 455 
select od.[OrderID]
from [NORTHWND].[dbo].[Order Details] as od
where od.[UnitPrice] between 100 and 200
UNION all
select od.[OrderID]
from [NORTHWND].[dbo].[Order Details] as od
where od.[Quantity] in (10,20);

-- VD3: hãy liệu kê toàn bộ các thành phố và quốc gia tồn tại trong cả 2 tables sau đây với
-- 2 tình huống sử dụng UNION, và UNION ALL
-- lấy tất cả các quốc gia từ suppliers và customers
select distinct country
from [NORTHWND].[dbo].[Suppliers]
UNION -- ko cho phép sự trùng lặp quốc gia
select distinct country
from [NORTHWND].[dbo].[Customers]

select distinct country
from [NORTHWND].[dbo].[Suppliers]
UNION ALL -- cho phép sự trùng lặp quốc gia
select distinct country
from [NORTHWND].[dbo].[Customers]
-- Bài tập: từ bảng suppliers, customers, orders
--BT1: Liệt kê tên Thành Phố và Quốc Gia có:
--1/ khách hàng thuộc các quốc gia có tên bắt đầu bằng chữ U, hoặc
--2/ có các nhà cung cáp ở thành phố London, hoặc 
--3/ đơn hàng được ship đến USA
--Lưu ý: Bỏ các kqua trùng lặp.
select city, Country
from [NORTHWND].[dbo].[Customers]
where country = 'U%'
Union
select city, Country
from [NORTHWND].[dbo].[Suppliers]
where [City] = 'london'
Union
select ShipCity, [ShipCountry]
from [NORTHWND].[dbo].[Orders]
where [ShipCountry] = 'USA'

-- BÀI 26: CÁC CÂU LỆNH JOIN, LEFT JOINT TRONG SQL
-- INNER JOIn là kiểu merge cái nào có thông tin match từ cả 2 bảng
-- Ví dụ 2: Sử dụng INNER JOIN: Từ bảng products và CAtegories, hãy in ra các thông tin sau đây:
-- mã thể loại, tên thể loại, mã sản phẩm tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from [NORTHWND].[dbo].[Categories] as c
INNER JOIN [NORTHWND].[dbo].[Products] as p
On c.CategoryID = p.CategoryID
-- Ví dụ 3: Sử dụng INNER JOIN: Từ bảng products và CAtegories, hãy in ra các thông tin sau đây:
-- mã thể loại, tên thể loại, số lượng sản phẩm:
select c.CategoryID, c.CategoryName, count(p.ProductID) as [So luong san pham]
from [NORTHWND].[dbo].[Categories] as c
INNER JOIN [NORTHWND].[dbo].[Products] as p
On c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName
-- ví dụ 4: Sử dụng Inner join để in ra các thông tin dưới đây:
-- mã đơn hàng
-- tên công ty khách hàng 
select o.OrderID, c.CompanyName
from [NORTHWND].[dbo].[Orders] o 
inner join [NORTHWND].[dbo].[Customers] c
on o.CustomerID = c.CustomerID
-- LEFT JOIN: Trả lại tất cả các dòng từ bên trái và các dòng đúng với điều kiện
-- từ bảng bên phải
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from [NORTHWND].[dbo].[Categories] as c -- cái này dc gọi là dòng bên trái nè - dòng chính á
LEFT JOIN [NORTHWND].[dbo].[Products] as p -- cái này gọi là dòng bên phải - dòng phải thỏa mãn điều kiện
On c.CategoryID = p.CategoryID
-- Thử cùng 1 đề bài với innerjoin 
select c.CategoryID, c.CategoryName, count(p.ProductID) as [So luong san pham]
from [NORTHWND].[dbo].[Categories] as c
INNER JOIN [NORTHWND].[dbo].[Products] as p
On c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName
-- thử cùng 1 đề bài với left join
select c.CategoryID, c.CategoryName, count(p.ProductID) as [So luong san pham]
from [NORTHWND].[dbo].[Categories] as c
Left JOIN [NORTHWND].[dbo].[Products] as p
On c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName
-- so sánh và tự cảm nhận sự khác biệt giữa inner join và left join
-- câu lệnh RIGHTJOIN: trả lại tất cả các giữ liệu từ dòng bên phải và kết hợp với các dữ liệu
-- thỏa điều kiện từ dòng bên trái:
select o.OrderID, c.CompanyName
from [NORTHWND].[dbo].[Orders] o 
inner join [NORTHWND].[dbo].[Customers] c
on o.CustomerID = c.CustomerID
-- khi dùng để thay đổi/thêm data vào customersID, bấm chuột phải và chọn edit top 200 rows
select o.OrderID, c.CompanyName
from [NORTHWND].[dbo].[Orders] o 
right join [NORTHWND].[dbo].[Customers] c -- hàm này nó sẽ lấy hết thông tin từ bảng bên tay phải - bảng customers luôn
on o.CustomerID = c.CustomerID
 -- thử khi dùng hàm count
select c.CompanyName, count(o.orderID)
from [NORTHWND].[dbo].[Orders] o 
right join [NORTHWND].[dbo].[Customers] c -- hàm này nó sẽ lấy hết thông tin từ bảng bên tay phải - bảng customers luôn
on o.CustomerID = c.CustomerID
group by c.CompanyName
-- full outer Joint - hàm này lấy hết từ trái sang phải lun
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from [NORTHWND].[dbo].[Categories] as c -- cái này dc gọi là dòng bên trái nè - dòng chính á
full JOIN [NORTHWND].[dbo].[Products] as p -- cái này gọi là dòng bên phải - và code này sẽ lấy hết cả 2 bảng dữ liệu và ghép lại với nhau
On c.CategoryID = p.CategoryID
-- BÀI TẬP:
--1. hãy kể tên nhân viên và tên khách hàng của các đơn hàng trong bảng orders?!
Select E.LastName, E.FirstName, C.CompanyName
from [NORTHWND].[dbo].Employees as E
inner join [NORTHWND].[dbo].Orders as O
On E.EmployeeID=O.EmployeeID
inner join [NORTHWND].[dbo].Customers as C
On O.CustomerID=C.CustomerID 
-- 2. hãy liệt kê tên các nhà cung cấp và tên sản phẩm của các sản phẩm có trong bảng products,
-- bao gồm cả các sản phẩm ko có nhà cung cấp
Select S.CompanyName, P.ProductName 
from [NORTHWND].[dbo].Products As P
left join [NORTHWND].[dbo].Suppliers As S
on P.SupplierID=S.SupplierID 
-- 3.Hãy liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng orders, bao gồm
-- cả các khách hàng ko có đơn hàng
Select O.ContactName, C.OrderID
from [NORTHWND].[dbo].[Orders] As C
right join [NORTHWND].[dbo].[Customers]As O
on C.[CustomerID]=O.[CustomerID]
-- 4.Hãy liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng products,
-- bao gồm cả các danh mục và nhà cung cấp ko có sản phẩm
select C.CategoryName, S.CompanyName
from [NORTHWND].[dbo].Categories as C
full join [NORTHWND].[dbo].Products as P
on C.CategoryID=P.CategoryID
full join [NORTHWND].[dbo].Suppliers as S
on S.SupplierID=P.SupplierID

--BÀI TẬP VỀ CÁC CÂU LỆNH JOIN
-- BT1: Hãy liệt kê tên sản phẩm và tên nhà cung cấp các sản phẩm đã dc đặt hàng
-- trong bảng "order details". Sử dụng inner join để kết hợp bảng order details
-- với các bảng liên quan để lấy thông tin sản phẩm nhà cung cấp:
select distinct od.ProductID, p.ProductName, s.CompanyName
from [NORTHWND].[dbo].[Order Details] od
INNER JOIN [NORTHWND].[dbo].[Products] p
on p.ProductID = od.ProductID
inner join [NORTHWND].[dbo].[Suppliers] s
on p.SupplierID = s.SupplierID
-- BT2: DÙNG LEFT JOIN: liệt kê tên khách hàng và nhân viên phụ trách
-- của các đơn hàng trong bảng orders. Bao gồm các đơn hàng ko có nhân
-- viên phụ trách. Sử dụng left join để kết hợp bảng orders với bảng employees 
-- để lấy thông tin về khách hàng và nhân viên phụ trách
-- dùng 3 tables: customer, employee. orders
select o.OrderID, e.FirstName, e.LastName, c.CompanyName
from [NORTHWND].[dbo].[Orders] o
left join [NORTHWND].[dbo].[Employees] e
on o.EmployeeID = e.EmployeeID
left join [NORTHWND].[dbo].[Customers] c
on o.CustomerID = c.CustomerID
-- BT3: Liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng
-- trong bảng orders. Bao gồm của các khách hàng ko có đơn hàng
-- Sử dụng right join để kết hợp bảng orders với bảng customers để lấy
-- thông tin về khách hàng và nhân viên phụ trách!?
select o.OrderID, e.FirstName, e.LastName, c.CompanyName
from [NORTHWND].[dbo].[Orders] o
right join [NORTHWND].[dbo].[Employees] e
on o.EmployeeID = e.EmployeeID
right join [NORTHWND].[dbo].[Customers] c
on o.CustomerID = c.CustomerID
-- dùng right join nó có thể lấy ra nhân viên/khách hàng chưa làm đơn hàng hàng nào hết và nó có thể lấy ra luôn


-- BT4: Liệt kê tên danh mục và các nhà cung cấp của các sản phẩm trong bảng product
-- Bao gồm cả danh mục và các nhà cung cấp ko có sản phẩm
-- Sử dụng full join hoặc kết hợp left join và right join để kết hợp lấy thông tin về danh mục và các nhà cung cấp
select distinct p.ProductID, p.ProductName, c.CategoryName, s.CompanyName
from [NORTHWND].[dbo].[Products] p
FULL JOin [NORTHWND].[dbo].[Suppliers] s
on p.SupplierID = s.SupplierID
FULL JOin [NORTHWND].[dbo].[Categories] c
on p.CategoryID = c.CategoryID
-- khi mà dùng full join thì nó gần như là lấy hết các thông tin và của các table khác nhau
-- tạo nên rất nhiều dữ liệu null.
-- BT5: Liệt kê tên khách hàng và tên sản phẩm đã được đặt hàng trong bảng orders và
-- orders detail. Sử dụng inner joint để kết hợp bảng orders và order details để lấy thông
-- tin khách hàng và sản phẩm đã được đặt hàng
select p.ProductName , c.CompanyName 
from [NORTHWND].[dbo].[Products] p
Inner join [NORTHWND].[dbo].[Order Details] od
on p.productID = od.productid
Inner join [NORTHWND].[dbo].[Orders] o
on od.OrderID = o.OrderID
Inner join [NORTHWND].[dbo].[Customers] c
on c.CustomerID = o.CustomerID
-- Bài tập 6: Hãy liệt kê tên nhân viên và tên khách hàng
-- của các đơn hàng trong bảng orders. Bao gồm cả các đơn hàng ko có nhân viên
-- hoặc các khách hàng tương ứng 
select o.OrderID, c.CompanyName, e.LastName, e.FirstName
from [NORTHWND].[dbo].[Orders] o
full join [NORTHWND].[dbo].[Customers] c
on c.CustomerID = o.CustomerID
full join [NORTHWND].[dbo].[Employees] e
on o.EmployeeID = e.EmployeeID