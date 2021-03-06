SELECT * FROM custom;

INSERT INTO customTable(busi_num, custom)
	VALUES('1111', 'emart');
INSERT INTO customTable(busi_num, custom)
	VALUES('2222', 'ministop');
INSERT INTO customTable(busi_num, custom)
	VALUES('3333', 'gs');
INSERT INTO customTable(busi_num, custom)
	VALUES('4444', 'seven');
INSERT INTO customTable(busi_num, custom)
	VALUES('5555', 'cu');


SELECT * FROM customTable;

SELECT * FROM customTable 
	WHERE busi_num LIKE '%111%' AND custom LIKE '%%'
		ORDER BY busi_num DESC;
		
SELECT * FROM country;

INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'GHA', '가나');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'NGA', '나이지리아');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'DNK', '덴마크');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'KOR', '대한민국');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'DEU', '독일');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'LBN', '레바논');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'MDG', '마다가스카르');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'MEX', '멕시코');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'MDV', '몰디브');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'SDN', '수단');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'GBR', '영국');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'AUT', '오스트리아');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'JPN', '일본');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'CHN', '중화인민공화국');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'THA', '타이');
INSERT INTO country(country_num, country_eng, country_kor)
	VALUES(country_num_seq.nextVal, 'PHL', '필리핀');
	
SELECT * FROM country 
	WHERE UPPER(country_eng) LIKE UPPER('%kor%') AND country_kor LIKE '%%' 
		ORDER BY country_num DESC;
		
SELECT * FROM customTable WHERE busi_num ='1133';
SELECT * FROM customTable;
INSERT INTO customTable(busi_num, custom, short_custom, ceo, charge_person, item, post_num, addr1, addr2, 
			tel, fax, homepage, co_yn, foreign_yn, tax_yn, country_eng, country_kor, special_relation, trade_stop, 
				contract_period_s, contract_period_e, regi_info_man, regi_info_date)
			VALUES('1234', 'test', 'test', 'ceo', 'charge', 'item', '1234', 'addr1', 'addr2', 
				'tel', 'fax', 'homepage', '1', '1', '2', 'KOR', '대한민국', '1', '2', 
					TO_DATE('20220302', 'YYYYMMHH'), TO_DATE('20220304', 'YYYYMMHH'), 'regi', SYSDATE);
					
INSERT INTO customTable(busi_num, custom, trade_stop)
	VALUES('24344', 'test44', null);
					
UPDATE customTable SET custom='emart', short_custom='test', ceo='test', charge_person='test', busi_condition='test', 
	item='qwer', post_num='2333', addr1='test', addr2='test', tel='234234', fax='234234', homepage='www.test.com', 
		co_yn='1', foreign_yn='1', tax_yn='1', country_eng='AUT', country_kor='qwer', 
			special_relation='1', trade_stop='1', regi_info_man='qwer',
				contract_period_s=TO_DATE('20220405', 'YYYYMMDD'), contract_period_e=TO_DATE('20220406', 'YYYYMMDD'),
			 		modi_info_man='qwer', modi_info_date=SYSDATE
						WHERE busi_num='1111';

DELETE FROM customTable WHERE TRIM(busi_num)= '211111';
	(SELECT TRIM(busi_num) FROM customTable) = '211111';
	
UPDATE account SET factory='23', trade_bank='na_bank', account_num='12345'
	WHERE busi_num= '4324';

SELECT * FROM account;

SELECT c.busi_num AS cbusi_num, c.custom, c.short_custom, c.ceo, c.charge_person, c.item, c.post_num, c.addr1, c.addr2, c.
			tel, c.fax, c.homepage, c.co_yn, c.foreign_yn, c.tax_yn, c.country_eng, c.country_kor, c.special_relation, c.trade_stop, c.
				contract_period_s, c.contract_period_e, c.regi_info_man, c.regi_info_date, a.busi_num AS tete
					FROM customTable c, account a 
						WHERE c.busi_num = a.busi_num AND TRIM(busi_num)='321';

SELECT c.*, a.factory, a.trade_bank, a.account_num FROM customTable c, account a 
	WHERE c.busi_num = a.busi_num AND TRIM(c.busi_num) = '0909';
SELECT a.* FROM customTable c, account a WHERE c.busi_num = a.busi_num AND TRIM(c.busi_num) = '321';

DELETE FROM customTable WHERE TRIM(busi_num) NOT LIKE '%38%';
