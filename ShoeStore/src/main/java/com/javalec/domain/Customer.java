package com.javalec.domain;

import java.time.Instant;

import com.javalec.dto.type.Gender;

public class Customer {
	private String userId;
	private String password;
	private String fullName;
	private String tel;
	private Instant birth;
	private Gender gender;
	private String email;
	private String address;
	private String addressDetail;
	
	public static CustomerBuilder builder() {
		return new CustomerBuilder();
	}
	
	public Customer(
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
		super();
		this.userId = userId;
		this.password = password;
		this.fullName = fullName;
		this.tel = tel;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.addressDetail = addressDetail;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Instant getBirth() {
		return birth;
	}
	public void setBirth(Instant birth) {
		this.birth = birth;
	}
	public Gender getGender() {
		return gender;
	}
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	
	public static class CustomerBuilder {
		private String userId;
		private String password;
		private String fullName;
		private String tel;
		private Instant birth;
		private Gender gender;
		private String email;
		private String address;
		private String addressDetail;
		
		public CustomerBuilder userId(String userId) {
			this.userId = userId;
			return this;
		}
		public CustomerBuilder password(String password) {
			this.password      = password;
			return this;
		}
		public CustomerBuilder fullName(String fullName) {
			this.fullName = fullName;
			return this;
		}
		public CustomerBuilder tel(String tel) {
			this.tel = tel;
			return this;
		}
		public CustomerBuilder birth(Instant birth ) {
			this.birth = birth;
			return this;
		}
		public CustomerBuilder gender(Gender gender) {
			this.gender = gender;
			return this;
		}
		public CustomerBuilder email(String email) {
			this.email = email;
			return this;
		}
		public CustomerBuilder address(String address) {
			this.address = address;
			return this;
		}
		public CustomerBuilder addressDetail(String addressDetail) {
			this.addressDetail = addressDetail;
			return this;
		}
		
		public Customer build() {
			return new Customer(
					userId,
					password,
					fullName,
					tel,
					 birth,
					gender,
					email,
					address,
					addressDetail
			);
		}
	}
}
