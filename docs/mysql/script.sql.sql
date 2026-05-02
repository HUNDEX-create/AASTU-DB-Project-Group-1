
--- Financial report: The following SQL query aggregates total payments received for each payment method. This provides a summary of revenue generated through each payment channel and is useful for financial reporting and analysis. ---

SELECT payment_method, SUM(amount_paid) AS total_revenue
FROM Payment
GROUP BY payment_method;
