<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<form id="productWriteForm" enctype="multipart/form-data" method="post"
	action="/MQBProject/product/productWrite.do">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<td width="100" align="center">상품</td>
			<td>
				<input type="file" id="img" name="img">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">상품명</td>
			<td>
				<input type="text" name="name" id="name" size="30">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">단가</td>
			<td>
				<input type="text" name="unit" id="unit" size="30">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">개수</td>
			<td>
				<input type="text" name="qty" id="qty" size="30">
			</td>
		</tr>
		
		<tr>
			<td width="100" align="center">할인율</td>
			<td>
				<input type="text" name="rate" id="rate" size="30">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="productWriteBtn" value="계산" />
				<input type="reset" value="취소" />
			</td>
		</tr>
	</table>	
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$('#productWriteBtn').click(function(){
		$('#productWriteForm').submit();
	});
</script>
