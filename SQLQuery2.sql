-- Bài 28: Truy vấn con/Truy vấn lồng vào nhau
-- liệt kê toàn bộ sản phẩm
select [ProductID], [ProductName], [UnitPrice]
from [NORTHWND].[dbo].[Products];
-- tìm giá trung bình của các sản phẩm:
select avg ([UnitPrice]) as [average Price]
from [NORTHWND].[dbo].[Products];
-- lọc những sản phẩm có giá > giá trung bình 
select [ProductID], [ProductName], [UnitPrice]
from [NORTHWND].[dbo].[Products]
where [UnitPrice] > 28
-- Dùng "lệnh" trong "lệnh" để build code, khi mình thay đổi bản chất của data thì kết quả cũng sẽ thay đổi theo:
-- sub query - 
select [ProductID], [ProductName], [UnitPrice]
from [NORTHWND].[dbo].[Products]
where [UnitPrice] > (
		select AVG ([UnitPrice])
		from [NORTHWND].[dbo].[Products]
);
-- lọc ra những khách hàng có số đơn hàng lớn hơn 10
-- Cách 1: Dùng hàm left join
select c.CustomerID, c.CompanyName, count(o.orderID) as TotalOrders
from [NORTHWND].[dbo].[Customers] c
left join [NORTHWND].[dbo].[Orders] o
on c.CustomerID = o.CustomerID
group by c.CustomerID, c.CompanyName
having count ([OrderID]) > 10; -- nếu mà có tính toàn thì dùng hàm having thay cho where

-- cách 2 :dùng sub query cho nhanh hơn
-- thiết kế mục lấy ra
select o.CustomerID
from [NORTHWND].[dbo].[Orders] o
group by o.CustomerID
having count(o.OrderID)>10

-- gắn cái này vào subquery khác:
select *
from [NORTHWND].[dbo].[Customers] 
where [CustomerID] In (
						select o.CustomerID
						from [NORTHWND].[dbo].[Orders] o
						group by o.CustomerID
						having count(o.OrderID)>10
);
-- Tính tổng số tiền cho từng đơn hàng
select o.*, (
		SELECT SUM(od.Quantity*od.UnitPrice) 
		FROM [NORTHWND].[dbo].[Order Details] od
		where o.OrderID = od.OrderID
		group by od.OrderID
		) as [Total Money]
from [NORTHWND].[dbo].[Orders] o

-- tên sản phẩm và tổng số đơn hàng của sản phẩm:
select p.ProductID, p.ProductName , (	
					SELECT COUNT(*)
					FROM [NORTHWND].[dbo].[Order Details] od
					where od.ProductID = p.ProductID
					) as [TOTALORDERS]
from [NORTHWND].[dbo].[Products] p

-- về căn bản nó khá giống các câu lệnh left join,...'
-- Bài tập: Bạn hãy in ra mã đơn hàng, và tổng giá trị của đơn hàng đó
select o.[OrderID], (
			Select sum(od.[UnitPrice]*od.[Quantity]) 
			from [NORTHWND].[dbo].[Order Details] od
			where od.OrderID = o.OrderID
			) as [TotalValue]
from [NORTHWND].[dbo].[Orders] o
-- Bài tập 2: In ra mã đơn hàng, và số lượng sản phẩm của đơn hàng đó:
select o.[OrderID], (
			Select sum(od.[Quantity])
			from [NORTHWND].[dbo].[Order Details] od
			where od.OrderID = o.OrderID
			) as [TotalOrder]
from [NORTHWND].[dbo].[Orders] o
 -- kết hợp cả 2:
 --KẾT HỢP CẢ 2
SELECT o.OrderID, (
	SELECT SUM(od.UnitPrice*od.Quantity)
	FROM [NORTHWND].[dbo].[Order Details] od
	WHERE od.OrderID = o.OrderID
	) AS [Total], (
	SELECT SUM(od.Quantity)
	FROM [NORTHWND].[dbo].[Order Details] od
	WHERE od.OrderID = o.OrderID 
	) AS [TotalQuantity]
FROM [NORTHWND].[dbo].[Orders] o

-- BÀi 29: BÀI TẬP VỀ SUB QUERY:
-- liệt kê các đơn hàng có ngày đặt hàng gần nhất
select *
from [NORTHWND].[dbo].[Orders] o
where o.OrderDate = (
select max([OrderDate])
from [NORTHWND].[dbo].[Orders]
); -- xuất ra bao nhiêu đơn hàng được đặt hàng vào ngày cuối cùng
-- Hãy liệt kê giúp mình những sản phẩm (productName) nào mà ko có đơn đặt hàng nào đặt mua chúng!
select *
from [NORTHWND].[dbo].[Products] p
where p.ProductID NOT IN (
select distinct [ProductID]
from [NORTHWND].[dbo].[Order Details]
); -- nó thống kê dc tất cả các đơn hàng mà ta nhập về nhưng mà nó ế, ko ai mua hết 

