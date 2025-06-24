SELECT biblio.title,biblio.author,items.itemcallnumber,items.barcode,items.datelastborrowed,items.withdrawn_on,items.deleted_on
FROM items
LEFT JOIN biblioitems on items.biblioitemnumber=biblioitems.biblioitemnumber
LEFT JOIN biblio on biblioitems.biblionumber=biblio.biblionumber
WHERE items.withdrawn_on IS NOT NULL

UNION

SELECT biblio.title,biblio.author,deleteditems.itemcallnumber,deleteditems.barcode,deleteditems.datelastborrowed,deleteditems.withdrawn_on,deleteditems.deleted_on 
FROM deleteditems
LEFT JOIN biblioitems on deleteditems.biblioitemnumber=biblioitems.biblioitemnumber
LEFT JOIN biblio on biblioitems.biblionumber=biblio.biblionumber
