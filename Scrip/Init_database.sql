--Create Database "Datawarehouse"----
use master;
--Create Datawarehouse
create database datawarehouse;

use datawarehouse;
--Create Schema
create schema bronze;
go
create schema silver;
go
create schema gold;
go
