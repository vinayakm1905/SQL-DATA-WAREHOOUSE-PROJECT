/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

--===============-Creating Stored Procedure----============================
create or alter procedure bronze.load_bronze as
begin
	declare @start_time datetime, @end_time datetime, @batch_start_time datetime,@batch_end_time datetime;--dclare variable to calculate time taken to execute  each proces
	set @batch_start_time= GETDATE();
	begin try--this will try below code and if it get failes then catch will start(go below of code)
			
			print '==========================================';
			print 'Loading Bronze Layer';
			print '==========================================';
			----===================================================================================-----------
		
			print '-------------------------------------------';
			print'Loading CRM Table';
			print '-------------------------------------------';
			--Creating Bronze Layer---
			--1. creatin table-- bronze.crm_cust_info
			if OBJECT_ID ('bronze.crm_cust_info','U') is not null 
			drop table bronze.crm_cust_info

			create table bronze.crm_cust_info(
				cst_id int,
				cst_key nvarchar(50),
				cst_firstname nvarchar(50),
				cst_lastname nvarchar(50),
				cst_marital_status nvarchar(50),
				cst_gndr nvarchar(50),
				cst_create_date date
			);



			--2. creatin table-- bronze.crm_prd_info

			if OBJECT_ID ('bronze.crm_prd_info','U') is not null 
			drop table bronze.crm_prd_info

			create table bronze.crm_prd_info(
				prd_id int,
				prd_key nvarchar(50),
				prd_nm nvarchar(50),
				prd_cost nvarchar(50),
				prd_line nvarchar(50),
				prd_start_dt date,
				prd_end_dt date
			);

			 ---3. creatin table-- bronze.crm_sales_details

			 if OBJECT_ID ('bronze.crm_sales_details','U') is not null 
			drop table bronze.crm_sales_details

			 create table bronze.crm_sales_details(
				 sls_ord_num nvarchar(50),
				 sls_prd_key nvarchar(50),
				 sls_cust_id nvarchar(50),
				 sls_order_dt int,
				 sls_ship_dt int,
				 sls_due_dt int,
				 sls_sales int,
				 sls_quantity int,
				 sls_price int
			 );
			print '-------------------------------------------';
			print'Loading ERP Table';
			print '-------------------------------------------';
			---4. creatin table-- bronze.erp_CUST_AZ12
			if OBJECT_ID ('bronze.erp_CUST_AZ12','U') is not null 
			drop table bronze.erp_CUST_AZ12

			create table bronze.erp_CUST_AZ12(
				CID nvarchar(50),
				BDATE date,
				GEN nvarchar(50)
			);
			---5. creatin table-- bronze.erp_LOC_A101
			if OBJECT_ID ('bronze.erp_LOC_A101','U') is not null 
			drop table bronze.erp_LOC_A101

			create table bronze.erp_LOC_A101(
				CID nvarchar(50),
				CNTRY nvarchar(50)
			);

			---6. creatin table-- bronze.erp_PX_CAT_G1V2
			if OBJECT_ID ('bronze.erp_PX_CAT_G1V2','U') is not null 
			drop table bronze.erp_PX_CAT_G1V2

			create table bronze.erp_PX_CAT_G1V2(
				ID nvarchar(50),
				CAT nvarchar(50),
				SUBCAT nvarchar(50),
				MAINTENANCE nvarchar(50)
			);
			---===================================================
			-------Develop SQL Load Script for Bronze Layer-------------
			print '-------------------------------------------';
			print'>>Truncatingtable :bronze.crm_cust_info';
			print'>>Inserting data intoTable :bronze.crm_cust_info';
			print '-------------------------------------------';
			--1. inserting into bronze.crm_cust_info
			set @start_time= GETDATE();
			 truncate table bronze.crm_cust_info --this is to avoid multiple inserting f data
			 bulk insert bronze.crm_cust_info  -- in order to insert bulk data in one go use 
			 from 'D:\DATA WAREHOUSE By Bara\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv' 
			 with (
				firstrow=2,
				fieldterminator=',',
				tablock
			);
			--To validate data is inserted correctly check below
			--select * from  bronze.crm_cust_info;
			--select count(*) from bronze.crm_cust_info;--validate the no of rows written is as per Source data count
			set @end_time= GETDATE();
			print '-------------------------------------------';
			print '>>Load Duration :'+ cast( datediff(second,@start_time,@end_time) as nvarchar)+'seconds'
			print '-------------------------------------------';
			--2 . inserting into bronze.crm_cust_info
			print '-------------------------------------------';
			print'>>Truncatingtable :bronze.crm_cust_info';
			print'>>Inserting data intoTable :bronze.crm_cust_info';
			print '-------------------------------------------';
			set @start_time= GETDATE();
			truncate table bronze.crm_prd_info
			bulk insert bronze.crm_prd_info 
			from 'D:\DATA WAREHOUSE By Bara\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
			with(
				firstrow=2,
				fieldterminator=',',
				tablock
			);
			set @end_time= GETDATE();
			print '-------------------------------------------';
			print '>>Load Duration :'+ cast( datediff(second,@start_time,@end_time) as nvarchar)+'seconds'
			print '-------------------------------------------';
			--3 . inserting into  bronze.crm_prd_info
			--select * from bronze.crm_prd_info;
			--select count(*) from bronze.crm_prd_info;

			---3. inserting into bronze.crm_sales_details
			set @start_time= GETDATE();
			print '-------------------------------------------';
			print'>>Truncatingtable :bronze.crm_sales_details';
			print'>>Inserting data intoTable :bronze.crm_sales_details';
			print '-------------------------------------------';
			truncate table  bronze.crm_sales_details
			bulk insert bronze.crm_sales_details 
			from 'D:\DATA WAREHOUSE By Bara\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
			with (
				firstrow=2,
				fieldterminator= ',',
				tablock
			);
			set @end_time= GETDATE();
			print '-------------------------------------------';
			print '>>Load Duration :'+ cast( datediff(second,@start_time,@end_time) as nvarchar)+'seconds'
			print '-------------------------------------------';
			--select * from bronze.crm_sales_details;
			--select count(*) from bronze.crm_sales_details;
			print '-------------------------------------------';
			print'>>Truncating table :bronze.erp_CUST_AZ12';
			print'>>Inserting data intoTable :bronze.erp_CUST_AZ12';
			print '-------------------------------------------';
			--4.Inserting into table bronze.erp_CUST_AZ12
			set @start_time= GETDATE();
			 truncate table bronze.erp_CUST_AZ12
			 Bulk insert bronze.erp_CUST_AZ12
			 from 'D:\DATA WAREHOUSE By Bara\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
			 with (
				firstrow=2,
				fieldterminator=',',
				tablock
			);
			set @end_time= GETDATE();
			print '-------------------------------------------';
			print '>>Load Duration :'+ cast( datediff(second,@start_time,@end_time) as nvarchar)+'seconds'
			print '-------------------------------------------';
			--select * from bronze.erp_CUST_AZ12;
			--select count(*) from bronze.erp_CUST_AZ12;

			--5. Inserting in to table bronze.erp_LOC_A101
			print '-------------------------------------------';
			print'>>Truncating table :bronze.erp_LOC_A101';
			print'>>Inserting data intoTable :bronze.erp_LOC_A101';
			print '-------------------------------------------';
			set @start_time= GETDATE();
			truncate table bronze.erp_LOC_A101
			bulk insert bronze.erp_LOC_A101
			from 'D:\DATA WAREHOUSE By Bara\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
			with (
				firstrow=2,
				fieldterminator=',',
				tablock
			);
			set @end_time= GETDATE();
			print '-------------------------------------------';
			print '>>Load Duration :'+ cast( datediff(second,@start_time,@end_time) as nvarchar)+'seconds'
			print '-------------------------------------------';
			--select * from bronze.erp_LOC_A101;
			--select count(*) from bronze.erp_LOC_A101;

			---6. Inserting into table bronze.erp_PX_CAT_G1V2
			print '-------------------------------------------';
			print'>>Truncating table :bronze.erp_PX_CAT_G1V2';
			print'>>Inserting data intoTable :bronze.erp_PX_CAT_G1V2';
			print '-------------------------------------------';
			set @start_time= GETDATE();
			truncate table bronze.erp_PX_CAT_G1V2
			bulk insert bronze.erp_PX_CAT_G1V2 
			from 'D:\DATA WAREHOUSE By Bara\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
			with (
				firstrow=2,
				fieldterminator=',',
				tablock
			);
			set @end_time= GETDATE();
			print '-------------------------------------------';
			print '>>Load Duration :'+ cast( datediff(second,@start_time,@end_time) as nvarchar)+'seconds'
			print '-------------------------------------------';
		end try
			
		begin catch-----if above code fails then it will go to catch and display below message
		print'=====================================================';
		print'Error Occured During Loading Bronze Layer';
		print'ErrorMessage'+error_message() ;
		Print 'Error Message'+ cast(error_number() as nvarchar);
		Print 'Error Message'+ cast(error_state() as nvarchar);
		print'=====================================================';
		end catch
		set @batch_end_time= GETDATE();
		print '>>Batch Load Duration :'+ cast( datediff(second,@batch_start_time,@batch_end_time) as nvarchar)+'seconds'
			---Above line will give you the batch running time
end
