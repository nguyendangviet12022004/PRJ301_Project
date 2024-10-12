CREATE DATABASE EBAY;

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


INSERT INTO PRODUCT([name], stock, price, category_id, [image]) VALUES
('Rolex Oyster Perpetual No Date Steel American Bracelet Ladies 24mm Watch 6718', 10, 1000, 1, 'https://i.ebayimg.com/thumbs/images/g/mkwAAOSwepNezrzA/s-l960.webp'),
('Rolex Oyster Perpetual Ref 1024 14K Gold Shell Automatic White 34mm Men''s Watch', 5, 1200, 1, 'https://i.ebayimg.com/thumbs/images/g/xBUAAOSwQ8xl2Hlt/s-l960.webp'),
('Rolex Oyster Datejust Ladies 26mm Steel White Pearl Dial 2.50ct Diamonds 79160', 3, 1500, 1, 'https://i.ebayimg.com/thumbs/images/g/X0QAAOSwmAFkwtNf/s-l960.webp'),
('Louis Vuitton CarryAll PM Monogrammed Shoulder Bag M46203 in Brown $2550', 7, 2550, 1, 'https://i.ebayimg.com/thumbs/images/g/2SQAAOSwe~Vm54Rr/s-l960.webp'),
('Louis Vuitton OnTheGo GM Empreinte Leather Noir Black Monogram M44925', 6, 2300, 1, 'https://i.ebayimg.com/thumbs/images/g/2W4AAOSwrulm7WN5/s-l960.webp'),
('LOUIS VUITTON LV Garden Nano Bucket Shoulder Bag Beige M81724 LV Auth 84696S', 4, 1800, 1, 'https://i.ebayimg.com/thumbs/images/g/PwgAAOSwSL5m50sl/s-l960.webp'),
('TIFFANY & CO. HEART TAG TOGGLE NEW ORIGINAL FROM STORE. COMPLETE WITH EVERYTHING', 2, 500, 1, 'https://i.ebayimg.com/thumbs/images/g/RSQAAOSwEfNlg4iH/s-l960.webp'),
('TIFFANY Co. Return to Heart Tag Bracelet 17cm Ball Chain', 3, 700, 1, 'https://i.ebayimg.com/thumbs/images/g/0VAAAOSwN7dm9RYT/s-l960.webp'),
('CARTIER Juste Un Clou Ring 18K White Gold Cartier?52/US#6.75', 1, 7000, 1, 'https://i.ebayimg.com/thumbs/images/g/gvQAAOSw5V5m9iWA/s-l960.webp'),
('AUTHENTIC CARTIER LOVE BRACELET 18K WG, SIZE 19, CERT OF AUTH, RET USD $7,900+T', 1, 7900, 1, 'https://i.ebayimg.com/thumbs/images/g/2QgAAOSwePBm7vfB/s-l960.webp'),
('Jordan 4 Retro x A Ma Maniere', 12, 220, 2, 'https://i.ebayimg.com/images/g/k8MAAOSwYDtm7ekl/s-l1600.webp'),
('Nike Air Jordan 1', 15, 150, 2, 'https://i.ebayimg.com/images/g/dnYAAOSwkd5kkv8M/s-l960.webp'),
('adidas Korn x Campus 00s Black Gum', 10, 130, 2, 'https://i.ebayimg.com/images/g/NPsAAOSwEfNlbIRt/s-l1200.jpg'),
('Adidas original Samba classic sneakers black', 8, 100, 2, 'https://i.ebayimg.com/images/g/Hj8AAOSwcMtmbAhY/s-l960.webp'),
('Mens Puma SPEEDCAT OG + SPARCO', 9, 110, 2, 'https://i.ebayimg.com/images/g/5tUAAOSwP2JmdXj-/s-l960.webp'),
('Puma Suede Classic XXI 37491501', 5, 90, 2, 'https://i.ebayimg.com/images/g/hLAAAOSwS4tmIx7x/s-l960.webp'),
('PUMA Softride Rift Red', 7, 120, 2, 'https://i.ebayimg.com/images/g/ZCkAAOSwxNljoWPo/s-l640.png'),
('Unisex Converse Chuck Taylor', 10, 60, 2, 'https://i.ebayimg.com/images/g/K9QAAOSw-rBiq3jQ/s-l1600.webp'),
('CONVERSE Unisex Run Star Trainer Extra Comfort Multy Memory Foam Men''s Size', 6, 80, 2, 'https://i.ebayimg.com/images/g/w6YAAOSwzfJmcxV3/s-l960.webp'),
('VANS Joe Freshgoods x OG Style 36 LX Honeymoon Stage - Red', 5, 110, 2, 'https://i.ebayimg.com/images/g/6OkAAOSwtiJk0Nk3/s-l1200.webp');


