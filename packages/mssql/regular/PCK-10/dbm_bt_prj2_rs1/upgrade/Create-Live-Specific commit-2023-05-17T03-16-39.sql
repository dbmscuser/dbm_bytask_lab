
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;
GO


PRINT N'Creating SqlTable [dbo].[Table_1]...';


GO
CREATE TABLE [dbo].[Table_1] (
    [col1] NCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED ([col1] ASC)
);


GO
PRINT N'Creating SqlTable [dbo].[Table_2]...';


GO
CREATE TABLE [dbo].[Table_2] (
    [col1] NCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
);


GO
PRINT N'Creating SqlTable [dbo].[Table_3]...';


GO
CREATE TABLE [dbo].[Table_3] (
    [col1] NCHAR (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    CONSTRAINT [PK_Table_3] PRIMARY KEY CLUSTERED ([col1] ASC)
);


GO
PRINT N'Update complete.';


GO

BEGIN TRANSACTION;




INSERT INTO [dbo].[Table_3] ([col1])
VALUES ('1         ');





INSERT INTO [dbo].[Table_1] ([col1])
VALUES ('1         ');

COMMIT;