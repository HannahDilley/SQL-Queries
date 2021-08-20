/* Revenue per Week No for 2007 */

SELECT
	payment.payment_id,
	payment.payment_date,
	CASE
		WHEN payment.payment_date BETWEEN '2007-02-13' AND '2007-02-20' THEN 'Week 07'
		WHEN payment.payment_date BETWEEN '2007-02-20' AND '2007-02-27' THEN 'Week 08'
		WHEN payment.payment_date BETWEEN '2007-02-27' AND '2007-03-06' THEN 'Week 09'
		WHEN payment.payment_date BETWEEN '2007-03-06' AND '2007-03-13' THEN 'Week 10'
		WHEN payment.payment_date BETWEEN '2007-03-13' AND '2007-03-20' THEN 'Week 11'
		WHEN payment.payment_date BETWEEN '2007-03-20' AND '2007-03-27' THEN 'Week 12'
		WHEN payment.payment_date BETWEEN '2007-03-27' AND '2007-04-03' THEN 'Week 13'
		WHEN payment.payment_date BETWEEN '2007-04-03' AND '2007-04-10' THEN 'Week 14'
		WHEN payment.payment_date BETWEEN '2007-04-10' AND '2007-04-17' THEN 'Week 15'
		WHEN payment.payment_date BETWEEN '2007-04-17' AND '2007-04-24' THEN 'Week 16'
		WHEN payment.payment_date BETWEEN '2007-04-25' AND '2007-05-01' THEN 'Week 17'
		WHEN payment.payment_date BETWEEN '2007-05-01' AND '2007-05-08' THEN 'Week 18'
		WHEN payment.payment_date BETWEEN '2007-05-08' AND '2007-05-15' THEN 'Week 19'
	END	AS week_no,
	payment.amount
	
FROM	payment
ORDER BY	payment.payment_date
;
