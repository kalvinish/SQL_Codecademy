# What is the number of responses for each question?
SELECT question, COUNT(*) AS 'Number of Respondents' FROM survey
GROUP BY 1
ORDER BY 1 ASC;

# How many customers in total:
SELECT COUNT(DISTINCT user_id) FROM survey;

# Percentage of customers who take the quiz questions:
SELECT 500.0/500.0*100.0;
SELECT 475.0/500.0*100.0;
SELECT 380.0/475.0*100.0;
SELECT 361.0/380.0*100.0;
SELECT 270.0/361.0*100.0;

# Left Join of Home Try-On Funnel:
SELECT * FROM quiz q
LEFT JOIN home_try_on h
  ON q.user_id=h.user_id
LEFT JOIN purchase p
  ON q.user_id=p.user_id
LIMIT 10;

# Count of customers at each stage of purchase funnel:
SELECT COUNT(q.user_id) AS 'Customers at Quiz',
  COUNT(h.user_id) AS 'Customers at Home Try-On',
  COUNT(p.user_id) AS 'Customers at Purchase'
FROM quiz q
LEFT JOIN home_try_on h
  ON q.user_id=h.user_id
LEFT JOIN purchase p
  ON q.user_id=p.user_id;

# Percentage of customers at different stages of the Purchase Funnel
SELECT 750.0/1000.0*100.0;
SELECT 495.0/750.0*100.0;
SELECT 495.0/1000.0*100.0;

# Difference in purchase rates between 5 and 3 numbers of pairs
SELECT h.number_of_pairs, COUNT(p.user_id) AS 'Purchases'
FROM home_try_on h
LEFT JOIN purchase p
  ON p.user_id = h.user_id
GROUP BY 1;

# Different purchases from different colours:
SELECT color AS 'Colour',
  COUNT(user_id) AS 'Number of Purchases'
FROM purchase
GROUP BY 1
ORDER BY 2 DESC;

# Average price of purchase
SELECT AVG(price) FROM purchase;
