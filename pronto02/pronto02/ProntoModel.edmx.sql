
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/25/2015 17:03:00
-- Generated from EDMX file: C:\Users\Home\Source\Repos\pronto2\pronto02\pronto02\ProntoModel.edmx
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

IF OBJECT_ID(N'[dbo].[FK__PRODUCTO__Catego__02FC7413]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PRODUCTO] DROP CONSTRAINT [FK__PRODUCTO__Catego__02FC7413];
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
IF OBJECT_ID(N'[dbo].[Vn_Categoria]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vn_Categoria];
GO
IF OBJECT_ID(N'[dbo].[Proveedor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Proveedor];
GO
IF OBJECT_ID(N'[dbo].[Contacto]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contacto];
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
    [Id] decimal(10,0) IDENTITY(1,1) NOT NULL,
    [cod_barras] varchar(40)  NULL,
    [Nombre] varchar(50)  NOT NULL,
    [Precio_costo] decimal(10,2)  NOT NULL,
    [Precio_venta] decimal(10,2)  NOT NULL,
    [Ganancia] decimal(10,2)  NOT NULL,
    [Stock] decimal(10,0)  NOT NULL,
    [CATEGORIA_id] int  NULL
);
GO

-- Creating table 'Vn_Categoria'
CREATE TABLE [dbo].[Vn_Categoria] (
    [Categoria] int  NOT NULL,
    [Nombre] varchar(50)  NOT NULL,
    [Cantidad] int  NULL
);
GO

-- Creating table 'Proveedor'
CREATE TABLE [dbo].[Proveedor] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(100)  NOT NULL,
    [Direccion] nvarchar(50)  NOT NULL,
    [Telefono] nvarchar(40)  NOT NULL,
    [CUIT] nvarchar(50)  NULL,
    [Razon_Social] nvarchar(50)  NULL
);
GO

-- Creating table 'Contacto'
CREATE TABLE [dbo].[Contacto] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(100)  NOT NULL,
    [Direccion] nvarchar(40)  NOT NULL,
    [Telefono] nvarchar(40)  NOT NULL
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

-- Creating primary key on [Id] in table 'Proveedor'
ALTER TABLE [dbo].[Proveedor]
ADD CONSTRAINT [PK_Proveedor]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Contacto'
ALTER TABLE [dbo].[Contacto]
ADD CONSTRAINT [PK_Contacto]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CATEGORIA_id] in table 'PRODUCTO'
ALTER TABLE [dbo].[PRODUCTO]
ADD CONSTRAINT [FK__PRODUCTO__Catego__02FC7413]
    FOREIGN KEY ([CATEGORIA_id])
    REFERENCES [dbo].[CATEGORIA]
        ([id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__PRODUCTO__Catego__02FC7413'
CREATE INDEX [IX_FK__PRODUCTO__Catego__02FC7413]
ON [dbo].[PRODUCTO]
    ([CATEGORIA_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------