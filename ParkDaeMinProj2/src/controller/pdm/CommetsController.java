package controller.pdm;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pdm.BBSDAO;
import model.pdm.BBSDTO;
import model.pdm.CommentsDTO;

public class CommetsController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		if(req.getSession().getAttribute("user") == null) {
			req.setAttribute("SUCCFAIL",0);
			//5-2]컨트롤러 구분용-입력:INS,수정:EDT,삭제:DEL
			req.setAttribute("WHERE","COMM");
			req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
		}
		String no = req.getParameter("no");
		BBSDAO dao = new BBSDAO(getServletContext());
		String referer=req.getHeader("referer");
		int beginIndex=referer.lastIndexOf("/")+1;
		String prevPage = referer.substring(beginIndex);
		//조회수 업데이트 및 상세보기
		BBSDTO dto= dao.SelectOne(no,prevPage);
		
		
		dto.setContent(dto.getContent().replace("\r\n","<br/>"));
		req.setAttribute("dto", dto);
		
		String id = req.getSession().getAttribute("user").toString();
		String comments = req.getParameter("comments");
		
		CommentsDTO cdto = new CommentsDTO();
		int affected = dao.CommentsInsert(cdto);
		List list = dao.CommentsSelectList(no);	
		
		req.setAttribute("list",list);
		dao.close();
		req.getRequestDispatcher("/Pdm/View.jsp").forward(req, resp);
	}

}
