/* Customers per City */

SELECT
	city.city,
	country.country,
	COUNT(customer.customer_id)	AS	customers_per_city

FROM	customer
INNER JOIN	address	ON	customer.address_id = address.address_id
INNER JOIN	city	ON	address.city_id = city.city_id
INNER JOIN	country	ON city.country_id = country.country_id

GROUP BY	country.country, city.city
ORDER BY	customers_per_city DESC
;