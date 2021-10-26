<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="board.dao.BoardDAO"%>
<%
//데이터
request.setCharacterEncoding("UTF-8");

String subject = request.getParameter("subject");
// --> Form에서 subject라고 명칭한 애를 불러와라
// 반드시 name속성을 불러와야 한다. id속성(X)
String content = request.getParameter("content");

BoardDTO boardDTO = new BoardDTO();
boardDTO.setId("csj");
boardDTO.setName("csj");
boardDTO.setEmail("csj3104@naver.com");
boardDTO.setSubject(subject);
boardDTO.setContent(content);
// 나머지 값들은 default라 굳이 필요없다

//DB
BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.write(boardDTO); // DTO를 한꺼번에 묶어서 boardDAO에 보낸다
// ????? = boardDAO.write(boardDTO); 이런 식이었으면 return값이 있는 거지만
// 여기서는 그렇지 않으니 return값이 없다.

//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>글쓰기 성공</h3>
	<br>
	<input type="button" id="ListBtn" value="글목록"
		onclick="location.href='boardList.jsp?pg=1'">
</body>
</html>