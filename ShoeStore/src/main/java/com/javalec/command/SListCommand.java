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
		SListDto dto = new SListDto();
		List<SListDto> dtos = dao.shoesList();
		
		reqeust.setAttribute("shoesList", dtos);
//		reqeust.setAttribute("brand", dto.getBrand());
//		reqeust.setAttribute("Kbrand", dto.getKbrand());
//		reqeust.setAttribute("name", dto.getName());
//		reqeust.setAttribute("Kname", dto.getKname());
		
	}
	
}