-- Lấy thông tin về các đơn hàng, tên các sản phẩm
-- thuộc các đơn hàng chưa được giao cho khách
select o.OrderID, p.ProductName
from [NORTHWND].[dbo].[Orders] o
inner join [NORTHWND].[dbo].[Order Details] od
on o.OrderID = od.OrderID
inner join [NORTHWND].[dbo].[Products] p
on od.ProductID = od.ProductID
where o.OrderID IN (
		select [OrderID]
		from [NORTHWND].[dbo].[Orders]
		where [ShippedDate] is Null);
-- Lấy thông tin của những sản phẩm mà nó có số lượng tồn kho
-- ít hơn số lượng tồn kho trung bình của tất cả các sản phẩm
select * 
from [NORTHWND].[dbo].[Products] p
where p.UnitsInStock > (
select AVG([UnitsInStock])
from [NORTHWND].[dbo].[Products]);
-- lấy thông tin các khách hàng có tổng giá trị đơn hàng lớn nhất
SELECT *
FROM [NORTHWND].[dbo].[Customers]
WHERE [CustomerID] IN (
    -- BƯỚC 1: Lấy ra ID của khách hàng có tổng tiền mua bằng với mức kỷ lục
    SELECT o.CustomerID
    FROM [NORTHWND].[dbo].[Orders] o
    INNER JOIN [NORTHWND].[dbo].[Order Details] od 
	ON o.OrderID = od.OrderID
    GROUP BY o.CustomerID
    HAVING SUM(od.Quantity * od.UnitPrice) = (
        -- BƯỚC 2: Tìm ra con số tổng doanh thu kỷ lục của hệ thống
        SELECT MAX(BangTam.TongTien)
        FROM (
            SELECT SUM(sub_od.Quantity * sub_od.UnitPrice) AS TongTien
            FROM [NORTHWND].[dbo].[Orders] sub_o
            INNER JOIN [NORTHWND].[dbo].[Order Details] sub_od ON sub_o.OrderID = sub_od.OrderID
            GROUP BY sub_o.CustomerID
        ) AS BangTam -- Tên bảng tạm bắt buộc phải có
    )
);

-- BÀI 30: Thứ tự thực thi câu truy vấn SQL:
-- Các thứ tự của các câu truy vấn SQL được liệt kê như sau:
select distinct 9 top 11,...,8
from 1
full/L/R 4 outer JOIN 2 on 3
where 5
group by 6
having 7
order by 10
-- Ví dụ:
Select p.CategoryID, count(p.productID) as [Total product]
from [NORTHWND].[dbo].[Products] p --1
where p.CategoryID in (1,2,3) --2
group by p.CategoryID -- 3
Having count (p.ProductID)>=13; --4 [Total Product] chưa tồn tại, nếu để [Total Product] >=13 thì nó thực sự ko tồn tại

Select p.CategoryID, count(p.productID) as [Total product] --5
from [NORTHWND].[dbo].[Products] p --1
where p.CategoryID in (1,2,3) --2
group by p.CategoryID -- 3
Having count (p.ProductID)>=13; --4 [Total Product] chưa tồn tại, nếu để [Total Product] >=13 thì nó thực sự ko tồn tại
order by [Total product] asc -- 6

-- bài tập: nhìn vào và sắp xếp dữ liệu theo cột:
select top 3 p.ProductID, o.Discount, o2.ShipCountry --> B7 và B8: chọn cột và dòng cần lấy
from [NORTHWND].[dbo].[Products] p --> B1: kiểm tra bảng Products
inner join [NORTHWND].[dbo].[Order Details] o --> B2: kiểm tra bảng Order Details
on p.ProductID = o.ProductID --> B3: kiểm tra điều kiện từ 2 bảng Products và Order Details
inner join [NORTHWND].[dbo].[Orders] o2 --> B4: kiểm tra bảng Orders
on o.OrderID = o2.OrderID --> B5: kiểm tra điều kiện từ 2 bảng Orders và Order Details
where o.Discount = 0.25 and o2.ShipCountry = 'Germany' --> B6: kiểm tra các điều kiện WHERE
order by p.ProductID desc --> B9: sắp xếp dữ liệu theo p.ProductID

