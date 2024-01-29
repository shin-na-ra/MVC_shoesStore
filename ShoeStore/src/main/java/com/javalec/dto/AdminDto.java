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
	String date;
	String admin;
	String type;
	
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
	
	public AdminDto(int code, String admin, int qty, String date, String type ) {
		super();
		this.code = code;
		this.admin = admin;
		this.qty = qty;
		this.date = date;
		this.type = type;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMeterial() {
		return meterial;
	}

	public void setMeterial(String meterial) {
		this.meterial = meterial;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getMadein() {
		return madein;
	}

	public void setMadein(String madein) {
		this.madein = madein;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}