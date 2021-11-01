$(function() {
	$.ajax({
		url: '/MQBProject/board/getBoardRegisterList.do',
		type: 'post',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data) {
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

				}))

				).append($('<td/>', {
					align: 'center',
					text: items.email1
					
				})).append($('<td/>', {
					align: 'center',
					text: items.email2


				})).append($('<td/>', {
					align: 'center',
					text: items.id

				})).append($('<td/>', {
					align: 'center',
					text: items.content

				})).appendTo($('#boardRegisterListTable'));
			}); //each
		},
		error: function(err) {
			console.log(err);
		}
	});
});