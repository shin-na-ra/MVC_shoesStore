package com.javalec.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.dao.LoginDao;

public class SLoginCommand implements SCommand {

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		
		String id = reqeust.getParameter("id");
		String pw = reqeust.getParameter("pw");
		
		LoginDao dao = new LoginDao();
		boolean loginSuccess = dao.validateUser(id, pw);
		
		System.out.println(loginSuccess + "성공 데이터");
		
        // 로그인 성공 여부를 request에 저장
        reqeust.setAttribute("loginSuccess", loginSuccess);
		
        // 로그인 성공 시 알람창을 표시
		if (loginSuccess) {
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인에 성공했습니다.');</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // 로그인 실패 시 알람창을 표시
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인에 실패했습니다.');</script>");
                out.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

	}

}
