SELECT
    items.dateaccessioned,
    items.barcode,
    items.itemcallnumber,
    biblio.author,
    CONCAT(
        biblio.title, ' ',
        EXTRACTVALUE(
            (SELECT metadata
             FROM biblio_metadata bm
             WHERE bm.biblionumber = biblio.biblionumber),
            '//datafield[@tag="245"]/subfield[@code="b"]'
        )
    ) AS FullTitle
FROM biblio
JOIN items ON biblio.biblionumber = items.biblionumber
JOIN biblioitems ON biblioitems.biblionumber = biblio.biblionumber
JOIN biblio_metadata ON biblio_metadata.biblionumber = biblio.biblionumber
WHERE items.dateaccessioned BETWEEN <<BETWEEN|date>> AND <<AND(mm-dd-yyyy)|date>>
ORDER BY items.itemcallnumber
