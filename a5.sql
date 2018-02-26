DROP TABLE IF EXISTS Registration_t;
DROP TABLE IF EXISTS Viewing_t;
DROP TABLE IF EXISTS PrivateOwner_t;
DROP TABLE IF EXISTS Client_t;
DROP TABLE IF EXISTS PROPERTY_t;
DROP TABLE IF EXISTS STAFF_t;
DROP TABLE IF EXISTS BRANCH_t;


CREATE TABLE BRANCH_t
(
				Branch_Id		VARCHAR(4)	NOT NULL,
        Branch_Street	VARCHAR(30),
        Branch_City		CHAR(20),
        Postal_Code		VARCHAR(7),
        CONSTRAINT BRANCH_PK PRIMARY KEY (Branch_Id)
        );

CREATE TABLE STAFF_t
	(
					 Staff_Id		VARCHAR(6),
				   first_Name	VARCHAR(30),
		       last_Name		VARCHAR(20),
	         position		VARCHAR(9),
					 sex		CHAR(1),
					 DOB		DATE,
					 salary		INT(9),
					 Branch_Id VARCHAR(5),
	         CONSTRAINT STAFF_PK PRIMARY KEY (Staff_Id),
					 CONSTRAINT STAFF_FK1 FOREIGN KEY (Branch_Id) REFERENCES BRANCH_t(Branch_Id)
	        );

CREATE TABLE PROPERTY_t
		(
				Property_Id		VARCHAR(5)	NOT NULL,
				street_Name		VARCHAR(25),
				city_Name			CHAR(30),
				postal_Code		INT(6),
				house_Type		CHAR(9),
				room_Numbers  INT(2),
				owner_Number		VARCHAR(9),
				Staff_id		VARCHAR(9),
				Branch_Id VARCHAR(5),
				CONSTRAINT PROPERTY_PK PRIMARY KEY (Property_Id),
				CONSTRAINT PROPERTY_FK1 FOREIGN KEY (Branch_Id) REFERENCES BRANCH_t(Branch_Id),
				CONSTRAINT PROPERTY_FK2 FOREIGN KEY (Staff_Id) REFERENCES STAFF_t(Staff_Id)
			);

CREATE TABLE Client_t
        	(Client_No      VARCHAR(25)   NOT NULL,
	      	F_Name          VARCHAR(25),
            I_Name          VARCHAR(25),
			Tel_No			INT(25),
			Pref_Type		VARCHAR(25),
			Max_Rent		INT(25),
CONSTRAINT Client_PK PRIMARY KEY (Client_No));

CREATE TABLE PrivateOwner_t
            (Owner_No		VARCHAR(25) NOT NULL,
			F_Name			VARCHAR(25),
			I_Name			VARCHAR(25),
			Address			VARCHAR(25),
			Tel_No			INT(25),
CONSTRAINT PrivateOwner_PK PRIMARY KEY (Owner_No));

CREATE TABLE Viewing_t
	      	(Client_No		VARCHAR(25) NOT NULL,
			Property_Id		VARCHAR(25),
			View_Date		VARCHAR(25),
			Comment			TEXT(25),
CONSTRAINT Viewing_PK PRIMARY KEY (Client_No),
CONSTRAINT Viewing_FK1 FOREIGN KEY (Property_Id) REFERENCES PROPERTY_t(Property_Id));

CREATE TABLE Registration_t
        	(Client_No		VARCHAR(25) NOT NULL,
			Branch_Id		VARCHAR(25),
			Staff_No		VARCHAR(25),
			Date_Joined		VARCHAR(25),
CONSTRAINT Order_PK PRIMARY KEY (Client_No),
CONSTRAINT Registration_FK1 FOREIGN KEY (Client_No) REFERENCES Client_t(Client_No),
CONSTRAINT Registration_FK2 FOREIGN KEY (Branch_Id) REFERENCES BRANCH_t(Branch_Id),
/* CONSTRAINT Registration_FK3 FOREIGN KEY (Staff_Id) REFERENCES STAFF_t(Staff_Id)); */
