--------------------------------------------------------
--  Constraints for Table GIS_SPATIAL
--------------------------------------------------------

  ALTER TABLE "GIS_SPATIAL" ADD CONSTRAINT "PK_GIS_SPATIAL" PRIMARY KEY ("GIS_SPATIAL_ID") ENABLE;
 
  ALTER TABLE "GIS_SPATIAL" MODIFY ("GIS_SPATIAL_ID" NOT NULL DISABLE);
 
  ALTER TABLE "GIS_SPATIAL" MODIFY ("SUBJ_PARAM_ID" NOT NULL DISABLE);
