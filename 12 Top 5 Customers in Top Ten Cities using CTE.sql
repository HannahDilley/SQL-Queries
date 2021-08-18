WITH top_ten_countries (country)
	AS
	(	/*Top Ten Countries*/
		SELECT
			country.country,
			count(country.country) AS country_count

		FROM 		customer
		INNER JOIN	address	ON customer.address_id = address.address_id
		INNER JOIN	city	ON address.city_id = city.city_id
		INNER JOIN 	country	ON city.country_id = country.country_id

		GROUP BY	country
		ORDER BY	country_count DESC
		LIMIT	10
	),
top_ten_cities (customer_id, first_name, _last_name, city, country)
	AS
	(	/* Cities in Top Ten Countries */
		SELECT
			customer.customer_id,
			customer.first_name,
			customer.last_name,
			city.city,
			country.country,
			top_ten_countries.country,
			COUNT(customer.customer_id)	AS customers_per_city

		FROM 	customer
		INNER JOIN	address	ON customer.address_id = address.address_id
		INNER JOIN	city	ON address.city_id = city.city_id
		INNER JOIN 	country	ON city.country_id = country.country_id
		INNER JOIN	top_ten_countries	ON country.country = top_ten_countries.country

		GROUP BY	customer.customer_id, customer.first_name, customer.last_name, 	city.city, country.country, top_ten_countries.country
		/*ORDER BY	country.country, city.city*/
		LIMIT	10
	)

SELECT	
	top_ten_cities.customer_id,
	top_ten_cities.first_name,
	top_ten_cities.last_name,
	top_ten_cities.city,
	top_ten_cities.country,
	COUNT(payment.amount)	AS number_of_items,
	SUM(payment.amount)	AS total_per_customer

FROM	top_ten_cities
/*INNER JOIN	customer	ON payment.customer_id = customer.customer_id
INNER JOIN	address	ON customer.address_id = address.address_id
INNER JOIN	city	ON address.city_id = city.city_id
INNER JOIN 	country	ON city.country_id = country.country_id*/

GROUP BY	top_ten_cities.customer_id, top_ten_cities.first_name, top_ten_cities.last_name, top_ten_cities.city, top_ten_cities.country
ORDER BY	total_per_customer	DESC
;
