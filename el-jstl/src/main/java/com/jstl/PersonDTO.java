package com.jstl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
@Data // 기본 생성자, setter/getter , toString(),...를 자동으로 설정
public class PersonDTO {
	@NonNull
	private String name; 
	private int age;

}