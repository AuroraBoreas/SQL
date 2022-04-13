-- window function

SELECT *, ROW_NUMBER() OVER(PARTITION BY department ORDER BY spend_2014)
FROM percent_change;

SELECT *, RANK() OVER(PARTITION BY department ORDER BY spend_2014)
FROM percent_change;

-- with stmt

WITH cte01 AS (
SELECT 1
)
SELECT * FROM cte01;

WITH cte02 (col1, col2) AS (
SELECT 1, 2
)
SELECT * FROM cte02;

WITH RECURSIVE cte03 (col1) AS (
    (SELECT 1)
    UNION
    (SELECT col1 + 1 FROM cte03 WHERE col1 < 10)
)
SELECT * FROM cte03;
