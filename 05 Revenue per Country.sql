/* Revenue per Country */

SELECT
	country.country,
	COUNT(payment.amount)	AS number_of_payments_per_country,
	SUM(payment.amount)	AS revenue_per_country
	
FROM	payment
INNER JOIN	customer	ON payment.customer_id = customer.customer_id
INNER JOIN	address	ON customer.address_id = address.address_id
INNER JOIN	city	ON address.city_id = city.city_id
INNER JOIN	country	ON city.country_id = country.country_id

GROUP BY	country.country
ORDER BY	revenue_per_country DESC
;