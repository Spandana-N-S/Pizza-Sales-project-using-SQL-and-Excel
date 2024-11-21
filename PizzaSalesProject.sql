Create database PizzaSales;
Use PizzaSales;

Select * from pizzaSales;

# Total Revenue
Select round(sum(totalPrice),2) as Total_Revenue from pizzaSales;

# Average Order Value
Select round(sum(totalPrice)/count(distinct(orderId)),2) as Average_Order_Value from pizzaSales;

# Total Pizza Sold
Select sum(quantity) as Total_Pizza_Sold from pizzaSales;

# Total Orders
Select count(distinct(orderId)) as Total_Orders from pizzaSales;

# Average Pizzas Per Order
Select round(sum(quantity)/count(distinct(orderId)),2) as Average_Pizzas_Per_Order from pizzaSales;


# Percentage of Sales by Pizza Category
Select pizzaCategory, round(round(sum(totalPrice),2) * 100 / (Select round(sum(totalPrice),2) from pizzaSales),2) as Percentage_of_Sales_by_Pizza_Category
from pizzaSales
group by pizzaCategory;

# Percentage of Sales by Pizza Size
Select pizzaSize, round(round(sum(totalPrice),2) * 100 / (Select round(sum(totalPrice),2) from pizzaSales),2) as Percentage_of_Sales_by_Pizza_Size
from pizzaSales
group by pizzaSize;

# Daily Trend for Total Orders
Select dayname(orderDate) as orderDay, count(Distinct orderId) as TotalOrders
from pizzaSales
group by orderDay;

# Monthly Trend for Total Orders
Select monthname(orderDate) as orderMonth, count(Distinct orderId) as TotalOrders
from pizzaSales
group by orderMonth
order by TotalOrders Desc;

# Total Pizzas Sold by Pizza Category
Select pizzaCategory, sum(quantity) as Pizza_Sold from pizzaSales
group by pizzaCategory
order by Pizza_Sold desc;

# Top 5 Pizzas by Revenue
Select pizzaName, round(sum(totalPrice),2) as Total_Sales from pizzaSales
group by pizzaName
order by Total_Sales desc
limit 5;

# Bottom 5 Pizzas by Revenue
Select pizzaName, round(sum(totalPrice),2) as Total_Sales from pizzaSales
group by pizzaName
order by Total_Sales
limit 5;

# Top 5 Pizzas by Quantity
Select pizzaName, sum(quantity) as Total_Quantity from pizzaSales
group by pizzaName
order by Total_Quantity desc
limit 5;

# Bottom 5 Pizzas by Quantity
Select pizzaName, sum(quantity) as Total_Quantity from pizzaSales
group by pizzaName
order by Total_Quantity
limit 5;

# Top 5 Pizzas by Total Orders
Select pizzaName, count(distinct(orderId)) as Total_Orders from pizzaSales
group by pizzaName
order by Total_Orders desc
limit 5;

# Bottom 5 Pizzas by Total Orders
Select pizzaName, count(distinct(orderId)) as Total_Orders from pizzaSales
group by pizzaName
order by Total_Orders
limit 5;