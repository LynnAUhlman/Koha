SELECT *
FROM action_logs 
WHERE module = 'MEMBERS'
  AND action = 'MODIFY'
  AND timestamp BETWEEN <<Between|date>> AND <<and|date>>
GROUP BY object
