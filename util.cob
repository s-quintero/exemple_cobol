      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. UTIL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01 LS-STUDENT-ID PIC 9(4).
       01 LS-STUDENT-NAME PIC A(15).

       PROCEDURE DIVISION USING LS-STUDENT-ID, LS-STUDENT-NAME.
       DISPLAY 'In Called Program'.
       MOVE 1212 TO LS-STUDENT-ID.
