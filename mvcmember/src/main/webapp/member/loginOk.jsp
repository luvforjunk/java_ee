<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String name = null;
String id = null;

//쿠키
/* Cookie[] ar = request.getCookies(); //모든 쿠키를 다 꺼내와야 한다
if(ar != null) {
	for(int i=0; i<ar.length; i++){
		String cookieName = ar[i].getName(); // 쿠키명
		String cookieValue = ar[i].getValue(); //값
		
		System.out.println("쿠키명 = " + cookieName);
		System.out.println("값 = " + cookieValue);

		if(cookieName.equals("memName")) name = cookieValue;
		if(cookieName.equals("memId")) id = cookieValue;
	}//for
}//if */

//세션
//name = (String)session.getAttribute("memName");
//id = (String)session.getAttribute("memId");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img {
	width: 70px;
	height: 50px;
	cursor: pointer; /* 화살표가 나오는 걸 손가락으로 나오게 하기 위해 */
}
</style>
</head>
<body>
<%-- <%=name %>님 로그인 --%>

<img src="../img/img5.PNG" onclick="location.href='../index.jsp'">
${sessionScope.memName}님 로그인
<br><br>
<input type="button" value="로그아웃" onclick="location.href='/mvcmember/member/logout.do'">
<input type="button" value="회원정보수정" onclick="location.href='/mvcmember/member/modifyForm.do'">
</body>
</html>