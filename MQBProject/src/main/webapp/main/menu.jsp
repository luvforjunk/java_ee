<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.mainnav {
	background-color: #96C7ED;
	list-style: none;
}

.mainnav li {
	display: inline-block;
	justify-content: space-between; /* 어느정도의 여백을 주기 위함 */
}

.mainnav li a {
	color: #ffffff;
	padding: 0 13px;
	background-color: #78A9ED;
	font: bold 16px/40px 'Nanum Gothic', sans-serif;
	text-transform: uppercase;
	text-decoration: none;
}

.mainnav li a:hover {
	color: #660000;
	background-color: #ffcc00;
}
</style>

<ul class="mainnav">
	<c:if test="${memId != null }">
		<li><a href="/MQBProject/board/boardWriteForm.do">글쓰기</a></li>
	</c:if>
	
	<li><a href="/MQBProject/board/boardList.do?pg=1">목록</a></li>
</ul>