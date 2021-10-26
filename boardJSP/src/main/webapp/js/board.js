$(function () {
	$('#writeBtn').click(function () {
		//초기화
		$('#subjectDiv').empty();
		$('#contentDiv').empty();

		/*//id속성
		
		if ($('#subject').val() == '')
			$('#subjectDiv').html('제목 입력');
		else if 
			($('#content').val() == '')
			$('#contentDiv').html('내용 입력');
		else $('#boardWriteForm').submit();*/
		 


		//name속성
		if ($('input[name=subject]').val() == ''){
			$('#subjectDiv').html('제목 입력');
			$('#subject').focus();
		}
		else if ($('textarea[name=content]').val() == ''){
			$('#contentDiv').html('내용 입력');
			$('#content').focus();
		}
		else
			$('form[name=boardWriteForm]').submit();
	});

});