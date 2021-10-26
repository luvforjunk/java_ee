<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="luv" uri="tld" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>자바클래스의 메소드를 이용해 계산</h3>

${param['x'] } + ${param['y'] } = ${ luv:sum(param['x'], param['y']) }<br>

${param.x } * ${param.y } = ${ luv:mul(param.x, param.y) }<br>
</body>
</html>