-- BÀi 31: COMMON TABLE EXPRESSION:
-- với hàm WITH này, ta sẽ cố tạo ra một bảng short_e
WITH short_e as (
	Select [EmployeeID], [LastName], [FirstName]
	from [NORTHWND].[dbo].[Employees]
)
select * from short_e;
-- lấy thông tin về đơn hàng (orders) cùng với tổng giá trị và tỉ lệ giữa
-- tổng giá trị và chi phí giao hàng
-- cách 1: làm subquery
select
	[OrderID],
	[OrderDate],
	[Freight],
	(select sum(od.[Quantity]*od.[UnitPrice])
		from [NORTHWND].[dbo].[Order Details] od
		where od.[OrderID]=o.OrderID
) as TotalPrice,
	(select sum(od.[Quantity]*od.[UnitPrice])
		from [NORTHWND].[dbo].[Order Details] od
		where od.[OrderID]=o.OrderID
)/[Freight] as ratio
from [NORTHWND].[dbo].[Orders] o;
-- vì dùng subquery rất là chậm và sử dụng rất nhiều data cho điều đó

-- giờ ta sẽ cùng CTE:
WITH OtherTotals AS (
    select [OrderID], sum(od.[Quantity]*od.[UnitPrice]) as [TotalPrice]
    from [NORTHWND].[dbo].[Order Details] od
    group by [OrderID]
)-- hàm with ko dc đứng một mình, mà phải dùng hàm select sau khi dùng hàm WITH
select
    o.[OrderID], 
    o.[OrderDate], 
    o.[Freight], 
    ot.[TotalPrice],
	ot.[TotalPrice]/[Freight] as Ratio
from [NORTHWND].[dbo].[Orders] o
join OtherTotals ot on o.OrderID = ot.OrderID; -- phải chạy cùng hàm WITH 1 lúc nha
-- CTE giống kiểu tạo ra 1 cái bảng tạm thời/ để sau này ta có thể tách 1 vấn đề thành từng bảng nhỏ
-- và dùng join để kết hợp bảng tạm thời lại với nhau thì sẽ dễ chịu hơn
-- Bài tập 1: Sử dụng CTE để tính tổng doanh thu bán hàng cho từng sản phẩm từ hai bảng "Order Details" và "Products"
-- trong cơ sở dữ liệu.
WITH TOTALSALES AS (
SELECT OD.[ProductID], SUM (OD.[UnitPrice] * OD. [Quantity]) AS TOTALPRICE
FROM [NORTHWND].[dbo].[Order Details] AS OD
GROUP BY OD.[ProductID])

  SELECT P. [ProductID], P. [ProductName], TS.[TOTALPRICE]
  FROM [NORTHWND].[dbo].[Products] AS P
  JOIN TOTALSALES AS TS ON TS. [ProductID] = P. [ProductID];

-- Bài tập 2: Sử dụng CTE để tính toán tổng doanh số bán hàng theo từng khách hàng và sau đó, sắp xếp
-- danh sách khách hàng theo tổng doanh số giảm dần
WITH TotalPriceProduct AS (
	select od.OrderID, sum(od.Quantity * od.UnitPrice) as Total
	from [NORTHWND].dbo.[Order Details] as od
	group by od.OrderID
),
TongDoanhSo AS (
	select o.CustomerID, TPP.Total
	from [NORTHWND].dbo.Orders as o
	inner join TotalPriceProduct as TPP on TPP.OrderID = o.OrderID
)
-- SỬA LẠI ĐOẠN CUỐI NÀY:
select 
    c.CustomerID, 
    c.CompanyName, 
    SUM(TDS.Total) as [TongDoanhSoKhachHang] -- 1. Cộng dồn tổng tiền của các đơn hàng lại
from [NORTHWND].dbo.Customers as c
inner join TongDoanhSo as TDS on TDS.CustomerID = c.CustomerID
group by c.CustomerID, c.CompanyName           -- 2. Gom nhóm theo từng khách hàng
order by [TongDoanhSoKhachHang] DESC;          -- 3. Sắp xếp giảm dần (Cao nhất đứng đầu)


---
-- Bài 32: Cách xây dựng câu truy vấn đệ quy
WITH fibo(prev_n, n) AS (
    -- khoi tao
    SELECT
        0 as prev_n,
        1 as n

    UNION ALL
    -- de quy
    SELECT
        n as prev_n,
        prev_n+n as n
    FROM fibo
)
SELECT * FROM fibo
OPTION (MAXRECURSION 10); -- Thêm giới hạn này vào để tránh vòng lặp vô hạn gây treo server

