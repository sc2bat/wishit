
function checkCustom(){
    if(document.form.busi_num_input.value==""){
		alert("busi_num_input is null");
		document.form.busi_num_input.focus();
		return;
	}else if(document.form.custom_input.value==""){
		alert("custom_input is null");
		document.form.custom_input.focus();
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
        document.form.action = "customSearch?busi_num=" + f.busi_num_key.value + "&custom=" + f.custom_key.value;
        document.form.submit();
    }
}

function openCustom(busi_num){
    document.form.action = "clickCustom?busi_num=" + busi_num;
    document.form.submit();
}

function countryPopup(){
    var country_eng = document.getElementById('country_eng').value;
    var country_kor = document.getElementById('country_kor').value;
	var url = "searchCountry?country_eng=" + country_eng + "&country_kor=" + country_kor;
	var opt = "toolbar=no, menubar=no, resizable=0, width=900, height=650, top=300, left=300, scrollbars=no";
	window.open(url, "countryPopup", opt);
}

function deleteCustom(){
    var busi_num_input = document.form.busi_num_input.value;
    if(busi_num_input.equals("")){
        alert('select to delete');
        return;
    }
    document.form.action = "deleteCustom?busi_num_key=" + busi_num_input;
    document.form.submit();
}