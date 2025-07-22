SELECT *
FROM action_logs 
WHERE module = 'MEMBERS'
  AND LEFT(action, 4) = 'CREA'
  AND SUBSTRING_INDEX(action, '_', -1) != 'RESTRICTION'
  AND timestamp BETWEEN <<Between|date>> AND <<and|date>>
GROUP BY object
