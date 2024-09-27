--CREATE DATABASE EBAY;

CREATE TABLE CATEGORY(
	id INT PRIMARY KEY IDENTITY(1,1),
	[name] NVARCHAR(MAX) NOT NULL, 
	[image] NVARCHAR(MAX) NOT NULL
)

CREATE TABLE PRODUCT(
	id INT PRIMARY KEY IDENTITY(1,1),
	[name] NVARCHAR(MAX) NOT NULL,
	stock INT DEFAULT 0 CHECK ( stock >= 0),
	price INT DEFAULT 0 CHECK ( price >= 0),
	category_id INT FOREIGN KEY REFERENCES CATEGORY(id),
	[image] NVARCHAR(MAX) NOT NULL
)

CREATE TABLE ACCOUNT(
	[user_name] VARCHAR(255) PRIMARY KEY, 
	[password] VARCHAR(MAX) NOT NULL,
	[role] VARCHAR(MAX) DEFAULT 'USER' CHECK ([role] IN ('USER','ADMIN'))
)

CREATE TABLE [ORDER](
	id INT PRIMARY KEY IDENTITY(1,1),
	[user_name] VARCHAR(255) FOREIGN KEY REFERENCES ACCOUNT([user_name]),
	[date] DATETIME DEFAULT GETDATE(),
	[status] VARCHAR(MAX) DEFAULT 'PENDDING' CHECK ([status] IN ('PENDDING','REJECT','APPROVE'))
)

CREATE TABLE [ORDER_DETAIL](
	order_id INT FOREIGN KEY REFERENCES [ORDER](id),
	product_id INT FOREIGN KEY REFERENCES PRODUCT(id),
	quantity INT DEFAULT 1 CHECK (quantity >= 1)
)

INSERT INTO CATEGORY ([name], [image]) VALUES
	('Luxury', 'https://ir.ebaystatic.com/cr/v/c01/01_PopularDestination_Luxury.jpg'),
	('Sneakers', 'https://ir.ebaystatic.com/cr/v/c01/02_PopularDestination_Sneakers.jpg'),
	('P&A', 'https://ir.ebaystatic.com/cr/v/c01/03_PopularDestination_Tire.jpg'),
	('Refurbished', 'https://ir.ebaystatic.com/cr/v/c01/ECM_PopularDestination_Reburbished.jpg'),
	('Trading cards', 'https://ir.ebaystatic.com/cr/v/c01/05_PopularDestination_Cards.jpg'),
	('Pre-loved Luxury', 'https://ir.ebaystatic.com/cr/v/c01/06_PopularDestination_PreLoved.jpg'),
	('Toys', 'https://ir.ebaystatic.com/cr/v/c01/07_PopularDestination_Toys.jpg');

