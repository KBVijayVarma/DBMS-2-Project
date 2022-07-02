CREATE TABLE references_table
( ID int,
  REFERENCE int
);

copy references_table from 'C:\Users\Public\references_table.csv' with csv header;
SELECT * FROM references_table;