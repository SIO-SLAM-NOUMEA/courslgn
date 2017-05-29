delete from comprend;
delete from consommation;
delete from facture;
delete from serveur;
delete from tabl;
drop table comprend;
drop table consommation;
drop table facture;
drop table serveur;
drop table tabl;
create table TABL
(
    NUMTABLE                        NUMBER(2)             not null,
    NOMTABLE                        CHAR(15)              not null,
    NBPLACE                         NUMBER(2)             not null
        constraint ck_tabl_nbplace check (NBPLACE between 1 and 8),
    constraint pk_tabl primary key (NUMTABLE)
);


create table FACTURE
(
    NUMFACTURE                      INTEGER               not null,
    NUMTABLE                        NUMBER(2)             not null,
    NUMSERVEUR                      INTEGER               not null,
    DATEFACTURE                     DATE                  not null,
    constraint pk_facture primary key (NUMFACTURE)
);


create index FACTURE_FK1 on FACTURE (NUMTABLE asc);


create index FACTURE_FK2 on FACTURE (NUMSERVEUR asc);


create table COMPREND
(
    NUMFACTURE                      INTEGER               not null,
    NUMCONS                         NUMBER(3)             not null,
    QTE                             NUMBER(2)                     ,
    constraint pk_comprend primary key (NUMFACTURE,NUMCONS)
);


create table CONSOMMATION
(
    NUMCONS                         NUMBER(3)             not null,
    LIBCONS                         CHAR(15)              not null,
    PRIXCONS                        NUMBER(6,2)           not null,
    constraint pk_consommation primary key (NUMCONS)
);


create table SERVEUR
(
    NUMSERVEUR                      INTEGER               not null,
    NOMSERVEUR                      CHAR(20)              not null,
    RUESERVEUR                      CHAR(20)              not null,
    CPSERVEUR                       NUMBER(5)             not null,
    VILLESERVEUR                    CHAR(20)              not null,
    DATENSERVEUR                    DATE                  not null,
    constraint pk_serveur primary key (NUMSERVEUR)
);

alter table FACTURE
    add constraint fk1_facture foreign key (NUMTABLE)
       references TABL (NUMTABLE);

alter table FACTURE
    add constraint fk2_facture foreign key (NUMSERVEUR)
       references SERVEUR (NUMSERVEUR);

alter table COMPREND
    add constraint fk1_comprend foreign key (NUMCONS)
       references CONSOMMATION (NUMCONS);

alter table COMPREND
    add constraint fk2_comprend foreign key (NUMFACTURE)
       references FACTURE (NUMFACTURE);

