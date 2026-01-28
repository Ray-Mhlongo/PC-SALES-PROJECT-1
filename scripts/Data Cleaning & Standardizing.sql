-- 1. Remove extra spaces from Part, Manufacturer, Shop, Province columns
UPDATE Parts
SET Part = TRIM(Part),
    Manufacturer = TRIM(Manufacturer),
    Shop = TRIM(Shop),
    Province = TRIM(Province);

-- 2. Standardize dashes in part names 
UPDATE Parts
SET Part = REPLACE(Part, '-', ' ');

-- 3. Standardize CPU names starting with "i" 
UPDATE Parts
SET Part = CONCAT(
  SUBSTRING(Part, 1, 2), ' ',
  SUBSTRING(Part, 3)
)
WHERE Part LIKE 'i%';

-- 4. Fix duplicate/misspelled manufacturer names if any
UPDATE Parts
SET Manufacturer = 'ASRock'
WHERE Manufacturer LIKE 'ASROCK';

-- 5. Ensure consistent province names
UPDATE Parts
SET Province = 'KwaZulu-Natal'
WHERE Province LIKE '%KwaZulu-Natal%';

UPDATE Parts
SET Province = 'Western Cape'
WHERE Province LIKE '%Western Cape%';

UPDATE Parts
SET Province = 'Gauteng'
WHERE Province LIKE '%Gauteng%';

-- 6. Remove exact duplicate rows
DELETE p1 FROM Parts p1
INNER JOIN Parts p2 
WHERE 
    p1.parts_id > p2.parts_id AND
    p1.Part = p2.Part AND
    p1.Manufacturer = p2.Manufacturer AND
    p1.Shop = p2.Shop AND
    p1.Province = p2.Province AND
    p1.Price = p2.Price AND
    p1.Warranty = p2.Warranty;
