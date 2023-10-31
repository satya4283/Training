# 1a. Select all columns from the actor table.

ANS.    select * from actor;


# 1b. Select only the last_name column from the actor table.

ANS.	select last_name from actor;

    
# 1c. Select only the following columns from the film table.
	
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# rental_duration       Exists in film table.
# rental_rate           Exists in film table.
# total_rental_cost     rental_duration * rental_rate


ANS.	select title, description, rental_duration, rental_rate, rental_duration* rental_rate as total_rental_cost from film;


# 2a. Select all distinct (different) last names from the actor table.

ANS.	select distinct(last_name) from actor;


# 2b. Select all distinct (different) postal codes from the address table.

ANS.	select distinct(postal_code) from address;


# 2c. Select all distinct (different) ratings from the film table.

ANS.	select distinct(rating) from film;



# 3a. Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.

ANS.	select title, description, rating, length as movie_length from film where length >=180;


# 3b. Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.

ANS.	select payment_id, amount, payment_date , date(payment_date) from payment where date(payment_date) >= '2005-05-27';


# 3c. Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.

ANS. 	select payment_id as primary_key, amount, payment_date from payment where date(payment_date) ='2005-05-27';


# 3d. Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.

ANS.	select * from customer where  last_name like 'Sa%' and first_name like '%N';


# 3e. Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".

ANS.	select * from customer where active ='0' or last_name like "M";


# 3f. Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.

ANS.  select * from category where category_id >4 and (name like 't%') or (name like 's%') or (name like 'c%');


# 3g. Select all columns minus the password column from the staff table for rows that contain a password.

ANS.	select *  from staff where password  is null;


# 3h. Select all columns minus the password column from the staff table for rows that do not contain a password.

ANS.	 select *  from staff where password  is not  null; 

# ---------------------------------------------------------#


## 4. IN operator

# 4a. Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.

ANS.	select phone, district from address where district in ('California', 'England', 'Taipei', 'West Java');


# 4b. Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005.
# (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)

ANS.	select payment_id, amount, date(payment_date) from payment where date(payment_date) in ('2005-05-27','2005-05-25','2005-05-29');


# 4c. Select all columns from the film table for films rated G, PG-13 or NC-17.

ANS.	SELECT * FROM film WHERE rating IN ('G', 'PG-13', 'NC-17');


# 5a. Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.

ANS. 	 select * from payment where payment_date between '2005-05-25 00:00:00:' and '2005-05-25  11:59:59';


# 5b. Select the following columns from the film table for films where the length of the description is between 100 and 120.
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# release_year          Exists in film table.
# total_rental_cost     rental_duration * rental_rate

ANS.	SELECT title, description, rental_duration, rental_rate, rental_duration* rental_rate as total_rental_cost,length(description) FROM film
	WHERE length(description) BETWEEN 100 AND 120;



# 6a. Select the following columns from the film table for rows where the description begins with "A Thoughtful".
# Title, Description, Release Year

ANS.	 SELECT title, description, release_year FROM film WHERE description LIKE "A Thoughtful%";


# 6b. Select the following columns from the film table for rows where the description ends with the word "Boat".
# Title, Description, Rental Duration

ANS.	SELECT title, description, rental_duration FROM film WHERE description LIKE "%BOAT";


# 6c. Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.
# Title, Length, Description, Rental Rate

ANS.	SELECT title, length, description, rental_rate FROM film WHERE description like "%database%" AND length > '180';


# 7a. Select all columns from the payment table and only include the first 20 rows.

ANS.	SELECT * FROM payment LIMIT 20;

# 7b. Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5, 
#and only select rows whose zero-based index in the result set is between 1000-2000.

ANS.	SELECT payment_date, amount FROM payment WHERE amount>5 LIMIT 1000,1000;

# 7c. Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.

ANS.	SELECT *  FROM customer LIMIT 100,100;

# 8a. Select all columns from the film table and order rows by the length field in ascending order.

ANS.	SELECT * FROM film ORDER BY length;


# 8b. Select all distinct ratings from the film table ordered by rating in descending order.

ANS.	SELECT  distinct(rating) FROM film ORDER BY rating desc;


# 8c. Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.

ANS.	SELECT  payment_date, amount FROM payment  ORDER BY amount desc limit 20;


# 8d. Select the title, description, special features, length, and rental duration columns from the film table 
#for the first 10 films with behind the scenes footage under 2 hours in length 
#and a rental duration between 5 and 7 days, ordered by length in descending order.

ANS.	SELECT title,description, special_features, length,rental_duration FROM film WHERE length >120  AND rental_duration BETWEEN 5 AND 7 ORDER BY length desc LIMIT 10;

# 9a. Select customer first_name/last_name and actor first_name/last_name columns from performing a /left join/ 
# between the customer and actor column on the last_name column in each table. 
# (i.e. `customer.last_name = actor.last_name`)
# Label customer first_name/last_name columns as customer_first_name/customer_last_name
# Label actor first_name/last_name columns in a similar fashion.


ANS. SELECT c.first_name AS customer_first_name , 
	c.last_name AS customer_last_name,
	a.first_name AS actor_first_name , 
	a.last_name AS actor_last_name 
	FROM customer c LEFT JOIN actor a 
	ON c.last_name = a.last_name; 

# 9b. Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. `customer.last_name = actor.last_name`)

ANS.	SELECT c.first_name AS customer_first_name , 
	c.last_name AS customer_last_name,
	a.first_name AS actor_first_name , 
	a.last_name AS actor_last_name 
	FROM customer c RIGHT JOIN actor a 
	ON c.last_name = a.last_name; 


# 9c. Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. `customer.last_name = actor.last_name`)

ans.	SELECT c.first_name AS customer_first_name , 
	c.last_name AS customer_last_name,
	a.first_name AS actor_first_name , 
	a.last_name AS actor_last_name 
	FROM customer c INNER JOIN actor a 
	ON c.last_name = a.last_name; 



# 9d. Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.

ANS.	SELECT city AS city_name, 
	country AS country_name
	FROM city left join country
	ON city.country_id = country.country_id;


		(OR)
	
`	SELECT city AS city_name, 
	country AS country_name
	FROM city left join country
	USING (country_id);

# 9e. Select the title, description, release year, and language name columns from the film table, performing a left join with the language table to get the "language" column.
# Label the language.name column as "language" (e.g. `select language.name as language`)

ANS.	SELECT title,description, release_year,
	name AS language
	FROM film LEFT JOIN language
	USING(language_id); 

# 9f. Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table,
 performing 2 left joins with the address table then the city table to get the address and city related columns.



ANS. 	SELECT first_name, last_name, address, address2, city AS city_name, district, postal_code
	FROM staff LEFT JOIN address
	USING(address_id)
	LEFT JOIN city 
	USING(city_id);
