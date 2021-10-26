<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> 
<%-- XML파일 태그 시작 전 공백 문자 제거 --%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  
<%
// String user_id = request.getParameter("user_id");
String user_id = "hong";

// DB - 나중에

boolean result = false;
if(user_id == "hong") result = true;

// xml 형식으로 보내려면
// <%@ page language="java" contentType="text/xml; charset=UTF-8"
// contentType을 text/html에서 xml로 고친다
%>
<c:set var="result" value="false" />
<c:if test="${param.user_id == 'hong' }">
	<c:set var="result" value="true" />
</c:if>
<?xml version="1.0" encoding="UTF-8"?>
<check_id>
	<result>${result }</result>
</check_id>