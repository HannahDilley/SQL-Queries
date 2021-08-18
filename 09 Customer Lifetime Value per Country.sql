WITH	cltv (customer_id, address_id)
	AS
	( /* Customer Payment Count, Sum & Average */
		SELECT
			payment.customer_id,
			customer.address_id,
			COUNT(payment.amount)	AS no_of_payments,
			SUM(payment.amount)	AS total_per_customer,
			round(AVG(payment.amount),2)	AS average_per_customer
	
		FROM	payment
		INNER JOIN	customer	ON payment.customer_id = customer.customer_id

		GROUP BY	payment.customer_id, customer.address_id
		ORDER BY	payment.customer_id
	)
	
/* Customer Lifetime Value */
SELECT
	cltv.customer_id,
	country.country,
	cltv.no_of_payments,
	cltv.total_per_customer,
	cltv.average_per_customer,
	round(SUM(no_of_payments * average_per_customer),0)	AS cltv_rating
	
FROM	cltv
INNER JOIN	address	ON	cltv.address_id = address.address_id
INNER JOIN	city	ON	address.city_id = city.city_id
INNER JOIN	country	ON	city.country_id = country.country_id	

GROUP BY	cltv.customer_id, cltv.no_of_payments, cltv.total_per_customer, 
			cltv.average_per_customer, country.country
ORDER BY	cltv_rating DESC
;
