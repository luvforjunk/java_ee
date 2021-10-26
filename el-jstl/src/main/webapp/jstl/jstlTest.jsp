<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>** 변수 설정 **</h3>
<c:set var="name" value="홍길동"></c:set> <!-- 정수 실수 이런게 없으니 var="" -->
<c:set var="age">25</c:set>

나의 이름은 ${name } 입니다. <br>
내 나이는 <c:out value="${age }"></c:out>살 입니다<br>
나의 키는 ${height }입니다. <!-- c:set을 설정하지 않아도 오류가 뜨지 않는다 -->

<h3>** 변수 삭제 **</h3>
<c:remove var="name"/>

나의 이름은 ${name } 입니다. <br>
내 나이는 <c:out value="${age }"></c:out>살 입니다<br>
나의 키는 ${height }입니다.

<h3>** forEach **</h3> <!-- 반복문 -->
<c:forEach var="i" begin="1" end="10" step="1"><%-- for(int i=1; i<=10; i++) --%>
	${i }
	<c:set var="sum" value="$(sum + i)"></c:set><%-- sum = sum + i --%>
</c:forEach>
<br>
1~ 10까지의 합은 ${sum }입니다.
<br><br>

<c:forEach var="i" begin="1" end="10" step="1"> <!-- step엔 0도 안되고 -도 안된다 -->
	${11-i }
</c:forEach>
<br>

<h3>** 문자열 분리 **</h3>
<c:forTokens var="car" items="소나타,아우디,페라리,제네시스,제규어" delims=",">
	${car }<br>
</c:forTokens>

<h3>** jstlExam.jsp에서 넘어오는 데이터 **</h3>
${requestScope.list } <!-- 옆에 꺼와 같은 의미 request.getAttribute("list") -->
<!-- el태그를 쓰고 있으니 request가 아닌 requestScope라고 써준다 -->

<h3>** 인덱스 2 데이터 출력 **</h3>
${list[2] }

<h3>** jstlExam.jsp에서 넘어오는 데이터 **</h3>
${list2 }
<br><br>

<c:forEach var="personDTO" items="${list2}"> <!-- for(PersonDTO personDTO : list2) -->
	이름 = ${personDTO.getName() } &emsp; 나이 = ${personDTO.getAge() }<br>
</c:forEach>

<h3>메소드명을 변수명처럼 사용</h3> <!-- set과 get 접두사 빼기, 뒤에 있는 괄호도 빼기 -->
<c:forEach var="personDTO" items="${list2}"> <!-- for(PersonDTO personDTO : list2) -->
	이름 = ${personDTO.name } &emsp; 나이 = ${personDTO.age }<br>
</c:forEach>
<!-- personDTO.name()의 name은 DTO의 String name이 아니다
private이라 다른 클래스에서 쓸 수 없으므로
웹에서는 getter만 Spring에서는 getter setter -->

</body>
</html>