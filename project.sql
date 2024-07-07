USE [master]
GO
Create database [Project]
GO
USE [Project]
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[avatar] [varchar](255) DEFAULT N'img/avata.jpg',
    [user] [varchar](255) NOT NULL,
    [pass] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[amount] [money] NULL,
    [bought] [int] NULL,
	[Address] [varchar](255) NULL,
	[status] [int] DEFAULT 0,
    [isAdmin] [int] NULL,
    PRIMARY KEY CLUSTERED([id]ASC)
);

CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
	PRIMARY KEY CLUSTERED ([cid] ASC)
);

CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,	
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[sold] [int] NULL,
	[releaseDate] [date] NULL,
	[description] [nvarchar](max) NULL,
	[rate][float],
	[cateID] [int] NULL,
	CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID]) REFERENCES [dbo].[Category]([cid])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO

CREATE TABLE [dbo].[Order](
	[id] [int]  IDENTITY(1,1),
	[aid] [int],
	[date] [date],
	[totalMoney] [money],
	[status] [int],
	PRIMARY KEY CLUSTERED([id]),
	foreign key ([aid]) references [dbo].[Account]([id]),
) ON [PRIMARY]

CREATE TABLE [dbo].[OrderLine](
	[oid] [int],
	[pid] [int],
	[quantity] [float],
	[price] [float],
	PRIMARY KEY CLUSTERED ([oid], [pid]),
	foreign key ([oid]) references [dbo].[Order]([id]),
	foreign key ([pid]) references [dbo].[product]([id]),
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Comment](
	[id] [int]  IDENTITY(1,1),
	[aid] [int],
	[pid] [int],
	[content] [nvarchar](max),
	[voted] [float],
	PRIMARY KEY CLUSTERED([id],[aid],[pid]),
	foreign key ([aid]) references [dbo].[Account]([id]),
	foreign key ([pid]) references [dbo].[product]([id]),
) ON [PRIMARY]
Go
CREATE TABLE [dbo].[Block](
	[id] [int]  IDENTITY(1,1),
	[aid] [int],
	PRIMARY KEY CLUSTERED([id],[aid]),
	foreign key ([aid]) references [dbo].[Account]([id]),
	CONSTRAINT [UC_aid] UNIQUE ([aid])
) ON [PRIMARY]
Go
SET IDENTITY_INSERT [dbo].[Account] ON 
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [isAdmin]) VALUES (1, N'Admin',  N'1', N'bapthom3@gmail.com', N'0123456789',9999, 0, N'Bac Ninh', 1)
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [isAdmin]) VALUES (2, N'Admin1', N'1', N'bapthom3@gmail.com',N'0987654321',800, 1500, N'Ha Noi', 0)
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [isAdmin]) VALUES (3, N'Admin2', N'123456', N'admin2@gmail.com',N'0123654789',600, 2000, N'Sơn La', 0)
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [isAdmin]) VALUES (4, N'Admin3', N'123456', N'admin3@gmail.com',N'0987456321',1000, 1500, N'Bac Giang', 0)
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [isAdmin]) VALUES (5, N'Admin4', N'123456', N'admin4@gmail.com',N'0147258369',2000, 2250, N'Hai Phong', 0)
INSERT [dbo].[Account] ([id], [user], [pass],[email] ,[phone], [amount], [bought], [Address], [isAdmin]) VALUES (6, N'Admin5', N'123456', N'admin5@gmail.com',N'0963258741',1500, 1000, N'Hung Yen', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Giày Adidas')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Giày Nike')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Giày Skechers')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Giày Converse')
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (1, N'Giày Thể Thao Adidas Dame 7 Solor Red G55199', N'img/adidas1.png', 55, 2000, 1000, CAST(N'2023-06-12' AS Date), N'Giày Thể Thao Adidas Dame 7 Solor Red G55199 Màu Đỏ Đen là đôi giày dành cho nam đến từ thương hiệu Adidas nổi tiếng. Sở hữu gam màu nổi bật cùng chất liệu cao cấp Giày Thể Thao Adidas Dame 7 Solor Red G55199 sẽ mang lại trải nghiệm tuyệt vời cho bạn. ', 4.8, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (2, N'Giày Thể Thao Adidas Ultra 4D Shoes GZ1336', N'img/adidas3.png', 65, 1500, 1200, CAST(N'2023-12-12' AS Date), N'Giày Thể Thao Adidas Ultra 4D Shoes GZ1336 Phối Màu được thiết kế hiện đại, trẻ trung đến từ thương hiệu Adidas nồi tiếng. Mẫu giày này đã nhận được sự khen ngợi của các sneakerhead vì thiết kế thời trang, sự thoải mái lâu dài và vừa vặn.',4.7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (3, N'Giày Thể Thao Skechers Master Glam-Easy Looker 8730043', N'img/skechers3.png', 50, 1500, 800, CAST(N'2023-03-19' AS Date), N'Giày Thể Thao Skechers Master Glam-Easy Looker 8730043 Màu Trắng là đôi giày thời trang nữ đến từ thương hiệu Skechers nồi tiếng của Mỹ. Mẫu giày Skechers được thiết kế theo phong cách năng động, trẻ trung, chất liệu cao cấp bền đẹp và thoải mái khi đi lên chân.',4.5, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (4, N'Giày Thể Thao Nike Air Jordan 1 High OG UNC University', N'img/nike2.png', 100, 1000, 900, CAST(N'2023-03-14' AS Date), N'Giày Thể Thao Nike Air Jordan 1 High OG UNC University Blue 555088-134 575441-134 Màu Xanh Trắng là đôi giày thời trang có thiết kể trẻ trung, năng động đến từ thương hiệu Nike nổi tiếng của Mỹ. Nike Air Jordan 1 High OG UNC University Blue 555088-134 575441-134 được làm từ chất liệu cao cấp mang lại cảm giác thoải mái khi đi lên chân.',4.9, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (5, N'Giày Thể Thao Nam Nike Dunk High Retro SE FB8892-200', N'img/nike1.png', 60, 2000, 1500, CAST(N'2023-01-12' AS Date), N'Giày Thể Thao Nam Nike Dunk High Retro SE FB8892-200 Màu Nâu Trắng là đôi giày thời trang có thiết kế trẻ trung, năng động đến từ thương hiệu Nike nổi tiếng của Mỹ. Đôi giày Nike Dunk High Retro SE FB8892-200 được làm từ chất liệu cao cấp, vừa bền đẹp vừa thoải mái hi sử dụng hàng ngày.',4.8, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (6, N'Giày Thể Thao Adidas Run Falcon 2.0 FY5943', N'img/adidas2.png', 70, 700, 2000, CAST(N'2024-01-30' AS Date), N'Giày Thể Thao Adidas Run Falcon 2.0 FY5943 Màu Đen là đôi giày thời trang với thiết kể mang nét thể thao năng động. Giày Thể Thao Adidas Run Falcon 2.0 FY5943 mang trên mình gam màu thanh lịch cho bạn thêm trẻ trung.',4.6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (7,N'Giày Thể Thao Converse 1970s', N'img/converse3.png', 80, 800, 500, CAST(N'2023-08-15' AS Date), N'Giày Thể Thao Converse 1970s High Black Fire Màu Đen Đỏ sản phẩm đến từ thương hiệu Converse nồi tiếng của Mỹ. Với thiết kế Độc - Lạ - Phá cách, đôi giày đang nhận được sự quan tâm từ rất nhiều các bạn trẻ.',4.4, 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (8, N'Giày Thể Thao Skechers Max Protect', N'img/skechers2.png', 75, 500, 600, CAST(N'2023-11-12' AS Date), N'Giày Thể Thao Skechers Max Protect Màu Đen Xám là đôi giày thời trang đến từ thương hiệu Skechers nồi tiếng của Mỹ. Giày Skechers Max Protect được thiết kể theo phong cách năng động, trẻ trung và phù hợp với nhiều đối tượng.',4.7, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (9,N'Giày Thể Thao Converse Chuck Taylor All Star Cx Explore', N'img/converse1.png', 150, 800, 600, CAST(N'2023-05-21' AS Date), N'Giày Thể Thao Converse Chuck Taylor All Star Cx Explore A03464C Màu Xanh Mint là mẫu giày thể thao đến từ thương hiệu Converse nổi tiếng của Mỹ. Đôi giày thiết kế trẻ trung năng động, được làm từ liệu vải cao cấp giúp người dùng có được sự thoải mái tối đa khi sử dụng.',4.5, 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (10, N'Giày Nike Air Max 97', N'img/nike3.png', 55, 2000, 1250, CAST(N'2024-01-12' AS Date), N'Giày Nike Air Max 97 Black White 921733-006 Màu Đen sở hữu kiểu dáng siêu phong cách là mẫu giày thể thao mới nhất của thương hiệu Nike nổi tiếng. Đôi giày được thiết kế với form thể thao mang đầy nét năng động.',4.8, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (11, N'Giày Thể Thao Skechers Casual D', N'img/skechers1.png', 85, 1500, 1500, CAST(N'2023-05-30' AS Date), N'Giày Thể Thao Skechers Casual D Lites 4.0 Màu Đen Trắng là đôi giày thời trang đến từ thương hiệu Skechers nổi tiếng của Mỹ. Mẫu giày Skechers Casual D Lites 4.0 được thiết kế theo phong cách năng động, trẻ trung và phù hợp với nhiều đối tượng. Nhất là những bạn trẻ yêu thích thể thao thì giày Skechers Casual D Lites 4.0 màu đen trắng sẽ là sự lựa chọn hoàn hảo.',4.9, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (12,N'Giày Thể Thao Converse Chuck Taylor All Star Archival Camo Họa Tiết Camo', N'img/converse2.png', 50, 2500, 800, CAST(N'2022-07-17' AS Date), N'Giày Thể Thao Converse Chuck Taylor All Star Archival Camo Họa Tiết Camo là mẫu giày thể thao đến từ thương hiệu Converse nổi tiếng của Mỹ. Đôi giày thiết kế trẻ trung năng động, được làm từ liệu vải canvas cao cấp giúp người dùng có được sự thoải mái tối đa khi sử dụng.',4.9, 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (13,N'Giày Nike Air Max 95 By You - Brown / Black', N'img/nike4.jpg', 100, 1500, 1800, CAST(N'2023-07-17' AS Date), N'AM95 được lấy cảm hứng từ các thành phần của cơ thể con người và sự tích hợp tinh chỉnh của hình thức và chức năng. Ban đầu được phát triển để chạy hiệu suất, đệm Nike Air có thể nhìn thấy mang lại sự thoải mái cả ngày.',4.6, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (14,N'Giày GIÀY ADIFOM CLIMACOOL', N'img/adidas4.png', 90, 1000, 1600, CAST(N'2023-09-19' AS Date), N'Sản phẩm này có chứa tối thiểu 20% chất liệu tái chế. Bằng cách tái sử dụng các chất liệu đã được tạo ra, chúng tôi góp phần giảm lãng phí và giảm phụ thuộc vào các nguồn tài nguyên hữu hạn, cũng như giảm phát thải từ các sản phẩm mà chúng tôi sản xuất.',4.5, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (15,N'Balance 574 Grey Blue', N'img/converse4.png', 80, 1500, 2000, CAST(N'2023-10-17' AS Date), N'Một trong những mẫu New Balance 574 Classic được nhiều người yêu giày săn đón trong thời gian vừa qua. Đôi New Balance 574 Classic Grey Blue sở hữu nhiều ưu điểm nổi bật mà không phải bất kỳ dòng giày nào cũng có.',4.8, 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (16,N'Giày Sneaker Adidas Nam Ultraboost 22', N'img/adidas5.png', 120, 1500, 2000, CAST(N'2023-12-17' AS Date), N'Bước tiến mới của hệ thống Torsion huyền thoại. Vừa khít đế ngoài cho sải bước đàn hồi.',4.6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (17,N'GIÀY SNEAKER CHỐNG BÁM NƯỚC - LESS TIRING', N'img/skechers4.jpg', 100, 1500, 2000, CAST(N'2023-12-17' AS Date), N'Sản phẩm sử dụng vải cotton chống bám nước, có thiết kế hỗ trợ chuyển động của chân.',4.7, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (18,N'Giày Nike Full Force Low', N'img/nike5.jpg', 110, 500, 2000, CAST(N'2024-01-17' AS Date), N'Một đôi giày mới với sức hấp dẫn trường học cũ — giấc mơ retro của bạn vừa trở thành sự thật. Thiết kế lưng này tham chiếu đến AF-1 cổ điển, sau đó nghiêng về phong cách thập niên 80 với đường khâu throwback và màu sắc lấy cảm hứng từ varsity.',4.6, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (19,N'Giày New Balance 237 Sea Salt Stone Pink', N'img/skechers5.png', 100, 1500, 2000, CAST(N'2021-12-17' AS Date), N'Một trong những mẫu New Balance 574 Classic được nhiều người yêu giày săn đón trong thời gian vừa qua. Đôi New Balance 574 Classic Grey Blue sở hữu nhiều ưu điểm nổi bật mà không phải bất kỳ dòng giày nào cũng có.',4.8, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [quantity] ,[sold], [releaseDate], [description],[rate], [cateID]) VALUES (20,N'Giày Thời Trang Nam Converse Chuck Taylor All Star 1970S Sunflower', N'img/converse5.png', 100, 1500, 2000, CAST(N'2022-12-17' AS Date), N'Đến năm 1970, Chuck Taylor All Star đã phát triển thành một trong những đôi giày bóng rổ tốt nhất từ trước đến nay. Chuck 70 tôn vinh di sản đó bằng cách kết hợp các chi tiết theo phong cách lưu trữ cổ điển, kết hợp với các bản cập nhật tiện nghi hiện đại.',4.7, 4)



SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (1, 2, CAST(N'2020-06-12' AS Date),140,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (2, 1, CAST(N'2021-05-05' AS Date),165,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (3, 1, CAST(N'2021-10-12' AS Date),280,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (4, 3, CAST(N'2021-12-12' AS Date),150,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (5, 1, CAST(N'2022-01-05' AS Date),260,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (6, 4, CAST(N'2022-03-12' AS Date),140,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (7, 5, CAST(N'2022-08-05' AS Date),165,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (8, 3, CAST(N'2022-12-12' AS Date),280,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (9, 2, CAST(N'2023-01-12' AS Date),150,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (10, 4, CAST(N'2023-02-05' AS Date),260,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (11, 3, CAST(N'2023-03-12' AS Date),150,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (12, 1, CAST(N'2023-04-05' AS Date),165,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (13, 1, CAST(N'2023-05-12' AS Date),280,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (14, 3, CAST(N'2023-06-12' AS Date),150,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (15, 1, CAST(N'2023-07-05' AS Date),260,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (16, 3, CAST(N'2023-08-04' AS Date),150,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (17, 5, CAST(N'2023-09-05' AS Date),165,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (18, 3, CAST(N'2023-10-12' AS Date),280,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (19, 2, CAST(N'2023-11-12' AS Date),150,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (20, 4, CAST(N'2023-12-05' AS Date),260,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (21, 2, CAST(N'2024-01-12' AS Date),140,1)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (22, 1, CAST(N'2024-02-05' AS Date),165,0)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (23, 1, CAST(N'2024-03-01' AS Date),280,0)
INSERT [dbo].[Order] ([id], [aid], [date], [totalMoney], [status]) VALUES (24, 3, CAST(N'2024-03-04' AS Date),150,0)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (1,6,2,70)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (2,10,3,55)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (3,6,4,70)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (4,12,3,50)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (5,2,4,65)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (6,6,2,70)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (7,10,3,55)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (8,6,4,70)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (9,12,3,50)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (10,2,4,65)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (11,12,3,50)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (12,10,3,55)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (13,6,4,70)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (14,12,3,50)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (15,2,4,65)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (16,12,3,50)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (17,10,3,55)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (18,6,4,70)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (19,12,3,50)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (20,2,4,65)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (21,6,2,70)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (22,10,3,55)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (23,6,4,70)
INSERT [dbo].[OrderLine]([oid],[pid],[quantity],[price]) VALUES (24,12,3,50)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,1,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,1,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,1,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,1,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,1,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,1,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,1,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,1,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,1,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,1,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,1,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,1,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,2,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,2,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,2,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,2,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,2,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,2,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,2,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,2,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,2,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,2,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,2,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,2,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,3,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,3,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,3,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,3,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,3,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,3,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,3,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,3,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,3,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,3,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,3,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,3,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,4,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,4,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,4,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,4,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,4,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,4,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,4,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,4,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,4,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,4,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,4,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,4,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,5,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,5,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,5,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,5,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,5,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,5,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,5,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,5,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,5,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,5,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,5,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,5,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,6,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,6,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,6,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,6,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,6,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,6,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,6,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,6,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,6,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,6,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,6,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,6,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,7,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,7,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,7,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,7,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,7,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,7,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,7,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,7,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,7,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,7,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,7,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,7,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,8,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,8,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,8,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,8,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,8,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,8,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,8,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,8,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,8,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,8,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,8,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,8,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,9,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,9,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,9,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,9,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,9,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,9,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,9,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,9,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,9,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,9,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,9,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,9,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,10,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,10,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,10,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,10,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,10,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,10,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,10,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,10,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,10,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,10,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,10,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,10,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,11,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,11,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,11,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,11,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,11,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,11,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,11,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,11,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,11,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,11,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,11,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,11,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,12,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,12,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,12,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,12,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,12,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,12,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,12,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,12,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,12,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,12,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,12,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,12,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,13,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,13,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,13,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,13,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,13,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,13,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,13,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,13,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,13,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,13,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,13,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,13,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,14,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,14,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,14,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,14,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,14,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,14,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,14,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,14,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,14,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,14,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,14,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,14,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,15,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,15,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,15,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,15,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,15,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,15,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,15,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,15,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,15,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,15,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,15,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,15,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,16,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,16,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,16,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,16,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,16,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,16,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,16,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,16,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,16,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,16,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,16,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,16,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,17,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,17,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,17,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,17,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,17,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,17,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,17,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,17,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,17,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,17,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,17,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,17,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,18,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,18,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,18,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,18,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,18,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,18,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,18,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,18,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,18,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,18,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,18,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,18,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,19,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,19,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,19,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,19,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,19,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,19,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,19,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,19,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,19,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,19,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,19,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,19,N'sản phẩm rất đẹp',5)

INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,20,N'sản phẩm đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,20,N'sản phẩm oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,20,N'sản phẩm tốt',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,20,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,20,N'Oke',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,20,N'Vip',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (1,20,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (2,20,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (3,20,N'sản phẩm rất đẹp',5)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (4,20,N'sản phẩm rất oke',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (5,20,N'sản phẩm rất đẹp',4)
INSERT INTO [dbo].[Comment]([aid],[pid],[content],[voted]) VALUES (6,20,N'sản phẩm rất đẹp',5)