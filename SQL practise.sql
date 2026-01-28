-- Q1: Who is the senior most employee based on the job titles
SELECT * FROM employee
ORDER BY levels desc
limit 1

-- Q2: Which countries have the most Invoices?
SELECT COUNT(*), billing_country FROM invoice
GROUP BY billing_country
ORDER by billing_country desc
limit 1

/* Q3: What are top 3 values of total invoice? */
SELECT total FROM invoice 
ORDER BY total DESC
LIMIT 3

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

SELECT billing_city, SUM(total) AS total_invoice FROM invoice
GROUP BY billing_city
ORDER BY total_invoice DESC 
limit 1

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/
SELECT customer.first_name, customer.last_name, SUM(total) AS TotalSpending
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY TotalSpending DESC
limit 1

/* Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */
SELECT DISTINCT customer.email, 
customer.first_name,
customer.last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
JOIN track ON invoice_line.track_id = track.track_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email ASC

/* Q7: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands*/
SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS total_track
FROM artist 
JOIN album ON artist.artist_id = album.artist_id
JOIN track ON album.album_id = track.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY total_track desc
limit 10

/* Q8: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */
SELECT name, milliseconds FROM track
WHERE milliseconds > (SELECT AVG(milliseconds) AS avg_track_length FROM track)
ORDER BY milliseconds DESC





















