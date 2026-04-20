
---------------------------Date
SELECT * FROM [computer_std_raw].[dbo].[dim_date_data]

 SELECT DISTINCT 
 [Purchase_date]
 ,[Ship_date]
 --INTO [computer_std_raw].[dbo].[dim_date_data]
 FROM [computer_std_raw].[dbo].[1772542271737_pc_data]
 
 --dropping & inserting 
DROP table [computer_std_raw].[dbo].[dim_date_data]
CREATE TABLE [computer_std_raw].[dbo].[dim_date_data](
	[DateID] INT IDENTITY (1,1) PRIMARY KEY,
	[Purchase_date] [datetime2](7) NOT NULL,
	[Ship_date] [nvarchar](100) NOT NULL,
)

INSERT INTO [computer_std_raw].[dbo].[dim_date_data](Purchase_date, Ship_date )
SELECT Purchase_date, Ship_date
FROM [computer_std_raw].[dbo].[1772542271737_pc_data]

--------------------------Customer
SELECT * FROM [computer_std_raw].[dbo].[dim_customer_data]

SELECT DISTINCT
[Customer_Name]
,[Customer_Surname]
,[Customer_Contact_Number]
,[Customer_Email_Address]
  FROM [computer_std_raw].[dbo].[1772542271737_pc_data]

  --dropping & insterting
  DROP TABLE [computer_std_raw].[dbo].[dim_customer_data]

 CREATE TABLE [computer_std_raw].[dbo].[dim_customer_data](
    [CustomerID] INT IDENTITY (1,1) PRIMARY KEY,
	[Customer_Name] [varchar](50) NOT NULL,
	[Customer_Surname] [varchar](50) NOT NULL,
	[Customer_Contact_Number] [nvarchar](50) NOT NULL,
	[Customer_Email_Address] [nvarchar](50) NOT NULL,
	[Sales_Person_Name] [nvarchar](50) NOT NULL
) 
INSERT INTO [computer_std_raw].[dbo].[dim_customer_data] (
Customer_Name, 
Customer_Surname,
Customer_Contact_Number,
Customer_Email_Address,
Sales_Person_Name)
SELECT Customer_Name,Customer_Surname,Customer_Contact_Number,Customer_Email_Address,Sales_Person_Name
FROM [pc_sales_raw_std].[dbo].[1772542271737_pc_raw_data]

--------------------------Channel
SELECT * FROM [computer_std_raw].[dbo].[dim_channel_data]
SELECT DISTINCT 
    [Channel]
FROM [computer_std_raw].[dbo].[1772542271737_pc_data]

--dropping & inserting
DROP table [computer_std_raw].[dbo].[dim_channel_data]
CREATE TABLE [computer_std_raw].[dbo].[dim_channel_data](
    [ChannelID] INT IDENTITY (1,1) PRIMARY KEY,
	[Channel] [nvarchar](100) NOT NULL
)
INSERT INTO [computer_std_raw].[dbo].[dim_channel_data] (Channel )
SELECT Channel
FROM [computer_std_raw].[dbo].[1772542271737_pc_data]
-----------------------------Make
SELECT * FROM [computer_std_raw].[dbo].[dim_make_data]
 SELECT DISTINCT 
       [PC_Make]
      ,[PC_Model]
      ,[Storage_type]
      ,[RAM]
      ,[Storage_Capacity]
      ,[Low]
      
  FROM [computer_std_raw].[dbo].[1772542271737_pc_data]

--dropping & inserting
DROP table [computer_std_raw].[dbo].[dim_make_data]
CREATE TABLE [computer_std_raw].[dbo].[dim_make_data](
	--[PcID] INT IDENTITY (1,1) PRIMARY KEY 
	[PC_Make] [nvarchar](50) NOT NULL,
	[PC_Model] [nvarchar](50) NOT NULL,
	[Storage_type] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NULL,
	[Storage_Capacity] [nvarchar](50) NOT NULL,
	[Low] [nvarchar](50) NOT NULL
)
INSERT INTO [computer_std_raw].[dbo].[dim_make_data] (
PC_Make,PC_Model,
Storage_type,
RAM,
Storage_Capacity,
Low )
SELECT PC_Make,PC_Model,Storage_type, RAM, Storage_Capacity, Low
FROM [computer_std_raw].[dbo].[1772542271737_pc_data]

--------------------------------Payment 
SELECT * FROM [computer_std_raw].[dbo].[dim_payment_data]
SELECT DISTINCT  
       [Payment_Method]
  FROM [computer_std_raw].[dbo].[1772542271737_pc_data]
  
  --dropping & inserting
