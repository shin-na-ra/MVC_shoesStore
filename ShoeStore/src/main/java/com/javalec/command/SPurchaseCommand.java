package com.javalec.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.dao.SListDao;
import com.javalec.dto.SListDto;

public class SPurchaseCommand implements SCommand {

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		
		HttpSession session = reqeust.getSession();
		
		SListDao dao = new SListDao();
		String userid = (String) session.getAttribute("id");
		
		System.out.println(userid);
		String code = (String) session.getAttribute("code");
		int hiddenSize = Integer.parseInt(reqeust.getParameter("hiddenSize"));
		
		dao.okPurchase(userid, Integer.parseInt(code), hiddenSize);
		dao.updateQty(userid, Integer.parseInt(code), hiddenSize);
		
	}

}