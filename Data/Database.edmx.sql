
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/13/2016 09:12:37
-- Generated from EDMX file: D:\Visual Studio Proje\kurumsalwebsites\Data\Database.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [database];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserTypeUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSet] DROP CONSTRAINT [FK_UserTypeUser];
GO
IF OBJECT_ID(N'[dbo].[FK_UserPost]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostSet] DROP CONSTRAINT [FK_UserPost];
GO
IF OBJECT_ID(N'[dbo].[FK_PostCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostSet] DROP CONSTRAINT [FK_PostCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductPayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentSet] DROP CONSTRAINT [FK_ProductPayment];
GO
IF OBJECT_ID(N'[dbo].[FK_UserPayment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentSet] DROP CONSTRAINT [FK_UserPayment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSet];
GO
IF OBJECT_ID(N'[dbo].[UserTypeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserTypeSet];
GO
IF OBJECT_ID(N'[dbo].[CategorySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CategorySet];
GO
IF OBJECT_ID(N'[dbo].[PostSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostSet];
GO
IF OBJECT_ID(N'[dbo].[ProductSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductSet];
GO
IF OBJECT_ID(N'[dbo].[PaymentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserTypeId] int  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [surname] nvarchar(max)  NOT NULL,
    [username] nvarchar(max)  NOT NULL,
    [password] nvarchar(max)  NOT NULL,
    [email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserTypeSet'
CREATE TABLE [dbo].[UserTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CategorySet'
CREATE TABLE [dbo].[CategorySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [title] nvarchar(max)  NOT NULL,
    [name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PostSet'
CREATE TABLE [dbo].[PostSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [title] nvarchar(max)  NOT NULL,
    [text] nvarchar(max)  NOT NULL,
    [date] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL,
    [CategoryId] int  NOT NULL
);
GO

-- Creating table 'ProductSet'
CREATE TABLE [dbo].[ProductSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CategoryProductId] int  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [title] nvarchar(max)  NOT NULL,
    [text] nvarchar(max)  NOT NULL,
    [pay] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PaymentSet'
CREATE TABLE [dbo].[PaymentSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ProductId] int  NOT NULL,
    [UserId] int  NOT NULL,
    [pay] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CategoryProductSet'
CREATE TABLE [dbo].[CategoryProductSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Title] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PagesSet'
CREATE TABLE [dbo].[PagesSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CartSet'
CREATE TABLE [dbo].[CartSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [ProductId] int  NOT NULL,
    [Statu] nvarchar(max)  NOT NULL,
    [Court] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserTypeSet'
ALTER TABLE [dbo].[UserTypeSet]
ADD CONSTRAINT [PK_UserTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategorySet'
ALTER TABLE [dbo].[CategorySet]
ADD CONSTRAINT [PK_CategorySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PostSet'
ALTER TABLE [dbo].[PostSet]
ADD CONSTRAINT [PK_PostSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductSet'
ALTER TABLE [dbo].[ProductSet]
ADD CONSTRAINT [PK_ProductSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [PK_PaymentSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CategoryProductSet'
ALTER TABLE [dbo].[CategoryProductSet]
ADD CONSTRAINT [PK_CategoryProductSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PagesSet'
ALTER TABLE [dbo].[PagesSet]
ADD CONSTRAINT [PK_PagesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [PK_CartSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserTypeId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [FK_UserTypeUser]
    FOREIGN KEY ([UserTypeId])
    REFERENCES [dbo].[UserTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserTypeUser'
CREATE INDEX [IX_FK_UserTypeUser]
ON [dbo].[UserSet]
    ([UserTypeId]);
GO

-- Creating foreign key on [UserId] in table 'PostSet'
ALTER TABLE [dbo].[PostSet]
ADD CONSTRAINT [FK_UserPost]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPost'
CREATE INDEX [IX_FK_UserPost]
ON [dbo].[PostSet]
    ([UserId]);
GO

-- Creating foreign key on [CategoryId] in table 'PostSet'
ALTER TABLE [dbo].[PostSet]
ADD CONSTRAINT [FK_PostCategory]
    FOREIGN KEY ([CategoryId])
    REFERENCES [dbo].[CategorySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PostCategory'
CREATE INDEX [IX_FK_PostCategory]
ON [dbo].[PostSet]
    ([CategoryId]);
GO

-- Creating foreign key on [ProductId] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [FK_ProductPayment]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[ProductSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductPayment'
CREATE INDEX [IX_FK_ProductPayment]
ON [dbo].[PaymentSet]
    ([ProductId]);
GO

-- Creating foreign key on [UserId] in table 'PaymentSet'
ALTER TABLE [dbo].[PaymentSet]
ADD CONSTRAINT [FK_UserPayment]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPayment'
CREATE INDEX [IX_FK_UserPayment]
ON [dbo].[PaymentSet]
    ([UserId]);
GO

-- Creating foreign key on [CategoryProductId] in table 'ProductSet'
ALTER TABLE [dbo].[ProductSet]
ADD CONSTRAINT [FK_ProductCategoryProduct]
    FOREIGN KEY ([CategoryProductId])
    REFERENCES [dbo].[CategoryProductSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCategoryProduct'
CREATE INDEX [IX_FK_ProductCategoryProduct]
ON [dbo].[ProductSet]
    ([CategoryProductId]);
GO

-- Creating foreign key on [UserId] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [FK_UserCart]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCart'
CREATE INDEX [IX_FK_UserCart]
ON [dbo].[CartSet]
    ([UserId]);
GO

-- Creating foreign key on [ProductId] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [FK_ProductCart]
    FOREIGN KEY ([ProductId])
    REFERENCES [dbo].[ProductSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductCart'
CREATE INDEX [IX_FK_ProductCart]
ON [dbo].[CartSet]
    ([ProductId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------