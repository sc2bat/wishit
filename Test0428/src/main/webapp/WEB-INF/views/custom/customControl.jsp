<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<script src="/script/demo_script.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="/css/demo.css">
    <style type="text/css">
	
	</style>
	
</head>
<body>
    <div id="wrap">
    	<form name="form" method="post">
        	<div class="top_box">
	            <div class="top_left">
	                [실기 TEST] 거래처 관리
	            </div>
	            <div class="top_right">
	                <ul>
	                    <li><input type="button" value="조회" onClick=""></li>
	                    <li><input type="reset" value="초기화"></li>
	                    <li><input type="button" value="저장" onClick="saveCustom();"></li>
	                    <li><input type="button" value="삭제" onClick=""></li>
	                    <li><input type="button" value="인쇄" onClick=""></li>
	                    <li><input type="button" value="화면설정" onClick=""></li>
	                    <li><input type="button" value="닫기" onClick="window.close();"></li>
	                </ul>
	            </div>
	        </div>
	        <div id="main_box">
	            <div class="main_left">
	                <div class="main_left_top">
	                    <label>사업자번호</label>
	                    <input type="text" id="busi_num" name="busi_num_key" class="main_left_input_text">
	                    <label style="margin-top:0px;">거래처명</label>
	                    <input type="text" id="custom" name="custom_key" class="main_left_input_text" style="margin-top:0px;">
	                    <input type="button" value="조회" class="main_left_input_btn">
	                </div>
	                <div class="main_left_bottom">
	                    <div class="search_result_box">
	                        <div class="search_result_businum">사업자 번호</div>
	                        <div class="search_result_custom">거래처명</div>
	                    </div>
	                    <div class="search_result_box">
	                        <div class="search_result_businum">busi_num 16</div>
	                        <div class="search_result_custom">custom 16</div>
	                    </div>
	                </div>
	            </div>
	            <div class="main_right">
	                <div class="custom_input_box">
	                    <label>사업자번호</label>
	                    <input type="text" name="busi_num_input">
	                    <label>약칭</label>
	                    <input type="text" name="short_input">
	                    <label>거래처명</label>
	                    <input type="text" name="custom_input" style="width: 340px;margin-right: 100px;">
	                    <label>대표자</label>
	                    <input type="text" name="ceo_input">
	                    <label>담당자</label>
	                    <input type="text" name="charge_person_input">
	                    <label>업태</label>
	                    <input type="text" name="busi_condition_input">
	                    <label>종목</label>
	                    <input type="text" name="item_input">
	                    <label>우편번호</label>
	                    <input type="text" name="post_num_input">
	                    <label>주소1</label>
	                    <input type="text" name="address1_input">
	                    <label>주소2</label>
	                    <input type="text" name="address2_input" style="width: 340px;margin-right: 100px;">
	                    <label>전화번호</label>
	                    <input type="text" name="tel_input">
	                    <label>팩스번호</label>
	                    <input type="text" name="fax_input">
	                    <label>홈페이지</label>
	                    <input type="text" name="homepage_input" style="width: 340px;margin-right: 100px;">
	                    <label>법인여부</label>
	                    <div class="radio_btn">
	                        <input type="radio" name="co_yn_input" value="1">법인
	                        <input type="radio" name="co_yn_input" value="2">개인
	                    </div>
	                    <label>해외여부</label>
	                    <div class="radio_btn">
	                        <input type="radio" name="foreign_yn_input" value="1">국내
	                        <input type="radio" name="foreign_yn_input" value="2">해외
	                    </div>
	                    <label>과세구분</label>
	                    <select name="tax_yn" class="combo_box">
	                        <option value="3">=== 선택 ===</option>
	                        <option value="1">과세 / 면세</option>
	                        <option value="2">비과세</option>
	                    </select>
	                    <label>국가</label>
	                    <input type="text" name="country_eng_input" style="width: 40px;">
	                    <input type="text" name="country_kor_input" style="width: 110px;">
	                    <input type="button" value="검색" onClick="" style="width: 40px;height: 24px;background: none;">
	                    <label>특수관계자</label>
	                    <div>
	                        <input type="checkbox" name="special_relation_input" class="check_btn">
	                    </div>
	                    <label>거래중지</label>
	                    <div>
	                        <input type="checkbox" name="trade_stop_input" class="check_btn">
	                    </div>
	                    <label>계약기간</label>
	                    <input type="text" name="contract_period_s_input">
	                    <div style="position:relative; float:left; width:30px; height:30px;line-height: 30px;margin: 0px 30px 0px 30px;text-align: center;">~</div>
	                    <input type="text" name="contract_period_e_input">
	                    <br>
	                    <label>등록정보</label>
	                    <input type="text" name="regi_info_man_input" style="width: 50px;margin-right: 0px;">
	                    <input type="text" name="regi_info_date_input" style="width:140px;">
	                    <label style="width: 130px;">변경정보</label>
	                    <input type="text" name="modi_info_man_input" style="width: 50px;margin-right: 0px;">
	                    <input type="text" name="modi_info_date_input" style="width:140px;">
	                </div>
	                <div class="customAccount_box">
	                    <div style="padding: 10px 0px 10px 30px;">(거래처 계좌정보)</div>
	                    <div class="customAccount_content">
	                        <div class="customAccount_content_title" style="width:170px;">사무소</div>
	                        <div class="customAccount_content_title" style="width:290px;">은행</div>
	                        <div class="customAccount_content_title" style="width:290px;">계좌번호</div>
	                    </div>
	                    <div class="customAccount_content">
	                        <div class="customAccount_content_title" style="width:170px;"></div>
	                        <div class="customAccount_content_title" style="width:290px;"></div>
	                        <div class="customAccount_content_title" style="width:290px;"></div>
	                    </div>
	                    <div class="customAccount_content">
	                        <div class="customAccount_content_title" style="width:170px;"></div>
	                        <div class="customAccount_content_title" style="width:290px;"></div>
	                        <div class="customAccount_content_title" style="width:290px;"></div>
	                    </div>
	                </div>
	            </div>
	        </div>
		</form>
    </div>
    

</body>
</html>