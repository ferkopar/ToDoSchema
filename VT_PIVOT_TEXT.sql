--------------------------------------------------------
--  DDL for View VT_PIVOT_TEXT
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VT_PIVOT_TEXT" ("TEXT_ID", "'Magyar'", "'Angol'", "'Német'", "'Francia'", "'Olasz'") AS 
  SELECT "TEXT_ID","'Magyar'","'Angol'","'Német'","'Francia'","'Olasz'" from
(select
  (select language_name from dm_language dl where dl.language_id = dt.language_id) language_id,
  text_id, 
  names 
  FROM dm_text dt
 )
PIVOT
(
   min(names)
   FOR language_id IN ('Magyar','Angol','Német','Francia','Olasz')
);
