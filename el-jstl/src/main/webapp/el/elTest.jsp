<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> <!-- body가 table의 부모 -->
<table border="1" width="50%"> <!-- 화면의 반을 차지 -->
	<tr>
		<th width="50%">표현식</th>
		<th width="50%">값</th>
	</tr>
	
	<tr>
		<td align="center">\${25+3 }</td>
		<td align="center">${25+3 }</td>
	</tr>
	
	<tr>
		<td align="center">\${25/3 }</td>
		<td align="center">${25/3 }</td>
	</tr>
	
	<tr>
		<td align="center">\${25 div 3 }</td>
		<td align="center">${25 div 3 }</td>
	</tr>
	
	<tr>
		<td align="center">\${25 % 3 }</td>
		<td align="center">${25 % 3 }</td> <!-- 정수형 실수형 구별 안함 -->
	</tr>
	
	<tr>
		<td align="center">\${25 mod 3 }</td>
		<td align="center">${25 mod 3 }</td>
	</tr>
	
	<tr>
		<td align="center">\${25 gt 3 }</td>
		<td align="center">${25 gt 3 }</td>
	</tr>
	
	<!-- gt(>), lt(<), ge(>=), le(<=), eq(==), ne(!=) -->
	<tr>
		<td align="center">\${header['host'] }</td>
		<td align="center">${header['host'] }</td> <!-- JSON에서 많이 쓰이니 잘 기억해라 -->
	</tr>
	
	<tr>
		<td align="center">\${header.host }</td>
		<td align="center">${header.host }</td> 
	</tr>
</table>
</body>
</html>