<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#currentPaging {
	color: red;
	text-decoration: underline;
	cursor: pointer;
}

#paging {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>

<form id="imageboardDeleteForm" method="post" action="/MQBProject/imageboard/imageboardDelete.do">

<input type="hidden" id="pg" value="${requestScope.pg }">

<table id="imageboardListTable" border="1" cellspacing="0"
	cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<th width="100"><input type="checkbox" id="all">글번호</th>
		<th width="100">이미지</th>
		<th width="100">상품명</th>
		<th width="100">단가</th>
		<th width="50">개수</th>
		<th width="100">합계</th>
	</tr>
</table>

<input type="button" id="choiceDeleteBtn" style="margin-top: 5px;" value="선택삭제">

<div id="imageboardPagingDiv" style="display: inline-block; width: 540px; text-align: center; border: 1px;">aaa</div>


</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$.ajax({
			url : '/MQBProject/imageboard/getImageboardList.do',
			type : 'post',
			data : 'pg=' + $('#pg').val(),
			dataType : 'json',
			success : function(data) {
				console.log(JSON.stringify(data));
				$.each(data.list, function(index, items) {
					//for(ImageboardDTO items : data.list){} 자바 형식을 위와 같은 식으로

					$('<tr/>').append($('<td/>', {
						align : 'center',
						text : items.seq
						//id : 'imageSeq_' + items.seq
						
					}).prepend($('<input/>', {
						type: 'checkBox',
						class: 'check',
						name: 'check',
						value: items.seq
					}))
					
					).append($('<td/>', {
						align : 'center'

					}).append($('<img/>', {
						src : '/MQBProject/storage/' + items.image1,
						alt : items.image1,
						style : 'width: 60px; height: 60px;'

					}))).append($('<td/>', {
						align : 'center',
						text : items.imageName

					})).append($('<td/>', {
						align : 'center',
						text : items.imagePrice.toLocaleString()

					})).append($('<td/>', {
						align : 'center',
						text : items.imageQty

					})).append(
							$('<td/>', {
								align : 'center',
								text : (items.imagePrice * items.imageQty).toLocaleString()

							})).appendTo($('#imageboardListTable'));
					
					<%-- $('#imageSeq_'+items.seq).prepend($('<input>', {
		                  type: 'checkbox',
		                  class: 'check'
		            }));
					 $('#all').click(function(){
				            if($(this).is(":checked")){
				               $('input:checkbox').prop('checked', true);
				            }
				            else{
				               $('input:checkbox').prop('checked', false);
				            }
				         });--%>
					
				}); //each

				//페이징처리
				$('#imageboardPagingDiv').html(data.imageboardPaging);
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
</script>

<script>
function imageboardPaging(param_pg) {
	location.href='/MQBProject/imageboard/imageboardList.do?pg='+param_pg;
}

// 전체 선택 / 전체 해제
$('#all').click(function(){
	if($('#all').prop("checked")){
        $('.check').prop('checked', true);
     }else{
        $('.check').prop('checked', false);
     }
});

// 선택 삭제
$('#choiceDeleteBtn').click(function(){
	var count = $('.check:checked').length;
	alert(count);
	
	if(count == 0)
		alert('삭제 할 항목을 선택하세요');
	else {
		if(confirm('정말로 삭제하시겠습니까?'))
			$('#imageboardDeleteForm').submit();
	}
});
</script>