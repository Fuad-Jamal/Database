CREATE TABLE sales_person(
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(22) NOT NULL,
email VARCHAR (33) NOT NULL,
street VARCHAR(13) NOT NULL,
city VARCHAR(13) NOT NULL,
state VARCHAR(3) NOT NULL DEFAULT 'PA',
zip SMALLINT NOT NULL,
phone VARCHAR(13) NOT NULL,
birth_date DATE(13) NOT NULL,
sex sex_type(13) NOT NULL,
date_hired TIMESTAMP NOT NULL,
id SERIAL PRIMARY KEY
);

CREATE TABLE product_type(
name VARCHAR(30) NOT NULL,
id SERIAL PRIMARY KEY
);

CREATE TABLE product(
type_id INTEGER REFERENCES product_type(id),
name VARCHAR(30) NOT NULL,
supplier VARCHAR(40) NOT NULL,
description TEXT NOT NULL,
id SERIAL PRIMARY KEY
);

CREATE TABLE item(
product_id INTEGER REFERENCES product(id),
size INTEGER NOT NULL,
color VARCHAR(21) NOT NULL,
picture VARCHAR(32) NOT NULL,
price NUMERIC (6,2) NOT NULL,
id SERIAL PRIMARY KEY
);

CREATE TABLE sales_order(
cust_id INTEGER REFERENCES customer(id),
sales_person_id INTEGER REFERENCES sales_person(id),
time_order_taken TIMESTAMP NOT NULL,
purchase_order_number INTEGER NOT NULL,
credit_card_number VARCHAR(22) NOT NULL,
credit_card_exper_month SMALLINT NOT NULL,
credit_card_exper_day SMALLINT NOT NULL,
credit_card_secret_code SMALLINT NOT NULL,
name_on_card VARCHAR(100) NOT NULL,
id SERIAL PRIMARY KEY
);

CREATE TABLE sales_item (
item_id INTEGER REFERENCES item(id),
sales_order_id INTEGER REFERENCES sales_order(id),
quantity INTEGER NOT NULL,
discount NUMERIC (3,2) NOT NULL DEFAULT 0,
taxable BOOLEAN NOT NULL DEFAULT FALSE,
sales_tax_rate NUMERIC (5,2) NOT NULL DEFAULT 0,
id SERIAL PRIMARY KEY
);

CREATE TABLE transaction_type(
name VARCHAR (30) NOT NULL,
payment_type VARCHAR(30) NOT NULL,
id SERIAL PRIMARY KEY
);
ALTER TABLE transaction_type RENAME TO transaction;
CREATE INDEX transaction_id ON transaction (name);
CREATE INDEX transaction_id_2 ON transaction (name, payment_type);

INSERT INTO product_type (name)
VALUES ('Business');
INSERT INTO product_type (name)
VALUES ('Casual');
INSERT INTO product_type (name)
VALUES ('Athletic');
SELECT * FROM product_type;

INSERT INTO product VALUES
(1,'Yezzy', 'Adidas', 'a collab between the rapper kanye and the adidas clothing brand'),
(2, 'Nike Air Max', 'Nike', 'A popular line of shoes released by Nike with a focus on comfort and style.'),
(3, 'iPhone 13', 'Apple', 'The latest model of Apple\ flagship smartphone, featuring advanced technology and sleek design.'),
(4, 'cr7 boots', 'Nike', 'a collaboration of nike and their star who is cristiano ronaldo'),
(5, 'PlayStation 5', 'Sony', 'The latest gaming console from Sony, offering a new generation of gaming experiences.'),
(6, 'Model S', 'Tesla', 'An electric vehicle known for its impressive range, performance, and cutting-edge technology.'),
(6, 'Surface Laptop 4', 'Microsoft', 'A sleek and powerful laptop by Microsoft, designed for productivity and portability.');
SELECT * FROM product; 

