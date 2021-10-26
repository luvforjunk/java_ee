<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
div{
	color: red;
	font-size: 8pt;
	font-weight: bold;
}
table {
	border-collapse: collapse;
}
</style>
</head>
<body>
	<h2>글쓰기</h2>
	<form name="boardWriteForm" method="post" action="boardWrite.jsp">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">제목</td>
			<td><input type="text" name="subject" id="subject" size="50">
				<div id="subjectDiv"></div>
			</td>
		</tr>

		<tr>
			<td width="100" align="center">내용</td>
			<td><textarea name="content" id="content" rows="15" cols="50"></textarea>
				<div id="contentDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="writeBtn" value="글쓰기">
				<input type="reset" value="다시작성">
				<!-- JQuery를 쓸 때는 onclick이 굳이 필요없음 -->
	</table>
	</form>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script type="text/javascript" src="../js/board.js"></script>
</body>
</html>