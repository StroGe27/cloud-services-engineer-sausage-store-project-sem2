ALTER TABLE product
ADD COLUMN price double precision;

UPDATE product p
SET price = pi.price
FROM product_info pi
WHERE p.id = pi.product_id;

ALTER TABLE orders
ADD COLUMN date_created date;

UPDATE orders o
SET date_created = od.date_created,
    status = COALESCE(o.status, od.status)
FROM orders_date od
WHERE o.id = od.order_id;

ALTER TABLE product
ADD CONSTRAINT product_pkey PRIMARY KEY (id);
ALTER TABLE orders
ADD CONSTRAINT orders_pkey PRIMARY KEY (id);

ALTER TABLE order_product
ADD CONSTRAINT fk_order_product_product
FOREIGN KEY (product_id) REFERENCES product(id);
ALTER TABLE order_product
ADD CONSTRAINT fk_order_product_orders
FOREIGN KEY (order_id) REFERENCES orders(id);

DROP TABLE product_info;
DROP TABLE orders_date;
