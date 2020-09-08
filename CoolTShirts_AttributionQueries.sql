#number of distinct campaigns
SELECT COUNT(DISTINCT utm_campaign) FROM page_visits;

#number of distinct sources
SELECT COUNT(DISTINCT utm_source) FROM page_visits;

#how are these numbers related
SELECT DISTINCT utm_campaign, utm_source FROM page_visits;

#what pages are on the cooltshirts website?
SELECT DISTINCT page_name FROM page_visits;

#how many first touches is each campaign responsible for?
WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id),
first_touch_table AS (
  SELECT ft.user_id,
    ft.first_touch_at,
    pv.utm_source,
		pv.utm_campaign
  FROM first_touch ft
  JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp)

SELECT utm_campaign, utm_source, COUNT(*) FROM first_touch_table
GROUP BY 1,2
ORDER BY 3 DESC;

#how many last touches is each campaign responsible for?
WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id),
last_touch_table AS (
  SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
		pv.utm_campaign
  FROM last_touch lt
  JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp)

SELECT utm_campaign, utm_source, COUNT(*) FROM last_touch_table
GROUP BY 1,2
ORDER BY 3 DESC;

#how many visitors make a purchase?
SELECT page_name, COUNT(DISTINCT user_id) FROM page_visits
GROUP BY page_name;

#how many last touches on the purchase page is each campaign responsible for?
WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    WHERE page_name LIKE '4%'
    GROUP BY user_id),
last_touch_table AS (
  SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
		pv.utm_campaign
  FROM last_touch lt
  JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp)

SELECT utm_campaign, utm_source, COUNT(*) FROM last_touch_table
GROUP BY 1,2
ORDER BY 3 DESC;
