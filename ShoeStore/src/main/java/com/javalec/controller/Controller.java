package com.javalec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.command.SCommand;
import com.javalec.command.SListCommand;
import com.javalec.command.SPurchaseCommand;
import com.javalec.command.SPurchaseViewCommand;

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
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		SCommand command = null;
		String viewPage = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		switch(com) {
			//로그인페이지	
			case "/list.do":
				viewPage = "login.jsp";
				break;
				
			case "/shoesList.do" :
				command = new SListCommand();
				command.execute(request, response);
				session.setAttribute("id", "hwicoding");
				
				viewPage = "product.jsp";
				break;
				
			case "/purchase_view.do" :
				// session을 통해 클릭한 신발의 code key를 보내기
				String code = request.getParameter("code");
				session.setAttribute("code", code);
				
				command = new SPurchaseViewCommand();
				command.execute(request, response);
				
				viewPage = "purchase.jsp";
				
				break;
				
			case "/purchase.do" :
				command = new SPurchaseCommand();
				command.execute(request, response);
				
				viewPage = "shoesList.do";
				break;
				
			case "/search.do" :
			    String input = request.getParameter("searchInput");
			    System.out.println(input);
				
				command = new SListCommand();
				command.execute(request, response);
				
				viewPage = "shoesList.do";
				break;
				
			default :
				break;
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);	
				
	}


}
