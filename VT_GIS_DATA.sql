--------------------------------------------------------
--  DDL for View VT_GIS_DATA
--------------------------------------------------------

  CREATE OR REPLACE VIEW "VT_GIS_DATA" ("GIS_ID", "GIS_TYPE_ID", "T_GIS_TYPE_NAME", "COUNTRY", "CITY", "PLZ", "ADRESS", "STREET", "HOUSE_NUM", "LAT", "LON", "LATLON", "DESCRIPTION", "CRU", "CRD", "MDU", "MDD") AS 
  SELECT GIS_ID,
    GIS_TYPE_ID,
    BASE_PKG.DM_TRANSLATE_F ('DM_SUPER_TYP' ,'TYPE_ID' ,GIS_TYPE_ID ,BASE_PKG.V_LANG_F ) T_GIS_TYPE_NAME,
    COUNTRY,
    CITY,
    PLZ,
    ADRESS,
    STREET,
    HOUSE_NUM,
    LAT,
    LON,
    LATLON,
    DESCRIPTION,
    CRU,
    CRD,
    MDU,
    MDD
  FROM GIS_DATA
  WHERE BASE_PKG.RIGHTS_READ_ROW_F('GIS_DATA',GIS_ID,STATUS_ID)='Y';
