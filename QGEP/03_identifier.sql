SELECT qgep_sys.drop_symbology_triggers() ;
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN 
        SELECT table_schema, table_name
        FROM information_schema.tables
        WHERE table_schema = 'qgep_od'
          AND table_type = 'BASE TABLE'
    LOOP
        EXECUTE format('ALTER TABLE %I.%I DISABLE TRIGGER ALL;', r.table_schema, r.table_name);
    END LOOP;
END$$;

-- TODO remove audit triggers

ALTER TABLE qgep_od.file ADD COLUMN old_identifier VARCHAR (60);
UPDATE qgep_od.file SET old_identifier = identifier;
UPDATE qgep_od.file
SET identifier = obj_id;

ALTER TABLE qgep_od.maintenance_event ADD COLUMN old_identifier VARCHAR (60);
UPDATE qgep_od.maintenance_event SET old_identifier = identifier;
UPDATE qgep_od.maintenance_event
SET identifier = obj_id;

ALTER TABLE qgep_od.wastewater_structure ADD COLUMN old_identifier VARCHAR (60);
UPDATE qgep_od.wastewater_structure SET old_identifier = identifier;
UPDATE qgep_od.wastewater_structure
SET identifier = obj_id;

ALTER TABLE qgep_od.wastewater_networkelement ADD COLUMN old_identifier VARCHAR (60);
UPDATE qgep_od.wastewater_networkelement SET old_identifier = identifier;
UPDATE qgep_od.wastewater_networkelement
SET identifier = obj_id;

ALTER TABLE qgep_od.structure_part ADD COLUMN old_identifier VARCHAR (60);
UPDATE qgep_od.structure_part SET old_identifier = identifier;
UPDATE qgep_od.structure_part
SET identifier = obj_id;

ALTER TABLE qgep_od.reach_point ADD COLUMN old_identifier VARCHAR (60);
UPDATE qgep_od.reach_point SET old_identifier = identifier;
UPDATE qgep_od.reach_point
SET identifier = fk_wastewater_networkelement;

--Est-ce que ce n'est pas une des deux méthodes qui doit être utilisée'
UPDATE qgep_od.reach_point SET old_identifier = identifier;
UPDATE qgep_od.reach_point
SET identifier = obj_id
where identifier IS NULL OR identifier = '';

--SELECT obj_id FROM qgep_od.vw_qgep_wastewater_structure
--where identifier IS NULL OR identifier = '';
-- Pour supprimer des couples (fk_owner, identifier) (NULL, NULL) à double
--UPDATE qgep_od.vw_qgep_wastewater_structure
--SET fk_owner = '3'
--where identifier IS NULL OR identifier = '';