INSERT INTO PRODUCT([name], stock, price, category_id, [image]) VALUES
('NEW YAMAHA Genuine 1C3-11311-21-00 2005-2021 YZ125 YZ 125X CYLINDER ASSEMBLY JUG', 8, 500, 3, 'https://i.ebayimg.com/images/g/QlAAAOSwAPRlsjGA/s-l1600.webp'),
('For Honda Car Floor Mats All Models Waterproof Custom Front & Rear Carpet Liners', 12, 150, 3, 'https://i.ebayimg.com/images/g/qb0AAOSwm8ZmVFu9/s-l960.webp'),
('Chrome 7/8 inch Motorcycle Handlebar Drag Bar For Honda Yamaha Kawasaki Suzuki', 6, 75, 3, 'https://i.ebayimg.com/images/g/gFsAAOSweR9fvxqm/s-l1600.webp'),
('Fit For Triumph Trident 660 2021 Tail Tidy Fender Eliminator Plate Rear License', 4, 90, 3, 'https://i.ebayimg.com/images/g/vUgAAOSwuRhm9dwd/s-l960.webp'),
('Honda 15400-PLM-A02 Oil Filter', 20, 25, 3, 'https://i.ebayimg.com/images/g/-NQAAOSwRjpm5QD4/s-l1600.webp'),
('Fuel Filter-ST, VIN: L Mopar 68157291AA', 15, 35, 3, 'https://i.ebayimg.com/images/g/iKwAAOSw-XFkXIpf/s-l1600.webp'),
('Budge 600 Denier Waterproof Boat Cover | Fits Jumbo Hard Top Boats | 6 Sizes', 3, 300, 3, 'https://i.ebayimg.com/images/g/SiEAAOSwUyZeqzum/s-l960.webp'),
('W PRO 85mm GPS Speedometer 120 MPH Waterproof For Car Marine Boat Truck Harley', 5, 120, 3, 'https://i.ebayimg.com/images/g/mzYAAOSw0OdjkwST/s-l1600.webp'),
('EliteShield 4 Bow Bimini Top Replacement Canvas Only Cover. 96" L 91"-96" W.', 2, 220, 3, 'https://i.ebayimg.com/images/g/PgQAAOSwDgVm8hDc/s-l1600.webp'),
('Bow Bimini Top Replacement Canvas W/Boot Cover Boat No Frame UV Resistant', 1, 180, 3, 'https://i.ebayimg.com/images/g/ZJ8AAOSwPIlj1zcT/s-l1600.webp'),
('Apple Watch Ultra 2 2nd Generation GPS & Cellular 49mm - Titanium - Excellent', 10, 750, 4, 'https://i.ebayimg.com/images/g/IFgAAOSwoellSWxh/s-l960.webp'),
('Apple AirPods Pro 2nd Generation with MagSafe Wireless Charging Case - White', 20, 250, 4, 'https://i.ebayimg.com/images/g/O7cAAOSw8M9m8tES/s-l1600.webp'),
('NutriBullet Slow Masticating Juicer Machine 150 Watts, Charcoal Black', 7, 130, 4, 'https://i.ebayimg.com/images/g/mw8AAOSw1BxmWOnA/s-l1600.webp'),
('Cuisinart 4 Qt. Stainless Steel Deep Fryer with 2.3LB Food Capacity - CDF200', 4, 200, 4, 'https://i.ebayimg.com/images/g/YeAAAOSwmGdmqsKd/s-l1600.webp'),
('Braun MultiServe Drip Coffee Maker, Black - KF9050', 6, 170, 4, 'https://i.ebayimg.com/images/g/MIgAAOSwlupls8sF/s-l960.webp'),
('Ninja GR100 Sizzle Smokeless Indoor Grill', 3, 220, 4, 'https://i.ebayimg.com/images/g/0awAAOSwHPRmzKIh/s-l960.webp'),
('Milwaukee 2663-80 M18 18V 1/2" Impact Wrench - Bare Tool - Reconditioned', 8, 320, 4, 'https://i.ebayimg.com/images/g/3UIAAOSw1admazfU/s-l1600.webp'),
('Milwaukee 2730-80 M18 FUEL 18V 6-1/2" Circular Saw - Reconditioned', 5, 350, 4, 'https://i.ebayimg.com/images/g/l7AAAOSwotVlP~eG/s-l960.webp'),
('Core i7 Gaming PC - 32GB RAM / 1TB SSD / 1TB HDD / Nvidia RTX 3050 Windows 10', 2, 1500, 4, 'https://i.ebayimg.com/images/g/kAYAAOSwXNdmK9ns/s-l1600.webp'),
('Soundcore Space One Wireless Over-Ear Headphones 40H ANC Playtime', 12, 100, 4, 'https://i.ebayimg.com/images/g/p3sAAOSwJOtlshJs/s-l1600.webp'),
('Battle Spirits Saga TCG Set of 6 Starter Decks', 20, 80, 5, 'https://i.ebayimg.com/images/g/DFAAAOSwHuJmIa9l/s-l960.webp'),
('One Piece 500 Years', 15, 120, 5, 'https://i.ebayimg.com/images/g/HH8AAOSwsCJmJyHv/s-l1600.webp'),
('Draft Booster Box 36 ct. Crimson Vow Innistrad VOW MTG NEW', 10, 130, 5, 'https://i.ebayimg.com/images/g/RwYAAOSwUQJhil10/s-l960.webp'),
('Pokemon TCG', 25, 60, 5, 'https://i.ebayimg.com/images/g/V9EAAOSwonJmmYyu/s-l1600.webp'),
('Topps Zerocool Stranger Things Season 4 2023', 8, 140, 5, 'https://i.ebayimg.com/images/g/BGMAAOSwG~5lQlKe/s-l960.webp'),
('Stranger Things Season 4', 5, 200, 5, 'https://i.ebayimg.com/images/g/SNoAAOSwCWJlGEQe/s-l960.webp'),
('Pokemon TCG Astral Radiance Factory Sealed Elite Trainer Box', 30, 100, 6, 'https://i.ebayimg.com/images/g/tFoAAOSw6HBijQk2/s-l960.webp'),
('LOUIS VUITTON EPI SAINT JACQUES GM SHOPPER SHOULDER BAG SHOULDER BAG BAG', 3, 2200, 6, 'https://i.ebayimg.com/thumbs/images/g/mh4AAOSwtzRm8qr5/s-l960.webp'),
('LOUIS VUITTON ORIGINAL LUCILLE MONOGRAM MINI BAG SHOULDER BAG', 5, 1800, 6, 'https://i.ebayimg.com/thumbs/images/g/X1MAAOSww5dmqN5A/s-l960.webp'),
('LOUIS VUITTON VERNIS SUTTON READ SHOPPING SHOULDER BAG SHOULDER BAG BAG RED', 4, 2400, 6, 'https://i.ebayimg.com/thumbs/images/g/PQsAAOSwnZxlQLsJ/s-l960.webp'),
('LOUIS VUITTON Sonatine Handbag Tote Bag M51902 MONOGRAM Brown Used Japan F/S', 6, 1900, 6, 'https://i.ebayimg.com/thumbs/images/g/OjcAAOSwj8lm4n8R/s-l960.webp'),
('CHANEL Timeless Bag Large Brown', 2, 3500, 6, 'https://i.ebayimg.com/thumbs/images/g/d3AAAOSwb3Jmy1Wu/s-l960.webp'),
('3D Wooden Montessori Kid''s Educational Jigsaw Puzzle Toys For Toddler & Children', 15, 45, 7, 'https://i.ebayimg.com/images/g/C2oAAOSw-YdlX3Pz/s-l960.webp'),
('Lego Dungeons & Dragons D&D Minifigures', 10, 55, 7, 'https://i.ebayimg.com/images/g/t~AAAOSwPXxmiK~h/s-l960.webp'),
('LEGO TECHNIC: Mercedes-AMG F1', 5, 130, 7, 'https://i.ebayimg.com/images/g/MCoAAOSwt0xm5pHm/s-l960.webp');


