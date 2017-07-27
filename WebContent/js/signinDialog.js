//用户名检查
function checkname() {
	var div = document.getElementById("index1");
	div.innerHTML = "";
	var name1 = document.form1.indextext1.value;
	if(name1 == "") {
		div.innerHTML = "请输入用户名";
		document.form1.indextext1.focus();
		return false;
	}
	return true;
}

//密码检查
function checkpassword() {
	var div = document.getElementById("index2");
	div.innerHTML = "";
	var password = document.form1.indextext2.value;
	if(password == "") {
		div.innerHTML = "请输入密码";
		document.form1.indextext2.focus();
		return false;
	}
	return true;
}



//检查
function check() {
	if(checkname() && checkpassword()) {
		return true;
	} else {
		return false;
	}
}