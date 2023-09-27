package kr.co.farmstory2.controller.market;

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


import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.service.ProductService;

@WebServlet("/market/view.do")
public class ViewController extends HttpServlet{

	private static final long serialVersionUID = -2120022050925682570L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = ProductService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String type = req.getParameter("type");
		String no = req.getParameter("pNo");
		
		ProductDTO market = service.selectProduct(no);
		
		req.setAttribute("no", no);
		req.setAttribute("market", market);

		
		logger.debug("pNo" + no);
		logger.debug("market" + market);


		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/market/view.jsp?type=" + type +"&pNo=" + no);
		dispatcher.forward(req, resp);
	}
}
	