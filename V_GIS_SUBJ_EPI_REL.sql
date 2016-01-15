--------------------------------------------------------
--  DDL for View V_GIS_SUBJ_EPI_REL
--------------------------------------------------------

  CREATE OR REPLACE VIEW "V_GIS_SUBJ_EPI_REL" ("G_GIS_ID", "G_GIS_TYPE_ID", "G_COUNTRY", "G_CITY", "G_PLZ", "G_ADRESS", "G_STREET", "G_HOUSE_NUM", "G_LAT", "G_LON", "G_LATLON", "G_DESCRIPTION", "G_CRU", "G_CRD", "G_MDU", "G_MDD", "GSEP_REL_ID", "GSEP_REL_TYPE_ID", "GSEP_GIS_ID", "GSEP_SUBJ_ID", "GSEP_EPI_ID", "GSEP_DESCRIPTION", "GSEP_CRU", "GSEP_CRD", "GSEP_MDU", "GSEP_MDD") AS 
  SELECT g.GIS_ID g_GIS_ID,
    g.GIS_TYPE_ID g_GIS_TYPE_ID,
    g.COUNTRY g_COUNTRY,
    g.CITY g_CITY,
    g.PLZ g_PLZ,
    g.ADRESS g_ADRESS,
    g.STREET g_STREET,
    g.HOUSE_NUM g_HOUSE_NUM,
    g.LAT g_LAT,
    g.LON g_LON,
    g.LATLON g_LATLON,
    g.DESCRIPTION g_DESCRIPTION,
    --g.STAT_TYPE_ID g_STAT_TYPE_ID,
    g.CRU g_CRU,
    g.CRD g_CRD,
    g.MDU g_MDU,
    g.MDD g_MDD,
    gsep.REL_ID gsep_REL_ID,
    gsep.REL_TYPE_ID gsep_REL_TYPE_ID,
    --gsep.STAT_TYPE_ID gsep_STAT_TYPE_ID,
    gsep.GIS_ID gsep_GIS_ID,
    gsep.SUBJ_ID gsep_SUBJ_ID,
    gsep.EPI_ID gsep_EPI_ID,
    gsep.DESCRIPTION gsep_DESCRIPTION,
    gsep.CRU gsep_CRU,
    gsep.CRD gsep_CRD,
    gsep.MDU gsep_MDU,
    gsep.MDD gsep_MDD
  FROM GIS_DATA g,
    GIS_SUBJ_EPI_REL gsep
  WHERE gsep.GIS_ID=g.GIS_ID
  and BASE_PKG.RIGHTS_READ_ROW_F('GIS_SUBJ_EPI_REL',gsep.REL_ID,null)='Y';
