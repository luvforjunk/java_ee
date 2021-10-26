<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>${requestScope.id }이미 사용 중인 아이디입니다</h3>
	<br>
	<form action="/mvcmember/member/checkId.do">
		아이디 <input type="text" name="id"> 
			 <input type="submit" value="중복체크">
	</form>
</body>
</html>