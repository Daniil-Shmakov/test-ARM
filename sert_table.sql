create table certificates
(id number(8) not null primary key,
 certificate_name varchar(32) not null,
 certificate_text varchar(255), 
 CreationDate date not null)
 