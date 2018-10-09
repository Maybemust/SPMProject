// JavaScript Document
/** ********************添加Librarian************************** */
function addLibrarian(account, password, repeatPassword) {
	var xmlhttp;
	var url = "";

	if (document.getElementById(account).value == ""
			|| document.getElementById(password).value == ""
			|| document.getElementById(repeatPassword).value == "") {
		alert("List is empty!");
		return;
	}

	if (document.getElementById(password).value != document
			.getElementById(repeatPassword).value) {
		alert("Entered passwords differ!");
		return;
	}

	url = "adminop?account=" + document.getElementById(account).value
			+ "&password=" + document.getElementById(password).value;

	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var check = xmlhttp.responseText;
			display(check, account, password, repeatPassword);
		}
	};
	xmlhttp.send(null);

}

function display(str1, account, password, repeatPassword) {
	if (str1 == "ok") {
		alert("This operation succeeds!");
		document.getElementById(account).value = "";
		document.getElementById(password).value = "";
		document.getElementById(repeatPassword).value = "";
		
	}
	if (str1 == "no") {
		alert("This operation fails!");
		document.getElementById(account).value = "";
		document.getElementById(password).value = "";
		document.getElementById(repeatPassword).value = "";
	}
}

/** ********************修改借书数、罚款、押金************************** */
function sendtext(textId, labelId) {
	var xmlhttp;
	var url = "";
	
	if (textId == "number") {
		url = "adminop?number=" + document.getElementById(textId).value;
	} else if (textId == "fineStrategy") {
		url = "adminop?fine=" + document.getElementById(textId).value;
	} else if (textId == "cashPledge") {
		url = "adminop?cash=" + document.getElementById(textId).value;
	} else if (textId == "fineLimitTime") {
		url = "adminop?fineLimitTime=" + document.getElementById(textId).value;
	} else if (textId == "reservedTime") {
		url = "adminop?reservedTime=" + document.getElementById(textId).value;
	}else if(textId=="reservedMaxinum"){
		url = "adminop?reservedMaxinum=" + document.getElementById(textId).value;
	}

	if (document.getElementById(textId).value == "") {
		alert("Can not be empty!");
		return;
	}

	if (window.XMLHttpRequest) {
		// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp = new XMLHttpRequest();
	} else {
		// IE6, IE5 浏览器执行代码
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.open("POST", url, true);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var check = xmlhttp.responseText;
			show(check, textId, labelId);
		}
	};
	xmlhttp.send(null);
}

function show(str2, textId, labelId) {
	if (str2 == "ok") {
		alert("This operation succeeds!");
		if (labelId == "numberlabel")
			document.getElementById(labelId).setAttribute(
					'alt',
					"cuurent maximum number: "
							+ document.getElementById(textId).value);

		if (labelId == "finelabel")
			document.getElementById(labelId).setAttribute(
					'alt',
					"current strategy: "
							+ document.getElementById(textId).value);

		if (labelId == "cashlabel")
			document.getElementById(labelId).setAttribute('alt',
					"current pledge: " + document.getElementById(textId).value);

		if (labelId == "fineLimitTimeLabel")
			document.getElementById(labelId)
					.setAttribute(
							'alt',
							"fine limit time: "
									+ document.getElementById(textId).value);

		if (labelId == "reservedTimeLabel")
			document.getElementById(labelId).setAttribute('alt',
					"reserved time: " + document.getElementById(textId).value);
		
		if (labelId == "reservedMaxinumLabel")
			document.getElementById(labelId).setAttribute('alt',
					"reserved maxinum: " + document.getElementById(textId).value);

		document.getElementById(textId).value = "";
	}
	if (str2 == "no") {
		alert("This operation fails!");
		document.getElementById(textId).value = "";
	}
}
