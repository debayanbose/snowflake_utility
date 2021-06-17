CREATE DATABASE crm_data;

CREATE TABLE customer (
  id STRING,
  name STRING ,
  address STRING ,
  city string ,
  postcode string ,
  state string,
  company string,
  contact string
  );


--sample data for the table above is present in AWS S3 at
--https://s3.ap-southeast-2.amazonaws.com/snowflake-essentials/customer.csv

create or replace stage my_s3_stage url='s3://snowflake-essentials/';


copy into customer
  from s3://snowflake-essentials/customer.csv
  file_format = (type = csv field_delimiter = '|' skip_header = 1);

SELECT * FROM customer;
SELECT COUNT(*) FROM customer;