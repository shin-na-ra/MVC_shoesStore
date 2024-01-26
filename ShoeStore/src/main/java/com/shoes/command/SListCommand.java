package com.shoes.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoes.dao.SListDao;
import com.shoes.dto.SListDto;

public class SListCommand implements SCommand {

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		SListDao dao = new SListDao();
		List<SListDto> dtos = dao.shoesList();
		
		reqeust.setAttribute("shoesList", dtos);
	}
	
}
