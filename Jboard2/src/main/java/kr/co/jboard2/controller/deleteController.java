package kr.co.jboard2.controller;

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

import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.service.FileService;

@WebServlet("/delete.do")
public class deleteController extends HttpServlet {

	private static final long serialVersionUID = 992090960044622875L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ArticleService aService = ArticleService.INSTANCE;
	private FileService fService = FileService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		
		logger.debug("no : " + no);
		
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
		
		// 글 삭제
		aService.deleteArticle(no);
		
		resp.sendRedirect("/Jboard2/list.do");
		
	}
	

}
