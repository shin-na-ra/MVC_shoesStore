package com.javalec.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import com.javalec.dao.LoginDao;

public class SLoginCommand implements SCommand {
	

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        LoginDao dao = new LoginDao();
        boolean loginAdminResult = dao.validateAdmin(id, pw);
        boolean loginCustomerResult = dao.validateUser(id, pw);

        // 로그인 성공 여부를 request에 저장
        if (loginAdminResult) {
            response.setContentType("text/html; charset=UTF-8");
            request.setAttribute("loginResult", "admin");
        } else if (loginCustomerResult) {
            request.setAttribute("loginResult", "success");
        } else {
            request.setAttribute("loginResult", "fail");
        }

        // 로그인 결과를 확인하기 위해 출력문 추가
        System.out.println("loginResult: " + request.getAttribute("loginResult"));

//        // JavaScript 코드를 출력하여 알람창 띄우기
//        PrintWriter out;
//        try {
//            out = response.getWriter();
//            out.println("<script>");
//            out.println("console.log(\"JavaScript 코드가 실행 중입니다\");");
//            out.println("alert('" + getAlertMessage(request.getAttribute("loginResult")) + "');");
//            out.println("location.href='/원하는_리다이렉트_경로';"); // 알람 후 특정 페이지로 리다이렉트하는 부분
//            out.println("</script>");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }
//
//    // 메시지를 반환하는 메서드
//    private String getAlertMessage(Object loginResult) {
//        String message = "";
//        if ("admin".equals(loginResult)) {
//            message = "Admin 로그인 성공!";
//        } else if ("success".equals(loginResult)) {
//            message = "사용자 로그인 성공!";
//        } else if ("fail".equals(loginResult)) {
//            message = "로그인 실패. 아이디 또는 비밀번호를 확인하세요.";
//        }
//        return message;
//    }
}
