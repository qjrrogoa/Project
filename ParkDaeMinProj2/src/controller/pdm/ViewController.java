package controller.pdm;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pdm.BBSDAO;
import model.pdm.BBSDTO;
import model.pdm.CommentsDTO;

public class ViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("user") != null) {
		String id = req.getSession().getAttribute("user").toString();
		}
		String no = req.getParameter("no");
		BBSDAO dao = new BBSDAO(getServletContext());
		String referer=req.getHeader("referer");
		int beginIndex=referer.lastIndexOf("/")+1;
		String prevPage = referer.substring(beginIndex);
		//조회수 업데이트 및 상세보기
		BBSDTO dto= dao.SelectOne(no,prevPage);
		
		
		CommentsDTO cdto = new CommentsDTO();
		List list = dao.CommentsSelectList(no);	
		req.setAttribute("list",list);
		dao.close();
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/Pdm/View.jsp").forward(req, resp);
	}
}
