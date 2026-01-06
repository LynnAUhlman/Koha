  SELECT
  b.title AS "Title",
  FORMAT(SUM(IF(s.type = 'issue', 1, 0) + IF(s.type = 'renew', 1, 0)), 0
  ) AS "Total Circulation"
FROM
  statistics s
  LEFT JOIN items i USING (itemnumber)
  LEFT JOIN biblioitems bi ON i.biblioitemnumber = bi.biblioitemnumber
  LEFT JOIN biblio b ON bi.biblionumber = b.biblionumber
WHERE 
  DATE(s.datetime) BETWEEN <<Between|date>> AND <<and|date>>
  AND i.itemnotes LIKE '%wellness%'
GROUP BY b.biblionumber, b.title
ORDER BY b.title
