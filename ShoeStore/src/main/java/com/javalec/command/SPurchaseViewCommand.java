package com.javalec.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.SListDao;
import com.javalec.dto.SListDto;
import com.mysql.cj.Session;

public class SPurchaseViewCommand implements SCommand{

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		// 신발 리스트를 클릭하면 그 클릭한 코드를 세션을 통해 받아온다.
		HttpSession session = reqeust.getSession();
		
		String code = (String) session.getAttribute("code");
			
		SListDao dao = new SListDao();
		
		// 선택한 제품 코드를 이용해 신발 사진들을 보낸다.
		List<SListDto> dtosImage =  dao.imageList(Integer.parseInt(code));
		
		// 선택한 제품 코드를 이용해 제품 정보들을 찾는다
		List<SListDto> dtosInfo = dao.shoesInfo(Integer.parseInt(code));
		
		// 선택한 제품 코드를 이용해 제품의 사이즈를 찾는다
		List<SListDto> dtosSize = dao.shoesSize(Integer.parseInt(code));
		
		// jsp 타이틀 설정
		String titleName = dao.titleName(Integer.parseInt(code));
		
		
		// 제품별로 사이즈가 다르다. 그렇기에 최대 사이즈, 최소 사이즈가 다름 그것을 처리한다.
		int max = 0;
		int min = 500;
		for (SListDto dto : dtosSize) {
			if (max<dto.getSize()) max = dto.getSize();
			if (min > dto.getSize()) min = dto.getSize();
		}
		
		reqeust.setAttribute("name", titleName);
		reqeust.setAttribute("imageList", dtosImage);
		reqeust.setAttribute("shoesInfo", dtosInfo);
		reqeust.setAttribute("shoesSize", dtosSize);
		reqeust.setAttribute("maxSize", max);
		reqeust.setAttribute("minSize", min);
	}
	
}