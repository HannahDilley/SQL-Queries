WITH	top_ten_countries	(country)
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
		LIMIT		10
	)

/* Cities in Top Ten Countries */
SELECT
	top_ten_countries.country,
	city.city,
	COUNT(customer.customer_id)	AS customers_per_city
		
FROM 	customer
INNER JOIN	address	ON customer.address_id = address.address_id
INNER JOIN	city	ON address.city_id = city.city_id
INNER JOIN 	country	ON city.country_id = country.country_id
INNER JOIN	top_ten_countries	ON country.country = top_ten_countries.country

GROUP BY	city, top_ten_countries.country
ORDER BY	country, city
/*LIMIT	10*/
;

