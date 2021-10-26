package com.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandProcess { //CommandProcess : 부모
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}

// CommandProcess는 인터페이스인데,
// 그 자식이 바로 BoardWriteService.java
// java파일들은 다 CommandProcess한테 상속
