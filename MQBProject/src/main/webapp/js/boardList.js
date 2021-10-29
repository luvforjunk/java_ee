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
					class: 'subjectA'

				}))
					.click(function() {
						//alert($('#memId').val());
						if ($('#memId').val() == '') {
							alert("먼저 로그인하세요");
						} else {
							location.href = "/MQBProject/board/boardView.do"

						}
					})

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
			});
		},
		error: function(err) {
			console.log(err);
		}
	});
});