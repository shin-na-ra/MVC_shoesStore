package com.javalec.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.AdminDao;
import com.javalec.dto.AdminDto;

public class SLoadProductCommand implements SCommand {

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		
		AdminDao dao = new AdminDao();
		ArrayList<AdminDto> dtos = dao.loadProducts();
		
		reqeust.setAttribute("products", dtos);
		
	}

}