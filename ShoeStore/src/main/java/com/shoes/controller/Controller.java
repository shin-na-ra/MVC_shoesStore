package com.shoes.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoes.command.SCommand;
import com.shoes.command.SLoginCommand;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	public void actionDo (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		
		HttpSession session = request.getSession();
		
		SCommand command = null;
		String viewPage = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		System.out.println(com);
		
		switch(com) {

			// 로그인화면 조회하기 (login.jsp로 이동)
			case "/list.do":
				viewPage = "login.jsp";
				break;
			
			// 로그인 성공 시 처리 (product.jsp로 이동)
			case "/login.do":
	            command = new SLoginCommand();
	            command.execute(request, response);
	            
	            // 로그인 성공 여부 확인
	            boolean loginSuccess = (boolean) request.getAttribute("loginSuccess");
	            
	            // 로그인 성공 시 product.jsp로 이동
	            // 실패 시 다시 login.jsp로 이동
	            viewPage = loginSuccess ? "product.jsp" : "login.jsp";
	            break;
				
				
			// 제품조회 페이지
				
			
			// 회원가입 폼 조회페이지
			
				
			// 회원가입 등록했을 때 
			
			default :
				break;
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);	
				
	}


}
