<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<table id="productListTable" border="1" cellspacing="0" cellpadding="5"
	frame="hsides" rules="rows">
	<tr>
		<th width="100">번호</th>
		<th width="100">이미지</th>
		<th width="100">상품명</th>
		<th width="100">단가</th>
		<th width="50">개수</th>
		<th width="100">합계</th>
		<th width="100">할인율</th>
		<th width="100">할인액</th>
		<th width="100">가격</th>
	</tr>
</table>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$.ajax({
			url : '/MQBProject/product/getProductList.do',
			type : 'post',
			data : 'pg=' + $('#pg').val(),
			dataType : 'json',
			success : function(data) {
				console.log(JSON.stringify(data));
				$.each(data.list, function(index, items) {

					$('<tr/>').append($('<td/>', {
						align : 'center',
						text : items.seq

					})).append($('<td/>', {
						align : 'center'

					}).append($('<img/>', {
						src : '/MQBProject/storage/' + items.img,
						alt : items.img
						style : 'width: 60px; height: 60px;'

					}))).append($('<td/>', {
						align : 'center',
						text : items.Name

					})).append($('<td/>', {
						align : 'center',
						text : items.Unit

					})).append($('<td/>', {
						align : 'center',
						text : items.Qty

					})).append($('<td/>', {
						align : 'center',
						text : items.(items.Price * items.Qty).toLocaleString()

					})).append($('<td/>', {
						align : 'center',
						text : items.(items.Price * items.Qty - items.Unit)

					})).append($('<td/>', {
						align : 'center',
						text : items.Discount

					})).append($('<td/>', {
						align : 'center',
						text : items.Price.toLocaleString()

					})).appendTo($('#productListTable'));

				});

			},
			error : function(err) {
				console.log(err);
			}
		});
	});
</script>

<script>
	function imageboardPaging(param_pg) {
		location.href = '/MQBProject/product/productList.do?pg=' + param_pg;
	}
</script>