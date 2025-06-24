SELECT b.surname AS "Last name",b.firstname AS "First name", b.email AS "Email",b.dateenrolled AS "Added on"
FROM borrowers b
WHERE (b.email IS NOT NULL AND b.email <> "") AND dateenrolled BETWEEN <<Start Date|date>> AND  <<End Date|date>> 
