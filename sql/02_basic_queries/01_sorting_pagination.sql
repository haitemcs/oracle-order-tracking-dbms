describe customers ; 

SELECT 
    customer_id, 
    name, 
    credit_limit, 
    website
FROM 
    CUSTOMERS
WHERE 
    credit_limit IS NOT NULL 
    AND credit_limit > 0
ORDER BY 
    credit_limit DESC, 
    name ASC
FETCH FIRST 10 ROWS ONLY;


--OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY; -- Skips top 10, fetches rows 11-20
