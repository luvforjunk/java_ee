<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="write.css">
<style type="text/css">
div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
<header class="header">
		<form name="writeForm" method="post" action="writeCheck.jsp">
			<h2 class="tit">회원가입</h2>
			<p class="txt">COS 온라인 스토어는 더현대닷컴이 제공하며 기존 회원은 더현대닷컴 아이디와 비밀번호로
				바로 이용 가능합니다.</p>
</header>
	<!-- header -->
	
	<!-- aside -->
	<aside class="aside">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<td width="100" align="center">이름</td>
				<td><input type="text" name="name" id="name" placeholder="이름 입력">
					<div id="nameDiv"></div>
				</td>
			</tr>

			<tr>
				<td width="100" align="center">아이디</td>
				<td><input type="text" name="id" id="id" placeholder="아이디 입력">
					<div id="idDiv"></div>
				</td>
			</tr>

			<tr>
				<td width="100" align="center">비밀번호</td>
				<td><input type="password" name="pwd" id="pwd">
					<div id="pwdDiv"></div>
				</td>
			</tr>

			<tr>
				<td width="100" align="center">재확인</td>
				<td><input type="password" name="repwd" id="repwd">
					<div id="repwdDiv"></div>
				</td>
			</tr>

			<tr>
				<td width="100" align="center">성별</td>
				<td><input type="radio" name="gender" value="0" checked>남
					<input type="radio" name="gender" value="1">여
				</td>
			</tr>

			<tr>
				<td width="100" align="center">이메일</td>
				<td><input type="text" name="email1"> @ <input
					type="email" name="email2" list="email2" placeholder="직접입력">
					<datalist id="email2">
						<option value="naver.com">naver.com
						<option value="daum.net">daum.net
						<option value="gmail.com">gmail.com
					</datalist>
				</td>
			</tr>

			<tr>
				<td width="100" align="center">핸드폰</td>
				<td><select name="tel1" style="width: 70px;">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="019">019</option>
					</select> 
					- 
					<input type="text" name="tel2" size="6" maxlength="4"> 
					-
					<input type="text" name="tel3" size="6" maxlength="4">
				</td>
			</tr>

			<tr>
				<td width="100" align="center">주소</td>
				<td><input type="text" name="zipcode"> 
					<input type="button" value="우편번호 검색"><br> 
					<input type="text" name="addr1" size="60" placeholder="주소"><br> 
					<input type="text" name="addr2" size="60" placeholder="상세주소"></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="button"  id="WriteBtn" value="회원가입"> 
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</aside>
		</form>
	<!-- aside -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#WriteBtn').click(function(){
		//초기화
		$('#nameDiv').empty();
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		$('#repwdDiv').empty();
		
		
		if($('input[name=name]').val() == '') {
			$('#nameDiv').html('이름을 입력하세요'); 
			$('#name').focus();
		}
		else if($('input[name=id]').val() == ''){
			$('#idDiv').html('아이디를 입력하세요');
			$('#id').focus();
		}
		else if($('input[name=pwd]').val() == ''){
			$('#pwdDiv').html('비밀번호를 입력하세요');
			$('#pwd').focus();
		}
		else if($('input[name=repwd]').val() == ''){
			$('#repwdDiv').html('비밀번호를 다시 입력하세요');
			$('#ewpwd').focus();
		}
		else 
			$('form[name=writeForm]').submit();
	});
});
</script>
</body>
</html>