/* Revenue per Film Category */

SELECT 
	/*film.film_id,
	film.title,
	film.rating,*/
	category.name,
	/*payment.amount*/
	/*COUNT(film.film_id)	AS no_of_films_in_category*/
	SUM(payment.amount)	AS revenue_per_category
	

FROM	film
INNER JOIN	film_category	ON film.film_id = film_category.film_id
INNER JOIN	category	ON film_category.category_id = category.category_id

INNER JOIN	inventory	ON film.film_id = inventory.film_id
INNER JOIN	rental	ON inventory.inventory_id = rental.inventory_id
INNER JOIN	payment	ON rental.rental_id = payment.rental_id

GROUP BY	category.name
ORDER BY	revenue_per_category DESC
;