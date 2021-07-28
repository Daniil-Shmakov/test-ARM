CREATE SEQUENCE  "HR"."CERT_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
CREATE SEQUENCE  "HR"."PERSONS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
commit;
/
create table certificates
(id number(8) not null primary key,
 certificate_name varchar(32) not null,
 certificate_text varchar(255), 
 CreationDate date not null);

create table persons
(id number(8) not null primary key,
 name varchar(255) not null,
 Birthdate date not null, 
 CreationDate date not null);

commit;

create or replace
TRIGGER Cert_autoID 
BEFORE INSERT ON Certificates 
FOR EACH ROW
BEGIN
  SELECT Cert_ID_SEQ.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
create or replace
TRIGGER Persons_autoID 
BEFORE INSERT ON Persons 
FOR EACH ROW
BEGIN
  SELECT persons_ID_SEQ.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
