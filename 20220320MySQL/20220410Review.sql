-- window function

SELECT *, ROW_NUMBER() OVER(PARTITION BY department ORDER BY spend_2014)
FROM percent_change;
