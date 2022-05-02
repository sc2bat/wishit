<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>DatePicker</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script>
  $(document).ready(function () { 
		$.datepicker.setDefaults({
			changeMonth: true, 
			changeYear: true, 
			nextText: '다음 달', 
			prevText: '이전 달', 
			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], 
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
			dateFormat: "yy.mm.dd", 
			showButtonPanel: true
		});
		
	  $( function() {
	    $( "#contract_s, #contract_e" ).datepicker();
	  } );
  });
  
  function datePick_submit(){
	  var f = document.dateForm;
	  if(f.contract_s.value == ''){
		  alert('contract period start is null');
		  f.contract_s.focus();
		  return;
	  }else if(f.contract_e.value == ''){
		  alert('contract period end is null');
		  f.contract_e.focus();
		  return;
	  }
	  opener.document.form.contract_period_s.value = f.contract_s.value;
	  opener.document.form.contract_period_e.value = f.contract_e.value;
	  self.close();
  }
  </script>
</head>
<body>
<form name="dateForm">
	<p>Contract Start Date: <input type="text" id="contract_s" name="contract_s"></p>
	<p>Contract End Date: <input type="text" id="contract_e" name="contract_e"></p>
	<input type="button" value="확인" onClick="datePick_submit();">
</form>
 
<!-- https://jqueryui.com/datepicker/ -->

</body>
</html>