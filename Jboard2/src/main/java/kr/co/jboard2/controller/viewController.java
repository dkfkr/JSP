package kr.co.jboard2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.service.ArticleService;

@WebServlet("/view.do")
public class ViewController extends HttpServlet{

	private static final long serialVersionUID = -2120022050925682570L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
	
		ArticleDTO view = service.selectArticle(no);
		
		List<ArticleDTO> comment = service.selectComments(no);
		
		req.setAttribute("no", no);
		req.setAttribute("view", view);
		req.setAttribute("comment", comment);
		
		logger.debug("no" + no);
		logger.debug("view" + view);
		logger.debug("comment" + comment);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("view.jsp");
		dispatcher.forward(req, resp);
	}
	
}
