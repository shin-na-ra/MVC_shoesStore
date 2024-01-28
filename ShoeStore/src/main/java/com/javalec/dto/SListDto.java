package com.javalec.dto;

import java.sql.Date;

public class SListDto {
	
	int code;
	String brand;
	String kbrand;
	String name;
	String kname;
	String color;
	String price;
	int size;
	int qty;
	String image;
	String description;
	String metarial;
	String company;
	String madein;
	
	public SListDto() {
		// TODO Auto-generated constructor stub
	}
	
	public SListDto(String image) {
		super();
		this.image = image;
	}
	
	public SListDto(int size) {
		super();
		this.size = size;
	}

	public SListDto(int code, String brand, String kbrand, String name, String kname, String color, String price,
			int size, int qty, String image) {
		super();
		this.code = code;
		this.brand = brand;
		this.kbrand = kbrand;
		this.name = name;
		this.kname = kname;
		this.color = color;
		this.price = price;
		this.size = size;
		this.qty = qty;
		this.image = image;
	}
	
	public SListDto(int code, String brand, String kbrand, String name, String kname, String color, String price,
			int size, int qty, String description, String metarial, String company, String madein) {
		super();
		this.code = code;
		this.brand = brand;
		this.kbrand = kbrand;
		this.name = name;
		this.kname = kname;
		this.color = color;
		this.price = price;
		this.size = size;
		this.qty = qty;
		this.description = description;
		this.metarial = metarial;
		this.company = company;
		this.madein = madein;
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
		return kbrand;
	}

	public void setKbrand(String kbrand) {
		this.kbrand = kbrand;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKname() {
		return kname;
	}

	public void setKname(String kname) {
		this.kname = kname;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMetarial() {
		return metarial;
	}

	public void setMetarial(String metarial) {
		this.metarial = metarial;
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

}