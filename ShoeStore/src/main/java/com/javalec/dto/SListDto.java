package com.javalec.dto;

import java.sql.Date;

public class SListDto {
	
	int code;
	String brand;
	String Kbrand;
	String name;
	String Kname;
	String color;
	String price;
	int size;
	int qty;
	String image;
	
	public SListDto() {
		// TODO Auto-generated constructor stub
	}
	
	public SListDto(String image) {
		super();
		this.image = image;
	}

	public SListDto(int code, String brand, String kbrand, String name, String Kname, String color, String price,
			int size, int qty, String image) {
		super();
		this.code = code;
		this.brand = brand;
		this.Kbrand = kbrand;
		this.name = name;
		this.Kname = Kname;
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

	public String getKbrand() {
		return Kbrand;
	}

	public void setKbrand(String kbrand) {
		Kbrand = kbrand;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKname() {
		return Kname;
	}

	public void setKname(String Kname) {
		this.Kname = Kname;
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

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
