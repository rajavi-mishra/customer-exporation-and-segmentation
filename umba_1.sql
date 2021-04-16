/* 
users: id, created
loans: id, created, loan_status, user_id, amount
transactions: transaction.id, created, load_id, user_id, transaction_fee, t_type, transaction.amount 
*/

SELECT loans.id AS loan_id, 
    loans.amount AS loan_amount, 
    users.id AS user_id, 
    users.created AS user_created, 
    transactions.transaction_fee AS transaction_fee, 
    transactions.t_type AS transaction_type
    FROM ((loans
    INNER JOIN users ON users.id = loans.user_id)
    INNER JOIN transactions ON loans.id = transactions.loan_id)
    WHERE loans.loan_status = 'active'
        OR loans.loan_status = 'repaid'
        AND t_type = 'disbursement'
    ORDER BY users.created;
    
