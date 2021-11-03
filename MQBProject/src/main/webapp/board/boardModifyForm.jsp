<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
#boardModifyForm div {
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
</style>

<h3>글수정</h3>
<form id="boardModifyForm">
	<input type="hidden" name="seq" id="seq" value="${requestScope.seq }">
	<input type="hidden" name="pg" id="pg" value="${pg }">

	<table cellspacing="0" border="1" cellpadding="5">
		<tr>
			<td width="50" align="center">제목</td>
			<td><input type="text" name="subject" id="subject" 
				style="width: 350px;">
				<div id="subjectDiv"></div></td>
		</tr>
		<tr>
			<td width="50" align="center">내용</td>
			<td><textarea name="content" id="content" cols="50" rows="15"></textarea>
				<div id="contentDiv"></div></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="button"
				id="boardModifyBtn" value="글수정"> <input type="reset"
				value="다시작성"></td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : '/MQBProject/board/getBoardView.do',
			type : 'post',
			data : {'seq' : $('#seq').val()},
			dataType : 'json',
			success : function(data) {
				console.log(JSON.stringify(data));

				$('#subject').val(data.subject); // 여기서 subject는 input이니까 val걸어주기
				$('#content').val(data.content);
			},
			error : function(err) {
				console.log(err);
			}
		});
	});

	$('#boardModifyBtn').click(function() {
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
		else{
			$.ajax({
				url : '/MQBProject/board/boardModify.do',
				type : 'post',
				data : $('#boardModifyForm').serialize(),
				success : function(){
					alert("글수정 완료");
					location.href='/MQBProject/board/boardList.do?pg='+$('#pg').val();
				},
				error : function(err){
					console.log(err);
				}			
			});
		}
	});
</script>