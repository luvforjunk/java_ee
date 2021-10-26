function checkGuestbookWrite(){
	
   
	if(document.guestbookWriteForm.subject.value == "")
		document.getElementById("subjectDiv").innerText = "제목을 입력해주세요";
	else if(document.guestbookWriteForm.content.value == "") 
		document.getElementById("contentDiv").innerText = "내용을 입력해주세요";
	else
		document.guestbookWriteForm.submit();
}
