USE [SalesDb]
GO
/****** Object:  StoredProcedure [dbo].[customerswithsalesgtvalue]    Script Date: 1/28/2019 11:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[customerswithsalesgtvalue]
	@minsales decimal(9,2)
as 
begin
	IF @minsales < 0
	begin 
		Print 'sales must be greater than zero!'
		return 1;
	end
	select * from customers
	where sales > @minsales
	order by sales desc;
end
go 
exec [Customerswithsalesgtvalue] -60000