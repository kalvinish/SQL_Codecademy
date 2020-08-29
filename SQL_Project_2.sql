#What are the Top 25 schools (.edu domains)?
SELECT email_domain, COUNT(email_domain) FROM users
GROUP BY email_domain
ORDER BY COUNT(email_domain) DESC LIMIT 25;

#How many .edu learners are located in New York?
SELECT COUNT(*) FROM users
WHERE city = 'New York';

#The mobile_app column contains either mobile-user or NULL.
#How many of these Codecademy learners are using the mobile app?
SELECT COUNT(*) FROM users
WHERE mobile_app = 'mobile-user';

#query for the sign up counts for each hour.
SELECT strftime('%H', sign_up_at),
	COUNT(*)
FROM users
GROUP BY 1
ORDER BY 1 ASC;

#Do different schools (.edu domains) prefer different courses?
SELECT u.email_domain,
    p.learn_cpp,
    p.learn_sql,
    p.learn_html,
    p.learn_javascript,
    p.learn_java
FROM users u
JOIN progress p
    ON p.user_id = u.user_id
GROUP BY 1;
