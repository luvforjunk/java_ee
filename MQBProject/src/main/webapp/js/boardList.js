$(function() {
	$.ajax({
		url: '/MQBProject/board/getBoardList.do',
		type: 'post',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data) {
			//alert(JSON.stringify(data));

			$.each(data.list, function(index, items) {
				$('<tr>').append($('<td/>', {
					align: 'center',
					text: items.seq

				})).append($('<td/>', {

					// 제목에 링크 걸기
				}).append($('<a/>', {
					href: '#',
					text: items.subject,
					class: 'subjectA',
					id: 'subject_'+items.seq

				}))

				).append($('<td/>', {
					align: 'center',
					text: items.id

				})).append($('<td/>', {
					align: 'center',
					text: items.hit

				})).append($('<td/>', {
					align: 'center',
					text: items.logtime

				})).appendTo($('#boardListTable'));

				//로그인 여부 - session
				$('#subject_' + items.seq).click(function() { 
					if(data.memId==null){
					alert('먼저 로그인 하세요.');
					}else{
						location.href='/MQBProject/board/boardView.do?seq='+items.seq+'&pg='+$('#pg').val();
					}
				});
			}); //each
			
			// 페이징 처리
			$('#boardPagingDiv').html(data.boardPaging);
		},
		error: function(err) {
			console.log(err);
		}
	});
});
// 자바스크립트에서는 세션이 없다.