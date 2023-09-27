package kr.co.farmstory2.controller.board;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.FileDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;

@WebServlet("/board/write.do")
public class WriteController extends HttpServlet {

	private static final long serialVersionUID = 992090960044622875L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService aService = ArticleService.INSTANCE;
	private FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");	
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/write.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MultipartRequest mr = aService.uploadFile(req);
		
		// 폼 데이터 수신
		String group = mr.getParameter("group");
		String cate = mr.getParameter("cate");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		String writer = mr.getParameter("writer");
		String oName = mr.getOriginalFileName("file");
		String regip = req.getRemoteAddr();
		
		logger.debug("1 : " + cate);
		logger.debug("2 : " + group);
		logger.debug("3 : " + title);
		logger.debug("3 : " + content);
		logger.debug("4 : " + writer);
		logger.debug("5 : " + oName);
		logger.debug("6 : " + regip);
		
		// DTO 생성
		ArticleDTO adto = new ArticleDTO();
		adto.setCate(cate);
		adto.setTitle(title);
		adto.setContent(content);
		adto.setFile(oName);
		adto.setWriter(writer);
		adto.setRegip(regip);
		
		//DB INSERT
		int no = aService.insertArticle(adto);
		
		// 파일명 변경 및 파일테이블 INSERT
		if(oName != null) {
					
			String sName = aService.renameToFile(req, oName);
			
			// 파일테이블 INSERT
					
			FileDTO fdto = new FileDTO();
			fdto.setAno(no);
			fdto.setOriName(oName);
			fdto.setNewName(sName);
					
			fService.insertFile(fdto);
					
		}
		
		//리다이렉트
		resp.sendRedirect("/Farmstory2/board/list.do?group=" + group + "&cate=" + cate);
	}
}
