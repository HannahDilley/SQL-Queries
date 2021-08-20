/* Revenue per Film */

SELECT
	film.title,
	COUNT(film.title)	AS no_of_payments_per_film,
	SUM(payment.amount)	AS revenue_per_film
	
FROM	payment
INNER JOIN 	rental	ON payment.rental_id = rental.rental_id
INNER JOIN	inventory	ON rental.inventory_id = inventory.inventory_id
INNER JOIN	film	ON inventory.film_id = film.film_id

GROUP BY	film.title
ORDER BY	revenue_per_film DESC
;
