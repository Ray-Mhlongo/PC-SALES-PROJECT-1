-- ===============================
-- PC PARTS ANALYSIS QUERIES
-- ===============================

-- 1. What products are available in each province
SELECT Province, Part, Manufacturer, Shop, Price, Warranty
FROM Parts
ORDER BY Province, Part;

-- 2. Cheapest product per category
SELECT C.category_name, P.Part, P.Manufacturer, MIN(P.Price) AS Cheapest_Price
FROM Parts P
INNER JOIN part_categories C ON P.category_id = C.category_id
GROUP BY C.category_name, P.part, P.manufacturer;

-- 3. Price differences between shops (average price per shop per category)
SELECT S.shop_name, C.category_name, ROUND(AVG(P.Price), 2) AS Avg_Price
FROM Parts P
INNER JOIN Shop S ON P.shop_id = S.shop_id
INNER JOIN part_categories C ON P.category_id = C.category_id
GROUP BY S.shop_name, C.category_name
ORDER BY C.category_name, Avg_Price;

-- 4. Products with the highest warranties
SELECT Part, Manufacturer, Shop, Warranty
FROM Parts
ORDER BY Warranty DESC
LIMIT 10;

-- 5. Most and least expensive items per category
-- 5a. Most expensive
SELECT C.category_name, P.Part, P.Manufacturer, MAX(P.Price) AS Max_Price
FROM Parts P
INNER JOIN part_categories C ON P.category_id = C.category_id
GROUP BY C.category_name, P.part, P.manufacturer;

-- 5b. Least expensive
SELECT C.category_name, P.Part, P.Manufacturer, MIN(P.Price) AS Min_Price
FROM Parts P
INNER JOIN part_categories C ON P.category_id = C.category_id

GROUP BY C.category_name,  P.part, P.manufacturer;
