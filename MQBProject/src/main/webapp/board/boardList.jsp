<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
th {
	font-size: 16px;
}

td {
	font-size: 13px;
}

#currentPaging {
	color: red;
	text-decoration: underline;
}

#paging {
	color: black;
	text-decoration: none;
}

.subjectA:link {
	color: black;
	text-decoration: none;
}

.subjectA:visited {
	color: black;
	text-decoration: none;
}

.subjectA:active {
	color: black;
	text-decoration: none;
}

.subjectA:hover {
	color: green;
	text-decoration: underline;
}
</style>
</head>
<body>
	<input type="hidden" id="pg" value="${requestScope.pg }">
	<input type="hidden" id="memId" value="${sessionScope.memId }">
	<table id="boardListTable" border="1" cellspacing="0" cellpadding="5"
		frame="hsides" rules="rows">
		<tr>
			<th width="100">글번호</th>
			<th width="300">제목</th>
			<th width="100">작성자</th>
			<th width="100">조회수</th>
			<th width="100">작성일</th>
		</tr>

	</table>
	<div style="width: 750px; text-align: center;">
		<c:forEach var="i" begin="1" end="${totalP }">
			<c:if test="${i == pg }">
			[<a id="currentPaging" href="/MQBProject/board/boardList.do?pg=${i }">${i }</a>]
		</c:if>
			<c:if test="${i != pg }">
			[<a id="paging" href="/MQBProject/board/boardList.do?pg=${i }">${i }</a>]
		</c:if>
		</c:forEach>
	</div>


	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/MQBProject/js/boardList.js">
		
	</script>