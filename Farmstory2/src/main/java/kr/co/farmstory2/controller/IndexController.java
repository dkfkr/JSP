package kr.co.farmstory2.controller;

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

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.ProductService;

@WebServlet("/index.do")
public class IndexController extends HttpServlet {

	private static final long serialVersionUID = 143434234L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		List<ArticleDTO> latests1 = service.selectLatests("grow", 5);
		List<ArticleDTO> latests2 = service.selectLatests("school", 5);
		List<ArticleDTO> latests3 = service.selectLatests("story", 5);		
		List<ArticleDTO> latests4 = service.selectLatests("notice", 3);
		List<ArticleDTO> latests5 = service.selectLatests("qna", 3);
		List<ArticleDTO> latests6 = service.selectLatests("faq", 3);
				
		req.setAttribute("latests1",latests1);
		req.setAttribute("latests2",latests2);
		req.setAttribute("latests3",latests3);
		req.setAttribute("latests4",latests4);
		req.setAttribute("latests5",latests5);
		req.setAttribute("latests6",latests6);
		
		logger.debug("latests1 : " + latests1);
		logger.debug("latests2 : " + latests2);
		logger.debug("latests3 : " + latests3);
		logger.debug("latests4 : " + latests4);
		logger.debug("latests5 : " + latests5);
		logger.debug("latests6 : " + latests6);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);
	}

}
	
	

