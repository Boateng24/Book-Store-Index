-- Querying to select all columns with the first 10 rows for orders, books and customers tables
SELECT * FROM customers
LIMIT 10;
 
SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

--Querying to examine the indexes that exists on the existing tables
SELECT * 
FROM pg_indexes
WHERE tablename = 'customers';

SELECT * 
FROM pg_indexes
WHERE tablename = 'orders';

SELECT * 
FROM pg_indexes
WHERE tablename = 'books';

--Adding indexes on orders table 
CREATE INDEX customer_id_idx ON orders(customer_id);

CREATE INDEX book_id_idx ON orders(book_id);

--Using Explain-analyze to check the runtime of a query searching for the below columns given the condition below
EXPLAIN ANALYZE SELECT
original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French';

--Querying to get the size of the books table
SELECT pg_size_pretty (pg_total_relation_size('books'));

-- creating indexes on book language, title and copies sold
CREATE INDEX books_written_language_book_titles_copies_sold_idx ON books(original_language, title, sales_in_millions);

--Repeating task 1 and task 2
SELECT * FROM customers
LIMIT 10;
 
SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

SELECT * 
FROM pg_indexes
WHERE tablename = 'customers';

SELECT * 
FROM pg_indexes
WHERE tablename = 'orders';

SELECT * 
FROM pg_indexes
WHERE tablename = 'books';

--Dealing with task 8 can be done by deleting with sql commands or commenting the multicolumn index above

--Task 9
SELECT NOW();
 
\COPY orders FROM 'orders_add.txt' DELIMITER ',' CSV HEADER;
 
SELECT NOW();


DROP INDEX customer_id_idx;

DROP INDEX book_id_idx 