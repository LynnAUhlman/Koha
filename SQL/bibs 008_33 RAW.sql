SELECT 
  Substring(ExtractValue(metadata,'//controlfield[@tag=008]'), 34, 1) AS raw_code,
  COUNT(*) AS bibs
FROM biblio_metadata
GROUP BY raw_code
ORDER BY bibs DESC