INSERT INTO ACCOUNT ([user_name], [password], [role])
VALUES 
('user1', 'password123', 'USER'),
('user2', 'password234', 'USER'),
('user3', 'password345', 'ADMIN'),
('user4', 'password456', 'USER'),
('user5', 'password567', 'ADMIN'),
('user6', 'password678', 'USER'),
('user7', 'password789', 'USER'),
('user8', 'password890', 'USER'),
('user9', 'password901', 'USER'),
('user10', 'password012', 'ADMIN'),
('user11', 'password111', 'USER'),
('user12', 'password222', 'USER'),
('user13', 'password333', 'ADMIN'),
('user14', 'password444', 'USER'),
('user15', 'password555', 'USER'),
('user16', 'password666', 'ADMIN'),
('user17', 'password777', 'USER'),
('user18', 'password888', 'USER'),
('user19', 'password999', 'USER'),
('user20', 'password000', 'ADMIN'),
('user21', 'password1234', 'USER'),
('user22', 'password2345', 'USER'),
('user23', 'password3456', 'ADMIN'),
('user24', 'password4567', 'USER'),
('user25', 'password5678', 'USER'),
('user26', 'password6789', 'ADMIN'),
('user27', 'password7890', 'USER'),
('user28', 'password8901', 'USER'),
('user29', 'password9012', 'USER'),
('user30', 'password0123', 'ADMIN'),
('user31', 'password2341', 'USER'),
('user32', 'password3452', 'USER'),
('user33', 'password4563', 'ADMIN'),
('user34', 'password5674', 'USER'),
('user35', 'password6785', 'USER'),
('user36', 'password7896', 'USER'),
('user37', 'password8907', 'ADMIN'),
('user38', 'password9018', 'USER'),
('user39', 'password0129', 'USER'),
('user40', 'password1230', 'ADMIN'),
('user41', 'password2346', 'USER'),
('user42', 'password3457', 'USER'),
('user43', 'password4568', 'ADMIN'),
('user44', 'password5679', 'USER'),
('user45', 'password6780', 'USER'),
('user46', 'password7891', 'USER'),
('user47', 'password8902', 'ADMIN'),
('user48', 'password9013', 'USER'),
('user49', 'password0124', 'USER'),
('user50', 'password1235', 'ADMIN');


