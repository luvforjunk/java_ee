<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#boardRegisterForm div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>
</head>
<body>
	<h3>방명록 작성</h3>
	<form id="boardRegisterForm">
		<table cellspacing="0" border="1" cellpadding="5">
			<tr>
				<td width="50" align="right">작성자</td>
				<td><input type="text" name="id" id="id" size="15">
				</td>
			</tr>

			<tr>
				<td width="50" align="right">이메일</td>
				<td><input type="text" name="email1">
				@
				<input type="text" name="email2" list="email2" placeholder="직접입력">
				<datalist id="email2">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
				</datalist>
				</td>
			</tr>
			<tr>
				<td width="50" align="right">제목</td>
				<td><input type="text" name="subject" id="subject" size="50">
					<div id="subjectDiv"></div></td>
			</tr>
			<tr>
				<td width="50" align="right">내용</td>
				<td><textarea name="content" id="content" cols="50" rows="15"></textarea>
					<div id="contentDiv"></div></td>
					
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="registerBtn" value="작성">
					<input type="reset" value="다시작성">
				</td>
			</tr>	
		</table>
	</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
$('#registerBtn').click(function(){	
	//초기화 과정
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('#subject').val() == '') {
		$('#subjectDiv').html('제목 입력'); 
		$('#subject').focus();
	}
	else if($('#content').val() == ''){
		$('#contentDiv').html('내용 입력');
		$('#content').focus();
	}
	else 
		$.ajax({
			url: '/MQBProject/board/boardRegister.do',
			type: 'post',
			data: $('#boardRegisterForm').serialize(),
			success: function(){
				alert("글쓰기 성공");
				location.href="/MQBProject/board/boardRegisterList.do?pg=1";
			},
			error: function(err){
				console.log(err);
			}
		});
	});
});

</script>
</body>
</html>