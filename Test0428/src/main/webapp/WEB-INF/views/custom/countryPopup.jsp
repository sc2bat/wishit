<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Country Search</title>
<style type="text/css">
	.country_search_box{
		width: 700px;
	    height: 600px;
	    border: 1px solid black;
	}
	
	.country_inner_box{
		width: 100%;
	    height: 40px;
	    border-bottom: 1px solid black;
	    text-align: center;
	    line-height: 40px;
	}
	
</style>
</head>
<body>
	<div class="country_search_box">
		<form method="post" name="countryform" action="searchCountry">
			<div class="country_inner_box">
				국가영문 코드 : <input type="text" id="country_eng" name="country_eng" placeholder="eng">
				국가 이름 : <input type="text" id="country_kor" name="country_kor" placeholder="kor">
				<input type="submit" value="검색">
			</div>
		</form>
		<c:forEach items="${countryList}" var="cvo">
			<div class="country_inner_box" onClick="input_country('${cvo.country_eng}', '${cvo.country_kor }')">
				${cvo.country_eng } | ${cvo.country_kor }
			</div>
		</c:forEach>
	</div>
	
	<script type="text/javascript">
		
		function input_country(country_eng, country_kor){
			opener.form.country_eng.value = country_eng;
			opener.form.country_kor.value = country_kor;
			self.close();
		}
	</script>
</body>
</html>