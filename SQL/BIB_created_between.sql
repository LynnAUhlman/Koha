SELECT b.title, b.biblionumber, b.datecreated
FROM biblio b
WHERE b.datecreated BETWEEN <<Between (yyyy-mm-dd)|date>> AND <<And (yyyy-mm-dd)|date>>
ORDER BY b.datecreated
