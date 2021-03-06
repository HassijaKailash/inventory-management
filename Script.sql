USE [master]
GO
/****** Object:  Table [dbo].[InventoryMaster]    Script Date: 10-12-2021 03:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Price] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_ProductMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryTransaction]    Script Date: 10-12-2021 03:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryTransaction](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[InventoryId] [int] NOT NULL,
	[Operation] [nvarchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_InventoryTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_InventoryMaster_Delete]    Script Date: 10-12-2021 03:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[sp_InventoryMaster_Delete]  (   @Id INT    )  
  AS  BEGIN     
   DECLARE @ErrorMessage  VARCHAR(MAX),@ErrorProcedure VARCHAR(255),@ErrorSeverity  INT,@ErrorState  INT      ,@ErrorLine   INT        
   BEGIN TRY    
	 DELETE InventoryMaster    
	 WHERE Id = @Id        
	END TRY     
	BEGIN CATCH 
	SELECT  @ErrorMessage  = ERROR_MESSAGE(),@ErrorSeverity  = ERROR_SEVERITY(),@ErrorProcedure = ERROR_PROCEDURE(),@ErrorState  = ERROR_STATE(),@ErrorLine   = ERROR_LINE()      
	SET @ErrorMessage = 'Procedure: ' + @ErrorProcedure + ' ' +     @ErrorMessage + ' Line: ' + CONVERT(VARCHAR(20),@ErrorLine)
	RAISERROR ( @ErrorMessage, @ErrorSeverity, @ErrorState)        
	END CATCH  
	END 
GO
/****** Object:  StoredProcedure [dbo].[sp_InventoryMaster_GetAll]    Script Date: 10-12-2021 03:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create PROCEDURE [dbo].[sp_InventoryMaster_GetAll]    
  AS  BEGIN     
   DECLARE @ErrorMessage  VARCHAR(MAX),@ErrorProcedure VARCHAR(255),@ErrorSeverity  INT,@ErrorState  INT      ,@ErrorLine   INT        
   BEGIN TRY    
	 Select * from InventoryMaster        
	END TRY     
	BEGIN CATCH 
	SELECT  @ErrorMessage  = ERROR_MESSAGE(),@ErrorSeverity  = ERROR_SEVERITY(),@ErrorProcedure = ERROR_PROCEDURE(),@ErrorState  = ERROR_STATE(),@ErrorLine   = ERROR_LINE()      
	SET @ErrorMessage = 'Procedure: ' + @ErrorProcedure + ' ' +     @ErrorMessage + ' Line: ' + CONVERT(VARCHAR(20),@ErrorLine)
	RAISERROR ( @ErrorMessage, @ErrorSeverity, @ErrorState)        
	END CATCH  
	END 
GO
/****** Object:  StoredProcedure [dbo].[sp_InventoryMaster_GetById]    Script Date: 10-12-2021 03:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  create PROCEDURE [dbo].[sp_InventoryMaster_GetById]  (@Id INT)  
  AS  BEGIN     
   DECLARE @ErrorMessage  VARCHAR(MAX),@ErrorProcedure VARCHAR(255),@ErrorSeverity  INT,@ErrorState  INT      ,@ErrorLine   INT        
   BEGIN TRY    
	 Select * from InventoryMaster    
	 WHERE Id = @Id        
	END TRY     
	BEGIN CATCH 
	SELECT  @ErrorMessage  = ERROR_MESSAGE(),@ErrorSeverity  = ERROR_SEVERITY(),@ErrorProcedure = ERROR_PROCEDURE(),@ErrorState  = ERROR_STATE(),@ErrorLine   = ERROR_LINE()      
	SET @ErrorMessage = 'Procedure: ' + @ErrorProcedure + ' ' +     @ErrorMessage + ' Line: ' + CONVERT(VARCHAR(20),@ErrorLine)
	RAISERROR ( @ErrorMessage, @ErrorSeverity, @ErrorState)        
	END CATCH  
	END 
GO
/****** Object:  StoredProcedure [dbo].[sp_InventoryMaster_Insert]    Script Date: 10-12-2021 03:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  CREATE PROCEDURE [dbo].[sp_InventoryMaster_Insert]  (@Name NVARCHAR (100),  @Description NVARCHAR (1000),  @Price DECIMAL (18,2),  @Quantity INT   )  AS  
  BEGIN     
  DECLARE @ErrorMessage  VARCHAR(MAX),@ErrorProcedure VARCHAR(255),@ErrorSeverity  INT,@ErrorState  INT,@ErrorLine   INT        
  BEGIN TRY  
  INSERT INTO InventoryMaster(Description,Name,Price,Quantity,CreatedAt)
	VALUES    (@Description,@Name,@Price,@Quantity,GETDATE())

	select SCOPE_IDENTITY();
	END TRY      
	BEGIN CATCH
	SELECT  @ErrorMessage  = ERROR_MESSAGE()      ,@ErrorSeverity  = ERROR_SEVERITY()      ,@ErrorProcedure = ERROR_PROCEDURE()      ,@ErrorState  = ERROR_STATE()      ,@ErrorLine   = ERROR_LINE()      
	SET @ErrorMessage = 'Procedure: ' + @ErrorProcedure + space(1) +     @ErrorMessage + ' Line: ' + CONVERT(VARCHAR(20),@ErrorLine)              
	RAISERROR ( @ErrorMessage, @ErrorSeverity, @ErrorState)        
	END CATCH  
	END 
GO
/****** Object:  StoredProcedure [dbo].[sp_InventoryMaster_Update]    Script Date: 10-12-2021 03:06:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[sp_InventoryMaster_Update]  (@Id INT,@Name NVARCHAR (100),  @Description NVARCHAR (1000),  @Price DECIMAL (18,2),  @Quantity INT   )  AS  
  BEGIN     
  DECLARE @ErrorMessage  VARCHAR(MAX),@ErrorProcedure VARCHAR(255),@ErrorSeverity  INT,@ErrorState  INT,@ErrorLine   INT        
  BEGIN TRY    
	UPDATE InventoryMaster    
		SET	Description = @Description,     
			Name = @Name,     
			Price = @Price,     
			Quantity = @Quantity    
	WHERE Id = @Id        
	END TRY     
	BEGIN CATCH 
	SELECT  @ErrorMessage  = ERROR_MESSAGE()      ,@ErrorSeverity  = ERROR_SEVERITY()      ,@ErrorProcedure = ERROR_PROCEDURE()      ,@ErrorState  = ERROR_STATE()      ,@ErrorLine   = ERROR_LINE()      
	SET @ErrorMessage = 'Procedure: ' + @ErrorProcedure + ' ' +     @ErrorMessage + ' Line: ' + CONVERT(VARCHAR(20),@ErrorLine)              
	RAISERROR ( @ErrorMessage, @ErrorSeverity, @ErrorState)        
	END CATCH  
	END  
GO
