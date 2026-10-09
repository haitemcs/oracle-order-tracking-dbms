Describe contacts;

SELECT contact_id, first_name, last_name, email, phone FROM CONTACTS
 WHERE  phone IS NULL
 ORDER BY last_name ASC, first_name ASC ; 

Describe products;

SELECT  product_name, standard_cost, list_price,  
   list_price - standard_cost AS profit_margin from PRODUCTS
   WHERE list_price < 500 
 ORDER BY profit_margin DESC ; 
