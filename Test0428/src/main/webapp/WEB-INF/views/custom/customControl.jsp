<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="/script/demo_script.js"></script>
	<script src="/script/addressAPIbykakao.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="/css/demo.css">
    <style type="text/css">
	
	</style>
	
</head>
<body>
    <div id="wrap">
    	<form name="form" method="post">
        	<div class="top_box">
	            <div class="top_left" onClick="location.href='toCustomControl'">
	                [실기 TEST] 거래처 관리
	            </div>
	            <div class="top_right">
	                <ul>
	                    <li><input type="button" value="조회" onClick="searchCustom();"></li>
	                    <li><input type="reset" value="초기화"></li>
	                    <li><input type="button" value="저장" onClick="checkCustom();"></li>
	                    <li><input type="button" value="삭제" onClick="deleteCustom();"></li>
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
	                    <input type="text" id="busi_num_key" name="busi_num_key" class="main_left_input_text">
	                    <label style="margin-top:0px;">거래처명</label>
	                    <input type="text" id="custom_key" name="custom_key" class="main_left_input_text" style="margin-top:0px;">
	                    <input type="button" value="조회" class="main_left_input_btn" onClick="searchCustom();">
	                </div>
	                <div class="main_left_bottom" style="overflow:hidden;">
	                    <div class="search_result_box">
	                        <div class="search_result_businum">사업자 번호</div>
	                        <div class="search_result_custom">거래처명</div>
	                    </div>
	                    <c:forEach items="${customList}" var="cvo">
		                    <div class="search_result_box" ondblclick="openCustom(${cvo.busi_num })">
		                        <div class="search_result_businum">${cvo.busi_num }</div>
		                        <div class="search_result_custom">${cvo.custom }</div>
		                    </div>
	                    </c:forEach>
	                </div>
	            </div>
	            <input type="hidden" id="msg" value="${message }">
	            <div class="main_right">
	                <div class="custom_input_box">
	                    <label>사업자번호</label>
	                    <input type="text" id="busi_num" name="busi_num" value="${dto.busi_num}">
	                    <label>약칭</label>
	                    <input type="text"name="short_custom" value="${dto.short_custom}">
	                    <label>거래처명</label>
	                    <input type="text" id="custom"  name="custom" style="width: 340px;margin-right: 100px;" value="${dto.custom}">
	                    <label>대표자</label>
	                    <input type="text" name="ceo" value="${dto.ceo}">
	                    <label>담당자</label>
	                    <input type="text" name="charge_person" value="${dto.charge_person}">
	                    <label>업태</label>
	                    <input type="text" name="busi_condition" value="${dto.busi_condition}">
	                    <label>종목</label>
	                    <input type="text" name="item" value="${dto.item}">
	                    <label>우편번호</label>
	                    <input type="text" name="post_num" id="sample6_postcode" value="${dto.post_num}">
	                    <div style="position: relative;float: left;"><input type="button" value="검색" class="post_search_btn" onclick="sample6_execDaumPostcode()"></div>
	                    <label style="width: 70px;margin-right: 43px;">주소1</label>
	                    <input type="text" name="addr1" id="sample6_address" value="${dto.addr1}">
	                    <label>주소2</label>
	                    <input type="text" name="addr2" id="sample6_detailAddress" style="width: 340px;margin-right: 100px;" value="${dto.addr2}">
	                    <label>전화번호</label>
	                    <input type="text" name="tel" value="${dto.tel }">
	                    <label>팩스번호</label>
	                    <input type="text" name="fax" value="${dto.fax }">
	                    <label>홈페이지</label>
	                    <input type="text" name="homepage" style="width: 340px;margin-right: 100px;" value="${dto.homepage }">
	                    <label>법인여부</label>
	                    <div class="radio_btn">
	                        <input type="radio" name="co_yn" value="1" checked>법인
	                        <input type="radio" name="co_yn" value="2" <c:if test="${dto.co_yn == 2}">checked</c:if>>개인
	                    </div>
	                    <label>해외여부</label>
	                    <div class="radio_btn">
	                        <input type="radio" name="foreign_yn" value="1" checked>국내
	                        <input type="radio" name="foreign_yn" value="2" <c:if test="${dto.foreign_yn == 2}">checked</c:if>>해외
	                    </div>
	                    <label>과세구분</label>
	                    <select name="tax_yn" class="combo_box">
	                        <option value="3">=== 선택 ===</option>
	                        <option value="1" <c:if test="${dto.tax_yn == 1}"> selected </c:if>>과세 / 면세</option>
	                        <option value="2" <c:if test="${dto.tax_yn == 2}"> selected </c:if>>비과세</option>
	                    </select>
	                    <label>국가</label>
	                    <input type="text" name="country_eng" style="width: 40px;" value="${dto.country_eng }" id="country_eng" readonly>
	                    <input type="text" name="country_kor" style="width: 110px;" value="${dto.country_kor }" id="country_kor">
	                    <input type="button" value="검색" onClick="countryPopup()" style="width: 40px;height: 24px;background: none;">
	                    <label>특수관계자</label>
	                    <div>
	                        <input type="checkbox" name="special_relation" class="check_btn" value="1" 
	                        	<c:if test="${dto.special_relation == 1}">checked</c:if>>
	                    </div>
	                    <label>거래중지</label>
	                    <div>
	                        <input type="checkbox" name="trade_stop" class="check_btn" value="1" 
	                        	<c:if test="${dto.trade_stop == 1}">checked</c:if>>
	                    </div>
	                    <label>계약기간</label>
	                    <input type="text" name="contract_period_s" value="${dto.contract_period_s }" onClick="contract_datePicker('${dto.contract_period_s }', '${dto.contract_period_e }')">
	                    <div style="position:relative; float:left; width:30px; height:30px;line-height: 30px;margin: 0px 30px 0px 30px;text-align: center;">~</div>
	                    <input type="text" name="contract_period_e" value="${dto.contract_period_e }" onClick="contract_datePicker('${dto.contract_period_s }', '${dto.contract_period_e }')">
	                    <br>
	                    <label>등록정보</label>
	                    <input type="text" id="regi_info_man" name="regi_info_man" style="width: 50px;margin-right: 0px;" value="${dto.regi_info_man }">
	                    <input type="text" name="regi_info_date" style="width:140px;" value="${dto.regi_info_date }" readonly>
	                    <input type="hidden" id="regi_info_man_check" value="${dto.regi_info_man}">
	                    <label style="width: 130px;">변경정보</label>
	                    <input type="text" id="modi_info_man" name="modi_info_man" style="width: 50px;margin-right: 0px;" value="${dto.modi_info_man }">
	                    <input type="text" name="modi_info_date" style="width:140px;" value="${dto.modi_info_date }" readonly>
	                </div>
	                <div class="customAccount_box" style="overflow:hidden;">
	                    <div style="padding: 10px 0px 10px 30px;">(거래처 계좌정보)</div>
	                    <div class="customAccount_content">
	                        <div class="customAccount_content_title" style="width:170px;">사무소</div>
	                        <div class="customAccount_content_title" style="width:290px;">은행</div>
	                        <div class="customAccount_content_title" style="width:290px;">계좌번호</div>
	                    </div>
	                    <div class="customAccount_content">
	                        <input class="customAccount_content_title" style="width:166px;" type="text" name="factory" value="${dto.factory }">
	                        <input class="customAccount_content_title" style="width:286px;" type="text" name="trade_bank" value="${dto.trade_bank }">
	                        <input class="customAccount_content_title" style="width:286px;" type="text" name="account_num" value="${dto.account_num }">
	                    </div>
	                </div>
	            </div>
	        </div>
		</form>
    </div>
    

</body>
</html>