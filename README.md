## Fact and Dimension Modelling

## Objective

The current database setup contains tables for customers, staff, stores, products, and product orders, following the relations depicted in an ER diagram. While this structure effectively stores the data, it may not be optimal for querying. The goal is to implement dimension modeling and create a snowflake schema that facilitates easier retrieval of the required information from the dataset.

![ER](https://github.com/user-attachments/assets/887448ec-1be7-4f91-ac0c-3c86fae0e42b)

Our goal is to analyze order details, customer information, and product data, specifically including brand and category details. To achieve this, we'll apply the principles of dimension modeling to construct a schema that encompasses these elements.

## Tables Before Modelling with No Relationships

![Screenshot 2024-10-26 032544](https://github.com/user-attachments/assets/73373833-8d6c-4259-a34b-62bfc541255b)

## Process

- I have created a seperate database for the files and imported the files into database.
- I have created a database for the project and started creating tables with proper relationships.
- Then, Inserted data by selecting the data from that seperate database.
- Implemented reverse engineering for visualization of ER-Diagram.

## Snowflake Schema

![Screenshot 2024-10-26 032638](https://github.com/user-attachments/assets/060b5202-84d9-453f-85f1-57be3e4441da)
