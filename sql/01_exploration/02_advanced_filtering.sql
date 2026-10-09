
describe products;

SELECT product_id, product_name, standard_cost, list_price 
FROM products 
WHERE (product_name LIKE '%Intel%' OR product_name LIKE '%AMD%')
  AND list_price > 1500 
ORDER BY list_price DESC;
