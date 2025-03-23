SELECT DISTINCT geolocation_zip_code_prefix INTO ZIP_codes
FROM geo_location



select * from ZIP_codes 


INSERT INTO New_Geolocation (geolocation_zip_code_prefix)
SELECT DISTINCT seller_zip_code_prefix
FROM Sellers
WHERE seller_zip_code_prefix NOT IN (
    SELECT geolocation_zip_code_prefix FROM New_Geolocation
)

INSERT INTO New_Geolocation (geolocation_zip_code_prefix)
SELECT DISTINCT customer_zip_code_prefix
FROM Customers
WHERE customer_zip_code_prefix NOT IN (
    SELECT geolocation_zip_code_prefix FROM New_Geolocation
)

SELECT DISTINCT geolocation_zip_code_prefix
FROM geo_location
WHERE geolocation_zip_code_prefix NOT IN (
    SELECT geolocation_zip_code_prefix FROM ZIP_codes
)

select * into GEOII 
from geo_location

WITH CTE AS (
    SELECT 
        geolocation_zip_code_prefix, 
        ROW_NUMBER() OVER (PARTITION BY geolocation_zip_code_prefix ORDER BY (SELECT NULL)) AS rn
    FROM GEOII 
)
DELETE FROM GEOII 
WHERE geolocation_zip_code_prefix IN (
    SELECT geolocation_zip_code_prefix FROM CTE WHERE rn > 1
);

drop table GEOII

SELECT geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state, COUNT(*) AS duplicate_count
FROM geo_location
GROUP BY geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state
HAVING COUNT(*) > 1;

 
SELECT DISTINCT geolocation_zip_code_prefix   into GEOII
FROM geo_location

select geolocation_lng,geolocation_lat, geolocation_city, geolocation_state
from GEOII ge inner join geo_location gg
on ge.geolocation_zip_code_prefix=gg.geolocation_zip_code_prefix

select * from GEOII

ALTER TABLE GEOII 
ADD geolocation_lng FLOAT, 
 geolocation_lat FLOAT, 
 geolocation_city VARCHAR(200), 
 geolocation_state VARCHAR(200)

INSERT INTO GEOII (geolocation_zip_code_prefix, geolocation_lng, geolocation_lat, geolocation_city, geolocation_state)
SELECT DISTINCT gg.geolocation_zip_code_prefix, gg.geolocation_lng, gg.geolocation_lat, gg.geolocation_city, gg.geolocation_state
FROM geo_location gg
LEFT JOIN GEOII ge ON gg.geolocation_zip_code_prefix = ge.geolocation_zip_code_prefix
WHERE ge.geolocation_zip_code_prefix IS NULL;

truncate table GEOII

INSERT INTO GEOII (geolocation_zip_code_prefix, geolocation_lng, geolocation_lat, geolocation_city, geolocation_state)
SELECT geolocation_zip_code_prefix, geolocation_lng, geolocation_lat, geolocation_city, geolocation_state
FROM geo_location
GROUP BY geolocation_zip_code_prefix, geolocation_lng, geolocation_lat, geolocation_city, geolocation_state