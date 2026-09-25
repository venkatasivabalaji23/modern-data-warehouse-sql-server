/*
=============================================================
Create Data Warehouse Database and Schemas
=============================================================

Script Purpose:
    This script initializes the DataWarehouse database and
    creates the Bronze, Silver, and Gold schemas used in the
    data warehouse architecture.

WARNING:
    If the DataWarehouse database already exists, it will be
    permanently deleted along with all its data and objects.

    Make sure you have the necessary backups before running
    this script.
*/

USE master;
GO

-- ============================================================
-- Create DataWarehouse Database
-- ============================================================

IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'DataWarehouse'
)
BEGIN
    ALTER DATABASE DataWarehouse
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;
GO

-- ============================================================
-- Create Data Warehouse Schemas
-- ============================================================

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
