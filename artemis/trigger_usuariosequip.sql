USE [AdvancedArtemisDB_FORM]
GO
/****** Object:  Trigger [dbo].[tr_control]    Script Date: 20/11/2017 17:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[tr_control]
   ON  [dbo].[UsuariosAsignacionEstaciones]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @usuario nvarchar
	declare @totalEstaciones as int


	select @usuario = fk_usuarios_login from INSERTED

	if (@usuario = 'monica.barrios') 
	begin
		select @totalEstaciones = count(*) from UsuariosAsignacionEstaciones where fk_usuarios_login = 'monica.barrios'

		if (@totalEstaciones > 583) 
		begin 
			raiserror ('Bug detectado',10,1)
			rollback transaction
		end

	end
	

END