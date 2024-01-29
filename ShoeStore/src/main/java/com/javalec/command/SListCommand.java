package com.javalec.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.SListDao;
import com.javalec.dto.SListDto;


public class SListCommand implements SCommand {

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		SListDao dao = new SListDao();
		String input = reqeust.getParameter("searchInput");
		
		
		if (input == null) {
			List<SListDto> dtos = dao.shoesList();
			
			reqeust.setAttribute("shoesList", dtos);
		}
		else {
			List<SListDto> dtos = dao.searchShoes(input);
			
			reqeust.setAttribute("shoesList", dtos);
		}
		
	}
	
}