SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;
GO


PRINT N'Dropping SqlTable [dbo].[table_1]...';


GO
DROP TABLE [dbo].[table_1];


GO
PRINT N'Dropping SqlTable [dbo].[table_4]...';


GO
DROP TABLE [dbo].[table_4];


GO
PRINT N'Creating SqlTable [dbo].[Table_5]...';


GO
CREATE TABLE [dbo].[Table_5] (
    [col1] NCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);


GO
PRINT N'Update complete.';


GO
