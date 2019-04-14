DROP TABLE rentals;
DROP TABLE customers;
DROP TABLE stocks;

CREATE TABLE stocks
(
  id SERIAL PRIMARY KEY,
  stock_item VARCHAR(255),
  size VARCHAR(255),
  product_image VARCHAR(255)
);

CREATE TABLE customers
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  wallet INT
);

CREATE TABLE rentals
(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  stock_id INT REFERENCES stocks(id) ON DELETE CASCADE
);
