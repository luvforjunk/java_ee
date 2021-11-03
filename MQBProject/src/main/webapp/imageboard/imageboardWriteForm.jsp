<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h3>이미지 등록</h3>
<form id="imageboardWriteForm" enctype="multipart/form-data" method="post" action="/MQBProject/imageboard/imageboardWrite.do">
<!-- 파일 찾기를 구현할 때 반드시 필요 -->
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">상품코드</td>
			<td>
				<input type="text" name="imageId" id="imageId" value="img_" size="30">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">상품명</td>
			<td>
				<input type="text" name="imageName" id="imageName" size="30">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">단가</td>
			<td>
				<input type="text" name="imagePrice" id="imagePrice" size="30">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">개수</td>
			<td>
				<input type="text" name="imageQty" id="imageQty" size="30">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">내용</td>
			<td>
				<textarea cols="30" row="15" name="imageContent" id="imageContent"></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="file" name="image1">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="file" name="image2">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="imageboardWriteBtn" value="이미지등록" /> <!-- 유효성검사 안할거임 -->
				<input type="reset" value="다시작성" />
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$('#imageboardWriteBtn').click(function(){
		$('#imageboardWriteForm').submit();
	});
</script>