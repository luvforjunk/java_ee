$(function() {
	//회원가입
	$('#writeBtn').click(function() {
		$('#nameDiv').empty();
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		$('#repwdDiv').empty();

		//id 속성
		/*if($('#name').val() == '') $('#nameDiv').html('이름 입력'); */

		//name 속성
		if ($('input[name="name"]').val() == '') {
			$('#nameDiv').html('이름 입력');
			$('#name').focus();
		} else if ($('input[name="id"]').val() == '')
			$('#idDiv').html('아이디 입력');
		else if ($('input[name="pwd"]').val() == '')
			$('#pwdDiv').html('비밀번호 입력');
		else if ($('input[name="pwd"]').val() != $('input[name="repwd"]').val())
			$('#repwdDiv').html('비밀번호 틀림');
		else
			$('form[name="writeForm"]').submit();
	});

	//로그인
	$('#loginBtn').click(function() {
		$('#idDiv').empty();
		$('#pwdDiv').empty();

		if ($('input[name="id"]').val() == '')
			$('#idDiv').html('아이디 입력');
		else if ($('input[name="pwd"]').val() == '')
			$('#pwdDiv').html('비밀번호 입력');
		else
			$('form[name="loginForm"]').submit();
	});
});

//우편번호


//아이디 중복 체크
$('#checkIdBtn').click(function() {
	//var id = document.getElementById("id").value; - JavaScript형식 
	var id = $('#id').val(); // jQuery형식 
	if (id == "")
		alert("먼저 아이디를 입력하세요");
	else
		window.open("/mvcmember/member/checkId.do?id=" + id, "checkId", "width=350 height=200 top=200 left=700");
});

$('#checkIdClose').click(function() {
	// JavaScript형식
	
	//alert($('#id').val());

	// opener.document.getElementById("id").value = $('#checkId').val();
	// 열려있는 창들 중 최상위 부모의 아이디에 아이디 값을 넣어라.
	// opener.writeForm.id.value = $('#checkId').val();
	// window.close();
	// opener.writeForm.pwd.focus();
	
	//-----------------------------------------------------------------
	// jQuery형식
	$('#id', opener.document).val($('#checkId').val());
	window.close();
	$('#pwd', opener.document).focus();
});

$('#zipcodeBtn').click(function(){
	window.open("/mvcmember/member/checkPost.do", "checkPost", "width=500 height=500 top=200 left=700");
	
});

$('#addressA').click(function(){
	alert($('#zipcode').val() + ", " + $('#address'));
});








