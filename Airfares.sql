#What range of years are represented in the data?
SELECT DISTINCT year FROM airfare
ORDER BY year ASC;

#What are the shortest and longest-distanced flights, and between which 2 cities are they?
SELECT MIN(nsmiles), city1, city2 FROM airfare
UNION
SELECT MAX(nsmiles), city1, city2 FROM airfare;

#How many distinct cities are represented in the data (regardless of whether it is the source or destination)?
SELECT COUNT(DISTINCT city1 UNION city2) FROM airfare;
