-- dataowner Has to be fixed or identifier should not be equal
UPDATE qgep_od.wastewater_structure
SET fk_dataowner = '00000000OG000006'--	"Inconnu"
where fk_dataowner IS NULL;

UPDATE qgep_od.wastewater_structure
SET fk_provider = '00000000OG000006'
where fk_provider IS NULL;

UPDATE qgep_od.wastewater_structure
SET fk_owner = '00000000OG000006'
where fk_owner IS NULL;

UPDATE qgep_od.wastewater_structure
SET fk_operator = '00000000OG000006'
where fk_operator IS NULL;