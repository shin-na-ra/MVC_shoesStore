package com.javalec.dto.type;

public enum Gender {
	M("남성", "male"), // 소괄호가 생성자 호출
	F("여성", "female"); // 소괄호에 넣을 값들
	
	Gender(String kor, String eng) {
		this.kor = kor;
		this.eng = eng;
	}
	
	// 인스턴스 상수는 private 필드 + public getter
	private final String kor;
	private final String eng;
	
	public String kor() {
		return kor;
	}
	
	public String eng() {
		return eng;
	}
}
