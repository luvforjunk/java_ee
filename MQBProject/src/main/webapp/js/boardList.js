$(function() {
	$.ajax({
		url: '/MQBProject/board/getBoardList.do',
		type: 'post',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data) {
			//alert(JSON.stringify(data));

			// 자바에서의 형식이 
			// for(BoardDTO items : list) {}
			// 이 다중포문의 형식이 아래와 같음
			// data.list(제이슨으로 받아온 데이터 중에서 list의 값) 
			// 그리고 그 list에 items라는 변수에 넣는데 그 제이슨 {} 이 여러개이니까 index를 붙여준다.
			// 배열형식으로 끌어온다 for

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
					id: 'subject_' + items.seq

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
				
				//답글
				for(var i=0; i<items.lev; i++){
					$('#subject_' + items.seq).before('&emsp;');
				} //for
				
				if(items.pseq != 0){
					$('#subject_'+items.seq).before($('<img>', {
						src: '../img/reply.gif',
						alt: '답글이미지',
						width: '10',
						height: '10'
					}));
				} // if

				//로그인 여부 - session
				$('#subject_' + items.seq).click(function() {
					if (data.memId == null) {
						alert('먼저 로그인 하세요.');
					} else {
						location.href = '/MQBProject/board/boardView.do?seq=' + items.seq + '&pg=' + $('#pg').val();
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