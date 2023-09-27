package kr.co.farmstory2.controller.admin;

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

import kr.co.farmstory2.dto.OrderDTO;
import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.OrderService;
import kr.co.farmstory2.service.ProductService;
import kr.co.farmstory2.service.UserService;

@WebServlet("/admin/index.do")
public class IndexController extends HttpServlet {

	private static final long serialVersionUID = 143434234L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private OrderService oService = OrderService.INSTANCE;
	private ProductService pService = ProductService.INSTANCE;
	private UserService uService = UserService.getInstance();

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<ProductDTO> latest1 = pService.selectProductLatest(3);
		List<OrderDTO> latest2 = oService.selectOrderLatest(3);
		List<UserDTO> latest3 = uService.selectUserLatest(3);
		
		req.setAttribute("latest1", latest1);
		req.setAttribute("latest2", latest2);
		req.setAttribute("latest3", latest3);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/index.jsp");
		dispatcher.forward(req, resp);
	}
}

