/*1Q. database table by applying primary keys and foreign keys*/
/* creating database*/
Create database Assignments;

use Assignments;

/*3Q In customer table the first name table should not accept the null values*/
/*1 Customer*/
create table Customer(
Id Int PRIMARY KEY,
FirstName nvarchar(40) NOT NULL,
LastName nvarchar(40),
City nvarchar(40),
Country nvarchar(40),
Phone nvarchar(20),
);
create index IndexCustomerName on Customer(FirstName);

/*4Q. In order table orderdate should not accept the null values*/
/*2 Order*/
create table [Order](
ID Int PRIMARY KEY,
OrderDate datetime NOT NULL,
OrderNumber nvarchar(10),
CustomerID int REFERENCES Customer(Id) ON DELETE CASCADE ON UPDATE CASCADE,
TotalAmmount decimal(12,2)
);

create index IndexOrderCustomerId on [Order](CustomerID);
create index IndexOrderOrderDate on [Order](OrderDate);

/*3 Product*/
create table Product(
ID  int PRIMARY KEY,
ProductName  nvarchar(50),
UnitPrice  decimal(12,2),
Package  nvarchar(30),
IsDiscontinued bit
);

create index IndexProductSupplierId on Product(ID);
create index IndexProductName on Product(ProductName) ;


/*4 Order Item*/
create table OrderItem(
ID int PRIMARY KEY,
OrderID  int REFERENCES [Order](ID) ON DELETE CASCADE ON UPDATE CASCADE,
ProductID   int REFERENCES Product(ID) ON DELETE CASCADE ON UPDATE CASCADE,
UnitPrice  decimal(12,2),
Quantity  int
);

create index IndexOrderItemOrderId on OrderItem(OrderID);
create index IndexOrderItemProductId on OrderItem(ProductID);

/*2Q.Inserting records in all tables*/

 insert into customer(id, firstname, lastname, city, country, phone)
values (101 , 'Sai', 'Krishna', 'Hyderabad', 'India', '+91 8466045263');
insert into customer(id, firstname, lastname, city, country, phone)
values (102 , 'Sai', 'Kumar', 'Kamareddy', 'India', '+91 9059970818');
 insert into customer(id, firstname, lastname, city, country, phone)
values (103 , 'James', 'Gosley', 'Toronto', 'Germany', '+23-140258674');
 insert into customer(id, firstname, lastname, city, country, phone)
 values (104 , 'Jonny', 'Blair', 'texas', 'Germany', '+14-62354834');
 insert into customer(id, firstname, lastname, city, country, phone)
 values (105 , 'Antony', 'Rathore', 'Toronto', 'Russia', '+23-140258674');
 insert into customer(id, firstname, lastname, city, country, phone)
 values (106 , 'Samual', 'Shekar', 'texas', 'Germany', '');
								 
insert into [Order](id, orderdate, ordernumber, customerid, TotalAmmount)
values(201, '2022-04-04', '30001', 101, 96789);
insert into [Order](id, orderdate, ordernumber, customerid, TotalAmmount)
values(202, '2022-04-05', '30002', 102, 96781);
insert into [Order](id, orderdate, ordernumber, customerid, TotalAmmount)
values(203, '2022-04-06', '30003', 103, 96782);
insert into [Order](id, orderdate, ordernumber, customerid, TotalAmmount)
values(204, '2022-04-07', '30004', 104, 96783);
								
								
insert into Product(id, productname, unitprice, package, IsDiscontinued)
 values(301, 'Apple Laptop', 95000, 'Laptops', 0);
insert into Product(id, productname, unitprice, package, IsDiscontinued)
 values(302, 'dell Laptop', 40000, 'Laptops', 1);
 insert into Product(id, productname, unitprice, package, IsDiscontinued)
 values(303, 'Apple Tab', 15000, 'mobile', 0);
 insert into Product(id, productname, unitprice, package, IsDiscontinued)
 values(304, ' Samsung', 11000, 'mobile', 1);



 insert into OrderItem(ID, orderid, ProductID, unitprice, quantity)
 values(401, 201, 301, 95, 2); 
 insert into OrderItem(ID, orderid, ProductID, unitprice, quantity)
 values(402, 202, 302, 40, 1); 
  insert into OrderItem(ID, orderid, ProductID, unitprice, quantity)
 values(403, 203, 303, 15, 2); 
  insert into OrderItem(ID, orderid, ProductID, unitprice, quantity)
 values(404, 204, 304, 11, 3);

 /*5Q. display all customer details*/
select * from Customer;
select * from [Order];
select * from Product;
select * from OrderItem;


/*6Q country name starts with A or I*/
SELECT FirstName "Name",Country "country" FROM customer
WHERE FirstName LIKE 'I%' OR FirstName LIKE 'A%'
ORDER BY FirstName ;


/*7Q write a query to display name of customer third charecter is 'i'*/
SELECT * FROM Customer
WHERE FirstName LIKE '__i%';

/* 1Q customer table country from Germany*/
SELECT * FROM Customer
WHERE country LIKE 'germany';

/*2Q full name of the employee*/
SELECT FirstName+ +lastname FROM Customer;

/*4Q customer name second letter 'u'*/
SELECT * FROM Customer WHERE FirstName LIKE '_u%';

/*5Q unitprice in between 10 and 20*/
SELECT * FROM OrderItem WHERE (((UnitPrice) < 20) AND ((UnitPrice) > 10))
ORDER BY UnitPrice DESC;

/*6Q arrange the order by date*/
SELECT ID,OrderDate from [Order] ORDER BY OrderDate ASC;