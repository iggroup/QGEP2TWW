-- Insert Municipalities

-- Prendre les clés dans la table qgep_od.organisation, chaque organisation doit être ventilée dans une table
INSERT INTO qgep_od.municipality (obj_id)
VALUES 
--( '00000000OG000000'),	--'Commune de Conthey'
( '00000000OG000001'),	--'Commune de Vétroz'
(  '00000000OG000002');	--'Commune de Ardon'

-- Insert Private / unknown
INSERT INTO qgep_od.private (obj_id)
VALUES

(  '00000000OG000003'),	--'Ribi SA'
(  '00000000OG000004'),	--'IG Group'
(  '00000000OG000005'),	--'EA'
--(  '00000000OG000006'),	--'Inconnu'
(  '00000000OG000007'),	--'jonathan.moullet'
(  '00000000OG000008'),	--'frederic.jacquier'
(  '00000000OG000009');	--'philippe.dessimoz'

-- Insert wastewater associations
/*INSERT INTO qgep_od.waste_water_association (obj_id)
VALUES
( 'ch13p7mzOG000015' );*/