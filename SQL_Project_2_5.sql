#What courses are the New Yorkers/Chicago students taking?
WITH cpp AS (
    SELECT u.city, COUNT(*) AS cpp
    FROM users u
    JOIN progress p
        ON p.user_id = u.user_id
    WHERE p.learn_cpp = 'completed' OR p.learn_cpp = 'started'
    GROUP BY 1
),
sql AS (
    SELECT u.city, COUNT(*) AS sql FROM users u
    JOIN progress p
        ON p.user_id = u.user_id
    WHERE p.learn_sql = 'completed' OR p.learn_sql = 'started'
    GROUP BY 1
),
html AS (
    SELECT u.city, COUNT(*) AS html FROM users u
    JOIN progress p
        ON p.user_id = u.user_id
    WHERE p.learn_html = 'completed' OR p.learn_html = 'started'
    GROUP BY 1
),
javascript AS (
    SELECT u.city, COUNT(*) AS javascript FROM users u
    JOIN progress p
        ON p.user_id = u.user_id
    WHERE p.learn_javascript = 'completed' OR p.learn_javascript = 'started'
    GROUP BY 1
),
java AS (
    SELECT u.city, COUNT(*) AS java FROM users u
    JOIN progress p
        ON p.user_id = u.user_id
    WHERE p.learn_java = 'completed' OR p.learn_java = 'started'
    GROUP BY 1
)
SELECT c.city, c.cpp, s.sql, h.html, j.javascript, i.java
FROM cpp c
JOIN sql s
    ON c.city=s.city
JOIN html h
    ON c.city=h.city
JOIN javascript j
    ON c.city=j.city
JOIN java i
    ON c.city=i.city
WHERE c.city = 'New York' or c.city = 'Chicago';
