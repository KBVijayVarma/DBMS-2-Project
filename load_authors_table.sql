CREATE TABLE authors_table
( ID integer,
  authors text
);

copy authors_table from 'C:\Users\Public\authors_table.csv' with csv header;
SELECT * FROM authors_table