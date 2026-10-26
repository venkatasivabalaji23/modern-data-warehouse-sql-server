/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
Loads CRM and ERP data from external CSV files into Bronze layer tables.
- Truncates existing data before loading new records.
- Uses BULK INSERT to load data from CSV files.
- Tracks individual table and total batch loading durations.
- Displays progress messages during the loading process.
- Uses TRY...CATCH for error handling and displays error details.

Parameters:
None. This stored procedure does not accept input parameters or return
explicit values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================

*/

create or alter procedure bronze.load_bronze as 
begin
    DECLARE 
        @start_time DATETIME, 
        @end_time DATETIME, 
        @batch_start_time DATETIME, 
        @batch_end_time DATETIME; 
    begin try 
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '================================================';

        PRINT '------------------------------------------------';
	    PRINT 'Loading CRM Tables';
	    PRINT '------------------------------------------------';

            SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_cust_info';
		    TRUNCATE TABLE bronze.crm_cust_info;
	    PRINT '>> Inserting Data Into: bronze.crm_cust_info';
            --truncate before you run otherwise data is inserted as many times you run
            SET DATEFORMAT dmy;
            bulk insert bronze.crm_cust_info 
            FROM 'C:\VenkataSivaBalaji\dataWareHouse\sources\datasets\source_crm\cust_info.csv'
            WITH (
                FORMAT = 'CSV',
                FIRSTROW = 2,
                CODEPAGE = '65001',
                ROWTERMINATOR = '0x0a',
                TABLOCK
            );
            SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';
            --select count(*) from bronze.crm_cust_info
            --contents of the table
            --select* from bronze.crm_cust_info

            SET @start_time = GETDATE();
	    PRINT '>> Truncating Table: bronze.crm_prd_info';
		    TRUNCATE TABLE bronze.crm_prd_info
	    PRINT '>> Inserting Data Into: bronze.crm_prd_info';
            SET DATEFORMAT dmy;
            bulk insert bronze.crm_prd_info
            FROM 'C:\VenkataSivaBalaji\dataWareHouse\sources\datasets\source_crm\prd_info.csv'
            WITH (
                FORMAT = 'CSV',
                FIRSTROW = 2,
                CODEPAGE = '65001',
                ROWTERMINATOR = '0x0a',
                TABLOCK
            );
            SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

            --select count(*) from bronze.crm_prd_info
            --contents of the table
            --select* from bronze.crm_prd_info

            SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_sales_details';
		    TRUNCATE TABLE bronze.crm_sales_details;
	    PRINT '>> Inserting Data Into: bronze.crm_sales_details';
            SET DATEFORMAT dmy;
            bulk insert bronze.crm_sales_details
            FROM 'C:\VenkataSivaBalaji\dataWareHouse\sources\datasets\source_crm\sales_details.csv'
            WITH (
                FORMAT = 'CSV',
                FIRSTROW = 2,
                CODEPAGE = '65001',
                ROWTERMINATOR = '0x0a',
                TABLOCK
            );
            SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

            --select count(*) from bronze.crm_sales_details
            --contents of the table
            --select* from bronze.crm_sales_details

	    PRINT '------------------------------------------------';
	    PRINT 'Loading ERP Tables';
	    PRINT '------------------------------------------------';

            SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_loc_a101';
		    TRUNCATE TABLE bronze.erp_loc_a101;
	    PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
            SET DATEFORMAT dmy;
            bulk insert bronze.erp_loc_a101
            FROM 'C:\VenkataSivaBalaji\dataWareHouse\sources\datasets\source_erp\loc_a101.csv'
            WITH (
                FORMAT = 'CSV',
                FIRSTROW = 2,
                CODEPAGE = '65001',
                ROWTERMINATOR = '0x0a',
                TABLOCK
            );
            SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

            --select count(*) from bronze.erp_loc_a101
            --contents of the table
            --select* from bronze.erp_loc_a101


            SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_cust_az12';
		    TRUNCATE TABLE bronze.erp_cust_az12;
	    PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
            SET DATEFORMAT dmy;
            bulk insert bronze.erp_cust_az12
            FROM 'C:\VenkataSivaBalaji\dataWareHouse\sources\datasets\source_erp\cust_az12.csv'
            WITH (
                FORMAT = 'CSV',
                FIRSTROW = 2,
                CODEPAGE = '65001',
                ROWTERMINATOR = '0x0a',
                TABLOCK
            );
            SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

            --select count(*) from bronze.erp_cust_az12
            --contents of the table
            --select* from bronze.erp_cust_az12

            SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	    PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
            SET DATEFORMAT dmy;
            bulk insert bronze.erp_px_cat_g1v2
            FROM 'C:\VenkataSivaBalaji\dataWareHouse\sources\datasets\source_erp\px_cat_g1v2.csv'
            WITH (
                FORMAT = 'CSV',
                FIRSTROW = 2,
                CODEPAGE = '65001',
                ROWTERMINATOR = '0x0a',
                TABLOCK
            );
            SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -------------';

            --select count(*) from bronze.erp_px_cat_g1v2
            --contents of the table
            --select* from bronze.erp_px_cat_g1v2

            SET @batch_end_time = GETDATE();
		PRINT '=========================================='
		PRINT 'Loading Bronze Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=========================================='
    end try
    begin catch
        PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
    end catch
end

--exec bronze.load_bronze
