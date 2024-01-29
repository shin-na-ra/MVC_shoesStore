package com.javalec.dto;

public class AdminDto {
	
	// Field
	int code;
	String brand;
	String name;
	String color;
	int price;
	int size;
	int qty;
	String image;
	String description;
	String meterial;
	String company;
	String madein;
	
	// Constructor
	public AdminDto(int code, String brand, String name, String color, int price, int size, int qty, String image,
			String description, String meterial, String company, String madein) {
		super();
		this.code = code;
		this.brand = brand;
		this.name = name;
		this.color = color;
		this.price = price;
		this.size = size;
		this.qty = qty;
		this.image = image;
		this.description = description;
		this.meterial = meterial;
		this.company = company;
		this.madein = madein;
	}
	
	public AdminDto(int code, String brand, String name, String color, int price, int size, int qty, String image) {
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