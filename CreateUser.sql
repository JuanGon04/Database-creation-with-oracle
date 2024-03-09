SET ECHO OFF
SET VERIFY OFF

SET HEADING OFF
SET FEEDBACK OFF

SPOOL hr_install.log

ACCEPT usr PROMPT 'Enter a name for the user: ' 

BEGIN
   IF '&usr' IS NULL THEN
      RAISE_APPLICATION_ERROR(-20999, 'Error: the name is null!');
   END IF;
END;
/

ACCEPT pass PROMPT 'Enter a password for the &usr:'  HIDE

BEGIN
   IF '&pass' IS NULL THEN
      RAISE_APPLICATION_ERROR(-20999, 'Error: the user password is mandatory! Please specify a password!');
   END IF;
END;
/

CREATE USER &usr IDENTIFIED BY &pass
               QUOTA UNLIMITED ON USERS;

GRANT CREATE MATERIALIZED VIEW,
      CREATE PROCEDURE,
      CREATE SEQUENCE,
      CREATE SESSION,
      CREATE SYNONYM,
      CREATE TABLE,
      CREATE TRIGGER,
      CREATE TYPE,
      CREATE VIEW
  TO &usr;

spool off

exit
