-- function

SELECT SUBSTR(name, 1, 1) ¼º,
       COUNT(*) ÀÎ¿ø
FROM customer
GROUP BY SUBSTR(name, 1, 1);
