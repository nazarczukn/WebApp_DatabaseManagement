USE [Homework1]
GO

/****** Object:  Table [dbo].[MOVIES]    Script Date: 05.05.2021 18:14:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MOVIES](
	[MOVIE_ID] [int] NOT NULL,
	[MOVIE_TITLE] [varchar](100) NOT NULL,
	[RELEASE_DATE] [date] NOT NULL,
	[PRICE] [money] NOT NULL,
	[RANKING] [decimal](18, 0) NOT NULL,
	[GENRE] [varchar](20) NULL,
 CONSTRAINT [PK_MOVIES] PRIMARY KEY CLUSTERED 
(
	[MOVIE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ORDERS](
	[ORDER_ID] [int] NOT NULL,
	[ORDER_DATE] [date] NOT NULL,
	[MOVIE_ID] [int] NOT NULL,
	[NET_AMOUNT] [money] NOT NULL,
	[DISCOUNT] [decimal](18, 0) NULL,
	[GROSS_AMOUNT] [money] NOT NULL,
 CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED 
(
	[ORDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_MOVIES] FOREIGN KEY([MOVIE_ID])
REFERENCES [dbo].[MOVIES] ([MOVIE_ID])
GO

ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_MOVIES]
GO

--sample data insertion
insert into MOVIES values('1','Forest Gump','06.01.1994','11.5','12','Drama');
insert into MOVIES values('2','Mroczny rycerz','01.01.2008','12','3','Action');
insert into MOVIES values('3','Skazani na Shawshank','01.01.1994','15.5','1','Drama');
insert into MOVIES values('4','Pump Fiction','11.01.1994','11.5','7','Drama');
insert into MOVIES values('5','Matrix','05.01.1999','14','15','Action');
insert into MOVIES values('6','Lista Schindlera','01.01.1993','10','8','History');
insert into MOVIES values('7','Parasite','30.05.2015','15','19','Thriller');
insert into MOVIES values('8','Hamilton','11.07.2020','12','21','Hstory');
