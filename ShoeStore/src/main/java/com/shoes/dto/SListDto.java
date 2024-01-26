package com.shoes.dto;

import java.sql.Date;

public class SListDto {
	
	int code;
	String brand;
	String name;
	String color;
	String price;
	int size;
	int qty;
	String image;
	
	public SListDto() {
		// TODO Auto-generated constructor stub
	}
	
	public SListDto(int code, String brand, String name, String color, String price, int size, int qty, String image) {
		super();
		this.code = code;
		this.brand = brand;
		this.name = name;
		this.color = color;
		this.price = price;
		this.size = size;
		this.qty = qty;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	
}
