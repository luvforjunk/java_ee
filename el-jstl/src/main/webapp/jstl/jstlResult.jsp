<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<fmt:requestEncoding value="UTF-8" />
<style type="text/css">
body {
	color: ${param.color};
}
</style>
</head>
<body>
<!-- request.setCharacterEncoding("UTF-8") -->
<!-- post방식일 때만 써준다 주소를 타는 get방식일 때는 필요없음 -->
<ul>
	<li>이 름 : ${param.name }
	</li><br>
	
	<li>나 이 : ${param.age }
		<c:if test="조건"></c:if>
	
		<c:if test="${param.age >= 20 }">
			<strong>성인</strong>
		</c:if>
	
		<c:if test="${param.age < 20 }">
			<strong>청소년</strong>
		</c:if>
	<%-- test안에 써주는 건 조건 --%>
	</li><br>
	
	<li>색 깔 : 
		<c:if test="${param.color == 'red' }"><strong>빨강</strong></c:if>
		<c:if test="${param.color == 'green' }"><strong>초록</strong></c:if>
		<c:if test="${param.color == 'blue' }"><strong>파랑</strong></c:if>
		<c:if test="${param.color == 'violet' }"><strong>보라</strong></c:if>
		<c:if test="${param.color == 'cyan' }"><strong>하늘</strong></c:if>
	</li><br>
	
	<li>취미 :
		${ paramValues['hobby'][0]} <!-- paramValues.hobby[0] -->
		${ paramValues['hobby'][1]}
		${ paramValues['hobby'][2]}
		${ paramValues['hobby'][3]}
		${ paramValues['hobby'][4]}
	</li><br>
	
	<li>취미 : <br>
		<c:forEach var="data" items="${paramValues.hobby }" varStatus="i">
            인덱스 = ${i.index } &emsp; 개수 = ${i.count } &emsp; ${data }<br>
         </c:forEach>
	</li><br>
</ul>
</body>
</html>