INSERT INTO customer (first_name, last_name, email, company, street, city, state, zip, phone, birth_date, sex, date_entered) VALUES
('Harrison', 'Ford', 'harrisonford@yahoo.com', 'Movie Star Inc.', '123 Cedar St', 'Sioux Falls', 'GA', '293', '949-838-8383', '1932-01-12', 'M', '2025-02-14 14:34:00'),
('John', 'Doe', 'john.doe@example.com', 'Doe Enterprises', '456 Maple Ave', 'Anytown', 'CA', '94016', '555-555-5555', '1985-07-14', 'M', '2025-02-14 14:35:00'),
('Jane', 'Smith', 'jane.smith@example.com', 'Smith Consulting', '789 Elm St', 'Othertown', 'TX', '75001', '555-555-1234', '1990-02-02', 'F', '2025-02-14 14:36:00'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'Johnson Solutions', '101 Oak St', 'Wonderland', 'NY', '11101', '555-555-6789', '1995-03-03', 'F', '2025-02-14 14:37:00'),
('Bob', 'Builder', 'bob.builder@example.com', 'Builder Inc.', '202 Pine St', 'Buildtown', 'FL', '33101', '555-555-1010', '1980-04-04', 'M', '2025-02-14 14:38:00'),
('Charlie', 'Brown', 'charlie.brown@example.com', 'Peanuts Corp.', '303 Birch Rd', 'Peanuts', 'WA', '98101', '555-555-2020', '1970-05-05', 'M', '2025-02-14 14:39:00'),
('Daisy', 'Ridley', 'daisy.ridley@example.com', 'StarWars Ltd.', '404 Ash Ln', 'StarWars', 'OR', '97001', '555-555-3030', '1992-06-06', 'F', '2025-02-14 14:40:00'),
('Evan', 'Peters', 'evan.peters@example.com', 'Xmen Co.', '505 Willow Dr', 'Xmen', 'PA', '19101', '555-555-4040', '1987-07-07', 'M', '2025-02-14 14:41:00'),
('Fiona', 'Apple', 'fiona.apple@example.com', 'Apple Music', '606 Chestnut Pl', 'Shrek', 'IL', '60601', '555-555-5050', '1977-08-08', 'F', '2025-02-14 14:42:00'),
('George', 'Lucas', 'george.lucas@example.com', 'Lucasfilm Ltd.', '707 Redwood Trl', 'Hollywood', 'CA', '90001', '555-555-6060', '1944-05-14', 'M', '2025-02-14 14:43:00'),
('Hannah', 'Montana', 'hannah.montana@example.com', 'Disney Channel', '808 Palm Way', 'Disney', 'FL', '32830', '555-555-7070', '1992-11-23', 'F', '2025-02-14 14:44:00'),
('Ian', 'McKellen', 'ian.mckellen@example.com', 'MiddleEarth Productions', '909 Cedar Ridge', 'MiddleEarth', 'NZ', '6011', '555-555-8080', '1939-05-25', 'M', '2025-02-14 14:45:00'),
('Jessica', 'Chastain', 'jessica.chastain@example.com', 'Hollywood Stars', '1010 Aspen Blvd', 'Hollywood', 'CA', '90210', '555-555-9090', '1977-03-24', 'F', '2025-02-14 14:46:00'),
('Kyle', 'Reese', 'kyle.reese@example.com', 'Skynet Inc.', '1111 Spruce Ct', 'Skynet', 'TX', '73301', '555-555-1011', '1972-02-28', 'M', '2025-02-14 14:47:00'),
('Laura', 'Dern', 'laura.dern@example.com', 'JurassicPark Ltd.', '1212 Fir Pkwy', 'JurassicPark', 'CA', '94016', '555-555-1212', '1967-02-10', 'F', '2025-02-14 14:48:00');
SELECT * FROM customer;

ALTER TABLE sales_person
ALTER COLUMN zip TYPE INTEGER;
INSERT INTO sales_person (first_name, last_name, email, street, city, state, zip, phone, birth_date, sex, date_hired) VALUES
('John', 'Doe', 'john.doe@example.com', '123 Main St', 'Anytown', 'PA', 12345, '555-555-5555', '1980-01-01', 'M', '2020-01-01 09:00:00'),
('Jane', 'Smith', 'jane.smith@example.com', '456 Oak St', 'Othertown', 'PA', 67890, '555-555-1234', '1990-02-02', 'F', '2021-02-02 10:00:00'),
('Alice', 'Johnson', 'alice.johnson@example.com', '789 Pine St', 'Sometown', 'PA', 11223, '555-555-6789', '1985-03-03', 'F', '2019-03-03 11:00:00'),
('Bob', 'Brown', 'bob.brown@example.com', '101 Maple St', 'Yourtown', 'PA', 44556, '555-555-9876', '1975-04-04', 'M', '2018-04-04 12:00:00'),
('Charlie', 'Davis', 'charlie.davis@example.com', '202 Birch St', 'Thistown', 'PA', 77889, '555-555-4321', '1995-05-05', 'M', '2022-05-05 13:00:00');
SELECT * FROM sales_person;

