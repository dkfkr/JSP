package kr.co.farmstory2.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.ArticleService;

@WebServlet("/board/list.do")
public class LIstController extends HttpServlet {
	
	private static final long serialVersionUID = 1343432L;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
		logger.debug("group : " + group);
		logger.debug("cate : " + cate);
		
		// 현재 세션 가져오기
		HttpSession session = req.getSession();
		UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
		
		// 페이지 관련 변수 선언
		String pg = req.getParameter("pg");
		String search = req.getParameter("search");
		
		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
		
		// 전체 게시물 갯수 
		int total = service.selectCountTotal(search);
		
		// 마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 페이지 시작번호
		int pageStartNum = service.getPageStartNum(total, currentPage);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		
		List<ArticleDTO> users = service.selectArticles(start, search);
		
		if(sessUser != null) {
			
			req.setAttribute("users", users);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("pageGroupStart", result[0]);
			req.setAttribute("pageGroupEnd", result[1]);
			req.setAttribute("pageStartNum", pageStartNum+1);
			req.setAttribute("group", group);
			req.setAttribute("cate", cate);
			

		    String jspPath = "/board/list.jsp";
		    RequestDispatcher dispatcher = req.getRequestDispatcher(jspPath);
		    dispatcher.forward(req, resp);	
		
		}else {
			resp.sendRedirect("/Farmstory2/user/login.do?success=101");
		}
	}
}
	


