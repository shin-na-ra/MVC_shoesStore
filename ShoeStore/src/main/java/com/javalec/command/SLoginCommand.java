package com.javalec.command;

//import java.io.PrintWriter;

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
        
        // PrintWriter 객체를 사용하여 JavaScript 코드를 응답에 직접 작성합니다.
//        try {
//            PrintWriter out = response.getWriter();
//
//            // 로그인 결과에 따라 알림을 표시하는 JavaScript 코드
//            out.println("<script>");
//            out.println("var loginResult = '" + request.getAttribute("loginResult") + "';");
//            out.println("if (loginResult === 'admin') { alert('관리자 로그인 성공!'); }");
//            out.println("else if (loginResult === 'success') { alert('사용자 로그인 성공!'); }");
//            out.println("else { alert('로그인 실패!'); }");
//            out.println("</script>");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        
		// 로그인 결과를 확인하기 위해 출력문 추가
		System.out.println("loginResult: " + request.getAttribute("loginResult"));
    }  
}
