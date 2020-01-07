USE [WideWorldImportersDW]
GO

/****** Object:  View [Fact].[v_sales_singletable]    Script Date: 2018-12-23 16:47:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW
	[Fact].[v_sales_singletable] 
AS
SELECT
	dimDate.[Calendar Year] 
,	i.Size
,	COUNT(f.[Sale Key]) AS NoOfSales
FROM [Fact].[Sale] AS f
	INNER JOIN Dimension.Date AS dimDate ON
		f.[Invoice Date Key] = dimDate.Date
	INNER JOIN Dimension.[Stock Item] AS i ON
		f.[Stock Item Key] = i.[Stock Item Key]
GROUP BY
	dimDate.[Calendar Year]
,	i.size

GO


