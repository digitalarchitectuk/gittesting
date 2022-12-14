USE [Dev]
GO
/****** Object:  StoredProcedure [dbo].[spGet_VendordataByVendorId]    Script Date: 05/09/2022 19:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER procedure [dbo].[spGet_VendordataByVendorId]
     @VendorId nvarchar(10),
	 @City nchar(10)
as 
begin
  set nocount on;

  Begin
  If @VendorId IS NOT NULL and @City Is Not NUll
     
      SELECT        Vendor.Name, Vendor.City, Vendor.Country, Vendor.Status, Contact.ContactId, Contact.Contact_Person, Contact.Email_id, Contact.Phone_Number
      FROM            Vendor INNER JOIN
                         Contact ON  Vendor.VendorId= Contact.VendorId  where Vendor.VendorId=@VendorId;
  
  
  Else 
  IF @VendorId is null and @City is null
  
	   
        Print 'There is a error. NO value was passed in Vendorid and City'
	      Print ERROR_Number();
        Print ERROR_MESSAGE();
		
	    
  
  End

end    

