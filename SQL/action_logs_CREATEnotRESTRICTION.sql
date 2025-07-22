SELECT *
FROM action_logs 
WHERE module = 'MEMBERS'
  AND action LIKE 'Crea%'
  AND action NOT LIKE '%_RESTRICTION'
  AND timestamp BETWEEN <<Between|date>> AND <<and|date>>
GROUP BY object
