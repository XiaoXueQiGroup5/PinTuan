//用户名检查
function checkname() {
	var div = document.getElementById("div1");
	div.innerHTML = "";
	var name1 = document.form1.text1.value;
	if(name1 == "") {
		div.innerHTML = "姓名不能为空！";
		document.form1.text1.focus();
		return false;
	}
	if(name1.length < 4 || name1.length > 16) {
		div.innerHTML = "姓名输入的长度4-16个字符！";
		document.form1.text1.select();
		return false;
	}
	var charname1 = name1.toLowerCase();
	for(var i = 0; i < name1.length; i++) {
		var charname = charname1.charAt(i);
		if(!(charname >= 0 && charname <= 9) && (!(charname >= 'a' && charname <= 'z')) && (charname != '_')) {
			div.innerHTML = "姓名包含非法字母，只能包含字母，数字，和下划线";
			document.form1.text1.select();
			return false;
		}
	}
	return true;
}

//密码检查
function checkpassword() {
	var div = document.getElementById("div2");
	div.innerHTML = "";
	var password = document.form1.text2.value;
	if(password == "") {
		div.innerHTML = "密码不位空！";
		document.form1.text2.focus();
		return false;
	}
	if(password.length < 4 || password.length > 12) {
		div.innerHTML = "密码长度4-12位";
		document.form1.text2.select();
		return false;
	}
	return true;
}

//再次输入密码检查
function checkrepassword() {
	var div = document.getElementById("div3");
	div.innerHTML = "";
	var password = document.form1.text2.value;
	var repass = document.form1.text3.value;
	if(repass == "") {
		div.innerHTML = "密码不位空！";
		document.form1.text3.focus();
		return false;
	}
	if(password != repass) {
		div.innerHTML = "密码不一致";
		document.form1.text3.select();
		return false;
	}
	return true;
}

//邮箱检查
function checkEmail() {
	var div = document.getElementById("div4");
	div.innerHTML = "";
	var email = document.form1.text5.value;
	var sw = email.indexOf("@", 0);
	var sw1 = email.indexOf(".", 0);
	var tt = sw1 - sw;
	if(email.length == 0) {
		div.innerHTML = "电子邮件不能位空";
		document.form1.text5.focus();
		return false;
	}
	if(email.indexOf("@", 0) == -1) {
		div.innerHTML = "电子邮件格式不正确，必须包含@符号！";
		document.form1.text5.select();
		return false;
	}
	if(email.indexOf(".", 0) == -1) {
		div.innerHTML = "电子邮件格式不正确，必须包含.符号!";
		document.form1.text5.select();
		return false;
	}
	if(tt == 1) {
		div.innerHTML = "邮件格式不对。@和.不可以挨着！";
		document.form1.text5.select();
		return false;
	}
	if(sw > sw1) {
		div.innerHTML = "电子邮件格式不正确，@符号必须在.之前";
		document.form1.text5.select();
		return false;
	} else {
		return true;
	}

	return ture;
}

//检查
function check() {
	if(checkname() && checkpassword() && checkrepassword() && checkEmail()) {
		return true;
	} else {
		return false;
	}
}