INSERT INTO item(product_id,size,color,picture,price) VALUES
(16, 10, 'Red', 'image1.jpg', 99.99),
(16, 11, 'Blue', 'image2.jpg', 99.99),
(16, 12, 'Green', 'image3.jpg', 99.99),
(21, 9, 'Black', 'image4.jpg', 149.99),
(21, 10, 'White', 'image5.jpg', 149.99),
(21, 11, 'Gray', 'image6.jpg', 149.99),
(18, 64, 'Silver', 'image7.jpg', 999.99),
(18, 128, 'Gold', 'image8.jpg', 1099.99),
(20, 256, 'Black', 'image9.jpg', 1199.99),
(20, 8, 'Yellow', 'image10.jpg', 199.99),
(17, 9, 'Orange', 'image11.jpg', 199.99),
(17, 10, 'Purple', 'image12.jpg', 199.99),
(19, 1, 'Black', 'image13.jpg', 499.99),
(19, 1, 'White', 'image14.jpg', 499.99),
(20, 1, 'Blue', 'image15.jpg', 499.99),
(21, 1, 'Red', 'image16.jpg', 9999.99), 
(18, 1, 'Blue', 'image17.jpg', 9999.99),
(18, 1, 'Black', 'image18.jpg', 9999.99),
(17, 13, 'Silver', 'image19.jpg', 1299.99),
(17, 15, 'Gold', 'image20.jpg', 1399.99),
(16, 17, 'Black', 'image21.jpg', 1499.99);
SELECT * FROM item;

INSERT INTO sales_order (cust_id, sales_person_id, time_order_taken, purchase_order_number, credit_card_number, credit_card_exper_month, credit_card_exper_day, credit_card_secret_code, name_on_card) VALUES
(1, 1, '2025-02-14 14:50:00', 1001, '1234567890123456', 12, 2025, 123, 'John Doe'),
(2, 2, '2025-02-14 14:51:00', 1002, '2345678901234567', 11, 2024, 234, 'Jane Smith'),
(11, 3, '2025-02-14 14:52:00', 1003, '3456789012345678', 10, 2023, 345, 'Alice Johnson'),
(12, 4, '2025-02-14 14:53:00', 1004, '4567890123456789', 9, 2022, 456, 'Bob Brown'),
(13, 5, '2025-02-14 14:54:00', 1005, '5678901234567890', 8, 2021, 567, 'Charlie Davis'),
(14, 6, '2025-02-14 14:55:00', 1006, '6789012345678901', 7, 2020, 678, 'David Evans'),
(15, 7, '2025-02-14 14:56:00', 1007, '7890123456789012', 6, 2019, 789, 'Eve Foster'),
(16, 8, '2025-02-14 14:57:00', 1008, '8901234567890123', 5, 2018, 890, 'Frank Green'),
(17, 9, '2025-02-14 14:58:00', 1009, '9012345678901234', 4, 2017, 901, 'Grace Hill'),
(18, 10, '2025-02-14 14:59:00', 1010, '0123456789012345', 3, 2016, 012, 'Hank Ives'),
(19, 1, '2025-02-14 15:00:00', 1011, '1234567890123456', 12, 2025, 123, 'John Doe'),
(20, 2, '2025-02-14 15:01:00', 1012, '2345678901234567', 11, 2024, 234, 'Jane Smith'),
(21, 3, '2025-02-14 15:02:00', 1013, '3456789012345678', 10, 2023, 345, 'Alice Johnson'),
(22, 4, '2025-02-14 15:03:00', 1014, '4567890123456789', 9, 2022, 456, 'Bob Brown'),
(23, 5, '2025-02-14 15:04:00', 1015, '5678901234567890', 8, 2021, 567, 'Charlie Davis'),
(24, 6, '2025-02-14 15:05:00', 1016, '6789012345678901', 7, 2020, 678, 'David Evans'),
(25, 7, '2025-02-14 15:06:00', 1017, '7890123456789012', 6, 2019, 789, 'Eve Foster');
SELECT * FROM sales_order;

INSERT INTO sales_item VALUES
(962, 28, 2, 0, TRUE, 7.25),
(963, 29, 1, 0, FALSE, 0),
(964, 30, 3, 0.1, TRUE, 7.25),
(965, 31, 1, 0, FALSE, 0),
(966, 32, 2, 0.05, TRUE, 7.25),
(967, 33, 1, 0, FALSE, 0),
(968, 34, 4, 0.2, TRUE, 7.25),
(969, 35, 1, 0, FALSE, 0),
(970, 36, 2, 0.15, TRUE, 7.25),
(971, 37, 1, 0, FALSE, 0),
(972, 38, 3, 0.1, TRUE, 7.25),
(973, 39, 1, 0, FALSE, 0),
(974, 40, 2, 0.05, TRUE, 7.25),
(975, 41, 1, 0, FALSE, 0),
(976, 42, 4, 0.2, TRUE, 7.25),
(977, 43, 1, 0, FALSE, 0),
(978, 44, 2, 0.15, TRUE, 7.25),
(979, 28, 1, 0, FALSE, 0),
(980, 29, 3, 0.1, TRUE, 7.25),
(981, 30, 1, 0, FALSE, 0),
(982, 31, 2, 0.05, TRUE, 7.25),
(983, 32, 1, 0, FALSE, 0)
SELECT * FROM sales_item;  

SELECT product_id, SUM(price) AS Total
FROM item
WHERE product_id >12
GROUP BY product_id

