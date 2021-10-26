<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ page import="cos.bean.CosDTO"%>
<%@ page import="cos.dao.CosDAO"%>
<%
//데이터
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

CosDTO cosDTO = new CosDTO();
cosDTO.setId(id);
cosDTO.setPwd(pwd);

//DB
CosDAO cosDAO = CosDAO.getInstance();
cosDAO.writeCheck(cosDTO); 

//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h3>로그인 성공</h3>
	<br>
	<input type="button" id="HomeBtn" value="홈" onclick="location.href='mainpage.jsp?pg=1'">
</body>
</html>