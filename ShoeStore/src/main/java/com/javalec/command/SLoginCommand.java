package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.LoginDao;

public class SLoginCommand implements SCommand {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        LoginDao dao = new LoginDao();
        boolean loginAdminResult = dao.validateAdmin(id, pw);
        boolean loginCustomerResult = dao.validateUser(id, pw);

        response.setContentType("text/html; charset=UTF-8");

        if (loginAdminResult) {
		    request.setAttribute("loginResult", "admin");
		} else if (loginCustomerResult) {
		    request.setAttribute("loginResult", "success");
		} else {
		    request.setAttribute("loginResult", "fail");

		}
		// 로그인 결과를 확인하기 위해 출력문 추가
		System.out.println("loginResult: " + request.getAttribute("loginResult"));
    }  
}
