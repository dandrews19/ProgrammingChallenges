

-- 1. 

SELECT date, SUM(impressions)
FROM marketing_data
GROUP BY date;


-- 2.

SELECT state, SUM(revenue) as total_revenue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 3;

-- The third best state, Ohio, generated $37,577 in revenue

-- 3.


SELECT campaign_info.name as campaign_name, SUM(marketing_data.cost) as total_cost, SUM(marketing_data.impressions) as total_impressions, SUM(marketing_data.clicks) as total_clicks, 
SUM(website_revenue.revenue) as total_revenue
FROM marketing_data
LEFT JOIN website_revenue
ON marketing_data.campaign_id = website_revenue.campaign_id
LEFT JOIN campaign_info
ON marketing_data.campaign_id = campaign_info.id
GROUP BY marketing_data.campaign_id;


-- 4.

SELECT campaign_info.name as campaign_name, SUM(marketing_data.conversions) as total_conversions, website_revenue.state 
FROM marketing_data
LEFT JOIN website_revenue
ON marketing_data.campaign_id = website_revenue.campaign_id
LEFT JOIN campaign_info
ON marketing_data.campaign_id = campaign_info.id
WHERE campaign_info.name = 'Campaign5'
GROUP BY marketing_data.campaign_id, website_revenue.state
ORDER BY total_conversions DESC;

-- For Campaign5, Georgia generated the most conversions

-- 5.

SELECT campaign_info.name as campaign_name, (SUM(website_revenue.revenue) / SUM(marketing_data.cost)) as revenue_per_dollar_spent
FROM marketing_data
LEFT JOIN website_revenue ON marketing_data.campaign_id = website_revenue.campaign_id
LEFT JOIN campaign_info ON marketing_data.campaign_id = campaign_info.id
GROUP BY marketing_data.campaign_id
ORDER BY revenue_per_dollar_spent DESC;


-- Campaign4 was the most efficient because it got the most revenue per dollar spent on the campaign
