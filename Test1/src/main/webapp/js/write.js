$(function () {
	$('#writeBtn').click(function () {
		//초기화
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if ($('input[name=id]').val() == ''){
			$('#subjectDiv').html('아이디를 입력하세요');
			$('#subject').focus();
		}
		else if ($('textarea[name=pwd]').val() == ''){
			$('#contentDiv').html('비밀번호를 입력하세요');
			$('#content').focus();
		}
		else
			$('form[name=boardWriteForm]').submit();
	});

});