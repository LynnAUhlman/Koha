---eric helped flesh this out with the json snippet and coalesces

SELECT 
  p.cardnumber AS "Patron card #",
  p.categorycode,
  p.othernames,
  p.surname,
  p.dateenrolled,
  p.address,
  p.city,
  p.state,
  p.dateexpiry,
  ac.timestamp AS "Created timestamp", 
  COALESCE(bd.cardnumber,bc.cardnumber) AS "Staff Card #",
  CONCAT(COALESCE(bd.firstname, bc.firstname), ' ', COALESCE(bd.surname,bc.surname)) AS "Created by Staff"
FROM borrowers p
LEFT JOIN (
  SELECT object, user, MAX(timestamp) as timestamp
  FROM action_logs 
  WHERE (module = 'MEMBERS' AND action LIKE "CRE%") 
  GROUP BY object
) ac ON ac.object = p.borrowernumber
LEFT JOIN 
	(SELECT object, user, timestamp
  	FROM action_logs 
	WHERE module = 'MEMBERS' AND JSON_EXTRACT(info, '$.cardnumber.before') = 'NULL' AND JSON_EXTRACT(info, '$.cardnumber.after') != 'NULL') ad ON (ad.object = p.borrowernumber)
LEFT JOIN borrowers bc ON ac.user = bc.borrowernumber
LEFT JOIN borrowers bd ON ad.user = bd.borrowernumber
WHERE p.dateenrolled BETWEEN  <<Between|date>> AND <<and|date>>
  AND p.categorycode <> 'SELF'
ORDER BY p.dateenrolled DESC
