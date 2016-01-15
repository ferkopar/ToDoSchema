--------------------------------------------------------
--  Constraints for Table CELL_COMMENTS
--------------------------------------------------------

  ALTER TABLE "CELL_COMMENTS" ADD CONSTRAINT "PK_CCOM_CC" PRIMARY KEY ("CELL_COMMETNT_ID") ENABLE;
 
  ALTER TABLE "CELL_COMMENTS" MODIFY ("CELL_COMMETNT_ID" NOT NULL ENABLE);
