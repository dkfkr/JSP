package kr.co.farmstory2.controller.user;

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

import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.UserService;

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
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String nick = req.getParameter("nick");
		String email = req.getParameter("email");
		String hp = req.getParameter("hp");
		String zip = req.getParameter("zip");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		
		logger.debug("kind : " + kind);
		logger.debug("uid : " + uid);
		logger.debug("pass : " + pass);
		
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
			
		case "PASSWORD": 
			int result2 = service.passChange(uid, pass);
			
			// JSON 생성
			JsonObject json2 = new JsonObject();
			json2.addProperty("result2", result2);
						
			// JSON 출력
			PrintWriter writer2 = resp.getWriter();
			writer2.print(json2.toString());
						
			break;
		case "MODIFY": 
			
			UserDTO dto = new UserDTO();
			dto.setUid(uid);
			dto.setName(name);
			dto.setNick(nick);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setZip(zip);
			dto.setAddr1(addr1);
			dto.setAddr2(addr2);
			
			service.updateUser(dto);
			resp.sendRedirect("/Farmstory2/user/logout.do");
			break;
		
		}
		
	}
}
