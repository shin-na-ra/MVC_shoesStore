package com.javalec.domain;

public final class CustomerValidation {
	
	public static final String USER_ID = "[A-Za-z0-9]{3,}";
	public static final String PASSWORD = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,100}$";
	public static final String FULL_NAME = "[가-힣]{2,}";
	public static final String TEL = "^\\d{2,3}-?\\d{3,4}-?\\d{4}$";
	public static final String EMAIL = "^[^\\sㄱ-ㅎㅏ-ㅣ가-힣]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
	public static final String ADDRESS = "[\\s가-힣A-Za-z0-9]{3,}";
	public static final String ADDRESS_DETAIL = "[\\s가-힣A-Za-z0-9]{2,}";
	
	private CustomerValidation() {} // prevent usage
}
