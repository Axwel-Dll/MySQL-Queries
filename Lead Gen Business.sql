#1
SELECT MONTHNAME(charged_datetime) as month, SUM(amount) as total_amount, charged_datetime as date
FROM `billing` 
WHERE YEAR(charged_datetime)=2012 && MONTH(charged_datetime)=03;

#2
SELECT c.client_id, SUM(b.amount) as total_revenue
FROM billing b
INNER JOIN clients c
ON b.client_id = c.client_id
WHERE c.client_id=2;

#3
SELECT s.domain_name as website, c.client_id
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
WHERE c.client_id=10;

#4
SELECT c.client_id, COUNT(s.site_id) as count_website, MONTHNAME(s.created_datetime) as month, YEAR(s.created_datetime) as year
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
WHERE c.client_id=1
GROUP BY s.created_datetime;

SELECT c.client_id, COUNT(s.site_id) as number_of_websites, MONTHNAME(s.created_datetime) as month_created, YEAR(s.created_datetime) as year_created
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
WHERE c.client_id=20
GROUP BY s.created_datetime;

#5
SELECT s.domain_name as website, COUNT(l.leads_id) as number_of_leads, DATE_FORMAT(l.registered_datetime, "%M %d, %Y")as date_generate
FROM sites s
INNER JOIN leads l
ON s.site_id = l.site_id
WHERE l.registered_datetime >= "2011/01/01" && l.registered_datetime <="2011/02/15"
GROUP BY s.site_id;

#6
SELECT CONCAT(c.first_name," ", c.last_name) as client_name, COUNT(l.leads_id) as count_leads
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
INNER JOIN leads l
ON l.site_id= s.site_id
WHERE l.registered_datetime >= "2011/01/01" && l.registered_datetime <="2011/12/31"
GROUP BY c.client_id;

#7
SELECT CONCAT(c.first_name," ", c.last_name) as client_name, COUNT(l.leads_id) as number_of_leads, MONTHNAME(l.registered_datetime) as month
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
INNER JOIN leads l
ON l.site_id= s.site_id
WHERE YEAR(l.registered_datetime) = 2011 && MONTH(l.registered_datetime) >= 1 &&  MONTH(l.registered_datetime) <= 6
GROUP BY s.site_id
ORDER BY MONTH(l.registered_datetime), c.client_id;

#8
SELECT CONCAT(c.first_name," ", c.last_name) as client_name, s.domain_name as website, COUNT(l.site_id) as number_of_leads, MONTHNAME(l.registered_datetime) as date_generated
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
INNER JOIN leads l
ON l.site_id= s.site_id
WHERE YEAR(l.registered_datetime) = 2011
GROUP BY s.domain_name
ORDER BY c.client_id, MONTH(l.registered_datetime);

SELECT CONCAT(c.first_name," ", c.last_name) as client_name, s.domain_name as website, COUNT(l.site_id) as number_of_leads
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
INNER JOIN leads l
ON l.site_id= s.site_id
GROUP BY website
ORDER BY c.client_id, number_of_leads DESC; 

#9
SELECT CONCAT(c.first_name," ", c.last_name) as client_name, SUM(b.amount) as month_charge, DATE_FORMAT(b.charged_datetime, "%M %Y") as year_charge
FROM billing b
INNER JOIN clients c
ON b.client_id = c.client_id
GROUP BY c.client_id, year_charge
ORDER BY c.client_id, YEAR(b.charged_datetime), MONTH(b.charged_datetime);

#10
SELECT CONCAT(c.first_name, c.last_name) as client_name, GROUP_CONCAT(s.domain_name SEPARATOR" / ") as sites 
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
GROUP BY c.client_id;