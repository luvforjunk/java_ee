<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="login.css">
<style type="text/css">
div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="loginbox">
		<h1>로그인</h1>
		<form name="loginForm" id="login" action="loginCheck.jsp">
			<label for="id" class="labelid">아이디</label> 
			<input type="text" id="id" name="id" >
			<div id="idDiv"></div>

			</br>
			<!-- </br> : 다음 줄로 이동 -->
			<label for="pwd" class="labelpwd">패스워드</label> 
			<input type="password" id="pwd" name="pwd">
			<div id="pwdDiv"></div>

			<div class="check">
				<input type="checkbox" id="idcheck"> 
				<label for="idcheck">아이디저장</label>
			</div>
			<div class="search">
				<a href="#">아이디 찾기</a> 
				<a href="#">비밀번호 찾기</a>

			</div>
			<div class="button">
				<a href="write.jsp">회원가입</a>
				<input type="button" id="loginButton" value="로그인"> 
				<label for="loginButton">로그인</label>
			</div>
			<div id="footer">COS 온라인 스토어는 더현대닷컴이 운영 제공하는 사이트로 기존 회원은 더 현대닷컴
				아이디와 비밀번호로 바로 이용 가능합니다.</div>
		</form>
	</div>

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#loginButton').click(function() {
				//초기화
				$('#idDiv').empty();
				$('#pwdDiv').empty();

				if ($('input[name=id]').val() == '') {
					$('#idDiv').html('아이디를 입력하세요');
					$('#id').focus();
					
				} else if ($('input[name=pwd]').val() == '') {
					$('#pwdDiv').html('비밀번호를 입력하세요');
					$('#pwd').focus();
					
				} else
					$('form[name=loginForm]').submit();
			});
		});
	</script>
</body>
</html>