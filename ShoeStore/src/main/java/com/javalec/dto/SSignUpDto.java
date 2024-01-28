package com.javalec.dto;

import static com.javalec.common.utils.Preconditions.validateOrThrow;
import static com.javalec.domain.CustomerValidation.ADDRESS;
import static com.javalec.domain.CustomerValidation.ADDRESS_DETAIL;
import static com.javalec.domain.CustomerValidation.EMAIL;
import static com.javalec.domain.CustomerValidation.FULL_NAME;
import static com.javalec.domain.CustomerValidation.PASSWORD;
import static com.javalec.domain.CustomerValidation.TEL;
import static com.javalec.domain.CustomerValidation.USER_ID;

import java.time.Instant;
import java.util.Objects;

import com.javalec.dto.type.Gender;

public record SSignUpDto(
		String userId,
		String password,
		String fullName,
		String tel,
		Instant birth,
		Gender gender,
		String email,
		String address,
		String addressDetail
) {
	public SSignUpDto {
		Objects.requireNonNull(userId);
		Objects.requireNonNull(password);
		Objects.requireNonNull(fullName);
		Objects.requireNonNull(tel);
		
		userId = userId.strip();
		password = password.strip();
		fullName = fullName.strip();
		tel = tel.strip();
		email = email != null ? email.strip() : null; // unique 없으면 "" 가능
		address = address != null ? address.strip() : null;
		addressDetail = addressDetail != null ? addressDetail.strip() : null;
		
		// 프론트에서 보내는 정보는 위변조 될 수 있기 때문에 백엔드에서 추가로 확인.
		validateOrThrow(USER_ID, userId, "사용자 아이디가 올바른 형식이 아닙니다.");
		validateOrThrow(PASSWORD, password, "비밀번호가 올바른 형식이 아닙니다.");
		validateOrThrow(FULL_NAME, fullName, "사용자 성명이 올바른 형식이 아닙니다.");
		validateOrThrow(TEL, tel, "연락처가 올바른 형식이 아닙니다.");
		validateOrThrow(EMAIL, email, "이메일이 올바른 형식이 아닙니다.");
		validateOrThrow(ADDRESS, address, "주소가 올바른 형식이 아닙니다.");
		validateOrThrow(ADDRESS_DETAIL, addressDetail, "상세 주소가 올바른 형식이 아닙니다.");
	}
}
