1. Get all customers and their addresses.
		SELECT * FROM addresses
		LEFT OUTER JOIN customers
		ON addresses.customer_id=customers.id
2. Get all orders and their line items.
		SELECT * FROM orders
		LEFT OUTER JOIN customers
		ON orders.id=line_items.order_id
3. Which warehouses have cheetos?
		SELECT warehouse.warehouse, products.description FROM products
		JOIN warehouse_product
		ON products.id=warehouse_product.product_id
		JOIN warehouse
		ON warehouse.id=warehouse_product.warehouse_id
		WHERE products.description='cheetos';
4.Which warehouses have diet pepsi?
	SELECT warehouse.warehouse, products.description FROM warehouse
	JOIN warehouse_product
	ON warehouse.id=warehouse_product.warehouse_id
	JOIN products
	ON products.id=warehouse_product.product_id
	WHERE products.description='diet pepsi';
5. Get the number of orders for each customer.
NOTE: It is OK if those without orders are not included in results.
	SELECT count(orders.total), customers.first_name FROM orders
	JOIN addresses
	ON orders.address_id=addresses.id
	JOIN customers
	ON customers.id=addresses.customer_id
	GROUP BY customers.first_name;
6. How many customers do we have?
	SELECT count(customers.id) FROM customers;
7. How many products do we carry?
	SELECT count(products.id) FROM products;
8.What is the total available on-hand quantity of diet pepsi?
SELECT count(warehouse_product.on_hand), products.description FROM products
JOIN warehouse_product
ON products.id=warehouse_product.product_id
WHERE products.description='diet pepsi'
GROUP BY products.description;
