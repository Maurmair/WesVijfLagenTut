
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/11/2017 12:47:02
-- Generated from EDMX file: c:\users\maurmair\documents\visual studio 2015\Projects\WesVijfLagen\WesVijfLagen\TestModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [vijflagenmodel];
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

-- Creating table 'GebruikerSet'
CREATE TABLE [dbo].[GebruikerSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [TwitterGebruikersNaam] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'GeoCacheSet'
CREATE TABLE [dbo].[GeoCacheSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Locatie] nvarchar(max)  NOT NULL,
    [Beschrijving] nvarchar(max)  NOT NULL,
    [CacheType] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'GebruikerGeoCache'
CREATE TABLE [dbo].[GebruikerGeoCache] (
    [Gebruiker_Id] int  NOT NULL,
    [GeoCache_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'GebruikerSet'
ALTER TABLE [dbo].[GebruikerSet]
ADD CONSTRAINT [PK_GebruikerSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GeoCacheSet'
ALTER TABLE [dbo].[GeoCacheSet]
ADD CONSTRAINT [PK_GeoCacheSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Gebruiker_Id], [GeoCache_Id] in table 'GebruikerGeoCache'
ALTER TABLE [dbo].[GebruikerGeoCache]
ADD CONSTRAINT [PK_GebruikerGeoCache]
    PRIMARY KEY CLUSTERED ([Gebruiker_Id], [GeoCache_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Gebruiker_Id] in table 'GebruikerGeoCache'
ALTER TABLE [dbo].[GebruikerGeoCache]
ADD CONSTRAINT [FK_GebruikerGeoCache_Gebruiker]
    FOREIGN KEY ([Gebruiker_Id])
    REFERENCES [dbo].[GebruikerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [GeoCache_Id] in table 'GebruikerGeoCache'
ALTER TABLE [dbo].[GebruikerGeoCache]
ADD CONSTRAINT [FK_GebruikerGeoCache_GeoCache]
    FOREIGN KEY ([GeoCache_Id])
    REFERENCES [dbo].[GeoCacheSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GebruikerGeoCache_GeoCache'
CREATE INDEX [IX_FK_GebruikerGeoCache_GeoCache]
ON [dbo].[GebruikerGeoCache]
    ([GeoCache_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------