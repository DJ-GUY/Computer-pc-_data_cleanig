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
--here we inserting dim tables using primary keys from all tables so they can be joined  

DROP TABLE [computer_std_raw].[dbo].[fact_price_data]
CREATE TABLE [computer_std_raw].[dbo].[fact_price_data](
    [SalesID] INT IDENTITY (1,1) PRIMARY KEY,
    [DateID] INT,
    [CustomerID] INT,
    [ChannelID] INT,
    [PcID] INT,
    [PaymentID] INT,
    [PlaceID] INT,
    [StoreID] INT,

	[Cost_Price] INT NOT NULL,
	[Sale_Price] INT NOT NULL,
	[Discount_Amount] INT NOT NULL,
	[Finance_Amount] NVARCHAR(50) NOT NULL,
	[Credit_Score] INT NOT NULL,
	[Cost_of_Repairs] NVARCHAR(50) NOT NULL,
	[Total_Sales_per_Employee] INT NULL,
	[PC_market_price] INT NOT NULL,

    CONSTRAINT fk_channelID
        FOREIGN KEY (ChannelID)
        REFERENCES [computer_std_raw].[dbo].[dim_channel_data](ChannelID),

    CONSTRAINT fk_CustomerID
        FOREIGN KEY (CustomerID)
        REFERENCES [computer_std_raw].[dbo].[dim_customer_data](CustomerID),

    CONSTRAINT fk_DateID
        FOREIGN KEY (DateID)
        REFERENCES [computer_std_raw].[dbo].[dim_date_data](DateID),

    CONSTRAINT fk_PcID
        FOREIGN KEY (PcID)
        REFERENCES [computer_std_raw].[dbo].[dim_make_data](PcID),

    CONSTRAINT fk_PaymentID
        FOREIGN KEY (PaymentID)
        REFERENCES [computer_std_raw].[dbo].[dim_payment_data](PaymentID),

    CONSTRAINT fk_PlaceID
        FOREIGN KEY (PlaceID)
        REFERENCES [computer_std_raw].[dbo].[dim_place_data](PlaceID),

    CONSTRAINT fk_StoreID
        FOREIGN KEY (StoreID)
        REFERENCES [computer_std_raw].[dbo].[dim_store_data](StoreID)
);

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