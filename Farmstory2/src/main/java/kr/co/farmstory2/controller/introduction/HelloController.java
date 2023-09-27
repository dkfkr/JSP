package kr.co.farmstory2.controller.introduction;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory2.dto.UserDTO;

@WebServlet("/introduction/hello.do")
public class HelloController extends HttpServlet {

	private static final long serialVersionUID = 1232432L;
	
	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		HttpSession session = req.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser"); 
		
		if(sessUser != null) { 
			RequestDispatcher dispatcher = req.getRequestDispatcher("/introduction/hello.jsp");
			dispatcher.forward(req, resp);
		}
		
	}

}
