<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.bean.BoardDTO"%>

<%
//데이터
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));

//DB
BoardDAO boardDAO = BoardDAO.getInstance();
BoardDTO boardDTO = boardDAO.View(seq);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="5" frame="hsides" rule="rows">
		<tr id="subject">
			<td colspan="3"><%=boardDTO.getSubject()%></td>
		</tr>

		<tr>
			<td width="150">글번호 : <%=boardDTO.getSeq()%></td>
			<td width="150">작성자 : <%=boardDTO.getId()%></td>
			<td width="150">조회수 : <%=boardDTO.getHit()%></td>
		</tr>

		<tr>
			<td colspan="3" height="150" valign="top" style="word-wrap:break-word">
				<pre><%=boardDTO.getContent()%></pre>
			</td>
		</tr>
	</table>
	
	<input type="button" id="ListBtn" value="목록" onclick="location.href='boardList.jsp?pg <%=pg%>'">
</body>
</html>