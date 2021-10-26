<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="java.util.List"%>

<%
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));

//DB
//페이징 처리 - 1페이지당 5개씩
int endNum = pg*5;
int startNum = endNum-4;

BoardDAO boardDAO = BoardDAO.getInstance();
List<BoardDTO> list = boardDAO.getBoardList(startNum, endNum);

//페이징 처리
int totalA = boardDAO.getTotalA();
int totalP = (totalA+4)/5;

//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th {
	font-size: 16px;
}
td {
	font-size: 14px;
}

#subjectA:hover {
	color: green;
	text-decoration: underline;
}
#currentPaging {
	color: red;
	text-decoration: underline;
}
#paging {
	color: black;
	text-decoration: none;
}

</style>
</head>
<body>
	<%if(list != null){ %>
	<table border="1" cellspacing="0" cellpadding="5" frame="hsides" rules="rows"> 
		<tr>
			<th>글번호</th>
			<th width="100">제목</th> 
			<th width="100">작성자</th>
			<th width="100">조회수</th>
			<th width="100">작성일</th>
			<!-- th이기 때문에 자동으로 가운데 정렬되어서 align="center"안해줘도 된다 -->	
		</tr>

		<%for (BoardDTO boardDTO : list) {%>
		<tr>
			<td align="center"><%=boardDTO.getSeq() %></td>
			<td>
				<a href="boardView.jsp?seq=<%=boardDTO.getSeq() %>&pg=<%=pg %>" id="subjectA"><%=boardDTO.getSubject() %></a>
			</td>
			<td align="center"><%=boardDTO.getId() %></td>
			<td align="center"><%=boardDTO.getHit() %></td>
			<td align="center"><%=boardDTO.getLogtime() %></td>
		</tr>
	<%} // for %>
	</table>

	<div style="width: 450px; text-align: center;"> 
	<%for(int i=1; i<=totalP; i++){ %>
		<%if(pg==i) { //현재 페이지 %>
		[<a id="currentPaging" href="boardList.jsp?pg=<%=i%>"><%=i %></a>]
		<%}else{ %>
		[<a id="paging" href="boardList.jsp?pg=<%=i%>"><%=i %></a>]
		<%} %>
	<%}//for %>
	</div>
<%}//if %>
</body>
</html>