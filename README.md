# Pizza Database

This database schema is designed to support a pizza delivery business, handling orders, customers, ingredients, recipes, staff scheduling, and inventory management. The following documentation outlines the structure and purpose of each table, as well as the relationships between them.

---

## Database Tables Overview

### 1. **Customer**
Stores information about customers.
- **cust_id**: Unique identifier for each customer (Primary Key).
- **cust_firstname**: Customer's first name.
- **cust_lastname**: Customer's last name.

---

### 2. **Address**
Stores delivery address details for orders.
- **add_id**: Unique identifier for each address (Primary Key).
- **delivery_address1**: First line of the delivery address.
- **delivery_address2**: Second line of the delivery address (optional).
- **delivery_city**: City of the delivery address.
- **delivery_zipcode**: ZIP code for the delivery address.

---

### 3. **Item**
Represents menu items available for ordering.
- **item_id**: Unique identifier for each menu item (Primary Key).
- **SKU**: Stock-keeping unit for the item.
- **item_name**: Name of the item (e.g., "Pepperoni Pizza").
- **item_cat**: Category of the item (e.g., "Pizza", "Side", "Drink").
- **item_size**: Size of the item (e.g., "Medium", "Large").
- **item_price**: Price of the item.

---

### 4. **Orders**
Tracks customer orders and their details.
- **row_id**: Unique identifier for each record (Primary Key).
- **order_id**: Unique order ID.
- **created_at**: Date and time the order was created.
- **cust_id**: Foreign Key referencing **Customer(cust_id)**.
- **item_id**: Foreign Key referencing **Item(item_id)**.
- **quantity**: Quantity of the item ordered.
- **delivery**: Boolean indicating whether the order is for delivery.
- **add_id**: Foreign Key referencing **Address(add_id)**.

---

### 5. **Recipe**
Defines the ingredients used in each menu item.
- **row_id**: Unique identifier for each record (Primary Key).
- **recipe_id**: Unique ID for the recipe.
- **ing_id**: Foreign Key referencing **Ingredient(ing_id)**.
- **quantity**: Quantity of the ingredient used.

---

### 6. **Ingredient**
Stores information about ingredients used in recipes.
- **ing_id**: Unique identifier for each ingredient (Primary Key).
- **ing_name**: Name of the ingredient.
- **ing_weight**: Weight per unit of the ingredient.
- **ing_meas**: Unit of measurement (e.g., grams, liters).
- **ing_price**: Price per unit.

---

### 7. **Inventory**
Tracks stock levels for each menu item.
- **inv_id**: Unique identifier for each inventory record (Primary Key).
- **item_id**: Foreign Key referencing **Item(item_id)**.
- **quantity**: Current stock quantity.

---

### 8. **Staff**
Stores details about employees.
- **staff_id**: Unique identifier for each staff member (Primary Key).
- **first_name**: Staff member's first name.
- **last_name**: Staff member's last name.
- **position**: Role of the staff member (e.g., "Chef", "Delivery Driver").
- **hourly_rate**: Hourly wage of the staff member.

---

### 9. **Shift**
Defines standard working shifts.
- **shift_id**: Unique identifier for each shift (Primary Key).
- **day_of_week**: Day of the week for the shift.
- **start_time**: Start time of the shift.
- **end_time**: End time of the shift.

---

### 10. **Rota**
Manages the scheduling of staff members for shifts.
- **row_id**: Unique identifier for each record (Primary Key).
- **rota_id**: Unique rota ID.
- **date**: Date of the shift.
- **shift_id**: Foreign Key referencing **Shift(shift_id)**.
- **staff_id**: Foreign Key referencing **Staff(staff_id)**.

---

## Entity Relationships
- **Customer** → **Orders**: One-to-Many
- **Address** → **Orders**: One-to-Many
- **Item** → **Orders**: One-to-Many
- **Item** → **Inventory**: One-to-One
- **Ingredient** → **Recipe**: One-to-Many
- **Shift** → **Rota**: One-to-Many
- **Staff** → **Rota**: One-to-Many

---

## Getting Started
1. Import the `Pizza Database.sql` file into your database management system (e.g., MySQL, PostgreSQL).
2. Review the table definitions and relationships.
3. Use this database to manage orders, inventory, recipes, and staff scheduling for a pizza business.

---

## Use Case Examples
1. **Customer Order Tracking**: Easily track which customers placed specific orders.
2. **Inventory Management**: Monitor stock levels of ingredients and menu items.
3. **Staff Scheduling**: Create rotas to manage employee shifts efficiently.
4. **Cost Analysis**: Calculate the cost of each recipe based on ingredient prices.

---


