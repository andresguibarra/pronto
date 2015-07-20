
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/19/2015 23:33:38
-- Generated from EDMX file: C:\Users\Home\Source\Repos\ProntoNuevo\pronto02\pronto02\ProntoModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PRONTODB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__PRODUCTO__Catego__5AEE82B9]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PRODUCTO] DROP CONSTRAINT [FK__PRODUCTO__Catego__5AEE82B9];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[CATEGORIA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CATEGORIA];
GO
IF OBJECT_ID(N'[dbo].[PRODUCTO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PRODUCTO];
GO
IF OBJECT_ID(N'[PRONTODBModelStoreContainer].[Vn_Categoria]', 'U') IS NOT NULL
    DROP TABLE [PRONTODBModelStoreContainer].[Vn_Categoria];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CATEGORIA'
CREATE TABLE [dbo].[CATEGORIA] (
    [id] int IDENTITY(1,1) NOT NULL,
    [nombre] varchar(50)  NOT NULL
);
GO

-- Creating table 'PRODUCTO'
CREATE TABLE [dbo].[PRODUCTO] (
    [cod_barras] nvarchar(max)  NOT NULL,
    [Nombre] varchar(50)  NOT NULL,
    [Precio_costo] decimal(10,2)  NOT NULL,
    [Precio_venta] decimal(10,2)  NOT NULL,
    [Ganancia] decimal(10,2)  NOT NULL,
    [Stock] decimal(10,0)  NOT NULL,
    [Id] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [CATEGORIA_id] int  NOT NULL
);
GO

-- Creating table 'Vn_Categoria'
CREATE TABLE [dbo].[Vn_Categoria] (
    [Categoria] int  NOT NULL,
    [Nombre] varchar(50)  NOT NULL,
    [Cantidad] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'CATEGORIA'
ALTER TABLE [dbo].[CATEGORIA]
ADD CONSTRAINT [PK_CATEGORIA]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Id] in table 'PRODUCTO'
ALTER TABLE [dbo].[PRODUCTO]
ADD CONSTRAINT [PK_PRODUCTO]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Categoria], [Nombre] in table 'Vn_Categoria'
ALTER TABLE [dbo].[Vn_Categoria]
ADD CONSTRAINT [PK_Vn_Categoria]
    PRIMARY KEY CLUSTERED ([Categoria], [Nombre] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CATEGORIA_id] in table 'PRODUCTO'
ALTER TABLE [dbo].[PRODUCTO]
ADD CONSTRAINT [FK__PRODUCTO__Catego__25869641]
    FOREIGN KEY ([CATEGORIA_id])
    REFERENCES [dbo].[CATEGORIA]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__PRODUCTO__Catego__25869641'
CREATE INDEX [IX_FK__PRODUCTO__Catego__25869641]
ON [dbo].[PRODUCTO]
    ([CATEGORIA_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------