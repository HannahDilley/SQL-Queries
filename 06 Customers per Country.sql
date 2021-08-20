/* Customers per Country */

SELECT
	country.country,
	COUNT(customer.customer_id)	AS	customers_per_country

FROM	customer
INNER JOIN	address	ON	customer.address_id = address.address_id
INNER JOIN	city	ON	address.city_id = city.city_id
INNER JOIN	country	ON	city.country_id = country.country_id

GROUP BY	country.country
ORDER BY	customers_per_country DESC
;