-- giaiThua
WITH giaiThua(stt, giaiThuaX) AS (
    -- khoi tao
    SELECT 
        1 as stt,
        1 as giaiThuaX

    UNION ALL
    -- de quy
    SELECT 
        stt+1 as stt,
        (stt+1)*giaiThuaX as giaiThuaX
    FROM giaiThua
)
SELECT * FROM giaiThua
OPTION (MAXRECURSION 5);
-- giờ áp dụng vào data, select ra một cái bảng hireachy, để xem ô nào quản lí ô nào, ô nào chạy job,...
-- Trong đó "ReportsTo" chỉ là mã của người quản lý.
declare @EmployeeId int
set @EmployeeId=2;

WITH e_cte as (
    -- khoi tao
    SELECT 
        e.[EmployeeID],
        e.FirstName+' '+e.LastName as Name,
        e.[ReportsTo] as ManagerId, -- lệnh này nó tìm tất cả các nhân viên có mã report to = với sếp tổng dc predefined là 0, sau đó nó chạy
        0 as Level
    FROM [NORTHWND].[dbo].[Employees] e

    UNION ALL -- gộp tất cả bọn lính F1 vào sếp tổng là 0
    -- de quy
    SELECT
        e1.[EmployeeID],
        e1.FirstName+' '+e1.LastName as Name,
        e1.[ReportsTo] as ManagerId,
        Level+1 as Level
    FROM [NORTHWND].[dbo].[Employees] e1
    JOIN e_cte ON e1.ReportsTo=e_cte.EmployeeID --do đó với hàm đệ quy nó sẽ chạy vòng lặp để tính F2 vào F1 và sau đó chạy đi,...
)
SELECT * FROM e_cte
OPTION (MAXRECURSION 500); -- chỉ cho vòng lặp chạy tới 500 vòng thôi, ko dc sử dụng nhiều

-- Bài 33: Window Functions và các ứng dụng của nó:
-- xếp hạng sản phẩm giảm giá trên toàn bộ table
select 
     [ProductID],
     [ProductName],
     [CategoryID],
     [UnitPrice],
     Rank () over (order by [UnitPrice] Desc) as ranking
from [NORTHWND].[dbo].[Products]
-- xếp hạng sản phẩm giảm giá dần trên thể loại:
select 
     [ProductID],
     [ProductName],
     [CategoryID],
     [UnitPrice],
     Rank () over (partition by [CategoryID] order by [UnitPrice] Desc) as ranking
from [NORTHWND].[dbo].[Products]
-- Chúng ta sẽ sử dụng hàm LAG () để lấy thông tin đơn đặt hàng:
-- và ngày đặt hàng của đơn hàng trước đó cho mỗi khách hàng:
SELECT 
    [CustomerID],
    [OrderID],
    [OrderDate],
    LAG([OrderDate]) OVER (PARTITION BY [CustomerID] ORDER BY [OrderDate] asc ) AS PreviousOrderDate
FROM [NORTHWND].[dbo].[Orders]
ORDER BY [CustomerID], [OrderDate];
-- hàm lag dùng để tìm ra ngày đưa hàng trước đó - và order by là sắp xếp chúng theo tứ tự tăng dần (tức là ngày gần nhất
-- tới ngày xa nhất)

-- Bài tập: Tính tổng doanh số bán hàng hằng năm của khách hàng, và xếp hạng khách hàng dựa trên doanh số bán hàng:
-- BƯỚC 1: Tính tổng doanh số của mỗi khách hàng theo từng năm
WITH DoanhSoKhachHangHangNam AS (
    SELECT 
        o.CustomerID,
        YEAR(o.OrderDate) AS NamBaoCao, -- Hàm YEAR() để bốc tách riêng số năm
        SUM(od.Quantity * od.UnitPrice) AS TongDoanhSo
    FROM [NORTHWND].[dbo].[Orders] o
    INNER JOIN [NORTHWND].[dbo].[Order Details] od ON o.OrderID = od.OrderID
    GROUP BY o.CustomerID, YEAR(o.OrderDate)
)

-- BƯỚC 2: Sử dụng Window Function để xếp hạng các đại gia trong từng năm
SELECT 
    CustomerID,
    NamBaoCao,
    TongDoanhSo,
    DENSE_RANK() OVER (
        PARTITION BY NamBaoCao 
        ORDER BY TongDoanhSo DESC
    ) AS XepHangTrongNam
FROM DoanhSoKhachHangHangNam
ORDER BY NamBaoCao ASC, XepHangTrongNam ASC; -- Sắp xếp năm tăng dần, hạng từ 1 trở đi để dễ nhìn







