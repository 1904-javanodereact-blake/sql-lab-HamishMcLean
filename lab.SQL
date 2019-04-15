-- SQL Lab

--1.0	Setting up Oracle Chinook
--In this section you will begin the process of working with the Oracle Chinook database
--Task – Open the Chinook_Oracle.sql file and execute the scripts within.
--2.0 SQL Queries
--In this section you will be performing various queries against the Oracle Chinook database.
--2.1 SELECT
--Task – Select all records from the Employee table.
-- Solution: SELECT * FROM employee
--Task – Select all records from the Employee table where last name is King.
-- Solution: SELECT * FROM employee WHERE lastname = 'King'
--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
-- solution: SELECT * FROM employee WHERE firstname = 'Andrew' and reportsto is null;

--2.2 ORDER BY
--Task – Select all albums in Album table and sort result set in descending order by title.
-- Solution - SELECT * FROM Album ORDER BY title DESC;
--Task – Select first name from Customer and sort result set in ascending order by city
-- Solution - SELECT * FROM Customer ORDER BY city ASC;

--2.3 INSERT INTO
--Task – Insert two new records into Genre table
--Solution: INSERT INTO genre (genreid, name) VALUES(29, 'Screamo'),(28, 'Gregorian Chants');

--Task – Insert two new records into Employee table
--Solution: INSERT INTO employee (employeeid, lastname,firstname,title) 
	        --VALUES(9,'Johnson','John', 'Professional Plumber'),(10, 'Jack','Samurai','Swordsman');

--Task – Insert two new records into Customer table
--Solution: INSERT INTO customer (customerid, firstname,lastname, email) 
	            --VALUES (63,'Rocket','Raccoon','rocketcoon420@gmail.com'),(64, 'Hamish','McLean', 'mcchammey@gmail.com');

--2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter
--Solution: UPDATE customer SET firstname = 'Robert', lastname = 'Walter' WHERE firstname = 'Aaron' AND lastname = 'Mitchell';

--Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
--Solution: UPDATE artist SET name = 'CCR' WHERE name = 'Creedence Clearwater Revival';

--2.5 LIKE
--Task – Select all invoices with a billing address like “T%”
-- Solution: SELECT * FROM invoice WHERE billingaddress LIKE 'T%'

-- 2.6 BETWEEN
-- Task – Select all invoices that have a total between 15 and 50
-- Solution: SELECT * FROM invoice WHERE total BETWEEN 15 AND 50;

-- Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
-- Solution: SELECT * FROM employee WHERE hiredate BETWEEN '2003/06/01 00:00:00' AND '2004/03/01 00:00:00';

-- 2.7 DELETE
-- Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
-- Solution: DELETE FROM employee WHERE firstname = 'Robert' AND lastname = 'Walter';


-- 3.0	SQL Functions
-- In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
-- 3.1 System Defined Functions
-- Task – Use a function that returns the current time.
-- Solution: SELECT LOCALTIMESTAMP;

-- Task – Use a function that returns the length of a mediatype from the mediatype table
--Solution - SELECT LENGTH(name) FROM mediatype WHERE mediatypeid = 1; 

-- 3.2 System Defined Aggregate Functions
-- Task – Use a function that returns the average total of all invoices
-- Solution: SELECT AVG(total) AS AverageInvoice FROM invoice;

-- Task – Use a function that returns the most expensive track
-- Solution: SELECT * FROM track WHERE unitprice = (SELECT MAX(unitprice) FROM track);

-- 7.0 JOINS
-- In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
-- 7.1 INNER
-- Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
-- Solution:SELECT firstname, lastname, invoiceid
-- 			FROM customer
-- 			INNER JOIN invoice
-- 			ON customer.customerid = invoice.invoiceid;

-- 7.2 OUTER
-- Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
--SOlution: SELECT customer.customerid, firstname, lastname, invoiceid, total
	-- 		FROM customer
	-- 		FULL OUTER JOIN invoice 
	-- 		ON customer.customerid = invoice.customerid
	-- 		ORDER BY invoiceid;


-- 7.3 RIGHT
-- Task – Create a right join that joins album and artist specifying artist name and title.
-- Solution:
-- SELECT artist.name, title
-- FROM album
-- RIGHT JOIN artist
-- ON album.artistid = artist.artistid;


-- 7.4 CROSS
-- Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
-- Solution:
-- SELECT * 
-- FROM album 
-- CROSS JOIN artist
-- ORDER BY artist.name ASC;

-- 7.5 SELF
-- Task – Perform a self-join on the employee table, joining on the reportsto column.
-- Solution:
-- SELECT *
-- FROM employee A, employee B
-- WHERE A.reportsto = B.reportsto; 


