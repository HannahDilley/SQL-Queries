/* Revenue per Month */

SELECT
	payment.payment_id,
	payment.payment_date,
	CASE
		WHEN payment.payment_date BETWEEN '2007-02-14' AND '2007-03-14' THEN 'Month 1'
		WHEN payment.payment_date BETWEEN '2007-03-14' AND '2007-04-14' THEN 'Month 2'
		WHEN payment.payment_date BETWEEN '2007-04-14' AND '2007-05-15' THEN 'Month 3'
	END	AS pay_month,
	payment.amount
	
FROM	payment
ORDER BY	payment.payment_date
;
