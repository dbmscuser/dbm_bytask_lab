
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;
GO


PRINT N'Dropping SqlTable [dbo].[Table_1]...';


GO
DROP TABLE [dbo].[Table_1];


GO
PRINT N'Dropping SqlTable [dbo].[Table_2]...';


GO
DROP TABLE [dbo].[Table_2];


GO
PRINT N'Dropping SqlTable [dbo].[Table_3]...';


GO
DROP TABLE [dbo].[Table_3];


GO
PRINT N'Update complete.';


GO

BEGIN TRANSACTION;

DELETE FROM [dbo].[Table_3]
WHERE 
[col1]='1         ';

DELETE FROM [dbo].[Table_1]
WHERE 
[col1]='1         ';
COMMIT;