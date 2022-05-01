
function checkCustom(){
    if(document.getElementById('busi_num').value==""){
		alert("busi_num is null");
		document.getElementById('busi_num').focus();
		return;
	}else if(document.getElementById('custom').value==""){
		alert("custom is null");
		document.getElementById('custom').focus();
		return;
	}else if(document.getElementById('regi_info_man').value==""){
		alert("regi_info_man is null");
		document.getElementById('regi_info_man').focus();
		return;
	}else if(document.getElementById('regi_info_man').value != "" && document.getElementById('modi_info_man').value==""){
		alert("modi_info_man is null");
		document.getElementById('modi_info_man').focus();
		return;
	}else{
        document.form.action = "saveCustom";
        document.form.submit();
    }
}

function searchCustom(){
    var f = document.form;
    if(f.busi_num_key.value == "" && f.custom_key.value == ""){
		alert("busi_num_key or custom_key is null");
		f.busi_num_key.focus();
		return;
    }else{
        f.action = "customSearch?busi_num=" + f.busi_num_key.value + "&custom=" + f.custom_key.value;
        f.submit();
    }
}

function openCustom(busi_num){
    document.form.action = "clickCustom?busi_num=" + busi_num;
    document.form.submit();
}

function contract_datePicker(contract_period_s, contract_period_e){
	var opt = "toolbar=no, menubar=no, resizable=0, width=500, height=400, top=300, left=300, scrollbars=no";
	window.open("contract_datePicker", "contract_datePicker", opt);
}

function countryPopup(){
    var country_eng = document.getElementById('country_eng').value;
    var country_kor = document.getElementById('country_kor').value;
	var url = "searchCountry?country_eng=" + country_eng + "&country_kor=" + country_kor;
	var opt = "toolbar=no, menubar=no, resizable=0, width=900, height=650, top=300, left=300, scrollbars=no";
	window.open(url, "countryPopup", opt);
}

function deleteCustom(){
    var busi_num = document.form.busi_num.value;
    if(busi_num == ""){
        alert('select to delete');
        return;
    }
    document.form.action = "deleteCustom?busi_num=" + busi_num;
    document.form.submit();
}

$(document).ready(
	function messageAlert(message){
		if(message != ""){
			alert(message);
		}
	}
);