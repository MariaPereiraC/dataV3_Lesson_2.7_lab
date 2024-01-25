#LAB 3

USE Sakila;
#Use the sakila database to do the following tasks:

#Display all available tables in the Sakila database.
Show Tables  ; 

#Retrieve all the data from the tables actor, film and customer.
Select * From actor ;
Select * From film ; 
Select * From customer ;


#1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT C.CATEGORY_ID AS CATEGORY, COUNT(F.FILM_ID) AS NUMBER_OF_FILMS
FROM SAKILA.FILM_CATEGORY C
JOIN SAKILA.FILM F
ON C.FILM_id = F.FILM_id
GROUP BY C.CATEGORY_ID ; 

#2. Display the total amount rung up by each staff member in August of 2005.  SELL RELATED 
SELECT S.STAFF_ID AS STAFF, SUM(P.AMOUNT) AS MAX_PAYMENT
FROM SAKILA.STAFF S
JOIN SAKILA.PAYMENT P
ON S.STAFF_id = P.STAFF_id
WHERE DATE_FORMAT(P.PAYMENT_DATE, '%Y-%m') = '2005-08'
GROUP BY S.STAFF_ID 
ORDER BY MAX_PAYMENT DESC;

SELECT* FROM PAYMENT;

#3. Which actor has appeared in the most films?
#JOIN ACTOR WITH FILM ID 
SELECT A.ACTOR_ID AS ACTOR, COUNT(F.FILM_ID) AS NUMBER_OF_FILMS
FROM SAKILA.FILM F
JOIN SAKILA.FILM_ACTOR A
ON F.FILM_ID = A.FILM_id
GROUP BY A.ACTOR_ID 
ORDER BY NUMBER_OF_FILMS DESC; 

#4. Most active customer (the customer that has rented the most number of films)
SELECT C.CUSTOMER_ID AS CUSTOMER, COUNT(R.RENTAL_ID) AS NUMBER_OF_RENTALS
FROM SAKILA.RENTAL R
JOIN SAKILA.CUSTOMER C
ON C.CUSTOMER_ID = R.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID 
ORDER BY NUMBER_OF_RENTALS DESC;

#5. Display the first and last names, as well as the address, of each staff member.
SELECT S.FIRST_NAME AS NAME, S.LAST_NAME AS LAST_NAME , A.ADDRESS as ADDRESS
FROM SAKILA.STAFF S
JOIN SAKILA.ADDRESS A
ON S.ADDRESS_ID = A.ADDRESS_ID;


#6. List each film and the number of actors who are listed for that film.
SELECT F.TITLE AS FILM, COUNT(A.ACTOR_ID) AS NUMBER_OF_ACTORS
FROM SAKILA.FILM F
JOIN SAKILA.FILM_ACTOR A
ON F.FILM_ID = A.FILM_ID
GROUP BY F.TITLE;

#7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT C.CUSTOMER_ID AS CUSTOMER, C.LAST_NAME AS LAST_NAME, SUM(P.AMOUNT) AS TOTAL_PAID
FROM SAKILA.PAYMENT P
JOIN SAKILA.CUSTOMER C
ON C.CUSTOMER_ID = P.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID 
ORDER BY C.LAST_NAME ASC;

#8. List the titles of films per category.
SELECT C.CATEGORY_ID AS CATEGORY, F.TITLE AS TITLE
FROM SAKILA.FILM F
JOIN SAKILA.FILM_CATEGORY C
ON F.FILM_ID = C.FILM_ID;
