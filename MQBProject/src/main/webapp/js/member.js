$(function() {
	//회원가입
	$('#writeBtn').click(function() {
		$('#nameDiv').empty();
		$('#writeForm #idDiv').empty();
		$('#writeForm #pwdDiv').empty();
		$('#repwdDiv').empty();

		//name 속성
		if ($('input[name="name"]').val() == '') {
			$('#nameDiv').html('이름 입력');
			$('#name').focus();
			
		} else if ($('#writeForm #id').val() == '')
			$('#writeForm #idDiv').html('아이디 입력');
			
		else if ($('#writeForm #pwd').val() == '')
			$('#writeForm #pwdDiv').html('비밀번호 입력');
			
		else if ($('#writeForm #pwd').val() != $('#repwd').val())
			$('#repwdDiv').html('비밀번호 틀림');
			
		else
			$('form[name="writeForm"]').submit();
	});

	//로그인
	$('#loginBtn').click(function() {
		$('#idDiv').empty();
		$('#pwdDiv').empty();

		if ($('input[name="id"]').val() == '')
			$('#idDiv').html('아이디 입력');
		else if ($('input[name="pwd"]').val() == '')
			$('#pwdDiv').html('비밀번호 입력');
		else{
			
			$.ajax({ // 페이지 이동없이 이벤트 실행되도록
				url: '/MQBProject/member/login.do',
				type: 'post',
				data: 'id='+$('#id').val()+'&pwd='+$('#pwd').val(), //'변수=값&변수=값'
				dataType: 'text',
				success: function(data){
					alert(data);
					data = data.trim(); // 공백 제거
				
					if(data == 'ok'){
						location.href='index.jsp';
						
					} else if(data == 'fail'){
						$('#loginResult').text('로그인 실패');
						$('#loginResult').css('color', 'red');
						$('#loginResult').css('font-size', '15pt');
						$('#loginResult').css('font-weight', 'bold');
					}
				},
				error: function(err){
					console.log(err);
				}
			}); 
		}			
	});
});

//우편번호


//아이디 중복 체크
$('#writeForm #id').focusout(function(){
	$('#writeForm #idDiv').empty();
	
	if($('#writeForm #id').val() == '') {
		$('#writeForm #idDiv').html('먼저 아이디를 입력하세요');
	}else{
		$.ajax({
			url: '/MQBProject/member/checkId.do',
			
		});
	}	
}); 

$('#checkIdBtn').click(function() {
	var id = $('#writeForm #id').val(); // jQuery형식 
	if (id == "")
		alert("먼저 아이디를 입력하세요");
	else
		window.open("/mvcmember/member/checkId.do?id=" + id, 
		"checkId", "width=350 height=200 top=200 left=700");
});

$('#checkIdClose').click(function() {
	
	$('#writeForm #id', opener.document).val($('#checkId').val());
	$('#check', opener.document).val($('#checkId').val());
	window.close();
	$('#writeForm #pwd', opener.document).focus();
});

$('#zipcodeBtn').click(function(){
	window.open("/mvcmember/member/checkPost.do", "checkPost", "width=500 height=500 top=200 left=700");
	
});

$('#addressA').click(function(){
	alert($('#zipcode').val() + ", " + $('#address'));
});







