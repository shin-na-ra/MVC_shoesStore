package com.javalec.common.utils;

import java.util.regex.Pattern;

public final class Preconditions {

	public static boolean validateOrThrow(String regExp, String text) {
		return validateOrThrow(regExp, text, "데이터가 올바른 형식이 아닙니다.");
	}
	
	public static boolean validateOrThrow(String regExp, String text, String message) {
		if (text != null && !text.isBlank() && !Pattern.matches(regExp, text)) {
			throw new IllegalArgumentException(message);
		}
		return true;
	}
	
	private Preconditions() {}
}