SELECT DISTINCT state
-- -- WHERE state != 'CA'
-- WHERE state IN ('CA', 'FL')
FROM customer 
ORDER BY state

SELECT sales_order.id, sales_item.quantity, item.price,
(sales_item.quantity * item.price) AS Total
FROM sales_order
JOIN sales_item
ON sales_item.sales_order_id = sales_order.id
JOIN item
ON item.id = sales_item.item_id
ORDER BY sales_order.id

SELECT item_id, price
FROM item, sales_item
WHERE item.id = sales_item.item_id
AND price > 120.00
ORDER BY item_id

SELECT name, supplier, price
FROM product
LEFT JOIN item
ON item.product_id = product.id
ORDER BY name

SELECT sales_order_id, quantity, product_id
FROM item 
CROSS JOIN sales_item
ORDER BY sales_order_id

SELECT first_name, last_name, street, city, zip, birth_date
FROM customer
WHERE EXTRACT (MONTH FROM birth_date) = 6
UNION
SELECT first_name, last_name, street, city, zip, birth_date
FROM sales_person
WHERE EXTRACT(MONTH FROM birth_date) = 6
ORDER BY birth_date

SELECT product_id, price
FROM item
-- WHERE price = Null
WHERE price IS NOT NULL 

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'H%' OR last_name LIKE '%M';

SELECT EXTRACT (MONTH FROM birth_date)
AS Month, COUNT (*) AS Amount
FROM customer
GROUP BY Month
-- HAVING COUNT(*) > 1
ORDER BY Month

SELECT SUM(price) AS Value, COUNT (*) AS Items, ROUND (AVG(price), 2) AS Avg,
Min(price) AS Min, MAX(price) AS Max
FROM item

CREATE VIEW purchase_order_overview
AS 
SELECT sales_order.purchase_order_number, customer.company,
sales_item.quantity, product.supplier, product.name, item.price, 
(sales_item.quantity * item.price) AS total,
CONCAT(sales_person.first_name, ' ', sales_person.last_name) AS Salesperson
FROM sales_order
JOIN sales_item 
ON sales_item.sales_order_id = sales_order.id
JOIN item
ON item.id = sales_item.item_id
JOIN customer 
ON sales_order.cust_id = customer.id
JOIN product 
ON product.id = item.product_id
JOIN sales_person
ON sales_person.id = sales_order.sales_person_id
ORDER BY purchase_order_number
SELECT * FROM purchase_order_overview


CREATE OR REPLACE FUNCTION fn_add_ints(int, int)
RETURNS int
AS 'SELECT $1 + $2'
LANGUAGE SQL
SELECT fn_add_ints(4,5)

CREATE OR REPLACE FUNCTION fn_update_employee_state ()
RETURNS void as
$body$
UPDATE sales_person
SET state = 'CA'
WHERE state is null
$body$
LANGUAGE SQL
SELECT fn_update_employee_state()

CREATE OR REPLACE FUNCTION fn_max_product_price ()
RETURNS numeric as
$body$
SELECT MAX(price)
FROM item
$body$
LANGUAGE SQL
SELECT fn_max_product_price()

CREATE OR REPLACE FUNCTION fn_get_value_inventory ()
RETURNS numeric as
$body$
SELECT SUM(price)
FROM item
$body$
LANGUAGE SQL
SELECT fn_get_value_inventory()

CREATE OR REPLACE FUNCTION fn_number_customers ()
RETURNS numeric as
$body$
SELECT COUNT(*)
FROM customer
$body$
LANGUAGE SQL
SELECT fn_number_customers()

CREATE OR REPLACE FUNCTION fn_get_last_order ()
RETURNS sales_order as
$body$
SELECT *
FROM sales_order
ORDER BY time_order_taken DESC	
LIMIT 1
$body$
LANGUAGE SQL
SELECT (fn_get_last_order()).*;

CREATE OR REPLACE FUNCTION fn_get_employee_loc (locat varchar)
RETURNS SETOF sales_person as
$body$
SELECT * 
FROM sales_person
WHERE state = locat
$body$
LANGUAGE SQL
SELECT (fn_get_employee_loc('PA')).*

CREATE OR REPLACE FUNCTION fn_get_product_name(prod_name varchar)
RETURNS numeric AS $$
DECLARE
    product_price numeric;
BEGIN
    SELECT item.price
    INTO product_price
    FROM item
    NATURAL JOIN product
    WHERE product.name = prod_name;

    RETURN product_price;
END;
$$ LANGUAGE plpgsql;

SELECT fn_get_product_name('Sony')  

CREATE OR REPLACE FUNCTION fn_get_sales_people()
RETURNS SETOF sales_person AS $$
BEGIN
    RETURN QUERY
    SELECT *
	FROM sales_person;
END;
$$ LANGUAGE plpgsql;

SELECT (fn_get_sales_people()).*


