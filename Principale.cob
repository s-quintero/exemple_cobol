      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Principale.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

      *Declaration des variables SQL-Server
      * 77 CNXDB STRING

      *     EXEC SQL
      *         INCLUDE SQLCA
      *     END-EXEC.

      *     EXEC sql
      *         INCLUDE SQLDA
      *     END-EXEC.

       01  Verifications           pic XXX.
           88  v-ClientAssure      value '1'.


       01 Beneficiaire.
           10  w-CodeClient                pic x(10).
           10  w-ref_CompteClient          pic x(10).
           10  w-Intitule                  pic a(8).
           10  w-Nom                       pic x(20).
           10  w-Prenom                    pic x(20).
           10  w-DateNaissance             pic x(10).
           10  w-Adresse                   pic x(30).
           10  w-CodePostal                pic 9(5).
           10  w-Ville                     pic x(20).

       01  CompteClient pic X(10).

       01 Contrat.
              10  w-CodeContrat                  pic x(10).
              10  w-ref_CompteClient             pic x(10).
              10  w-DebutContrat                 pic x(10).
              10  w-FinContrat                   pic x(20).
              10  w-IT                           pic x.
              10  w-IT-debut                     pic x(10).
              10  w-IA                           pic x.
              10  w-IA-debut                     pic x(10).
              10  w-PE                           pic x.
              10  w-PE-debut                     pic x(10).
              10  w-DC                           pic x.
              10  w-DC-debut                     pic x(10).
              10  w-MT                           pic x.
              10  w-MT-debut                     pic x(10).
              10  w-CH                           pic x.
              10  w-CH-debut                     pic x(10).

       01  Sinistres.
           10  w-CodeSinistre            pic x(10).
           10  w-ref_CodeClient          pic x(10).
           10  w-ref_CodeContrat         pic x(10).
           10  w-DateSinistre            pic x(10).
           10  w-DateDeclaration         pic x(10).
           10  w-DateResolution          pic x(10).
           10  w-TypeSinistre            pic xx.

       01  ChoixTraitement.
              10 w-ID-trt                 pic x(8).
              10 w-TypeTraitement         pic xxx.
              10 w-ref_CompteClient       pic x(10).
              10 w-ref_CodeClient         pic x(10).
              10 w-ref_CodeContrat        pic x(10).
              10 w-ref_CodeSinitre        pic x(10).
              10 w-Intitule               pic x(8).
              10 w-Nom                    pic x(20).
              10 w-Prenom                 pic x(20).
              10 w-DateNaissance          pic x(10).
              10 w-Adresse                pic x(30).
              10 w-CodePostal             pic 9(5).
              10 w-Ville                  pic x(20).
              10 w-IT                     pic x.
              10 w-IT-debut               pic x(10).
              10 w-IA                     pic x.
              10 w-IA-debut               pic x(10).
              10 w-PE                     pic x.
              10 w-PE-debut               pic x(10).
              10 w-DC                     pic x.
              10 w-DC-debut               pic x(10).
              10 w-MT                     pic x.
              10 w-MT-debut               pic x(10).
              10 w-CH                     pic x.
              10 w-CH-debut               pic x(10).


       PROCEDURE DIVISION.

       InitProgramme.

      ************Connexion à la base de donnée**************
      *     MOVE "Trusted_Connection=yes;Database=GUEPES;server=SRF-EN2-04;factory=System.Data.SqlClient;" to cnxdb
      *     exec sql
      *       Connect using : CNXDB
      *     end-exec.

      * Mettre a ZERO les variables de traitement si necessaire

      *Accept a partir du web.

       VerificationClientAssure.
           perform VerificationClientAssure-Init.
           perform VerificationClientAssure-Trt.
           perform VerificationClientAssure-Fin.


       VerificationClientAssure-Init.
       Display 'Le client est assuré? (click oui non) 1, 0'
       accept  Verifications.
       if Verifications = 'oui' or 'Oui' move true to b-ClientAssure end-if.
       if Verifications = 'non' or 'Non' move false to b-ClientAssure end-if.

       VerificationClientAssure-Trt.

       if b-ClientAssure true perform MenuGestion
           else perform MenuInscription
       End-If.





      ************ CLIENT ASSURE **************
      *selection par le menu








      ************CLIENT NON ASSURE**************



      *accept a partir de l'option page web, table 4













            STOP RUN.
      * END PROGRAM Main.
