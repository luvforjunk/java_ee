<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="board.dao.BoardDAO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="hidden" id="seq" value="${requestScope.seq }">
	<input type="hidden" id="pg" value="${pg}">

	<table border="1" cellspacing="0" cellpadding="5" frame="hsides"
		rules="rows">
		<tr>
			<td colspan="3"><h3>
					<span id="subjectSpan"></span>
				</h3></td>
			<!-- 내가 잡은 글자만큼 크기를 잡아주려 <span>태그를 쓴다 -->
		</tr>

		<tr>
			<td width="150">글번호 : <span id="seqSpan"></span></td>
			<td width="150">작성자 : <span id="idSpan"></span></td>
			<td width="150">조회수 : <span id="hitSpan"></span></td>
		</tr>

		<tr>
			<td colspan="3" height="200" valign="top"><pre></pre></td>
		</tr>
	</table>

	<input type="button" id="boardListBtn" value="목록"
		onclick="location.href='/MQBProject/board/boardList.do?pg=${pg}'">

	<span id="boardViewSpan"> <input type="button" value="글수정">
		<input type="button" value="글삭제">
	</span>
	<input type="button" value="답글">

	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
$(function{
	$.ajax({
		url: '/MQBProject/board/getBoardView.do',
		type: 'post',
		data: 'seq='+$('#seq').val(),
		dataType: 'json',
		success: function(data){
			//console.log(JSON.stringify(data));
			
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.seq);
			$('#idSpan').text(data.id);		
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);
			
			
		},
		error: function(err){
			console.log(err);
		}
});
});
</script>
</body>
</html>