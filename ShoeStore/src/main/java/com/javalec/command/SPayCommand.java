package com.javalec.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.SListDao;
import com.javalec.dto.SListDto;
import com.mysql.cj.Session;

public class SPayCommand implements SCommand{

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		// 신발 리스트를 클릭하면 그 클릭한 코드를 세션을 통해 받아온다.
		HttpSession session = reqeust.getSession();
		
		String code = (String) session.getAttribute("code");
			
		SListDao dao = new SListDao();
		
		// 그 코드를 이용해 신발 사진들을 보낸다.
		List<SListDto> dtos =  dao.imageList(Integer.parseInt(code));
		
		// jsp 타이틀 설정
		String titleName = dao.titleName(Integer.parseInt(code));
		
		reqeust.setAttribute("name", titleName);
		reqeust.setAttribute("imageList", dtos);
	}
	
}
