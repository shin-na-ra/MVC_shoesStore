package com.shoes.dto;

import java.sql.Date;

public class SListDto {
	
	int code;
	String brand;
	String name;
	String color;
	int price;
	int size;
	byte[] image;
	int qty;
	
	public SListDto() {
		// TODO Auto-generated constructor stub
	}
	
	public SListDto(String brand, String name, int price, byte[] image) {
		super();
		this.brand = brand;
		this.name = name;
		this.price = price;
		this.image = image;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	
}
