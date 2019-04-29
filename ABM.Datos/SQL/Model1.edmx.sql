
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/25/2019 18:14:13
-- Generated from EDMX file: D:\Resyst\ABM\ABM.Datos\SQL\Model1.edmx
-- --------------------------------------------------
CREATE DATABASE ABM
SET QUOTED_IDENTIFIER OFF;
GO
USE [ABM];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_NUB_LISTA_PRODUCTOS_TBL_LISTA_COMPRA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NUB_LISTA_PRODUCTOS] DROP CONSTRAINT [FK_NUB_LISTA_PRODUCTOS_TBL_LISTA_COMPRA];
GO
IF OBJECT_ID(N'[dbo].[FK_NUB_LISTA_PRODUCTOS_TBL_PRODUCTO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NUB_LISTA_PRODUCTOS] DROP CONSTRAINT [FK_NUB_LISTA_PRODUCTOS_TBL_PRODUCTO];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_CARRO_COMPRA_TBL_ESTADO_CARRO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_CARRO_COMPRA] DROP CONSTRAINT [FK_TBL_CARRO_COMPRA_TBL_ESTADO_CARRO];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_COMPRA_TBL_CARRO_COMPRA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_COMPRA] DROP CONSTRAINT [FK_TBL_COMPRA_TBL_CARRO_COMPRA];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_COMPRA_TBL_LISTA_COMPRA]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_COMPRA] DROP CONSTRAINT [FK_TBL_COMPRA_TBL_LISTA_COMPRA];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_LISTA_COMPRA_TBL_USUARIO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_LISTA_COMPRA] DROP CONSTRAINT [FK_TBL_LISTA_COMPRA_TBL_USUARIO];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_PRODUCTO_TBL_TIPO_PRODUCTO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_PRODUCTO] DROP CONSTRAINT [FK_TBL_PRODUCTO_TBL_TIPO_PRODUCTO];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_RECEPCION_TBL_USUARIO]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_RECEPCION] DROP CONSTRAINT [FK_TBL_RECEPCION_TBL_USUARIO];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_STOCK_TBL_ORDEN_STOCK]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_STOCK] DROP CONSTRAINT [FK_TBL_STOCK_TBL_ORDEN_STOCK];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_STOCK_TBL_PRODUCTO1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_STOCK] DROP CONSTRAINT [FK_TBL_STOCK_TBL_PRODUCTO1];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_STOCK_TBL_RECEPCION]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_STOCK] DROP CONSTRAINT [FK_TBL_STOCK_TBL_RECEPCION];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_STOCK_TBL_TIPO_STOCK]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_STOCK] DROP CONSTRAINT [FK_TBL_STOCK_TBL_TIPO_STOCK];
GO
IF OBJECT_ID(N'[dbo].[FK_TBL_USUARIO_TBL_ROL2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBL_USUARIO] DROP CONSTRAINT [FK_TBL_USUARIO_TBL_ROL2];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[NUB_LISTA_PRODUCTOS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NUB_LISTA_PRODUCTOS];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[TBL_CARRO_COMPRA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_CARRO_COMPRA];
GO
IF OBJECT_ID(N'[dbo].[TBL_COMPRA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_COMPRA];
GO
IF OBJECT_ID(N'[dbo].[TBL_ESTADO_CARRO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_ESTADO_CARRO];
GO
IF OBJECT_ID(N'[dbo].[TBL_LISTA_COMPRA]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_LISTA_COMPRA];
GO
IF OBJECT_ID(N'[dbo].[TBL_ORDEN_STOCK]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_ORDEN_STOCK];
GO
IF OBJECT_ID(N'[dbo].[TBL_PRODUCTO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_PRODUCTO];
GO
IF OBJECT_ID(N'[dbo].[TBL_RECEPCION]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_RECEPCION];
GO
IF OBJECT_ID(N'[dbo].[TBL_ROL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_ROL];
GO
IF OBJECT_ID(N'[dbo].[TBL_STOCK]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_STOCK];
GO
IF OBJECT_ID(N'[dbo].[TBL_TIPO_PRODUCTO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_TIPO_PRODUCTO];
GO
IF OBJECT_ID(N'[dbo].[TBL_TIPO_STOCK]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_TIPO_STOCK];
GO
IF OBJECT_ID(N'[dbo].[TBL_USUARIO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBL_USUARIO];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'NUB_LISTA_PRODUCTOS'
CREATE TABLE [dbo].[NUB_LISTA_PRODUCTOS] (
    [lpro_id] int IDENTITY(1,1) NOT NULL,
    [pro_id] int  NOT NULL,
    [lcom_id] int  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'TBL_COMPRA'
CREATE TABLE [dbo].[TBL_COMPRA] (
    [com_id] int IDENTITY(1,1) NOT NULL,
    [com_cantidad] int  NOT NULL,
    [com_valor] int  NOT NULL,
    [lcom_id] int  NOT NULL,
    [com_fecha_compra] datetime  NULL,
    [car_id] int  NULL
);
GO

-- Creating table 'TBL_LISTA_COMPRA'
CREATE TABLE [dbo].[TBL_LISTA_COMPRA] (
    [lcom_id] int IDENTITY(1,1) NOT NULL,
    [lcom_valor] int  NOT NULL,
    [usu_id] int  NOT NULL
);
GO

-- Creating table 'TBL_ORDEN_STOCK'
CREATE TABLE [dbo].[TBL_ORDEN_STOCK] (
    [ordn_id] int IDENTITY(1,1) NOT NULL,
    [ordn_fecha] datetime  NOT NULL
);
GO

-- Creating table 'TBL_PRODUCTO'
CREATE TABLE [dbo].[TBL_PRODUCTO] (
    [pro_id] int IDENTITY(1,1) NOT NULL,
    [pro_nombre] varchar(100)  NULL,
    [pro_detalle] varchar(500)  NULL,
    [pro_precio] int  NOT NULL,
    [pro_stock] int  NOT NULL,
    [tprod_id] int  NULL,
    [pro_disponibilidad] int  NOT NULL
);
GO

-- Creating table 'TBL_RECEPCION'
CREATE TABLE [dbo].[TBL_RECEPCION] (
    [rcp_id] int IDENTITY(1,1) NOT NULL,
    [usu_id] int  NOT NULL,
    [rcp_fecha] datetime  NOT NULL
);
GO

-- Creating table 'TBL_ROL'
CREATE TABLE [dbo].[TBL_ROL] (
    [rol_id] int IDENTITY(1,1) NOT NULL,
    [rol_nombre] varchar(50)  NOT NULL
);
GO

-- Creating table 'TBL_STOCK'
CREATE TABLE [dbo].[TBL_STOCK] (
    [stk_id] int IDENTITY(1,1) NOT NULL,
    [pro_id] int  NOT NULL,
    [tstk_id] int  NOT NULL,
    [rcp_id] int  NOT NULL,
    [ordn_id] int  NOT NULL
);
GO

-- Creating table 'TBL_TIPO_PRODUCTO'
CREATE TABLE [dbo].[TBL_TIPO_PRODUCTO] (
    [tprod_id] int IDENTITY(1,1) NOT NULL,
    [tprod_nombre] varchar(50)  NOT NULL
);
GO

-- Creating table 'TBL_TIPO_STOCK'
CREATE TABLE [dbo].[TBL_TIPO_STOCK] (
    [tstk_id] int IDENTITY(1,1) NOT NULL,
    [tstk_nombre] varchar(500)  NOT NULL
);
GO

-- Creating table 'TBL_USUARIO'
CREATE TABLE [dbo].[TBL_USUARIO] (
    [usu_id] int IDENTITY(1,1) NOT NULL,
    [usu_nombre] varchar(50)  NULL,
    [usu_rut] varchar(15)  NOT NULL,
    [usu_telefono] varchar(12)  NULL,
    [usu_correo] varchar(500)  NOT NULL,
    [rol_id] int  NULL,
    [usu_clave] varchar(50)  NOT NULL
);
GO

-- Creating table 'TBL_CARRO_COMPRA'
CREATE TABLE [dbo].[TBL_CARRO_COMPRA] (
    [CAR_ID] int IDENTITY(1,1) NOT NULL,
    [CAR_TOKEN] varchar(100)  NULL,
    [CAR_MONTO] int  NULL,
    [CEST_ESTADO] int  NOT NULL,
    [CAR_CODIGO_AUTORIZACION] varchar(500)  NULL,
    [CAR_CODIGO_COMERCIO] varchar(500)  NULL,
    [CAR_ORDEN_COMPRA] varchar(500)  NULL,
    [CAR_SESSION_ID] varchar(500)  NULL,
    [CAS_ERROR] varchar(500)  NULL
);
GO

-- Creating table 'TBL_ESTADO_CARRO'
CREATE TABLE [dbo].[TBL_ESTADO_CARRO] (
    [CEST_ID] int  NOT NULL,
    [CEST_NOMBRE] varchar(50)  NOT NULL,
    [CEST_VIGENTE] bit  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [lpro_id] in table 'NUB_LISTA_PRODUCTOS'
ALTER TABLE [dbo].[NUB_LISTA_PRODUCTOS]
ADD CONSTRAINT [PK_NUB_LISTA_PRODUCTOS]
    PRIMARY KEY CLUSTERED ([lpro_id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [com_id] in table 'TBL_COMPRA'
ALTER TABLE [dbo].[TBL_COMPRA]
ADD CONSTRAINT [PK_TBL_COMPRA]
    PRIMARY KEY CLUSTERED ([com_id] ASC);
GO

-- Creating primary key on [lcom_id] in table 'TBL_LISTA_COMPRA'
ALTER TABLE [dbo].[TBL_LISTA_COMPRA]
ADD CONSTRAINT [PK_TBL_LISTA_COMPRA]
    PRIMARY KEY CLUSTERED ([lcom_id] ASC);
GO

-- Creating primary key on [ordn_id] in table 'TBL_ORDEN_STOCK'
ALTER TABLE [dbo].[TBL_ORDEN_STOCK]
ADD CONSTRAINT [PK_TBL_ORDEN_STOCK]
    PRIMARY KEY CLUSTERED ([ordn_id] ASC);
GO

-- Creating primary key on [pro_id] in table 'TBL_PRODUCTO'
ALTER TABLE [dbo].[TBL_PRODUCTO]
ADD CONSTRAINT [PK_TBL_PRODUCTO]
    PRIMARY KEY CLUSTERED ([pro_id] ASC);
GO

-- Creating primary key on [rcp_id] in table 'TBL_RECEPCION'
ALTER TABLE [dbo].[TBL_RECEPCION]
ADD CONSTRAINT [PK_TBL_RECEPCION]
    PRIMARY KEY CLUSTERED ([rcp_id] ASC);
GO

-- Creating primary key on [rol_id] in table 'TBL_ROL'
ALTER TABLE [dbo].[TBL_ROL]
ADD CONSTRAINT [PK_TBL_ROL]
    PRIMARY KEY CLUSTERED ([rol_id] ASC);
GO

-- Creating primary key on [stk_id] in table 'TBL_STOCK'
ALTER TABLE [dbo].[TBL_STOCK]
ADD CONSTRAINT [PK_TBL_STOCK]
    PRIMARY KEY CLUSTERED ([stk_id] ASC);
GO

-- Creating primary key on [tprod_id] in table 'TBL_TIPO_PRODUCTO'
ALTER TABLE [dbo].[TBL_TIPO_PRODUCTO]
ADD CONSTRAINT [PK_TBL_TIPO_PRODUCTO]
    PRIMARY KEY CLUSTERED ([tprod_id] ASC);
GO

-- Creating primary key on [tstk_id] in table 'TBL_TIPO_STOCK'
ALTER TABLE [dbo].[TBL_TIPO_STOCK]
ADD CONSTRAINT [PK_TBL_TIPO_STOCK]
    PRIMARY KEY CLUSTERED ([tstk_id] ASC);
GO

-- Creating primary key on [usu_id] in table 'TBL_USUARIO'
ALTER TABLE [dbo].[TBL_USUARIO]
ADD CONSTRAINT [PK_TBL_USUARIO]
    PRIMARY KEY CLUSTERED ([usu_id] ASC);
GO

-- Creating primary key on [CAR_ID] in table 'TBL_CARRO_COMPRA'
ALTER TABLE [dbo].[TBL_CARRO_COMPRA]
ADD CONSTRAINT [PK_TBL_CARRO_COMPRA]
    PRIMARY KEY CLUSTERED ([CAR_ID] ASC);
GO

-- Creating primary key on [CEST_ID] in table 'TBL_ESTADO_CARRO'
ALTER TABLE [dbo].[TBL_ESTADO_CARRO]
ADD CONSTRAINT [PK_TBL_ESTADO_CARRO]
    PRIMARY KEY CLUSTERED ([CEST_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [lcom_id] in table 'NUB_LISTA_PRODUCTOS'
ALTER TABLE [dbo].[NUB_LISTA_PRODUCTOS]
ADD CONSTRAINT [FK_NUB_LISTA_PRODUCTOS_TBL_LISTA_COMPRA]
    FOREIGN KEY ([lcom_id])
    REFERENCES [dbo].[TBL_LISTA_COMPRA]
        ([lcom_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NUB_LISTA_PRODUCTOS_TBL_LISTA_COMPRA'
CREATE INDEX [IX_FK_NUB_LISTA_PRODUCTOS_TBL_LISTA_COMPRA]
ON [dbo].[NUB_LISTA_PRODUCTOS]
    ([lcom_id]);
GO

-- Creating foreign key on [pro_id] in table 'NUB_LISTA_PRODUCTOS'
ALTER TABLE [dbo].[NUB_LISTA_PRODUCTOS]
ADD CONSTRAINT [FK_NUB_LISTA_PRODUCTOS_TBL_PRODUCTO]
    FOREIGN KEY ([pro_id])
    REFERENCES [dbo].[TBL_PRODUCTO]
        ([pro_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NUB_LISTA_PRODUCTOS_TBL_PRODUCTO'
CREATE INDEX [IX_FK_NUB_LISTA_PRODUCTOS_TBL_PRODUCTO]
ON [dbo].[NUB_LISTA_PRODUCTOS]
    ([pro_id]);
GO

-- Creating foreign key on [lcom_id] in table 'TBL_COMPRA'
ALTER TABLE [dbo].[TBL_COMPRA]
ADD CONSTRAINT [FK_TBL_COMPRA_TBL_LISTA_COMPRA]
    FOREIGN KEY ([lcom_id])
    REFERENCES [dbo].[TBL_LISTA_COMPRA]
        ([lcom_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_COMPRA_TBL_LISTA_COMPRA'
CREATE INDEX [IX_FK_TBL_COMPRA_TBL_LISTA_COMPRA]
ON [dbo].[TBL_COMPRA]
    ([lcom_id]);
GO

-- Creating foreign key on [usu_id] in table 'TBL_LISTA_COMPRA'
ALTER TABLE [dbo].[TBL_LISTA_COMPRA]
ADD CONSTRAINT [FK_TBL_LISTA_COMPRA_TBL_USUARIO]
    FOREIGN KEY ([usu_id])
    REFERENCES [dbo].[TBL_USUARIO]
        ([usu_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_LISTA_COMPRA_TBL_USUARIO'
CREATE INDEX [IX_FK_TBL_LISTA_COMPRA_TBL_USUARIO]
ON [dbo].[TBL_LISTA_COMPRA]
    ([usu_id]);
GO

-- Creating foreign key on [ordn_id] in table 'TBL_STOCK'
ALTER TABLE [dbo].[TBL_STOCK]
ADD CONSTRAINT [FK_TBL_STOCK_TBL_ORDEN_STOCK]
    FOREIGN KEY ([ordn_id])
    REFERENCES [dbo].[TBL_ORDEN_STOCK]
        ([ordn_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_STOCK_TBL_ORDEN_STOCK'
CREATE INDEX [IX_FK_TBL_STOCK_TBL_ORDEN_STOCK]
ON [dbo].[TBL_STOCK]
    ([ordn_id]);
GO

-- Creating foreign key on [tprod_id] in table 'TBL_PRODUCTO'
ALTER TABLE [dbo].[TBL_PRODUCTO]
ADD CONSTRAINT [FK_TBL_PRODUCTO_TBL_TIPO_PRODUCTO]
    FOREIGN KEY ([tprod_id])
    REFERENCES [dbo].[TBL_TIPO_PRODUCTO]
        ([tprod_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_PRODUCTO_TBL_TIPO_PRODUCTO'
CREATE INDEX [IX_FK_TBL_PRODUCTO_TBL_TIPO_PRODUCTO]
ON [dbo].[TBL_PRODUCTO]
    ([tprod_id]);
GO

-- Creating foreign key on [pro_id] in table 'TBL_STOCK'
ALTER TABLE [dbo].[TBL_STOCK]
ADD CONSTRAINT [FK_TBL_STOCK_TBL_PRODUCTO1]
    FOREIGN KEY ([pro_id])
    REFERENCES [dbo].[TBL_PRODUCTO]
        ([pro_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_STOCK_TBL_PRODUCTO1'
CREATE INDEX [IX_FK_TBL_STOCK_TBL_PRODUCTO1]
ON [dbo].[TBL_STOCK]
    ([pro_id]);
GO

-- Creating foreign key on [usu_id] in table 'TBL_RECEPCION'
ALTER TABLE [dbo].[TBL_RECEPCION]
ADD CONSTRAINT [FK_TBL_RECEPCION_TBL_USUARIO]
    FOREIGN KEY ([usu_id])
    REFERENCES [dbo].[TBL_USUARIO]
        ([usu_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_RECEPCION_TBL_USUARIO'
CREATE INDEX [IX_FK_TBL_RECEPCION_TBL_USUARIO]
ON [dbo].[TBL_RECEPCION]
    ([usu_id]);
GO

-- Creating foreign key on [rcp_id] in table 'TBL_STOCK'
ALTER TABLE [dbo].[TBL_STOCK]
ADD CONSTRAINT [FK_TBL_STOCK_TBL_RECEPCION]
    FOREIGN KEY ([rcp_id])
    REFERENCES [dbo].[TBL_RECEPCION]
        ([rcp_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_STOCK_TBL_RECEPCION'
CREATE INDEX [IX_FK_TBL_STOCK_TBL_RECEPCION]
ON [dbo].[TBL_STOCK]
    ([rcp_id]);
GO

-- Creating foreign key on [rol_id] in table 'TBL_USUARIO'
ALTER TABLE [dbo].[TBL_USUARIO]
ADD CONSTRAINT [FK_TBL_USUARIO_TBL_ROL2]
    FOREIGN KEY ([rol_id])
    REFERENCES [dbo].[TBL_ROL]
        ([rol_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_USUARIO_TBL_ROL2'
CREATE INDEX [IX_FK_TBL_USUARIO_TBL_ROL2]
ON [dbo].[TBL_USUARIO]
    ([rol_id]);
GO

-- Creating foreign key on [tstk_id] in table 'TBL_STOCK'
ALTER TABLE [dbo].[TBL_STOCK]
ADD CONSTRAINT [FK_TBL_STOCK_TBL_TIPO_STOCK]
    FOREIGN KEY ([tstk_id])
    REFERENCES [dbo].[TBL_TIPO_STOCK]
        ([tstk_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_STOCK_TBL_TIPO_STOCK'
CREATE INDEX [IX_FK_TBL_STOCK_TBL_TIPO_STOCK]
ON [dbo].[TBL_STOCK]
    ([tstk_id]);
GO

-- Creating foreign key on [CEST_ESTADO] in table 'TBL_CARRO_COMPRA'
ALTER TABLE [dbo].[TBL_CARRO_COMPRA]
ADD CONSTRAINT [FK_TBL_CARRO_COMPRA_TBL_ESTADO_CARRO]
    FOREIGN KEY ([CEST_ESTADO])
    REFERENCES [dbo].[TBL_ESTADO_CARRO]
        ([CEST_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_CARRO_COMPRA_TBL_ESTADO_CARRO'
CREATE INDEX [IX_FK_TBL_CARRO_COMPRA_TBL_ESTADO_CARRO]
ON [dbo].[TBL_CARRO_COMPRA]
    ([CEST_ESTADO]);
GO

-- Creating foreign key on [car_id] in table 'TBL_COMPRA'
ALTER TABLE [dbo].[TBL_COMPRA]
ADD CONSTRAINT [FK_TBL_COMPRA_TBL_CARRO_COMPRA]
    FOREIGN KEY ([car_id])
    REFERENCES [dbo].[TBL_CARRO_COMPRA]
        ([CAR_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBL_COMPRA_TBL_CARRO_COMPRA'
CREATE INDEX [IX_FK_TBL_COMPRA_TBL_CARRO_COMPRA]
ON [dbo].[TBL_COMPRA]
    ([car_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------