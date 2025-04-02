    ---------------------------------
	Project upload a file from AWS S3 to snowflake 
	-----------------------------------------------
	
Step 1:
	
	Create a AWS S3 bucket move the CSV file into the bucket 
	
Step 2:
	
	How to create the external storage in snowflake:
	-----------------------------------------------
	CREATE STAGE AWS STG
	URL = 
	STORAGE INIEGRATION 
Step 3:
     How to create the storage Initgration:
	 ---------------------------------------
	 CREATE STRORAGE INTIGRATION AWS_INTG
	 TYPE = EXTERNAL_STAGE 
	 ENABLE = TRUE
	 STORAGE_PROVIDER = S3
	 STORAGE_ALLOWED_LOCATION =
	 STORAGE_AWS_ROLE_ARN =
Step 4:
    How to make link between both account:
	--------------------------------------
	DESC STORAGE INTIGRATION AWS_INTG;
Step 5:
    How to load the data from stage to snowflake table:
	--------------------------------------------------
	
	ls @AWS_STG;
	
	SELECT $1, $2
	FROM @AWS_STG;
	
	CREATE TABLE T1
	(ID INT, NAME VARCHAR); 
	
	HOW to create the file formate:
	------------------------------
	CREATE FILE FORMAT CSV
	TYPE = CSV
	FIELED_DELIMIETER = ','
	RECORD_DELIMIETER = '/n'
	SKIP_HEADER = 1;
	
	
	Copy command:
	------------
	# store the data into table from staging area
	
	COPY INTO T1
	FROM @AWS_STG
	FILE_FORAMAT = CSV;

Step 6:
    How To check table is loaded or not by writing the Query
	------------------------------------
	SELECT * 
	FROM
	T1;
	