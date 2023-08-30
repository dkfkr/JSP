package kr.co.jboard2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.jboard2.dto.UserDTO;
import kr.co.jboard2.service.UserService;

@WebServlet("/user/myinfo.do")
public class MyInfoController extends HttpServlet {

	private static final long serialVersionUID = -535586664189707602L;
	private UserService service = UserService.getInstance();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user/myInfo.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String kind = req.getParameter("kind");
		String uid = req.getParameter("uid");
		
		logger.debug("kind : " + kind);
		logger.debug("uid : " + uid);
		
		switch(kind) {
		case "WITHDRAW": 
			int result = service.updateUserForWithdraw(uid);
			
			// JSON 생성
			JsonObject json = new JsonObject();
			json.addProperty("result", result);
			
			// JSON 출력
			PrintWriter writer = resp.getWriter();
			writer.print(json.toString());
			
			// ajax 요청은 리다이렉트 처리 불가
			
			break;
			
		case "PASSWORLD": 
			
			break;
		case "REGISTER": 
			
			break;
	
		}		
	}
}
