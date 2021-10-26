package com.el;

public class Compute {
	
	public static int sum(String x, String y) { // 문자열의 합 구하기
		return Integer.parseInt(x) + Integer.parseInt(y);
	}
	public static int mul(String x, String y) { // 문자열의 합 구하기
		return Integer.parseInt(x) * Integer.parseInt(y);
		
	}
}

// static이 아니면 반드시 new를 해야하고
// static이면 바로 접근할 수 있다