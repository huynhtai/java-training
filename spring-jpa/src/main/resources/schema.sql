DROP TABLE PERSON_STUDENT IF EXISTS;
DROP TABLE PERSON_PROFESSIONAL IF EXISTS;
DROP TABLE ADDRESS IF EXISTS;
DROP TABLE PERSON IF EXISTS;
DROP TABLE PERSON_TYPE IF EXISTS;

CREATE TABLE PERSON_TYPE (
    ID INTEGER generated by default as identity (start with 1) not null,  
    NAME varchar(50) not null,
	LAST_UPDATED TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	LAST_UPDATE_USER VARCHAR(255) DEFAULT 'SYSTEM' NOT NULL,
	CREATED TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CREATE_USER VARCHAR(255) DEFAULT 'SYSTEM' NOT NULL,
    CONSTRAINT IDX_PERSON_TYPE_ID PRIMARY KEY (ID)
);

CREATE TABLE PERSON (
    ID INTEGER generated by default as identity (start with 1) not null,  
    FIRST_NAME varchar(50) not null,
    LAST_NAME varchar(50) not null,
    TYPE integer, 
	LAST_UPDATED TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	LAST_UPDATE_USER VARCHAR(255) DEFAULT 'SYSTEM' NOT NULL,
	CREATED TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CREATE_USER VARCHAR(255) DEFAULT 'SYSTEM' NOT NULL,
    CONSTRAINT IDX_PERSON_ID PRIMARY KEY (ID),
    CONSTRAINT FK_PERSON_TYPE FOREIGN KEY (TYPE) REFERENCES PERSON_TYPE(ID)
);

CREATE TABLE PERSON_STUDENT (
    ID integer not null,  
    SCHOOL_NAME varchar(50) not null,
    CONSTRAINT FK_PERSON_STUDENT_ID FOREIGN KEY (ID) REFERENCES PERSON(ID) on delete cascade
);

CREATE TABLE PERSON_PROFESSIONAL (
    ID integer not null,  
    COMPANY_NAME varchar(50) not null,
    CONSTRAINT FK_PERSON_PROFESSIONAL_ID FOREIGN KEY (ID) REFERENCES PERSON(ID) on delete cascade
);

CREATE TABLE ADDRESS (
    ID INTEGER generated by default as identity (start with 1) not null,
    PERSON_ID integer,  
    ADDRESS varchar(255),
    CITY varchar(50) not null,
    STATE varchar(50) null,
    ZIP_POSTAL varchar(30) not null,
    COUNTRY varchar(50) not null,
	LAST_UPDATED TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	LAST_UPDATE_USER VARCHAR(255) DEFAULT 'SYSTEM' NOT NULL,
	CREATED TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CREATE_USER VARCHAR(255) DEFAULT 'SYSTEM' NOT NULL,
    CONSTRAINT IDX_ADDRESS_ID PRIMARY KEY (ID),
    CONSTRAINT FK_ADDRESS_PERSON_ID FOREIGN KEY (PERSON_ID) REFERENCES PERSON(ID) on delete cascade
);

INSERT INTO PERSON_TYPE(ID, NAME) 
   VALUES(1, 'STUDENT');
INSERT INTO PERSON_TYPE(ID, NAME) 
   VALUES(2, 'PROFESSIONAL');

INSERT INTO PERSON(ID, FIRST_NAME, LAST_NAME, TYPE) 
   VALUES(1, 'Joe', 'Smith', 1);
INSERT INTO PERSON_STUDENT(ID, SCHOOL_NAME) 
   VALUES(1, 'NYU');
INSERT INTO ADDRESS(ID, PERSON_ID, ADDRESS, CITY, STATE, ZIP_POSTAL, COUNTRY) 
   VALUES(1, 1, '1060 West Addison St.', 'Chicago', 'IL', '60613', 'USA');

INSERT INTO PERSON(ID, FIRST_NAME, LAST_NAME, TYPE) 
   VALUES(2, 'John', 'Wilson', 2);
INSERT INTO PERSON_PROFESSIONAL(ID, COMPANY_NAME) 
   VALUES(2, 'Spring Pizza');
INSERT INTO ADDRESS(ID, PERSON_ID, ADDRESS, CITY, STATE, ZIP_POSTAL, COUNTRY) 
   VALUES(2, 2, '2 Penn Plz # 15', 'New York', 'NY', '10121', 'USA');
INSERT INTO ADDRESS(ID, PERSON_ID, ADDRESS, CITY, STATE, ZIP_POSTAL, COUNTRY) 
   VALUES(3, 2, '47 Howard St.', 'San Francisco', 'CA', '94103', 'USA');

INSERT INTO PERSON(ID, FIRST_NAME, LAST_NAME, TYPE) 
   VALUES(3, 'Cao Ky', 'Huynh', 2);
INSERT INTO PERSON_PROFESSIONAL(ID, COMPANY_NAME) 
   VALUES(3, 'Spring Coffee');
INSERT INTO ADDRESS(ID, PERSON_ID, ADDRESS, CITY, STATE, ZIP_POSTAL, COUNTRY) 
   VALUES(4, 3, 'Java Community Danang', 'Danang', null, '135-731', 'Vietnam');
