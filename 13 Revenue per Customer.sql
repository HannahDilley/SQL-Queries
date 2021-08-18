/* Revenue per Customer, Globally */

SELECT
	customer.customer_id,
	customer.first_name,
	city.city,
	country.country,
	COUNT(payment.amount)	AS number_of_items,
	SUM(payment.amount)	AS total_per_customer

FROM	payment
INNER JOIN	customer	ON payment.customer_id = customer.customer_id
INNER JOIN	address	ON customer.address_id = address.address_id
INNER JOIN	city	ON address.city_id = city.city_id
INNER JOIN 	country	ON city.country_id = country.country_id

GROUP BY	country.country, city.city, customer.customer_id
ORDER BY	total_per_customer DESC
;