DROP TABLE [pc_sales_raw_std].[dbo].[dim_payment_data] 
CREATE TABLE [pc_sales_raw_std].[dbo].[dim_payment_data](
	--[PaymentID] INT IDENTITY (1,1) PRIMARY KEY  
    [Payment_Method] [nvarchar](250) NULL
)
INSERT INTO [computer_std_raw].[dbo].[dim_payment_data] (
 Payment_Method)
SELECT  Payment_Method
FROM [computer_std_raw].[dbo].[1772542271737_pc_data]
---------------------------------Place
SELECT * FROM [computer_std_raw].[dbo].[dim_place_data]
SELECT  DISTINCT
       [Continent]
      ,[Country_or_State]
      ,[Province_or_city]
  FROM [computer_std_raw].[dbo].[1772542271737_pc_data]

--dropping & inserting
DROP TABLE [computer_std_raw].[dbo].[dim_place_data]
CREATE TABLE [computer_std_raw].[dbo].[dim_place_data] (
	--[PlaceID] INT IDENTITY  (1,1) PRIMARY KEY 
    [Continent] [nvarchar](50) NOT NULL,
	[Country_or_State] [nvarchar](50) NOT NULL,
	[Province_or_city] [nvarchar](100) NOT NULL
)
INSERT INTO [computer_std_raw].[dbo].[dim_place_data]  (
Continent,
Country_or_State,
Province_or_city)
SELECT Continent, Country_or_State,Province_or_city
FROM [computer_std_raw].[dbo].[1772542271737_pc_data];

----------------------------------Sales
SELECT * FROM [computer_std_raw].[dbo].[dim_sales_data]
SELECT DISTINCT 
      [Sales_Person_Name]
      ,[Sales_Person_Department]
      ,[Sale_Price]
  FROM [computer_std_raw].[dbo].[dim_sales_data]

--dropping & inserting
DROP TABLE [computer_std_raw].[dbo].[dim_sales_data]
CREATE TABLE [computer_std_raw].[dbo].[dim_sales_data](
    --[SalesID] INT IDENTITY (1,1) PRIMARY KEY
	[Sales_Person_Name] [nvarchar](50) NOT NULL,
	[Sales_Person_Department] [nvarchar](50) NOT NULL,
	[Sale_Price] [int] NOT NULL
) 
INSERT INTO [computer_std_raw].[dbo].[dim_sales_data] (
Sales_Person_Name,
Sales_Person_Department,
Sale_Price
)
SELECT Sales_Person_Name, Sales_Person_Department, Sale_Price
FROM [computer_std_raw].[dbo].[1772542271737_pc_data];

------------------------------Store
  SELECT * FROM [pc_sales_raw_std].[dbo].[dim_store_data]
  SELECT DISTINCT 
       [Shop_Name]
      ,[Shop_Age]
  FROM [pc_sales_raw_std].[dbo].[dim_store_data]

--dropping & inserting
DROP TABLE [pc_sales_raw_std].[dbo].[dim_store_data]
CREATE TABLE [pc_sales_raw_std].[dbo].[dim_store_data](
    --[StoreID] INT IDENTITY (1,1) PRIMARY KEY
	[Shop_Name] [varchar] (100) NOT NULL,
	[Shop_Age] [nvarchar] (100) NOT NULL
)
  INSERT INTO [pc_sales_raw_std].[dbo].[dim_store_data] (Shop_Name,Shop_Age)
SELECT Shop_Name,Shop_Age
FROM [computer_std_raw].[dbo].[1772542271737_pc_data];

-------------------fact_price
SELECT * FROM [computer_std_raw].[dbo].[fact_price_data]
SELECT DISTINCT 
      [Cost_Price]
      ,[Sale_Price]
      ,[Discount_Amount]
      ,[Finance_Amount]
      ,[Credit_Score]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_market_price]
  FROM [computer_std_raw].[dbo].[fact_price_data]

---dropping & inserting

DROP TABLE [computer_std_raw].[dbo].[fact_price_data]
CREATE TABLE [computer_std_raw].[dbo].[fact_price_data](
	[Cost_Price] [int] NOT NULL,
	[Sale_Price] [int] NOT NULL,
	[Discount_Amount] [int] NOT NULL,
	[Finance_Amount] [nvarchar](50) NOT NULL,
	[Credit_Score] [int] NOT NULL,
	[Cost_of_Repairs] [nvarchar](50) NOT NULL,
	[Total_Sales_per_Employee] [int] NULL,
	[PC_market_price] [int] NOT NULL
)
INSERT INTO [computer_std_raw].[dbo].[fact_price_data] (
Cost_Price,
Sale_Price,
Discount_Amount,
Credit_Score,
Cost_of_Repairs,
Total_Sales_per_Employee,
PC_market_price
)
SELECT Cost_Price,Sale_Price,Discount_Amount,Credit_Score,Cost_of_Repairs,Total_Sales_per_Employee,PC_market_price
FROM [computer_std_raw].[dbo].[1772542271737_pc_data];




 