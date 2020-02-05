      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Test1.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01 Contrat.
              10  w-CodeContrat                  pic x(10).
       PROCEDURE DIVISION USING Contrat .
       MAIN-PROCEDURE.

            DISPLAY "w-CodeContrat module: "
            DISPLAY w-CodeContrat.

            STOP RUN.
