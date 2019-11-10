
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/09/2019 20:36:22
-- Generated from EDMX file: D:\Apps\.net-entity-framework\EntityFrameWork\Entity\ExampleModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EntityFrameWork];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'users'
CREATE TABLE [dbo].[users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Passwords'
CREATE TABLE [dbo].[Passwords] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [user_Id] int  NOT NULL
);
GO

-- Creating table 'OwnedCars'
CREATE TABLE [dbo].[OwnedCars] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Model] nvarchar(max)  NOT NULL,
    [Make] nvarchar(max)  NOT NULL,
    [Year] nvarchar(max)  NOT NULL,
    [Miles] nvarchar(max)  NOT NULL,
    [PlateNumber] nvarchar(max)  NOT NULL,
    [user_Id] int  NOT NULL
);
GO

-- Creating table 'Works'
CREATE TABLE [dbo].[Works] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [zip] nvarchar(max)  NOT NULL,
    [phone] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [user_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'users'
ALTER TABLE [dbo].[users]
ADD CONSTRAINT [PK_users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Passwords'
ALTER TABLE [dbo].[Passwords]
ADD CONSTRAINT [PK_Passwords]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OwnedCars'
ALTER TABLE [dbo].[OwnedCars]
ADD CONSTRAINT [PK_OwnedCars]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Works'
ALTER TABLE [dbo].[Works]
ADD CONSTRAINT [PK_Works]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [user_Id] in table 'Passwords'
ALTER TABLE [dbo].[Passwords]
ADD CONSTRAINT [FK_usersPasswords]
    FOREIGN KEY ([user_Id])
    REFERENCES [dbo].[users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_usersPasswords'
CREATE INDEX [IX_FK_usersPasswords]
ON [dbo].[Passwords]
    ([user_Id]);
GO

-- Creating foreign key on [user_Id] in table 'OwnedCars'
ALTER TABLE [dbo].[OwnedCars]
ADD CONSTRAINT [FK_usersOwnedCars]
    FOREIGN KEY ([user_Id])
    REFERENCES [dbo].[users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_usersOwnedCars'
CREATE INDEX [IX_FK_usersOwnedCars]
ON [dbo].[OwnedCars]
    ([user_Id]);
GO

-- Creating foreign key on [user_Id] in table 'Works'
ALTER TABLE [dbo].[Works]
ADD CONSTRAINT [FK_usersWork]
    FOREIGN KEY ([user_Id])
    REFERENCES [dbo].[users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_usersWork'
CREATE INDEX [IX_FK_usersWork]
ON [dbo].[Works]
    ([user_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------