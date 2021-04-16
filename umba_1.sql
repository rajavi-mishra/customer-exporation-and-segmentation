/* 
users: id, created
loans: id, created, loan_status, user_id, amount
transactions: transaction.id, created, load_id, user_id, transaction_fee, t_type, transaction.amount 
*/

/*Process:
    1) Select columns 
    2) Rename them appropriately
    3) These columns should be selected them from a table that has been formed after joining 3 tables on common columns
    4) Make sure that the column value related conditions have been satisfied
    5) Order the table appropriately    
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
    
