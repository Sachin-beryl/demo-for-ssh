CREATE TYPE status AS ENUM (
  'Approved',                
  'pending',         
  'cancelled',    
  'waiting'                 
);


CREATE TYPE score AS ENUM (
  '1',
  '2',
  '3',
  '4',
  '5'
);

CREATE TYPE type AS ENUM (
  'Veg',
  'non_veg',
  'veg_and_non_veg'
);

CREATE TABLE restaurants (
  id BIGSERIAL PRIMARY KEY,
   name varchar(50),
  "type" type,
  "address" varchar(100),
  "open_time" timestamp,
  "close_time" timestamp,
  "ratings" score
);

CREATE TABLE menu_items (
  id BIGSERIAL PRIMARY KEY,
  restaurant_id integer,
  name varchar(50),
  price integer,
  Description varchar(100)
);

CREATE TABLE customers (
  id BIGSERIAL PRIMARY KEY,
  "First_name" varchar(20),
  "Last_name" varchar(20),
  "Email" varchar(100),
  "Phone" int,
  "Username" varchar(50),
  "Password" varchar(50),
  "Address" varchar(150),
  "Created_at" timestamp
);

CREATE TABLE orders (
  id BIGSERIAL PRIMARY KEY,
  "Customer_id" integer,
  "Created_at" timestamp
);

CREATE TABLE order_details (
  id BIGSERIAL PRIMARY KEY,
  "Order_id" integer,
  "quantity" integer
);

CREATE TABLE payments (
  id BIGSERIAL PRIMARY KEY,
  "Order_id" integer,
  "amount" integer,
  "Date" timestamp
);

CREATE TABLE ratings (
  id BIGSERIAL PRIMARY KEY,
  "menu_id" integer,
  "Score" score,
  "Remarks" varchar(200),
  "Date" timestamp,
  "Customer_id" integer
);

CREATE TABLE cart_items (
  id BIGSERIAL PRIMARY KEY,
  "Customer_id" integer,
  "menu_id" integer,
  "quantity" integer,
  "Created_at" timestamp,
  "Updated_at" timestamp
);

CREATE TABLE checkout_details (
  id BIGSERIAL PRIMARY KEY,
  "Order_id" integer,
  "Check_at" timestamp,
  "Address" varchar(150),
  "Delivery_charge" integer
);

CREATE TABLE Order_status (
  id BIGSERIAL PRIMARY KEY,
  "Customer_id" integer,
  "menu_id" integer,
  "Status" status,
  "time" timestamp
);

ALTER TABLE "menu_items" ADD FOREIGN KEY ("restaurant_id") REFERENCES "restaurants" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY ("Customer_id") REFERENCES "customers" ("id");

ALTER TABLE "ratings" ADD FOREIGN KEY ("menu_id") REFERENCES "menu_items" ("id");

ALTER TABLE "ratings" ADD FOREIGN KEY ("Customer_id") REFERENCES "customers" ("id");

ALTER TABLE "cart_items" ADD FOREIGN KEY ("Customer_id") REFERENCES "customers" ("id");

ALTER TABLE "cart_items" ADD FOREIGN KEY ("menu_id") REFERENCES "menu_items" ("id");

ALTER TABLE "checkout_details" ADD FOREIGN KEY ("Order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_status" ADD FOREIGN KEY (order_id) REFERENCES "orders" ("id");

ALTER TABLE "orders" ADD FOREIGN KEY (menu_id) REFERENCES "menu_items" ("id");

ALTER TABLE "order_details" ADD FOREIGN KEY ("Order_id") REFERENCES "orders" ("id");

ALTER TABLE "payments" ADD FOREIGN KEY ("Order_id") REFERENCES "orders" ("id");









example :- insert into restaurants (name,type,address,open_time,close_time,ratings)
values('The Breakfast club','Veg','Neelam chowk','09:00 AM','12:00 PM', '4');

