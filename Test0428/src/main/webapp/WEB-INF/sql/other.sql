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

