<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="board.dao.BoardDAO"%>

<form id="boardViewForm">
	<!-- post방식으로 넘겨주기 위해 -->
	<input type="hidden" name="seq" id="seq" value="${requestScope.seq }">
	<input type="hidden" name="pg" id="pg" value="${pg }">

	<table border="1" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
		<tr>	
			<td colspan="3">
				<h3><span id="subjectSpan"></span></h3>
			</td> 
			<!-- 내가 잡은 글자만큼 크기를 잡아주려 <span>태그를 쓴다 -->
		</tr>

		<tr>
			<td width="150">글번호 : <span id="seqSpan"></span></td>
			<td width="150">작성자 : <span id="idSpan"></span></td>
			<td width="150">조회수 : <span id="hitSpan"></span></td>
		</tr>

		<tr>
			<td colspan="3" height="200" valign="top">
			<pre><span id="contentSpan"></span></pre></td>
		</tr>
	</table>

	<input type="button" id="boardListBtn" value="목록"
		onclick="location.href='/MQBProject/board/boardList.do?pg=${pg}'">

	<span id="boardViewSpan"> <!-- 글수정, 글삭제만 묶어준다 --> 
		<input type="button" value="글수정" onclick="mode(1)"> <!--함수는 맘대로 설정해둬도 상관없다  -->
		<input type="button" value="글삭제" onclick="mode(2)">
	</span> 
		<input type="button" value="답글">
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

				$('#subjectSpan').text(data.subject);
				$('#seqSpan').text(data.seq);
				$('#idSpan').text(data.id);
				$('#hitSpan').text(data.hit);
				$('#contentSpan').text(data.content);

				// 작성한 사람만이 글수정, 글삭제 보이도록
				if (data.memId == data.id)
					$('#boardViewSpan').show();
				else
					$('#boardViewSpan').hide();
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
</script>

<script type="text/javascript">
	function mode(num) {
		if (num == 1) {
			document.getElementById("boardViewForm").method = 'post';
			document.getElementById("boardViewForm").action = '/MQBProject/board/boardModifyForm.do';
			document.getElementById("boardViewForm").submit();
			// submit으로 넘어갈 수 있는 건 아이디 속성이 아닌 name속성이다.
		} else if (num == 2) {

		}
	}
</script>