package com.javalec.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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

        // JSTL을 사용하여 메시지를 표시할 JSP 페이지로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("alert.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
