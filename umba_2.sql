/* 
users: id, created
loans: id, created, loan_status, user_id, amount
transactions: transaction.id, created, load_id, user_id, transaction_fee, t_type, transaction.amount 
*/

SELECT cast((date_part('month', created)) AS INTEGER) AS month, 
    COUNT(*), SUM(amount) AS total_loan_amount, 
    ROUND(AVG(amount), 2) AS average_loan_size, 
    MIN(amount) AS min_loan_size,
    MAX(amount) AS max_loan_size 
    FROM loans
GROUP BY date_part('month', created)
ORDER BY 
    case when date_part('month', created) > date_part('month', CURRENT_TIMESTAMP) then date_part('month', created) end DESC,
    case when date_part('month', created) = date_part('month', CURRENT_TIMESTAMP) then date_part('month', created) end ASC; 

/*using case here to sort by the most recent mony, used current timestamp to get the current month instead of hardcoding the month to 4*/

    
