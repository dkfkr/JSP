package kr.co.farmstory2.controller.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;
import kr.co.farmstory2.service.OrderService;

@WebServlet("/Farmstory2/admin/DeleteOrders.do")
public class DeleteOrdersController extends HttpServlet {

	private static final long serialVersionUID = 992090960044622875L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private OrderService oService = OrderService.INSTANCE;
	private FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
						
		String path = oService.getFilePath(req);
		
		File file = new File(path + "/" + "");
		
		if(file.exists()) {
			file.delete();
		}

		
		resp.sendRedirect("/Farmstory2/admin/list.do");
		
	}
	

}
