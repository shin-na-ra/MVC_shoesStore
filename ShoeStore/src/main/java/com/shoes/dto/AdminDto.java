package com.shoes.dto;

import java.io.FileInputStream;

public class AdminDto {
	
	// Field
	int code;
	String brand;
	String name;
	String color;
	int price;
	int size;
	FileInputStream Image;
	int qty;
	
	// Constructor
	public AdminDto(int code, String brand, String name, String color, int price, int size, FileInputStream image,
			int qty) {
		super();
		this.code = code;
		this.brand = brand;
		this.name = name;
		this.color = color;
		this.price = price;
		this.size = size;
		Image = image;
		this.qty = qty;
	}

	
	// Method
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

	public FileInputStream getImage() {
		return Image;
	}

	public void setImage(FileInputStream image) {
		Image = image;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
}