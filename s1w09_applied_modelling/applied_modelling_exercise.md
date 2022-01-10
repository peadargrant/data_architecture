% Applied modelling for databases

# Exercise

For each of these scenarios:
1. Construct the E-R model on paper.
2. Diagram the E-R model using GraphViz.
3. Implement your model as tables in the database.
   Implement as strict constraints as you possibly can.

## Scenario 0: task manager

(skip if you understand everything to date!)

Tasks have a due date and description.
Each task is linked to a single project.
Each task may be associated with a single client.
There may be tasks with no client.

## Scenario 1: gift shop

A gift shop chain sells items for a number of suppliers.
They require a database system to correctly reimburse suppliers at the end of each trading period.

Each supplier has a first name, surname and contact e-mail address. 
Each item is supplied by a single supplier, must have a description (unique across shop) and price.
Suppliers are free to change the price of a product at any time.
Each item may have a barcode associated with it that must be unique across the store.

The database will be populated with data from the store's cash register automatically.
Need to accurately record the sale of items in each store - must have the date / time of sale, store location, product, quantity sold and amount charged.

## Scenario X: your own data

Draw up model of a data scenario you have encountered.

