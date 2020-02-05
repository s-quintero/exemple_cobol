      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM.
       DATA DIVISION.
       WORKING-STORAGE SECTION.


      *Declaration des variables SQL-Server
       77 CNXDB STRING.
           EXEC SQL
               INCLUDE SQLCA
           END-EXEC.
           EXEC sql
               INCLUDE SQLDA
           END-EXEC.






       LINKAGE SECTION.
       01 PARAMETRES.
           02 PA-RETURN-CODE PIC 99 VALUE 0.




       PROCEDURE DIVISION USING PARAMETRES.


      ************Connexion à la base de donnée**************
          MOVE "Trusted_Connection=yes;Database=GUEPES;server=SRF-EN2-04;factory=System.Data.SqlClient;" to cnxdb
           exec sql
             Connect using : CNXDB
           end-exec.

      ************ Choix de l'option Autocommit**************
           EXEC sql
             SET AUTOCOMMIT ON
           END-EXEC.






       MAIN-PROCEDURE.
           DISPLAY "Hello world"
           MOVE 0 TO PA-RETURN-CODE
           STOP RUN.


       ExampleFctn.


      *DECLARE CURSOR EXAMPLES

      *EXAMPLE 1
           exec sql
             declare C-Listebanque cursor for
               select CodeBanque, NomBanque from Banque
                   Order by NomBanque
           end-exec.

      *EXAMPLE 2
           exec sql
               declare C-ListeComptes cursor for
               select PrenomNom, CodeBanque, CodeGuichet, RacineCompte, TypeCompte, CleRIB, Debit, Credit, Solde from vuecompte
               where nom = :selectionClient
               order by CodeBanque
           end-exec.

      *EXAMPLE 3
           exec sql
             declare C-ListeCalculCleRIB cursor for
             select Nom, Prenom, NomBanque, CodeGuichet, RacineCompte, TypeCompte, CleRIB, Codebanque  from VueRIB
             order by Nom
           end-exec.

      *EXAMPLE 4
           exec sql
               declare C-donneesclient cursor for
               select Nom, Prenom, CodePostal, Ville, CodeBanque, NomBanque, CodeGuichet, RacineCompte, TypeCompte, Clerib, Debit, Credit from vuegestionclient
               where nom = :selectionClient
               order by CodeBanque
           end-exec.

      *EXAMPLE 5
           exec sql
             declare C-NomBanque cursor for
               select CodeBanque, NomBanque from vuegestionclient
               where CodeBanque = :CodeBanque
           end-exec.

      *OPEN THE CURSOR
           exec sql
             Open C-ListeBanque
           end-exec.

       ExampleFctnTrt.
      *FETCH FROM CURSOR
           exec sql
               fetch C-ListeBanque into :CdeBanque, :NomBanque
           end-exec

           exec sql
           fetch C-ListeComptes into :PrenomNom, :codebanque, :codeguichet, :racinecompte, :typecompte, :clerib, :DebitCompte, :CreditCompte, :SoldeCompte
           end-exec.


           if SQLCODE = 1 or SQLCODE = 0 then
               perform trtLigneBanque
               perform ImpressionSurLeFichier
           else
               move 'fin' to FinDeListeClesRIB
           end-if.


       ExampleFctnFin.
           exec sql
           close C-ListeCalculCleRIB
           end-exec.



       END PROGRAM YOUR-PROGRAM.
