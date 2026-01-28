-- 1. Link Parts to Part Categories
UPDATE Parts AS P
JOIN part_categories AS C
  ON (P.Part LIKE '%RAM%' AND C.category_name = 'RAM')
     OR (P.Part LIKE '%Motherboard%' AND C.category_name = 'MOBO')
     OR (P.Part LIKE '%12GB%' AND C.category_name = 'GPU')
     OR (P.Part LIKE '%CPU%' AND C.category_name = 'CPU')
     OR (P.Part LIKE '%SSD%' AND C.category_name = 'Storage')
     OR (P.Part LIKE '%Power Supply%' AND C.category_name = 'PSU')
     OR (P.Part LIKE '%Monitor%' AND C.category_name = 'Screen')
SET P.category_id = C.category_id;

-- 2. Link Parts to Shops
UPDATE Parts AS P
JOIN Shop AS S
  ON TRIM(P.Shop) = TRIM(S.shop_name)
SET P.shop_id = S.shop_id;

-- 3. Link Parts to Manufacturers
UPDATE Parts AS P
JOIN Manufacturer AS M
  ON TRIM(P.Manufacturer) = TRIM(M.manufacturer_name)
SET P.manufacturer_id = M.manufacturer_id;

-- 4. Link Parts to Provinces
UPDATE Parts AS P
JOIN Province AS PR
  ON TRIM(P.Province) = TRIM(PR.province_name)
SET P.province_id = PR.province_id;