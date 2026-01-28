-- =========================================
-- PC Parts Price Analysis (South Africa)
-- Analysis Queries for Portfolio
-- =========================================

-- 1️ List all products available in each province
-- Shows which parts are sold in each province, along with shop, manufacturer, price, and warranty

SELECT Province, Part, Manufacturer, Shop, Price, Warranty
FROM Parts
ORDER BY Province, Part;

-- List distinct products per province
SELECT DISTINCT Province, Part
FROM Parts
ORDER BY Province, Part;

-- =========================================
-- 2️ Cheapest product per category
-- Finds the cheapest product in each part category.

SELECT C.category_name, P.Part, P.Manufacturer, MIN(P.Price) AS Cheapest_Price
FROM Parts P
JOIN part_categories C ON P.category_id = C.category_id
GROUP BY C.category_name, P.part, P.manufacturer;

-- =========================================
-- 3️ Price differences between shops
-- Shows the average price of each category per shop
SELECT S.shop_name, C.category_name, AVG(P.Price) AS Avg_Price
FROM Parts P
JOIN Shop S ON P.shop_id = S.shop_id
JOIN part_categories C ON P.category_id = C.category_id
GROUP BY S.shop_name, C.category_name
ORDER BY S.shop_name, C.category_name;

-- =========================================
-- 4️ Products with the highest warranties
-- Lists products sorted by warranty duration
SELECT Part, Manufacturer, Warranty
FROM Parts
ORDER BY Warranty DESC;

-- Product(s) with the absolute maximum warranty
SELECT Part, Manufacturer, Warranty
FROM Parts
WHERE Warranty = (SELECT MAX(Warranty) FROM Parts);

-- =========================================
-- 5️ Most and least expensive items per category
-- Most expensive product per category
SELECT C.category_name, P.Part, P.Manufacturer, MAX(P.Price) AS Max_Price
FROM Parts P
JOIN part_categories C ON P.category_id = C.category_id
GROUP BY C.category_name, P.part, P.manufacturer;

-- Least expensive product per category
SELECT C.category_name, P.Part, P.Manufacturer, MIN(P.Price) AS Min_Price
FROM Parts P
JOIN part_categories C ON P.category_id = C.category_id
GROUP BY C.category_name, P.part, P.manufacturer;
