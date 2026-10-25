Create Table Categories
(
	CategoryId int Primary Key identity,
	Name VarChar(100),
	Description VarChar(500),
	MainCategory int References Categories(CategoryId)
)

Create Table Products
(
	ProductId int Primary Key Identity,
	StockQuantity int,
	Name VarChar(100),
	AddedDate Date,
	Description VarChar(500),
	UnitPrice Decimal(10,2),
	CategoryId int References Categories(CategoryId)
)

Create Table StockTransaction
(
	TranId int Primary Key Identity,
	TranDate Date,
	Type VarChar(20),
	QuantityChange int,
	Reference VarChar(100),
	ProductId int References Products(ProductId)
)

Create Table Suppliers
(
	SupplierId int Primary Key Identity,
	Name VarChar(100),
	Country VarChar(100),
	Email VarChar(100),
	Address VarChar(100),
	CountactNumber int
)

Create Table Products_Suppliers
(
	SupplierId int References Suppliers(SupplierId),
	ProductId int References Products(ProductId)
)

Create Table Customer
(
	CustomerID int Primary Key identity,
	FullName VarChar(100),
	PhoneNumber int,
	Email VarChar(100),
	ShipingAddress VarChar(200),
	RegidtraionDate Date
)

Create Table Reviews
(
	ReviewId int Primary Key Identity, 
	Rating int,
	Date Date,
	Comment VarChar,
	ProductId int References Products(ProductId),
	CustomerID int References Customer(CustomerID)
)

Create Table Orders
(
	OrderId int Primary Key Identity,
	Status VarChar(100),
	TotalAmount Decimal(10,2),
	OrderDate Date,
	CustomerId int References Customer(CustomerId)
)

Create Table OrderItems
(
	OrderItemId int Primary Key Identity,
	Quantity int,
	UniPrice Decimal,
	ProductId int References Products(ProductId),
	OrderId int References Orders(OrderId)
)

Create Table Payments
(
	PaymentId int Primary Key Identity,
	PaymentDate Date,
	Amount Decimal(10,2),
	Status VarChar(100),
	Method VarChar(200)
)

Create Table Orders_Payment
(
	OrderId int References Orders(OrderId),
	PaymentId int References Payments(PaymentId)
)

Create Table Shipments
(
	ShipmentId int Primary Key Identity,
	ShipmentDate Date,
	Status VarChar(100),
	DeliveryDate Date,
	CarrirName VarChar(100),
	TrackingNumber int,
	OrderId int References Orders(OrderId)
)

Use Onlinestore

Insert Into  Customer 
Values('Youssef', '01011226169', 'Ym09321@gmail.com', 
'Cairo', '12/04/2025') 

Insert Into Suppliers 
Values('Youssef', 'Egypt', 'Ym09321@gmail.com', 'Cairo', '01146818023'),
('Sara', 'Egypt', 'Sr09321@gmail.com', 'Alex', '01146835723'),
('Omar', 'Egypt', 'Om09321@gmail.com', 'Cairo', '01174569023')

Insert Into Categories
Values('Youssef', '-------',Null),
('Sara', '--------', Null)

Insert Into Products(Name, UnitPrice) 
Values('Youssef', '12000.00'),
('Sara', '10000.00')

Create table ArchivedStock 
(TranId int,
ProductId int,
QuantityChange int, 
TranDate Date)
Insert into ArchivedStock (TranId, ProductId, QuantityChange, TranDate)
Values (1, 3, 50, '2022-03-15'),
       (2, 5, -10, '2022-07-20'),
       (3, 2, 30, '2022-11-01');

Update Products
Set UnitPrice = UnitPrice * 1.10
Where UnitPrice < 100

Update Orders
Set Status = 
		Case
			When TotalAmount > 5000 then 'Premium'
			Else 'Standard'
		End
 
