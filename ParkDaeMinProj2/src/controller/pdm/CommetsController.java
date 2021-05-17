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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		if(req.getSession().getAttribute("user") == null) {
			req.setAttribute("SUCCFAIL",0);
			req.setAttribute("WHERE","COMM");
			req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
		}
		
		String no = req.getParameter("no");
		BBSDAO dao = new BBSDAO(getServletContext());
		String referer=req.getHeader("referer");
		int beginIndex=referer.lastIndexOf("/")+1;
		String prevPage = referer.substring(beginIndex);
		BBSDTO dto= dao.SelectOne(no,prevPage);
		
		dto.setContent(dto.getContent().replace("\r\n","<br/>"));
		req.setAttribute("dto", dto);
		
		String id = req.getSession().getAttribute("user").toString();
		String comments = req.getParameter("comments");
		
		
		
		CommentsDTO cdto = new CommentsDTO();
		cdto.setNo(no);
		cdto.setId(id);
		cdto.setComments(comments);
		int affected = dao.CommentsInsert(cdto);

		
		List list = dao.CommentsSelectList(no);	
		if(affected==1) {
			req.setAttribute("no",no);
			req.setAttribute("list",list);
			req.setAttribute("WHERE","COMM" );
			req.setAttribute("SUCCFAIL", "1");
			req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("no",no);
			req.setAttribute("WHERE","COMM" );
			req.setAttribute("SUCCFAIL", "-1");
			req.getRequestDispatcher("/Pdm/Message.jsp").forward(req, resp);
		}
		dao.close();
	}

}
