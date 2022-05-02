DROP TABLE custom;
CREATE TABLE customTable(
	busi_num CHAR(20) PRIMARY KEY NOT NULL,
	custom CHAR(20) NOT NULL,
	short_custom CHAR(20),
	ceo CHAR(10),
	charge_person CHAR(10),
	busi_condition CHAR(10),
	item CHAR(10),
	post_num CHAR(10),
	addr1 VARCHAR(80),
	addr2 VARCHAR(80),
	tel CHAR(10),
	fax CHAR(10),
	homepage CHAR(20),
	co_yn CHAR(1) DEFAULT '3',
	foreign_yn CHAR(1) DEFAULT '3',
	tax_yn CHAR(1) DEFAULT '3',
	country_eng CHAR(20),
	country_kor CHAR(20),
	special_relation CHAR(1) DEFAULT '3',
	trade_stop CHAR(1) DEFAULT '3',
	contract_period_s DATE,
	contract_period_e DATE,
	regi_info_man CHAR(10),
	regi_info_date DATE,
	modi_info_man CHAR(10),
	modi_info_date DATE
);

SELECT * FROM customTable;

SELECT * FROM account;
CREATE TABLE account(
	busi_num CHAR(20) PRIMARY KEY NOT NULL,
	factory CHAR(20),
	trade_bank CHAR(20),
	account_num CHAR(20)
);


CREATE SEQUENCE add_num_seq INCREMENT BY 1 START WITH 1 NOCACHE;
DROP TABLE country;
CREATE TABLE country(
	country_num NUMBER(5) PRIMARY KEY NOT NULL,
	country_eng VARCHAR2(40),
	country_kor VARCHAR2(40)
);
CREATE SEQUENCE country_num_seq INCREMENT BY 1 START WITH 1 NOCACHE;