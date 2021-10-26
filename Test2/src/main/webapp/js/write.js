//Javascript
function checkwrite() {
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("idDiv").innerText = "";
	document.getElementById("pwdDiv").innerText = "";
	document.getElementById("repwdDiv").innerText = "";

	if (document.writeForm.name.value == "")
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";
	else if (document.writeForm.id.value == "")
		document.getElementById("idDiv").innerText = "아이디를 입력하세요";
	else if (document.writeForm.pwd.value == "")
		document.getElementById("pwdDiv").innerText = "비밀번호를 입력하세요";
	else if (document.writeForm.pwd.value != document.writeForm.repwd.value)
		document.getElementById("repwdDiv").innerText = "비밀번호가 맞지 않습니다";
	else
		document.writeForm.submit();
}
