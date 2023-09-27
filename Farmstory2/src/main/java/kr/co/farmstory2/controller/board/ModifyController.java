package kr.co.farmstory2.controller.board;

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

import com.oreilly.servlet.MultipartRequest;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.FileDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;

@WebServlet("/board/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 14323432L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService aService = ArticleService.INSTANCE;
	private FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");	
		String no = req.getParameter("no");
		
		req.setAttribute("no", no);
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
	
		ArticleDTO view = aService.selectArticle(no);
		
		req.setAttribute("view", view);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/modify.jsp?group=" + group + "&cate=" + cate + "&no=" + no);
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
			String no = mr.getParameter("no");
			String regip = req.getRemoteAddr();
			
			// 파일삭제(DB)
			int result = fService.deleteFile(no);
			
			//파일삭제(DIrectory)
					if(result > 0) {
						
						String path = aService.getFilePath(req);
						
						File file = new File(path + "/" + "");
						
						if(file.exists()) {
							file.delete();
						}
							
			}
					
			logger.debug("cate : " + cate);
			logger.debug("group : " + group);
			logger.debug("title : " + title);
			logger.debug("content : " + content);
			logger.debug("writer : " + writer);
			logger.debug("oName : " + oName);
			logger.debug("regip : " + regip);
			logger.debug("no : " + no);
	
	
			// DTO 생성
			ArticleDTO adto = new ArticleDTO();
			adto.setNo(no);
			adto.setCate(cate);
			adto.setTitle(title);
			adto.setContent(content);
			adto.setFile(oName);
			adto.setWriter(writer);
			adto.setRegip(regip);
			
			//DB INSERT
			aService.updateArticle(adto);
			
			
			// 파일명 변경 및 파일테이블 INSERT
			if(oName != null) {
	
			String sName = aService.renameToFile(req, oName);
				
			// 파일테이블 INSERT	
			FileDTO fdto = new FileDTO();
			fdto.setAno(no);
			fdto.setOriName(oName);
			fdto.setNewName(sName);
		
			fService.insertFile(fdto);
			
			//리다이렉트
			resp.sendRedirect("/Farmstory2/board/view.do?group=" + group + "&cate=" + cate + "&no=" + no);
		  }	
	 }
 }
