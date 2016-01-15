--------------------------------------------------------
--  Ref Constraints for Table GIS_REL_PARAM
--------------------------------------------------------

  ALTER TABLE "GIS_REL_PARAM" ADD CONSTRAINT "FK_GDRE_GRPM" FOREIGN KEY ("GIS_REL_ID")
	  REFERENCES "GIS_DATA_REL" ("GIS_REL_ID") DISABLE;
