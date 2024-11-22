-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE TABLE "Orders" (
    "row_id" int   NOT NULL,
    "order_id" varchar(10)   NOT NULL,
    "created_at" datetime   NOT NULL,
    "cust_id" int   NOT NULL,
    "item_id" varchar(10)   NOT NULL,
    "quantity" int   NOT NULL,
    "delivery" boolean   NOT NULL,
    "add_id" int   NOT NULL,
    CONSTRAINT "pk_Orders" PRIMARY KEY (
        "row_id"
     )
);

CREATE TABLE "Customer" (
    "cust_id" int   NOT NULL,
    "cust_firstname" varchar(50)   NOT NULL,
    "cust_lastname" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Customer" PRIMARY KEY (
        "cust_id"
     )
);

CREATE TABLE "Address" (
    "add_id" int   NOT NULL,
    "delivery_address1" varchar(200)   NOT NULL,
    "delivery_address2" varchar(200)   NULL,
    "delivery_city" varchar(50)   NOT NULL,
    "delivery_zipcode" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Address" PRIMARY KEY (
        "add_id"
     )
);

CREATE TABLE "Item" (
    "item_id" varchar(10)   NOT NULL,
    "SKU" varchar(20)   NOT NULL,
    "item_name" varchar(50)   NOT NULL,
    "item_cat" varchar(50)   NOT NULL,
    "item_size" varchar(20)   NOT NULL,
    "item_price" decimal(5,2)   NOT NULL,
    CONSTRAINT "pk_Item" PRIMARY KEY (
        "item_id"
     )
);

CREATE TABLE "Recipe" (
    "row_id" int   NOT NULL,
    "recipe_id" varchar(20)   NOT NULL,
    "ing_id" varchar(10)   NOT NULL,
    "quantity" int   NOT NULL,
    CONSTRAINT "pk_Recipe" PRIMARY KEY (
        "row_id"
     )
);

CREATE TABLE "Ingredient" (
    "ing_id" varchar(10)   NOT NULL,
    "ing_name" varchar(200)   NOT NULL,
    "ing_weight" int   NOT NULL,
    "ing_meas" varchar(20)   NOT NULL,
    "ing_price" decimal(5,2)   NOT NULL,
    CONSTRAINT "pk_Ingredient" PRIMARY KEY (
        "ing_id"
     )
);

CREATE TABLE "Rota" (
    "row_id" int   NOT NULL,
    "rota_id" varchar(20)   NOT NULL,
    "date" datetime   NOT NULL,
    "shift_id" varchar(20)   NOT NULL,
    "staff_id" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Rota" PRIMARY KEY (
        "row_id"
     )
);

CREATE TABLE "Staff" (
    "Staff_id" varchar(20)   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "position" varchar(100)   NOT NULL,
    "hourly_rate" decimal(5,2)   NOT NULL,
    CONSTRAINT "pk_Staff" PRIMARY KEY (
        "Staff_id"
     )
);

CREATE TABLE "Shift" (
    "shift_id" varchar(20)   NOT NULL,
    "day_of_week" varchar(10)   NOT NULL,
    "start_time" time   NOT NULL,
    "end_time" time   NOT NULL,
    CONSTRAINT "pk_Shift" PRIMARY KEY (
        "shift_id"
     )
);

CREATE TABLE "Inventory" (
    "inv_id" int   NOT NULL,
    "item_id" varchar(10)   NOT NULL,
    "quantity" int   NOT NULL,
    CONSTRAINT "pk_Inventory" PRIMARY KEY (
        "inv_id"
     )
);

ALTER TABLE "Customer" ADD CONSTRAINT "fk_Customer_cust_id" FOREIGN KEY("cust_id")
REFERENCES "Orders" ("cust_id");

ALTER TABLE "Address" ADD CONSTRAINT "fk_Address_add_id" FOREIGN KEY("add_id")
REFERENCES "Orders" ("add_id");

ALTER TABLE "Item" ADD CONSTRAINT "fk_Item_item_id" FOREIGN KEY("item_id")
REFERENCES "Orders" ("item_id");

ALTER TABLE "Recipe" ADD CONSTRAINT "fk_Recipe_recipe_id" FOREIGN KEY("recipe_id")
REFERENCES "Item" ("SKU");

ALTER TABLE "Ingredient" ADD CONSTRAINT "fk_Ingredient_ing_id" FOREIGN KEY("ing_id")
REFERENCES "Recipe" ("ing_id");

ALTER TABLE "Staff" ADD CONSTRAINT "fk_Staff_Staff_id" FOREIGN KEY("Staff_id")
REFERENCES "Rota" ("staff_id");

ALTER TABLE "Shift" ADD CONSTRAINT "fk_Shift_shift_id" FOREIGN KEY("shift_id")
REFERENCES "Rota" ("shift_id");

ALTER TABLE "Inventory" ADD CONSTRAINT "fk_Inventory_item_id" FOREIGN KEY("item_id")
REFERENCES "Recipe" ("ing_id");

