/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/




--Creating a Data Warehouse

USE master; -- because in this databse we can create other databases
GO

--Drop and recreate the "DataWarehouse" database
IF EXISTS( SELECT 1 FROM sys.databases WHERE name='DataWarehouse')
BEGIN
   
   ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
   DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;   --here i tried to execute silver and gold together and it thre error as while using multiple sql statement we need a separator "go"
GO
