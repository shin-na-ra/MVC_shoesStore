package com.shoes.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoes.dao.AdminDao;
import com.shoes.dto.AdminDto;

public class SLoadProductCommand implements SCommand {

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		
		AdminDao dao = new AdminDao();
		ArrayList<AdminDto> dtos = dao.loadProducts();
		
		reqeust.setAttribute("products", dtos);
		
	}

}