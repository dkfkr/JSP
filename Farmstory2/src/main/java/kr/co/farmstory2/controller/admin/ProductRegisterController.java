package kr.co.farmstory2.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;

import kr.co.farmstory2.dto.FileDTO;
import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.FileService;
import kr.co.farmstory2.service.ProductService;

@WebServlet("/admin/productRegister.do")
public class ProductRegisterController extends HttpServlet {

	private static final long serialVersionUID = 154356554754L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService pService = ProductService.INSTANCE;
	private FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");

		req.setAttribute("sessUser", sessUser);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/productRegister.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		MultipartRequest mr = pService.uploadFile(req);
		
		String type     = mr.getParameter("type");
		String pName    = mr.getParameter("productName");
		String price    = mr.getParameter("price");
		String delivery = mr.getParameter("delivery");
		String stock    = mr.getParameter("stock");
		String sold     = mr.getParameter("sold");
		String thumb1   = mr.getOriginalFileName("thumb1");
		String thumb2   = mr.getOriginalFileName("thumb2");
		String thumb3   = mr.getOriginalFileName("thumb3");
		String seller   = mr.getParameter("seller");
		String etc      = mr.getParameter("etc");
		String path     = pService.getFilePath(req);
		
		
		logger.debug("type : " + type);
		logger.debug("pName : " + pName);
		logger.debug("price : " + price);
		logger.debug("delivery : " + delivery);
		logger.debug("stock : " + stock);
		logger.debug("sold : " + sold);
		logger.debug("thumb1 : " + thumb1);
		logger.debug("thumb2 : " + thumb2);
		logger.debug("thumb3 : " + thumb3);
		logger.debug("seller : " + seller);
		logger.debug("path : " + path);
		logger.debug("etc : " + etc);
		
		ProductDTO dto = new ProductDTO(path);
		dto.setType(type);
		dto.setpName(pName);
		dto.setPrice(price);
		dto.setDelivery(delivery);
		dto.setStock(stock);
		dto.setThumb1ForRename(thumb1);
		dto.setThumb2ForRename(thumb2);
		dto.setThumb3ForRename(thumb3);
		dto.setSeller(seller);
		dto.setEtc(etc);
		
		pService.insertProduct(dto);
		
		resp.sendRedirect("/Farmstory2/admin/productList.do");
	}
}
